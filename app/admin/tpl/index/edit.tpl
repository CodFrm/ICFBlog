{include 'public/header.tpl'}
<div class="writing" id="writing">
    <div class="tools">
        <button class="btn btn-default btn-tools bold"><i class="fa fa-bold"></i></button>
        <button class="btn btn-default btn-tools italic"><i class="fa fa-italic"></i></button>
        <button class="btn btn-default btn-tools link"><i class="fa fa-link"></i></button>
        <button class="btn btn-default btn-tools quote-left"><i class="fa fa-quote-left"></i></button>
        <div class="progress progress-striped file-up">
            <div class="progress-bar progress-bar-info bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                <span class="sr-only">30% 完成（信息）</span>
            </div>
        </div>
        <p style="float: right;margin-top: 10px;">文件上传进度:</p>
    </div>
    <div class="edit" id="text-input" oninput="this.editor.update()" contenteditable="true"></div>
    <div id="preview"> </div>
</div>
<div class="panel panel-default input-link">
    <div class="panel-heading">
        <button type="button" class="btn btn-default fa fa-close pull-right close"></button>
        <h3 class="panel-title">请输入链接</h3>
    </div>
    <div class="panel-body">
        <i class="fa fa-link pull-left fa-2x"></i>
        <input type="text" class="form-control link-edit" style="width: 90%;" placeholder="链接地址">
        <p style="float: left;margin-top: 10px;">例如:http://blog.icodef.com</p>
        <button type="button" class="btn btn-primary link-add">确定</button>
    </div>
</div>
<script src="__HOME__/__PUBLIC__/js/markdown.min.js"></script>
<script>
    var url='__HOME__/admin/index/fileup';
    function Editor(input, preview) {
        this.update = function() {
            preview.innerHTML = markdown.toHTML(input.innerText);
        };
        input.editor = this;
        this.update();
    }
    var $ = function(id) {
        return document.getElementById(id);
    };
    var editText = new Editor($("text-input"), $("preview"));
</script>
{include 'public/footer.tpl'}