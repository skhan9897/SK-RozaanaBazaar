    </div> <!-- End of #content -->
</div> <!-- End of #wrapper -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });

        // Highlight active link
        var currentUrl = window.location.href;
        $('#sidebar ul li a').each(function() {
            if (currentUrl.indexOf($(this).attr('href')) !== -1) {
                $(this).parent().addClass('active');
            }
        });
    });
</script>
</body>
</html>
