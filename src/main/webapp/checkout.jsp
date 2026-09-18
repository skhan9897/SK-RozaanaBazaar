<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .checkout-step { background: #fff; border-radius: 2px; margin-bottom: 12px; box-shadow: 0 2px 4px 0 rgba(0,0,0,.08); }
        .step-header { background: #f5f7fa; padding: 15px 20px; display: flex; align-items: center; color: #878787; font-weight: 500; text-transform: uppercase; font-size: 14px; }
        .step-header.active { background: var(--primary-blue); color: #fff; }
        .step-number { background: #eee; color: var(--primary-blue); width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; border-radius: 2px; margin-right: 15px; font-size: 12px; }
        .step-header.active .step-number { background: #fff; }
        .step-body { padding: 20px; }
        .price-sidebar { position: sticky; top: 70px; }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-3">
        <div class="row">
            <div class="col-lg-8 col-12">
                <form action="CheckoutServlet" method="POST">
                    <!-- Step 1: Login -->
                    <div class="checkout-step">
                        <div class="step-header">
                            <span class="step-number">1</span>
                            <span>Login</span>
                            <c:if test="${not empty user}">
                                <i class="fas fa-check text-success ml-auto"></i>
                            </c:if>
                        </div>
                        <div class="step-body">
                            <div class="d-flex align-items-center">
                                <span class="font-weight-bold mr-2">${user.name}</span>
                                <span class="text-muted small">+91 ${user.mobile}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Step 2: Delivery Address -->
                    <div class="checkout-step">
                        <div class="step-header active">
                            <span class="step-number">2</span>
                            <span>Delivery Address</span>
                        </div>
                        <div class="step-body">
                            <div class="bg-light p-3 border rounded mb-3">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="addr1" name="addressSelect" class="custom-control-input" checked>
                                    <label class="custom-control-label font-weight-bold" for="addr1">${user.name} <span class="badge badge-secondary ml-2">HOME</span></label>
                                    <p class="small mb-0 mt-1">${user.address}, ${user.city}, ${user.state} - <span class="font-weight-bold">${user.pincode}</span></p>
                                </div>
                            </div>
                            <div class="form-group mb-0">
                                <label class="small text-muted font-weight-bold">CHANGE OR ADD ADDRESS</label>
                                <textarea name="address" class="form-control" rows="2" style="border: 1px dashed #ccc;">${user.address}, ${user.city}, ${user.state} - ${user.pincode}</textarea>
                            </div>
                            <button type="button" class="btn btn-orange px-5 mt-3 shadow-sm font-weight-bold">DELIVER HERE</button>
                        </div>
                    </div>

                    <!-- Step 3: Order Summary -->
                    <div class="checkout-step">
                        <div class="step-header">
                            <span class="step-number">3</span>
                            <span>Order Summary</span>
                        </div>
                        <div class="step-body small text-muted">
                            Order summary will be visible here.
                        </div>
                    </div>

                    <!-- Step 4: Payment Options -->
                    <div class="checkout-step">
                        <div class="step-header active">
                            <span class="step-number">4</span>
                            <span>Payment Options</span>
                        </div>
                        <div class="step-body">
                            <div class="custom-control custom-radio border-bottom pb-3 mb-3">
                                <input type="radio" id="upi" name="paymentMethod" value="UPI" class="custom-control-input" onclick="togglePay()">
                                <label class="custom-control-label font-weight-bold d-flex align-items-center" for="upi">
                                    <i class="fas fa-mobile-alt mr-3 text-primary"></i> UPI
                                </label>
                                <div id="upi-box" class="mt-3 pl-4" style="display:none;">
                                    <input type="text" class="form-control form-control-sm w-50" placeholder="Enter UPI ID">
                                    <button type="button" class="btn btn-primary btn-sm mt-2">VERIFY</button>
                                </div>
                            </div>

                            <div class="custom-control custom-radio border-bottom pb-3 mb-3">
                                <input type="radio" id="card" name="paymentMethod" value="Card" class="custom-control-input" onclick="togglePay()">
                                <label class="custom-control-label font-weight-bold" for="card">Credit / Debit / ATM Card</label>
                                <div id="card-box" class="mt-3 pl-4" style="display:none;">
                                    <input type="text" class="form-control form-control-sm mb-2" placeholder="Card Number">
                                    <div class="row">
                                        <div class="col-4"><input type="text" class="form-control form-control-sm" placeholder="MM/YY"></div>
                                        <div class="col-4"><input type="text" class="form-control form-control-sm" placeholder="CVV"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="custom-control custom-radio mb-3">
                                <input type="radio" id="cod" name="paymentMethod" value="Cash On Delivery" class="custom-control-input" checked onclick="togglePay()">
                                <label class="custom-control-label font-weight-bold" for="cod">Cash on Delivery</label>
                            </div>

                            <div class="mt-4 border-top pt-4">
                                <button type="submit" class="btn btn-orange px-5 py-3 font-weight-bold shadow-lg" ${empty user ? 'disabled' : ''}>CONFIRM ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Price Sidebar -->
            <div class="col-lg-4 col-12 d-none d-lg-block">
                <div class="bg-white-card price-sidebar">
                    <h6 class="text-uppercase text-secondary font-weight-bold p-3 border-bottom m-0">Price Details</h6>
                    <div class="p-3">
                        <div class="d-flex justify-content-between mb-3">
                            <span>Price</span>
                            <span>₹${totalAmount}</span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Delivery Charges</span>
                            <span class="text-success">FREE</span>
                        </div>
                        <div class="d-flex justify-content-between border-top border-dashed pt-3 font-weight-bold h5">
                            <span>Total Payable</span>
                            <span>₹${totalAmount}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function togglePay() {
            document.getElementById('upi-box').style.display = document.getElementById('upi').checked ? 'block' : 'none';
            document.getElementById('card-box').style.display = document.getElementById('card').checked ? 'block' : 'none';
        }
    </script>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
