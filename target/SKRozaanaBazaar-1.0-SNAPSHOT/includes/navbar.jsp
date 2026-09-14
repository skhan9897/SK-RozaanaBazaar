<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
    <div class="dropdown mr-2">
        <a class="text-dark ml-2" href="#" id="adminMenu" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-bars fa-lg"></i>
        </a>
        <div class="dropdown-menu shadow border-0" aria-labelledby="adminMenu" style="border-radius: 10px; margin-top: 10px;">
            <h6 class="dropdown-header text-primary font-weight-bold" style="font-size: 0.8rem;">🛡️ BUSINESS PORTAL</h6>
            <a class="dropdown-item font-weight-bold py-2" href="admin/login.jsp">
                <i class="fas fa-user-shield mr-2 text-primary"></i> Admin Login
            </a>
            <a class="dropdown-item font-weight-bold py-2" href="admin/merchant-register.jsp">
                <i class="fas fa-store-alt mr-2 text-success"></i> Merchant Registration
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small text-muted" href="#">Terms & Conditions</a>
        </div>
    </div>
    <a class="navbar-brand font-weight-bold" href="index">SKRozaanaBazaar</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <form class="form-inline mx-auto w-50" action="search" method="GET">
            <input class="form-control w-75 mr-2" type="search" name="q" placeholder="Search Products" aria-label="Search" value="${searchQuery}">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="cart.jsp">🛒 <span class="badge badge-pill badge-danger">0</span></a>
            </li>
            <c:choose>
                <c:when test="${not empty user}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${user.name}
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="orders.jsp">My Orders</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="logout">Logout</a>
                        </div>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-dark" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bold text-dark" href="register.jsp">Register</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<div class="bg-light py-2 px-3 border-bottom d-flex justify-content-between align-items-center">
    <nav class="nav">
        <a class="nav-link font-weight-bold" href="index">Home</a>
        <a class="nav-link font-weight-bold" href="CategoryServlet">Categories</a>
        <a class="nav-link font-weight-bold" href="DealsServlet">Deals</a>
        <a class="nav-link font-weight-bold" href="NewArrivalsServlet">New Arrivals</a>
    </nav>
</div>
