<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="Heder.jsp" %>
<%@ include file="Footer.jsp" %>

<body style="
  background-image: url('assets/img/Ground.jpeg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: fixed;
">
  <!-- Begin Wrapper -->
  <div class="main-wrapper auth-bg">
    <!-- Start Content -->
    <div class="container-fuild">
      <div class="w-100 overflow-hidden position-relative flex-wrap d-block vh-100">

        <!-- start row -->
        <div class="row justify-content-center align-items-center vh-100 overflow-auto flex-wrap ">
          <div class="col-lg-4 mx-auto">
            
            <!-- ✅ Login Form -->
            <form action="login" method="post" class="d-flex justify-content-center align-items-center">
              <div class="d-flex flex-column justify-content-lg-center p-4 p-lg-0 pb-0 flex-fill">

                <div class="card border-0 p-lg-3 shadow-lg">
                  <div class="card-body">
                    <div class="text-center mb-3">
                      <h5 class="mb-2">Login</h5>
                      <p class="mb-0">Please enter your details to access the dashboard</p>
                    </div>

                    <!-- Name Field -->
                    <div class="mb-3">
                      <label class="form-label">Name</label>
                      <div class="input-group">
                        <span class="input-group-text border-end-0">
                          <i class="isax isax-user"></i>
                        </span>
                        <input type="text" name="name" class="form-control border-start-0 ps-0" placeholder="Enter Your Name" required>
                      </div>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                      <label class="form-label">Password</label>
                      <div class="pass-group input-group">
                        <span class="input-group-text border-end-0">
                          <i class="isax isax-lock"></i>
                        </span>
                        <input type="password" name="password" class="pass-inputs form-control border-start-0 ps-0" placeholder="********" required>
                      </div>
                    </div>

                    <!-- Login Button -->
                    <div class="mb-1">
                      <button type="submit" class="btn bg-primary-gradient text-white w-100">Sign In</button>
                    </div>

                    <!-- Error message -->
                    <div class="text-center mt-2">
                      <small class="text-danger">${error}</small>
                    </div>

                    <!-- Register Link -->
                    <div class="text-center mt-3">
                      <h6 class="fw-normal fs-14 text-dark mb-0">
                        Don’t have an account yet?
                        <a href="register" class="hover-a">Register</a>
                      </h6>
                    </div>
                  </div><!-- end card body -->
                </div><!-- end card -->
              </div>
            </form>

          </div><!-- end col -->
        </div>
        <!-- end row -->

      </div>
    </div>
    <!-- End Content -->

  </div>
</body>
</html>
