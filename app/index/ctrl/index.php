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
	 * 获取导航条
	 * 
	 * @access private
	 * @author Farmer
	 * @param int $id        	
	 * @return array
	 */
	private function getNavibar($id = 0) {
		$where = array (
				'father' => empty ( $id ) ? '-1' : $id 
		);
		$record = DB ( 'navibar' )->select ( $where );
		$navibar = array ();
		while ( $row = $record->fetch () ) {
			$navibar [$row ['alias']] ['title'] = $row ['title'];
			$navibar [$row ['alias']] ['son'] = $this->getNavibar ( $row ['id'] );
		}
		return $navibar;
	}
	/**
	* 获取文章列表
	* @access public
	* @author Farmer
	* @return array
	*/
	public function getArticle() {
		$rec=DB('article')->select(['__order by'=>'time desc','__limit'=>'9']);
		return $rec->fetchAll();
	}
	public function index() {
		$V = V ();
		$navibar = $this->getNavibar ();
		$article=$this->getArticle();
		$V->assign('article',$article);
		$V->assign ( 'navibar', $navibar );
		$V->display ();
	}
}
 