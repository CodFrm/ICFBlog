var cursorTmp = 0;
//吧光标放到最后
$('.edit').focus();
cursorTmp = window.getSelection().getRangeAt(0);
s = $('.edit')[0].childNodes;
if(s.length - 1>=0){
    var selection = window.getSelection();
    range = document.createRange();
    range.setStart(s[s.length - 1], s[s.length - 1].length);
    selection.removeAllRanges();
    selection.addRange(range);
}
(function($) {
    $('.edit').blur(function() {
        cursorTmp = window.getSelection().getRangeAt(0);
    });
    $('.bold').click(function() {
        dealText($('.edit')[0], "**");
    });
    $('.italic').click(function() {
        dealText($('.edit')[0], '*');
    });
    $('.link').click(function() { //弹出输入链接的窗口
        $('.input-link').css({ 'display': 'block' });
        $('.link-edit').focus();
        $('.link-edit').val('');
    });
    $('.input-link .close').click(function() { //关闭窗口
        $('.edit').focus();
        $('.input-link').css({ 'display': 'none' });
    });
    $('.input-link .panel-heading').mousedown(function(evnt) { //为什么要可移动? - -..
        var isMove = true;
        var posX = evnt.pageX - $('.input-link .panel-heading').offset().left + $('.input-link').parent().offset().left;
        var posY = evnt.pageY - $('.input-link .panel-heading').offset().top + $('.input-link').parent().offset().top;
        $(document).mousemove(function(evnt) {
            if (isMove) {
                $('.input-link').css({ 'left': evnt.pageX - posX, 'top': evnt.pageY - posY });
            }
        }).mouseup(function() {
            isMove = false;
        });
    });
    $('.link-add').click(function() {
        var reg = / ".+"/;
        var isTitle = reg.test($('.link-edit').val());
        var selectText = window.getSelection().toString();
        reduction();
        if (selectText != '') { //选中文本
            document.execCommand('insertHTML', '', '[' + selectText + '](' + $('.link-edit').val() + ')');
        } else {
            if (isTitle) {

            } else {
                document.execCommand('insertHTML', '', '[](' + $('.link-edit').val() + ')');
            }
        }
        $('.input-link').css({ 'display': 'none' });
    });
})(jQuery);

function reduction() {
    selection = window.getSelection();
    $('.edit').focus();
    selection.removeAllRanges();
    selection.addRange(cursorTmp);
}

function getSelectedText(inputDom) {
    if (document.selection) //IE
    {
        return document.selection.createRange().text;
    } else {
        return inputDom.value.substring(inputDom.selectionStart,
            inputDom.selectionEnd);
    }
}

function dealText(edit, mark) {
    switch (mark) {
        case '*':
        case '**':
            {

                var selectText = window.getSelection().toString();
                reduction();
                if (selectText != '') {
                    document.execCommand('insertHTML', '', mark + selectText + mark);
                }
                break;
            }
    }
    // edit.focus();
}



//拽托图片文件上传
$('.writing')[0].addEventListener("drop", function(e) { //拖离
    e.preventDefault();
})
$('.writing')[0].addEventListener("dragleave", function(e) { //拖后放
    e.preventDefault();
})
$('.writing')[0].addEventListener("dragenter", function(e) { //拖进
    e.preventDefault();
})
$('.writing')[0].addEventListener("dragover", function(e) { //拖来拖去
    e.preventDefault();
})
var box = $('.writing')[0]; //拖拽区域
box.addEventListener("drop", function(e) {
    var fileList = e.dataTransfer.files; //获取文件对象
    if (fileList.length == 0) {
        return false;
    }
    var fileurl = window.URL.createObjectURL(fileList[0]);

    var selectText = window.getSelection().toString();
    $('.file-up .bar').css({ 'width': '0%' });
    var formData = new FormData();
    formData.append('upfile', fileList[0]);
    var xmlHttpRequest = new XMLHttpRequest();
    xmlHttpRequest.onreadystatechange = function() {
        if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
            console.log(xmlHttpRequest.responseText);
            var jsonObj = JSON.parse(xmlHttpRequest.responseText);
            reduction();
            if (fileList[0].type.indexOf('image') === 0) { //如果是图片
                document.execCommand('insertHTML', '', "![" + fileList[0].name + "](" + jsonObj['filename'] + ")");
            }else{
                document.execCommand('insertHTML', '', "[" +  fileList[0].name  + "](" + jsonObj['filename'] + ")");
            }
            
        }
    };
    xmlHttpRequest.upload.onprogress = function(evt) {
        if (evt.lengthComputable) {
            $('.file-up .bar').css({ 'width': evt.loaded * 100 / evt.total + '%' });
        }
    };
    xmlHttpRequest.open("post", url, true);
    xmlHttpRequest.send(formData);
    // $('.edit')[0].focus();
    // alert(fileurl);
}, false);
