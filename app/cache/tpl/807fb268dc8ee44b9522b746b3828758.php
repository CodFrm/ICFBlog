        <div id="article-carousel" class="owl-carousel owl-theme carousel">
        	<?php foreach(getCarousel() as $key=>$values):?>
            <div class="item">
                <div class="item-wrapper">
                    <a href="__HOME__/<?php echo date('Y/m/d',$values['time']);?>/<?php echo $values['id'];?>">
                        <img src="<?php echo $values['img'];?>" alt="<?php echo $values['title'];?>"/>
                        <p class="desc"><?php echo $values['title'];?></p>
                    </a>
                </div>
            </div>
            <?php endforeach;?>
        </div>