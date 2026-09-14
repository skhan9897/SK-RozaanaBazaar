<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">Category Management</h1>
        <a href="AdminCategoryServlet?action=add" class="btn btn-primary">Add New Category</a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover border">
            <thead class="bg-light">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Category Name</th>
                    <th>Parent ID</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cat" items="${categories}">
                    <tr>
                        <td>${cat.id}</td>
                        <td><img src="../../images/categories/${cat.image}" width="40"></td>
                        <td>${cat.name}</td>
                        <td>${cat.parentId == 0 ? 'Root' : cat.parentId}</td>
                        <td>
                            <span class="badge ${cat.status == 'active' ? 'badge-success' : 'badge-secondary'}">${cat.status}</span>
                        </td>
                        <td>
                            <a href="AdminCategoryServlet?action=edit&id=${cat.id}" class="btn btn-sm btn-info">Edit</a>
                            <a href="AdminCategoryServlet?action=delete&id=${cat.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="../includes/footer.jsp" %>
