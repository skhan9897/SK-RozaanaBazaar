<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body { background-color: #f1f3f6; }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container auth-container">
        <div class="auth-card">
            <!-- Sidebar -->
            <div class="auth-sidebar d-none d-md-block">
                <h2 class="font-weight-bold mb-4">Login</h2>
                <p class="h5" style="line-height: 1.5; opacity: 0.8;">Get access to your Orders, Wishlist and Recommendations</p>
                <div style="margin-top: 150px;">
                    <img src="https://static-assets-web.flixcart.com/www/linchpin/fk-cp-zion/img/login_img_c4a81e.png" class="img-fluid" alt="login-icon">
                </div>
            </div>

            <!-- Form Side -->
            <div class="auth-form-side">
                <c:if test="${not empty successMsg}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${successMsg}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                </c:if>
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${errorMsg}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                </c:if>

                <form action="login" method="POST">
                    <div class="form-group mb-4">
                        <label class="text-secondary small font-weight-bold">EMAIL ADDRESS</label>
                        <input type="email" name="email" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                    </div>
                    <div class="form-group mb-4">
                        <label class="text-secondary small font-weight-bold">PASSWORD</label>
                        <input type="password" name="password" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                    </div>

                    <p class="small text-secondary mb-4">By continuing, you agree to SKRozaanaBazaar's <a href="#" class="text-primary">Terms of Use</a> and <a href="#" class="text-primary">Privacy Policy</a>.</p>

                    <button type="submit" class="btn btn-orange btn-block py-3 shadow">Login</button>
                </form>

                <div class="text-center mt-5">
                    <a href="register.jsp" class="text-primary font-weight-bold">New to SKRozaanaBazaar? Create an account</a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
