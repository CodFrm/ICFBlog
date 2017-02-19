
</div>
</div>
</body>
<script src="__HOME__/__PUBLIC__/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="__HOME__/__PUBLIC__/js/edit.js" type="text/javascript"></script>
<script type="text/javascript">
    $(".content").width($(window).width() - 180);
    $(document).ready(function() {
        $(window).resize(function() {
            $(".content").width($(window).width() - 180);
        });
    });
    (function($) {
        $('.nav .item a').click(function(event) {
            $(this).parent().find('.sub-nav').slideToggle().end();
        });
    })(jQuery);
</script>

</html>
