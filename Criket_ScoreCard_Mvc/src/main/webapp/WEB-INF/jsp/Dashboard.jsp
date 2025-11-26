<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="Heder.jsp" %>
<%@ include file="sidebar.jsp" %>
<%@ include file="Footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>

    <!-- ================= Animation Style ================= -->
    <style>
    .welcome-wrap {
  background: linear-gradient(270deg, #0d6efd, #6610f2, #198754);
  background-size: 300% 300%;
  animation: gradientMoveOnce 2.5s ease-out forwards, ease-out forwards;
  color: white;
  border-radius: 15px;
}


@keyframes gradientMoveOnce {
  0% { background-position: 0% 50%; }
  100% { background-position: 100% 50%; }
}


@keyframes fadeRight {
  0% {
    opacity: 0;
    transform: translateX(-40px);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}
    </style>
</head>

<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content">
            
            <!-- ================= Welcome Card ================= -->
            <div class="welcome-wrap position-relative mb-3" 
                 style="background: url('assets/img/SCM.png') no-repeat right center; 
                        background-size: contain; 
                        border-radius: 15px; 
                        background-color: #0d6efd;">
                <div class="row">
                    <div class="col-lg-8 col-md-9 col-sm-7">
                        <div>
                            <!-- Greeting Text -->
                            <h5 class="text-white mb-1" id="greeting">
                                Welcome, ${userName} 👋
                            </h5>

                            <p class="text-white mb-3">
                                Welcome To Cricket Scorecard Management
                            </p>

                            <div class="d-flex align-items-center flex-wrap gap-3">
                                <p class="fs-13 text-white mb-0">
                                    <i class="isax isax-calendar5 me-1"></i>${currentDate}
                                </p>
                                <p class="fs-13 text-white mb-0">
                                    <i class="isax isax-clock5 me-1"></i>${currentTime}
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Background cricket image -->
                 
                </div>
            </div>

            <!-- ================= Tournament Cards ================= -->
            <div class="row">

                <!-- All Tournaments -->
                <div class="col-md-4 d-flex">
                    <div class="card flex-fill shadow-sm">
                        <div class="card-body">
                            <h6 class="mb-3">
                                <i class="isax isax-trophy text-primary me-2"></i>All Tournaments
                            </h6>

                            <c:if test="${empty tournaments}">
                                <p class="text-muted">No tournaments found.</p>
                            </c:if>

                            <c:forEach var="t" items="${tournaments}">
                                <div class="border rounded p-2 mb-2 position-relative bg-light">
                                    <!-- 🏷️ Tournament Info -->
                                    <h6 class="mb-1 pe-5">${t.tournamentName}</h6>
                                    <p class="mb-0 fs-13 text-muted">📍 ${t.city}, ${t.ground}</p>
                                    <p class="mb-0 fs-13 text-muted">🗓 ${t.startDate} - ${t.endDate}</p>
                                    <p class="mb-0 fs-13 text-muted">🏆 ${t.category}</p>
                                    <p class="mb-0 fs-13 text-muted">👤 ${t.organizerName} (${t.organizerNumber})</p>

                                    <!-- ✏️ Edit Button (Top Right Corner) -->
                                 <a href="/tournament/manage?id=${t.id}"
   class="position-absolute top-0 end-0 m-2 text-primary"
   title="Manage Tournament">
   <i class="isax isax-edit-2 fs-18"></i>
</a>


                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div> <!-- End Row -->
        </div> <!-- End Content -->
    </div> <!-- End Page Wrapper -->
</div> <!-- End Main Wrapper -->
</body>
</html>
