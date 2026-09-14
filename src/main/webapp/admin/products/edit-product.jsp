<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent p-0">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=list">Products</a></li>
            <li class="breadcrumb-item active" aria-current="page">Edit Product</li>
        </ol>
    </nav>

    <div class="card shadow-sm border-0 rounded-lg">
        <div class="card-header bg-white border-bottom py-3">
            <h4 class="font-weight-bold mb-0 text-dark"><i class="fa-solid fa-edit mr-2 text-warning"></i> Edit Product</h4>
        </div>
        <div class="card-body p-4">
            <form action="AdminProductServlet" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${product.id}">

                <div class="row">
                    <!-- Basic Information -->
                    <div class="col-md-8">
                        <div class="form-group mb-3">
                            <label class="font-weight-bold small text-uppercase text-muted">Product Name</label>
                            <input type="text" name="productName" class="form-control" value="${product.productName}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label class="font-weight-bold small text-uppercase text-muted">Description</label>
                            <textarea name="description" class="form-control" rows="4">${product.description}</textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group mb-3">
                                <label class="font-weight-bold small text-uppercase text-muted">Brand</label>
                                <input type="text" name="brand" class="form-control" value="${product.brand}">
                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label class="font-weight-bold small text-uppercase text-muted">SKU</label>
                                <input type="text" name="sku" class="form-control" value="${product.sku}">
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Info -->
                    <div class="col-md-4 border-left">
                        <div class="form-group mb-3">
                            <label class="font-weight-bold small text-uppercase text-muted">Category</label>
                            <select name="categoryId" class="form-control" required>
                                <c:forEach var="cat" items="${categories}">
                                    <option value="${cat.id}" ${product.categoryId == cat.id ? 'selected' : ''}>${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label class="font-weight-bold small text-uppercase text-muted">Status</label>
                            <select name="status" class="form-control">
                                <option value="ACTIVE" ${product.status == 'ACTIVE' ? 'selected' : ''}>Active</option>
                                <option value="INACTIVE" ${product.status == 'INACTIVE' ? 'selected' : ''}>Inactive</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label class="font-weight-bold small text-uppercase text-muted">Current Image</label>
                            <div class="mb-2">
                                <img src="${product.image}" style="height: 100px; object-fit: contain;" class="border p-1 rounded">
                            </div>
                            <div class="custom-file">
                                <input type="file" name="image" class="custom-file-input" id="customFile">
                                <label class="custom-file-label" for="customFile">Change file</label>
                            </div>
                        </div>
                    </div>
                </div>

                <hr class="my-4">

                <!-- Pricing and Stock -->
                <div class="row">
                    <div class="col-md-3 form-group mb-3">
                        <label class="font-weight-bold small text-uppercase text-muted">MRP (₹)</label>
                        <input type="number" name="price" id="mrp" class="form-control" value="${product.price}" step="0.01" required>
                    </div>
                    <div class="col-md-3 form-group mb-3">
                        <label class="font-weight-bold small text-uppercase text-muted">Discount (%)</label>
                        <input type="number" name="discount" id="discount" class="form-control" value="${product.discount}" min="0" max="100">
                    </div>
                    <div class="col-md-3 form-group mb-3">
                        <label class="font-weight-bold small text-uppercase text-muted">Selling Price (₹)</label>
                        <input type="number" name="finalPrice" id="sellingPrice" class="form-control bg-light" value="${product.finalPrice}" readonly>
                    </div>
                    <div class="col-md-3 form-group mb-3">
                        <label class="font-weight-bold small text-uppercase text-muted">Stock Quantity</label>
                        <input type="number" name="stock" class="form-control" value="${product.stock}" required>
                    </div>
                </div>

                <div class="form-group mt-4">
                    <button type="submit" class="btn btn-warning btn-lg px-5 font-weight-bold shadow-sm">
                        <i class="fa-solid fa-sync mr-2"></i> Update Product
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=list" class="btn btn-light btn-lg px-4 ml-2">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</main>

<script>
    document.getElementById('mrp').addEventListener('input', calculateSellingPrice);
    document.getElementById('discount').addEventListener('input', calculateSellingPrice);

    function calculateSellingPrice() {
        let mrp = parseFloat(document.getElementById('mrp').value) || 0;
        let discount = parseFloat(document.getElementById('discount').value) || 0;
        let sellingPrice = mrp - (mrp * discount / 100);
        document.getElementById('sellingPrice').value = sellingPrice.toFixed(2);
    }
</script>

<%@ include file="../includes/footer.jsp" %>
