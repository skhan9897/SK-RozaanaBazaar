<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="col-md-2 d-none d-md-block bg-white sidebar border-right" style="min-height: 100vh; overflow-y: auto;">
    <div class="sidebar-sticky pt-3">
        <div class="px-3 mb-2 font-weight-bold text-uppercase text-primary" style="font-size: 0.9rem; letter-spacing: 0.5px;">
            <i class="fa-solid fa-shield-halved mr-1"></i> SKR BUSINESS
        </div>
        <hr class="my-2">

        <ul class="nav flex-column">
            <!-- Dashboard -->
            <li class="nav-item">
                <a class="nav-link font-weight-bold text-dark" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="fa-solid fa-house mr-2 text-primary"></i> Dashboard Home
                </a>
            </li>

            <!-- Products -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-box mr-1"></i> Products
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=list">├── All Products</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=add">├── Add Product</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=edit">├── Edit Product</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=delete">├── Delete Product</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=images">├── Product Images</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=stock">├── Stock Management</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=lowstock">└── Low Stock Items</a></li>
                </ul>
            </li>

            <!-- Categories -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-layer-group mr-1"></i> Categories
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCategoryServlet?action=list">├── All Categories</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCategoryServlet?action=add">├── Add Category</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCategoryServlet?action=edit">├── Edit Category</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCategoryServlet?action=delete">├── Delete Category</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCategoryServlet?action=subcategories">└── Subcategories</a></li>
                </ul>
            </li>

            <!-- Orders -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-cart-shopping mr-1"></i> Orders
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=All">├── All Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=New">├── New Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=Confirmed">├── Confirmed</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=Packed">├── Packed</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=Shipped">├── Shipped</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=OutForDelivery">├── Out For Delivery</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=Delivered">├── Delivered</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=Cancelled">├── Cancelled</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=details">└── Order Details</a></li>
                </ul>
            </li>

            <!-- Customers -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-users mr-1"></i> Customers
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCustomerServlet?action=list">├── All Customers</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCustomerServlet?action=active">├── Active Users</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCustomerServlet?action=blocked">├── Blocked Users</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCustomerServlet?action=details">└── Details</a></li>
                </ul>
            </li>

            <!-- Payments -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-credit-card mr-1"></i> Payments
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminPaymentServlet?action=list">├── All Payments</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminPaymentServlet?action=success">├── Successful</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminPaymentServlet?action=pending">├── Pending</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminPaymentServlet?action=failed">├── Failed</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminPaymentServlet?action=refunds">└── Refunds</a></li>
                </ul>
            </li>

            <!-- Offers & Coupons -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-tag mr-1"></i> Offers & Coupons
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCouponServlet?action=list">├── All Coupons</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCouponServlet?action=add">├── Add Coupon</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCouponServlet?action=edit">├── Edit Coupon</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminCouponServlet?action=expired">└── Expired</a></li>
                </ul>
            </li>

            <!-- Banners -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-images mr-1"></i> Banners
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminBannerServlet?action=list">├── Home Sliders</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminBannerServlet?action=add">├── Add Banner</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminBannerServlet?action=edit">├── Edit Banner</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminBannerServlet?action=delete">└── Delete Banner</a></li>
                </ul>
            </li>

            <!-- Reviews -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-star mr-1"></i> Reviews
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReviewServlet?action=list">├── All Reviews</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReviewServlet?action=pending">├── Pending Reviews</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReviewServlet?action=delete">└── Delete Review</a></li>
                </ul>
            </li>

            <!-- Reports -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-chart-line mr-1"></i> Reports
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReportServlet?action=sales">├── Sales Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReportServlet?action=products">├── Product Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReportServlet?action=customers">├── Customer Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReportServlet?action=orders">├── Order Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminReportServlet?action=revenue">└── Revenue Report</a></li>
                </ul>
            </li>

            <!-- Settings -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">
                    <i class="fa-solid fa-gears mr-1"></i> Settings
                </span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminSettingsServlet?action=profile">├── Admin Profile</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminSettingsServlet?action=password">├── Change Password</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminSettingsServlet?action=store">├── Store Settings</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="${pageContext.request.contextPath}/admin/AdminSettingsServlet?action=payment">└── Payment Setup</a></li>
                </ul>
            </li>

            <!-- Logout -->
            <hr class="my-2">
            <li class="nav-item mb-5">
                <a class="nav-link text-danger font-weight-bold" href="${pageContext.request.contextPath}/logout">
                    <i class="fa-solid fa-power-off mr-1"></i> Logout
                </a>
            </li>
        </ul>
    </div>
</nav>
