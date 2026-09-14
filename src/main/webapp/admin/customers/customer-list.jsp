<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <h2 class="font-weight-bold text-dark mb-3">👥 Customer Management Directory</h2>
    <table class="table table-bordered table-striped text-center">
        <thead class="bg-dark text-white text-uppercase small">
            <tr><th>User ID</th><th>Name</th><th>Email</th><th>Mobile</th><th>Status</th>
        </thead>
        <tbody class="font-weight-bold">
            <tr><td>101</td><td>Sajid Khan</td><td>sajid@example.com</td><td>+91 9876543210</td><td><span class="badge badge-success">ACTIVE</span></td></tr>
        </tbody>
    </table>
</main>
<%@ include file="../includes/footer.jsp" %>