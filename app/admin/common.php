<?php
/**
 *============================
 * author:Farmer
 * time:2017/2/20 17:55
 * blog:blog.icodef.com
 * function:
 *============================
 */

/**
 * 获取后台的菜单
 * @author Farmer
 * @param int $id
 * @return array
 */
function getAdminMenu($id=-1) {
    return DB('admin_menu')->select(['father'=>$id])->fetchAll();
}

/**
 * 判断此链接在菜单中
 * @author Farmer
 * @param string $link
 * @param array $menu
 * @return bool
 */
function inMenu($action='index',$menu=[]){
    foreach ($menu as $value){
        if(in_array($action,$value))return true;
    }
    return false;
}

/**
 * 对所需要修改的文章字符进行处理
 * @author Farmer
 * @param string $text
 * @return string
 */
function dealEditArticle($text=''){
//    $text='""';
    $text= preg_replace(['/[\"]/','/\r\n/'], ['\"','\r\n'], $text);
    return $text;
}