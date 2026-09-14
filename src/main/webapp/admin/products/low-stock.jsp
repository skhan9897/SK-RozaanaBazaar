<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <h2 class="text-danger font-weight-bold mb-3">⚠️ Low Stock Products</h2>
    <div class="table-responsive">
        <table class="table table-striped table-bordered text-center">
            <thead class="bg-dark text-white">
                <tr>
                    <th>ID</th><th>Product Name</th><th>Brand</th><th>Stock Available</th><th>Status</th>
                </tr>
            </thead>
            <tbody class="font-weight-bold text-dark">
                <tr><td>13</td><td>Samsung Galaxy S24 Ultra</td><td>Samsung</td><td class="text-danger">5</td><td><span class="badge badge-success">ACTIVE</span></td></tr>
                <tr><td>25</td><td>Xiaomi Pad 6</td><td>Xiaomi</td><td class="text-danger">2</td><td><span class="badge badge-success">ACTIVE</span></td></tr>
                <tr><td>42</td><td>Dyson V11 Vacuum</td><td>Dyson</td><td class="text-danger">8</td><td><span class="badge badge-success">ACTIVE</span></td></tr>
            </tbody>
        </table>
    </div>
</main>
<%@ include file="../includes/footer.jsp" %>