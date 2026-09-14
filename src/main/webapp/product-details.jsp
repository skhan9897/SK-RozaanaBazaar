<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.productName} - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container mt-5 mb-5">
        <div class="row">
            <!-- Product Image -->
            <div class="col-md-6 text-center">
                <div class="border p-3 rounded bg-white shadow-sm">
                    <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&auto=format&fit=crop" class="img-fluid rounded" alt="${product.productName}" id="detail-img" style="max-height: 400px; object-fit: contain;">
                </div>
            </div>

            <!-- Product Details -->
            <div class="col-md-6">
                <span class="text-muted small uppercase font-weight-bold">${product.brand}</span>
                <h2 class="font-weight-bold text-dark mt-1 mb-2">${product.productName}</h2>

                <div class="mb-3">
                    <span class="badge badge-success px-2 py-1"><i class="fas fa-star"></i> ${product.rating}</span>
                    <span class="text-muted small ml-2">SKU: ${product.sku}</span>
                </div>

                <div class="mb-4 p-3 bg-light rounded border">
                    <span class="badge badge-danger px-2 py-1 mb-2">${product.discount}% OFF</span>
                    <div>
                        <span class="h3 font-weight-bold text-primary">₹${product.finalPrice}</span>
                        <span class="text-muted ml-2"><del>₹${product.price}</del></span>
                    </div>
                    <small class="text-success font-weight-bold d-block mt-2">Inclusive of all taxes</small>
                </div>

                <h5 class="font-weight-bold text-dark">Quick Description</h5>
                <p class="text-muted">${product.description}</p>

                <hr>

                <!-- Action Buttons -->
                <div class="mt-4">
                    <c:choose>
                        <c:when test="${product.stock > 0}">
                            <span class="text-success font-weight-bold d-block mb-3"><i class="fas fa-check-circle"></i> In Stock (${product.stock} units available)</span>
                            <div class="row">
                                <div class="col-6">
                                    <form action="AddToCartServlet" method="POST">
                                        <input type="hidden" name="pid" value="${product.id}">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block">🛒 Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span class="text-danger font-weight-bold d-block mb-3"><i class="fas fa-times-circle"></i> Out of Stock</span>
                            <button class="btn btn-secondary btn-lg btn-block" disabled>Out of Stock</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var images = {
                "Galaxy": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500&auto=format&fit=crop",
                "iPhone": "https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=500&auto=format&fit=crop",
                "OnePlus": "https://images.unsplash.com/photo-1565630916779-e303be97b6f5?w=500&auto=format&fit=crop",
                "Nord": "https://images.unsplash.com/photo-1565630916779-e303be97b6f5?w=500&auto=format&fit=crop",
                "Redmi": "https://images.unsplash.com/photo-1605787020600-b9ebd5df1d07?w=500&auto=format&fit=crop",
                "Realme": "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=500&auto=format&fit=crop",
                "iPad": "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500&auto=format&fit=crop",
                "Tab": "https://images.unsplash.com/photo-1589739900243-4b52cd9b104e?w=500&auto=format&fit=crop",
                "Charger": "https://images.unsplash.com/photo-1622445275463-afa2ab738c34?w=500&auto=format&fit=crop",
                "Power Bank": "https://images.unsplash.com/photo-1609592424089-98d021c7a8b6?w=500&auto=format&fit=crop",
                "Powerbank": "https://images.unsplash.com/photo-1609592424089-98d021c7a8b6?w=500&auto=format&fit=crop",
                "Power": "https://images.unsplash.com/photo-1609592424089-98d021c7a8b6?w=500&auto=format&fit=crop",
                "MacBook": "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&auto=format&fit=crop",
                "Laptop": "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=500&auto=format&fit=crop",
                "Monitor": "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500&auto=format&fit=crop",
                "Mouse": "https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?w=500&auto=format&fit=crop",
                "Keyboard": "https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500&auto=format&fit=crop",
                "SSD": "https://images.unsplash.com/photo-1601524909162-be87252be298?w=500&auto=format&fit=crop",
                "Pen Drive": "https://images.unsplash.com/photo-1622535978971-87989ee52d67?w=500&auto=format&fit=crop",
                "Earbuds": "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500&auto=format&fit=crop",
                "Buds": "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500&auto=format&fit=crop",
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
                "Diapers": "https://images.unsplash.com/photo-1515488042361-404e9250afef?w=500&auto=format&fit=crop",
                "Wipes": "https://images.unsplash.com/photo-1519689680058-324335c77eba?w=500&auto=format&fit=crop",
                "LEGO": "https://images.unsplash.com/photo-1560963336-447a7b431a7b?w=500&auto=format&fit=crop",
                "Car": "https://images.unsplash.com/photo-1594787318286-3d835c1d207f?w=500&auto=format&fit=crop",
                "Atta": "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&auto=format&fit=crop",
                "Rice": "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500&auto=format&fit=crop",
                "Dal": "https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=500&auto=format&fit=crop",
                "Oil": "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=500&auto=format&fit=crop",
                "Ghee": "https://images.unsplash.com/photo-1608686207856-001b95cf60ca?w=500&auto=format&fit=crop",
                "Masala": "https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=500&auto=format&fit=crop",
                "Biscuits": "https://images.unsplash.com/photo-1558961317-a169dc67098e?w=500&auto=format&fit=crop",
                "Oreo": "https://images.unsplash.com/photo-1558961317-a169dc67098e?w=500&auto=format&fit=crop",
                "Chips": "https://images.unsplash.com/photo-1566478431375-704332992928?w=500&auto=format&fit=crop",
                "Tea": "https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500&auto=format&fit=crop",
                "Coffee": "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&auto=format&fit=crop",
                "Coca Cola": "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=500&auto=format&fit=crop",
                "Face": "https://images.unsplash.com/photo-1556228720-195a672e8a03?w=500&auto=format&fit=crop",
                "Serum": "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500&auto=format&fit=crop",
                "Shampoo": "https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?w=500&auto=format&fit=crop",
                "Lotion": "https://images.unsplash.com/photo-1608248597481-496100c8c836?w=500&auto=format&fit=crop",
                "Kajal": "https://images.unsplash.com/photo-1625093742435-6fa192b6fb10?w=500&auto=format&fit=crop",
                "Cooker": "https://images.unsplash.com/photo-1584269600464-37b1b58a9fe7?w=500&auto=format&fit=crop",
                "Mixer": "https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?w=500&auto=format&fit=crop",
                "Iron": "https://images.unsplash.com/photo-1517646287270-a5a9ca602e5c?w=500&auto=format&fit=crop",
                "Clock": "https://images.unsplash.com/photo-1563861826100-9cb868fdbe1c?w=500&auto=format&fit=crop",
                "Detergent": "https://images.unsplash.com/photo-1607344645866-009c320c5ab8?w=500&auto=format&fit=crop",
                "Cleaner": "https://images.unsplash.com/photo-1585832770489-2b6921125342?w=500&auto=format&fit=crop",
                "Vanish": "https://images.unsplash.com/photo-1585832770489-2b6921125342?w=500&auto=format&fit=crop",
                "Harpic": "https://images.unsplash.com/photo-1585832770489-2b6921125342?w=500&auto=format&fit=crop",
                "Sofa": "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500&auto=format&fit=crop",
                "Table": "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=500&auto=format&fit=crop",
                "Chair": "https://images.unsplash.com/photo-1505797149-43b0069ec26b?w=500&auto=format&fit=crop",
                "Bulb": "https://images.unsplash.com/photo-1550684848-fac1c5b4e853?w=500&auto=format&fit=crop",
                "Fan": "https://images.unsplash.com/photo-1618945596471-f6ce132470ab?w=500&auto=format&fit=crop",
                "Bat": "https://images.unsplash.com/photo-1531415074968-036ba1b575da?w=500&auto=format&fit=crop",
                "Mat": "https://images.unsplash.com/photo-1592432678016-e910b452f9a2?w=500&auto=format&fit=crop",
                "Dumbbells": "https://images.unsplash.com/photo-1638536532686-d610adfc8e5c?w=500&auto=format&fit=crop",
                "Football": "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?w=500&auto=format&fit=crop",
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

            var name = "${product.productName}";
            var imgElement = document.getElementById("detail-img");
            if (imgElement && name) {
                for (var key in images) {
                    if (name.toLowerCase().includes(key.toLowerCase())) {
                        imgElement.src = images[key];
                        break;
                    }
                }
            }
        });
    </script>
</body>
</html>
