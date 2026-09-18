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
                            <c:forEach var="galImg" items="${gallery}">
                                <c:if test="${galImg.imageType == 'NORMAL'}">
                                    <div class="carousel-item text-center">
                                        <img src="${galImg.imageUrl}" alt="${product.productName}" class="img-fluid" style="max-height: 450px; object-fit: contain;" loading="lazy">
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <c:if test="${not empty gallery}">
                            <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true" style="filter: invert(100%);"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true" style="filter: invert(100%);"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>

                        <c:if test="${not empty images360}">
                            <div class="btn-360" onclick="open360Viewer()" title="360° View" style="border-radius: 20px; width: auto; padding: 5px 15px; font-size: 14px; font-weight: bold; white-space: nowrap; display: flex; align-items: center; justify-content: center;">
                                🔄 360°
                            </div>
                        </c:if>

                        <!-- Thumbnails -->
                        <div class="d-flex justify-content-center mt-2 pb-2">
                             <img src="${not empty product.image ? product.image : 'https://via.placeholder.com/600'}" class="img-thumbnail mr-1" style="width: 50px; height: 50px; cursor: pointer; object-fit: cover;" onclick="$('#productCarousel').carousel(0)">
                             <c:forEach var="galImg" items="${gallery}" varStatus="status">
                                <img src="${galImg.imageUrl}" class="img-thumbnail mr-1" style="width: 50px; height: 50px; cursor: pointer; object-fit: cover;" onclick="$('#productCarousel').carousel(${status.index + 1})">
                             </c:forEach>
                        </div>
                    </div>

                    <!-- 360 Viewer Modal -->
                    <div id="v360Container" class="v360-container">
                        <span class="v360-close" onclick="close360Viewer()">&times;</span>
                        <div class="v360-viewer" id="v360Viewer">
                            <div id="v360Loader" class="v360-loader">Loading 360° View...</div>
                            <img id="v360Image" class="v360-image" src="">
                            <div class="v360-controls">
                                <button class="v360-btn" onclick="prevFrame()"><i class="fas fa-chevron-left"></i></button>
                                <button class="v360-btn" id="btnAutoRotate" onclick="toggleAutoRotate()"><i class="fas fa-sync-alt"></i></button>
                                <button class="v360-btn" onclick="nextFrame()"><i class="fas fa-chevron-right"></i></button>
                                <button class="v360-btn" onclick="reset360()"><i class="fas fa-undo"></i></button>
                            </div>
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
                            <h2 class="font-weight-bold mr-3">₹${not empty product.finalPrice and product.finalPrice > 0 ? product.finalPrice : product.price}</h2>
                            <c:if test="${product.discount > 0}">
                                <h5 class="text-muted mr-3"><del>₹${product.price}</del></h5>
                                <h5 class="text-success font-weight-bold">${product.discount}% off</h5>
                            </c:if>
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
        const frames360 = [
            <c:forEach var="img360" items="${images360}" varStatus="status">
                '${img360.imageUrl}'${not status.last ? ',' : ''}
            </c:forEach>
        ];

        let currentFrame = 0;
        let isDragging = false;
        let startX = 0;
        let autoRotateInterval = null;

        function open360Viewer() {
            document.getElementById('v360Container').style.display = 'flex';
            loadFrame(0);
            preloadImages();
        }

        function close360Viewer() {
            document.getElementById('v360Container').style.display = 'none';
            stopAutoRotate();
        }

        function preloadImages() {
            const loader = document.getElementById('v360Loader');
            let loadedCount = 0;
            frames360.forEach(src => {
                const img = new Image();
                img.onload = () => {
                    loadedCount++;
                    if (loadedCount === frames360.length) {
                        loader.style.display = 'none';
                    }
                };
                img.src = src;
            });
        }

        function loadFrame(index) {
            if (index < 0) index = frames360.length - 1;
            if (index >= frames360.length) index = 0;
            currentFrame = index;
            document.getElementById('v360Image').src = frames360[currentFrame];
        }

        function nextFrame() { loadFrame(currentFrame + 1); }
        function prevFrame() { loadFrame(currentFrame - 1); }
        function reset360() { loadFrame(0); stopAutoRotate(); }

        function toggleAutoRotate() {
            if (autoRotateInterval) {
                stopAutoRotate();
            } else {
                document.getElementById('btnAutoRotate').classList.add('text-primary');
                autoRotateInterval = setInterval(nextFrame, 150);
            }
        }

        function stopAutoRotate() {
            if (autoRotateInterval) {
                clearInterval(autoRotateInterval);
                autoRotateInterval = null;
                document.getElementById('btnAutoRotate').classList.remove('text-primary');
            }
        }

        // Drag & Touch Logic
        const viewer = document.getElementById('v360Viewer');

        viewer.addEventListener('mousedown', (e) => {
            isDragging = true;
            startX = e.pageX;
            stopAutoRotate();
        });

        window.addEventListener('mouseup', () => isDragging = false);

        window.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            const x = e.pageX;
            const diff = startX - x;
            if (Math.abs(diff) > 10) {
                if (diff > 0) nextFrame();
                else prevFrame();
                startX = x;
            }
        });

        // Touch Support
        viewer.addEventListener('touchstart', (e) => {
            isDragging = true;
            startX = e.touches[0].pageX;
            stopAutoRotate();
        });
        viewer.addEventListener('touchend', () => isDragging = false);
        viewer.addEventListener('touchmove', (e) => {
            if (!isDragging) return;
            const x = e.touches[0].pageX;
            const diff = startX - x;
            if (Math.abs(diff) > 10) {
                if (diff > 0) nextFrame();
                else prevFrame();
                startX = x;
            }
        });

        document.addEventListener("DOMContentLoaded", function() {
            // Carousel initialization
            $('#productCarousel').carousel({
                interval: false
            });

            // Handle broken images
            document.querySelectorAll('img').forEach(img => {
                img.onerror = function() {
                    this.onerror = null;
                    this.src = 'https://via.placeholder.com/600?text=Image+Unavailable';
                };
            });
        });
    </script>
</body>
</html>
