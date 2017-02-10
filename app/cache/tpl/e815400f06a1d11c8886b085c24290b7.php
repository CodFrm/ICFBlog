		<div class="content">
        	<?php foreach(getArticle(input('get.sort'),$page) as $value):?>
            <div class="article">
            	<?php if($img=getArticleFirstImg($value['content'])):?>
                	<img src="<?php echo $img;?>" />
                <?php endif;?>
                <div class="body">
                     <p><a href="__HOME__/<?php echo date('Y/m/d',$value['time']);?>/<?php echo $value['id'];?>" class="title"><?php echo $value['title'];?></a></p>
                     <p class="desc"><a href="__HOME__/<?php echo date('Y/m/d',$value['time']);?>/<?php echo $value['id'];?>"><?php echo getSection($value['content']);?></a></p>
                    <p class="time"><b>发布时间: </b><?php echo date('Y年m月d日 H:i:s',$value['time']);?></p>
                </div>
            </div>
            <?php endforeach;?>
        </div>
<?php if($page>1):?>
		<div class="page">
            <ul class="tab">
            	<?php if(!($now_page==1)):?>
            	<li><a href="__HOME__/?page=<?php echo $now_page-1;?>">&laquo;</a></li>
     	<?php endif;?>
                <?php while($tmp++<$page):?>
                <?php if($tmp==$now_page):?>
                <li><a href="__HOME__/?page=<?php echo $tmp;?>" class="now"><?php echo $tmp;?></a></li>
                <?php else:?>
                <li><a href="__HOME__/?page=<?php echo $tmp;?>"><?php echo $tmp;?></a></li>
                <?php endif;?>
                <?php endwhile;?>
                <?php if(!($now_page==$page)):?>
                <li><a href="__HOME__/?page=<?php echo $now_page+1;?>" class="right">&raquo;</a></li>
                <?php endif;?>
            </ul>
        </div>
<?php endif;?>