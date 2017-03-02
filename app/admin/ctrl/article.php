<?php
/**
 *============================
 * author:Farmer
 * time:2017/2/25 17:40
 * blog:blog.icodef.com
 * function:文章操作类
 *============================
 */

namespace app\admin\ctrl;


class article {
    /**
     * 新增或者修改一篇文章
     * @author Farmer
     * @param int $id
     */
    public function articlePost($id = 0) {
        header("Access-Control-Allow-Origin: *");
        $jsonMsg = ['code' => -1, 'msg' => '系统错误'];
        if (input('post.title') != '' and input('post.content') != '') {
            $change = DB('article')->insert(['type' => 2, 'articleid' => $id, 'title' => input('post.title'), 'content' => input('post.content'), 'sortid' => input('post.sortid'), 'author' => 'Farmer', 'time' => time()]);
            if ($change >= 1) {
                $insertId = DB()->lastinsertid();
                if ($id) {
                    DB('article')->update(['type' => 0], ['articleid' => $id, 'type!=2']);
                } else {
                    $id = $insertId;
                }
                DB('article')->update(['articleid' => $id, 'type' => 1], ['id' => $insertId, 'type' => 2]);
                $jsonMsg['msg'] = '成功';
                $jsonMsg['code'] = 1;
                $jsonMsg['id'] = $id;
                $jsonMsg['url'] = url('article->index', 'id=' . $jsonMsg['id']);
            } else {
                $jsonMsg['msg'] = '未知错误';
                $jsonMsg['code'] = 2;
            }
        }
        echo jsonEncode($jsonMsg);
    }

    /**
     *
     * @author Farmer
     * @param int $id
     */
    public function delete($id = 0) {
        $jsonMsg = ['code' => -1, 'msg' => '文章不存在'];
        $change = DB('article')->update(['type' => 0], ['articleid' => $id]);
        if ($change >= 1) {
            $jsonMsg = ['code' => 1, 'msg' => '删除成功'];
        }
        echo jsonEncode($jsonMsg);
    }
}