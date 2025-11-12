<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>
<%@ include file="Footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tournament.tournamentName} | Manage Tournament</title>

<style>
.manage-container {
    margin: 40px;
}
.section-card {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    padding: 25px;
    margin-bottom: 25px;
    transition: transform 0.3s ease;
}
.section-card:hover {
    transform: translateY(-3px);
}
.section-title {
    font-weight: 600;
    font-size: 1.2rem;
    color: #0d6efd;
}
.action-btn {
    background: #0d6efd;
    color: white;
    padding: 8px 15px;
    border-radius: 6px;
    border: none;
    transition: 0.3s;
}
.action-btn:hover {
    background: #084298;
}

/* Tabs styling */
.nav-tabs .nav-link {
    color: #0d6efd;
    font-weight: 500;
    border: none;
}
.nav-tabs .nav-link.active {
    background-color: #0d6efd;
    color: #fff;
    border-radius: 6px 6px 0 0;
}
.tab-content {
    background: #fff;
    border-radius: 0 0 8px 8px;
    border: 1px solid #dee2e6;
    border-top: none;
    padding: 20px;
}
</style>
</head>

<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content manage-container">

            <!-- Tournament Header -->
            <div class="section-card">
                <h3>${tournament.tournamentName}</h3>
                <p>📍 ${tournament.city}, ${tournament.ground}</p>
                <p>🗓 ${tournament.startDate} - ${tournament.endDate}</p>
                <p>👤 ${tournament.organizerName} (${tournament.organizerNumber})</p>
            </div>

            <!-- Tabs Section -->
            <div class="section-card">
                <ul class="nav nav-tabs" id="tournamentTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="teams-tab" data-bs-toggle="tab" data-bs-target="#teams" type="button" role="tab">Teams</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="schedule-tab" data-bs-toggle="tab" data-bs-target="#schedule" type="button" role="tab">Schedule</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="points-tab" data-bs-toggle="tab" data-bs-target="#points" type="button" role="tab">Points Table</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="leaderboard-tab" data-bs-toggle="tab" data-bs-target="#leaderboard" type="button" role="tab">Leaderboard</button>
                    </li>
                </ul>

                <div class="tab-content" id="tournamentTabsContent">
                    <!-- Teams Tab -->
                    <div class="tab-pane fade show active" id="teams" role="tabpanel">
                        <h5>Teams Management</h5>
                        <p>Manage or add teams for this tournament.</p>
                       <a href="/AddTeam" class="btn btn-primary btn-sm">➕ Add Team</a>
                        <a href="/team/list?tournamentId=${tournament.id}" class="btn btn-secondary btn-sm">👥 View Teams</a>
                    </div>

                    <!-- Schedule Tab -->
                    <div class="tab-pane fade" id="schedule" role="tabpanel">
                        <h5>Match Schedule</h5>
                        <p>View or create match schedules.</p>
                        <a href="/schedule/create?tournamentId=${tournament.id}" class="btn btn-primary btn-sm">📅 Create Schedule</a>
                    </div>

                    <!-- Points Table Tab -->
                    <div class="tab-pane fade" id="points" role="tabpanel">
                        <h5>Points Table</h5>
                        <table class="table table-bordered mt-3">
                            <thead class="table-light">
                                <tr>
                                    <th>Team</th>
                                    <th>Matches</th>
                                    <th>Won</th>
                                    <th>Lost</th>
                                    <th>Points</th>
                                    <th>NRR</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Super Kings</td>
                                    <td>4</td>
                                    <td>3</td>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>+0.75</td>
                                </tr>
                                <tr>
                                    <td>Rising Stars</td>
                                    <td>4</td>
                                    <td>2</td>
                                    <td>2</td>
                                    <td>4</td>
                                    <td>-0.25</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Leaderboard Tab -->
                    <div class="tab-pane fade" id="leaderboard" role="tabpanel">
                        <h5>Leaderboard (Top Players)</h5>
                        <table class="table table-striped mt-3">
                            <thead>
                                <tr>
                                    <th>Player</th>
                                    <th>Team</th>
                                    <th>Runs</th>
                                    <th>Wickets</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Rohit Sharma</td>
                                    <td>Super Kings</td>
                                    <td>210</td>
                                    <td>-</td>
                                </tr>
                                <tr>
                                    <td>Jasprit Bumrah</td>
                                    <td>Super Kings</td>
                                    <td>25</td>
                                    <td>7</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
