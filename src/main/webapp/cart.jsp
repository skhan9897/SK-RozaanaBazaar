<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-3">
        <div class="row">
            <!-- Left Side: Cart Items -->
            <div class="col-lg-8 col-12 mb-3">
                <div class="bg-white-card">
                    <div class="p-3 border-bottom d-flex justify-content-between align-items-center">
                        <h5 class="m-0 font-weight-bold">My Cart (${cartItems.size()})</h5>
                        <div class="d-flex align-items-center small">
                            <i class="fas fa-map-marker-alt text-primary mr-2"></i>
                            <span>Deliver to: <span class="font-weight-bold">${user.city} - ${user.pincode}</span></span>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${not empty cartItems}">
                            <c:forEach var="item" items="${cartItems}">
                                <div class="p-3 border-bottom">
                                    <div class="row">
                                        <div class="col-md-2 col-4 text-center">
                                            <img src="${not empty item.productImage ? item.productImage : 'https://via.placeholder.com/100'}" class="img-fluid cart-item-img" data-name="${item.productName}" style="max-height: 100px; object-fit: contain;">
                                            <div class="mt-3 d-flex align-items-center justify-content-center">
                                                <form action="CartServlet" method="POST" class="d-flex align-items-center">
                                                    <input type="hidden" name="action" value="updateQuantity">
                                                    <input type="hidden" name="cartId" value="${item.id}">
                                                    <button type="button" class="btn btn-sm btn-light border rounded-circle p-0" style="width: 25px; height: 25px;" onclick="this.nextElementSibling.stepDown(); this.form.submit();">-</button>
                                                    <input type="number" name="quantity" value="${item.quantity}" min="1" readonly class="border-0 text-center mx-2 font-weight-bold" style="width: 30px; outline: none;">
                                                    <button type="button" class="btn btn-sm btn-light border rounded-circle p-0" style="width: 25px; height: 25px;" onclick="this.previousElementSibling.stepUp(); this.form.submit();">+</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-md-7 col-8">
                                            <a href="#" class="text-dark"><h6 class="mb-1">${item.productName}</h6></a>
                                            <p class="text-muted small mb-2">Seller: SK Retailer <span class="badge badge-primary ml-2" style="font-size: 8px;">SK ASSURED</span></p>
                                            <div class="d-flex align-items-center mb-3">
                                                <span class="text-muted small"><del>₹${item.price + 500}</del></span>
                                                <h5 class="font-weight-bold mx-2 mb-0">₹${item.price}</h5>
                                                <span class="text-success font-weight-bold small">2 Offers Applied <i class="fas fa-info-circle ml-1"></i></span>
                                            </div>
                                            <div class="mt-4">
                                                <a href="#" class="text-uppercase font-weight-bold text-dark mr-4 small">Save for later</a>
                                                <a href="RemoveCartServlet?id=${item.id}" class="text-uppercase font-weight-bold text-dark small">Remove</a>
                                            </div>
                                        </div>
                                        <div class="col-md-3 d-none d-md-block small text-right">
                                            Delivery by Sat Nov 2 | <span class="text-success">Free</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="p-3 text-right bg-white sticky-bottom shadow-sm" style="position: sticky; bottom: 0; z-index: 10;">
                                <a href="checkout.jsp" class="btn btn-orange px-5 py-3 font-weight-bold shadow">PLACE ORDER</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <div class="mb-4">
                                    <i class="fas fa-shopping-basket fa-5x text-muted opacity-50"></i>
                                </div>
                                <h4 class="mt-4">Your cart is empty!</h4>
                                <p class="text-muted small">Add items to it now.</p>
                                <a href="index.jsp" class="btn btn-primary px-5 mt-2">Shop Now</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Right Side: Price Details -->
            <c:if test="${not empty cartItems}">
                <div class="col-lg-4 col-12">
                    <div class="bg-white-card">
                        <h6 class="text-uppercase text-secondary font-weight-bold p-3 border-bottom m-0">Price Details</h6>
                        <div class="p-3">
                            <div class="d-flex justify-content-between mb-3">
                                <span>Price (${cartItems.size()} items)</span>
                                <span>₹${totalAmount + 1200}</span>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Discount</span>
                                <span class="text-success">- ₹1200</span>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Delivery Charges</span>
                                <span class="text-success">FREE</span>
                            </div>
                            <div class="d-flex justify-content-between mb-3 border-top border-dashed pt-3 font-weight-bold h5">
                                <span>Total Amount</span>
                                <span>₹${totalAmount}</span>
                            </div>
                            <div class="text-success font-weight-bold small border-top pt-2">
                                You will save ₹1200 on this order
                            </div>
                        </div>
                    </div>

                    <div class="mt-3 p-3 text-muted small">
                        <i class="fas fa-shield-alt mr-2 fa-lg"></i> Safe and Secure Payments. 100% Authentic products.
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=200",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=200",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=200",
                "Shoes": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200"
            };

            document.querySelectorAll(".cart-item-img").forEach(img => {
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
