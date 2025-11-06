<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Heder.jsp" %>
<%@ include file="Footer.jsp" %>
<%@ include file="sidebar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Tournament</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css'/>">

    <style>
        body {
            background-color: #f8f9fa;
        }

        /* Main wrapper styling */
        .main-wrapper {
            display: flex;
            justify-content: center;   /* 🟢 keeps form center aligned */
            padding: 50px 0;
        }

        /* Form box styling */
        form {
            width: 55%;                /* Medium width for balanced layout */
            margin-left: 10%;          /* Light right shift (moves form slightly right) */
            padding: 30px 40px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        label {
            font-weight: 500;
            margin-top: 10px;
        }

        .btn-primary {
            margin-top: 15px;
        }

        /* 🟢 Responsive for mobile */
        @media (max-width: 768px) {
            .main-wrapper {
                justify-content: center;
                padding: 20px;
            }
            form {
                width: 90%;
                margin-left: 0;
                padding: 20px;
            }
        }
    </style>
</head>

<body>

    <!-- Begin Wrapper -->
    <div class="main-wrapper">

        <!-- Tournament Form Start -->
        <form action="tournament/save" method="post">

            <!-- Tournament Name -->
            <div class="form-group">
                <label for="tournamentName">Tournament / Series Name *</label>
                <input type="text" class="form-control" id="tournamentName" name="tournamentName" placeholder="Enter tournament name" required>
            </div>

            <!-- City and Ground Row -->
            <div class="row">
                <div class="col-md-6">
                    <label for="city">City</label>
                    <input type="text" class="form-control" id="city" name="city">
                </div>
                <div class="col-md-6">
                    <label for="ground">Ground *</label>
                    <input type="text" class="form-control" id="ground" name="ground" required>
                </div>
            </div>

            <!-- Organizer Details -->
            <div class="form-group">
                <label for="organizerName">Organiser Name</label>
                <input type="text" class="form-control" id="organizerName" name="organizerName">
            </div>

            <div class="form-group">
                <label for="organizerNumber">Organiser Number</label>
                <input type="tel" class="form-control" id="organizerNumber" name="organizerNumber">
            </div>

            <div class="form-group">
                <label for="organizerEmail">Organiser Email</label>
                <input type="email" class="form-control" id="organizerEmail" name="organizerEmail">
            </div>

            <!-- Tournament Dates -->
            <div class="form-group">
                <label>Start Date *</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label>End Date *</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>

            <!-- Tournament Category -->
            <div class="form-group">
                <label for="tournamentCategory">Tournament Category *</label>
                <select class="form-control" id="tournamentCategory" name="tournamentCategory" required>
                    <option value="">Select Category</option>
                    <option value="OPEN">OPEN</option>
                    <option value="CORPORATE">CORPORATE</option>
                    <option value="COMMUNITY">COMMUNITY</option>
                    <option value="SCHOOL">SCHOOL</option>
                    <option value="OTHER">OTHER</option>
                    <option value="SERIES">SERIES</option>
                    <option value="COLLEGE">COLLEGE</option>
                    <option value="UNIVERSITY">UNIVERSITY</option>
                </select>
            </div>

            <!-- Submit -->
            <button type="submit" class="btn btn-primary">Create Tournament</button>
        </form>
        <!-- Tournament Form End -->

    </div>
    <!-- End Wrapper -->

    <!-- jQuery -->
    <script src="<c:url value='/assets/js/jquery-3.7.1.min.js' />"></script>

    <!-- Bootstrap Bundle -->
    <script src="<c:url value='/assets/js/bootstrap.bundle.min.js' />"></script>

    <!-- Custom Script -->
    <script src="<c:url value='/assets/js/script.js' />"></script>

</body>
</html>
