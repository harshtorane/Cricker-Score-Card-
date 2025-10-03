<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body {
    background: url('assets/img/cricket-ground.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Segoe UI', sans-serif;
    position: relative;
}
body::before {
    content: "";
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    background: rgba(0,0,0,0.55);
}
.register-card {
    position: relative;
    z-index: 1;
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(10px);
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
    transition: transform 0.3s ease;
}
.register-card:hover { transform: translateY(-5px); }
.btn-cricket {
    background: linear-gradient(135deg, #007bff, #28a745);
    border: none;
    color: white;
    font-weight: 600;
}
.btn-cricket:hover { opacity: 0.9; }
h3 { font-weight: bold; color: #333; }
label { font-weight: 500; }

/* Registration Success GIF Overlay */
#gifOverlay {
    position: fixed;
    top:0; left:0;
    width:100%; height:100%;
    background: rgba(0,0,0,0.7);
    display:none;
    justify-content:center;
    align-items:center;
    z-index:9999;
    flex-direction: column;
    text-align: center;
}
#gifOverlay img { max-width: 50%; max-height: 50%; margin-bottom: 10px; }
#gifOverlay p { color: white; font-size: 1.5rem; font-weight: bold; }

/* OTP Sending Overlay (input वर) */
#otpOverlay {
    display:none;
    position:absolute;
    z-index:9999;
    text-align:center;
}
#otpOverlay img { width:50px; height:50px; display:block; margin:0 auto; }
#otpOverlay p { color:green; font-weight:bold; margin-top:5px; }
</style>
</head>
<body style="
  background-image: url('assets/img/bgcricket.png');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: fixed;
">

<!-- Registration Success GIF Overlay -->
<div id="gifOverlay">
    <img src="assets/img/akarshak-shot-anurag-shukla.gif" alt="Cricket Shot">
    <p>Registration Successful ✅</p>
</div>

<!-- OTP Sending Overlay -->
<div id="otpOverlay">
    <img src="assets/img/loding.gif" alt="Loading...">
    <p>OTP is sending...</p>
</div>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="col-lg-5 col-md-6 col-sm-8">
        <div class="register-card">
            <h3 class="text-center mb-4 text-dark">Register</h3>
            
            <form id="registerForm">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="fullname" class="form-control" placeholder="Enter your name" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <div class="input-group" style="position: relative;">
                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter email address" required>
                        <button type="button" id="sendOtpBtn" class="btn btn-cricket">Send OTP</button>
                    </div>
                    <small id="otpMsg" class="text-success"></small>
                </div>

                <div class="mb-3 d-none" id="otpField">
                    <label class="form-label">Enter OTP</label>
                    <input type="text" name="otp" id="otpInput" class="form-control" placeholder="Enter OTP">
                    <small id="verifyMsg" class="text-danger"></small>
                    <button type="button" class="btn btn-sm btn-success mt-2" id="verifyOtpBtn">Verify OTP</button>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                </div>

                <div class="d-grid">
                    <button type="submit" id="registerBtn" class="btn btn-cricket" disabled>Register</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){

    // Send OTP
    $("#sendOtpBtn").click(function(){
        let email = $("#email").val();
        if(email === ""){ alert("Please enter email first"); return; }

        // Overlay position near input
        let inputOffset = $("#email").offset();
        let inputHeight = $("#email").outerHeight();
        $("#otpOverlay").css({
            top: inputOffset.top + inputHeight/2 - 30 + "px",
            left: inputOffset.left + "px",
            width: $("#email").outerWidth() + "px"
        }).show();

        $("#sendOtpBtn").prop("disabled", true);

        $.ajax({
            url: "http://localhost:8080/api/otp/send-otp",
            type: "POST",
            data: { email: email },
            success: function(response){
                $("#otpOverlay").hide();
                $("#otpMsg").text(response).removeClass("text-danger").addClass("text-success");
                $("#otpField").removeClass("d-none").addClass("d-block");
                $("#sendOtpBtn").prop("disabled", false);
            },
            error: function(){
                $("#otpOverlay").hide();
                $("#otpMsg").text("Failed to send OTP. Try again.").removeClass("text-success").addClass("text-danger");
                $("#sendOtpBtn").prop("disabled", false);
            }
        });
    });

    // Verify OTP
    $("#verifyOtpBtn").click(function(){
        let email = $("#email").val();
        let otp = $("#otpInput").val();

        $.ajax({
            url: "http://localhost:8080/api/otp/verify-otp",
            type: "POST",
            data: { email: email, otp: otp },
            success: function(response){
                if(response.toLowerCase().includes("success")){
                    $("#verifyMsg").text("OTP Verified ✅").removeClass("text-danger").addClass("text-success");
                    $("#registerBtn").prop("disabled", false);
                } else {
                    $("#verifyMsg").text("Invalid OTP ❌").removeClass("text-success").addClass("text-danger");
                }
            },
            error: function(){
                $("#verifyMsg").text("Verification failed. Try again.").removeClass("text-success").addClass("text-danger");
            }
        });
    });

    // Register Form Submit
    $("#registerForm").submit(function(e){
        e.preventDefault();

        let data = {
            name: $("input[name='fullname']").val(),
            email: $("input[name='email']").val(),
            password: $("input[name='password']").val(),
            verified: true
        };

        $.ajax({
            url: "http://localhost:8080/api/user/register",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(response){
                $("#gifOverlay").fadeIn();

                setTimeout(function(){
                    $("#gifOverlay").fadeOut();
                    window.location.href = "login"; // redirect to login
                }, 3000);
            },
            error: function(err){
                alert("Registration failed! Try again.");
                console.log(err);
            }
        });
    });

});
</script>

</body>
</html>
