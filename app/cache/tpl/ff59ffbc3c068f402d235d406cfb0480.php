<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="./public/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="./public/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="./public/css/main.css" />

</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="title">
                <a href="./">爱编码的Farmer</a>
                <p>我是Farmer，我为自己代言</p>
            </div>
            <div class="nav-menu">
            	<?php foreach($navibar as $key=>$values):?>
            		<?php if(count($values['son'])!=0):?>
            			<div class="item">
                    		<?php echo $values['title'];?>
                    		<div class="sub-menu">
                    			<?php foreach($values['son'] as $keyNext=>$valuesNext):?>
                        			<a class="item" href="./class/<?php echo $keyNext;?>"><?php echo $valuesNext['title'];?></a>
                        		<?php endforeach;?>
                        	</div>
	                    </div>
            		<?php else:?>
            			<a class="item" href="./class/<?php echo $key;?>"><?php echo $values['title'];?></a>
            		<?php endif;?>
            	<?php endforeach;?>
                <div class="right item input">
                    <form class="search">
                        <input type="text" class="form-control" name="keyword" placeholder="请输入搜索内容..."></input>
                        <button class="btn btn-primary">搜索</button>
                    </form>
                </div>
            </div>
        </header>
        <div class="content">
        	<?php foreach($article as $value):?>
            <div class="article">
                <img src="public/img/895e296b74f654438d2b020989f51dae.jpg" />
                <div class="body">
                    <p><a href="./<?php echo date('Y/m/d',$value['time'])?>/<?php echo $value['id'];?>" class="title"><?php echo $value['title'];?></a></p>
                    <p><?php echo getSection($value['content'])?></p>
                    <p class="time"><b>发布时间: </b><?php echo date('Y年m月d日 H:i:s',$value['time'])?></p>
                </div>
            </div>
            <?php endforeach;?>
        </div>

        <footer class="clearfix"></footer>
    </div>
    <script src="./public/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function($){
            $('.nav-menu .item:has(.sub-menu)').hover(function(event) {
                $(this).find('.sub-menu').slideToggle().end();
            });

        })(jQuery);
    </script>
</body>

</html>
