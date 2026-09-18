<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-3">
        <div class="row">
            <!-- Sidebar (Optional) -->
            <div class="col-lg-3 d-none d-lg-block pr-2">
                <div class="bg-white-card p-0 mb-3 overflow-hidden">
                    <div class="p-3 bg-light border-bottom d-flex align-items-center">
                        <img src="https://via.placeholder.com/50" class="rounded-circle mr-3">
                        <div>
                            <div class="small text-muted">Hello,</div>
                            <div class="font-weight-bold">${user.name}</div>
                        </div>
                    </div>
                    <div class="p-3">
                        <a href="#" class="text-primary font-weight-bold d-block mb-3"><i class="fas fa-box mr-3"></i> MY ORDERS</a>
                        <a href="#" class="text-dark d-block mb-3"><i class="fas fa-user mr-3"></i> PROFILE SETTINGS</a>
                        <a href="#" class="text-dark d-block mb-3"><i class="fas fa-wallet mr-3"></i> PAYMENTS</a>
                        <a href="logout" class="text-dark d-block"><i class="fas fa-power-off mr-3"></i> LOGOUT</a>
                    </div>
                </div>
            </div>

            <!-- Orders List -->
            <div class="col-lg-9 col-12">
                <div class="bg-white-card p-3 mb-3 d-flex align-items-center">
                    <input type="text" class="form-control mr-3" placeholder="Search your orders here">
                    <button class="btn btn-primary px-4 btn-sm shadow-sm"><i class="fas fa-search mr-2"></i> SEARCH ORDERS</button>
                </div>

                <c:choose>
                    <c:when test="${not empty orders}">
                        <c:forEach var="order" items="${orders}">
                            <div class="bg-white-card p-3 mb-3 product-card">
                                <div class="row align-items-center">
                                    <div class="col-md-2 col-3 text-center">
                                        <i class="fas fa-box-open fa-3x text-muted opacity-50"></i>
                                    </div>
                                    <div class="col-md-4 col-9">
                                        <h6 class="font-weight-bold mb-1 text-primary">Order #${order.orderNumber}</h6>
                                        <p class="small text-muted mb-0">Placed on: ${order.createdAt}</p>
                                        <p class="small text-muted mb-0">Method: ${order.paymentMethod}</p>
                                    </div>
                                    <div class="col-md-2 col-6 mt-3 mt-md-0">
                                        <div class="font-weight-bold">₹${order.totalAmount}</div>
                                    </div>
                                    <div class="col-md-4 col-6 mt-3 mt-md-0">
                                        <div class="d-flex align-items-center">
                                            <div class="rounded-circle bg-success mr-2" style="width: 10px; height: 10px;"></div>
                                            <span class="font-weight-bold small">${order.orderStatus}</span>
                                        </div>
                                        <p class="small text-muted mt-1 mb-0">Your item has been delivered</p>
                                        <a href="OrderDetailsServlet?id=${order.id}" class="small text-primary font-weight-bold mt-2 d-inline-block">VIEW DETAILS</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5 bg-white-card">
                            <div class="mb-4">
                                <i class="fas fa-shopping-bag fa-5x text-muted opacity-50"></i>
                            </div>
                            <h4 class="mt-4">You have no orders</h4>
                            <a href="index.jsp" class="btn btn-primary mt-3 px-5">Start Shopping</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
