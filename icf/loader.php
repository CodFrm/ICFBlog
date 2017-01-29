<?php
/**
 *============================
 * author:Farmer
 * time:下午7:26:45
 * blog:blog.icodef.com
 * function:自动加载类
 *============================
 */
spl_autoload_register ( 'Loader::loadClass' );
class loader {
	private $fileArray=array();
	static function loadClass($ClassName) {
		if (!isset($fileArray [$ClassName])) {
			$fileArray[$ClassName]=1;
			$ClassName=str_replace('\\','/',$ClassName);
			require_once __ROOT_.'/'.$ClassName . '.php';
		}
	}
}