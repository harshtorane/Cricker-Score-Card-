<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<title>${team.teamName} | Team Details</title>

<style>
.container-box {
    margin: 30px 40px;
}

.card {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.08);
}

.card h2 {
    font-weight: 600;
    margin-bottom: 10px;
}

.card small {
    color: #666;
}

.table th {
    background: #f8f9fa;
    font-weight: 600;
}

.back-btn {
    display: inline-block;
    margin-top: 15px;
    padding: 8px 14px;
    background: #0d6efd;
    color: white;
    border-radius: 6px;
    text-decoration: none;
}
.back-btn:hover {
    background: #084298;
}
</style>

</head>
<body>

<div class="page-wrapper">
    <div class="content container-box">

        <!-- TEAM DETAILS CARD -->
        <div class="card">
            <h2>${team.teamName}</h2>

            <p><b>Captain:</b> ${team.captainName}</p>
            <p><b>Mobile:</b> ${team.monumber}</p>

            <hr>

           <h4>Players</h4>

<table class="table table-bordered mt-3">
    <thead>
        <tr>
            <th>Player Name</th>
            <th>Role</th>
            <th style="width:140px; text-align:center;">Actions</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="p" items="${players}">
            <tr>
                <td>${p.playerName}</td>
                <td>${p.role}</td>

               <td>
    <i class="fa-solid fa-pen-to-square icon-edit"
       style="cursor:pointer;"
       onclick="openEditModal(${p.id}, '${p.playerName}', '${p.role}')"></i>

    <a href="/team/player/delete?id=${p.id}&teamId=${team.id}&tournamentId=${tournamentId}">
        <i class="fa-solid fa-trash icon-delete"></i>
    </a>
</td>

            </tr>
        </c:forEach>
    </tbody>
</table>


            <a class="back-btn" href="/team/list?tournamentId=${tournamentId}">⬅ Back</a>

        </div>

    </div>
</div>
<!-- ================= Player Edit Modal ================= -->
<div class="modal fade" id="editPlayerModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Edit Player</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <form id="editPlayerForm" method="post" action="/team/player/update">
        <div class="modal-body">

          <input type="hidden" name="id" id="playerId">
          <input type="hidden" name="teamId" value="${team.id}">
          <input type="hidden" name="tournamentId" value="${tournamentId}">

          <div class="mb-3">
            <label>Player Name</label>
            <input type="text" class="form-control" name="playerName" id="playerName" required>
          </div>

          <div class="mb-3">
            <label>Role</label>
            <select class="form-control" name="role" id="playerRole">
                <option>Batsman</option>
                <option>Bowler</option>
                <option>All-Rounder</option>
                <option>Wicket Keeper</option>
                <option>Vice-Captain</option>
            </select>
          </div>

        </div>

        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Save Changes</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        </div>

      </form>

    </div>
  </div>
</div>

<script>
function openEditModal(id, name, role) {
    document.getElementById("playerId").value = id;
    document.getElementById("playerName").value = name;
    document.getElementById("playerRole").value = role;

    var modal = new bootstrap.Modal(document.getElementById('editPlayerModal'));
    modal.show();
}
</script>



<%@ include file="Footer.jsp" %>
</body>
</html>
