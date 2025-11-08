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
</head>

<body>
<div class="main-wrapper">
    <div class="page-wrapper">
        <div class="content">

            <!-- ================= Welcome Card ================= -->
<div class="bg-primary rounded welcome-wrap position-relative mb-3">
    <div class="row">
        <div class="col-lg-8 col-md-9 col-sm-7">
            <div>
                <!-- Greeting Text -->
                <h5 class="text-white mb-1" id="greeting"> ${userName}</h5>

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
        <div class="position-absolute end-0 top-50 translate-middle-y p-2 d-none d-sm-block">
        </div>
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
                    <a href="editTournament?id=${t.id}"
                       class="position-absolute top-0 end-0 m-2 text-primary"
                       title="Edit Tournament">
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
