<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Players</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body { background:white !important; color:black; }

.page-wrapper {
    margin-left:260px;
    margin-top:90px;
    padding:20px;
}

.card {
    border-radius:12px;
    background:#ffffff;
    color:black;
    border:2px solid #3B0FFF;
}

.section-title {
    font-size:20px;
    font-weight:700;
    color:#3B0FFF;
}

.label-title {
    font-size:18px;
    font-weight:600;
    color:#444;
}

.form-select {
    background:white;
    color:black;
    border:2px solid #3B0FFF;
}
</style>
</head>

<body>

<div class="page-wrapper">

    <h3 class="text-center mb-4">Select Striker | Non-Striker | Bowler</h3>

    <!-- MATCH INFO + TOSS DETAILS -->
    <div class="card p-3 mb-4">
        <h5 class="section-title">Match Details</h5>

        <p><b>Match:</b> ${schedule.matchTitle}</p>
        <p><b>Teams:</b> ${schedule.teamA} vs ${schedule.teamB}</p>

        <h5 class="section-title mt-3">Toss Details</h5>

        <p><b>Toss Winner:</b> ${matchStart.tossWinner}</p>
        <p><b>Decision:</b> ${matchStart.chooseTo}</p>

        <h5 class="section-title mt-3">Overs</h5>

        <p><b>Total Overs:</b> ${matchStart.totalOvers}</p>
        <p><b>Overs per Bowler:</b> ${matchStart.oversPerBowler}</p>
    </div>

    <!-- PLAYER SELECTION -->
    <div class="card p-4">

        <form action="/match/selectplayers/save" method="post">

            <input type="hidden" name="scheduleId" value="${scheduleId}">

            <!-- STRIKER -->
            <div class="mb-4">
                <label class="label-title">Striker (Team A)</label>
                <select id="striker" name="strikerId" class="form-select" onchange="filterPlayers()" required>
                    <option value="">Select</option>
                    <c:forEach var="p" items="${teamAPlayers}">
                        <option value="${p.id}">${p.playerName} - ${p.role}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- NON-STRIKER -->
            <div class="mb-4">
                <label class="label-title">Non-Striker (Team A)</label>
                <select id="nonStriker" name="nonStrikerId" class="form-select" onchange="filterPlayers()" required>
                    <option value="">Select</option>
                    <c:forEach var="p" items="${teamAPlayers}">
                        <option value="${p.id}">${p.playerName} - ${p.role}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- BOWLER -->
            <div class="mb-4">
                <label class="label-title">Bowler (Team B)</label>
                <select id="bowler" name="bowlerId" class="form-select" required>
                    <option value="">Select</option>
                    <c:forEach var="p" items="${teamBPlayers}">
                        <option value="${p.id}">${p.playerName} - ${p.role}</option>
                    </c:forEach>
                </select>
            </div>

            <button class="btn btn-success btn-lg w-100">🚀 Start Live Scoring</button>
        </form>
    </div>
</div>

<!-- FILTER SCRIPT -->
<script>
function filterPlayers() {
    let s = document.getElementById("striker").value;
    let ns = document.getElementById("nonStriker").value;

    document.querySelectorAll("#striker option").forEach(o => o.hidden = false);
    document.querySelectorAll("#nonStriker option").forEach(o => o.hidden = false);

    if (s) document.querySelector(`#nonStriker option[value='${s}']`).hidden = true;
    if (ns) document.querySelector(`#striker option[value='${ns}']`).hidden = true;
}
</script>

</body>
</html>
