<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKRozanaBazaar - Online Shopping Site for Fashion, Electronics, Home & More</title>
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
            <h2 class="mt-2 font-weight-bold">SKRozanaBazaar</h2>
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
                        <h2 class="display-4 font-weight-bold">Mega Bazaar Days</h2>
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
        <div class="bg-white-card mb-4">
            <div class="section-header">
                <h4 class="section-title"><i class="fas fa-bolt text-warning mr-2"></i>Deals of the Day</h4>
                <a href="products.jsp" class="btn-view-all">VIEW ALL</a>
            </div>
            <div class="deals-grid">
                <c:forEach var="product" items="${products}" end="9">
                    <div class="product-card border-right border-bottom">
                        <div class="wishlist-icon"><i class="far fa-heart"></i></div>
                        <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                            <div class="image-container">
                                <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/200'}" alt="${product.productName}" class="img-fluid deal-img" data-name="${product.productName}" loading="lazy">
                            </div>
                        </a>
                        <div class="details">
                            <div class="product-brand">${not empty product.brand ? product.brand : 'SKR Choice'}</div>
                            <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                                <div class="product-name" title="${product.productName}">${not empty product.productName ? product.productName : 'Premium Quality Product'}</div>
                            </a>
                            <div class="product-desc">${not empty product.description ? product.description : 'Explore our premium collection'}</div>
                            <div class="rating-row">
                                <span class="rating-badge">${not empty product.rating && product.rating > 0 ? product.rating : '4.2'} <i class="fas fa-star fa-xs"></i></span>
                                <span class="review-count">(1,234)</span>
                            </div>
                            <div class="price-row">
                                <span class="price-final">₹${not empty product.finalPrice ? product.finalPrice : '0.00'}</span>
                                <span class="price-original">₹${not empty product.price ? product.price : '0.00'}</span>
                                <span class="discount-text">${not empty product.discount ? product.discount : '10'}% OFF</span>
                            </div>
                            <div class="stock-status ${product.stock > 0 ? 'in-stock' : 'out-of-stock'}">
                                ${product.stock > 0 ? 'In Stock' : 'Out of Stock'}
                            </div>
                            <div class="card-actions">
                                <form action="AddToCartServlet" method="POST" class="flex-grow-1">
                                    <input type="hidden" name="pid" value="${product.id}">
                                    <button type="submit" class="btn btn-white btn-block"><i class="fas fa-shopping-cart mr-1"></i> CART</button>
                                </form>
                                <a href="CheckoutServlet?pid=${product.id}" class="btn btn-orange flex-grow-1">BUY NOW</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Featured Products Grid -->
        <div class="row">
            <div class="col-12">
                <div class="bg-white-card mb-4">
                    <div class="section-header">
                        <h4 class="section-title"><i class="fas fa-thumbs-up text-primary mr-2"></i>Suggested for You</h4>
                        <a href="products.jsp" class="btn-view-all">VIEW ALL</a>
                    </div>
                    <div class="deals-grid">
                        <c:forEach var="product" items="${products}" begin="10">
                            <div class="product-card border-right border-bottom">
                                <div class="wishlist-icon"><i class="far fa-heart"></i></div>
                                <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                                    <div class="image-container">
                                        <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/200'}" alt="${product.productName}" class="img-fluid grid-img" data-name="${product.productName}" loading="lazy">
                                    </div>
                                </a>
                                <div class="details">
                                    <div class="product-brand">${not empty product.brand ? product.brand : 'Premium'}</div>
                                    <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                                        <div class="product-name">${not empty product.productName ? product.productName : 'Quality Item'}</div>
                                    </a>
                                    <div class="product-desc">${not empty product.description ? product.description : 'High-end features and style'}</div>
                                    <div class="rating-row">
                                        <span class="rating-badge">${not empty product.rating && product.rating > 0 ? product.rating : '4.5'} <i class="fas fa-star fa-xs"></i></span>
                                        <span class="review-count">(982)</span>
                                    </div>
                                    <div class="price-row">
                                        <span class="price-final">₹${not empty product.finalPrice ? product.finalPrice : '0.00'}</span>
                                        <span class="price-original">₹${not empty product.price ? product.price : '0.00'}</span>
                                        <span class="discount-text">${not empty product.discount ? product.discount : '15'}% OFF</span>
                                    </div>
                                    <div class="card-actions">
                                        <form action="AddToCartServlet" method="POST" class="flex-grow-1">
                                            <input type="hidden" name="pid" value="${product.id}">
                                            <button type="submit" class="btn btn-white btn-block">ADD TO CART</button>
                                        </form>
                                        <a href="CheckoutServlet?pid=${product.id}" class="btn btn-orange flex-grow-1">BUY NOW</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <c:if test="${empty products}">
            <div class="text-center py-5 bg-white-card">
                <div class="mb-4">
                    <i class="fas fa-search fa-5x text-muted opacity-50"></i>
                </div>
                <h4 class="mt-4">No products found</h4>
                <p class="text-muted">Try refreshing or initializing the database catalog.</p>
                <div class="d-flex justify-content-center mt-3">
                    <a href="HomeServlet" class="btn btn-primary mr-2">Refresh Page</a>
                    <a href="diagnostics?action=seed" class="btn btn-orange">Initialize Store Data</a>
                </div>
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
                    if (img.src.includes('via.placeholder.com')) {
                        const name = img.getAttribute("data-name");
                        if (name) {
                            for (let key in images) {
                                if (name.toLowerCase().includes(key.toLowerCase())) {
                                    img.src = images[key];
                                    break;
                                }
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
