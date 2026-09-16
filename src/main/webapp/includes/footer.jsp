<!-- Footer -->
<footer class="footer-main">
    <div class="container-premium">
        <div class="row">
            <div class="col-lg-7">
                <div class="row">
                    <!-- About -->
                    <div class="col-md-3 col-6 mb-4">
                        <h6>ABOUT</h6>
                        <a href="#">Contact Us</a>
                        <a href="#">About Us</a>
                        <a href="#">Careers</a>
                        <a href="#">SKRozaana Stories</a>
                        <a href="#">Press</a>
                    </div>
                    <!-- Help -->
                    <div class="col-md-3 col-6 mb-4">
                        <h6>HELP</h6>
                        <a href="#">Payments</a>
                        <a href="#">Shipping</a>
                        <a href="#">Cancellation & Returns</a>
                        <a href="#">FAQ</a>
                        <a href="#">Report Infringement</a>
                    </div>
                    <!-- Policy -->
                    <div class="col-md-3 col-6 mb-4">
                        <h6>POLICY</h6>
                        <a href="#">Return Policy</a>
                        <a href="#">Terms Of Use</a>
                        <a href="#">Security</a>
                        <a href="#">Privacy</a>
                        <a href="#">Sitemap</a>
                    </div>
                    <!-- Social -->
                    <div class="col-md-3 col-6 mb-4">
                        <h6>SOCIAL</h6>
                        <a href="#"><i class="fab fa-facebook-square mr-2"></i> Facebook</a>
                        <a href="#"><i class="fab fa-twitter mr-2"></i> Twitter</a>
                        <a href="#"><i class="fab fa-youtube mr-2"></i> YouTube</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 border-lg-left pl-lg-5 mt-4 mt-lg-0">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <h6>Registered Office Address:</h6>
                        <p class="text-white small" style="line-height: 1.6; opacity: 0.8;">
                            SKRozaanaBazaar Internet Private Limited,<br>
                            Buildings Alyssa, Begonia &<br>
                            Clove Embassy Tech Village,<br>
                            Outer Ring Road, Devarabeesanahalli Village,<br>
                            Bengaluru, 560103,<br>
                            Karnataka, India
                        </p>
                    </div>
                    <div class="col-md-6 mb-4">
                        <h6>Contact:</h6>
                        <p class="text-white small" style="opacity: 0.8;">CIN : U51109KA2012PTC066107<br>Telephone: <a href="tel:044-45614700" class="d-inline">044-45614700</a></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom d-flex flex-column flex-md-row justify-content-between align-items-center py-4 mt-4">
            <div class="mb-3 mb-md-0 d-flex flex-wrap justify-content-center">
                <a href="#" class="mx-3"><i class="fas fa-briefcase text-warning mr-2"></i> Become a Seller</a>
                <a href="#" class="mx-3"><i class="fas fa-star text-warning mr-2"></i> Advertise</a>
                <a href="#" class="mx-3"><i class="fas fa-gift text-warning mr-2"></i> Gift Cards</a>
                <a href="#" class="mx-3"><i class="fas fa-question-circle text-warning mr-2"></i> Help Center</a>
            </div>
            <div class="text-white small" style="opacity: 0.8;">
                &copy; 2024-2025 SKRozaanaBazaar.com
            </div>
            <div class="mt-3 mt-md-0">
                <img src="https://static-assets-web.flixcart.com/batman-returns/batman-returns/p/images/payment-method-c454fb.svg" class="img-fluid" alt="payments" style="height: 20px;">
            </div>
        </div>
    </div>
</footer>

<!-- External Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<script>
    $(document).ready(function() {
        // Sticky header transition
        $(window).scroll(function() {
            if ($(this).scrollTop() > 50) {
                $('.main-header').addClass('shadow');
            } else {
                $('.main-header').removeClass('shadow');
            }
        });

        // Hide splash screen after load
        const splash = document.getElementById('splash-screen');
        if (splash) {
            splash.classList.add('hidden');
            setTimeout(() => splash.style.display = 'none', 500);
        }
    });
</script>
