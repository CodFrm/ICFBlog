{include 'public/header.tpl'}
        <div class="content">
            <div class="article-detail">
                <h2 class="title">{$article['title']}</h2>
                <div class="info clearfix">
                    <p class="pull-left">{$article['author']}</p>
                    <p class="pull-right">时间: {:date('Y年m月d日 H:i:s',$article['time'])}</p>
                </div>

                <div class="body">
                    {:dealwithContent($article['content'])}
                </div>
            </div>
               <div class="article-detail" style="margin-top: 20px;">
<!-- 多说评论框 start -->
	<div class="ds-thread" data-thread-key="{$article['articleid']}" data-title="{$article['title']}" data-url="__HOME__/{date('Y/m/d',$article['time'])}/{$article['articleid']}"></div>
<!-- 多说评论框 end -->
<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
<script type="text/javascript">
var duoshuoQuery = {short_name:"{getConfig('duoshuo')['value']}"};
	(function() {
		var ds = document.createElement('script');
		ds.type = 'text/javascript';ds.async = true;
		ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
		ds.charset = 'UTF-8';
		(document.getElementsByTagName('head')[0] 
		 || document.getElementsByTagName('body')[0]).appendChild(ds);
	})();
	</script>
<!-- 多说公共JS代码 end -->
        </div>
        </div>
    <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"6","bdPos":"right","bdTop":"100"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
{include 'public/footer.tpl'}