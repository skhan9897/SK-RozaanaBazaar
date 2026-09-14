<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
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
    <div class="pr-2">
        <a class="btn btn-sm btn-dark font-weight-bold px-3 shadow-sm" href="admin/login.jsp" style="letter-spacing: 0.3px; background-color: #2b2b36; border-color: #3f3f52;">
            🛡️ Admin Section Login
        </a>
    </div>
</div>
