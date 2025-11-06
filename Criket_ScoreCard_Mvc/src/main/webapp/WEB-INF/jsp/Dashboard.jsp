<%@ include file="Heder.jsp" %>
<%@ include file="Footer.jsp" %>
<%@ include file="sidebar.jsp" %>


<body>
	<!-- Begin Wrapper -->
	<div class="main-wrapper">		

		<!-- Topbar Start -->
		

		<!-- Sidenav Menu Start -->
		
		<!-- Sidenav Menu End -->

		<!-- ========================
			Start Page Content
		========================= -->

		<div class="page-wrapper">

			<!-- Start Content -->
			<div class="content">

				<!-- Start Breadcrumb -->
				<div class="d-flex d-block align-items-center justify-content-between flex-wrap gap-3 mb-3">
					<div>
						<h6>Dashboard</h6>
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap gap-2">
						<div id="reportrange" class="reportrange-picker d-flex align-items-center">
							<i class="isax isax-calendar text-gray-5 fs-14 me-1"></i><span class="reportrange-picker-field">16 Apr 25 - 16 Apr 25</span>
						</div>
						<div class="dropdown">
							<a class="btn btn-primary d-flex align-items-center justify-content-center dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" role="button">
								Create New
							</a>
							<ul class="dropdown-menu dropdown-menu-start">
								<li>
									<a href="add-invoice.html" class="dropdown-item d-flex align-items-center">
										<i class="isax isax-document-text-1 me-2"></i>Invoice
									</a>
								</li>
								<li>
									<a href="expenses.html" class="dropdown-item d-flex align-items-center">
										<i class="isax isax-money-send me-2"></i>Expense
									</a>
								</li>
								<li>
									<a href="add-credit-notes.html" class="dropdown-item d-flex align-items-center">
										<i class="isax isax-money-add me-2"></i>Credit Notes
									</a>
								</li>
								<li>
									<a href="add-debit-notes.html" class="dropdown-item d-flex align-items-center">
										<i class="isax isax-money-recive me-2"></i>Debit Notes
									</a>
								</li>
								<li>
									<a href="add-purchases-orders.html" class="dropdown-item d-flex align-items-center">
										<i class="isax isax-document me-2"></i>Purchase Order
									</a>
								</li>
								<li>
									<a href="add-quotation.html" class="dropdown-item d-flex align-items-center">
										<i class="isax isax-document-download me-2"></i>Quotation
									</a>
								</li>
								<li>
									<a href="add-delivery-challan.html" class="dropdown-item d-flex align-items-center">
										<i class="isax isax-document-forward me-2"></i>Delivery Challan
									</a>
								</li>
							</ul>
						</div>
						<div class="dropdown">
							<a href="javascript:void(0);" class="btn btn-outline-white d-inline-flex align-items-center"  data-bs-toggle="dropdown">
								<i class="isax isax-export-1 me-1"></i>Export
							</a>
							<ul class="dropdown-menu">
								<li>
									<a class="dropdown-item" href="javascript:void(0);">Download as PDF</a>
								</li>
								<li>
									<a class="dropdown-item" href="javascript:void(0);">Download as Excel</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- End Breadcrumb -->

				<div class="bg-primary rounded welcome-wrap position-relative mb-3">

					<!-- start row -->
					<div class="row">
						<div class="col-lg-8 col-md-9 col-sm-7">
							<div>
								<h5 class="text-white mb-1">Good Morning, Jafna Cremson</h5>
								<p class="text-white mb-3">You have 15+ invoices saved to draft that has to send to customers</p>
								<div class="d-flex align-items-center flex-wrap gap-3">
									<p class="d-flex align-items-center fs-13 text-white mb-0"><i class="isax isax-calendar5 me-1"></i>Friday, 24 Mar 2025</p>
									<p class="d-flex align-items-center fs-13 text-white mb-0"><i class="isax isax-clock5 me-1"></i>11:24 AM</p>
								</div>
							</div>
						</div><!-- end col -->
					</div>
					<!-- end row -->

					<div class="position-absolute end-0 top-50 translate-middle-y p-2 d-none d-sm-block">
						<img src="assets/img/icons/dashboard.svg" alt="img">
					</div>
				</div>
				
				
				
				<div class="row">
    <!-- Current Tournaments -->
    <div class="col-md-4 d-flex">
        <div class="card flex-fill shadow-sm">
            <div class="card-body">
                <h6 class="d-flex align-items-center mb-3">
                    <i class="isax isax-calendar text-primary me-2"></i>Current Tournaments
                </h6>
                <c:if test="${empty currentTournaments}">
                    <p class="text-muted">No Current Tournaments Found</p>
                </c:if>
                <c:forEach var="t" items="${currentTournaments}">
                    <div class="border rounded p-2 mb-2">
                        <h6 class="mb-1">${t.name}</h6>
                        <p class="mb-0 fs-13 text-muted">${t.startDate} - ${t.endDate}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- Upcoming Tournaments -->
    <div class="col-md-4 d-flex">
        <div class="card flex-fill shadow-sm">
            <div class="card-body">
                <h6 class="d-flex align-items-center mb-3">
                    <i class="isax isax-calendar5 text-primary me-2"></i>Upcoming Tournaments
                </h6>
                <c:if test="${empty upcomingTournaments}">
                    <p class="text-muted">No Upcoming Tournaments Found</p>
                </c:if>
                <c:forEach var="t" items="${upcomingTournaments}">
                    <div class="border rounded p-2 mb-2">
                        <h6 class="mb-1">${t.name}</h6>
                        <p class="mb-0 fs-13 text-muted">${t.startDate} - ${t.endDate}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- Saved Tournaments -->
    <div class="col-md-4 d-flex">
        <div class="card flex-fill shadow-sm">
            <div class="card-body">
                <h6 class="d-flex align-items-center mb-3">
                    <i class="isax isax-save5 text-primary me-2"></i>Saved Tournaments
                </h6>
                <c:if test="${empty savedTournaments}">
                    <p class="text-muted">No Tournaments Saved Yet</p>
                </c:if>
                <c:forEach var="t" items="${savedTournaments}">
                    <div class="border rounded p-2 mb-2">
                        <h6 class="mb-1">${t.name}</h6>
                        <p class="mb-0 fs-13 text-muted">${t.startDate} - ${t.endDate}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
						
	