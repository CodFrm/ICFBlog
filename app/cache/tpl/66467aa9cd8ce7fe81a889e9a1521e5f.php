<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><?php if(input('ctrl')=='article'):?>
<?php echo $article['title'];?>
    <?php else:?>
<?php echo getConfig('title')['value'];?>
<?php endif;?> | <?php echo getConfig('subtitle')['value'];?></title>
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/owl.carousel.min.css" />
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/owl.theme.default.min.css" />
    <link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/main.css" />
    <?php if(input('ctrl')=='article'):?><link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/detail.css" />
    <link type="text/css" rel="stylesheet" href="__HOME__/__PUBLIC__/css/syntaxhighlighter/shCoreDefault.css"/> 
    <script type="text/javascript" src="__HOME__/__PUBLIC__/js/syntaxhighlighter/shCore.js"></script>
    <script type="text/javascript">SyntaxHighlighter.all();</script>
    <?php endif;?>
</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="title">
                <a href="__HOME__"><?php echo getConfig('title')['value'];?></a>
                <p><?php echo getConfig('title2')['value'];?></p>
            </div>
            <div class="nav-menu">
            	<?php foreach(getNavibar() as $key=>$values):?>
            		<?php if(count($values['son'])!=0):?>
            			<div class="item">
                    		<a href="__HOME__<?php echo $key?('/sort/'.$key):'';?>"><?php echo $values['title'];?></a>
                    		<div class="sub-menu">
                    			<?php foreach($values['son'] as $keyNext=>$valuesNext):?>
                        			<a class="item" href="__HOME__/sort/<?php echo $keyNext;?>"><?php echo $valuesNext['title'];?></a>
                        		<?php endforeach;?>
                        	</div>
	                    </div>
            		<?php else:?>
            			<a class="item" href="__HOME__<?php echo $key?('/sort/'.$key):'';?>"><?php echo $values['title'];?></a>
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