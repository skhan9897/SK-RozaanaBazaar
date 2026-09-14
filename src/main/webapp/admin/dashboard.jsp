<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
    </div>

    <div class="row">
        <div class="col-md-3 mb-4">
            <div class="card bg-primary text-white shadow">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="text-white-50 small">Total Users</div>
                            <div class="text-lg font-weight-bold">${stats.totalUsers}</div>
                        </div>
                        <i class="fas fa-users fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card bg-success text-white shadow">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="text-white-50 small">Total Products</div>
                            <div class="text-lg font-weight-bold">${stats.totalProducts}</div>
                        </div>
                        <i class="fas fa-box fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card bg-info text-white shadow">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="text-white-50 small">Total Orders</div>
                            <div class="text-lg font-weight-bold">${stats.totalOrders}</div>
                        </div>
                        <i class="fas fa-shopping-cart fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card bg-warning text-white shadow">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <div class="text-white-50 small">Total Revenue</div>
                            <div class="text-lg font-weight-bold">₹${stats.totalRevenue}</div>
                        </div>
                        <i class="fas fa-rupee-sign fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <h3 class="mt-5">Recent Orders</h3>
    <div class="table-responsive mt-3">
        <table class="table table-striped table-sm border">
            <thead>
                <tr>
                    <th>Order #</th>
                    <th>Customer</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <!-- Recent orders would be fetched and displayed here -->
                <tr>
                    <td colspan="5" class="text-center py-4">No recent orders found.</td>
                </tr>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="includes/footer.jsp" %>
