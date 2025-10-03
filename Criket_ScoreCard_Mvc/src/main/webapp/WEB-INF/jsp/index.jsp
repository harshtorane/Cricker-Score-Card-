<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | Kanakku</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="shortcut icon" href="<c:url value='/assets/img/favicon.png' />" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css' />">

    <!-- Tabler Icons -->
    <link rel="stylesheet" href="<c:url value='/assets/plugins/tabler-icons/tabler-icons.min.css' />">

    <!-- Iconsax -->
    <link rel="stylesheet" href="<c:url value='/assets/css/iconsax.css' />">

    <!-- Custom Main CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
</head>

<body class="bg-white">
    <div class="main-wrapper auth-bg">
        <div class="container-fluid">
            <div class="row justify-content-center align-items-center vh-100">
                <div class="col-lg-4">
                    <form action="/login" method="post">
                        <div class="card p-4 shadow-lg">
                            <div class="text-center mb-3">
                                <img src="<c:url value='/assets/img/logo.svg' />" alt="Logo" class="img-fluid" />
                                <h5 class="mt-3">Welcome Back!</h5>
                            </div>
                            <div class="mb-3">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter email" />
                            </div>
                            <div class="mb-3">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password" placeholder="Enter password" />
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<c:url value='/assets/js/jquery-3.7.1.min.js' />"></script>

    <!-- Bootstrap Bundle -->
    <script src="<c:url value='/assets/js/bootstrap.bundle.min.js' />"></script>

    <!-- Custom Script -->
    <script src="<c:url value='/assets/js/script.js' />"></script>
</body>
</html>
