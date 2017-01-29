<?php

/**
 *============================
 * author:Farmer
 * time:2017年1月7日 下午8:55:42
 * blog:blog.icodef.com
 * function:index 公共函数库
 *============================
 */
 
 /**
 * 
 * @author Farmer
 * @param 
 * @return 
 */
 function test() {
 	echo 'qweqweqfsafsdfegw';
 }
 
 /**
 * 获取内容简介
 * @author Farmer
 * @param string $continue
 * @return string
 */
 function getSection($continue){
 	return mb_substr( $continue, 0, 30, 'utf8' );
 }	