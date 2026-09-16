<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Categories | SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .category-item-card {
            border: 1px solid #f0f0f0;
            transition: all 0.2s ease-in-out;
            border-radius: 4px;
            overflow: hidden;
            background: #fff;
        }
        .category-item-card:hover {
            box-shadow: 0 4px 12px 0 rgba(0,0,0,.12);
            transform: translateY(-2px);
        }
        .category-img-wrapper {
            background: #f9f9f9;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 160px;
        }
    </style>
</head>
<body style="background-color: #F1F3F6;">
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-4 mb-5">
        <div class="bg-white-card p-4">
            <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
                <h4 class="font-weight-bold m-0">Shop by Category</h4>
                <div class="text-muted small">Showing all available categories</div>
            </div>

            <div class="row">
                <c:choose>
                    <c:when test="${not empty categories}">
                        <c:forEach var="cat" items="${categories}">
                            <div class="col-lg-2 col-md-3 col-6 mb-4">
                                <a href="CategoryServlet?id=${cat.id}" class="text-decoration-none">
                                    <div class="category-item-card text-center h-100">
                                        <div class="category-img-wrapper">
                                            <c:set var="catImg" value="https://via.placeholder.com/150?text=${cat.name}" />
                                            <c:choose>
                                                <c:when test="${cat.id == 1}"><c:set var="catImg" value="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200" /></c:when>
                                                <c:when test="${cat.id == 2}"><c:set var="catImg" value="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=200" /></c:when>
                                                <c:when test="${cat.id == 3}"><c:set var="catImg" value="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200" /></c:when>
                                                <c:when test="${cat.id == 4}"><c:set var="catImg" value="https://images.unsplash.com/photo-1593305841991-05c297ba4575?w=200" /></c:when>
                                                <c:when test="${cat.id == 5}"><c:set var="catImg" value="https://images.unsplash.com/photo-1617137968427-85924c800a22?w=200" /></c:when>
                                                <c:when test="${cat.id == 6}"><c:set var="catImg" value="https://images.unsplash.com/photo-1618244972963-dbee1a7edc95?w=200" /></c:when>
                                            </c:choose>
                                            <img src="${catImg}" class="img-fluid" style="max-height: 100px; object-fit: contain;" alt="${cat.name}">
                                        </div>
                                        <div class="p-3">
                                            <h6 class="font-weight-bold text-dark mb-1" style="font-size: 0.95rem;">${cat.name}</h6>
                                            <span class="text-success small font-weight-bold">Shop Now</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- Fallback static categories for demo if no data -->
                        <div class="col-lg-2 col-md-3 col-6 mb-4">
                            <a href="#" class="text-decoration-none">
                                <div class="category-item-card text-center h-100">
                                    <div class="category-img-wrapper"><img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;"></div>
                                    <div class="p-3"><h6 class="font-weight-bold text-dark mb-1">Mobiles</h6><span class="text-success small font-weight-bold">Shop Now</span></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-2 col-md-3 col-6 mb-4">
                            <a href="#" class="text-decoration-none">
                                <div class="category-item-card text-center h-100">
                                    <div class="category-img-wrapper"><img src="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;"></div>
                                    <div class="p-3"><h6 class="font-weight-bold text-dark mb-1">Laptops</h6><span class="text-success small font-weight-bold">Shop Now</span></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-2 col-md-3 col-6 mb-4">
                            <a href="#" class="text-decoration-none">
                                <div class="category-item-card text-center h-100">
                                    <div class="category-img-wrapper"><img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;"></div>
                                    <div class="p-3"><h6 class="font-weight-bold text-dark mb-1">Electronics</h6><span class="text-success small font-weight-bold">Shop Now</span></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-2 col-md-3 col-6 mb-4">
                            <a href="#" class="text-decoration-none">
                                <div class="category-item-card text-center h-100">
                                    <div class="category-img-wrapper"><img src="https://images.unsplash.com/photo-1593305841991-05c297ba4575?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;"></div>
                                    <div class="p-3"><h6 class="font-weight-bold text-dark mb-1">Appliances</h6><span class="text-success small font-weight-bold">Shop Now</span></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-2 col-md-3 col-6 mb-4">
                            <a href="#" class="text-decoration-none">
                                <div class="category-item-card text-center h-100">
                                    <div class="category-img-wrapper"><img src="https://images.unsplash.com/photo-1617137968427-85924c800a22?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;"></div>
                                    <div class="p-3"><h6 class="font-weight-bold text-dark mb-1">Fashion</h6><span class="text-success small font-weight-bold">Shop Now</span></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-2 col-md-3 col-6 mb-4">
                            <a href="#" class="text-decoration-none">
                                <div class="category-item-card text-center h-100">
                                    <div class="category-img-wrapper"><img src="https://images.unsplash.com/photo-1618244972963-dbee1a7edc95?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;"></div>
                                    <div class="p-3"><h6 class="font-weight-bold text-dark mb-1">Home & Kitchen</h6><span class="text-success small font-weight-bold">Shop Now</span></div>
                                </div>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="mt-4 bg-white-card p-4">
            <h5 class="font-weight-bold mb-4">Why shop by category?</h5>
            <div class="row text-muted small">
                <div class="col-md-4 mb-3">
                    <p class="font-weight-bold text-dark">Easy Navigation</p>
                    <p>Find what you're looking for faster by browsing through organized product groups.</p>
                </div>
                <div class="col-md-4 mb-3">
                    <p class="font-weight-bold text-dark">Filter Options</p>
                    <p>Each category has specific filters like brand, price range, and features to narrow down your choices.</p>
                </div>
                <div class="col-md-4 mb-3">
                    <p class="font-weight-bold text-dark">Category Deals</p>
                    <p>Discover category-specific offers and discounts that help you save more on every purchase.</p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
