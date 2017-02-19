<?php

/**
 *============================
 * author:Farmer
 * time:2017年1月28日 下午7:44:48
 * blog:blog.icodef.com
 * function:图片操作类
 *============================
 */
namespace app\admin\ctrl;

class fileup {
	public function index() {

	}
	/**
	* 查看缩小的图片
	* @access public
	* @author Farmer
	* @param 
	* @return 
	*/
	public function share($big=false) {
		$path='public/upload/images/'.input('get.md5');
		if(!(file_exists($path))){
			exit('404');
		}
		$imgInfo = getimagesize($path);
		$imgType = $imgInfo[2];
		switch ($imgType) {
			case 1:
				$img = imagecreatefromgif($path);
				break;
			case 2:
				$img = imagecreatefromjpeg($path);
				break;
			case 3:
				$img = imagecreatefrompng($path);
				break;
			default:
				exit('404');
		}
		if($big){
			$w=$imgInfo[0];
			$h=$imgInfo[1];
		}else{
			$w=500;$h=313;
		}
		$image=imagecreatetruecolor($w, $h);
		imagecopyresampled($image, $img, 0, 0, 0, 0, $w, $h, $imgInfo[0], $imgInfo[1]);
		switch ($imgType) {
			case 1:
				header('Content-Type:image/gif;');
				imagegif($image);
				break;
			case 2:
				header('Content-Type:image/jpeg;');
				imagejpeg($image);
				break;
			case 3:
				header('Content-Type:image/png;');
				imagepng($image);
				break;
			default:
				exit('404');
		}
		imagedestroy($image);
	}
}
function get_extension($file) {
	return substr ( strrchr ( $file, '.' ), 1 );
}
function getRandomString($len, $chars = null) { // 生成随机数字字母组合
	if (is_null ( $chars )) {
		$chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	}
	mt_srand ( 10000000 * ( double ) microtime () );
	for($i = 0, $str = '', $lc = strlen ( $chars ) - 1; $i < $len; $i ++) {
		$str .= $chars [mt_rand ( 0, $lc )];
	}
	return $str;
}