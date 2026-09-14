<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Merchant Registration - SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body { background-color: #f4f7f6; }
        .register-container { max-width: 800px; margin: 50px auto; }
        .card { border-radius: 15px; border: none; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .card-header { background: #2b2b36; color: white; border-radius: 15px 15px 0 0 !important; text-align: center; padding: 20px; }
        .btn-merchant { background: #2b2b36; color: white; border-radius: 30px; padding: 10px 30px; font-weight: bold; }
        .btn-merchant:hover { background: #1a1a24; color: white; }
    </style>
</head>
<body>

<div class="container register-container">
    <div class="card">
        <div class="card-header">
            <h3><i class="fas fa-store mr-2"></i> Merchant Partnership Program</h3>
            <p class="mb-0">Grow your business with SK-RozaanaBazaar</p>
        </div>
        <div class="card-body p-4">
            <c:if test="${not empty errorMsg}">
                <div class="alert alert-danger text-center font-weight-bold mb-4">
                    <i class="fas fa-exclamation-triangle mr-2"></i> ${errorMsg}
                </div>
            </c:if>
            <form action="MerchantRegisterServlet" method="POST">
                <h5 class="text-primary border-bottom pb-2 mb-3">Personal Details</h5>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Full Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Mobile Number</label>
                        <input type="text" name="mobile" class="form-control" required>
                    </div>
                </div>

                <h5 class="text-primary border-bottom pb-2 mb-3 mt-4">Business & Legal Details</h5>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Business Name</label>
                        <input type="text" name="businessName" class="form-control" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Business Type</label>
                        <select name="businessType" class="form-control">
                            <option>Retailer</option>
                            <option>Wholesaler</option>
                            <option>Manufacturer</option>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>PAN Number</label>
                        <input type="text" name="pan" class="form-control" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>GSTIN</label>
                        <input type="text" name="gstin" class="form-control" required>
                    </div>
                    <div class="col-md-12 form-group">
                        <label>Business Address</label>
                        <textarea name="address" class="form-control" rows="3" required></textarea>
                    </div>
                </div>

                <div class="custom-control custom-checkbox mt-3">
                    <input type="checkbox" class="custom-control-input" id="terms" name="terms" required>
                    <label class="custom-control-label" for="terms">
                        I agree to the <a href="#">Merchant Terms & Conditions</a> and legal policies.
                    </label>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-merchant">Register as Merchant</button>
                    <div class="mt-3">
                        Already a Merchant? <a href="merchant-login.jsp">Login Here</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
