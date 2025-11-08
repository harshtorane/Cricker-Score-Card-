<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tournament.tournamentName}</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }
    .header {
        background-color: #111;
        color: white;
        padding: 20px;
        text-align: center;
    }
    .header h2 {
        margin: 0;
        font-size: 22px;
    }
    .header p {
        margin: 5px 0 0;
        font-size: 13px;
        color: #aaa;
    }

    .tab-container {
        background: #fff;
        margin: 20px auto;
        border-radius: 10px;
        width: 90%;
        padding: 15px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }

    .tabs {
        display: flex;
        justify-content: space-around;
        border-bottom: 2px solid #eee;
        margin-bottom: 10px;
    }

    .tab {
        padding: 10px 15px;
        font-size: 14px;
        cursor: pointer;
        color: #444;
        font-weight: 600;
        border-radius: 6px;
    }

    .tab.active {
        color: #fff;
        background-color: #007b83;
    }

    .match-status {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin: 15px 0;
    }

    .match-status button {
        border: none;
        padding: 8px 20px;
        border-radius: 25px;
        cursor: pointer;
        font-weight: 600;
        background-color: #eee;
    }

    .match-status .active {
        background-color: #007b83;
        color: white;
    }

    .match-box {
        background: #fefefe;
        border-radius: 10px;
        padding: 25px;
        margin: 20px auto;
        width: 80%;
        text-align: center;
        border: 1px solid #ddd;
    }

    .match-box button {
        background-color: #ddd;
        border: none;
        border-radius: 8px;
        padding: 10px 20px;
        cursor: pointer;
        font-weight: bold;
    }

    .match-box span {
        margin: 0 15px;
        font-weight: bold;
    }

    .buttons {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 25px;
    }

    .btn {
        border: none;
        padding: 10px 20px;
        border-radius: 6px;
        color: white;
        font-weight: 600;
        cursor: pointer;
    }

    .btn-primary {
        background-color: #007b83;
    }

    .btn-secondary {
        background-color: #00bfa5;
    }
</style>
</head>
<body>

    <!-- Tournament Header -->
    <div class="header">
        <h2>${tournament.tournamentName}</h2>
        <p>${tournament.startDate} to ${tournament.endDate} • 16 views</p>
    </div>

    <!-- Tabs Section -->
    <div class="tab-container">
        <div class="tabs">
            <div class="tab active">Matches</div>
            <div class="tab">Teams</div>
            <div class="tab">Points Table</div>
            <div class="tab">Leaderboard</div>
            <div class="tab">Stats</div>
        </div>

        <!-- Match Filters -->
        <div class="match-status">
            <button class="active">Live</button>
            <button>Upcoming</button>
            <button>Past</button>
        </div>

        <!-- Match Selection -->
        <div class="match-box">
            <h4>Select Teams</h4>
            <div>
                <button>+ Select Team A</button>
                <span>vs</span>
                <button>+ Select Team B</button>
            </div>
            <p style="margin-top:15px; color:#555;">
                You can create a schedule in advance or start scoring matches directly from here.
            </p>
        </div>

        <!-- Buttons -->
        <div class="buttons">
            <button class="btn btn-primary">Start A Match</button>
            <button class="btn btn-secondary">Schedule Matches</button>
        </div>
    </div>

</body>
</html>
