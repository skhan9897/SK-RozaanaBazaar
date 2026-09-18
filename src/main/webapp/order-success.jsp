<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed Successfully | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <div class="bg-white-card p-5">
                    <div class="mb-4">
                        <i class="fas fa-check-circle text-success fa-5x"></i>
                    </div>
                    <h1 class="font-weight-bold text-success mb-3">Order Placed Successfully!</h1>
                    <p class="h5 text-muted mb-4">Thank you for shopping with us. Your order has been received and is being processed.</p>

                    <div class="bg-light p-4 border rounded mb-5 d-inline-block px-5">
                        <div class="small text-uppercase text-secondary font-weight-bold mb-1">Order Number</div>
                        <div class="h4 font-weight-bold text-primary">${orderNumber}</div>
                    </div>

                    <div class="d-flex justify-content-center flex-wrap">
                        <a href="OrderServlet" class="btn btn-primary px-5 py-3 font-weight-bold shadow-sm m-2">VIEW MY ORDERS</a>
                        <a href="index.jsp" class="btn btn-white px-5 py-3 font-weight-bold shadow-sm m-2">CONTINUE SHOPPING</a>
                    </div>

                    <div class="mt-5 border-top pt-4 text-muted small">
                        <p>A confirmation email has been sent to your registered email address.</p>
                        <p>You can track the delivery status in your <a href="orders.jsp" class="text-primary">Order History</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
