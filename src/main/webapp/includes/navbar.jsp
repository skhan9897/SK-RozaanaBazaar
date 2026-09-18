<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Primary Header -->
<header class="main-header">
    <div class="container-premium d-flex align-items-center w-100">
        <!-- Mobile Menu Toggle -->
        <button class="btn d-md-none text-white p-0 mr-3" type="button" aria-label="Menu" style="background: transparent;">
            <i class="fas fa-bars" style="font-size: 20px;"></i>
        </button>

        <!-- Logo -->
        <div class="d-flex align-items-center">
            <a class="navbar-brand text-white d-flex flex-column" href="index.jsp" style="text-decoration: none;">
                <span class="font-weight-bold" style="font-size: 1.25rem; line-height: 1;">SKRozanaBazaar</span>
                <span class="plus-text" style="color: #ffe500; font-style: italic; font-size: 11px; margin-top: -3px; display: block; font-weight: 500;">Explore <span style="color: #ffe500;">Premium</span> <i class="fas fa-star ml-1" style="font-size: 8px;"></i></span>
            </a>
        </div>

        <!-- Search Bar (Desktop) -->
        <div class="search-container d-none d-md-flex">
            <form action="search" method="GET" class="w-100 d-flex align-items-center">
                <input type="text" name="q" placeholder="Search for products, brands and more" aria-label="Search" value="${not empty searchQuery ? searchQuery : ''}">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <!-- Right Navigation -->
        <div class="header-links">
            <c:choose>
                <c:when test="${not empty user}">
                    <div class="dropdown">
                        <a class="dropdown-toggle font-weight-bold d-flex align-items-center text-white" href="#" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                            <span>${not empty user.name ? user.name : 'Account'}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow border-0" aria-labelledby="userMenu" style="border-radius: 4px; margin-top: 10px;">
                            <a class="dropdown-item py-2" href="profile.jsp"><i class="fas fa-user-circle mr-3 text-primary"></i> My Profile</a>
                            <a class="dropdown-item py-2" href="OrderServlet"><i class="fas fa-box mr-3 text-primary"></i> Orders</a>
                            <a class="dropdown-item py-2" href="wishlist.jsp"><i class="fas fa-heart mr-3 text-primary"></i> Wishlist</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item py-2" href="logout"><i class="fas fa-power-off mr-3 text-danger"></i> Logout</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="btn-login text-primary font-weight-bold">Login</a>
                </c:otherwise>
            </c:choose>

            <a href="admin/login.jsp" class="d-none d-lg-block font-weight-bold text-white">Become a Seller</a>

            <div class="dropdown d-none d-lg-block">
                <a class="dropdown-toggle font-weight-bold text-white" href="#" id="moreMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    More
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow border-0" aria-labelledby="moreMenu" style="border-radius: 4px;">
                    <a class="dropdown-item py-2" href="#"><i class="fas fa-bell mr-3 text-primary"></i> Notifications</a>
                    <a class="dropdown-item py-2" href="#"><i class="fas fa-question-circle mr-3 text-primary"></i> 24x7 Customer Care</a>
                </div>
            </div>

            <a href="cart.jsp" class="cart-link font-weight-bold text-white d-flex align-items-center">
                <i class="fas fa-shopping-cart mr-2"></i>
                <span>Cart</span>
                <span class="cart-count">${not empty cartCount ? cartCount : '0'}</span>
            </a>
        </div>
    </div>

    <!-- Mobile Search (Visible only on mobile) -->
    <div class="container-premium d-md-none w-100 pb-2">
        <div class="search-container m-0" style="max-width: 100%;">
            <form action="search" method="GET" class="w-100 d-flex align-items-center">
                <input type="text" name="q" placeholder="Search for products" aria-label="Search" value="${not empty searchQuery ? searchQuery : ''}">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>
    </div>
</header>

