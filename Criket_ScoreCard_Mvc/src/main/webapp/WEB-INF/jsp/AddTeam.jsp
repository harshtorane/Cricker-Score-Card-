<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>
<%@ include file="Footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Team | Tournament</title>

<style>
.form-wrapper {
    min-height: 90vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f8f9fa;
}
.form-box {
    width: 450px;
    background: #fff;
    border-radius: 10px;
    padding: 30px 35px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
.form-box h3 {
    text-align: center;
    color: #0d6efd;
    font-weight: 600;
    margin-bottom: 25px;
}
.btn {
    border-radius: 6px;
    font-weight: 500;
}
.btn-primary {
    background-color: #0d6efd;
    border: none;
}
.btn-primary:hover {
    background-color: #084298;
}
.btn-secondary {
    background-color: #6c757d;
    border: none;
}
.btn-secondary:hover {
    background-color: #545b62;
}
</style>
</head>

<body>
<div class="form-wrapper">
    <form action="/team/save" method="post" class="form-box">

        <h3>➕ Add New Team</h3>

        <input type="hidden" name="tournamentId" value="${param.tournamentId}" />

        <!-- Team Name -->
        <div class="mb-3">
            <label for="teamName" class="form-label">Team Name</label>
            <input type="text" name="teamName" id="teamName" class="form-control"
                   placeholder="Enter team name" required>
        </div>

        <!-- Captain Name -->
        <div class="mb-3">
            <label for="captainName" class="form-label">Captain Name</label>
            <input type="text" name="captainName" id="captainName" class="form-control"
                   placeholder="Enter captain name" required>
        </div>

        <!-- ✅ Mobile Number -->
        <div class="mb-3">
            <label for="monumber" class="form-label">Mobile Number</label>
            <input type="text" name="monumber" id="monumber" class="form-control"
                   placeholder="Enter captain mobile number" pattern="[0-9]{10}" 
                   title="Enter a valid 10-digit mobile number" required>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary px-4">Save Team</button>
            <a href="/team/list?tournamentId=${param.tournamentId}" class="btn btn-secondary px-4 ms-2">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
