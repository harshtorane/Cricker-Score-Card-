<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tournament Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    .success { color: green; font-weight: bold; }
    .error { color: red; font-weight: bold; }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: left;
    }
</style>
</head>
<body>

<h2>Add New Tournament</h2>

<form action="/tournament/save" method="post">
    <label>Tournament Name:</label>
    <input type="text" name="tournamentName" required><br><br>

    <label>City:</label>
    <input type="text" name="city"><br><br>

    <label>Ground:</label>
    <input type="text" name="ground" required><br><br>

    <label>Organizer Name:</label>
    <input type="text" name="organizerName"><br><br>

    <label>Organizer Number:</label>
    <input type="text" name="organizerNumber"><br><br>

    <label>Organizer Email:</label>
    <input type="email" name="organizerEmail"><br><br>

    <label>Start Date:</label>
    <input type="date" name="startDate" required><br><br>

    <label>End Date:</label>
    <input type="date" name="endDate" required><br><br>

    <label>Category:</label>
    <select name="tournamentCategory" required>
        <option value="">Select</option>
        <option>OPEN</option>
        <option>CORPORATE</option>
        <option>SCHOOL</option>
        <option>COLLEGE</option>
        <option>OTHER</option>
    </select><br><br>

    <button type="submit">Create Tournament</button>
</form>

<!-- ✅ Success or Error Message -->
<c:if test="${not empty message}">
    <div class="${message.contains('successfully') ? 'success' : 'error'}">
        ${message}
    </div>
</c:if>

<!-- ✅ Display Tournament List -->
<c:if test="${not empty tournaments}">
    <h3>All Tournaments</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>City</th>
                <th>Ground</th>
                <th>Organizer</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="t" items="${tournaments}">
                <tr>
                    <td>${t.id}</td>
                    <td>${t.tournamentName}</td>
                    <td>${t.city}</td>
                    <td>${t.ground}</td>
                    <td>${t.organizerName}</td>
                    <td>${t.startDate}</td>
                    <td>${t.endDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>
