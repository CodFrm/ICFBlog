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
 * 获取内容简介
 *
 * @author Farmer
 * @param string $content        	
 * @return string
 */
function getSection($content) {
	$content = htmlspecialchars ( $content );
	$content = preg_replace ( [ 
			'/(#+)/',
			'/(>)/',
			'/(`+)/',
			'/\[/',
			'/\]/',
			'/\(.+\)/' 
	], '', $content );
	return mb_substr ( $content, 0, 200, 'utf8' ) . '....';
}
/**
 * 获取导航条
 *
 * @author Farmer
 * @param int $id        	
 * @return array
 */
function getNavibar($id = 0) {
	$where = array (
			'father' => empty ( $id ) ? '-1' : $id 
	);
	$record = DB ( 'sortlist' )->select ( $where );
	$navibar = array ();
	while ( $row = $record->fetch () ) {
		$navibar [$row ['alias']] ['title'] = $row ['title'];
		$navibar [$row ['alias']] ['son'] = getNavibar ( $row ['id'] );
	}
	return $navibar;
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
	return DB ( 'sortlist' )->select ( [ 
			'alias' => $alias 
	], 'id' )->fetch ()[0];
}
/**
 * 获取文章列表
 *
 * @author Farmer
 * @param string $sort        	
 * @return array
 */
function getArticle($sort = '',&$page=1) {
	$rec = DB ( 'article' )->select ( [ 
			'sortid' => getSortId ( $sort ),
			'__order by' => 'time desc',
			'__limit' => (($page-1)*10).',10' 
	],'sql_calc_found_rows *' );
	$page=ceil($rec->countAll()/10);
	return $rec->fetchAll ();
}

/**
 * 搜索文章
 * 
 * @author Farmer
 * @param string $keyword        	
 * @return array
 *
 */
function searchArticle($keyword='',&$page=1) {
	$rec = DB ( 'article' )->select ( [ 
			'title' => [ 
					"%$keyword%",
					'like' ,
					'or' 
			],
			'content' => [ 
					"%$keyword%",
					'like'
			] ,
			'__order by' => 'time desc',
			'__limit' => (($page-1)*10).',10' 
	] );
	$page=ceil($rec->countAll()/10);
	return $rec->fetchAll ();
}
global $lang_pro;
global $load_lang;
$lang_pro = [ 
		'php' => 'shBrushPhp',
		'js' => 'shBrushJScript',
		'css' => 'shBrushCss',
		'html' => 'shBrushXml',
		'py' => 'shBrushPython',
		'sql' => 'shBrushSql' 
];
$load_lang = array ();
/**
 * 处理文章内容
 *
 * @author Farmer
 * @param string $text        	
 * @return string
 *
 */
function dealwithContent($text) {
	$text = preg_replace_callback ( '/\\[(.+)\\]\\((.+)\\)/', function ($match) { // 对图片和链接处理
		if (strpos ( $match [2], 'http' ) !== 0) {
			$match [2] = __HOME_ . '/' . $match [2];
		}
		return '[' . $match [1] . '](' . $match [2] . ')';
	}, $text );
	$text = Markdown::defaultTransform ( $text );
	$text = preg_replace_callback ( '/<code>([\s\S]*?)<\/code>/', function ($match) { // 对代码处理
		global $lang_pro;
		global $load_lang;
		$lang = substr ( $match [1], 0, strpos ( $match [1], "\n" ) ) ?  : 'html';
		if (in_array ( $lang, array_keys ( $lang_pro ) )) {
			$match [1] = substr ( $match [1], strpos ( $match [1], "\n" ) );
			if (! in_array ( $lang, $load_lang )) {
				$load_lang [$lang] = 1;
				echo '<script type="text/javascript" src="' . __HOME_ . '/' . input ( 'config.PUBLIC' ) . '/js/syntaxhighlighter/' . $lang_pro [$lang] . '.js"></script>';
			}
		}
		return '<pre class="brush: ' . $lang . ';">' . $match [1] . '</pre>';
	}, $text );
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
	return DB ( 'config' )->select ( [ 
			'`key`' => $key 
	] )->fetch ();
}
/**
 * 获取有图片的文章
 *
 * @author Farmer
 * @return array
 */
function getCarousel() {
	$row = DB ( 'article' )->select ( [ 
			'content' => [ 
					'!\\\\[.+\\\\]\\\\(.+\\\\)',
					'regexp' 
			],
			'__limit' => '8' 
	] )->fetchAll ();
	foreach ( $row as $key => $value ) {
		$row [$key] ['img'] = getArticleFirstImg ( $value ['content'] );
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
	preg_match ( '/!\\[[\S]+\\]\\(([\S]+)\\)/', $text, $matches );
	if (isset ( $matches [1] )) {
		if (strpos ( $matches [1], 'http' ) === 0) {
			return $matches [1];
		} else {
			return __HOME_ . '/' . $matches [1];
		}
	}
	return '';
}
function jsonEncode($str) {
	return json_encode ( $str, JSON_UNESCAPED_UNICODE );
}