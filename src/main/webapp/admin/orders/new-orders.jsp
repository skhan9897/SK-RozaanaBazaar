<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <h2 class="text-warning font-weight-bold mb-3">⏳ New Incoming Orders</h2>
    <div class="table-responsive">
        <table class="table table-hover table-bordered text-center">
            <thead class="bg-warning text-dark">
                <tr>
                    <th>Order #</th><th>Customer</th><th>Amount</th><th>Method</th><th>Status</th>
                </tr>
            </thead>
            <tbody class="font-weight-bold">
                <tr><td class="text-primary">#SKRB-9941</td><td>Sajid Khan</td><td>₹14,399.0</td><td>UPI</td><td><span class="badge badge-warning">Placed</span></td></tr>
            </tbody>
        </table>
    </div>
</main>
<%@ include file="../includes/footer.jsp" %>