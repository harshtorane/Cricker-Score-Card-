<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>
<%@ include file="Footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teams List | Tournament</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body {
    background: linear-gradient(135deg, #141e30, #243b55);
    background-size: cover;
    font-family: 'Poppins', sans-serif;
}

.page-content {
    margin-left: 260px;
    padding: 50px;
}

.glass-table {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);
    border-radius: 14px;
    border: 1px solid rgba(255,255,255,0.25);
    padding: 25px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
}

.table thead {
    background: linear-gradient(90deg, #ffcc00, #ff8800);
    color: #000;
    font-weight: 700;
    font-size: 15px;
}

.table tbody tr {
    background: rgba(255,255,255,0.08);
    color: #fff;
    transition: 0.3s;
}
.table tbody tr:hover {
    background: rgba(255,255,255,0.20);
}

.page-title {
    font-size: 28px;
    font-weight: 700;
    background: linear-gradient(90deg, #ffdd00, #ff9900);
    -webkit-background-clip: text;
    color: transparent;
    margin-bottom: 25px;
}

.btn-add {
    background: linear-gradient(90deg, #00eaff, #0072ff);
    border: none;
    font-weight: 600;
    padding: 10px 18px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,180,255,0.4);
}
.btn-add:hover {
    transform: scale(1.05);
}

.action-btn {
    padding: 5px 12px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 500;
    border: none;
}
.btn-edit {
    background: #ffc107;
}
.btn-edit:hover {
    background: #d39e00;
}
.btn-delete {
    background: #dc3545;
    color: #fff;
}
.btn-delete:hover {
    background: #b02a37;
}

</style>
</head>

<body>

<div class="page-content">

    <h2 class="page-title">👥 Teams List</h2>

    <a href="/AddTeam?tournamentId=${param.tournamentId}" class="btn btn-add mb-3">➕ Add New Team</a>

    <div class="glass-table">

        <table class="table table-hover text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Team Name</th>
                    <th>Captain</th>
                    <th>Mobile</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="t" items="${teams}">
                    <tr>
                        <td>${t.id}</td>
                        <td>${t.teamName}</td>
                        <td>${t.captainName}</td>
                        <td>${t.monumber}</td>
                        <td>
                            <a href="/team/edit?id=${t.id}" class="action-btn btn-edit">✏ Edit</a>
                            <a href="/team/delete?id=${t.id}" 
                               class="action-btn btn-delete"
                               onclick="return confirm('Are you sure you want to delete this team?');">
                               🗑 Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>

    </div>

</div>

</body>
</html>
