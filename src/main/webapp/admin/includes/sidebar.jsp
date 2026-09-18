<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Sidebar -->
<nav id="sidebar" class="d-none d-md-block">
    <div class="sidebar-header">
        <h4 class="m-0 text-white font-weight-bold">SKRozanaBazaar</h4>
        <small class="text-muted">Merchant Console</small>
    </div>

    <ul class="list-unstyled components">
        <li class="active">
            <a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        </li>
        <li>
            <a href="#productSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fas fa-box"></i> Products</a>
            <ul class="collapse list-unstyled" id="productSubmenu">
                <li><a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=list">All Products</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=add">Add New Product</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/image-management">Image Management</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=lowstock">Low Stock Items</a></li>
            </ul>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/AdminOrderServlet?action=list&status=All"><i class="fas fa-shopping-cart"></i> Orders</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/AdminCategoryServlet?action=list"><i class="fas fa-list"></i> Categories</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/AdminCustomerServlet?action=list"><i class="fas fa-users"></i> Customers</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/AdminCouponServlet?action=list"><i class="fas fa-ticket-alt"></i> Coupons</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/AdminBannerServlet?action=list"><i class="fas fa-image"></i> Banners</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/AdminReportServlet?action=sales"><i class="fas fa-chart-line"></i> Reports</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/AdminSettingsServlet?action=profile"><i class="fas fa-cog"></i> Settings</a>
        </li>
        <li class="mt-4">
            <a href="${pageContext.request.contextPath}/logout" class="text-danger"><i class="fas fa-power-off"></i> Logout</a>
        </li>
    </ul>
</nav>

<!-- Page Content wrapper -->
<div id="content">
    <div class="admin-header">
        <button type="button" id="sidebarCollapse" class="btn btn-primary d-md-none">
            <i class="fas fa-align-left"></i>
        </button>
        <h5 class="m-0 font-weight-bold d-none d-md-block">Merchant Dashboard</h5>
        <div class="d-flex align-items-center">
            <div class="dropdown">
                <a class="dropdown-toggle text-dark font-weight-bold" href="#" id="adminProfile" data-toggle="dropdown">
                    <img src="https://ui-avatars.com/api/?name=${user.name}&background=2874F0&color=fff" class="rounded-circle mr-2" width="32">
                    ${user.name}
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="AdminSettingsServlet?action=profile">Profile</a>
                    <a class="dropdown-item" href="AdminSettingsServlet?action=password">Settings</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
