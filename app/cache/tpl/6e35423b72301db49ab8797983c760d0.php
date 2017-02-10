<?php V()->display("public/header.tpl");?>


		<div class="content">
        	<?php foreach(searchArticle(input('get.keyword')) as $value):?>
            <div class="article">
            	<?php if($img=getArticleFirstImg($value['content'])):?>
                	<img src="<?php echo $img;?>" />
                <?php endif;?>
                <div class="body">
                     <p><a href="__HOME__/<?php echo date('Y/m/d',$value['time']);?>/<?php echo $value['id'];?>" class="title"><?php echo $value['title'];?></a></p>
                     <p class="desc"><?php echo getSection($value['content']);?></p>
                    <p class="time"><b>发布时间: </b><?php echo date('Y年m月d日 H:i:s',$value['time']);?></p>
                </div>
            </div>
            <?php endforeach;?>
        </div>
<?php V()->display("public/footer.tpl");?>