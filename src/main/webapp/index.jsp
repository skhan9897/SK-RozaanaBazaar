<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKRozaanaBazaar - Online Shopping Site for Fashion, Electronics, Home & More</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Splash Screen -->
    <div id="splash-screen">
        <div class="splash-logo mb-3">
            <i class="fas fa-shopping-basket fa-3x"></i>
            <h2 class="mt-2 font-weight-bold">SK Rozaana Bazaar</h2>
        </div>
        <div class="loader"></div>
        <div class="mt-4 small text-uppercase font-weight-bold" style="letter-spacing: 2px; opacity: 0.8;">
            Experience Premium Shopping
        </div>
    </div>

    <%@ include file="includes/navbar.jsp" %>

    <!-- Secondary Category Nav -->
    <div class="cat-nav d-none d-md-block">
        <div class="container-premium d-flex justify-content-between">
            <c:forEach var="cat" items="${categories}" end="8">
                <a href="CategoryServlet?id=${cat.id}" class="cat-item">
                    <img src="https://via.placeholder.com/64?text=${cat.name.substring(0,1)}" alt="${cat.name}" style="width: 64px; height: 64px; object-fit: contain;" class="mb-1 category-icon-img" data-name="${cat.name}">
                    <span>${cat.name}</span>
                </a>
            </c:forEach>
        </div>
    </div>

    <div class="container-premium mt-2">
        <!-- Hero Banner Carousel -->
        <div id="heroCarousel" class="carousel slide shadow-sm mb-3" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#heroCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#heroCarousel" data-slide-to="1"></li>
                <li data-target="#heroCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" style="border-radius: 2px;">
                <div class="carousel-item active">
                    <img src="https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=1200&h=400&fit=crop" class="d-block w-100" alt="Banner 1">
                    <div class="carousel-caption d-none d-md-block text-left" style="left: 5%; bottom: 20%;">
                        <h2 class="display-4 font-weight-bold">Big Billion Days</h2>
                        <p class="h4">Up to 80% Off on Top Brands</p>
                        <a href="products.jsp" class="btn btn-primary mt-3">Shop Now</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200&h=400&fit=crop" class="d-block w-100" alt="Banner 2">
                </div>
                <div class="carousel-item">
                    <img src="https://images.unsplash.com/photo-1555421689-491a97ff2040?w=1200&h=400&fit=crop" class="d-block w-100" alt="Banner 3">
                </div>
            </div>
            <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </a>
            <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </a>
        </div>

        <!-- Deals of the Day -->
        <div class="bg-white-card p-3 mb-4">
            <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                <h4 class="m-0 font-weight-bold">Deals of the Day</h4>
                <a href="products.jsp" class="btn btn-primary btn-sm px-4">View All</a>
            </div>
            <div class="scroll-container">
                <c:forEach var="product" items="${products}" end="7">
                    <div class="scroll-item">
                        <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none text-dark">
                            <div class="product-card text-center">
                                <img src="https://via.placeholder.com/150" alt="${product.productName}" class="img-fluid deal-img" data-name="${product.productName}" loading="lazy">
                                <div class="product-name mt-2">${product.productName}</div>
                                <div class="text-success font-weight-bold">From ₹${product.finalPrice}</div>
                                <div class="text-muted small">${product.brand}</div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Featured Products Grid -->
        <div class="row">
            <div class="col-12">
                <div class="bg-white-card p-3 mb-4">
                    <h4 class="font-weight-bold mb-4">Suggested for You</h4>
                    <div class="row no-gutters">
                        <c:forEach var="product" items="${products}" begin="0">
                            <div class="col-lg-2 col-md-3 col-6 border">
                                <div class="product-card">
                                    <a href="ProductDetailsServlet?id=${product.id}">
                                        <div class="text-center mb-3" style="height: 180px; display: flex; align-items: center; justify-content: center;">
                                            <img src="https://via.placeholder.com/150" alt="${product.productName}" class="img-fluid grid-img" data-name="${product.productName}" style="max-height: 100%;" loading="lazy">
                                        </div>
                                    </a>
                                    <div class="product-brand">${product.brand}</div>
                                    <a href="ProductDetailsServlet?id=${product.id}"><div class="product-name text-truncate">${product.productName}</div></a>
                                    <div class="d-flex align-items-center mb-2">
                                        <span class="rating-badge">${product.rating} <i class="fas fa-star fa-xs"></i></span>
                                        <span class="text-muted small ml-2">(1,234)</span>
                                    </div>
                                    <div class="d-flex align-items-baseline">
                                        <span class="price-final">₹${product.finalPrice}</span>
                                        <span class="price-original">₹${product.price}</span>
                                        <span class="discount-text">${product.discount}% off</span>
                                    </div>
                                    <form action="AddToCartServlet" method="POST" class="mt-3">
                                        <input type="hidden" name="pid" value="${product.id}">
                                        <button type="submit" class="btn btn-orange btn-block btn-sm">Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${empty products}">
            <div class="text-center py-5 bg-white-card">
                <img src="https://static-assets-web.flixcart.com/www/linchpin/fk-cp-zion/img/error-no-search-results_2353c5.png" alt="No products" style="width: 200px;">
                <h4 class="mt-4">No products found</h4>
                <p class="text-muted">Try refreshing or check back later.</p>
                <a href="HomeServlet" class="btn btn-primary mt-2">Refresh</a>
            </div>
        </c:if>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Image mapping for premium look
            const images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=400",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=400",
                "Shirt": "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400",
                "Shoes": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400",
                "Watch": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400",
                "Headphones": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400",
                "Grocery": "https://images.unsplash.com/photo-1542838132-92c53300491e?w=200",
                "Mobile": "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200",
                "Fashion": "https://images.unsplash.com/photo-1445205170230-053b83016050?w=200",
                "Electronics": "https://images.unsplash.com/photo-1498049794561-7780e7231661?w=200",
                "Home": "https://images.unsplash.com/photo-1513694203232-719a280e022f?w=200",
                "Appliances": "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=200"
            };

            function setImages(selector) {
                document.querySelectorAll(selector).forEach(img => {
                    const name = img.getAttribute("data-name");
                    if (name) {
                        for (let key in images) {
                            if (name.toLowerCase().includes(key.toLowerCase())) {
                                img.src = images[key];
                                break;
                            }
                        }
                    }
                });
            }

            setImages(".grid-img");
            setImages(".deal-img");
            setImages(".category-icon-img");

            // Hide Splash
            setTimeout(() => {
                document.getElementById('splash-screen').classList.add('hidden');
            }, 2000);
        });
    </script>
</body>
</html>
