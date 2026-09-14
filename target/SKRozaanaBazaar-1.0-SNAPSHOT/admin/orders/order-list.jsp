<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">Order Management</h1>
    </div>

    <!-- Order Status Filter Tabs -->
    <ul class="nav nav-tabs mb-4">
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'All' ? 'active font-weight-bold' : ''}" href="AdminOrderServlet?action=list&status=All">All Orders</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Pending' ? 'active font-weight-bold' : ''}" href="AdminOrderServlet?action=list&status=Pending">Pending</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Confirmed' ? 'active font-weight-bold' : ''}" href="AdminOrderServlet?action=list&status=Confirmed">Confirmed</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Shipped' ? 'active font-weight-bold' : ''}" href="AdminOrderServlet?action=list&status=Shipped">Shipped</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Delivered' ? 'active font-weight-bold' : ''}" href="AdminOrderServlet?action=list&status=Delivered">Delivered</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${currentStatus == 'Cancelled' ? 'active font-weight-bold' : ''}" href="AdminOrderServlet?action=list&status=Cancelled">Cancelled</a>
        </li>
    </ul>

    <div class="table-responsive">
        <table class="table table-striped table-hover border">
            <thead class="bg-light">
                <tr>
                    <th>Order #</th>
                    <th>Date</th>
                    <th>Total Amount</th>
                    <th>Payment</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td class="font-weight-bold text-primary">${order.orderNumber}</td>
                        <td>${order.createdAt}</td>
                        <td>₹${order.totalAmount}</td>
                        <td>${order.paymentMethod} (${order.paymentStatus})</td>
                        <td>
                            <form action="AdminOrderServlet" method="GET" class="form-inline">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="id" value="${order.id}">
                                <input type="hidden" name="statusFilter" value="${currentStatus}">
                                <select name="status" class="form-control form-control-sm mr-2" onchange="this.form.submit()">
                                    <option value="Pending" ${order.orderStatus == 'Pending' || order.orderStatus == 'Placed' ? 'selected' : ''}>Pending</option>
                                    <option value="Confirmed" ${order.orderStatus == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                                    <option value="Shipped" ${order.orderStatus == 'Shipped' ? 'selected' : ''}>Shipped</option>
                                    <option value="Delivered" ${order.orderStatus == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                    <option value="Cancelled" ${order.orderStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                </select>
                            </form>
                        </td>
                        <td>
                            <a href="AdminOrderServlet?action=details&id=${order.id}" class="btn btn-outline-primary btn-sm">Details</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="../includes/footer.jsp" %>
