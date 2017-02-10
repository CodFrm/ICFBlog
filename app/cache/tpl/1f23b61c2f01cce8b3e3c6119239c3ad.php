<?php V()->display("public/header.tpl");?>
<?php V()->display("public/articlelist.tpl");?>

        <footer class="clearfix"></footer>
    </div>
    <script src="__HOME__/__PUBLIC__/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="__HOME__/__PUBLIC__/js/bootstrap.js" type="text/javascript"></script>
    <script src="__HOME__/__PUBLIC__/js/owl.carousel.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    (function($) {
        $('.nav-menu .item:has(.sub-menu)').hover(function(event) {
            $(this).find('.sub-menu').slideToggle().end();
        });


        $('#article-carousel').owlCarousel({
            items: 1,
            margin: 30,
            dots: true,
            //autoplay: true,
            loop: true,
            center: true,
            autoplayTimeout: 5000,
            autoplaySpeed: 800,
            autoplayHoverPause: true
        });

    })(jQuery);
    </script>
</body>

</html>
