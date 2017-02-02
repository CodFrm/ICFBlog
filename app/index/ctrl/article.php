<?php

/**
 *============================
 * author:Farmer
 * time:2017年1月21日 下午4:09:22
 * blog:blog.icodef.com
 * function:文章控制类
 *============================
 */
 namespace app\index\ctrl;

 /** 
 * 文章控制类
 * @author Farmer
 * @version 1.0
 */ 
 class article {
 	function index() {
 		if(input('get.id')){
 			$record=DB('article')->select(['id'=>input('get.id')]);
 			$view=V();
 			$view->assign('article',$record->fetch());
 			$view->display();
 		}else{
 			echo 'not find';
 		}
 	}
 }