		<div class="content">
        	{foreach getArticle(input('get.sort')) as $value}
            <div class="article">
            	{if $img=getArticleFirstImg($value['content'])}
                	<img src="{$img}" />
                {/if}
                <div class="body">
                     <p><a href="__HOME__/{date('Y/m/d',$value['time'])}/{$value['id']}" class="title">{$value['title']}</a></p>
                     <p class="desc">{getSection($value['content'])}</p>
                    <p class="time"><b>发布时间: </b>{date('Y年m月d日 H:i:s',$value['time'])}</p>
                </div>
            </div>
            {/foreach}
        </div>