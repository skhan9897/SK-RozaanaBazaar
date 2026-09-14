<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Merchant Login - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body { background-color: #1e1e24; height: 100vh; display: flex; align-items: center; justify-content: center; color: white; }
        .login-card { background: #2b2b36; padding: 40px; border-radius: 15px; width: 100%; max-width: 400px; box-shadow: 0 10px 30px rgba(0,0,0,0.5); }
        .form-control { background: #1e1e24; border: 1px solid #3f3f52; color: white; }
        .form-control:focus { background: #1e1e24; color: white; border-color: #007bff; }
        .btn-merchant { background: #007bff; border: none; font-weight: bold; padding: 12px; }
    </style>
</head>
<body>

<div class="login-card">
    <div class="text-center mb-4">
        <h3 class="font-weight-bold">MERCHANT LOGIN</h3>
        <p class="text-muted small">Enter your system-generated ID to continue</p>
    </div>

    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger py-2 small text-center">${errorMsg}</div>
    </c:if>

    <form action="MerchantLoginServlet" method="POST">
        <div class="form-group">
            <label>Merchant ID</label>
            <input type="text" name="merchantId" class="form-control" placeholder="E.g. SKR-MER-1234" required>
        </div>
        <div class="form-group mb-4">
            <label>Password</label>
            <input type="password" name="password" class="form-control" placeholder="••••••••" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block btn-merchant">Log In to Dashboard</button>
        <div class="text-center mt-4 small">
            New Merchant? <a href="merchant-register.jsp" class="text-info">Apply Now</a>
            <br><br>
            <a href="../index" class="text-muted"><i class="fas fa-arrow-left"></i> Back to Store</a>
        </div>
    </form>
</div>

</body>
</html>
