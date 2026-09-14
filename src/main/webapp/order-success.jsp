<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5 text-center">
        <div class="card p-5 shadow-sm">
            <h1 class="text-success">✔ Order Placed Successfully!</h1>
            <p class="lead mt-3">Thank you for shopping with SKRozaanaBazaar.</p>
            <h4 class="mt-4">Order Number: <span class="text-primary">${orderNumber}</span></h4>
            <p class="text-muted">You can track your order in the "My Orders" section.</p>
            <div class="mt-5">
                <a href="index.jsp" class="btn btn-primary btn-lg">Continue Shopping</a>
                <a href="OrderServlet" class="btn btn-outline-secondary btn-lg">View My Orders</a>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
