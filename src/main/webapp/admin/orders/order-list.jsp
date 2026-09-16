<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="font-weight-bold">Order Management</h4>
        <div class="text-muted small">Showing ${currentStatus} Orders</div>
    </div>

    <!-- Order Status Filter Tabs -->
    <ul class="nav nav-pills mb-4 bg-white p-2 rounded shadow-sm">
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'All' || empty currentStatus ? 'active' : ''}" href="AdminOrderServlet?action=list&status=All">All</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Pending' ? 'active' : ''}" href="AdminOrderServlet?action=list&status=Pending">Pending</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Confirmed' ? 'active' : ''}" href="AdminOrderServlet?action=list&status=Confirmed">Confirmed</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Shipped' ? 'active' : ''}" href="AdminOrderServlet?action=list&status=Shipped">Shipped</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Delivered' ? 'active' : ''}" href="AdminOrderServlet?action=list&status=Delivered">Delivered</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Cancelled' ? 'active' : ''}" href="AdminOrderServlet?action=list&status=Cancelled">Cancelled</a>
        </li>
    </ul>

    <div class="admin-table-card">
        <div class="table-responsive">
            <table class="table mb-0">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Customer</th>
                        <th>Amount</th>
                        <th>Payment</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td class="font-weight-bold text-primary">#${order.orderNumber}</td>
                            <td>${order.createdAt}</td>
                            <td>${order.userName}</td>
                            <td class="font-weight-bold">₹${order.totalAmount}</td>
                            <td>
                                <div class="small">${order.paymentMethod}</div>
                                <span class="badge badge-admin ${order.paymentStatus == 'Success' ? 'badge-success' : 'badge-warning'}">
                                    ${order.paymentStatus}
                                </span>
                            </td>
                            <td>
                                <form action="AdminOrderServlet" method="GET" class="form-inline">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="id" value="${order.id}">
                                    <input type="hidden" name="statusFilter" value="${currentStatus}">
                                    <select name="status" class="form-control form-control-sm border-0 bg-light" onchange="this.form.submit()">
                                        <option value="Pending" ${order.orderStatus == 'Pending' || order.orderStatus == 'Placed' ? 'selected' : ''}>Pending</option>
                                        <option value="Confirmed" ${order.orderStatus == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                        <option value="Shipped" ${order.orderStatus == 'Shipped' ? 'selected' : ''}>Shipped</option>
                                        <option value="Delivered" ${order.orderStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                        <option value="Cancelled" ${order.orderStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                    </select>
                                </form>
                            </td>
                            <td>
                                <a href="AdminOrderServlet?action=details&id=${order.id}" class="btn btn-white btn-sm">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty orders}">
                        <tr>
                            <td colspan="7" class="text-center py-5">
                                <i class="fas fa-shopping-basket fa-3x text-muted mb-3"></i>
                                <p class="text-muted">No orders found for this status.</p>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
