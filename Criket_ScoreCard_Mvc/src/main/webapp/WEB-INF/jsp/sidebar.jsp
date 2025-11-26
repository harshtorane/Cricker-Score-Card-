
<body>

<div class="header">						
			<div class="main-header">
				
				<!-- Logo -->
				<div class="header-left">
					<a href="home" class="logo">
						<img src="assets/img/logo.svg" alt="Logo">
					</a>
					<a href="home" class="dark-logo">
						<img src="assets/img/logo-white.svg" alt="Logo">
					</a>
				</div>

				<!-- Sidebar Menu Toggle Button -->
				<a id="mobile_btn" class="mobile_btn" href="#sidebar">
					<span class="bar-icon">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</a>

				<div class="header-user">
					<div class="nav user-menu nav-list">	
						<div class="me-auto d-flex align-items-center" id="header-search">	

                          

							<!-- Breadcrumb -->
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb breadcrumb-divide mb-0">
									<li class="breadcrumb-item d-flex align-items-center"><a href="home"><i class="isax isax-home-2 me-1"></i>Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Cricket Scorecard</li>
								</ol>
							</nav>	

						</div>
	
						<div class="d-flex align-items-center">	

							<!-- Search -->
							<div class="input-icon-end position-relative me-2">
								<input type="text" class="form-control" placeholder="Search">
								<span class="input-icon-addon">
									<i class="isax isax-search-normal"></i>
								</span>
							</div>
							<!-- /Search -->

						


							<!-- Light/Dark Mode Button -->
							<div class="me-2 theme-item">
                                <a href="javascript:void(0);" id="dark-mode-toggle" class="theme-toggle btn btn-menubar">
                                    <i class="isax isax-moon"></i>
                                </a>
                                <a href="javascript:void(0);" id="light-mode-toggle" class="theme-toggle btn btn-menubar">
                                    <i class="isax isax-sun-1"></i>
                                </a>
                            </div>

						<!-- User Dropdown -->
<div class="dropdown profile-dropdown">
    <a href="javascript:void(0);" class="dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown" data-bs-auto-close="outside">
        <span class="avatar online">
            <img src="assets/img/profiles/CrickUser.png" alt="Img" class="img-fluid rounded-circle">
        </span>
    </a>

    <div class="dropdown-menu p-2">
        <!-- Dynamic user info -->
        <div class="d-flex align-items-center bg-light rounded-1 p-2 mb-2">
            <span class="avatar avatar-lg me-2">
                <img src="assets/img/profiles/CrickUser.png" alt="img" class="rounded-circle">
            </span>
            <div>
                
               <h6 class="fs-14 fw-medium mb-1">${sessionScope.loggedInUser}</h6>

                <p class="fs-13">Logged In</p>
            </div>
        </div>

        <!-- Profile link -->
       <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/profile-settings">

            <i class="isax isax-profile-circle me-2"></i>Profile Settings
        </a>

      

        <hr class="dropdown-divider my-2">

        <!-- Sign Out -->
        <a class="dropdown-item logout d-flex align-items-center" href="/logout">
            <i class="isax isax-logout me-2"></i>Sign Out
        </a>
    </div>
</div>



						</div>
					</div>
				</div>

				<!-- Mobile Menu -->
				<div class="dropdown mobile-user-menu profile-dropdown">
					<a href="javascript:void(0);" class="dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown"  data-bs-auto-close="outside">
						<span class="avatar avatar-md online">
							<img src="assets/img/profiles/avatar-01.jpg" alt="Img" class="img-fluid rounded-circle">
						</span>
					</a>
					<div class="dropdown-menu p-2 mt-0">
						<a class="dropdown-item d-flex align-items-center" href="profile.html">
							<i class="isax isax-profile-circle me-2"></i>Profile Settings
						</a>
						<a class="dropdown-item d-flex align-items-center" href="reports.html">
							<i class="isax isax-document-text me-2"></i>Reports
						</a>
						<a class="dropdown-item d-flex align-items-center" href="account-settings.html">
							<i class="isax isax-setting me-2"></i>Settings
						</a>
						<a class="dropdown-item logout d-flex align-items-center" href="login.html">
							<i class="isax isax-logout me-2"></i>Signout
						</a>
					</div>
				</div>
				<!-- /Mobile Menu -->

			</div>
		</div>
		<div class="two-col-sidebar" id="two-col-sidebar">
			<div class="twocol-mini">

			

			</div>
			<div class="sidebar" id="sidebar-two">

				<!-- Start Logo -->
				<div class="sidebar-logo">
    <a href="home" class="logo logo-normal">
       <img src="${pageContext.request.contextPath}/assets/img/sc-removebg-preview.png" alt="Logo">

    </a>


					<a href="home" class="logo-small">
						<img src="assets/img/logo-small.svg" alt="Logo">
					</a>
					<a href="home" class="dark-logo">
						<img src="assets/img/logo-white.svg" alt="Logo">
					</a>
					<a href="home" class="dark-small">
						<img src="assets/img/logo-small-white.svg" alt="Logo">
					</a>
					
					<!-- Sidebar Hover Menu Toggle Button -->
					<a id="toggle_btn" href="javascript:void(0);">
						<i class="isax isax-menu-1"></i>
					</a>
				</div>
				<!-- End Logo -->
						
				<!-- Search -->
				<div class="sidebar-search">
					<div class="input-icon-end position-relative">
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-icon-addon">
							<i class="isax isax-search-normal"></i>
						</span>
					</div>
				</div>
				<!-- /Search -->

				<!--- Sidenav Menu -->
				<div class="sidebar-inner" data-simplebar>
					<div id="sidebar-menu" class="sidebar-menu">
						<ul>
						
							<li>
								<ul>
									<li class="submenu">
										<a href="javascript:void(0);" class="active subdrop">
											<i class="isax isax-element-45"></i><span>Cricket Scorecard</span>
											<span class="menu-arrow"></span>
										</a>
										<ul>
											<li><a href="home" class="active"></a></li>
											<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
											<li><a href="${pageContext.request.contextPath}/tournament">Add Tournament/Series</a></li>

											<li><a href="customer-dashboard.html">Start A Match</a></li>
											<li><a href="super-admin-dashboard.html">My Cricket</a></li>
											<li><a href="super-admin-dashboard.html">My Perfromnce</a></li>
										</ul>
									</li>
									<li class="submenu">
										<a href="javascript:void(0);">
											<i class="isax isax-shapes5"></i><span>Super Admin</span>
											<span class="menu-arrow"></span>
										</a>
										<ul>
											<li><a href="super-admin-dashboard.html">Dashboard</a></li>
											<li><a href="companies.html">Companies</a></li>
											<li><a href="subscriptions.html">Subscriptions</a></li>
											<li><a href="packages.html">Packages</a></li>
											<li><a href="domain.html">Domain</a></li>
											<li><a href="purchase-transaction.html">Purchase Transaction</a></li>
										</ul>
									</li>
									<li>
										<a href="https://kanakku.dreamstechnologies.com/html/sass-landing/index.html">
											<i class="isax isax-note-215"></i><span>Frontend</span>
										</a>
									</li>
									<li class="submenu">
										<a href="javascript:void(0);">
											<i class="isax isax-category-25"></i><span>Applications</span>
											<span class="menu-arrow"></span>
										</a>
										<ul>
											<li><a href="chat.html">Chat</a></li>
											<li class="submenu submenu-two">
												<a href="call.html">Calls<span class="menu-arrow inside-submenu"></span></a>
												<ul>
													<li><a href="voice-call.html">Voice Call</a></li>
													<li><a href="video-call.html">Video Call</a></li>
													<li><a href="outgoing-call.html">Outgoing Call</a></li>
													<li><a href="incoming-call.html">Incoming Call</a></li>
													<li><a href="call-history.html">Call History</a></li>
												</ul>
											</li>
											<li><a href="calendar.html">Calendar</a></li>
											<li><a href="email.html">Email</a></li>
											<li><a href="todo.html">To Do</a></li>
											<li><a href="notes.html">Notes</a></li>
											<li><a href="social-feed.html">Social Feed</a></li>
											<li><a href="file-manager.html">File Manager</a></li>
											<li><a href="kanban-view.html">Kanban</a></li>
											<li><a href="contacts.html">Contacts</a></li>											
											<li><a href="invoice.html">Invoices</a></li>
											<li><a href="search-list.html">Search List</a></li>
										</ul>
									</li>
								</ul>
							</li>
							
						
					</div>
				</div>
			</div>
		</div>
</body>
