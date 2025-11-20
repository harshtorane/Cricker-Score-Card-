<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teams List</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>

.page-title {
    font-size: 28px;
    font-weight: 700;
    color: #0d6efd;
}

.table-wrapper {
    width: 85%;
    margin: 40px auto;
}

.table {
    background: white;
    border-radius: 10px;
    overflow: hidden;
    border-collapse: collapse !important;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
}

.table thead {
    background: #f1f5ff;
}

.table tbody tr {
    transition: 0.25s;
    cursor: pointer;
}

.table tbody tr:hover {
    background: #eef5ff;
    transform: scale(1.005);
}

.action-icons i {
    font-size: 18px;
    margin: 0 7px;
    cursor: pointer;
}

.icon-edit { color: #0d6efd; }
.icon-edit:hover { color: #084298; }

.icon-delete { color: #dc3545; }
.icon-delete:hover { color: #a71d2a; }

.btn-back {
    background: #6c757d;
    color: white;
    padding: 8px 14px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 500;
}
.btn-back:hover {
    background: #545b62;
}
</style>

<script>
// Prevent row click when clicking on action icons
function stopEvent(e) {
    e.stopPropagation();
}
</script>

</head>

<body>

<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content">

            <div class="table-wrapper">

                <!-- Header -->
                <div class="d-flex justify-content-between mb-3">
                    <h2 class="page-title">Teams List</h2>

                    <a href="/tournament/manage?id=${tournamentId}" class="btn-back">⬅ Back</a>
                </div>

                <!-- Table -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="width:60px">ID</th>
                            <th>Team Name</th>
                            <th>Captain</th>
                            <th>Mobile</th>
                            <th style="width:150px; text-align:center;">Actions</th>
                        </tr>
                    </thead>

                    <tbody>
    <c:forEach var="t" items="${teams}">
        <tr>

            <td>${t.id}</td>
            <td>${t.teamName}</td>
            <td>${t.captainName}</td>
            <td>${t.monumber}</td>

            <td class="action-icons" style="text-align:center;">

                <!-- VIEW / DETAILS -->
                <a href="/team/details?id=${t.id}&tournamentId=${tournamentId}" onclick="stopEvent(event)">
                    <i class="fa-solid fa-eye" style="color:#198754;"></i>
                </a>

                <!-- EDIT -->
                <a href="/team/edit?id=${t.id}&tournamentId=${tournamentId}" onclick="stopEvent(event)">
                    <i class="fa-solid fa-pen-to-square icon-edit"></i>
                </a>

                <!-- DELETE -->
                <a href="/team/delete?id=${t.id}&tournamentId=${tournamentId}" 
                   onclick="stopEvent(event); return confirm('Are you sure you want to delete this team?');">
                    <i class="fa-solid fa-trash icon-delete"></i>
                </a>

            </td>
        </tr>
    </c:forEach>
</tbody>


                </table>

            </div>

        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>
