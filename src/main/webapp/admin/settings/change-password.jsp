<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/sidebar.jsp" %>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm border-0 rounded-lg">
                <div class="card-header bg-white border-bottom py-3">
                    <h4 class="font-weight-bold mb-0 text-dark"><i class="fas fa-key mr-2 text-primary"></i> Change Password</h4>
                </div>
                <div class="card-body p-4">
                    <c:if test="${not empty successMsg}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            ${successMsg}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                    </c:if>
                    <c:if test="${not empty errorMsg}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${errorMsg}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                    </c:if>

                    <form action="AdminSettingsServlet" method="POST">
                        <input type="hidden" name="action" value="changePassword">

                        <div class="form-group mb-4">
                            <label class="font-weight-bold small text-uppercase text-muted">Current System-Generated Password</label>
                            <input type="password" name="currentPassword" class="form-control form-control-lg bg-light" placeholder="Enter current password" required>
                        </div>

                        <div class="form-group mb-4">
                            <label class="font-weight-bold small text-uppercase text-muted">New Password</label>
                            <input type="password" name="newPassword" class="form-control form-control-lg" placeholder="Enter new password" minlength="6" required>
                        </div>

                        <div class="form-group mb-4">
                            <label class="font-weight-bold small text-uppercase text-muted">Confirm New Password</label>
                            <input type="password" name="confirmPassword" class="form-control form-control-lg" placeholder="Confirm new password" minlength="6" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block btn-lg font-weight-bold shadow-sm py-3 mt-2">
                            Update Password <i class="fas fa-save ml-1"></i>
                        </button>
                    </form>

                    <div class="text-center mt-4">
                        <p class="text-muted small">
                            <i class="fas fa-info-circle mr-1"></i>
                            After updating, you will need to log in again with your new password for security.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="../includes/footer.jsp" %>
