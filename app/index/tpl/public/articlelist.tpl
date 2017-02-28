		<div class="content">
        	{foreach getArticle(input('get.sort'),$page) as $value}
            <div class="article">
            	{if $img=getArticleFirstImg($value['content'])}
                	<img src="{$img}" />
                {/if}
                <div class="body">
                     <p><a href="__HOME__/{date('Y/m/d',$value['time'])}/{$value['articleid']}" class="title">{$value['title']}</a></p>
                     <p class="desc"><a href="__HOME__/{date('Y/m/d',$value['time'])}/{$value['articleid']}">{getSection($value['content'])}</a></p>
                    <p class="time"><b>发布时间: </b>{date('Y年m月d日 H:i:s',$value['time'])}</p>
                </div>
            </div>
            {/foreach}
        </div>
{if $page>1}
		<div class="page">
            <ul class="tab">
            	{if !($now_page==1)}
            	<li><a href="__HOME__/?page={$now_page-1}">&laquo;</a></li>
            	{/if}
                {while $tmp++<$page}
                {if $tmp==$now_page}
                <li><a href="__HOME__/?page={$tmp}" class="now">{$tmp}</a></li>
                {else}
                <li><a href="__HOME__/?page={$tmp}">{$tmp}</a></li>
                {/if}
                {/while}
                {if !($now_page==$page)}
                <li><a href="__HOME__/?page={$now_page+1}" class="right">&raquo;</a></li>
                {/if}
            </ul>
        </div>
{/if}