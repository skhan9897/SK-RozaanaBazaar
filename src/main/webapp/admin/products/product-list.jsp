<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="font-weight-bold">Product Management</h4>
        <a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=add" class="btn btn-primary">
            <i class="fas fa-plus mr-2"></i> Add New Product
        </a>
    </div>

    <div class="admin-table-card">
        <div class="admin-table-header">
            <h5 class="m-0 font-weight-bold">All Products</h5>
            <div class="d-flex">
                <input type="text" class="form-control form-control-sm mr-2" placeholder="Search products...">
                <select class="form-control form-control-sm">
                    <option>All Categories</option>
                </select>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table mb-0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Product Name</th>
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
                            <td>#${p.id}</td>
                            <td>
                                <img src="../../images/products/${p.image}" class="rounded border" width="40" height="40" style="object-fit: cover;">
                            </td>
                            <td>
                                <div class="font-weight-bold">${p.productName}</div>
                                <small class="text-muted">SKU: ${p.sku}</small>
                            </td>
                            <td>${p.brand}</td>
                            <td>
                                <div class="font-weight-bold">₹${p.finalPrice}</div>
                                <del class="text-muted small">₹${p.price}</del>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.stock < 10}">
                                        <span class="text-danger font-weight-bold"><i class="fas fa-exclamation-triangle mr-1"></i> ${p.stock}</span>
                                    </c:when>
                                    <c:otherwise>${p.stock}</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <span class="badge badge-admin ${p.status == 'active' ? 'badge-success' : 'badge-secondary'}">
                                    ${p.status}
                                </span>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <a href="AdminProductServlet?action=edit&id=${p.id}" class="btn btn-white btn-sm" title="Edit">
                                        <i class="fas fa-edit text-primary"></i>
                                    </a>
                                    <a href="AdminProductServlet?action=delete&id=${p.id}" class="btn btn-white btn-sm" title="Delete" onclick="return confirm('Are you sure?')">
                                        <i class="fas fa-trash text-danger"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty products}">
                        <tr>
                            <td colspan="8" class="text-center py-5">
                                <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                                <p class="text-muted">No products found in the database.</p>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
