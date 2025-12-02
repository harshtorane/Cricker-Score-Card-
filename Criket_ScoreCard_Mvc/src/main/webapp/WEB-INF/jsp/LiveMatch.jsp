<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Live Match</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body { background:#f5f7ff; }

.page-wrapper {
    margin-left:260px;
    margin-top:90px;
    padding:20px;
}

/* HEADER */
.score-header {
    background:#dbe8ff;
    border-radius:12px;
    padding:20px;
    text-align:center;
    margin-bottom:20px;
    border:1px solid #b5ccff;
}
.teams { font-size:26px; font-weight:800; }
.score-box { font-size:34px; font-weight:900; }
.overs-box { font-size:18px; font-weight:600; }

/* PLAYER PANEL */
.player-panel {
    background:white;
    border:1px solid #cbd5ff;
    border-radius:12px;
    padding:15px;
    margin-bottom:20px;
}
.panel-title { font-size:20px; font-weight:700; color:#3f51b5; }
.player-name { font-size:17px; font-weight:600; }

/* BALL INPUT */
.ball-input {
    background:white;
    border:1px solid #cbd5ff;
    padding:15px;
    border-radius:12px;
    margin-bottom:20px;
    text-align:center;
}
.btn-ball {
    width:55px;
    height:55px;
    border-radius:50%;
    font-size:18px;
    margin:5px;
    border:none;
    color:white;
}

/* RUN COLORS */
.run0 { background:#4E4E4E }
.run1 { background:#3B0FFF }
.run2 { background:#008CFF }
.run3 { background:#00C896 }
.run4 { background:#FFD700; color:black; }
.run6 { background:#FF0099 }
.wicket { background:#FF2E2E }

/* TIMELINE */
.timeline-box {
    background:white;
    border:1px solid #cbd5ff;
    border-radius:12px;
    padding:15px;
}
.timeline span {
    display:inline-flex;
    width:38px;
    height:38px;
    border-radius:50%;
    justify-content:center;
    align-items:center;
    background:#3B0FFF;
    color:white;
    font-weight:700;
    margin:4px;
}
</style>
</head>

<body>

<div class="page-wrapper">

    <!-- HEADER -->
    <div class="score-header">
        <div class="teams">
            ${schedule.teamA} <span style="color:#ff0055;">vs</span> ${schedule.teamB}
        </div>
        <div class="score-box" id="scoreBox">${live.runs}/${live.wickets}</div>
        <div class="overs-box">
            Ov:
            <span id="overBox">
                <c:out value="${live.balls/6}" />.<c:out value="${live.balls % 6}" />
            </span>
            / ${matchStart.totalOvers}
        </div>
    </div>

    <!-- HIDDEN FIELDS (Important) -->
    <input type="hidden" id="liveId" value="${live.id}">
    <input type="hidden" id="scheduleId" value="${schedule.id}">
    <input type="hidden" id="strikerId" value="${striker != null ? striker.id : 0}">
    <input type="hidden" id="bowlerId" value="${bowler != null ? bowler.id : 0}">

    <!-- CURRENT PLAYERS -->
    <div class="player-panel">
        <div class="panel-title">Current Players</div>
        <p class="player-name">🟢 <b>Striker:</b> ${striker.playerName} (${striker.role})</p>
        <p class="player-name">🔵 <b>Non-Striker:</b> ${nonStriker.playerName} (${nonStriker.role})</p>
        <p class="player-name">🎯 <b>Bowler:</b> ${bowler.playerName} (${bowler.role})</p>
    </div>

    <!-- BALL INPUT -->
    <div class="ball-input">

        <button class="btn-ball run0" onclick="sendBall(0,'run')">0</button>
        <button class="btn-ball run1" onclick="sendBall(1,'run')">1</button>
        <button class="btn-ball run2" onclick="sendBall(2,'run')">2</button>
        <button class="btn-ball run3" onclick="sendBall(3,'run')">3</button>
        <button class="btn-ball run4" onclick="sendBall(4,'run')">4</button>
        <button class="btn-ball run6" onclick="sendBall(6,'run')">6</button>
        <button class="btn-ball wicket" onclick="sendBall(0,'wicket')">W</button>

        <div class="mt-3">
            <button class="btn-ball run1" onclick="sendBall(1,'wide')">WD</button>
            <button class="btn-ball run1" onclick="sendBall(1,'noball')">NB</button>
            <button class="btn-ball run1" onclick="sendBall(1,'bye')">BYE</button>
            <button class="btn-ball run1" onclick="sendBall(1,'lb')">LB</button>
        </div>
    </div>

    <!-- TIMELINE -->
    <div class="timeline-box">
        <div class="panel-title">Timeline</div>
        <div id="timeline"></div>
    </div>

</div>

<script>

// --------------- SEND BALL ---------------
function sendBall(runs, type) {

    let matchLiveId = document.getElementById("liveId").value;
    let strikerId = document.getElementById("strikerId").value;
    let bowlerId  = document.getElementById("bowlerId").value;

    let dto = {
        runs: runs,
        type: type,
        batsmanId: parseInt(strikerId),
        bowlerId: parseInt(bowlerId)
    };

    fetch(`http://localhost:8080/api/match/${matchLiveId}/ball`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(dto)
    })
    .then(r => r.json())
    .then(updateUI)
    .catch(e => console.log("Ball Error:", e));
}

// --------------- UPDATE UI ---------------
function updateUI(data) {

    let over = Math.floor(data.balls / 6);
    let ball = data.balls % 6;

    document.getElementById("scoreBox").innerText = `${data.runs}/${data.wickets}`;
    document.getElementById("overBox").innerText = `${over}.${ball}`;

    let type = data.lastEventType;
    let runs = data.lastRuns;

    if (type) {
        let show =
            type === "wicket" ? "W" :
            type === "wide" ? "WD" :
            type === "noball" ? "NB" :
            type === "bye" ? "B" + runs :
            type === "lb" ? "LB" + runs :
            runs;

        document.getElementById("timeline").innerHTML += `<span>${show}</span>`;
    }
}

// --------------- AUTO REFRESH ---------------
setInterval(() => {

    let scheduleId = document.getElementById("scheduleId").value;

    fetch(`http://localhost:8080/api/match/by-schedule/${scheduleId}`)
        .then(r => r.json())
        .then(updateUI)
        .catch(e => {});
}, 1500);

</script>

</body>
</html>
