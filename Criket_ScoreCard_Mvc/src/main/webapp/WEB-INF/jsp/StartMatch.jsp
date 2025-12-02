<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start Match</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.page-wrapper {
    margin-left: 260px !important;
    margin-top: 90px;
    padding: 20px;
}
.card { border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.15); }
.section-title { font-weight: 600; font-size: 18px; }
.match-header {
    background: #dbe8ff;
    border-radius: 10px;
    padding: 15px;
    margin-bottom: 20px;
}
</style>
</head>

<body class="bg-light">

<div class="page-wrapper">

    <h3 class="text-center mb-4">Start Match</h3>

    <!-- MATCH INFO -->
    <div class="match-header">
        <strong>Match:</strong> ${schedule.matchTitle}<br>
        <strong>Teams:</strong> ${schedule.teamA} vs ${schedule.teamB}<br>
        <strong>Date:</strong> ${schedule.matchDate}
        <strong class="ms-4">Time:</strong> ${schedule.matchTime}
    </div>

    <!-- MAIN FORM -->
    <div class="card p-4">
        <form action="/match/start/save" method="post">

            <input type="hidden" name="scheduleId" value="${scheduleId}">
            <input type="hidden" name="tournamentId" value="${tournamentId}">

            <!-- TOSS -->
            <div class="card p-3 mb-4">
                <h5 class="section-title">Toss Details</h5>

                <div class="mb-3">
                    <label class="form-label">Toss Winner</label>
                    <select class="form-select" name="tossWinner" required>
                        <option value="">Select Team</option>
                        <option value="${schedule.teamA}">${schedule.teamA}</option>
                        <option value="${schedule.teamB}">${schedule.teamB}</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Decision</label>
                    <select class="form-select" name="chooseTo" required>
                        <option value="">Select</option>
                        <option value="Batting">Batting</option>
                        <option value="Bowling">Bowling</option>
                    </select>
                </div>

                <!-- OVERS -->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Total Overs</label>
                        <input type="number" class="form-control" name="totalOvers" required min="1">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label>Overs per Bowler</label>
                        <input type="number" class="form-control" name="oversPerBowler" required min="1">
                    </div>
                </div>
            </div>

            <!-- NEXT BUTTON -->
            <button class="btn btn-primary btn-lg w-100">Next → Select Players</button>

        </form>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
