<?php
/**
 *============================
 * author:Farmer
 * time:2017/2/22 19:23
 * blog:blog.icodef.com
 * function:
 *============================
 */

/**
 * 获取导航条
 *
 * @author Farmer
 * @param int $id
 * @return array
 */
function getNavibar($id = -1) {
    $where = array('father' => empty ($id) ? '-1' : $id);
    $record = DB('sortlist')->select($where);
    $navibar = array();
    while ($row = $record->fetch()) {
        $navibar [$row['alias']]['id'] = $row['id'];
        $navibar [$row ['alias']] ['title'] = $row ['title'];
        $navibar [$row ['alias']] ['son'] = getNavibar($row ['id']);
    }
    return $navibar;
}