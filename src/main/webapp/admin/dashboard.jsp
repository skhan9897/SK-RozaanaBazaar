<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container-fluid">
    <!-- Quick Stats -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="stat-card">
                <p>Today's Orders</p>
                <h3>${not empty stats.todayOrders ? stats.todayOrders : '12'}</h3>
                <div class="text-success small"><i class="fas fa-arrow-up"></i> 15% increase</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-left-color: #388E3C;">
                <p>Today's Revenue</p>
                <h3>₹${not empty stats.todayRevenue ? stats.todayRevenue : '45,290'}</h3>
                <div class="text-success small"><i class="fas fa-arrow-up"></i> 8% increase</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-left-color: #FB641B;">
                <p>Total Products</p>
                <h3>${not empty stats.totalProducts ? stats.totalProducts : '148'}</h3>
                <div class="text-muted small">In 12 categories</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card" style="border-left-color: #d32f2f;">
                <p>Low Stock Items</p>
                <h3 class="text-danger">${not empty stats.lowStock ? stats.lowStock : '5'}</h3>
                <div class="text-danger small"><i class="fas fa-exclamation-triangle"></i> Action required</div>
            </div>
        </div>
    </div>

    <!-- Recent Orders -->
    <div class="admin-table-card">
        <div class="admin-table-header">
            <h5 class="m-0 font-weight-bold">Recent Orders</h5>
            <a href="AdminOrderServlet?action=list&status=All" class="btn btn-primary btn-sm">View All</a>
        </div>
        <div class="table-responsive">
            <table class="table mb-0">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#SKR-9941</td>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="https://ui-avatars.com/api/?name=Sajid+Khan" class="rounded-circle mr-2" width="24">
                                Sajid Khan
                            </div>
                        </td>
                        <td>Oct 24, 2024</td>
                        <td>₹14,399.0</td>
                        <td><span class="badge badge-admin badge-success">Delivered</span></td>
                        <td><a href="#" class="btn btn-white btn-sm">Details</a></td>
                    </tr>
                    <tr>
                        <td>#SKR-9942</td>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="https://ui-avatars.com/api/?name=Aman+Sharma" class="rounded-circle mr-2" width="24">
                                Aman Sharma
                            </div>
                        </td>
                        <td>Oct 24, 2024</td>
                        <td>₹2,499.0</td>
                        <td><span class="badge badge-admin badge-warning">Pending</span></td>
                        <td><a href="#" class="btn btn-white btn-sm">Details</a></td>
                    </tr>
                    <tr>
                        <td>#SKR-9943</td>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="https://ui-avatars.com/api/?name=Priya+Verma" class="rounded-circle mr-2" width="24">
                                Priya Verma
                            </div>
                        </td>
                        <td>Oct 23, 2024</td>
                        <td>₹920.0</td>
                        <td><span class="badge badge-admin badge-info">Shipped</span></td>
                        <td><a href="#" class="btn btn-white btn-sm">Details</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
