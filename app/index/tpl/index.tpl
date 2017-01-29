//假装是一个好看的博客<br/>
//导航版<br/>
<ul>
{foreach $navibar as $key=>$values}
<li>
<a href="./category/{$key}">{$values['title']}</a><br/>
{if count($values['son'])!=0}
<ul>
{foreach $values['son'] as $keyNext=>$valuesNext}
<li>
<a href="./category/{$keyNext}">{$valuesNext['title']}</a><br/>
</li>
{/foreach}
</ul>
{/if}
</li>
{/foreach}
</ul>
//文章列表<br/>
{foreach $article as $value}
<a href="./{date('Y/m/d',$value['time'])}/{$value['id']}">{$value['title']}</a><br/>
<p>{getSection($value['content'])}<br/>
发布时间:{date('Y/m/d/ H:i:s',$value['time'])}</p>
{/foreach}