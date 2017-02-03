        <div id="article-carousel" class="owl-carousel owl-theme carousel">
        	{foreach getCarousel() as $key=>$values}
            <div class="item">
                <div class="item-wrapper">
                    <a href="__HOME__/{date('Y/m/d',$values['time'])}/{$values['id']}">
                        <img src="{$values['img']}" alt="{$values['title']}"/>
                        <p class="desc">{$values['title']}</p>
                    </a>
                </div>
            </div>
            {/foreach}
        </div>