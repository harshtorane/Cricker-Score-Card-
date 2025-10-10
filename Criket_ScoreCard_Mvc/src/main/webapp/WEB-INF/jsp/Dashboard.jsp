<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <div class="card shadow-lg p-4 text-center">
      <h2>Welcome, ${userName} 👋</h2>
      <p class="text-muted">You are successfully logged in!</p>
      <a href="/logout" class="btn btn-danger mt-3">Logout</a>
    </div>
  </div>
</body>
</html>
