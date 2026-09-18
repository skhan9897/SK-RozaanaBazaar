<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>SKRozanaBazaar Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #1e1e24;
            color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            background-color: #2b2b36;
            border: 1px solid #3f3f52;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 420px;
            padding: 2.5rem;
        }
        .brand-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        .brand-logo {
            font-size: 2.5rem;
            color: #007bff;
            margin-bottom: 0.5rem;
        }
        .form-control {
            background-color: #1e1e24;
            border: 1px solid #3f3f52;
            color: #f8f9fa;
        }
        .form-control:focus {
            background-color: #1e1e24;
            border-color: #007bff;
            color: #f8f9fa;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
    </style>
</head>
<body>

<div class="login-card">
    <div class="brand-header">
        <div class="brand-logo"><i class="fas fa-shield-alt"></i></div>
        <h4 class="font-weight-bold">SKRozanaBazaar</h4>
        <small class="text-muted text-uppercase tracking-wider">Admin Login Portal</small>
    </div>

    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger text-center py-2" role="alert">
            <i class="fas fa-exclamation-circle mr-1"></i> ${errorMsg}
        </div>
    </c:if>

    <form action="AdminLoginServlet" method="POST">
        <div class="form-group">
            <label for="email"><i class="fas fa-envelope mr-1 text-muted"></i> Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="admin@skrozana.com" required>
        </div>
        <div class="form-group mb-4 d-flex justify-content-between">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" name="rememberMe" class="custom-control-input" id="rememberMe">
                <label class="custom-control-label small text-muted" for="rememberMe">Remember me</label>
            </div>
            <a href="#" class="small text-primary">Forgot Password?</a>
        </div>
        <button type="submit" class="btn btn-primary btn-block btn-lg font-weight-bold shadow-sm">
            Sign In <i class="fas fa-sign-in-alt ml-1"></i>
        </button>
        <div class="text-center mt-4">
            <hr class="border-secondary">
            <p class="text-muted small">Are you a business partner?</p>
            <a href="merchant-login.jsp" class="btn btn-outline-info btn-sm btn-block">
                <i class="fas fa-store mr-1"></i> Merchant Portal Login
            </a>
        </div>
        <div class="text-center mt-3">
            <a href="../index" class="small text-muted font-weight-bold"><i class="fas fa-arrow-left"></i> Back to Main Store</a>
        </div>
    </form>
</div>

</body>
</html>
