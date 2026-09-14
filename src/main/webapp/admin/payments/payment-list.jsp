<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h2 class="font-weight-bold text-dark"><i class="fa-solid fa-credit-card mr-2 text-success"></i> Payment Ledger History</h2>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover text-center shadow-sm">
            <thead class="bg-success text-white">
                <tr>
                    <th>Order #</th>
                    <th>Customer ID</th>
                    <th>Payment Method</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody class="font-weight-bold">
                <c:forEach var="p" items="${payments}">
                    <tr>
                        <td>${p.orderNumber}</td>
                        <td>${p.userId}</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.paymentMethod == 'UPI'}"><i class="fa-solid fa-mobile-screen-button mr-1 text-primary"></i></c:when>
                                <c:when test="${p.paymentMethod == 'Card'}"><i class="fa-solid fa-credit-card mr-1 text-info"></i></c:when>
                                <c:otherwise><i class="fa-solid fa-money-bill-1-wave mr-1 text-success"></i></c:otherwise>
                            </c:choose>
                            ${p.paymentMethod}
                        </td>
                        <td class="text-success">₹${p.totalAmount}</td>
                        <td class="small">${p.createdAt}</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.paymentStatus == 'Successful'}">
                                    <span class="badge badge-success px-3 py-2">Successful</span>
                                </c:when>
                                <c:when test="${p.paymentStatus == 'Pending'}">
                                    <span class="badge badge-warning px-3 py-2 text-white">Pending</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-danger px-3 py-2">${p.paymentStatus}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty payments}">
                    <tr>
                        <td colspan="6" class="py-5 text-muted">No payment records found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>
<%@ include file="../includes/footer.jsp" %>
