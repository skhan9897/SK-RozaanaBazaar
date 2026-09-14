<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5">
        <h2>Your Shopping Cart 🛒</h2>
        <hr>
        <div class="row">
            <div class="col-md-8">
                <c:choose>
                    <c:when test="${not empty cartItems}">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${cartItems}">
                                    <tr>
                                        <td>
                                            <img src="images/products/${item.productImage}" style="width: 50px; height: 50px;" class="mr-2">
                                            ${item.productName}
                                        </td>
                                        <td>₹${item.price}</td>
                                        <td>
                                            <form action="CartServlet" method="POST" class="form-inline">
                                                <input type="hidden" name="action" value="updateQuantity">
                                                <input type="hidden" name="cartId" value="${item.id}">
                                                <input type="number" name="quantity" value="${item.quantity}" min="1" max="100" class="form-control form-control-sm mr-2" style="width: 65px;" onchange="this.form.submit()">
                                            </form>
                                        </td>
                                        <td>₹${item.price * item.quantity}</td>
                                        <td>
                                            <a href="RemoveCartServlet?id=${item.id}" class="btn btn-danger btn-sm">Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning">Your cart is empty! <a href="index.jsp">Continue shopping</a></div>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:if test="${not empty cartItems}">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Order Summary</h5>
                            <hr>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Subtotal</span>
                                <span>₹${totalAmount}</span>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Shipping</span>
                                <span class="text-success">FREE</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between mb-4">
                                <strong>Total</strong>
                                <strong class="text-primary">₹${totalAmount}</strong>
                            </div>
                            <a href="checkout.jsp" class="btn btn-success btn-block">Proceed to Checkout</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
