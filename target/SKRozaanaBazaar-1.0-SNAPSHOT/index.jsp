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
                        <div class="category-card p-4 border rounded shadow-sm bg-white">
                            <c:choose>
                                <c:when test="${not empty cat.image}">
                                    <img src="${pageContext.request.contextPath}${cat.image}" alt="${cat.name}" class="img-fluid mb-2" style="height: 50px;" onerror="this.src='https://via.placeholder.com/50'">
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-folder fa-2x mb-2 text-primary"></i>
                                </c:otherwise>
                            </c:choose>
                            <h5>${cat.name}</h5>
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

        <h3 class="mt-5">Today's Deals</h3>
        <div class="row mt-4">
            <!-- Featured products would be loaded here -->
            <p class="text-muted ml-3">Explore our latest deals by searching above!</p>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script>
        window.addEventListener('load', function() {
            setTimeout(function() {
                var splash = document.getElementById('splash-screen');
                splash.classList.add('hidden');
            }, 1500); // 1.5 seconds delay
        });
    </script>
</body>
</html>
