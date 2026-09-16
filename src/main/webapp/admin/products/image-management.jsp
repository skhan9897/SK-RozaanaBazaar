<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Image Management | SKRozanaBazaar Admin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/admin.css">
</head>
<body class="bg-light">
    <div class="d-flex">
        <%@ include file="../includes/sidebar.jsp" %>

        <div class="content-area p-4 w-100">
            <h2 class="mb-4">Product Image Management</h2>

            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm text-center p-3">
                        <h6 class="text-muted">Total Products</h6>
                        <h3 class="font-weight-bold">${totalProducts}</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm text-center p-3 border-left border-success">
                        <h6 class="text-muted">Generated</h6>
                        <h3 class="text-success font-weight-bold">${generatedCount}</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm text-center p-3 border-left border-warning">
                        <h6 class="text-muted">Pending</h6>
                        <h3 class="text-warning font-weight-bold">${pendingCount}</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm text-center p-3 border-left border-danger">
                        <h6 class="text-muted">Failed</h6>
                        <h3 class="text-danger font-weight-bold">${failedCount}</h3>
                    </div>
                </div>
            </div>

            <div class="card border-0 shadow-sm">
                <div class="card-body p-0">
                    <table class="table table-hover mb-0">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Primary Image</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${imageList}">
                                <tr>
                                    <td>#${item.productId}</td>
                                    <td>${item.productName}</td>
                                    <td>${item.categoryName}</td>
                                    <td>
                                        <c:if test="${not empty item.imagePath}">
                                            <img src="${item.imagePath}" width="50" height="50" class="rounded border">
                                        </c:if>
                                        <c:if test="${empty item.imagePath}">
                                            <span class="badge badge-secondary">No Image</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.status == 'GENERATED'}">
                                                <span class="badge badge-success">GENERATED</span>
                                            </c:when>
                                            <c:when test="${item.status == 'PENDING'}">
                                                <span class="badge badge-warning">PENDING</span>
                                            </c:when>
                                            <c:when test="${item.status == 'FAILED'}">
                                                <span class="badge badge-danger" title="${item.error}">FAILED</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-light">MISSING</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form action="image-management" method="POST" class="d-inline">
                                            <input type="hidden" name="productId" value="${item.productId}">
                                            <input type="hidden" name="action" value="regenerate">
                                            <button type="submit" class="btn btn-sm btn-outline-primary">
                                                <i class="fas fa-sync"></i> Regenerate
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
