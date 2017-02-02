        <div id="article-carousel" class="owl-carousel owl-theme carousel">
        	{foreach getCarousel() as $key=>$values}
            <div class="item">
                <div class="item-wrapper">
                    <img src="{$values['img']}" alt="{$values['title']}"/>
                    <p class="desc">{$values['title']}</p>
                </div>
            </div>
            {/foreach}
        </div>
        