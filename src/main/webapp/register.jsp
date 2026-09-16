<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup | SKRozaanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="container auth-container py-5">
        <div class="auth-card" style="width: 900px;">
            <!-- Sidebar -->
            <div class="auth-sidebar d-none d-md-block">
                <h2 class="font-weight-bold mb-4">Looks like you're new here!</h2>
                <p class="h5" style="line-height: 1.5; opacity: 0.8;">Sign up with your mobile number to get started</p>
                <div style="margin-top: 150px;">
                    <img src="https://static-assets-web.flixcart.com/www/linchpin/fk-cp-zion/img/login_img_c4a81e.png" class="img-fluid" alt="login-icon">
                </div>
            </div>

            <!-- Form Side -->
            <div class="auth-form-side" style="overflow-y: auto; max-height: 80vh;">
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${errorMsg}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                </c:if>

                <form action="register" method="POST">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-4">
                                <label class="text-secondary small font-weight-bold">FULL NAME</label>
                                <input type="text" name="name" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-4">
                                <label class="text-secondary small font-weight-bold">EMAIL ID</label>
                                <input type="email" name="email" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-4">
                                <label class="text-secondary small font-weight-bold">MOBILE NUMBER</label>
                                <input type="text" name="mobile" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-4">
                                <label class="text-secondary small font-weight-bold">PASSWORD</label>
                                <input type="password" name="password" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group mb-4">
                        <label class="text-secondary small font-weight-bold">ADDRESS</label>
                        <textarea name="address" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none; resize: none;" rows="1" required></textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group mb-4">
                                <label class="text-secondary small font-weight-bold">CITY</label>
                                <input type="text" name="city" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group mb-4">
                                <label class="text-secondary small font-weight-bold">STATE</label>
                                <input type="text" name="state" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group mb-4">
                                <label class="text-secondary small font-weight-bold">PINCODE</label>
                                <input type="text" name="pincode" class="form-control border-top-0 border-left-0 border-right-0 rounded-0 px-0" style="border-bottom: 2px solid #ddd; box-shadow: none;" required>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-orange btn-block py-3 shadow mt-3">CONTINUE</button>
                    <a href="login.jsp" class="btn btn-white btn-block py-3 mt-3 shadow-sm">Existing User? Log in</a>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
