<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5">
        <h2>Your Shopping Cart 🛒</h2>
        <hr>
        <div class="row">
            <div class="col-md-8">
                <c:choose>
                    <c:when test="${not empty cartItems}">
                        <table class="table table-bordered">
                            <thead class="bg-light">
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${cartItems}">
                                    <tr>
                                        <td>
                                            <img src="images/products/${item.productImage}" id="cart-img-${item.id}" data-name="${item.productName}" style="width: 50px; height: 50px; object-fit: contain;" class="mr-2 rounded border" onerror="this.src='https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&auto=format&fit=crop&q=60'">
                                            ${item.productName}
                                        </td>
                                        <td>₹${item.price}</td>
                                        <td>
                                            <form action="CartServlet" method="POST" class="form-inline">
                                                <input type="hidden" name="action" value="updateQuantity">
                                                <input type="hidden" name="cartId" value="${item.id}">
                                                <input type="number" name="quantity" value="${item.quantity}" min="1" max="100" class="form-control form-control-sm mr-2" style="width: 65px;" onchange="this.form.submit()">
                                            </form>
                                        </td>
                                        <td>₹${item.price * item.quantity}</td>
                                        <td>
                                            <a href="RemoveCartServlet?id=${item.id}" class="btn btn-danger btn-sm">Remove</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning">Your cart is empty! <a href="index.jsp">Continue shopping</a></div>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:if test="${not empty cartItems}">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Order Summary</h5>
                            <hr>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Subtotal</span>
                                <span>₹${totalAmount}</span>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Shipping</span>
                                <span class="text-success">FREE</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between mb-4">
                                <strong>Total</strong>
                                <strong class="text-primary">₹${totalAmount}</strong>
                            </div>
                            <a href="checkout.jsp" class="btn btn-success btn-block">Proceed to Checkout</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script>
        // Automatically assign premium e-commerce stock images based on keyword matching
        document.addEventListener("DOMContentLoaded", function() {
            var images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500&auto=format&fit=crop",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=500&auto=format&fit=crop",
                "OnePlus": "https://images.unsplash.com/photo-1565630916779-e303be97b6f5?w=500&auto=format&fit=crop",
                "Nord": "https://images.unsplash.com/photo-1565630916779-e303be97b6f5?w=500&auto=format&fit=crop",
                "Charger": "https://images.unsplash.com/photo-1622445275463-afa2ab738c34?w=500&auto=format&fit=crop",
                "Power Bank": "https://images.unsplash.com/photo-1609592424089-98d021c7a8b6?w=500&auto=format&fit=crop",
                "Powerbank": "https://images.unsplash.com/photo-1609592424089-98d021c7a8b6?w=500&auto=format&fit=crop",
                "Power": "https://images.unsplash.com/photo-1609592424089-98d021c7a8b6?w=500&auto=format&fit=crop",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&auto=format&fit=crop",
                "Monitor": "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500&auto=format&fit=crop",
                "Keyboard": "https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500&auto=format&fit=crop",
                "Earbuds": "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500&auto=format&fit=crop",
                "Headphones": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop",
                "Speaker": "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=500&auto=format&fit=crop",
                "TV": "https://images.unsplash.com/photo-1593305841991-05c297ba4575?w=500&auto=format&fit=crop",
                "Projector": "https://images.unsplash.com/photo-1535016120720-40c646be5580?w=500&auto=format&fit=crop",
                "T-Shirt": "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500&auto=format&fit=crop",
                "Shirt": "https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=500&auto=format&fit=crop",
                "Jeans": "https://images.unsplash.com/photo-1542272604-787c3835535d?w=500&auto=format&fit=crop",
                "Saree": "https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=500&auto=format&fit=crop",
                "Kurti": "https://images.unsplash.com/photo-1608963503737-f98de08a6b7f?w=500&auto=format&fit=crop",
                "Dress": "https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=500&auto=format&fit=crop",
                "Baby": "https://images.unsplash.com/photo-1515488042361-404e9250afef?w=500&auto=format&fit=crop",
                "Car": "https://images.unsplash.com/photo-1594787318286-3d835c1d207f?w=500&auto=format&fit=crop",
                "Atta": "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&auto=format&fit=crop",
                "Rice": "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500&auto=format&fit=crop",
                "Dal": "https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=500&auto=format&fit=crop",
                "Oil": "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=500&auto=format&fit=crop",
                "Masala": "https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=500&auto=format&fit=crop",
                "Biscuits": "https://images.unsplash.com/photo-1558961317-a169dc67098e?w=500&auto=format&fit=crop",
                "Chips": "https://images.unsplash.com/photo-1566478431375-704332992928?w=500&auto=format&fit=crop",
                "Tea": "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&auto=format&fit=crop",
                "Face": "https://images.unsplash.com/photo-1556228720-195a672e8a03?w=500&auto=format&fit=crop",
                "Shampoo": "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?w=500&auto=format&fit=crop",
                "Lotion": "https://images.unsplash.com/photo-1608248597481-496100c8c836?w=500&auto=format&fit=crop",
                "Cooker": "https://images.unsplash.com/photo-1584269600464-37b1b58a9fe7?w=500&auto=format&fit=crop",
                "Mixer": "https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?w=500&auto=format&fit=crop",
                "Clock": "https://images.unsplash.com/photo-1563861826100-9cb868fdbe1c?w=500&auto=format&fit=crop",
                "Detergent": "https://images.unsplash.com/photo-1607344645866-009c320c5ab8?w=500&auto=format&fit=crop",
                "Cleaner": "https://images.unsplash.com/photo-1585832770489-2b6921125342?w=500&auto=format&fit=crop",
                "Sofa": "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500&auto=format&fit=crop",
                "Table": "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=500&auto=format&fit=crop",
                "Bulb": "https://images.unsplash.com/photo-1550684848-fac1c5b4e853?w=500&auto=format&fit=crop",
                "Fan": "https://images.unsplash.com/photo-1618945596471-f6ce132470ab?w=500&auto=format&fit=crop",
                "Bat": "https://images.unsplash.com/photo-1531415074968-036ba1b575da?w=500&auto=format&fit=crop",
                "Mat": "https://images.unsplash.com/photo-1592432678016-e910b452f9a2?w=500&auto=format&fit=crop",
                "Dumbbells": "https://images.unsplash.com/photo-1638536532686-d610adfc8e5c?w=500&auto=format&fit=crop",
                "Console": "https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=500&auto=format&fit=crop",
                "Controller": "https://images.unsplash.com/photo-1592840496694-26d035b52b48?w=500&auto=format&fit=crop",
                "Headset": "https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=500&auto=format&fit=crop",
                "Holder": "https://images.unsplash.com/photo-1586105251261-72a756497a11?w=500&auto=format&fit=crop",
                "Helmet": "https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?w=500&auto=format&fit=crop",
                "Shoes": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop",
                "Sandals": "https://images.unsplash.com/photo-1562273138-f46be4ebdf33?w=500&auto=format&fit=crop",
                "Backpack": "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500&auto=format&fit=crop",
                "Trolley": "https://images.unsplash.com/photo-1565026057447-bc90a3dceb87?w=500&auto=format&fit=crop",
                "Notebook": "https://images.unsplash.com/photo-1531346878377-a5be20888e57?w=500&auto=format&fit=crop",
                "Pen": "https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?w=500&auto=format&fit=crop",
                "Food": "https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=500&auto=format&fit=crop",
                "Collar": "https://images.unsplash.com/photo-1601758174114-e711c0cbaa69?w=500&auto=format&fit=crop",
                "Screwdriver": "https://images.unsplash.com/photo-1534224039826-c7a0dea0e66a?w=500&auto=format&fit=crop",
                "Hammer": "https://images.unsplash.com/photo-1586864387967-d02ef85d93e8?w=500&auto=format&fit=crop"
            };

            <c:forEach var="item" items="${cartItems}">
                var name = "${item.productName}";
                var imgElement = document.getElementById("cart-img-${item.id}");
                if (imgElement) {
                    for (var key in images) {
                        if (name.toLowerCase().includes(key.toLowerCase())) {
                            imgElement.src = images[key];
                            break;
                        }
                    }
                }
            </c:forEach>
        });
    </script>
</body>
</html>
