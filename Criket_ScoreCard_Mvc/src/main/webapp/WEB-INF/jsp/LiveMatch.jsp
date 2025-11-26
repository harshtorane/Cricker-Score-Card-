<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Live Match (IPL Style)</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* ================== IPL THEME BODY ================== */
body {
    background: #0D0D0D;
    color: white;
}

.page-wrapper {
    margin-left: 260px;
    margin-top: 90px;
    padding: 20px;
}

/* ================== SCORE HEADER ================== */
.ipl-score-header {
    background: linear-gradient(90deg, #3B0FFF, #FF00D4);
    padding: 20px;
    border-radius: 15px;
    text-align: center;
    margin-bottom: 20px;
}

.ipl-team-row {
    font-size: 28px;
    font-weight: 800;
}

.ipl-vs {
    color: gold;
    margin: 0 10px;
}

.ipl-score-box span {
    font-size: 38px;
    font-weight: 900;
}

.ipl-overs {
    margin-left: 10px;
    font-size: 20px;
    font-weight: 600;
}

/* ================== PLAYER CARDS ================== */
.ipl-player-card {
    background: #1A1A1A;
    border: 2px solid #3B0FFF;
    padding: 15px;
    border-radius: 15px;
    margin-bottom: 15px;
}

.ipl-player-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 8px;
    color: #FF00D4;
}

.bowler-title {
    color: #00C8FF;
}

.ipl-select {
    width: 100%;
    padding: 10px;
    background: #101010;
    color: white;
    border: 2px solid #3B0FFF;
    border-radius: 10px;
}

/* ================== BALL INPUT ================== */
.ipl-ball-input {
    background: #1A1A1A;
    padding: 15px;
    border-radius: 15px;
    border: 2px solid #3B0FFF;
    margin-top: 20px;
    text-align: center;
}

.ipl-run-buttons .ipl-btn {
    width: 65px;
    height: 65px;
    border-radius: 50%;
    font-size: 22px;
    font-weight: bold;
    margin: 5px;
    border: none;
    color: white;
}

.run0 { background: #4E4E4E; }
.run1 { background: #3B0FFF; }
.run2 { background: #008CFF; }
.run3 { background: #00C896; }
.run4 { background: #FFD700; color: black; }
.run6 { background: #FF0099; }
.wicket { background: #FF2E2E; }

/* ================== TIMELINE ================== */
.ipl-timeline-box {
    background: #1A1A1A;
    padding: 15px;
    border-radius: 15px;
    border: 2px solid #3B0FFF;
    margin-top: 20px;
}

.ipl-timeline span {
    display: inline-flex;
    width: 38px;
    height: 38px;
    border-radius: 50%;
    font-weight: bold;
    justify-content: center;
    align-items: center;
    margin: 4px;
    background: #3B0FFF;
    color: white;
}

</style>
</head>

<body>

<div class="page-wrapper">

<!-- ================= SCORE HEADER ================= -->
<div class="ipl-score-header">
    <div class="ipl-team-row">
        <span class="ipl-team-name">${schedule.teamA}</span>
        <span class="ipl-vs">vs</span>
        <span class="ipl-team-name">${schedule.teamB}</span>
    </div>

    <div class="ipl-score-box">
        <span id="scoreBox">0/0</span>
        <span class="ipl-overs">Ov: <span id="overBox">0.0</span>/<span id="maxOvers">0</span></span>
    </div>
</div>

<!-- =============== BATSMAN + BOWLER PANEL =============== -->
<div class="row mt-4">

    <!-- STRIKER + NON STRIKER -->
    <div class="col-md-4">

        <div class="ipl-player-card">
            <div class="ipl-player-title">● Striker</div>
            <select id="striker" class="ipl-select" onchange="updatePlayerDropdowns()">
                <c:forEach var="p" items="${teamAPlayers}">
                    <option value="${p.id}">${p.playerName} - ${p.role}</option>
                </c:forEach>
            </select>
        </div>

        <div class="ipl-player-card">
            <div class="ipl-player-title">○ Non-Striker</div>
            <select id="nonstriker" class="ipl-select" onchange="updatePlayerDropdowns()">
                <c:forEach var="p" items="${teamAPlayers}">
                    <option value="${p.id}">${p.playerName} - ${p.role}</option>
                </c:forEach>
            </select>
        </div>

    </div>

    <!-- BOWLER -->
    <div class="col-md-4">
        <div class="ipl-player-card">
            <div class="ipl-player-title bowler-title">🎯 Bowler</div>
            <select id="bowler" class="ipl-select">
                <c:forEach var="p" items="${teamBPlayers}">
                    <option value="${p.id}">${p.playerName} - ${p.role}</option>
                </c:forEach>
            </select>
        </div>
    </div>

</div>

<!-- ================= BALL INPUT PANEL ================= -->
<div class="ipl-ball-input">
    <h5 class="ipl-section-title">BALL INPUT</h5>

    <div class="ipl-run-buttons">
        <button class="ipl-btn run0" onclick="sendBall(0)">0</button>
        <button class="ipl-btn run1" onclick="sendBall(1)">1</button>
        <button class="ipl-btn run2" onclick="sendBall(2)">2</button>
        <button class="ipl-btn run3" onclick="sendBall(3)">3</button>
        <button class="ipl-btn run4" onclick="sendBall(4)">4</button>
        <button class="ipl-btn run6" onclick="sendBall(6)">6</button>
        <button class="ipl-btn wicket" onclick="sendBall(-1)">W</button>
    </div>
</div>

<!-- ================= BALL TIMELINE ================= -->
<div class="ipl-timeline-box">
    <h5 class="ipl-section-title">TIMELINE</h5>
    <div id="timeline" class="ipl-timeline"></div>
</div>

</div>

<!-- ================= JAVASCRIPT ================= -->
<script>

// LOAD MAX OVERS
fetch("/api/startmatch/${schedule.id}")
    .then(r => r.json())
    .then(data => {
        document.getElementById("maxOvers").innerHTML = data.totalOvers;
    });

// STRIKER / NON-STRIKER FILTER
function updatePlayerDropdowns() {
    let s = document.getElementById("striker").value;
    let ns = document.getElementById("nonstriker").value;

    document.querySelectorAll("#striker option").forEach(o => o.style.display = "block");
    document.querySelectorAll("#nonstriker option").forEach(o => o.style.display = "block");

    if (s) document.querySelector(`#nonstriker option[value='${s}']`).style.display = "none";
    if (ns) document.querySelector(`#striker option[value='${ns}']`).style.display = "none";
}

// SEND BALL EVENT
function sendBall(run) {

    let dto = {
        runs: run,
        type: (run == -1 ? "wicket" : "run"),
        batsmanId: document.getElementById("striker").value,
        bowlerId: document.getElementById("bowler").value
    };

    fetch("/api/match/${match.id}/ball", {
        method:"POST",
        headers:{ "Content-Type":"application/json" },
        body: JSON.stringify(dto)
    })
    .then(r => r.json())
    .then(data => {
        document.getElementById("scoreBox").innerHTML = data.runs + "/" + data.wickets;
        document.getElementById("overBox").innerHTML = data.overs;

        document.getElementById("timeline").innerHTML 
            += `<span>${run == -1 ? "W" : run}</span>`;
    });
}

// AUTO REFRESH SCORE
function refreshScore() {
    fetch("/api/match/by-schedule/${schedule.id}")
        .then(r => r.json())
        .then(data => {
            document.getElementById("scoreBox").innerHTML = data.runs + "/" + data.wickets;
            document.getElementById("overBox").innerHTML = data.overs;
        });
}

setInterval(refreshScore, 2000);
updatePlayerDropdowns();

</script>

<%@ include file="Footer.jsp" %>

</body>
</html>
