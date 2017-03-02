/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : icf

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-02 21:09:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for icf_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `icf_admin_menu`;
CREATE TABLE `icf_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '标题',
  `link` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '链接',
  `class` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '样式',
  `father` int(11) NOT NULL COMMENT '父菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of icf_admin_menu
-- ----------------------------
INSERT INTO `icf_admin_menu` VALUES ('1', '首页', '#', 'fa fa-home pull-right', '-1');
INSERT INTO `icf_admin_menu` VALUES ('2', '主页', 'index', 'fa fa-home pull-right', '1');
INSERT INTO `icf_admin_menu` VALUES ('3', '文章', '#', 'fa fa-home pull-right', '-1');
INSERT INTO `icf_admin_menu` VALUES ('4', '文章管理', 'article_list', 'fa fa-list pull-right', '3');
INSERT INTO `icf_admin_menu` VALUES ('5', '新文章', 'edit', 'fa fa-pencil-square-o pull-right', '3');

-- ----------------------------
-- Table structure for icf_article
-- ----------------------------
DROP TABLE IF EXISTS `icf_article`;
CREATE TABLE `icf_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `articleid` int(11) NOT NULL COMMENT '文章的固定id',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `author` varchar(255) NOT NULL COMMENT '作者',
  `sortid` int(11) NOT NULL,
  `time` int(11) NOT NULL COMMENT '发表时间戳',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1 显示 0 历史版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of icf_article
-- ----------------------------
INSERT INTO `icf_article` VALUES ('1', '1', 'Hello World!', '#[ICFBlog](https://github.com/ICFTeam/ICFBlog)\n##Hello World!\n终于完成得差不多了,我的新博客程序!\n\n前端是我朋友帮我做的,后端采用ICFphp框架完成,文章编写使用的MarkDown语法\n\n支持代码高亮,例如:\n```php\n<?php echo \'hello world\';?>\n```\n\n下个版本准备接入多说做评论功能和后台的文章编写功能,慢慢开发吧\n\n感觉还有一些BUG,刚刚上传到linux服务器的时候也发现不兼容,路径一个劲报错\n\n然后服务器的mysql扩展版本低了,觉得可以再加个pdo的方式\n\n![Home](public/img/home.jpg)\n\n[Farmer Blog](http://blog.icodef.com)', 'Farmer', '0', '1486040005', '1');
INSERT INTO `icf_article` VALUES ('5', '5', 'Git命令总结', '> Git是一款免费、开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。[1] Git的读音为/gɪt/。\n>\n> Git是一个开源的分布式版本控制系统，可以有效、高速的处理从很小到非常大的项目版本管理。[2] Git 是 Linus Torvalds 为了帮助管理 Linux内核开发而开发的一个开放源码的版本控制软件。\n>\n> 学习了一下git,但是很多命令暂时都还没记住,于是将现在所学到的git命令记录下来,方便查询\n>\n> 至于它们的作用,可以从下面的链接去学习\n>\n> [GIT教程跳转](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)\n>\n>![git-tutorial](http://images2015.cnblogs.com/blog/577880/201511/577880-20151122023641374-876573777.png)\n\n## 初始配置\n\n配置用户名\n\ngit config --global user.name \"CodFrm\"\n\n配置邮箱\n\ngit config --global user.email \"code.farmer@qq.com\"\n--global 表示全局 在整个git里生效\n\n## Git仓库命令\n\n初始化git仓库\n\ngit init\n\n将文件加入git仓库\n\ngit add -f file1 file2\n\n-f表示强制添加\n\n将文件提交到仓库\n\ngit commit -m “提交说明”\n\n查看仓库状态\n\ngit status\n\n查看上一次文件变动\n\ngit diff\n\n查看指定文件变动\n\ngit diff -- file\n\n文件删除\n\ngit rm file\n\n跳转到其他版本,如果是老的版本,使用git log将看不到之前的新版本,使用git reflog\n\ngit reset --hard HEAD^\n\nHEAD^表示上一个版本 HEAD^^表示上两个 HEAD~10表示上10个\n\nHEAD^ 也可以用 commit_id 表示想要跳转到的版本\n\n### 分支\n\n创建并切换分支\n\ngit checkout -b 分支名字\n\n创建分支\n\ngit branch 分支\n\n切换分支\n\ngit checkout 分支\n\n查看分支,当前分支有*\n\ngit branch\n\n删除分支\n\ngit branch -d 分支\n\n-D 强制删除\n\n合并分支到当前分支\n\ngit merge 分支\n\n### 日志\n\n提交历史,查看每个版本的信息\n\ngit log\n\n显示比较简单的信息 --pretty=oneline\n\n显示分支合并图 --graph\n\n命令历史,查看每个命令的信息\n\ngit reflog\n\n撤销修改,回到该版本最初样式\n\ngit checkout -- file\n\n将暂存区的文件撤回\n\ngit reset HEAD file\n\n## 远程仓库\n\n创建SSH KEY\n\nssh-keygen -t rsa -C \"code.farmer@qq.com\"\n\n关联远程库\n\ngit remote add origin git@github.com:CodFrm/StudyGit.git\n\n克隆远程仓库\n\ngit clone git@github.com:CodFrm/StudyGit.git\n\n克隆分支到本地\n\ngit checkout -b 本地分支名 origin/远程分支名\n\n查看远程库的信息\n\ngit remote\n\ngit remote -v显示更详细的信息\n\n推送分支\n\ngit push origin 分支名字\n\n第一次请加上-u参数 git push -u origin 分支名字\n\n从远程库获取新版本然后合并\n\ngit pull origin master\n\n从远程库获取最新的分支版本\n\ngit fetch origin master\n\npull 和 fetch 理解还真有点困难....最好实践一下\n\nfetch是从远程拉取新加入的版本,要用reset跳转到这个新的版本上去才行,否则只是拉取\n\npull就是从远程拉取了这些新的版本,然后将最新的和现在的合并\n\n相当于 fetch 然后再 merge\n\n### 暂存现场\n\n储存现场\n\ngit stash\n\n查看现场\n\ngit stash list\n\n还原现场\n\ngit stash apply\n\n删除现场\n\ngit stash drop\n\n还原并删除现场\n\ngit stash pop\n\n### 标签\n\n设置标签\n\ngit tag 标签名字 commit_id\n\ncommit_id 可选\n\n删除标签\n\ngit tag -d 标签名字\n\n推送标签,推送标签到远程仓库\n\ngit push origin 标签名\n\ngit push origin --tags 推送所有标签\n\n查看标签\n\ngit tag\n\n查看标签信息\n\ngit show 标签名字\n\n给标签说明\n\ngit tag -a 标签名字 -m \"说明\" commit_id\n\n删除远程标签\n\ngit push origin :refs/tags/标签名字\n\n## 其他\n\n给git命令设置别名\n\ngit config --global alias.别名 命令', 'Farmer', '4', '1486786493', '0');
INSERT INTO `icf_article` VALUES ('8', '8', '测试,好吧?', 'mdzz', 'Farmer', '3', '1488456085', '1');
INSERT INTO `icf_article` VALUES ('9', '9', '再来一篇', '再来一篇', 'Farmer', '0', '1488456097', '1');
INSERT INTO `icf_article` VALUES ('10', '10', '再来一篇', '好像出问题了,2333', 'Farmer', '0', '1488456109', '1');
INSERT INTO `icf_article` VALUES ('11', '5', '修改测试', '> Git是一款免费、开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。[1] Git的读音为/gɪt/。\r\n>\r\n> Git是一个开源的分布式版本控制系统，可以有效、高速的处理从很小到非常大的项目版本管理。[2] Git 是 Linus Torvalds 为了帮助管理 Linux内核开发而开发的一个开放源码的版本控制软件。\r\n>\r\n> 学习了一下git,但是很多命令暂时都还没记住,于是将现在所学到的git命令记录下来,方便查询\r\n>\r\n> 至于它们的作用,可以从下面的链接去学习\r\n>\r\n> [GIT教程跳转](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)\r\n>\r\n>![git-tutorial](http://images2015.cnblogs.com/blog/577880/201511/577880-20151122023641374-876573777.png)\r\n\r\n## 初始配置\r\n\r\n配置用户名\r\n\r\ngit config --global user.name \"CodFrm\"\r\n\r\n配置邮箱\r\n\r\ngit config --global user.email \"code.farmer@qq.com\"\r\n--global 表示全局 在整个git里生效\r\n\r\n## Git仓库命令\r\n\r\n初始化git仓库\r\n\r\ngit init\r\n\r\n将文件加入git仓库\r\n\r\ngit add -f file1 file2\r\n\r\n-f表示强制添加\r\n\r\n将文件提交到仓库\r\n\r\ngit commit -m “提交说明”\r\n\r\n查看仓库状态\r\n\r\ngit status\r\n\r\n查看上一次文件变动\r\n\r\ngit diff\r\n\r\n查看指定文件变动\r\n\r\ngit diff -- file\r\n\r\n文件删除\r\n\r\ngit rm file\r\n\r\n跳转到其他版本,如果是老的版本,使用git log将看不到之前的新版本,使用git reflog\r\n\r\ngit reset --hard HEAD^\r\n\r\nHEAD^表示上一个版本 HEAD^^表示上两个 HEAD~10表示上10个\r\n\r\nHEAD^ 也可以用 commit_id 表示想要跳转到的版本\r\n\r\n### 分支\r\n\r\n创建并切换分支\r\n\r\ngit checkout -b 分支名字\r\n\r\n创建分支\r\n\r\ngit branch 分支\r\n\r\n切换分支\r\n\r\ngit checkout 分支\r\n\r\n查看分支,当前分支有*\r\n\r\ngit branch\r\n\r\n删除分支\r\n\r\ngit branch -d 分支\r\n\r\n-D 强制删除\r\n\r\n合并分支到当前分支\r\n\r\ngit merge 分支\r\n\r\n### 日志\r\n\r\n提交历史,查看每个版本的信息\r\n\r\ngit log\r\n\r\n显示比较简单的信息 --pretty=oneline\r\n\r\n显示分支合并图 --graph\r\n\r\n命令历史,查看每个命令的信息\r\n\r\ngit reflog\r\n\r\n撤销修改,回到该版本最初样式\r\n\r\ngit checkout -- file\r\n\r\n将暂存区的文件撤回\r\n\r\ngit reset HEAD file\r\n\r\n## 远程仓库\r\n\r\n创建SSH KEY\r\n\r\nssh-keygen -t rsa -C \"code.farmer@qq.com\"\r\n\r\n关联远程库\r\n\r\ngit remote add origin git@github.com:CodFrm/StudyGit.git\r\n\r\n克隆远程仓库\r\n\r\ngit clone git@github.com:CodFrm/StudyGit.git\r\n\r\n克隆分支到本地\r\n\r\ngit checkout -b 本地分支名 origin/远程分支名\r\n\r\n查看远程库的信息\r\n\r\ngit remote\r\n\r\ngit remote -v显示更详细的信息\r\n\r\n推送分支\r\n\r\ngit push origin 分支名字\r\n\r\n第一次请加上-u参数 git push -u origin 分支名字\r\n\r\n从远程库获取新版本然后合并\r\n\r\ngit pull origin master\r\n\r\n从远程库获取最新的分支版本\r\n\r\ngit fetch origin master\r\n\r\npull 和 fetch 理解还真有点困难....最好实践一下\r\n\r\nfetch是从远程拉取新加入的版本,要用reset跳转到这个新的版本上去才行,否则只是拉取\r\n\r\npull就是从远程拉取了这些新的版本,然后将最新的和现在的合并\r\n\r\n相当于 fetch 然后再 merge\r\n\r\n### 暂存现场\r\n\r\n储存现场\r\n\r\ngit stash\r\n\r\n查看现场\r\n\r\ngit stash list\r\n\r\n还原现场\r\n\r\ngit stash apply\r\n\r\n删除现场\r\n\r\ngit stash drop\r\n\r\n还原并删除现场\r\n\r\ngit stash pop\r\n\r\n### 标签\r\n\r\n设置标签\r\n\r\ngit tag 标签名字 commit_id\r\n\r\ncommit_id 可选\r\n\r\n删除标签\r\n\r\ngit tag -d 标签名字\r\n\r\n推送标签,推送标签到远程仓库\r\n\r\ngit push origin 标签名\r\n\r\ngit push origin --tags 推送所有标签\r\n\r\n查看标签\r\n\r\ngit tag\r\n\r\n查看标签信息\r\n\r\ngit show 标签名字\r\n\r\n给标签说明\r\n\r\ngit tag -a 标签名字 -m \"说明\" commit_id\r\n\r\n删除远程标签\r\n\r\ngit push origin :refs/tags/标签名字\r\n\r\n## 其他\r\n\r\n给git命令设置别名\r\n\r\ngit config --global alias.别名 命令', 'Farmer', '0', '1488459853', '1');

-- ----------------------------
-- Table structure for icf_config
-- ----------------------------
DROP TABLE IF EXISTS `icf_config`;
CREATE TABLE `icf_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `key` varchar(255) NOT NULL COMMENT '配置键名',
  `value` varchar(255) NOT NULL COMMENT '配置值',
  `time` int(11) NOT NULL COMMENT '配置设置时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of icf_config
-- ----------------------------
INSERT INTO `icf_config` VALUES ('1', 'title', '爱编码的Farmer', '0');
INSERT INTO `icf_config` VALUES ('2', 'subtitle', '我是Farmer，我为自己代言 | 农夫小站icodef.com', '0');
INSERT INTO `icf_config` VALUES ('3', 'title2', '我是Farmer，我为自己代言', '0');
INSERT INTO `icf_config` VALUES ('4', 'duoshuo', 'icf', '0');

-- ----------------------------
-- Table structure for icf_sortlist
-- ----------------------------
DROP TABLE IF EXISTS `icf_sortlist`;
CREATE TABLE `icf_sortlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `title` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '分类标题',
  `alias` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '别名',
  `father` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of icf_sortlist
-- ----------------------------
INSERT INTO `icf_sortlist` VALUES ('1', '首页', 'index', '-1');
INSERT INTO `icf_sortlist` VALUES ('2', '编程笔记', 'pro', '-1');
INSERT INTO `icf_sortlist` VALUES ('3', 'EPL', 'EPL', '2');
INSERT INTO `icf_sortlist` VALUES ('4', 'C/C++', 'C', '2');
