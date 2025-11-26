<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Live Match</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.page-wrapper {
    margin-left: 260px !important;
    margin-top: 90px;
    padding: 20px;
}

.card {
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.15);
}

.section-title {
    font-weight: 600;
    font-size: 20px;
}

.score-box {
    font-size: 35px;
    font-weight: bold;
    color: #0d6efd;
}
</style>

</head>

<body class="bg-light">

<div class="page-wrapper">

    <h3 class="text-center mb-4">🏏 Live Match</h3>

    <!-- MATCH HEADER -->
    <div class="card p-4 mb-4">
        <h5 class="section-title">Match Info</h5>
        <p><strong>Match:</strong> ${schedule.matchTitle}</p>
        <p><strong>Teams:</strong> ${schedule.teamA} vs ${schedule.teamB}</p>
        <p><strong>Date:</strong> ${schedule.matchDate}</p>
        <p><strong>Time:</strong> ${schedule.matchTime}</p>
        <p><strong>Toss Winner:</strong> ${match.tossWinner}</p>
        <p><strong>Decision:</strong> ${match.chooseTo}</p>
    </div>

    <!-- SCOREBOARD BOX -->
    <div class="card p-4 mb-4 text-center">
        <h5 class="section-title mb-3">Scoreboard</h5>

        <div class="score-box">0 / 0</div>
        <p>Overs: 0.0</p>
    </div>


    <!-- BALL UPDATE SECTION -->
    <div class="card p-4">
        <h5 class="section-title mb-3">Ball Update</h5>

        <!-- STRIKER -->
        <label>Striker (Batsman on Strike)</label>
        <select class="form-select mb-3">
            <c:forEach var="p" items="${teamAPlayers}">
                <option value="${p.id}">${p.playerName} (${p.role})</option>
            </c:forEach>
        </select>

        <!-- NON STRIKER -->
        <label>Non-Striker</label>
        <select class="form-select mb-3">
            <c:forEach var="p" items="${teamAPlayers}">
                <option value="${p.id}">${p.playerName} (${p.role})</option>
            </c:forEach>
        </select>

        <!-- BOWLER -->
        <label>Bowler</label>
        <select class="form-select mb-3">
            <c:forEach var="p" items="${teamBPlayers}">
                <option value="${p.id}">${p.playerName} (${p.role})</option>
            </c:forEach>
        </select>

        <!-- RUN SELECT -->
        <label>Runs</label>
        <select class="form-select mb-3">
            <option>0</option>
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>Wide</option>
            <option>No Ball</option>
            <option>Wicket</option>
        </select>

        <!-- UPDATE BUTTON -->
        <button class="btn btn-success w-100 py-2 mt-3">Update Ball</button>
    </div>

</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
