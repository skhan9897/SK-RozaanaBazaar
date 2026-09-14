<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">User Management</h1>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover border">
            <thead class="bg-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Joined Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td class="font-weight-bold">${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.mobile}</td>
                        <td>
                            <span class="badge ${u.role == 'ADMIN' ? 'badge-danger' : 'badge-primary'}">${u.role}</span>
                        </td>
                        <td>
                            <span class="badge badge-success">${u.status}</span>
                        </td>
                        <td>${u.createdAt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="../includes/footer.jsp" %>
