{include 'public/header.tpl'}
<link rel="stylesheet" type="text/css" href="__HOME__/__PUBLIC__/css/edit.css"/>
<form action="post-article.php" method="post" onsubmit="return false;" class="writing">
    <div class="edit-left">
        <input type="hidden" name="id" id="articleId" value="{$article['id']?:'0'}">
        <div class="alert alert-danger alert-dismissable msg">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                &times;
            </button>
            <span class="text-msg">2333</span>
        </div>
        <div class="edit-title">
            <input type="text" class="form-control title" placeholder="在这里输入文章的标题~" value="{$article['title']?:''}"/>
            <input type="submit" onclick="articlePost()" value="提交文章" class="btn btn-primary btn-tools post"/>
        </div>
        <div class="tools">
            <button class="btn btn-default btn-tools bold"><i class="fa fa-bold"></i></button>
            <button class="btn btn-default btn-tools italic"><i class="fa fa-italic"></i></button>
            <button class="btn btn-default btn-tools link"><i class="fa fa-link"></i></button>
            <div class="progress progress-striped file-up">
                <div class="progress-bar progress-bar-info bar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
                     aria-valuemax="100" style="width: 100%;">文件上传进度
                </div>
            </div>
        </div>
        <div class="edit form-control" id="text-input" oninput="this.editor.update()" contenteditable="true"></div>
        <div id="preview" class="form-control"></div>
    </div>
    <div class="edit-right">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">选择文章的目录</h3>
            </div>
            <div class="panel-body sort-list">
                <ul>
                    {foreach getNavibar() as $values}
                        <li>
                            {$values['title']}
                            {if count($values['son'])!=0}
                                <ul class="">
                                    {foreach $values['son'] as $key=>$subValues}
                                        <li>
                                            <p><input type="radio" class="sortid" name="sortid"{$subValues['id']==$article['sortid']?' checked=checked':''}value="{$subValues['id']}"/>{$subValues['title']}</p>
                                        </li>
                                    {/foreach}
                                </ul>
                            {/if}
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
</form>
<div class="panel panel-default input-link">
    <div class="panel-heading">
        <button type="button" class="btn btn-default fa fa-close pull-right close"></button>
        <h3 class="panel-title">请输入链接</h3>
    </div>
    <div class="panel-body">
        <i class="fa fa-link pull-left fa-2x"></i>
        <input type="text" class="form-control link-edit" style="width: 90%;" placeholder="链接地址"/>
        <p style="float: left;margin-top: 10px;">例如:http://blog.icodef.com</p>
        <button type="button" class="btn btn-primary link-add">确定</button>
    </div>
</div>
<script src="__HOME__/__PUBLIC__/js/markdown.min.js"></script>
<script>
    document.getElementById("text-input").innerText="{dealEditArticle($article['content']?:'')}";
    var url = "{url('admin->index->fileup')}";
    var articleUrl = "{url('admin->article->articlePost')}";
    function Editor(input, preview) {
        this.update = function () {
            preview.innerHTML = markdown.toHTML(input.innerText);
        };
        input.editor = this;
        this.update();
    }
    var $ = function (id) {
        return document.getElementById(id);
    };
    var editText = new Editor($("text-input"), $("preview"));
</script>
{include 'public/footer.tpl'}