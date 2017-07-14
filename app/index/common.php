<?php

/**
 *============================
 * author:Farmer
 * time:2017年1月7日 下午8:55:42
 * blog:blog.icodef.com
 * function:index 公共函数库
 *============================
 */
use Michelf\Markdown;

/**
 * 搜索文章
 *
 * @author Farmer
 * @param string $keyword
 * @return array
 *
 */
function searchArticle($keyword = '', &$page = 1) {
    $rec = DB('article')->select(['title' => ["%$keyword%", 'like', 'or'], 'content' => ["%$keyword%", 'like'], 'type' => 1, '__order by' => 'time desc', '__limit' => (($page - 1) * 10) . ',10']);
    $page = ceil($rec->countAll() / 10);
    return $rec->fetchAll();
}

global $lang_pro;
global $load_lang;
$lang_pro = ['php' => 'shBrushPhp', 'js' => 'shBrushJScript', 'css' => 'shBrushCss', 'html' => 'shBrushXml', 'py' => 'shBrushPython', 'sql' => 'shBrushSql'];
$load_lang = array();
/**
 * 处理文章内容
 *
 * @author Farmer
 * @param string $text
 * @return string
 *
 */
function dealwithContent($text) {
    $text = preg_replace_callback('/\\[(.+)\\]\\((.+)\\)/', function ($match) { // 对图片和链接处理
        if (strpos($match [2], 'http') !== 0) {
            $match [2] = __HOME_ . '/' . $match [2];
        }
        return '[' . $match [1] . '](' . $match [2] . ')';
    }, $text);
    $text = Markdown::defaultTransform($text);
    $text = preg_replace_callback('/<code>([\s\S]*?)<\/code>/', function ($match) { // 对代码处理
        global $lang_pro;
        global $load_lang;
        $lang = substr($match [1], 0, strpos($match [1], "\n")) ?: 'html';
        if (in_array($lang, array_keys($lang_pro))) {
            $match [1] = substr($match [1], strpos($match [1], "\n"));
            if (!in_array($lang, $load_lang)) {
                $load_lang [$lang] = 1;
                echo '<script type="text/javascript" src="' . __HOME_ . '/' . input('config.PUBLIC') . '/js/syntaxhighlighter/' . $lang_pro [$lang] . '.js"></script>';
            }
        }
        return '<pre class="brush: ' . $lang . ';">' . $match [1] . '</pre>';
    }, $text);
    return $text;
}

/**
 * 获取配置值
 *
 * @author Farmer
 * @param string $key
 * @return array
 *
 */
function getConfig($key) {
    return DB('config')->select(['`key`' => $key])->fetch();
}

/**
 * 获取有图片的文章
 *
 * @author Farmer
 * @return array
 */
function getCarousel() {
    $row = DB('article')->select(['content' => ['!\\\\[.+\\\\]\\\\(.+\\\\)', 'regexp'], 'type' => 1, '__limit' => '8'])->fetchAll();
    foreach ($row as $key => $value) {
        $row [$key] ['img'] = getArticleFirstImg($value ['content']);
    }
    return $row;
}

/**
 * 获取文章的第一张图片
 *
 * @author Farmer
 * @param string $text
 * @return string
 *
 */
function getArticleFirstImg($text) {
    preg_match('/!\\[[\S]+\\]\\(([\S]+)\\)/', $text, $matches);
    if (isset ($matches [1])) {
        if (strpos($matches [1], 'http') === 0) {
            return $matches [1];
        } else {
            return __HOME_ . '/' . $matches [1];
        }
    }
    return '';
}