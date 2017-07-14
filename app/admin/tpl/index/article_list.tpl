{include 'public/header.tpl'}
<link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/articlelist.css"/>
<div class="article-left">
    <h2>文章管理</h2>
    <div class="tools">
        <a href="{url('admin->index->edit')}"><i class="fa fa-plus fa-2x pull-right"></i></a>
    </div>
    <div class="article-list">
        {foreach getArticle() as $value}
            <div class="article-admin">
                <p class="article-title"><a href="{:url('article->index','id='.$value['articleid'])}"
                                            target="_blank">{$value['title']}</a></p>
                <p class="article-content">{:getSection($value['content'])}</p>
                <a href="{:url('admin->index->edit','id='.$value['articleid'])}"><i
                            class="fa fa-pencil-square-o fa-2x"></i></a>
                <a href="{:url('admin->article->delete','id='.$value['articleid'])}"><i class="fa fa-trash-o fa-2x"></i></a>
                <p class="article-time">{:date('Y年m月d日 H:i:s',$value['time'])}</p>
            </div>
        {/foreach}
    </div>
</div>
{include 'public/footer.tpl'}