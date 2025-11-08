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

            <!-- ================= Dashboard Header ================= -->
            <div class="d-flex d-block align-items-center justify-content-between flex-wrap gap-3 mb-3">
                <div>
                    <h6>Dashboard</h6>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap gap-2">
                    <div id="reportrange" class="reportrange-picker d-flex align-items-center">
                        <i class="isax isax-calendar text-gray-5 fs-14 me-1"></i>
                        <span class="reportrange-picker-field">16 Apr 25 - 16 Apr 25</span>
                    </div>
                    <div class="dropdown">
                        <a class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" href="#">Create New</a>
                        <ul class="dropdown-menu">
                            <li><a href="add-invoice.html" class="dropdown-item">Invoice</a></li>
                            <li><a href="expenses.html" class="dropdown-item">Expense</a></li>
                            <li><a href="add-credit-notes.html" class="dropdown-item">Credit Notes</a></li>
                            <li><a href="add-debit-notes.html" class="dropdown-item">Debit Notes</a></li>
                            <li><a href="add-purchases-orders.html" class="dropdown-item">Purchase Order</a></li>
                            <li><a href="add-quotation.html" class="dropdown-item">Quotation</a></li>
                            <li><a href="add-delivery-challan.html" class="dropdown-item">Delivery Challan</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- ================= Welcome Card ================= -->
            <div class="bg-primary rounded welcome-wrap position-relative mb-3">
                <div class="row">
                    <div class="col-lg-8 col-md-9 col-sm-7">
                        <div>
                            <h5 class="text-white mb-1">Good Morning, ${userName}</h5>
                            <p class="text-white mb-3">You have 15+ invoices saved to draft that need to be sent to customers</p>
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
                            <h6 class="mb-3"><i class="isax isax-trophy text-primary me-2"></i>All Tournaments</h6>

                            <c:if test="${empty tournaments}">
                                <p class="text-muted">No tournaments found.</p>
                            </c:if>

                            <c:forEach var="t" items="${tournaments}">
                                <div class="border rounded p-2 mb-2">
                                    <h6 class="mb-1">${t.tournamentName}</h6>
                                    <p class="mb-0 fs-13 text-muted">📍 ${t.city}, ${t.ground}</p>
                                    <p class="mb-0 fs-13 text-muted">🗓 ${t.startDate} - ${t.endDate}</p>
                                    <p class="mb-0 fs-13 text-muted">🏆 ${t.category}</p>
                                    <p class="mb-0 fs-13 text-muted">👤 ${t.organizerName} (${t.organizerNumber})</p>
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
