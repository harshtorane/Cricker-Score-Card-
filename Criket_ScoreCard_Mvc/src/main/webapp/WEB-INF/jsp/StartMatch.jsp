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
    font-size: 18px;
}

.match-header {
    background: #dbe8ff;
    border-radius: 10px;
    padding: 15px;
    font-size: 16px;
    margin-bottom: 20px;
}
</style>
</head>

<body class="bg-light">

<div class="page-wrapper">

    <h3 class="text-center mb-4">Start Match</h3>

    <!-- MATCH HEADER -->
    <div class="match-header">
        <strong>Match:</strong> ${schedule.matchTitle}<br>
        <strong>Teams:</strong> ${schedule.teamA} vs ${schedule.teamB}<br>
        <strong>Date:</strong> ${schedule.matchDate}  
        <strong class="ms-4">Time:</strong> ${schedule.matchTime}
    </div>

    <!-- FORM -->
    <div class="card p-4">
        <form action="/match/start/save" method="post">

            <input type="hidden" name="scheduleId" value="${scheduleId}">

            <!-- TOSS DETAILS -->
            <div class="card p-3 mb-4">
                <h5 class="section-title">Toss Details</h5>

                <label class="mt-2">Toss Winner</label>
                <select class="form-control" name="tossWinner" required>
                    <option value="${schedule.teamA}">${schedule.teamA}</option>
                    <option value="${schedule.teamB}">${schedule.teamB}</option>
                </select>

                <label class="mt-3">Decision</label>
                <select class="form-control" name="chooseTo" required>
                    <option value="Batting">Batting</option>
                    <option value="Bowling">Bowling</option>
                </select>
            </div>

            <!-- OPENING PLAYERS -->
            <div class="card p-3 mb-4">
                <h5 class="section-title">Opening Players</h5>

                <label>Striker</label>
                <input type="text" class="form-control" name="striker" placeholder="Enter striker name" required>

                <label class="mt-2">Non Striker</label>
                <input type="text" class="form-control" name="nonStriker" placeholder="Enter non striker name" required>
            </div>

            <!-- BOWLER -->
            <div class="card p-3 mb-4">
                <h5 class="section-title">Opening Bowler</h5>

                <input type="text" class="form-control" name="bowler" placeholder="Enter bowler name" required>
            </div>

            <div class="text-center">
                <button class="btn btn-success btn-lg px-5">🚀 Start Match</button>
            </div>
        </form>
    </div>

</div>

<%@ include file="Footer.jsp" %>

</body>
</html>
