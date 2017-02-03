<?php V()->display("public/header.tpl");?>
        <div class="content">

            <div class="article-detail">
                <h2 class="title"><?php echo $article['title'];?></h2>
                <div class="info clearfix">
                    <p class="pull-left"><?php echo $article['author'];?></p>
                    <p class="pull-right">时间: <?php echo date('Y年m月d日 H:i:s',$article['time']);?></p>
                </div>

                <div class="body">
                    <?php echo dealwithContent($article['content']);?>
                </div>
            </div>

        </div>
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

    })(jQuery);
    </script>
    <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"6","bdPos":"right","bdTop":"100"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>

</html>