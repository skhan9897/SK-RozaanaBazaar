<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <h2 class="font-weight-bold text-dark mb-3">💳 Payment Ledger History</h2>
    <table class="table table-bordered table-striped text-center">
        <thead class="bg-success text-white">
            <tr><th>Transaction ID</th><th>Order #</th><th>Payment Method</th><th>Amount</th><th>Status</th>
        </thead>
        <tbody class="font-weight-bold">
            <tr><td>TXN-88231</td><td>#SKRB-9941</td><td>UPI</td><td>₹14,399.0</td><td><span class="badge badge-success">Successful</span></td></tr>
        </tbody>
    </table>
</main>
<%@ include file="../includes/footer.jsp" %>