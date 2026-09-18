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
        <div class="container-premium">
            <div class="cat-list">
                <c:forEach var="cat" items="${categories}">
                    <a href="CategoryServlet?id=${cat.id}" class="cat-item text-decoration-none">
                        <img src="${not empty cat.image ? cat.image : 'https://via.placeholder.com/64?text=' + cat.name.substring(0,1)}" alt="${cat.name}">
                        <span>${cat.name}</span>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>

    <div class="container-premium mt-2">
        <!-- Hero Banner Carousel -->
        <div id="heroCarousel" class="carousel slide bg-white-card shadow-sm mb-3" data-ride="carousel">
            <div class="carousel-inner" style="border-radius: 2px;">
                <div class="carousel-item active">
                    <img src="https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=1200&h=400&fit=crop" class="d-block w-100" alt="Banner 1">
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
            <div class="product-grid">
                <c:forEach var="product" items="${products}" end="9">
                    <div class="product-card">
                        <div class="wishlist-icon"><i class="far fa-heart"></i></div>
                        <c:if test="${product.discount > 0}">
                            <div class="discount-badge">${product.discount}% OFF</div>
                        </c:if>
                        <c:if test="${product.has360}">
                            <div class="badge badge-info position-absolute" style="top: 40px; left: 10px; z-index: 5; font-size: 10px;">
                                🔄 360°
                            </div>
                        </c:if>
                        <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                            <div class="product-image-container">
                                <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/400?text=No+Image'}" alt="${product.productName}" class="product-image" loading="lazy">
                            </div>
                        </a>
                        <div class="product-details">
                            <div class="product-brand">${not empty product.brand ? product.brand : 'SKR Bazaar'}</div>
                            <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                                <div class="product-name" title="${product.productName}">${product.productName}</div>
                            </a>
                            <div class="product-short-desc">${product.description}</div>
                            <div class="rating-row">
                                <span class="rating-badge">${product.rating > 0 ? product.rating : '4.4'} <i class="fas fa-star fa-xs"></i></span>
                                <span class="review-count">(1,234 Reviews)</span>
                            </div>
                            <div class="price-row">
                                <span class="price-final">₹${product.finalPrice}</span>
                                <span class="price-original">₹${product.price}</span>
                                <span class="discount-text">${product.discount}% OFF</span>
                            </div>
                            <div class="stock-status ${product.stock > 0 ? 'in-stock' : 'out-of-stock'}">
                                <c:choose>
                                    <c:when test="${product.stock > 0}">✓ In Stock</c:when>
                                    <c:otherwise>Out of Stock</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="product-actions">
                                <form action="AddToCartServlet" method="POST" class="flex-grow-1">
                                    <input type="hidden" name="pid" value="${product.id}">
                                    <button type="submit" class="btn btn-white btn-block">ADD TO CART</button>
                                </form>
                                <a href="CheckoutServlet?pid=${product.id}" class="btn btn-orange">BUY NOW</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- All Products with Sorting and Load More -->
        <div class="bg-white-card mb-4">
            <div class="section-header border-bottom">
                <h4 class="section-title"><i class="fas fa-list-ul text-secondary mr-2"></i>All Products</h4>
                <div class="d-flex align-items-center">
                    <select id="sortSelector" class="form-control form-control-sm mr-3" style="width: auto;">
                        <option value="newest" ${currentSort == 'newest' ? 'selected' : ''}>Newest First</option>
                        <option value="priceLow" ${currentSort == 'priceLow' ? 'selected' : ''}>Price: Low to High</option>
                        <option value="priceHigh" ${currentSort == 'priceHigh' ? 'selected' : ''}>Price: High to Low</option>
                        <option value="rating" ${currentSort == 'rating' ? 'selected' : ''}>Customer Rating</option>
                        <option value="discount" ${currentSort == 'discount' ? 'selected' : ''}>Biggest Discounts</option>
                    </select>
                </div>
            </div>
            <div id="productGrid" class="product-grid">
                <c:forEach var="product" items="${products}">
                    <div class="product-card">
                        <div class="wishlist-icon"><i class="far fa-heart"></i></div>
                        <c:if test="${product.discount > 0}">
                            <div class="discount-badge">SAVE ₹${product.discount}</div>
                        </c:if>
                        <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                            <div class="product-image-container">
                                <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/400?text=No+Image'}" alt="${product.productName}" class="product-image" loading="lazy">
                            </div>
                        </a>
                        <div class="product-details">
                            <div class="product-brand">${product.brand}</div>
                            <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                                <div class="product-name" title="${product.productName}">${product.productName}</div>
                            </a>
                            <div class="rating-row">
                                <span class="rating-badge">${product.rating > 0 ? product.rating : '4.0'} <i class="fas fa-star fa-xs"></i></span>
                                <span class="review-count">(50+)</span>
                            </div>
                            <div class="price-row">
                                <span class="price-final">₹${product.finalPrice}</span>
                                <span class="price-original">₹${product.price}</span>
                                <span class="discount-text">Special Price</span>
                            </div>
                            <div class="product-actions">
                                <form action="AddToCartServlet" method="POST" class="flex-grow-1">
                                    <input type="hidden" name="pid" value="${product.id}">
                                    <button type="submit" class="btn btn-white btn-block">ADD TO CART</button>
                                </form>
                                <a href="CheckoutServlet?pid=${product.id}" class="btn btn-orange">BUY NOW</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="text-center py-4 border-top">
                <button id="btnLoadMore" class="btn btn-primary px-5 shadow-sm">
                    <span id="loadText">LOAD MORE PRODUCTS</span>
                    <span id="loadSpinner" class="spinner-border spinner-border-sm ml-2 d-none"></span>
                </button>
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
            let currentPage = ${currentPage};
            const pageSize = ${pageSize};
            let currentSort = '${currentSort}';
            const productGrid = document.getElementById('productGrid');
            const btnLoadMore = document.getElementById('btnLoadMore');
            const loadText = document.getElementById('loadText');
            const loadSpinner = document.getElementById('loadSpinner');
            const sortSelector = document.getElementById('sortSelector');

            // Handle Sorting
            if (sortSelector) {
                sortSelector.addEventListener('change', function() {
                    const sortValue = this.value;
                    window.location.href = 'index?sort=' + sortValue;
                });
            }

            // Handle Load More (AJAX)
            if (btnLoadMore) {
                btnLoadMore.addEventListener('click', function() {
                    currentPage++;

                    // Show loading state
                    loadText.innerText = "LOADING...";
                    loadSpinner.classList.remove('d-none');
                    btnLoadMore.disabled = true;

                    fetch(`index?ajax=true&page=${currentPage}&size=${pageSize}&sort=${currentSort}`)
                        .then(response => response.json())
                        .then(products => {
                            if (!products || products.length === 0) {
                                btnLoadMore.style.display = 'none';
                                return;
                            }

                            products.forEach(product => {
                                const card = createProductCard(product);
                                productGrid.appendChild(card);
                            });

                            // Reset button state
                            loadText.innerText = "LOAD MORE PRODUCTS";
                            loadSpinner.classList.add('d-none');
                            btnLoadMore.disabled = false;

                            if (products.length < pageSize) {
                                btnLoadMore.style.display = 'none';
                            }
                        })
                        .catch(error => {
                            console.error('Error loading products:', error);
                            btnLoadMore.disabled = false;
                            loadText.innerText = "LOAD MORE PRODUCTS";
                            loadSpinner.classList.add('d-none');
                        });
                });
            }

            function createProductCard(product) {
                const div = document.createElement('div');
                div.className = 'product-card fade-in';

                const discountBadge = product.discount > 0 ? `<div class="discount-badge">SAVE ₹${product.discount}</div>` : '';
                const rating = product.rating > 0 ? product.rating.toFixed(1) : '4.0';

                div.innerHTML = `
                    <div class="wishlist-icon"><i class="far fa-heart"></i></div>
                    ${discountBadge}
                    <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                        <div class="product-image-container">
                            <img src="${product.image || 'https://via.placeholder.com/400?text=No+Image'}"
                                 alt="${product.productName}" class="product-image" loading="lazy">
                        </div>
                    </a>
                    <div class="product-details">
                        <div class="product-brand">${product.brand || 'Premium'}</div>
                        <a href="ProductDetailsServlet?id=${product.id}" class="text-decoration-none">
                            <div class="product-name" title="${product.productName}">${product.productName}</div>
                        </a>
                        <div class="rating-row">
                            <span class="rating-badge">${rating} <i class="fas fa-star fa-xs"></i></span>
                            <span class="review-count">(50+)</span>
                        </div>
                        <div class="price-row">
                            <span class="price-final">₹${product.finalPrice}</span>
                            <span class="price-original">₹${product.price}</span>
                            <span class="discount-text">Special Price</span>
                        </div>
                        <div class="product-actions">
                            <form action="AddToCartServlet" method="POST" class="flex-grow-1">
                                <input type="hidden" name="pid" value="${product.id}">
                                <button type="submit" class="btn btn-white btn-block">ADD TO CART</button>
                            </form>
                            <a href="CheckoutServlet?pid=${product.id}" class="btn btn-orange">BUY NOW</a>
                        </div>
                    </div>
                `;

                // Attach error handler to new image
                const img = div.querySelector('img');
                img.onerror = function() {
                    this.onerror = null;
                    this.src = 'https://via.placeholder.com/400?text=Image+Unavailable';
                };

                return div;
            }

            // Hide Splash
            setTimeout(() => {
                const splash = document.getElementById('splash-screen');
                if (splash) {
                    splash.classList.add('hidden');
                    setTimeout(() => splash.style.display = 'none', 500);
                }
            }, 1500);
        });
    </script>
</body>
</html>
