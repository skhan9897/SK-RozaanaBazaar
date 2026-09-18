<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Wishlist | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .wishlist-item:hover {
            box-shadow: 0 4px 12px 0 rgba(0,0,0,.12);
        }
        .remove-icon {
            position: absolute;
            top: 20px;
            right: 20px;
            color: #c2c2c2;
            cursor: pointer;
        }
        .remove-icon:hover {
            color: #2874f0;
        }
    </style>
</head>
<body style="background-color: #F1F3F6;">
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-4 mb-5">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-3 d-none d-lg-block">
                <div class="bg-white-card p-3 mb-3 d-flex align-items-center">
                    <img src="https://ui-avatars.com/api/?name=${user.name}&background=2874F0&color=fff" width="50" class="mr-3 rounded-circle">
                    <div>
                        <div class="small">Hello,</div>
                        <div class="font-weight-bold">${user.name != null ? user.name : 'Guest User'}</div>
                    </div>
                </div>

                <div class="bg-white-card">
                    <div class="p-3 border-bottom d-flex align-items-center">
                        <i class="fas fa-box text-primary mr-3"></i>
                        <a href="OrderServlet" class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">My Orders</a>
                        <i class="fas fa-chevron-right ml-auto text-muted small"></i>
                    </div>

                    <div class="p-3 border-bottom">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-user text-primary mr-3"></i>
                            <span class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">Account Settings</span>
                        </div>
                        <div class="pl-5">
                            <a href="profile.jsp" class="d-block mb-2 small text-dark">Profile Information</a>
                            <a href="#" class="d-block mb-2 small text-dark">Manage Addresses</a>
                            <a href="#" class="d-block small text-dark">PAN Card Information</a>
                        </div>
                    </div>

                    <div class="p-3 border-bottom">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-wallet text-primary mr-3"></i>
                            <span class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">Payments</span>
                        </div>
                        <div class="pl-5">
                            <a href="#" class="d-block mb-2 small text-dark">Gift Cards</a>
                            <a href="#" class="d-block mb-2 small text-dark">Saved VPA</a>
                            <a href="#" class="d-block small text-dark">Saved Cards</a>
                        </div>
                    </div>

                    <div class="p-3 border-bottom d-flex align-items-center bg-light">
                        <i class="fas fa-heart text-primary mr-3"></i>
                        <a href="wishlist.jsp" class="font-weight-bold text-uppercase text-primary" style="font-size: 14px;">My Wishlist</a>
                        <i class="fas fa-chevron-right ml-auto text-primary small"></i>
                    </div>

                    <div class="p-3 d-flex align-items-center">
                        <i class="fas fa-power-off text-primary mr-3"></i>
                        <a href="logout" class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">Logout</a>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-lg-9 col-12">
                <div class="bg-white-card">
                    <div class="p-3 border-bottom">
                        <h5 class="m-0 font-weight-bold">My Wishlist (${wishlistItems.size() != null ? wishlistItems.size() : 0})</h5>
                    </div>

                    <c:choose>
                        <c:when test="${not empty wishlistItems}">
                            <c:forEach var="item" items="${wishlistItems}">
                                <div class="p-4 border-bottom position-relative wishlist-item transition-smooth">
                                    <div class="row align-items-center">
                                        <div class="col-md-2 col-4 text-center">
                                            <img src="${not empty item.image ? item.image : 'https://via.placeholder.com/100'}" class="img-fluid wishlist-img" data-name="${item.name}" style="max-height: 100px; object-fit: contain;">
                                        </div>
                                        <div class="col-md-7 col-8">
                                            <h6 class="mb-1 text-truncate">${item.name}</h6>
                                            <div class="d-flex align-items-center mb-1">
                                                <span class="rating-badge mr-2">4.2 <i class="fas fa-star ml-1"></i></span>
                                                <span class="text-secondary small">(1,245)</span>
                                            </div>
                                            <div class="d-flex align-items-center mt-2">
                                                <h5 class="font-weight-bold mb-0">₹${item.price}</h5>
                                                <span class="text-muted small ml-2"><del>₹${item.price + 400}</del></span>
                                                <span class="text-success font-weight-bold small ml-2">25% off</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 mt-3 mt-md-0">
                                            <a href="CartServlet?action=add&id=${item.id}" class="btn btn-orange btn-block py-2">Move to Cart</a>
                                        </div>
                                    </div>
                                    <a href="WishlistServlet?action=remove&id=${item.id}" class="remove-icon">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <!-- Functional Placeholder if no data -->
                            <div class="p-4 border-bottom position-relative wishlist-item transition-smooth">
                                <div class="row align-items-center">
                                    <div class="col-md-2 col-4 text-center">
                                        <img src="https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;">
                                    </div>
                                    <div class="col-md-7 col-8">
                                        <h6 class="mb-1">Samsung Galaxy S21 FE 5G (Olive, 128 GB)</h6>
                                        <div class="d-flex align-items-center mb-1">
                                            <span class="rating-badge mr-2">4.4 <i class="fas fa-star ml-1"></i></span>
                                            <span class="text-secondary small">(54,245)</span>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <h5 class="font-weight-bold mb-0">₹32,999</h5>
                                            <span class="text-muted small ml-2"><del>₹69,999</del></span>
                                            <span class="text-success font-weight-bold small ml-2">52% off</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mt-3 mt-md-0">
                                        <button class="btn btn-orange btn-block py-2">Move to Cart</button>
                                    </div>
                                </div>
                                <div class="remove-icon"><i class="fas fa-trash-alt"></i></div>
                            </div>

                            <div class="p-4 border-bottom position-relative wishlist-item transition-smooth">
                                <div class="row align-items-center">
                                    <div class="col-md-2 col-4 text-center">
                                        <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200" class="img-fluid" style="max-height: 100px; object-fit: contain;">
                                    </div>
                                    <div class="col-md-7 col-8">
                                        <h6 class="mb-1">Nike Air Max 270 (Red/Black)</h6>
                                        <div class="d-flex align-items-center mb-1">
                                            <span class="rating-badge mr-2">4.6 <i class="fas fa-star ml-1"></i></span>
                                            <span class="text-secondary small">(8,245)</span>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <h5 class="font-weight-bold mb-0">₹8,495</h5>
                                            <span class="text-muted small ml-2"><del>₹12,995</del></span>
                                            <span class="text-success font-weight-bold small ml-2">34% off</span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mt-3 mt-md-0">
                                        <button class="btn btn-orange btn-block py-2">Move to Cart</button>
                                    </div>
                                </div>
                                <div class="remove-icon"><i class="fas fa-trash-alt"></i></div>
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
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=200",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=200",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=200",
                "Shoes": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200",
                "Shirt": "https://images.unsplash.com/photo-1621072156002-e2fcced0b170?w=200"
            };

            document.querySelectorAll(".wishlist-img").forEach(img => {
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
