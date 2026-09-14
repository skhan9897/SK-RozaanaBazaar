<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">Product Management</h1>
        <a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=add" class="btn btn-primary">Add New Product</a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover border">
            <thead class="bg-light">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${products}">
                    <tr>
                        <td>${p.id}</td>
                        <td><img src="../../images/products/${p.image}" width="40"></td>
                        <td>${p.productName}</td>
                        <td>${p.brand}</td>
                        <td>₹${p.finalPrice}</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.stock < 10}">
                                    <span class="text-danger font-weight-bold">${p.stock}</span>
                                </c:when>
                                <c:otherwise>${p.stock}</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <span class="badge ${p.status == 'active' ? 'badge-success' : 'badge-secondary'}">${p.status}</span>
                        </td>
                        <td>
                            <a href="AdminProductServlet?action=edit&id=${p.id}" class="btn btn-sm btn-info">Edit</a>
                            <a href="AdminProductServlet?action=delete&id=${p.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<%@ include file="../includes/footer.jsp" %>
