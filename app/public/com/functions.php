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

/**
 * 获取文章列表
 *
 * @author Farmer
 * @param string $sort
 * @return array
 */
function getArticle($sort = '', &$page = 1) {
    $rec = DB('article')->select(['sortid' => getSortId($sort), 'type' => 1, '__order by' => 'time desc', '__limit' => (($page - 1) * 10) . ',10'], 'sql_calc_found_rows *');
    $page = ceil($rec->countAll() / 10);
    return $rec->fetchAll();
}


/**
 * 获取内容简介
 *
 * @author Farmer
 * @param string $content
 * @return string
 */
function getSection($content) {
    $content = htmlspecialchars($content);
    $content = preg_replace(['/(#+)/', '/(>)/', '/(`+)/', '/\[/', '/\]/', '/\(.+\)/'], '', $content);
    return mb_substr($content, 0, 200, 'utf8') . '....';
}

/**
 * 获取导航条id
 * @author Farmer
 * @param
 *
 * @return
 *
 */
function getSortId($alias) {
    if ($alias == '') {
        return '';
    }
    return DB('sortlist')->select(['alias' => $alias], 'id')->fetch()[0];
}
