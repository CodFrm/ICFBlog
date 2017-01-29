<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="./__PUBLIC__/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="./__PUBLIC__/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="./__PUBLIC__/css/main.css" />

</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="title">
                <a href="./">爱编码的Farmer</a>
                <p>我是Farmer，我为自己代言</p>
            </div>
            <div class="nav-menu">
            	{foreach $navibar as $key=>$values}
            		{if count($values['son'])!=0}
            			<div class="item">
                    		{$values['title']}
                    		<div class="sub-menu">
                    			{foreach $values['son'] as $keyNext=>$valuesNext}
                        			<a class="item" href="./class/{$keyNext}">{$valuesNext['title']}</a>
                        		{/foreach}
                        	</div>
	                    </div>
            		{else}
            			<a class="item" href="./class/{$key}">{$values['title']}</a>
            		{/if}
            	{/foreach}
                <div class="right item input">
                    <form class="search">
                        <input type="text" class="form-control" name="keyword" placeholder="请输入搜索内容..."></input>
                        <button class="btn btn-primary">搜索</button>
                    </form>
                </div>
            </div>
        </header>
        <div class="content">
        	{foreach $article as $value}
            <div class="article">
                <img src="__PUBLIC__/img/895e296b74f654438d2b020989f51dae.jpg" />
                <div class="body">
                    <p><a href="./{date('Y/m/d',$value['time'])}/{$value['id']}" class="title">{$value['title']}</a></p>
                    <p>{getSection($value['content'])}</p>
                    <p class="time"><b>发布时间: </b>{date('Y年m月d日 H:i:s',$value['time'])}</p>
                </div>
            </div>
            {/foreach}
        </div>

        <footer class="clearfix"></footer>
    </div>
    <script src="./__PUBLIC__/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function($){
            $('.nav-menu .item:has(.sub-menu)').hover(function(event) {
                $(this).find('.sub-menu').slideToggle().end();
            });

        })(jQuery);
    </script>
</body>

</html>
