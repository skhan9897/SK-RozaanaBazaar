<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKRozanaBazaar - Online Shopping</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div id="splash-screen">
        <div class="splash-logo">
            <i class="fas fa-shopping-basket fa-3x"></i>
            <h2>SKRozanaBazaar</h2>
        </div>
        <div class="loader"></div>
    </div>

    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-3">
        <!-- Hero Banner -->
        <div id="heroCarousel" class="carousel slide shadow-sm mb-4" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=1200&h=400&fit=crop" class="d-block w-100" alt="Sale">
                </div>
            </div>
        </div>

        <!-- Product Sections -->
        <c:if test="${not empty products}">
            <div class="bg-white-card p-3 mb-4">
                <h4 class="mb-3 font-weight-bold">Deals of the Day</h4>
                <div class="product-grid">
                    <c:forEach var="p" items="${products}" end="9">
                        <div class="product-card">
                            <a href="ProductDetailsServlet?id=${p.id}">
                                <div class="product-image-container">
                                    <img src="${not empty p.image ? p.image : 'https://via.placeholder.com/400'}" alt="Product" class="product-image" loading="lazy">
                                </div>
                            </a>
                            <div class="product-details">
                                <div class="product-brand">${p.brand}</div>
                                <div class="product-name">${p.productName}</div>
                                <div class="price-row">
                                    <span class="price-final">₹${p.finalPrice}</span>
                                </div>
                                <div class="product-actions">
                                    <a href="CheckoutServlet?pid=${p.id}" class="btn btn-orange btn-block btn-sm mt-2">BUY NOW</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <c:if test="${empty products}">
            <div class="text-center py-5">
                <h4>Welcome to SKRozanaBazaar</h4>
                <p>We are initializing our premium catalog. Please wait...</p>
                <a href="index" class="btn btn-primary">Refresh Now</a>
            </div>
        </c:if>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        window.onload = function() {
            setTimeout(function() {
                const splash = document.getElementById('splash-screen');
                if (splash) splash.style.display = 'none';
            }, 1000);
        };
    </script>
</body>
</html>
