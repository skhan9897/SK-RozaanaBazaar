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
                            <div class="row no-gutters border-top">
                                <c:forEach var="product" items="${products}">
                                    <div class="col-lg-3 col-md-4 col-6 border-right border-bottom">
                                        <div class="product-card">
                                            <a href="ProductDetailsServlet?id=${product.id}">
                                                <div class="text-center mb-3" style="height: 180px; display: flex; align-items: center; justify-content: center;">
                                                    <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/150'}" alt="${product.productName}" class="img-fluid prod-img" data-name="${product.productName}" style="max-height: 100%;" loading="lazy">
                                                </div>
                                            </a>
                                            <div class="product-brand">${product.brand}</div>
                                            <a href="ProductDetailsServlet?id=${product.id}"><div class="product-name text-truncate" title="${product.productName}">${product.productName}</div></a>
                                            <div class="d-flex align-items-center mb-2">
                                                <span class="rating-badge">${product.rating} <i class="fas fa-star fa-xs"></i></span>
                                                <span class="text-muted small ml-2">(1,234)</span>
                                            </div>
                                            <div class="d-flex align-items-baseline">
                                                <span class="price-final">₹${product.finalPrice}</span>
                                                <span class="price-original">₹${product.price}</span>
                                                <span class="discount-text">${product.discount}% off</span>
                                            </div>
                                            <div class="mt-2">
                                                <span class="badge badge-primary px-2 py-1" style="font-size: 10px;">SK ASSURED</span>
                                            </div>
                                            <form action="AddToCartServlet" method="POST" class="mt-3">
                                                <input type="hidden" name="pid" value="${product.id}">
                                                <button type="submit" class="btn btn-orange btn-block btn-sm">Add to Cart</button>
                                            </form>
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
            const images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=400",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=400",
                "Shirt": "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400",
                "Shoes": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400",
                "Watch": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400",
                "Earbuds": "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=400"
            };

            document.querySelectorAll(".prod-img").forEach(img => {
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
        });
    </script>
</body>
</html>
