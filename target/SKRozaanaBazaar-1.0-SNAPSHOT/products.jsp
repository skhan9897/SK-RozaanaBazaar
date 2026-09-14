<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5">
        <div class="row">
            <c:choose>
                <c:when test="${not empty products}">
                    <c:forEach var="product" items="${products}">
                        <div class="col-md-3 mb-4">
                            <div class="card h-100">
                                <img src="images/products/${product.image}" class="card-img-top" alt="${product.productName}">
                                <div class="card-body">
                                    <h5 class="card-title">${product.productName}</h5>
                                    <p class="card-text text-muted small">${product.brand}</p>
                                    <h6 class="text-success font-weight-bold">₹${product.finalPrice} <span class="text-muted small"><del>₹${product.price}</del></span></h6>
                                    <a href="ProductDetailsServlet?id=${product.id}" class="btn btn-sm btn-primary btn-block">View Details</a>
                                    <form action="AddToCartServlet" method="POST" class="mt-2">
                                        <input type="hidden" name="pid" value="${product.id}">
                                        <button type="submit" class="btn btn-sm btn-outline-success btn-block">Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-12 text-center mt-5">
                        <div class="alert alert-info">No products found in this category.</div>
                        <a href="CategoryServlet" class="btn btn-outline-primary">Back to Categories</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
