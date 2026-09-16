<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>

<div class="container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent p-0 small">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=list">Products</a></li>
            <li class="breadcrumb-item active">Add New Product</li>
        </ol>
    </nav>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="font-weight-bold">Add New Product</h4>
        <a href="${pageContext.request.contextPath}/admin/AdminProductServlet?action=list" class="btn btn-white btn-sm">
            <i class="fas fa-arrow-left mr-2"></i> Back to List
        </a>
    </div>

    <div class="admin-form-card">
        <form action="AdminProductServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add">

            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" name="productName" class="form-control" placeholder="e.g. Samsung Galaxy S21" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" class="form-control" rows="6" placeholder="Describe the product features..."></textarea>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Brand</label>
                                <input type="text" name="brand" class="form-control" placeholder="e.g. Samsung">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>SKU / Model Number</label>
                                <input type="text" name="sku" class="form-control" placeholder="e.g. SM-G991B">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="bg-light p-3 rounded border mb-4">
                        <h6 class="font-weight-bold mb-3 border-bottom pb-2">Organization</h6>
                        <div class="form-group">
                            <label>Category</label>
                            <select name="categoryId" class="form-control" required>
                                <option value="">Select Category</option>
                                <c:forEach var="cat" items="${categories}">
                                    <option value="${cat.id}">${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select name="status" class="form-control">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>

                    <div class="bg-light p-3 rounded border">
                        <h6 class="font-weight-bold mb-3 border-bottom pb-2">Product Image</h6>
                        <div class="text-center mb-3">
                            <div id="imagePreview" class="border rounded d-flex align-items-center justify-content-center" style="height: 150px; background: #fff;">
                                <i class="fas fa-image fa-3x text-muted"></i>
                            </div>
                        </div>
                        <div class="custom-file">
                            <input type="file" name="image" class="custom-file-input" id="productImage" onchange="previewFile()">
                            <label class="custom-file-label" for="productImage">Choose file</label>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="my-4">

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>MRP (Base Price)</label>
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">₹</span></div>
                            <input type="number" name="price" id="mrp" class="form-control" placeholder="0.00" step="0.01" required>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Discount (%)</label>
                        <div class="input-group">
                            <input type="number" name="discount" id="discount" class="form-control" value="0" min="0" max="100">
                            <div class="input-group-append"><span class="input-group-text">%</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Final Selling Price</label>
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">₹</span></div>
                            <input type="number" name="finalPrice" id="sellingPrice" class="form-control bg-light" readonly>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Stock Quantity</label>
                        <input type="number" name="stock" class="form-control" value="0" required>
                    </div>
                </div>
            </div>

            <div class="mt-4 pt-3 border-top text-right">
                <button type="submit" class="btn btn-primary px-5 py-2 font-weight-bold shadow-sm">
                    <i class="fas fa-save mr-2"></i> Publish Product
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Selling price calculation
    const mrpInput = document.getElementById('mrp');
    const discountInput = document.getElementById('discount');
    const sellingPriceInput = document.getElementById('sellingPrice');

    function updatePrice() {
        const mrp = parseFloat(mrpInput.value) || 0;
        const discount = parseFloat(discountInput.value) || 0;
        const final = mrp - (mrp * discount / 100);
        sellingPriceInput.value = final.toFixed(2);
    }

    mrpInput.addEventListener('input', updatePrice);
    discountInput.addEventListener('input', updatePrice);

    // Image preview
    function previewFile() {
        const preview = document.querySelector('#imagePreview');
        const file = document.querySelector('#productImage').files[0];
        const reader = new FileReader();

        reader.onloadend = function () {
            preview.innerHTML = `<img src="${reader.result}" style="max-height: 100%; max-width: 100%;">`;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.innerHTML = '<i class="fas fa-image fa-3x text-muted"></i>';
        }
    }
</script>

<%@ include file="../includes/footer.jsp" %>
