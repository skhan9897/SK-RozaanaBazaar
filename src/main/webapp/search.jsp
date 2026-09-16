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
                            <div class="card h-100 shadow-sm">
                                <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&auto=format&fit=crop&q=60" class="card-img-top p-3" alt="${product.productName}" data-name="<c:out value="${product.productName}"/>" style="height: 200px; object-fit: contain;">
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title font-weight-bold text-truncate">${product.productName}</h5>
                                    <p class="card-text text-muted small">${product.brand}</p>
                                    <p class="card-text text-primary font-weight-bold h5">₹${product.finalPrice}</p>
                                    <div class="mt-auto">
                                        <a href="ProductDetailsServlet?id=${product.id}" class="btn btn-primary btn-block">View Details</a>
                                    </div>
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
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500&auto=format&fit=crop",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=500&auto=format&fit=crop",
                "OnePlus": "https://images.unsplash.com/photo-1565630916779-e303be97b6f5?w=500&auto=format&fit=crop",
                "Nord": "https://images.unsplash.com/photo-1565630916779-e303be97b6f5?w=500&auto=format&fit=crop",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&auto=format&fit=crop",
                "Saree": "https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=500&auto=format&fit=crop",
                "Atta": "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&auto=format&fit=crop",
                "Rice": "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500&auto=format&fit=crop"
            };

            document.querySelectorAll(".card-img-top").forEach(function(imgElement) {
                var name = imgElement.getAttribute("data-name");
                if (name) {
                    for (var key in images) {
                        if (name.toLowerCase().includes(key.toLowerCase())) {
                            imgElement.src = images[key];
                            break;
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>
