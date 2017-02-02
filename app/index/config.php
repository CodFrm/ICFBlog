<?php

/**
 *============================
 * author:Farmer
 * time:2017年1月29日 下午7:41:55
 * blog:blog.icodef.com
 * function:index模块的配置项
 *============================
 */
return array (
		'ROUTE_RULE' => [ 
				'{y}/{m}/{d}/{id}' => 'article->index' ,
				'sort/{sort}'=>'index->sort'
		] 
);