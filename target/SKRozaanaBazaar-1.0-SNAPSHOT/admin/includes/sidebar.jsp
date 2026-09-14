<nav class="col-md-2 d-none d-md-block bg-white sidebar border-right" style="min-height: 90vh;">
    <div class="sidebar-sticky pt-3">
        <div class="px-3 mb-2 font-weight-bold text-uppercase text-secondary" style="font-size: 0.85rem;">SKRozanaBazaar ADMIN</div>
        <hr class="my-2">

        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="dashboard">
                    📊 Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminProductServlet">
                    📦 Products
                </a>
                <ul class="nav flex-column pl-3 small">
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminProductServlet?action=list">├── View Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminProductServlet?action=add">├── Add Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminProductServlet?action=edit">├── Edit Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminProductServlet?action=delete">├── Delete Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminProductServlet?action=updateStock">└── Update Stock</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminCategoryServlet">
                    📂 Categories
                </a>
                <ul class="nav flex-column pl-3 small">
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminCategoryServlet?action=add">├── Add Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminCategoryServlet?action=edit">├── Edit Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminCategoryServlet?action=delete">├── Delete Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminCategoryServlet?action=list">└── View Categories</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminOrderServlet">
                    🛒 Orders
                </a>
                <ul class="nav flex-column pl-3 small">
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminOrderServlet?action=list&status=All">├── All Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminOrderServlet?action=list&status=Pending">├── Pending</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminOrderServlet?action=list&status=Confirmed">├── Confirmed</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminOrderServlet?action=list&status=Shipped">├── Shipped</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminOrderServlet?action=list&status=Delivered">├── Delivered</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-muted py-1" href="AdminOrderServlet?action=list&status=Cancelled">└── Cancelled</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminUserServlet">
                    👥 Users
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    📈 Reports
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-danger" href="../logout">
                    🚪 Logout
                </a>
            </li>
        </ul>

        <hr class="my-2">
        <div class="px-3 py-2 small text-muted font-weight-bold bg-light rounded mx-2">
            💳 Payment Methods
            <ul class="list-unstyled mb-0 font-weight-normal mt-1 pl-1">
                <li>• Cash On Delivery</li>
                <li>• UPI</li>
                <li>• Card</li>
                <li>• Net Banking</li>
            </ul>
        </div>
    </div>
</nav>
