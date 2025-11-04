<%@ include file="Heder.jsp" %>
<%@ include file="Footer.jsp" %>


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

				<!-- start row -->
				<div class="row">
					<div class="col-md-4 d-flex">
						<div class="card flex-fill">
							<div class="card-body">
								<div class="mb-3">
									<h6 class="d-flex align-items-center mb-1"><i class="isax isax-category5 text-default me-2"></i>Overview</h6>
								</div>
								<div class="row g-4">
									<div class="col-xl-6">
										<div class="d-flex align-items-center">
											<span class="avatar avatar-44 avatar-rounded bg-primary-subtle text-primary flex-shrink-0 me-2">
												<i class="isax isax-document-text-1 fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Invoices</p>
												<h6 class="fs-16 fw-semibold mb-0 text-truncate">1,041</h6>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="d-flex align-items-center me-2">
											<span class="avatar avatar-44 avatar-rounded bg-success-subtle text-success-emphasis flex-shrink-0 me-2">
												<i class="isax isax-profile-2user fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Customers</p>
												<h6 class="fs-16 fw-semibold mb-0 text-truncate">3,462</h6>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="d-flex align-items-center">
											<span class="avatar avatar-44 avatar-rounded bg-warning-subtle text-warning-emphasis flex-shrink-0 me-2">
												<i class="isax isax-dcube fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Amount Due</p>
												<h6 class="fs-16 fw-semibold mb-0 text-truncate">$1,642</h6>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="d-flex align-items-center me-2">
											<span class="avatar avatar-44 avatar-rounded bg-info-subtle text-info-emphasis flex-shrink-0 me-2">
												<i class="isax isax-document-text fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Quotations</p>
												<h6 class="fs-16 fw-semibold mb-0 text-truncate">2,150</h6>
											</div>
										</div>
									</div>
								</div>
							</div> <!-- end card body -->
						</div> <!-- end card -->
					</div> <!-- end col -->
					<div class="col-md-4 d-flex">
						<div class="card flex-fill">
							<div class="card-body">
								<div class="mb-3">
									<h6 class="d-flex align-items-center mb-1"><i class="isax isax-chart-215 text-default me-2"></i>Sales Analytics</h6>
								</div>
								<div class="row g-4">
									<div class="col-xl-6">
										<div class="d-flex align-items-center">
											<span class="avatar avatar-44 avatar-rounded bg-primary-subtle text-primary flex-shrink-0 me-2">
												<i class="isax isax-document-forward fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Total Sales</p>
												<h6 class="fs-16 fw-semibold mb-0">$40,569</h6>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="d-flex align-items-center me-2">
											<span class="avatar avatar-44 avatar-rounded bg-success-subtle text-success-emphasis flex-shrink-0 me-2">
												<i class="isax isax-programming-arrow fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Purchase</p>
												<h6 class="fs-16 fw-semibold mb-0 text-truncate">$1,54,220</h6>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="d-flex align-items-center">
											<span class="avatar avatar-44 avatar-rounded bg-warning-subtle text-warning-emphasis flex-shrink-0 me-2">
												<i class="isax isax-dollar-circle fs-20"></i>
											</span>
											<div>
												<p class="mb-1 mb-0">Expenses</p>
												<h6 class="fs-16 fw-semibold text-truncate">$10,041</h6>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="d-flex align-items-center me-2">
											<span class="avatar avatar-44 avatar-rounded bg-info-subtle text-info-emphasis flex-shrink-0 me-2">
												<i class="isax isax-flag fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Credits</p>
												<h6 class="fs-16 fw-semibold mb-0 text-truncate">$12,150</h6>
											</div>
										</div>
									</div>
								</div>
							</div> <!-- end card body -->
						</div> <!-- end card -->
					</div> <!-- end col -->
					<div class="col-md-4 d-flex">
						<div class="card flex-fill">
							<div class="card-body">
								<div class="mb-3">
									<h6 class="d-flex align-items-center mb-1"><i class="isax isax-chart-success5 text-default me-2"></i>Invoice Statistics</h6>
								</div>
								<div class="row g-4">
									<div class="col-xl-6">
										<div class="d-flex align-items-center">
											<span class="avatar avatar-44 avatar-rounded bg-primary-subtle text-primary flex-shrink-0 me-2">
												<i class="isax isax-document fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Invoiced</p>
												<h6 class="fs-16 fw-semibold mb-0">$21,132</h6>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="d-flex align-items-center me-2">
											<span class="avatar avatar-44 avatar-rounded bg-success-subtle text-success-emphasis flex-shrink-0 me-2">
												<i class="isax isax-document-forward fs-20"></i>
											</span>
											<div>
												<p class="mb-1 text-truncate">Received</p>
												<h6 class="fs-16 fw-semibold mb-0