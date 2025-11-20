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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

.page-center {
    margin-left: 260px;
    padding: 40px 20px;
}

.team-card {
    max-width: 520px;
    margin: auto;
    background: #ffffff;
    padding: 35px 40px;
    border-radius: 15px;
    box-shadow: 0px 5px 20px rgba(0,0,0,0.12);
    border-top: 5px solid #0d6efd;
}

.team-title {
    font-size: 24px;
    font-weight: 700;
    color: #0d6efd;
    text-align: center;
    margin-bottom: 25px;
}

.form-label {
    font-weight: 600;
}

.btn-primary {
    padding: 10px 25px;
    font-weight: 600;
    border-radius: 8px;
}

.btn-secondary {
    padding: 10px 25px;
    border-radius: 8px;
}

</style>

</head>

<body>

<div class="page-center">

    <div class="team-card">

        <h3 class="team-title">➕ Add New Team</h3>

        <!-- Form Start -->
        <form action="/team/save?tournamentId=${param.tournamentId}" method="post">

            <!-- Hidden Tournament ID -->
            <input type="hidden" name="tournamentId" value="${param.tournamentId}" />

            <!-- Team Name -->
            <div class="mb-3">
                <label class="form-label">Team Name</label>
                <input type="text" 
                       name="teamName" 
                       class="form-control" 
                       placeholder="Enter team name" 
                       required>
            </div>

            <!-- Captain Name -->
            <div class="mb-3">
                <label class="form-label">Captain Name</label>
                <input type="text" 
                       name="captainName" 
                       class="form-control" 
                       placeholder="Enter captain name" 
                       required>
            </div>

            <!-- Mobile Number -->
            <div class="mb-3">
                <label class="form-label">Mobile Number</label>
                <input type="text" 
                       name="monumber" 
                       class="form-control" 
                       placeholder="Enter 10-digit mobile number"
                       pattern="[0-9]{10}"
                       required>
            </div>

            <!-- Buttons -->
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary">Save Team</button>
               <a href="/tournament/manage?id=${tournamentId}" class="btn btn-secondary ms-2">Cancle</a>
                   
            </div>

        </form>
        <!-- Form End -->
      

    </div>

</div>

</body>
</html>
