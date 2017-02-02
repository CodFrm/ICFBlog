<?php

/**
 *============================
 * author:Farmer
 * time:2017年1月4日 下午8:01:02
 * blog:blog.icodef.com
 * function:controller 控制
 *============================
 */
namespace app\index\ctrl;

class index {
	/**
	 * 主页
	 * @access public
	 * @author Farmer
	 * @return null
	 */
	public function index() {
		$V = V ();
		$V->display ();
	}
	/**
	* 分类
	* @access public
	* @author Farmer
	* @return null
	*/
	public function sort() {
		$V = V ();
		$V->display ();
	}

}
 