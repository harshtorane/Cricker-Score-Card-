<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>
<%@ include file="Footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Team | Add Players</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
.container-box {
    margin: 40px auto;
    width: 70%;
    background: #fff;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.1);
}

.section-title {
    font-size: 1.5rem;
    font-weight: 600;
    color: #0d6efd;
}

.player-row {
    display: flex;
    gap: 20px;
    margin-bottom: 12px;
}

.player-row input,
.player-row select {
    width: 100%;
}

.btn-add {
    background: #28a745;
    color: white;
    font-weight: 600;
}
.btn-add:hover {
    background: #1e7e34;
}

.btn-save {
    background: #0d6efd;
    color: white;
}
.btn-save:hover {
    background: #084298;
}

.player-list {
    margin-top: 20px;
}

.player-card {
    padding: 10px;
    background: #f8f9fa;
    border-radius: 8px;
    margin-bottom: 8px;
    border-left: 4px solid #0d6efd;
}
</style>

</head>
<body>

<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content">

            <div class="container-box">
                
                <h3 class="section-title">Edit Team: ${team.teamName}</h3>
                <p>Captain: ${team.captainName} | Mobile: ${team.monumber}</p>
                <hr>

                <!-- ADD PLAYER FORM -->
                <h5>Add Player</h5>

                <form action="/team/player/save" method="post">

                    <input type="hidden" name="teamId" value="${team.id}">
                    <input type="hidden" name="tournamentId" value="${tournamentId}">

                    <div class="player-row">
                        <input type="text" name="playerName" class="form-control" placeholder="Player Name" required>

                        <select name="role" class="form-select" required>
                            <option value="" disabled selected>Select Role</option>
                            <option>Batsman</option>
                            <option>Bowler</option>
                            <option>All-Rounder</option>
                            <option>Wicket Keeper</option>
                            <option>Vice-Captain</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-add"><i class="fa fa-plus"></i> Add Player</button>
                </form>

                <hr>

                <!-- SHOW PLAYERS LIST -->
                <h5>Players in this Team</h5>

                <div class="player-list">
                    <c:forEach var="p" items="${players}">
                        <div class="player-card">
                            <b>${p.playerName}</b> — <span>${p.role}</span>
                        </div>
                    </c:forEach>
                </div>

                <a href="/team/list?tournamentId=${tournamentId}" class="btn btn-secondary mt-3">⬅ Back</a>

            </div>

        </div>
    </div>
</div>

</body>
</html>
