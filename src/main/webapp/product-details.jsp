<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productName} | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .product-main-img-container { position: sticky; top: 70px; }
        .buy-now-btn { background: #ff9f00; color: #fff; font-size: 16px; padding: 18px; border-radius: 2px; }
        .add-cart-btn { background: #ff641b; color: #fff; font-size: 16px; padding: 18px; border-radius: 2px; }
        @media (max-width: 768px) {
            .action-buttons-desktop { display: none; }
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-3">
        <div class="bg-white-card p-3">
            <div class="row">
                <!-- Left Column: Images -->
                <div class="col-md-5">
                    <div id="productCarousel" class="carousel slide product-main-img-container border mb-3" data-ride="carousel">
                        <div class="carousel-inner p-3">
                            <div class="carousel-item active text-center">
                                <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/600'}" alt="${product.productName}" class="img-fluid" style="max-height: 450px; object-fit: contain;" loading="lazy">
                            </div>
                            <c:if test="${not empty product.image2}">
                                <div class="carousel-item text-center">
                                    <img src="${product.image2}" alt="${product.productName} 2" class="img-fluid" style="max-height: 450px; object-fit: contain;" loading="lazy">
                                </div>
                            </c:if>
                            <c:if test="${not empty product.image3}">
                                <div class="carousel-item text-center">
                                    <img src="${product.image3}" alt="${product.productName} 3" class="img-fluid" style="max-height: 450px; object-fit: contain;" loading="lazy">
                                </div>
                            </c:if>
                            <c:if test="${not empty product.image4}">
                                <div class="carousel-item text-center">
                                    <img src="${product.image4}" alt="${product.productName} 4" class="img-fluid" style="max-height: 450px; object-fit: contain;" loading="lazy">
                                </div>
                            </c:if>
                        </div>
                        <c:if test="${not empty product.image2}">
                            <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true" style="filter: invert(100%);"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true" style="filter: invert(100%);"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>

                        <!-- Thumbnails -->
                        <div class="d-flex justify-content-center mt-2 pb-2">
                             <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/600'}" class="img-thumbnail mr-1" style="width: 50px; height: 50px; cursor: pointer; object-fit: cover;" onclick="$('#productCarousel').carousel(0)">
                             <c:if test="${not empty product.image2}"><img src="${product.image2}" class="img-thumbnail mr-1" style="width: 50px; height: 50px; cursor: pointer; object-fit: cover;" onclick="$('#productCarousel').carousel(1)"></c:if>
                             <c:if test="${not empty product.image3}"><img src="${product.image3}" class="img-thumbnail mr-1" style="width: 50px; height: 50px; cursor: pointer; object-fit: cover;" onclick="$('#productCarousel').carousel(2)"></c:if>
                             <c:if test="${not empty product.image4}"><img src="${product.image4}" class="img-thumbnail" style="width: 50px; height: 50px; cursor: pointer; object-fit: cover;" onclick="$('#productCarousel').carousel(3)"></c:if>
                        </div>
                    </div>

                    <div class="action-buttons-desktop row no-gutters">
                        <div class="col-6 pr-1">
                            <form action="AddToCartServlet" method="POST">
                                <input type="hidden" name="pid" value="${product.id}">
                                <button type="submit" class="btn btn-block py-3 font-weight-bold" style="background: #ff9f00; color: #fff; border-radius: 2px;">
                                    <i class="fas fa-shopping-cart mr-2"></i> ADD TO CART
                                </button>
                            </form>
                        </div>
                        <div class="col-6 pl-1">
                            <button class="btn btn-block py-3 font-weight-bold btn-orange">
                                <i class="fas fa-bolt mr-2"></i> BUY NOW
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Details -->
                <div class="col-md-7">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-transparent p-0 small">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="products.jsp">Products</a></li>
                            <li class="breadcrumb-item active">${product.productName}</li>
                        </ol>
                    </nav>

                    <h2 class="font-weight-bold mb-1">${product.productName}</h2>
                    <div class="d-flex align-items-center mb-2">
                        <span class="rating-badge">${product.rating} <i class="fas fa-star fa-xs"></i></span>
                        <span class="text-muted small ml-2 font-weight-bold">12,456 Ratings & 1,234 Reviews</span>
                        <span class="badge badge-primary px-2 py-1 ml-3" style="font-size: 12px;">SK ASSURED</span>
                    </div>

                    <div class="mt-3">
                        <span class="text-success font-weight-bold small">Special Price</span>
                        <div class="d-flex align-items-baseline">
                            <h2 class="font-weight-bold mr-3">₹${product.finalPrice}</h2>
                            <h5 class="text-muted mr-3"><del>₹${product.price}</del></h5>
                            <h5 class="text-success font-weight-bold">${product.discount}% off</h5>
                        </div>
                        <p class="text-success font-weight-bold small">+ ₹29 Secured Packaging Fee</p>
                    </div>

                    <div class="mt-4">
                        <h6 class="font-weight-bold">Available offers</h6>
                        <ul class="list-unstyled small">
                            <li class="mb-2"><i class="fas fa-tag text-success mr-2"></i> <span class="font-weight-bold">Bank Offer</span> 10% off on SBI Credit Card, up to ₹1750, on orders of ₹5000 and above <a href="#" class="text-primary font-weight-bold">T&C</a></li>
                            <li class="mb-2"><i class="fas fa-tag text-success mr-2"></i> <span class="font-weight-bold">Bank Offer</span> 10% off on SBI Credit Card EMI transactions, up to ₹2250, on orders of ₹5000 and above <a href="#" class="text-primary font-weight-bold">T&C</a></li>
                            <li class="mb-2"><i class="fas fa-tag text-success mr-2"></i> <span class="font-weight-bold">Partner Offer</span> Sign up for SKRozana Pay Later and get Bazaar Gift Card worth up to ₹500* <a href="#" class="text-primary font-weight-bold">Know More</a></li>
                        </ul>
                    </div>

                    <hr>

                    <div class="row mb-4">
                        <div class="col-3"><span class="text-muted small font-weight-bold">Brand</span></div>
                        <div class="col-9"><span>${product.brand}</span></div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-3"><span class="text-muted small font-weight-bold">Highlights</span></div>
                        <div class="col-9">
                            <ul class="small pl-3">
                                <li>Authentic quality guaranteed</li>
                                <li>7 Days Replacement Policy</li>
                                <li>Cash on Delivery available</li>
                            </ul>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-3"><span class="text-muted small font-weight-bold">Description</span></div>
                        <div class="col-9"><p class="small text-justify">${product.description}</p></div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-3"><span class="text-muted small font-weight-bold">Seller</span></div>
                        <div class="col-9"><span class="text-primary font-weight-bold">SK Retailer</span> <span class="badge badge-primary ml-2">4.8 ★</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sticky Buy Buttons (Mobile Only) -->
    <div class="sticky-buttons d-md-none">
        <form action="AddToCartServlet" method="POST" class="flex-grow-1">
            <input type="hidden" name="pid" value="${product.id}">
            <button type="submit" class="btn btn-block font-weight-bold h-100" style="background: #fff; color: #212121; border-top: 1px solid #ddd;">
                ADD TO CART
            </button>
        </form>
        <button class="btn btn-orange flex-grow-1 font-weight-bold">BUY NOW</button>
    </div>

    <div class="mb-5 pb-5"></div>

    <%@ include file="includes/footer.jsp" %>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Carousel initialization if needed
            $('#productCarousel').carousel({
                interval: false
            });

            const images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=800",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=800",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=800",
                "Shirt": "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=800",
                "Shoes": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800",
                "Watch": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800",
                "Earbuds": "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=800"
            };

            const mainImg = document.querySelector("#productCarousel .carousel-item.active img");
            if (mainImg && mainImg.src.includes('via.placeholder.com')) {
                const name = "${product.productName}";
                for (let key in images) {
                    if (name.toLowerCase().includes(key.toLowerCase())) {
                        mainImg.src = images[key];
                        // Also update thumbnail
                        document.querySelector(".img-thumbnail").src = images[key];
                        break;
                    }
                }
            }
        });
    </script>
</body>
</html>
