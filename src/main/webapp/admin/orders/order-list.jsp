<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">Order Management</h1>
    </div>

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
                                <select name="status" class="form-control form-control-sm mr-2" onchange="this.form.submit()">
                                    <option value="Placed" ${order.orderStatus == 'Placed' ? 'selected' : ''}>Placed</option>
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
