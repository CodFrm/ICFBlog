<?php

/**
 *============================
 * author:Farmer
 * time:下午7:30:59
 * blog:blog.icodef.com
 * function:核心处理文件
 *============================
 */
namespace icf;
include 'functions.php';
$config=array_merge( include 'config.php',include __APP_ . '/' . __MODEL_ . '/config.php' );
G('config',$config);
if (input('config.__DEBUG_')) {
	error_reporting ( E_ALL );
	ini_set ( 'display_errors', '1' );
} else {
	error_reporting ( E_ALL ^ E_NOTICE ^ E_WARNING );
}
if(isset($_SERVER['PATH_INFO'])){
	define('__HOME_',str_replace($_SERVER['PATH_INFO'],'',$_SERVER['REQUEST_URI']));
}else{
	define('__HOME_',substr ($_SERVER['REQUEST_URI'],0,strlen($_SERVER['REQUEST_URI'])-1));
}
class index {
	static function init() {
		G('get',$_GET);
		G('post',$_POST);
		G('cookie',$_COOKIE);
		G('server',$_SERVER);
		M();
		lib\route::add(input('config.ROUTE_RULE'));
		lib\route::analyze();
	}
}
