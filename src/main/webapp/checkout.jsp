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
                            <div class="payment-methods mt-3">
                                <div class="custom-control custom-radio mb-2">
                                    <input type="radio" id="cod" name="paymentMethod" class="custom-control-input" value="Cash On Delivery" checked onclick="togglePaymentFields()">
                                    <label class="custom-control-label" for="cod"><i class="fa-solid fa-money-bill-1-wave mr-1 text-success"></i> Cash On Delivery</label>
                                </div>
                                <div class="custom-control custom-radio mb-2">
                                    <input type="radio" id="upi" name="paymentMethod" class="custom-control-input" value="UPI" onclick="togglePaymentFields()">
                                    <label class="custom-control-label" for="upi"><i class="fa-solid fa-mobile-screen-button mr-1 text-primary"></i> UPI Payment</label>
                                </div>
                                <div id="upi-field" class="ml-4 mb-3" style="display:none;">
                                    <input type="text" class="form-control form-control-sm" placeholder="Enter UPI ID (e.g., user@upi)">
                                </div>
                                <div class="custom-control custom-radio mb-2">
                                    <input type="radio" id="card" name="paymentMethod" class="custom-control-input" value="Card" onclick="togglePaymentFields()">
                                    <label class="custom-control-label" for="card"><i class="fa-solid fa-credit-card mr-1 text-info"></i> Debit / Credit Card</label>
                                </div>
                                <div id="card-fields" class="ml-4 mb-3" style="display:none;">
                                    <input type="text" class="form-control form-control-sm mb-2" placeholder="Card Number">
                                    <div class="row">
                                        <div class="col"><input type="text" class="form-control form-control-sm" placeholder="MM/YY"></div>
                                        <div class="col"><input type="text" class="form-control form-control-sm" placeholder="CVV"></div>
                                    </div>
                                </div>
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
                            <button type="submit" class="btn btn-primary btn-block btn-lg" ${empty sessionScope.user ? 'disabled' : ''}>Place Order</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        function togglePaymentFields() {
            document.getElementById('upi-field').style.display = document.getElementById('upi').checked ? 'block' : 'none';
            document.getElementById('card-fields').style.display = document.getElementById('card').checked ? 'block' : 'none';
        }
    </script>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
