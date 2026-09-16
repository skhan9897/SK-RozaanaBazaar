<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search: ${searchQuery} | SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-3">
        <div class="row no-gutters">
            <!-- Sidebar -->
            <div class="col-lg-3 d-none d-lg-block pr-2">
                <div class="bg-white-card p-3">
                    <h5 class="font-weight-bold border-bottom pb-2 mb-3">Filters</h5>
                    <div class="filter-section mb-4">
                        <h6 class="text-uppercase small font-weight-bold mb-2">Category</h6>
                        <ul class="list-unstyled pl-2 small">
                            <li><a href="#" class="text-dark">Electronics</a></li>
                            <li><a href="#" class="text-dark mt-1 d-block">Fashion</a></li>
                            <li><a href="#" class="text-dark mt-1 d-block">Home Decor</a></li>
                        </ul>
                    </div>
                    <div class="filter-section mb-4">
                        <h6 class="text-uppercase small font-weight-bold mb-2">Price Range</h6>
                        <select class="form-control form-control-sm">
                            <option>Min</option>
                            <option>₹500</option>
                            <option>₹1000</option>
                        </select>
                        <div class="text-center my-1 text-muted small">to</div>
                        <select class="form-control form-control-sm">
                            <option>Max</option>
                            <option>₹2000</option>
                            <option>₹5000</option>
                            <option>₹10000+</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Results -->
            <div class="col-lg-9 col-12">
                <div class="bg-white-card p-3 mb-3">
                    <div class="mb-3">
                        <span class="small text-muted">Showing results for </span>
                        <span class="font-weight-bold">"${searchQuery}"</span>
                    </div>

                    <c:choose>
                        <c:when test="${not empty products}">
                            <div class="row no-gutters">
                                <c:forEach var="product" items="${products}">
                                    <div class="col-lg-3 col-md-4 col-6 border">
                                        <div class="product-card">
                                            <a href="ProductDetailsServlet?id=${product.id}">
                                                <div class="text-center mb-3" style="height: 180px; display: flex; align-items: center; justify-content: center;">
                                                    <img src="https://via.placeholder.com/150" alt="${product.productName}" class="img-fluid search-img" data-name="${product.productName}" style="max-height: 100%;">
                                                </div>
                                            </a>
                                            <div class="product-brand">${product.brand}</div>
                                            <a href="ProductDetailsServlet?id=${product.id}"><div class="product-name text-truncate">${product.productName}</div></a>
                                            <div class="d-flex align-items-center mb-2">
                                                <span class="rating-badge">${product.rating} <i class="fas fa-star fa-xs"></i></span>
                                            </div>
                                            <div class="d-flex align-items-baseline">
                                                <span class="price-final">₹${product.finalPrice}</span>
                                                <span class="price-original small text-muted ml-2">₹${product.price}</span>
                                            </div>
                                            <a href="ProductDetailsServlet?id=${product.id}" class="btn btn-primary btn-block btn-sm mt-3">View Item</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <img src="https://static-assets-web.flixcart.com/www/linchpin/fk-cp-zion/img/error-no-search-results_2353c5.png" alt="No products" style="width: 200px;">
                                <h4 class="mt-4">No results found for "${searchQuery}"</h4>
                                <p class="text-muted">Try using more generic keywords or check your spelling.</p>
                                <a href="index.jsp" class="btn btn-primary mt-2">Go to Homepage</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=400",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=400",
                "Shoes": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"
            };

            document.querySelectorAll(".search-img").forEach(img => {
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
        });
    </script>
</body>
</html>
