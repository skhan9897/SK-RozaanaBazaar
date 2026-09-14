<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body { background-color: #f4f7f6; height: 100vh; display: flex; align-items: center; justify-content: center; }
        .success-card { background: white; padding: 40px; border-radius: 20px; text-align: center; box-shadow: 0 10px 40px rgba(0,0,0,0.1); max-width: 500px; }
        .credentials { background: #f8f9fa; border: 2px dashed #007bff; padding: 20px; border-radius: 10px; margin: 20px 0; }
    </style>
</head>
<body>

<div class="success-card">
    <div class="text-success mb-4">
        <i class="fas fa-check-circle fa-5x"></i>
    </div>
    <h2 class="font-weight-bold">Registration Successful!</h2>
    <p class="text-muted">Welcome to the Merchant Partnership Program. Your account has been created with the following credentials:</p>

    <div class="credentials">
        <div class="mb-2"><strong>Merchant ID:</strong> <span class="text-primary h4">${merchantId}</span></div>
        <div><strong>Temporary Password:</strong> <span class="text-danger h4">${password}</span></div>
    </div>

    <div class="alert alert-warning small">
        <strong>Important:</strong> Please save these credentials safely. You will need the Merchant ID to log in, and you can change your password from the dashboard settings.
    </div>

    <a href="merchant-login.jsp" class="btn btn-primary btn-lg btn-block font-weight-bold mt-4">Login to Merchant Dashboard</a>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
