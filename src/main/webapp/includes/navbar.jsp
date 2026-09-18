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
                <span class="plus-text">Explore <span style="color: #ffe500;">Premium</span> <i class="fas fa-star ml-1" style="font-size: 8px;"></i></span>
            </a>
            <div class="ml-2 d-none d-lg-block">
                <span class="badge badge-success" style="font-size: 10px; background-color: #28a745; color: white; padding: 2px 6px; border-radius: 10px;">
                    <i class="fas fa-check-circle mr-1"></i>System Status: Online
                </span>
            </div>
        </div>


        <!-- Search Bar (Desktop) -->
        <div class="search-container d-none d-md-flex flex-grow-1">
            <form action="search" method="GET" class="w-100 d-flex align-items-center">
                <input type="text" name="q" placeholder="Search for products, brands and more" aria-label="Search" value="${not empty searchQuery ? searchQuery : ''}">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <!-- Right Navigation -->
        <div class="header-links d-flex align-items-center">
            <c:choose>
                <c:when test="${not empty user}">
                    <div class="dropdown">
                        <a class="dropdown-toggle font-weight-bold d-flex align-items-center text-white" href="#" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                            <span class="d-none d-lg-inline">${not empty user.name ? user.name : 'Account'}</span>
                            <i class="fas fa-user-circle d-lg-none" style="font-size: 20px;"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0" aria-labelledby="userMenu" style="border-radius: 4px; margin-top: 10px;">
                            <div class="dropdown-header d-lg-none">${not empty user.name ? user.name : 'Account'}</div>
                            <a class="dropdown-item py-2" href="profile.jsp"><i class="fas fa-user-circle mr-3 text-primary"></i> My Profile</a>
                            <a class="dropdown-item py-2" href="OrderServlet"><i class="fas fa-box mr-3 text-primary"></i> Orders</a>
                            <a class="dropdown-item py-2" href="wishlist.jsp"><i class="fas fa-heart mr-3 text-primary"></i> Wishlist</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item py-2" href="logout"><i class="fas fa-power-off mr-3 text-danger"></i> Logout</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="btn btn-light text-primary font-weight-bold px-4 d-none d-md-block" style="border-radius: 2px; text-transform: none; height: 32px; padding: 0 20px !important; line-height: 32px;">Login</a>
                    <a href="login.jsp" class="text-white d-md-none mr-3" style="font-size: 20px;"><i class="fas fa-user"></i></a>
                </c:otherwise>
            </c:choose>

            <a href="admin/login.jsp" class="d-none d-lg-block font-weight-bold ml-4 text-white" style="text-decoration: none;">Become a Seller</a>

            <div class="dropdown ml-4 d-none d-lg-block">
                <a class="dropdown-toggle font-weight-bold text-white" href="#" id="moreMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                    More
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow-sm border-0" aria-labelledby="moreMenu" style="border-radius: 4px; margin-top: 10px;">
                    <a class="dropdown-item py-2" href="#"><i class="fas fa-bell mr-3 text-primary"></i> Notifications</a>
                    <a class="dropdown-item py-2" href="#"><i class="fas fa-question-circle mr-3 text-primary"></i> 24x7 Customer Care</a>
                    <a class="dropdown-item py-2" href="#"><i class="fas fa-chart-line mr-3 text-primary"></i> Advertise</a>
                    <a class="dropdown-item py-2" href="#"><i class="fas fa-download mr-3 text-primary"></i> Download App</a>
                </div>
            </div>

            <a href="cart.jsp" class="font-weight-bold ml-4 text-white position-relative d-flex align-items-center" style="text-decoration: none;">
                <i class="fas fa-shopping-cart" style="font-size: 20px;"></i>
                <span class="d-none d-md-inline ml-2">Cart</span>
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

