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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

                <a href="/tournament/poster?id=${tournament.id}" 
                   class="btn btn-success btn-sm mt-2">🎨 Generate Poster</a>
            </div>

            <!-- Tabs -->
            <div class="section-card">

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#teams">Teams</button>
                    </li>

                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#schedule">Schedule</button>
                    </li>

                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#points">Points Table</button>
                    </li>

                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#leaderboard">Leaderboard</button>
                    </li>
                </ul>

                <div class="tab-content">

                    <!-- TEAMS TAB -->
                    <div class="tab-pane fade show active" id="teams">
                        <h5>Teams Management</h5>

                        <a href="/team/add?tournamentId=${tournament.id}" class="btn btn-primary btn-sm">➕ Add Team</a>

                        <a href="/team/list?tournamentId=${tournament.id}" class="btn btn-secondary btn-sm">👥 View Teams</a>
                    </div>

                    <!-- SCHEDULE TAB -->
                    <div class="tab-pane fade" id="schedule">
                        <h5>Match Schedule</h5>

                        <a href="/schedule/create?tournamentId=${tournament.id}" 
                           class="btn btn-primary btn-sm mb-3">📅 Create Schedule</a>

                        <table class="table table-bordered mt-3">
                            <thead class="table-light">
                                <tr>
                                    <th>Match Title</th>
                                    <th>Ground</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Team A</th>
                                    <th>Team B</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach var="s" items="${scheduleList}">
                                    <tr>
                                        <td>${s.matchTitle}</td>
                                        <td>${s.ground}</td>
                                        <td>${s.matchDate}</td>
                                        <td>${s.matchTime}</td>
                                        <td>${s.teamA}</td>
                                        <td>${s.teamB}</td>

                                        <td>

                                            <a href="/match/start?id=${s.id}&tournamentId=${tournament.id}" 
                                               class="btn btn-success btn-sm">▶ Start</a>

                                            <button class="btn btn-warning btn-sm"
                                                    onclick="openEditModal(
                                                        ${s.id},
                                                        '${s.matchTitle}',
                                                        '${s.ground}',
                                                        '${s.matchDate}',
                                                        '${s.matchTime}',
                                                        '${s.teamA}',
                                                        '${s.teamB}',
                                                        ${tournament.id}
                                                    )">
                                                ✏ Edit
                                            </button>

                                            <a href="/schedule/delete?id=${s.id}&tournamentId=${tournament.id}"
                                               onclick="return confirm('Cancel this match?')" 
                                               class="btn btn-danger btn-sm">❌ Cancel</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <!-- POINTS TAB -->
                    <div class="tab-pane fade" id="points">
                        <h5>Points Table</h5>
                    </div>

                    <!-- LEADERBOARD TAB -->
                    <div class="tab-pane fade" id="leaderboard">
                        <h5>Leaderboard</h5>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<!-- ========================= EDIT POPUP MODAL ========================= -->

<div class="modal fade" id="editScheduleModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">

      <form action="/schedule/update" method="post">

        <div class="modal-header">
            <h5 class="modal-title">Edit Match Schedule</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body">

            <input type="hidden" id="editId" name="id">
            <input type="hidden" id="editTournament" name="tournamentId">

            <div class="mb-3">
                <label>Match Title</label>
                <input type="text" class="form-control" id="editTitle" name="matchTitle">
            </div>

            <div class="mb-3">
                <label>Ground</label>
                <input type="text" class="form-control" id="editGround" name="ground">
            </div>

            <div class="mb-3">
                <label>Date</label>
                <input type="date" class="form-control" id="editDate" name="matchDate">
            </div>

            <div class="mb-3">
                <label>Time</label>
                <input type="time" class="form-control" id="editTime" name="matchTime">
            </div>

            <!-- TEAM A DROPDOWN -->
            <div class="mb-3">
                <label>Team A</label>
                <select class="form-control" id="editA" name="teamA">
                    <c:forEach var="t" items="${teams}">
                        <option value="${t.teamName}">${t.teamName}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- TEAM B DROPDOWN -->
            <div class="mb-3">
                <label>Team B</label>
                <select class="form-control" id="editB" name="teamB">
                    <c:forEach var="t" items="${teams}">
                        <option value="${t.teamName}">${t.teamName}</option>
                    </c:forEach>
                </select>
            </div>

        </div>

        <div class="modal-footer">
            <button class="btn btn-primary">Update</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>

      </form>

    </div>
  </div>
</div>

<!-- ========================= JS FUNCTION ========================= -->
<script>
function openEditModal(id, title, ground, date, time, teamA, teamB, tournamentId) {

    document.getElementById("editId").value = id;
    document.getElementById("editTournament").value = tournamentId;

    document.getElementById("editTitle").value = title;
    document.getElementById("editGround").value = ground;
    document.getElementById("editDate").value = date;
    document.getElementById("editTime").value = time;

    // SELECT the correct dropdown option
    document.getElementById("editA").value = teamA;
    document.getElementById("editB").value = teamB;

    let modal = new bootstrap.Modal(document.getElementById("editScheduleModal"));
    modal.show();
}
</script>

</body>
</html>
