<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>SKRozaanaBazaar - Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Splash Screen -->
    <div id="splash-screen">
        <div class="splash-logo">
            <i class="fas fa-shopping-basket"></i> SK Rozaana Bazaar
        </div>
        <div class="loader"></div>
    </div>

    <%@ include file="includes/navbar.jsp" %>

    <div class="container-fluid p-0">
        <div class="jumbotron jumbotron-fluid bg-primary text-white text-center">
            <div class="container">
                <h1 class="display-4">Daily Shopping Made Easy</h1>
                <p class="lead">Get the best deals on Groceries, Electronics, Fashion and more!</p>
            </div>
        </div>
    </div>

    <div class="container mt-5">
        <h3 class="text-center mb-4">Shop By Category</h3>
        <div class="row text-center">
            <c:forEach var="cat" items="${categories}">
                <div class="col-md-2 col-6 mb-4">
                    <a href="CategoryServlet?id=${cat.id}" class="text-decoration-none text-dark">
                        <div class="category-card p-3 border rounded shadow-sm bg-white h-100 d-flex flex-column align-items-center justify-content-center">
                            <c:set var="catImg" value="https://via.placeholder.com/150?text=${cat.name}" />
                            <c:choose>
                                <c:when test="${cat.id == 1}"><c:set var="catImg" value="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 2}"><c:set var="catImg" value="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 3}"><c:set var="catImg" value="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 4}"><c:set var="catImg" value="https://images.unsplash.com/photo-1593305841991-05c297ba4575?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 5}"><c:set var="catImg" value="https://images.unsplash.com/photo-1617137968427-85924c800a22?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 6}"><c:set var="catImg" value="https://images.unsplash.com/photo-1618244972963-dbee1a7edc95?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 7}"><c:set var="catImg" value="https://images.unsplash.com/photo-1515488042361-404e9250afef?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 8}"><c:set var="catImg" value="https://images.unsplash.com/photo-1542838132-92c53300491e?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 9}"><c:set var="catImg" value="https://images.unsplash.com/photo-1599490659223-930b45c227f4?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 10}"><c:set var="catImg" value="https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 11}"><c:set var="catImg" value="https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 12}"><c:set var="catImg" value="https://images.unsplash.com/photo-1585832770489-2b6921125342?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 13}"><c:set var="catImg" value="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 14}"><c:set var="catImg" value="https://images.unsplash.com/photo-1550684848-fac1c5b4e853?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 15}"><c:set var="catImg" value="https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 16}"><c:set var="catImg" value="https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 17}"><c:set var="catImg" value="https://images.unsplash.com/photo-1486006920555-c77dce18193b?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 18}"><c:set var="catImg" value="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 19}"><c:set var="catImg" value="https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 20}"><c:set var="catImg" value="https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 21}"><c:set var="catImg" value="https://images.unsplash.com/photo-1516734212186-a967f81ad0d7?w=150&auto=format&fit=crop" /></c:when>
                                <c:when test="${cat.id == 22}"><c:set var="catImg" value="https://images.unsplash.com/photo-1504148455328-c376907d081c?w=150&auto=format&fit=crop" /></c:when>
                            </c:choose>
                            <img src="${catImg}" alt="${cat.name}" class="img-fluid mb-2 rounded" style="height: 80px; width: 80px; object-fit: cover;">
                            <h6 class="font-weight-bold text-center text-truncate w-100" style="font-size: 0.9rem;">${cat.name}</h6>
                        </div>
                    </a>
                </div>
            </c:forEach>
            <c:if test="${empty categories}">
                <div class="col-12 text-center">
                    <p class="text-muted">Loading categories...</p>
                    <a href="HomeServlet" class="btn btn-primary">Refresh Categories</a>
                </div>
            </c:if>
        </div>

        <h3 class="mt-5 mb-4">Today's Deals</h3>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card h-100 shadow-sm product-card">
                        <div class="position-relative">
                            <span class="badge badge-danger position-absolute m-2 px-2 py-1" style="z-index: 2;">${product.discount}% OFF</span>
                            <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&auto=format&fit=crop&q=60" class="card-img-top p-3" alt="${product.productName}" style="height: 200px; object-fit: contain;" id="img-${product.id}">
                        </div>
                        <div class="card-body d-flex flex-column">
                            <span class="text-muted small">${product.brand}</span>
                            <h5 class="card-title font-weight-bold text-dark text-truncate mb-1" title="${product.productName}">${product.productName}</h5>
                            <div class="mb-2">
                                <span class="badge badge-success"><i class="fas fa-star"></i> ${product.rating}</span>
                            </div>
                            <div class="mt-auto">
                                <div class="mb-2">
                                    <span class="h5 font-weight-bold text-primary">₹${product.finalPrice}</span>
                                    <span class="text-muted small ml-1"><del>₹${product.price}</del></span>
                                </div>
                                <a href="ProductDetailsServlet?id=${product.id}" class="btn btn-sm btn-primary btn-block">View Details</a>
                                <form action="AddToCartServlet" method="POST" class="mt-2">
                                    <input type="hidden" name="pid" value="${product.id}">
                                    <button type="submit" class="btn btn-sm btn-outline-success btn-block">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

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

                <c:forEach var="product" items="${products}">
                    var name = "${product.productName}";
                    var imgElement = document.getElementById("img-${product.id}");
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
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script>
        // Use a DOMContentLoaded or direct execution fallback in case 'load' event waits for slow external images/CSS
        function hideSplash() {
            var splash = document.getElementById('splash-screen');
            if (splash && !splash.classList.contains('hidden')) {
                splash.classList.add('hidden');
            }
        }

        // Hide after 1.5 seconds anyway
        setTimeout(hideSplash, 1500);

        // Hide as soon as page resources are loaded
        window.addEventListener('load', hideSplash);
    </script>
</body>
</html>
