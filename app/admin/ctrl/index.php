<?php
/**
 *============================
 * author:Farmer
 * time:2017年2月5日 下午12:32:58
 * blog:blog.icodef.com
 * function:后台主页面
 *============================
 */
namespace app\admin\ctrl;

class index {
    /**
     *
     * @access public
     * @author Farmer
     * @param
     * @return
     */
    public function index() {
        V()->display();
    }

    /**
     * @access public
     * @author Farmer
     */
    public function edit() {
        V()->display();
    }

    public function fileup() {
        header('Access-Control-Allow-Origin: *');
        $json ['code'] = -2;
        $json ['msg'] = "系统错误";
        if (isset ($_FILES ['upfile'] ['tmp_name'])) {
            if (is_uploaded_file($_FILES ['upfile'] ['tmp_name'])) {
                $upfile = $_FILES ["upfile"];
                $name = $upfile ["name"]; // 上传文件的文件名
                $type = $upfile ["type"]; // 上传文件的类型
                $size = $upfile ["size"]; // 上传文件的大小
                $tmp_name = $upfile ["tmp_name"]; // 上传文件的临时存放路径
                $error = $upfile ['error']; // 上传后系统返回的值
                if ($error == 0) {
                    if (isImg($tmp_name)) {
                        $type = 'images';
                    } else {
                        $type = 'files';
                    }
                    $md5 = md5_file($tmp_name);
                    $destination = input('config.PUBLIC') . '/upload/' . $type . '/' . $md5;
                    if (!(file_exists($destination))) {
                        move_uploaded_file($tmp_name, $destination);
                    }
                    $json ['code'] = 0;
                    $json ['msg'] = "上传成功";
                    $json ['filename'] = __HOME_ . '/' . input('config.PUBLIC') . '/upload/' . $type . '/' . $md5;
                } else {
                    $json ['code'] = $error;
                    $json ['msg'] = '文件上传失败';
                }
            }
            echo jsonEncode($json);
        } else {
            // 			return 0;
            echo '
<form action="" enctype="multipart/form-data" method="post"
	name="uploadfile">
	上传文件：<input type="file" name="upfile" /><br> <input type="submit"
		value="上传" />
</form>';
        }
    }
}

/**
 * 判断文件是不是图片
 *
 * @author Farmer
 * @param string $fileName
 * @return bool
 *
 */
function isImg($fileName) {
    $file = fopen($fileName, "rb");
    $bin = fread($file, 2); // 只读2字节
    fclose($file);
    $strInfo = @unpack("C2chars", $bin);
    $typeCode = intval($strInfo ['chars1'] . $strInfo ['chars2']);
    $fileType = '';
    if ($typeCode == 255216 /*jpg*/ || $typeCode == 7173 /*gif*/ || $typeCode == 13780 /*png*/) {
        return $typeCode;
    } else {
        // echo '"仅允许上传jpg/jpeg/gif/png格式的图片！';
        return false;
    }
}