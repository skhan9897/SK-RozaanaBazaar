<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${not empty category ? category.name : 'Products'} | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-3">
        <div class="row no-gutters">
            <!-- Left Sidebar (Filters) -->
            <div class="col-lg-3 col-md-4 d-none d-md-block pr-2">
                <div class="bg-white-card p-3 mb-3">
                    <h5 class="font-weight-bold border-bottom pb-2 mb-3">Filters</h5>

                    <div class="filter-section mb-4">
                        <h6 class="text-uppercase small font-weight-bold mb-2">Categories</h6>
                        <ul class="list-unstyled pl-2">
                            <li><a href="products.jsp" class="text-primary font-weight-bold small"><i class="fas fa-chevron-left mr-1"></i> All Categories</a></li>
                            <c:if test="${not empty category}">
                                <li class="mt-2 pl-2"><span class="font-weight-bold">${category.name}</span></li>
                                <c:forEach var="sub" items="${subcategories}">
                                    <li class="pl-3 mt-1"><a href="CategoryServlet?id=${category.id}&subId=${sub.id}" class="text-dark small">${sub.name}</a></li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>

                    <div class="filter-section mb-4">
                        <h6 class="text-uppercase small font-weight-bold mb-2">Price</h6>
                        <div class="px-2">
                            <input type="range" class="custom-range" min="0" max="50000">
                            <div class="d-flex justify-content-between mt-2">
                                <span class="small border p-1 px-2">Min</span>
                                <span class="small border p-1 px-2">Max</span>
                            </div>
                        </div>
                    </div>

                    <div class="filter-section mb-4">
                        <h6 class="text-uppercase small font-weight-bold mb-2">Customer Ratings</h6>
                        <div class="custom-control custom-checkbox small mb-1">
                            <input type="checkbox" class="custom-control-input" id="rate4">
                            <label class="custom-control-label" for="rate4">4★ & above</label>
                        </div>
                        <div class="custom-control custom-checkbox small">
                            <input type="checkbox" class="custom-control-input" id="rate3">
                            <label class="custom-control-label" for="rate3">3★ & above</label>
                        </div>
                    </div>

                    <div class="filter-section">
                        <h6 class="text-uppercase small font-weight-bold mb-2">Availability</h6>
                        <div class="custom-control custom-checkbox small">
                            <input type="checkbox" class="custom-control-input" id="instock">
                            <label class="custom-control-label" for="instock">Include Out of Stock</label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Content (Product Grid) -->
            <div class="col-lg-9 col-md-8 col-12">
                <div class="bg-white-card p-3 mb-3">
                    <!-- Breadcrumbs & Sort -->
                    <div class="d-flex justify-content-between align-items-center flex-wrap mb-3 border-bottom pb-2">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-transparent p-0 m-0 small">
                                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                <c:if test="${not empty category}">
                                    <li class="breadcrumb-item active">${category.name}</li>
                                </c:if>
                            </ol>
                        </nav>
                        <div class="d-flex align-items-center">
                            <span class="small font-weight-bold mr-3">Sort By</span>
                            <a href="#" class="small text-primary font-weight-bold border-bottom border-primary mr-3">Relevance</a>
                            <a href="#" class="small text-dark mr-3">Popularity</a>
                            <a href="#" class="small text-dark mr-3">Price -- Low to High</a>
                            <a href="#" class="small text-dark">Price -- High to Low</a>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${not empty products}">
                            <div class="product-grid">
                                <c:forEach var="product" items="${products}">
                                    <div class="product-card">
                                        <c:if test="${product.discount > 0}">
                                            <div class="discount-badge">${product.discount}% OFF</div>
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
                                            <div class="rating-row">
                                                <span class="rating-badge">${product.rating > 0 ? product.rating : '4.4'} <i class="fas fa-star fa-xs"></i></span>
                                                <span class="review-count">(1,234)</span>
                                            </div>
                                            <div class="price-row">
                                                <span class="price-final">₹${not empty product.finalPrice and product.finalPrice > 0 ? product.finalPrice : product.price}</span>
                                                <c:if test="${product.discount > 0}">
                                                    <span class="price-original">₹${product.price}</span>
                                                    <span class="discount-text">${product.discount}% OFF</span>
                                                </c:if>
                                            </div>
                                            <div class="mt-2">
                                                <span class="badge badge-primary px-2 py-1" style="font-size: 10px;">SK ASSURED</span>
                                            </div>
                                            <div class="product-actions mt-auto">
                                                <form action="AddToCartServlet" method="POST" class="flex-grow-1">
                                                    <input type="hidden" name="pid" value="${product.id}">
                                                    <button type="submit" class="btn btn-white btn-block">ADD TO CART</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <div class="mb-4">
                                    <i class="fas fa-search-minus fa-5x text-muted opacity-50"></i>
                                </div>
                                <h4 class="mt-4">Sorry, no products found!</h4>
                                <p class="text-muted">Try a different category or search term.</p>
                                <a href="index.jsp" class="btn btn-primary mt-2 px-5">Go to Homepage</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Remove JS keyword mapping logic.
            // All images are now correctly mapped in DB.
            document.querySelectorAll('img').forEach(img => {
                img.onerror = function() {
                    this.onerror = null;
                    this.src = 'https://via.placeholder.com/400?text=Image+Unavailable';
                };
            });
        });
    </script>
</body>
</html>
