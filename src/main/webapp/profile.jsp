<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | SKRozanaBazaar</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .profile-input {
            background-color: #fafafa;
            border: 1px solid #e0e0e0;
            padding: 12px;
            width: 100%;
            max-width: 300px;
            font-size: 14px;
        }
        .profile-input:disabled {
            background-color: #f0f0f0;
            color: #878787;
        }
        .edit-link {
            color: #2874f0;
            font-weight: 500;
            cursor: pointer;
            font-size: 14px;
            margin-left: 20px;
        }
    </style>
</head>
<body style="background-color: #F1F3F6;">
    <%@ include file="includes/navbar.jsp" %>

    <div class="container-premium mt-4 mb-5">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-3">
                <div class="bg-white-card p-3 mb-3 d-flex align-items-center">
                    <img src="https://ui-avatars.com/api/?name=${user.name}&background=2874F0&color=fff" width="50" class="mr-3 rounded-circle">
                    <div>
                        <div class="small">Hello,</div>
                        <div class="font-weight-bold">${user.name != null ? user.name : 'Sajid Khan'}</div>
                    </div>
                </div>

                <div class="bg-white-card">
                    <div class="p-3 border-bottom d-flex align-items-center">
                        <i class="fas fa-box text-primary mr-3"></i>
                        <a href="OrderServlet" class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">My Orders</a>
                        <i class="fas fa-chevron-right ml-auto text-muted small"></i>
                    </div>

                    <div class="p-3 border-bottom">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-user text-primary mr-3"></i>
                            <span class="font-weight-bold text-uppercase text-primary" style="font-size: 14px;">Account Settings</span>
                        </div>
                        <div class="pl-5">
                            <a href="profile.jsp" class="d-block mb-2 small text-primary font-weight-bold">Profile Information</a>
                            <a href="#" class="d-block mb-2 small text-dark">Manage Addresses</a>
                            <a href="#" class="d-block small text-dark">PAN Card Information</a>
                        </div>
                    </div>

                    <div class="p-3 border-bottom">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-wallet text-primary mr-3"></i>
                            <span class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">Payments</span>
                        </div>
                        <div class="pl-5">
                            <a href="#" class="d-block mb-2 small text-dark">Gift Cards</a>
                            <a href="#" class="d-block mb-2 small text-dark">Saved VPA</a>
                            <a href="#" class="d-block small text-dark">Saved Cards</a>
                        </div>
                    </div>

                    <div class="p-3 border-bottom">
                        <div class="d-flex align-items-center mb-3">
                            <i class="fas fa-folder-open text-primary mr-3"></i>
                            <span class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">My Stuff</span>
                        </div>
                        <div class="pl-5">
                            <a href="#" class="d-block mb-2 small text-dark">My Coupons</a>
                            <a href="#" class="d-block mb-2 small text-dark">My Reviews & Ratings</a>
                            <a href="#" class="d-block mb-2 small text-dark">All Notifications</a>
                            <a href="wishlist.jsp" class="d-block small text-dark">My Wishlist</a>
                        </div>
                    </div>

                    <div class="p-3 d-flex align-items-center">
                        <i class="fas fa-power-off text-primary mr-3"></i>
                        <a href="logout" class="font-weight-bold text-uppercase text-secondary" style="font-size: 14px;">Logout</a>
                    </div>
                </div>

                <div class="bg-white-card mt-3 p-3">
                    <h6 class="font-weight-bold mb-3">Frequently Asked Questions</h6>
                    <p class="small text-muted mb-2">What happens when I update my email address (or mobile number)?</p>
                    <p class="small text-muted">What will happen to my SKRozanaBazaar account if I update my email address?</p>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-lg-9 col-12 mt-3 mt-lg-0">
                <div class="bg-white-card p-4">
                    <div class="mb-5">
                        <div class="d-flex align-items-center mb-4">
                            <h5 class="font-weight-bold m-0 mr-3">Personal Information</h5>
                            <span class="edit-link">Edit</span>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <input type="text" class="profile-input" value="${user.name != null ? user.name.split(' ')[0] : 'Sajid'}" disabled placeholder="First Name">
                            </div>
                            <div class="col-md-6 mb-3">
                                <input type="text" class="profile-input" value="${user.name != null && user.name.split(' ').length > 1 ? user.name.split(' ')[1] : 'Khan'}" disabled placeholder="Last Name">
                            </div>
                        </div>
                        <div class="mt-3">
                            <label class="d-block mb-2 small font-weight-bold text-secondary">Your Gender</label>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="male" name="gender" class="custom-control-input" checked disabled>
                                <label class="custom-control-label" for="male">Male</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="female" name="gender" class="custom-control-input" disabled>
                                <label class="custom-control-label" for="female">Female</label>
                            </div>
                        </div>
                    </div>

                    <div class="mb-5">
                        <div class="d-flex align-items-center mb-4">
                            <h5 class="font-weight-bold m-0 mr-3">Email Address</h5>
                            <span class="edit-link">Edit</span>
                        </div>
                        <input type="email" class="profile-input" value="${user.email != null ? user.email : 'sajid@example.com'}" disabled>
                    </div>

                    <div class="mb-5">
                        <div class="d-flex align-items-center mb-4">
                            <h5 class="font-weight-bold m-0 mr-3">Mobile Number</h5>
                            <span class="edit-link">Edit</span>
                        </div>
                        <input type="text" class="profile-input" value="${user.phone != null ? user.phone : '+91 9876543210'}" disabled>
                    </div>

                    <div class="pt-4 border-top">
                        <h5 class="font-weight-bold mb-4">FAQs</h5>
                        <div class="small mb-4">
                            <p class="font-weight-bold mb-2">What happens when I update my email address (or mobile number)?</p>
                            <p class="text-muted">Your login email id (or mobile number) changes, likewise. You'll receive all your account related communication on your updated email address (or mobile number).</p>
                        </div>
                        <div class="small mb-4">
                            <p class="font-weight-bold mb-2">When will my SKRozanaBazaar account be updated with the new email address (or mobile number)?</p>
                            <p class="text-muted">It happens instantly. You can start using your new email address (or mobile number) to login after you confirm it.</p>
                        </div>
                    </div>

                    <div class="text-right mt-4">
                        <a href="#" class="text-danger small font-weight-bold">Deactivate Account</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp" %>
</body>
</html>
