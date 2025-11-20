<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Schedule</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>

.page-content {
    padding: 25px 40px;
}

.card-box {
    background: #fff;
    padding: 25px;
    margin-top: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.input-field {
    width: 100%;
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 6px;
    margin-bottom: 15px;
}

.btn-save {
    background: #0d6efd;
    color: white;
    padding: 9px 18px;
    border-radius: 6px;
    border: none;
    font-size: 15px;
}
.btn-save:hover {
    background: #084298;
}

.btn-back {
    background: #6c757d;
    color: white;
    padding: 8px 14px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
}

</style>

</head>

<body>

<div class="page-wrapper">
    <div class="content page-content">

        <div class="d-flex justify-content-between align-items-center">
            <h2 style="color:#0d6efd; font-weight:600;">Create Match Schedule</h2>

            <a href="/tournament/manage?id=${tournamentId}" class="btn-back">⬅ Back</a>
        </div>

        <div class="card-box">

            <form action="/schedule/save" method="post">

                <input type="hidden" name="tournamentId" value="${tournamentId}"/>

                <label>Match Title</label>
                <input type="text" name="matchTitle" class="input-field"
                       value="${tournament.tournamentName}" readonly>

                <label>Ground</label>
                <input type="text" name="ground" class="input-field"
                       value="${tournament.ground}" readonly>

                <label>Date</label>
                <input type="date" name="matchDate" class="input-field" required>

                <label>Time</label>
                <input type="time" name="matchTime" class="input-field" required>

                <!-- TEAM A -->
                <label>Team A</label>
                <select id="teamA" name="teamA" class="input-field" required>
                    <option value="">Select Team</option>
                    <c:forEach var="t" items="${teams}">
                        <option value="${t.teamName}">${t.teamName}</option>
                    </c:forEach>
                </select>

                <!-- TEAM B -->
                <label>Team B</label>
                <select id="teamB" name="teamB" class="input-field" required>
                    <option value="">Select Team</option>
                    <c:forEach var="t" items="${teams}">
                        <option value="${t.teamName}">${t.teamName}</option>
                    </c:forEach>
                </select>

                <button class="btn-save">Save Schedule</button>

            </form>

        </div>
    </div>
</div>

<!-- ===================== TEAM FILTER SCRIPT ===================== -->
<script>
    function filterTeamB() {
        let teamA = document.getElementById("teamA").value;
        let teamBSelect = document.getElementById("teamB");

        for (let i = 0; i < teamBSelect.options.length; i++) {
            let option = teamBSelect.options[i];

            if (option.value === teamA) {
                option.style.display = "none";   // hide same team
            } else {
                option.style.display = "block";
            }
        }

        if (teamBSelect.value === teamA) {
            teamBSelect.value = ""; // reset selection
        }
    }

    function filterTeamA() {
        let teamB = document.getElementById("teamB").value;
        let teamASelect = document.getElementById("teamA");

        for (let i = 0; i < teamASelect.options.length; i++) {
            let option = teamASelect.options[i];

            if (option.value === teamB) {
                option.style.display = "none";
            } else {
                option.style.display = "block";
            }
        }

        if (teamASelect.value === teamB) {
            teamASelect.value = "";
        }
    }

    document.getElementById("teamA").addEventListener("change", filterTeamB);
    document.getElementById("teamB").addEventListener("change", filterTeamA);
</script>

</body>
</html>
