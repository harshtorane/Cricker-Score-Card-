<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start Match</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.page-wrapper {
    margin-left: 260px !important;
    margin-top: 90px;
    padding: 20px;
}

.card {
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.15);
}

.section-title {
    font-weight: 600;
    font-size: 18px;
}

.match-header {
    background: #dbe8ff;
    border-radius: 10px;
    padding: 15px;
    font-size: 16px;
    margin-bottom: 20px;
}
.form-row {
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}
.form-row .form-group { flex:1; min-width:200px; }
</style>

</head>

<body class="bg-light">

<div class="page-wrapper">

    <h3 class="text-center mb-4">Start Match</h3>

    <!-- MATCH INFO -->
    <div class="match-header">
        <strong>Match:</strong> ${schedule.matchTitle}<br>
        <strong>Teams:</strong> ${schedule.teamA} vs ${schedule.teamB}<br>
        <strong>Date:</strong> ${schedule.matchDate}  
        <strong class="ms-4">Time:</strong> ${schedule.matchTime}
    </div>

    <!-- MAIN FORM -->
    <div class="card p-4">
        <form action="/match/start/save" method="post">

            <input type="hidden" name="scheduleId" value="${scheduleId}">
            <input type="hidden" name="tournamentId" value="${tournamentId}">

            <!-- TOSS DETAILS -->
            <div class="card p-3 mb-4">
                <h5 class="section-title">Toss Details</h5>

                <div class="form-group mb-3">
                    <label class="form-label">Toss Winner</label>
                    <select class="form-select" name="tossWinner" required>
                        <option value="">Select Team</option>
                        <option value="${schedule.teamA}">${schedule.teamA}</option>
                        <option value="${schedule.teamB}">${schedule.teamB}</option>
                    </select>
                </div>

                <div class="form-group mb-3">
                    <label class="form-label">Decision</label>
                    <select class="form-select" name="chooseTo" required>
                        <option value="">Select</option>
                        <option value="Batting">Batting</option>
                        <option value="Bowling">Bowling</option>
                    </select>
                </div>

                <!-- OVERS INPUTS -->
                <div class="form-row mt-3">
                    <div class="form-group">
                        <label class="form-label">Total Overs (Innings)</label>
                        <input type="number"
                               class="form-control"
                               name="totalOvers"
                               id="totalOvers"
                               min="1"
                               max="100"
                               step="1"
                               placeholder="e.g. 20"
                               required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Overs per Bowler (Max)</label>
                        <input type="number"
                               class="form-control"
                               name="oversPerBowler"
                               id="oversPerBowler"
                               min="1"
                               max="20"
                               step="1"
                               placeholder="e.g. 4"
                               required>
                    </div>
                </div>

            </div>

            <div class="text-start">
                <button class="btn btn-success btn-lg px-4">🚀 Start Match</button>
            </div>
        </form>
    </div>

</div>

<script>
// client-side validation: ensure oversPerBowler <= totalOvers
document.querySelector('form').addEventListener('submit', function(e){
    const total = parseInt(document.getElementById('totalOvers').value || '0', 10);
    const per = parseInt(document.getElementById('oversPerBowler').value || '0', 10);

    if(total <= 0 || per <= 0){
        alert('कृपया Total Overs आणि Overs per Bowler योग्य प्रकारे भरा.');
        e.preventDefault();
        return;
    }
    // ensure per <= total (and also sensible: per <= Math.ceil(total/ (number-of-bowlers)?))
    if(per > total){
        alert('Overs per Bowler हे Total Overs पेक्षा जास्त असू शकत नाही.');
        e.preventDefault();
        return;
    }
});
</script>

<%@ include file="Footer.jsp" %>

</body>
</html>
