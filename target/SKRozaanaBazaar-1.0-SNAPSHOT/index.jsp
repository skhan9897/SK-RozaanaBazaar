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
        <h3>Shop By Category</h3>
        <div class="row text-center mt-4">
            <div class="col-md-2">
                <div class="p-3 border rounded">Groceries</div>
            </div>
            <div class="col-md-2">
                <div class="p-3 border rounded">Electronics</div>
            </div>
            <div class="col-md-2">
                <div class="p-3 border rounded">Fashion</div>
            </div>
            <div class="col-md-2">
                <div class="p-3 border rounded">Beauty</div>
            </div>
            <div class="col-md-2">
                <div class="p-3 border rounded">Mobiles</div>
            </div>
            <div class="col-md-2">
                <div class="p-3 border rounded">Home</div>
            </div>
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
