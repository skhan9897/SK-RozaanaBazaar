<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5">
        <h2>Checkout</h2>
        <hr>
        <form action="CheckoutServlet" method="POST">
            <div class="row">
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header">
                            <h5>Shipping Address</h5>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Full Address</label>
                                <textarea name="address" class="form-control" rows="3" required>${user.address}, ${user.city}, ${user.state} - ${user.pincode}</textarea>
                            </div>
                            <h5 class="mt-4">Payment Method</h5>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="cod" name="paymentMethod" class="custom-control-input" value="Cash On Delivery" checked>
                                <label class="custom-control-label" for="cod">Cash On Delivery</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="upi" name="paymentMethod" class="custom-control-input" value="UPI">
                                <label class="custom-control-label" for="upi">UPI</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" id="card" name="paymentMethod" class="custom-control-input" value="Card">
                                <label class="custom-control-label" for="card">Card</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            <h5>Order Summary</h5>
                        </div>
                        <div class="card-body">
                            <c:if test="${empty sessionScope.user}">
                                <div class="alert alert-danger">Please login to checkout.</div>
                            </c:if>
                            <!-- In a real app we'd fetch cart items again to show summary here -->
                            <p>You are about to place an order.</p>
                            <button type="submit" class="btn btn-primary btn-block btn-lg">Place Order</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
