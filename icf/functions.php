<?php

/**
 *============================
 * author:Farmer
 * time:2017年1月4日 下午7:23:25
 * blog:blog.icodef.com
 * function:框架系统函数
 *============================
 */

/**
 * 判断变量是否设置
 *
 * @author Farmer
 * @param Array $array        	
 * @param Var $mode        	
 * @return string
 */
function isExist($array, $mode, $isNull = false) {
	$key = array_keys ( $array );
	$number = sizeof ( $key );
	for($i = 0; $i < $number; $i ++) {
		if ((! isset ( $mode [$key [$i]] ))) {
			return $array [$key [$i]];
		} else if (empty ( $mode [$key [$i]] ) and $isNull) {
			return $array [$key [$i]];
		}
	}
	return true;
}
$_model = array ();
/**
 * 获取数据库对象
 * 
 * @author Farmer
 * @param string $table        	
 * @return \icf\lib\db()
 */
function DB($table = '') {
	$db=new \icf\lib\db();
	if (! empty ( $table )) {
		return $db->getDBObject($table);
	}
	return $db;
}
/**
 * 实例化一个没有模型文件的Model
 * 
 * @author Farmer
 * @param string $table        	
 * @return \icf\lib\model()
 */
function M() {
	if (! G ( 'model' )) {
		G ( 'model', new \icf\lib\model () );
	}
	return G ( 'model' );
}
/**
 * 实例化一个模板引擎view
 * 
 * @author Farmer
 * @return \icf\lib\view()
 */
function V() {
	if (! G ( 'view' )) {
		G ( 'view', new \icf\lib\view () );
	}
	return G ( 'view' );
	;
}
/**
 * 获取或者设置一个全局变量
 * 
 * @author Farmer
 * @param string $var        	
 * @param var $val        	
 * @return mixed
 */
function G($var, $val = 0) {
	static $_globals = array ();
	if ($val === 0) {
		if (! isset ( $_globals [$var] )) {
			return false;
		}
		return $_globals [$var];
	}
	$_globals [$var] = $val;
}
/**
 * 获取变量
 * 
 * @author Farmer
 * @param string $var        	
 * @return mixed
 */
function input($var) {
	$arrVar = explode ( '.', $var );
	if (sizeof ( $arrVar ) <= 1) {
		$ret = G ( $var );
	} else {
		$ret = G ( $arrVar [0] );
		unset ( $arrVar [0] );
		foreach ( $arrVar as $value ) {
			if (! isset ( $ret [$value] )) {
				return false;
			}
			$ret = $ret [$value];
		}
	}
	return $ret;
}
/**
 * 输出一行信息
 * 
 * @author Farmer
 * @param string $var        	
 * @param var $val        	
 * @return var
 */
function outmsg($msg) {
	if (is_string ( $msg )) {
		echo '<pre style="background-color:#CCC;color:#06F;border-bottom:1px solid #999;border-top:1px solid #999;border-right:1px solid #999;border-left:1px solid #999;border-radius:4px;font-size:18px;vertical-align: middle; word-wrap:break-word; word-break:normal; ">string:' . $msg . '</pre>';
	} else if (is_array ( $msg )) {
		echo '<pre style="background-color:#CCC;color:#06F;border-bottom:1px solid #999;border-top:1px solid #999;border-right:1px solid #999;border-left:1px solid #999;border-radius:4px;font-size:18px;vertical-align: middle; word-wrap:break-word; word-break:normal; ">';
		print_r ( $msg );
		echo '</pre>';
	}
} 
/**
* 获取文件url
* @author Farmer
* @param string $action
* @return string
*/
function url($action='') {
//    preg_match_all($pattern, '/' . preg_replace(['/{/', '/}/'], '', $oldPattern), $key);
    preg_match_all( '/([\w]+)/', $action, $arrMatch);
    $url='';
    foreach ($arrMatch[0] as $value){
        $url.=('/'.$value);
    }
    return __HOME_.$url;
}
function jsonEncode($str) {
    return json_encode ( $str, JSON_UNESCAPED_UNICODE );
}