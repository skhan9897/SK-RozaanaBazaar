<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>
    <div class="container mt-5">
        <h2>Search Results for "${searchQuery}"</h2>
        <hr>
        <div class="row">
            <c:choose>
                <c:when test="${not empty products}">
                    <c:forEach var="product" items="${products}">
                        <div class="col-md-3 mb-4">
                            <div class="card">
                                <img src="images/products/${product.image}" class="card-img-top" alt="${product.productName}">
                                <div class="card-body">
                                    <h5 class="card-title">${product.productName}</h5>
                                    <p class="card-text">${product.brand}</p>
                                    <p class="card-text text-success font-weight-bold">₹${product.finalPrice}</p>
                                    <a href="ProductDetailsServlet?id=${product.id}" class="btn btn-primary btn-block">View Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-12 text-center mt-5">
                        <div class="alert alert-info">
                            No products found matching your search.
                        </div>
                        <a href="index.jsp" class="btn btn-outline-primary">Go Back Home</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <%@ include file="includes/footer.jsp" %>
</body>
</html>
