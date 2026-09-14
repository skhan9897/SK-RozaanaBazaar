<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5">
        <h2>My Orders</h2>
        <hr>
        <div class="row">
            <div class="col-md-12">
                <c:choose>
                    <c:when test="${not empty orders}">
                        <table class="table table-hover border">
                            <thead class="bg-light">
                                <tr>
                                    <th>Order #</th>
                                    <th>Date</th>
                                    <th>Total Amount</th>
                                    <th>Payment</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td class="font-weight-bold text-primary">${order.orderNumber}</td>
                                        <td>${order.createdAt}</td>
                                        <td>₹${order.totalAmount}</td>
                                        <td>${order.paymentMethod}</td>
                                        <td>
                                            <span class="badge badge-info">${order.orderStatus}</span>
                                        </td>
                                        <td>
                                            <a href="OrderDetailsServlet?id=${order.id}" class="btn btn-outline-primary btn-sm">View Details</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info">You haven't placed any orders yet. <a href="index.jsp">Start shopping</a></div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
