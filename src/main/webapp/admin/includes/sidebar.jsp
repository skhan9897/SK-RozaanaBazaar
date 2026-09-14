<nav class="col-md-2 d-none d-md-block bg-white sidebar border-right" style="min-height: 100vh; overflow-y: auto;">
    <div class="sidebar-sticky pt-3">
        <div class="px-3 mb-2 font-weight-bold text-uppercase text-primary" style="font-size: 0.9rem; letter-spacing: 0.5px;">🛡️ SK-RozaanaBazaar Admin</div>
        <hr class="my-2">

        <ul class="nav flex-column">
            <!-- Dashboard -->
            <li class="nav-item">
                <a class="nav-link font-weight-bold text-dark" href="dashboard">
                    🏠 Dashboard Home
                </a>
            </li>

            <!-- Products -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">📦 Products</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminProductServlet?action=list">├── All Products</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminProductServlet?action=add">├── Add Product</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminProductServlet?action=edit">├── Edit Product</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminProductServlet?action=delete">├── Delete Product</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminProductServlet?action=images">├── Product Images</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminProductServlet?action=stock">├── Stock Management</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminProductServlet?action=lowstock">└── Low Stock Products</a></li>
                </ul>
            </li>

            <!-- Categories -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">🗂️ Categories</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCategoryServlet?action=list">├── All Categories</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCategoryServlet?action=add">├── Add Category</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCategoryServlet?action=edit">├── Edit Category</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCategoryServlet?action=delete">├── Delete Category</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCategoryServlet?action=subcategories">└── Subcategories</a></li>
                </ul>
            </li>

            <!-- Orders -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">🛒 Orders</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=All">├── All Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=New">├── New Orders</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=Confirmed">├── Confirmed</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=Packed">├── Packed</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=Shipped">├── Shipped</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=OutForDelivery">├── Out For Delivery</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=Delivered">├── Delivered</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=list&status=Cancelled">├── Cancelled</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminOrderServlet?action=details">└── Order Details</a></li>
                </ul>
            </li>

            <!-- Customers -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">👥 Customers</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCustomerServlet?action=list">├── All Customers</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCustomerServlet?action=active">├── Active Customers</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCustomerServlet?action=blocked">├── Blocked Customers</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCustomerServlet?action=details">└── Customer Details</a></li>
                </ul>
            </li>

            <!-- Payments -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">💳 Payments</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminPaymentServlet?action=list">├── All Payments</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminPaymentServlet?action=success">├── Successful</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminPaymentServlet?action=pending">├── Pending</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminPaymentServlet?action=failed">├── Failed</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminPaymentServlet?action=refunds">└── Refunds</a></li>
                </ul>
            </li>

            <!-- Offers & Coupons -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">🎟️ Offers & Coupons</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCouponServlet?action=list">├── All Coupons</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCouponServlet?action=add">├── Add Coupon</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCouponServlet?action=edit">├── Edit Coupon</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminCouponServlet?action=expired">└── Expired Coupons</a></li>
                </ul>
            </li>

            <!-- Banners -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">🖼️ Banners</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminBannerServlet?action=list">├── Home Banners</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminBannerServlet?action=add">├── Add Banner</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminBannerServlet?action=edit">├── Edit Banner</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminBannerServlet?action=delete">└── Delete Banner</a></li>
                </ul>
            </li>

            <!-- Reviews -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">⭐ Reviews</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReviewServlet?action=list">├── All Reviews</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReviewServlet?action=pending">├── Pending Reviews</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReviewServlet?action=delete">└── Delete Review</a></li>
                </ul>
            </li>

            <!-- Reports -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">📊 Reports</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReportServlet?action=sales">├── Sales Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReportServlet?action=products">├── Product Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReportServlet?action=customers">├── Customer Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReportServlet?action=orders">├── Order Report</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminReportServlet?action=revenue">└── Revenue Report</a></li>
                </ul>
            </li>

            <!-- Settings -->
            <li class="nav-item mt-2">
                <span class="px-3 small text-muted font-weight-bold text-uppercase">⚙️ Settings</span>
                <ul class="nav flex-column pl-3 small mt-1">
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminSettingsServlet?action=profile">├── Admin Profile</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminSettingsServlet?action=password">├── Change Password</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminSettingsServlet?action=store">├── Store Settings</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary py-1" href="AdminSettingsServlet?action=payment">└── Payment Settings</a></li>
                </ul>
            </li>

            <!-- Logout -->
            <hr class="my-2">
            <li class="nav-item mb-5">
                <a class="nav-link text-danger font-weight-bold" href="../logout">
                    🚪 Logout
                </a>
            </li>
        </ul>
    </div>
</nav>
