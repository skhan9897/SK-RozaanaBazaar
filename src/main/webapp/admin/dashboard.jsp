<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2 font-weight-bold text-dark"><i class="fa-solid fa-chart-pie mr-2 text-primary"></i> Dashboard Home</h1>
        <div class="text-muted font-weight-bold">Welcome back, Admin <i class="fa-solid fa-circle-user ml-1"></i></div>
    </div>

    <!-- Quick Stats Cards Block -->
    <div class="row">
        <!-- Today's Orders -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #007bff !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-muted small tracking-wide"><i class="fa-solid fa-calendar-day mr-1"></i> Today's Orders</div>
                    <div class="h2 font-weight-bold text-dark mt-1">${not empty stats.todayOrders ? stats.todayOrders : '4'}</div>
                </div>
            </div>
        </div>

        <!-- Today's Revenue -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #28a745 !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-muted small tracking-wide"><i class="fa-solid fa-indian-rupee-sign mr-1"></i> Today's Revenue</div>
                    <div class="h2 font-weight-bold text-dark mt-1">₹${not empty stats.todayRevenue ? stats.todayRevenue : '95996.0'}</div>
                </div>
            </div>
        </div>

        <!-- Total Orders -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #ffc107 !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-muted small tracking-wide"><i class="fa-solid fa-basket-shopping mr-1"></i> Total Orders</div>
                    <div class="h2 font-weight-bold text-dark mt-1">${not empty stats.totalOrders ? stats.totalOrders : '4'}</div>
                </div>
            </div>
        </div>

        <!-- Total Customers -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #17a2b8 !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-muted small tracking-wide"><i class="fa-solid fa-users mr-1"></i> Total Customers</div>
                    <div class="h2 font-weight-bold text-dark mt-1">${not empty stats.totalUsers ? stats.totalUsers : '3'}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Total Products -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #6c757d !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-muted small tracking-wide"><i class="fa-solid fa-boxes-stacked mr-1"></i> Total Products</div>
                    <div class="h2 font-weight-bold text-dark mt-1">${not empty stats.totalProducts ? stats.totalProducts : '60'}</div>
                </div>
            </div>
        </div>

        <!-- Low Stock Alert -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #dc3545 !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-danger small tracking-wide"><i class="fa-solid fa-triangle-exclamation mr-1"></i> Low Stock Alert</div>
                    <div class="h2 font-weight-bold text-danger mt-1">${not empty stats.lowStock ? stats.lowStock : '0'}</div>
                </div>
            </div>
        </div>

        <!-- Pending Orders -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #fd7e14 !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-warning small tracking-wide"><i class="fa-solid fa-clock-rotate-left mr-1"></i> Pending Orders</div>
                    <div class="h2 font-weight-bold text-dark mt-1">${not empty stats.pendingOrders ? stats.pendingOrders : '4'}</div>
                </div>
            </div>
        </div>

        <!-- Delivered Orders -->
        <div class="col-md-3 mb-4">
            <div class="card bg-white border-0 shadow-sm rounded-lg p-2" style="border-left: 5px solid #20c997 !important;">
                <div class="card-body py-3">
                    <div class="text-uppercase font-weight-bold text-success small tracking-wide"><i class="fa-solid fa-circle-check mr-1"></i> Delivered Orders</div>
                    <div class="h2 font-weight-bold text-dark mt-1">${not empty stats.deliveredOrders ? stats.deliveredOrders : '0'}</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Orders Section -->
    <div class="card bg-white border-0 shadow-sm rounded-lg mt-2">
        <div class="card-header bg-white border-bottom py-3 font-weight-bold text-secondary">
            <i class="fa-solid fa-list-ul mr-2"></i> Recent Orders History
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0 text-center">
                    <thead class="bg-light text-muted text-uppercase small">
                        <tr>
                            <th class="py-3 border-0">Order ID</th>
                            <th class="py-3 border-0">Customer</th>
                            <th class="py-3 border-0">Amount</th>
                        </tr>
                    </thead>
                    <tbody class="text-dark font-weight-bold">
                        <tr>
                            <td class="py-3 text-primary">#SKRB-9941</td>
                            <td class="py-3">Sajid Khan</td>
                            <td class="py-3 text-success">₹14,399.0</td>
                        </tr>
                        <tr>
                            <td class="py-3 text-primary">#SKRB-9942</td>
                            <td class="py-3">Aman Sharma</td>
                            <td class="py-3 text-success">₹2,499.0</td>
                        </tr>
                        <tr>
                            <td class="py-3 text-primary">#SKRB-9943</td>
                            <td class="py-3">Priya Verma</td>
                            <td class="py-3 text-success">₹920.0</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<%@ include file="includes/footer.jsp" %>
