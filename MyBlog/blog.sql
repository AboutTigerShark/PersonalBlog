/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-09-22 22:37:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_emailaddress
-- ----------------------------
DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_emailaddress
-- ----------------------------
INSERT INTO `account_emailaddress` VALUES ('3', '781977456@qq.com', '1', '0', '1');
INSERT INTO `account_emailaddress` VALUES ('4', '17336102346@qq.com', '0', '1', '5');
INSERT INTO `account_emailaddress` VALUES ('8', 'jasehuwei@qq.com', '0', '1', '9');
INSERT INTO `account_emailaddress` VALUES ('9', '151616126@qq.com', '0', '1', '10');
INSERT INTO `account_emailaddress` VALUES ('10', '121515161616161@qq.com', '0', '1', '11');

-- ----------------------------
-- Table structure for account_emailconfirmation
-- ----------------------------
DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58_fk` (`email_address_id`),
  CONSTRAINT `account_emailconfirmation_email_address_id_5b7f8c58_fk` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_emailconfirmation
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `img_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scan_num` int(10) unsigned NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `article_category_id_99127861_fk_category_id` (`category_id`),
  KEY `article_user_id_b06c1b9c_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `article_category_id_99127861_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `article_user_id_b06c1b9c_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '雅虎正式宣布全球裁员600人 占公司员工4%', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">雅虎周二正式宣布，将在圣诞假日期间裁员600人，占公司全球职员总数的4%。该公司发言人证实，当日已向部分职员发出了解雇通知书。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">此前数周时间里一直有猜测称，因财务状况长期不佳，可能促使雅虎在年底前裁员5%或约650人，但一直未获得雅虎的正式回应。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">雅虎在声明中称：“今天宣布的人事变动，是我们正在进行的确保雅虎在推动营收增长和利润率上升上处于最佳地位战略的一部分，同时也是为了支持向市场提供差异化产品的战略。”</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">声明还称：“我们将继续在全球招收新人，以支持我们的优先战略。雅虎感谢此次被裁员的职员所做出的重要贡献，我们将向他们支付解雇金和提供再就业服务。”</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">据雅虎内部员工透露，本次遭到裁员的员工将得到雅虎两个月薪水和一份津贴的赔偿。该员工还透露，整个产品管理部门将迁往印度，如果员工能帮助该部门成功向海外转移，离职时将获得三个月的赔偿金额。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">这次裁员也是雅虎3年内进行的第四次大裁员。但削减成本的战略至今仍未对股价产生足够的提升作用。周二雅虎股价报收于16.63美元，比2008年9月时的17.30美元还低。当时雅虎全球职员数达到最高峰，为15200人，截止最新一轮裁员前，雅虎全球职员数为14100人。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700;\">相比之下</span>，雅虎的竞争对手们如谷歌、facebook都在激烈竞争顶尖的技术工程师。谷歌在上月遭泄露的消息显示，该公司将为2.3万名员工提薪10%。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700;\">分析人士称：</span>在圣诞节来临的前两周实施裁员计划有些残忍，但这是雅虎不可避免的道路，因为雅虎太需要加大利润和刺激增长。执掌雅虎两年的CEO巴茨也因受到外界质疑压力重重，她在上周表示，等到2012年再对她的在位表现作出评价才是公平的。</p><p><br/> </p>', 'front_img/default.jpg', '15', '2019-09-11 15:00:44.457168', '1', '1', '雅虎周二正式宣布，将在圣诞假日期间裁员600人，占公司全球职员总数的4%。该公司发言人证实，当日已向部分职员发出了解雇通知书。', '1', '2019-09-13 09:23:04.021566');
INSERT INTO `article` VALUES ('2', 'git常用命令', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">使用git已两三月了，最常用的几个命令倒是很熟悉，用的比较少的命令很是记不清，要多多探索这些命令，首先要有个帐号为所欲为，接下来开始正题</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉生成SSH</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&nbsp;$&nbsp;ssh-keygen&nbsp;-t&nbsp;ras&nbsp;-C&nbsp;&quot;email@xxx&quot;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">将生成的SSH key复制到文本框中即可（title默认为邮箱名）</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉设置用户名</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">$&nbsp;git&nbsp;config&nbsp;--global&nbsp;user.name&nbsp;&quot;cc&quot;$&nbsp;git&nbsp;config&nbsp;--global&nbsp;user.email&nbsp;&quot;cc@xx&quot;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉 初始化当前目录的项目</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">git&nbsp;init</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉在该目录下新建一个文件，然后查看，将修改添加到暂存区</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">echo&nbsp;&quot;#&nbsp;test&quot;&nbsp;&gt;&gt;&nbsp;README.md\r\ngit&nbsp;add&nbsp;*&nbsp;&nbsp;//将工作区所有修改添加到暂存区git&nbsp;add&nbsp;.&nbsp;&nbsp;//将工作区所有修改添加到暂存区git&nbsp;add&nbsp;filename&nbsp;//将指定文件添加到暂存区git&nbsp;status&nbsp;&nbsp;//列出变更文件</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉将暂存区修改添加到本地仓库</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">git&nbsp;commit&nbsp;-m&nbsp;&#39;备注信息&#39;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉创建仓库，并将上诉改动push到远程</p><pre class=\"f5 js-zeroclipboard-target prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">git&nbsp;remote&nbsp;add&nbsp;origin&nbsp;https://github.com/qianduanxiaoc/test.gitgit&nbsp;push&nbsp;-u&nbsp;origin&nbsp;master</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">注：在这里遇到一个问题：每次push都要输入用户名和密码，原因是https方式 push，解决方法如下</p><pre class=\"f5 js-zeroclipboard-target prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">git&nbsp;remote&nbsp;rm&nbsp;origin&nbsp;&nbsp;&nbsp;//移除git&nbsp;remote&nbsp;add&nbsp;origin&nbsp;git@github.com:gitname/test.git&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//添加</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">此后就不用再输入用户名和密码了</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉从远程clone项目</p><pre class=\"f5 js-zeroclipboard-target prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">git&nbsp;clone&nbsp;url</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">〉放弃暂存区修改</p><pre class=\"f5 js-zeroclipboard-target prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">git&nbsp;checkout&nbsp;--&nbsp;filename&nbsp;&nbsp;//放弃暂存区修改（修改不在）git&nbsp;rm&nbsp;--cached&nbsp;filename&nbsp;&nbsp;//放弃add（修改还在，但产生一条delete记录）git&nbsp;reset&nbsp;HEAD&nbsp;filename&nbsp;&nbsp;&nbsp;//同上（没有delete记录）git&nbsp;stash&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//暂时放弃未提交的修改git&nbsp;stash&nbsp;pop&nbsp;&nbsp;//恢复</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.daqianduan.com/wp-content/uploads/2017/03/rm.png\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(1, 150, 227); text-decoration-line: none;\"><img class=\"alignnone size-full wp-image-6400\" src=\"http://www.daqianduan.com/wp-content/uploads/2017/03/rm.png\" alt=\"rm\" data-tag=\"bdshare\" width=\"495\" height=\"206\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; display: block; margin: 20px auto; max-width: 100%; background-image: none; background-position: 0px 0px; background-size: initial; background-repeat: repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; text-align: center; height: auto !important;\"/> </a></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.daqianduan.com/wp-content/uploads/2017/03/reset.png\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(1, 150, 227); text-decoration-line: none;\"><img class=\"alignnone size-full wp-image-6401\" src=\"http://www.daqianduan.com/wp-content/uploads/2017/03/reset.png\" alt=\"reset\" data-tag=\"bdshare\" width=\"546\" height=\"196\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; display: block; margin: 20px auto; max-width: 100%; background-image: none; background-position: 0px 0px; background-size: initial; background-repeat: repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; text-align: center; height: auto !important;\"/> </a><br style=\"box-sizing: border-box;\"/>〉分支操作</p><pre class=\"f5 js-zeroclipboard-target prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">/*查看分支*/git&nbsp;branch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//所有本地分支git&nbsp;branch&nbsp;-r&nbsp;&nbsp;//所有远程分支git&nbsp;branch&nbsp;-a&nbsp;&nbsp;//所有远程分支和本地分支/*创建分支*/&nbsp;git&nbsp;branch&nbsp;branchName&nbsp;//留在当前分支git&nbsp;checkout&nbsp;-b&nbsp;branchName&nbsp;//创建并切换分支git&nbsp;branch&nbsp;--set-upstream-to=&lt;remote&gt;/branchName&nbsp;//建立本地分支与远程分支的追踪关系git&nbsp;branch&nbsp;--track&nbsp;branchName&nbsp;[remote&nbsp;branch]&nbsp;//新建一个分支，并与远程建立追踪关系&nbsp;git&nbsp;checkout&nbsp;branchName&nbsp;//切到指定分支&nbsp;/*分支合并*/&nbsp;git&nbsp;pull&nbsp;origin&nbsp;branch&nbsp;//取回远程更新并与本地分支合并&nbsp;git&nbsp;fetch&nbsp;origin&nbsp;branch&nbsp;//取回远程更新&nbsp;git&nbsp;merge&nbsp;branch&nbsp;//合并指定分支到当前分支(产生提交记录)&nbsp;git&nbsp;rebase&nbsp;branch&nbsp;//合并指定分支到当前分支(不产生提交记录，比较适合有强迫症的)&nbsp;git&nbsp;cherry-pick&nbsp;commitId&nbsp;//将与commitId对应的提交合进当前分支</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">好了，今天就先记录这些。</p><p><br/> </p>', 'front_img/wpress11_Bq6lZwQ.jpg', '0', '2019-09-11 15:04:00.022234', '2', '1', '使用git已两三月了，最常用的几个命令倒是很熟悉，用的比较少的命令很是记不清，要多多探索这些命令，首先要有个帐号为所欲为，接下来开始正题', '2', '2019-09-13 09:23:04.021566');
INSERT INTO `article` VALUES ('3', 'JS判断单、多张图片加载完成', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">在实际的运用中有这样一种场景，某资源加载完成后再执行某个操作，例如在做导出时，后端通过打开模板页生成PDF，并返回下载地址。这时前后端通常需要约定一个flag，用以标识模板准备就绪，可以生成PDF了。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">试想，如果模板中有图片，此时如何判断图片是否加载完成？</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">在此之前来了解一下jquery的ready与window.onload的区别，ready只是dom结构加载完毕，便视为加载完成。(此时图片没有加载完毕)，onload是指dom的生成和资源完全加载（比如flash、图片）出来后才执行。接下来回到正题，先从单张图片说起。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">（1）、单张图片（图片在文档中）</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">//&nbsp;HTML&lt;img&nbsp;id=&#39;xiu&#39;&nbsp;src=&quot;http://www.daqianduan.com/wp-content/uploads/2014/11/hs-xiu.jpg&quot;&gt;&nbsp;&nbsp;//js\r\n&nbsp;$(document).ready(function(){\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;//jquery\r\n&nbsp;&nbsp;&nbsp;&nbsp;$(&#39;#xiu&#39;).load(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;加载完成&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;});\r\n\r\n&nbsp;&nbsp;&nbsp;//原生&nbsp;&nbsp;onload\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;xiu&nbsp;=&nbsp;document.getElementById(&#39;xiu&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;xiu.onload&nbsp;=&nbsp;xiu.onreadystatechange&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(!this.readyState||this.readyState==&#39;loaded&#39;||this.readyState==&#39;complete&#39;){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;加载完成&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;};})</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">注：<br style=\"box-sizing: border-box;\"/>1、IE8及以下版本不支持onload事件，但支持onreadystatechange事件；<br style=\"box-sizing: border-box;\"/>2、readyState是onreadystatechange事件的一个状态，值为loaded或complete的时候，表示已经加载完毕。<br style=\"box-sizing: border-box;\"/>3、以下内容省略兼容</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">（2）、单张图片（图片动态生成）</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">//js\r\n&nbsp;var&nbsp;xiu&nbsp;=&nbsp;new&nbsp;Image()\r\n&nbsp;xiu.src&nbsp;=&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2014/11/hs-xiu.jpg&#39;\r\n&nbsp;xiu.onload&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;加载完成&nbsp;\r\n&nbsp;}</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">（3）、单张图片（结合ES6 Promise）</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">//js\r\n&nbsp;new&nbsp;Promise((resolve,&nbsp;reject)=&gt;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;let&nbsp;xiu&nbsp;=&nbsp;new&nbsp;Image()\r\n&nbsp;&nbsp;&nbsp;&nbsp;xiu.src&nbsp;=&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2014/11/hs-xiu.jpg&#39;\r\n&nbsp;&nbsp;&nbsp;&nbsp;xiu.onload&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;加载完成&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;resolve(xiu)\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;}).then((xiu)=&gt;{\r\n&nbsp;//code\r\n&nbsp;})</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">（4）、多张图片</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">var&nbsp;img&nbsp;=&nbsp;[],&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;flag&nbsp;=&nbsp;0,&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;mulitImg&nbsp;=&nbsp;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2017/03/IMG_0119.jpg&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2017/01/1.jpg&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2015/11/jquery.jpg&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2015/10/maid.jpg&#39;\r\n&nbsp;];\r\n&nbsp;var&nbsp;imgTotal&nbsp;=&nbsp;mulitImg.length;\r\n&nbsp;for(var&nbsp;i&nbsp;=&nbsp;0&nbsp;;&nbsp;i&nbsp;&lt;&nbsp;imgTotal&nbsp;;&nbsp;i++){\r\n&nbsp;&nbsp;&nbsp;&nbsp;img[i]&nbsp;=&nbsp;new&nbsp;Image()\r\n&nbsp;&nbsp;&nbsp;&nbsp;img[i].src&nbsp;=&nbsp;mulitImg[i]\r\n&nbsp;&nbsp;&nbsp;&nbsp;img[i].onload&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//第i张图片加载完成\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;flag++\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(&nbsp;flag&nbsp;==&nbsp;imgTotal&nbsp;){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//全部加载完成\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;}</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">（5）、多张图片（结合ES6 Promise.all()）</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&nbsp;&nbsp;let&nbsp;mulitImg&nbsp;=&nbsp;[\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2017/03/IMG_0119.jpg&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2017/01/1.jpg&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2015/11/jquery.jpg&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;http://www.daqianduan.com/wp-content/uploads/2015/10/maid.jpg&#39;\r\n&nbsp;];\r\n&nbsp;let&nbsp;promiseAll&nbsp;=&nbsp;[],&nbsp;img&nbsp;=&nbsp;[],&nbsp;imgTotal&nbsp;=&nbsp;mulitImg.length;\r\n&nbsp;for(let&nbsp;i&nbsp;=&nbsp;0&nbsp;;&nbsp;i&nbsp;&lt;&nbsp;imgTotal&nbsp;;&nbsp;i++){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;promiseAll[i]&nbsp;=&nbsp;new&nbsp;Promise((resolve,&nbsp;reject)=&gt;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;img[i]&nbsp;=&nbsp;new&nbsp;Image()\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;img[i].src&nbsp;=&nbsp;mulitImg[i]\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;img[i].onload&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//第i张加载完成\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;resolve(img[i])\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;}\r\n&nbsp;Promise.all(promiseAll).then((img)=&gt;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//全部加载完成\r\n&nbsp;})</pre><p><br/> </p>', 'front_img/wpress18.jpg', '3', '2019-09-11 15:04:43.000804', '1', '1', '在实际的运用中有这样一种场景，某资源加载完成后再执行某个操作，例如在做导出时，后端通过打开模板页生成PDF，并返回下载地址。这时前后端通常需要约定一个flag，用以标识模板准备就绪，可以生成PDF了。', '3', '2019-09-13 09:23:04.021566');
INSERT INTO `article` VALUES ('4', '完美快速解决百度分享不支持HTTPS的问题', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">百度分享不支持HTTPS这件事由来已久，我之前向百度分享提交过这个问题，无果！但近期<a href=\"https://themebetter.com/\" target=\"_blank\" rel=\"noopener\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(1, 150, 227); text-decoration-line: none;\">themebetter</a>主题用户咨询的比较多，我们就总结了解决方案。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700;\">第一步：下载百度分享必备文件</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"https://themebetter.com/uploads/2017/09/static.zip\" style=\"box-sizing: border-box; background-color: transparent; color: rgb(1, 150, 227); text-decoration-line: none;\">点此下载static.zip</a>，将解压（解压密码：themebetter）后得到的static文件夹上传到网站根目录（注：域名/static）。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; font-weight: 700;\">最后一步：修改百度分享代码</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://themebetter.com/uploads/2017/09/baidushare.jpg\" alt=\"完美快速解决百度分享不支持HTTPS的问题\" data-tag=\"bdshare\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; display: block; margin: 20px auto; max-width: 100%; background-image: none; background-position: 0px 0px; background-size: initial; background-repeat: repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; text-align: center; height: auto !important;\"/> </p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">删除百度分享代码中的以下网址</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">http://bdimg.share.baidu.com</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">至此，你就解决了百度分享不支持HTTPS的问题。</p><p><br/> </p>', 'front_img/wpress19.jpg', '8', '2019-09-11 15:05:29.161341', '2', '1', '百度分享不支持HTTPS这件事由来已久，我之前向百度分享提交过这个问题，无果！但近期themebetter主题用户咨询的比较多，我们就总结了解决方案。', '4', '2019-09-13 09:23:04.021566');
INSERT INTO `article` VALUES ('5', '分享一个生成二维码的插件–QRCode.js', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">随着移动设备的普及，日常生活中随处可见二维码，大有一码走天下之势。那么前端如何来生成二维码？</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">通过QRCode.js我们可以快速生成二维码啦，一起来看看怎么使用吧。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">1、引入插件</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&nbsp;&nbsp;&nbsp;&nbsp;/*html*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;id=&quot;qrcode&quot;&gt;&lt;/div&gt;&nbsp;&nbsp;&nbsp;&nbsp;/*js*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;src=&quot;qrcode.js&quot;&gt;&lt;/script&gt;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">2、基本用法</p><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;qrcode&nbsp;=&nbsp;document.getElementById(&#39;qrcode&#39;)&nbsp;&nbsp;&nbsp;&nbsp;/*直接生成二维码*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;new&nbsp;QRCode(qrcode,&nbsp;&#39;http://www.daqianduan.com&#39;)&nbsp;&nbsp;&nbsp;&nbsp;/*也可以配置二维码的宽高等*/&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;qrcodeObj&nbsp;=&nbsp;new&nbsp;QRCode(&#39;qrcode&#39;,&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;text:&nbsp;&#39;http://www.daqianduan.com&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;256,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;height:&nbsp;256,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;colorDark&nbsp;:&nbsp;&#39;#000000&#39;,&nbsp;//前景色\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;colorLight&nbsp;:&nbsp;&#39;#ffffff&#39;&nbsp;&nbsp;//背景色\r\n&nbsp;&nbsp;&nbsp;&nbsp;})</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; color: rgb(42, 42, 42); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">3、API</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">设置二维码内容–makeCode</p></li></ul><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&nbsp;&nbsp;&nbsp;&nbsp;qrcodeObj.makeCode(&#39;http://www.daqianduan.com/?p=6518&amp;preview=true&#39;)</pre><ul class=\" list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">&nbsp;清除二维码–clear</p></li></ul><pre class=\"prettyprint\" style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 9.5px; margin-top: 0px; margin-bottom: 10px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: rgb(245, 245, 245); border: 1px solid rgb(204, 204, 204); border-radius: 4px;\">&nbsp;&nbsp;&nbsp;&nbsp;qrcodeObj.clear()</pre><p><br/> </p>', 'front_img/session_redis.PNG', '30', '2019-09-11 15:05:57.509411', '1', '1', '随着移动设备的普及，日常生活中随处可见二维码，大有一码走天下之势。那么前端如何来生成二维码？  通过QRCode.js我们可以快速生成二维码啦，一起来看看怎么使用吧。', '5', '2019-09-16 14:00:36.354771');

-- ----------------------------
-- Table structure for article_tags
-- ----------------------------
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_tags_article_id_tags_id_e65618fc_uniq` (`article_id`,`tags_id`),
  KEY `article_tags_tags_id_8ce905b1_fk_tags_id` (`tags_id`),
  CONSTRAINT `article_tags_article_id_ebbe35ec_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `article_tags_tags_id_8ce905b1_fk_tags_id` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tags
-- ----------------------------
INSERT INTO `article_tags` VALUES ('1', '1', '1');
INSERT INTO `article_tags` VALUES ('2', '2', '2');
INSERT INTO `article_tags` VALUES ('3', '3', '2');
INSERT INTO `article_tags` VALUES ('4', '4', '2');
INSERT INTO `article_tags` VALUES ('5', '5', '1');
INSERT INTO `article_tags` VALUES ('6', '5', '2');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', 'superuser');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('1', '1', '1');
INSERT INTO `auth_group_permissions` VALUES ('2', '1', '2');
INSERT INTO `auth_group_permissions` VALUES ('3', '1', '3');
INSERT INTO `auth_group_permissions` VALUES ('4', '1', '4');
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '5');
INSERT INTO `auth_group_permissions` VALUES ('6', '1', '6');
INSERT INTO `auth_group_permissions` VALUES ('7', '1', '7');
INSERT INTO `auth_group_permissions` VALUES ('8', '1', '8');
INSERT INTO `auth_group_permissions` VALUES ('9', '1', '9');
INSERT INTO `auth_group_permissions` VALUES ('10', '1', '10');
INSERT INTO `auth_group_permissions` VALUES ('11', '1', '11');
INSERT INTO `auth_group_permissions` VALUES ('12', '1', '12');
INSERT INTO `auth_group_permissions` VALUES ('13', '1', '13');
INSERT INTO `auth_group_permissions` VALUES ('14', '1', '14');
INSERT INTO `auth_group_permissions` VALUES ('15', '1', '15');
INSERT INTO `auth_group_permissions` VALUES ('16', '1', '16');
INSERT INTO `auth_group_permissions` VALUES ('17', '1', '17');
INSERT INTO `auth_group_permissions` VALUES ('18', '1', '18');
INSERT INTO `auth_group_permissions` VALUES ('19', '1', '19');
INSERT INTO `auth_group_permissions` VALUES ('20', '1', '20');
INSERT INTO `auth_group_permissions` VALUES ('21', '1', '21');
INSERT INTO `auth_group_permissions` VALUES ('22', '1', '22');
INSERT INTO `auth_group_permissions` VALUES ('23', '1', '23');
INSERT INTO `auth_group_permissions` VALUES ('24', '1', '24');
INSERT INTO `auth_group_permissions` VALUES ('25', '1', '25');
INSERT INTO `auth_group_permissions` VALUES ('26', '1', '26');
INSERT INTO `auth_group_permissions` VALUES ('27', '1', '27');
INSERT INTO `auth_group_permissions` VALUES ('28', '1', '28');
INSERT INTO `auth_group_permissions` VALUES ('29', '1', '29');
INSERT INTO `auth_group_permissions` VALUES ('30', '1', '30');
INSERT INTO `auth_group_permissions` VALUES ('31', '1', '31');
INSERT INTO `auth_group_permissions` VALUES ('32', '1', '32');
INSERT INTO `auth_group_permissions` VALUES ('33', '1', '33');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 文章', '6', 'add_article');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 文章', '6', 'change_article');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 文章', '6', 'delete_article');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 图片轮播', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 图片轮播', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 图片轮播', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 分类', '8', 'add_category');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 分类', '8', 'change_category');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 分类', '8', 'delete_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 友情链接', '9', 'add_friendlink');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 友情链接', '9', 'change_friendlink');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 友情链接', '9', 'delete_friendlink');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 标签', '10', 'add_tags');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 标签', '10', 'change_tags');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 标签', '10', 'delete_tags');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 用户', '11', 'add_ouser');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 用户', '11', 'change_ouser');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 用户', '11', 'delete_ouser');
INSERT INTO `auth_permission` VALUES ('34', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('35', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('36', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('37', 'Can view 文章', '6', 'view_article');
INSERT INTO `auth_permission` VALUES ('38', 'Can view 图片轮播', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('39', 'Can view 分类', '8', 'view_category');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 友情链接', '9', 'view_friendlink');
INSERT INTO `auth_permission` VALUES ('41', 'Can view 标签', '10', 'view_tags');
INSERT INTO `auth_permission` VALUES ('42', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('43', 'Can view 用户', '11', 'view_ouser');
INSERT INTO `auth_permission` VALUES ('44', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('45', 'Can add Bookmark', '12', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('46', 'Can change Bookmark', '12', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete Bookmark', '12', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('48', 'Can add User Setting', '13', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('49', 'Can change User Setting', '13', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('50', 'Can delete User Setting', '13', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('51', 'Can add User Widget', '14', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('52', 'Can change User Widget', '14', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('53', 'Can delete User Widget', '14', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('54', 'Can add log entry', '15', 'add_log');
INSERT INTO `auth_permission` VALUES ('55', 'Can change log entry', '15', 'change_log');
INSERT INTO `auth_permission` VALUES ('56', 'Can delete log entry', '15', 'delete_log');
INSERT INTO `auth_permission` VALUES ('57', 'Can view Bookmark', '12', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('58', 'Can view log entry', '15', 'view_log');
INSERT INTO `auth_permission` VALUES ('59', 'Can view User Setting', '13', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('60', 'Can view User Widget', '14', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('61', 'Can add site', '16', 'add_site');
INSERT INTO `auth_permission` VALUES ('62', 'Can change site', '16', 'change_site');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete site', '16', 'delete_site');
INSERT INTO `auth_permission` VALUES ('64', 'Can view site', '16', 'view_site');
INSERT INTO `auth_permission` VALUES ('65', 'Can add email address', '17', 'add_emailaddress');
INSERT INTO `auth_permission` VALUES ('66', 'Can change email address', '17', 'change_emailaddress');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete email address', '17', 'delete_emailaddress');
INSERT INTO `auth_permission` VALUES ('68', 'Can add email confirmation', '18', 'add_emailconfirmation');
INSERT INTO `auth_permission` VALUES ('69', 'Can change email confirmation', '18', 'change_emailconfirmation');
INSERT INTO `auth_permission` VALUES ('70', 'Can delete email confirmation', '18', 'delete_emailconfirmation');
INSERT INTO `auth_permission` VALUES ('71', 'Can view email address', '17', 'view_emailaddress');
INSERT INTO `auth_permission` VALUES ('72', 'Can view email confirmation', '18', 'view_emailconfirmation');
INSERT INTO `auth_permission` VALUES ('73', 'Can add social account', '19', 'add_socialaccount');
INSERT INTO `auth_permission` VALUES ('74', 'Can change social account', '19', 'change_socialaccount');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete social account', '19', 'delete_socialaccount');
INSERT INTO `auth_permission` VALUES ('76', 'Can add social application', '20', 'add_socialapp');
INSERT INTO `auth_permission` VALUES ('77', 'Can change social application', '20', 'change_socialapp');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete social application', '20', 'delete_socialapp');
INSERT INTO `auth_permission` VALUES ('79', 'Can add social application token', '21', 'add_socialtoken');
INSERT INTO `auth_permission` VALUES ('80', 'Can change social application token', '21', 'change_socialtoken');
INSERT INTO `auth_permission` VALUES ('81', 'Can delete social application token', '21', 'delete_socialtoken');
INSERT INTO `auth_permission` VALUES ('82', 'Can view social account', '19', 'view_socialaccount');
INSERT INTO `auth_permission` VALUES ('83', 'Can view social application', '20', 'view_socialapp');
INSERT INTO `auth_permission` VALUES ('84', 'Can view social application token', '21', 'view_socialtoken');
INSERT INTO `auth_permission` VALUES ('85', 'Can add 文章评论', '22', 'add_articlecomment');
INSERT INTO `auth_permission` VALUES ('86', 'Can change 文章评论', '22', 'change_articlecomment');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete 文章评论', '22', 'delete_articlecomment');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_index` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `img` varchar(100) NOT NULL,
  `link_url` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '1', '高级职位都在这里', 'banner/bimg1.jpg', 'http://www.aa.com', '1');
INSERT INTO `banner` VALUES ('2', '2', '互联网设计布道者冯铁看诊把脉', 'banner/bimg2.jpg', 'http://www.aa.com', '1');
INSERT INTO `banner` VALUES ('3', '3', '颜值不高别装“表”', 'banner/bimg3.jpg', 'http://www.aa.com', '1');
INSERT INTO `banner` VALUES ('4', '4', '高级职位都在这里', 'banner/bimg1_NWYG8He.jpg', 'http://www.aa.com', '1');
INSERT INTO `banner` VALUES ('5', '5', '互联网设计布道者冯铁看诊把脉', 'banner/bimg2_NJJ4LhE.jpg', 'http://www.aa.com', '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Django', 'django');
INSERT INTO `category` VALUES ('2', '运维知识', 'yun-wei-zhi-shi');

-- ----------------------------
-- Table structure for comment_articlecomment
-- ----------------------------
DROP TABLE IF EXISTS `comment_articlecomment`;
CREATE TABLE `comment_articlecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `belong_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_articlecomment_belong_id_58e0232c_fk_article_id` (`belong_id`),
  KEY `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` (`parent_id`),
  KEY `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` (`rep_to_id`),
  KEY `comment_articlecomment_user_id_2ef03f25_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomment_belong_id_58e0232c_fk_article_id` FOREIGN KEY (`belong_id`) REFERENCES `article` (`id`),
  CONSTRAINT `comment_articlecomment_user_id_2ef03f25_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_articlecomment
-- ----------------------------
INSERT INTO `comment_articlecomment` VALUES ('1', '2019-09-20 13:03:30.672079', '115161616', '5', null, null, '1');
INSERT INTO `comment_articlecomment` VALUES ('2', '2019-09-20 13:03:30.684056', '131516161616', '5', null, null, '1');
INSERT INTO `comment_articlecomment` VALUES ('3', '2019-09-20 13:03:57.152347', '11616161616161', '5', '1', '1', '1');
INSERT INTO `comment_articlecomment` VALUES ('4', '2019-09-20 13:05:07.541641', '```\nclass a:()\n```', '5', null, null, '1');
INSERT INTO `comment_articlecomment` VALUES ('5', '2019-09-20 14:28:29.401020', ':sweat:15161616', '1', null, null, '1');
INSERT INTO `comment_articlecomment` VALUES ('6', '2019-09-20 14:39:28.428544', '测试水水水水十四', '5', null, null, '5');
INSERT INTO `comment_articlecomment` VALUES ('7', '2019-09-20 14:45:34.973033', '发不了表情怎么办', '5', '2', '2', '5');
INSERT INTO `comment_articlecomment` VALUES ('8', '2019-09-20 14:46:46.282361', ':unamused:', '5', null, null, '5');
INSERT INTO `comment_articlecomment` VALUES ('9', '2019-09-20 16:29:56.878539', '\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n', '5', null, null, '5');
INSERT INTO `comment_articlecomment` VALUES ('10', '2019-09-20 16:49:34.205343', '151516161616161', '5', '4', '4', '1');
INSERT INTO `comment_articlecomment` VALUES ('11', '2019-09-20 16:52:54.827876', 'ceshi', '5', null, null, '1');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-09-09 09:30:14.026550', '1', 'superuser', '1', '[{\"added\": {}}]', '3', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-09-21 08:50:16.666611', '1', '百度', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-09-21 08:50:39.050426', '3', '781977456@qq.com (admin)', '2', '[{\"changed\": {\"fields\": [\"verified\"]}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-09-21 08:51:20.549679', '2', '127.0.0.1', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2019-09-21 08:51:30.073818', '1', '百度', '2', '[{\"changed\": {\"fields\": [\"sites\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2019-09-21 08:51:39.099170', '1', '百度', '2', '[{\"changed\": {\"fields\": [\"sites\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2019-09-21 08:53:45.291010', '1', 'django-allauth', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2019-09-21 08:55:31.399397', '1', 'django-allauth', '2', '[{\"changed\": {\"fields\": [\"sites\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2019-09-21 08:56:16.917962', '1', 'example.com', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2019-09-21 09:01:48.896848', '1', 'django-allauth', '2', '[{\"changed\": {\"fields\": [\"sites\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2019-09-21 09:14:33.662385', '1', '741353204', '3', '', '19', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('17', 'account', 'emailaddress');
INSERT INTO `django_content_type` VALUES ('18', 'account', 'emailconfirmation');
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('6', 'blog', 'article');
INSERT INTO `django_content_type` VALUES ('7', 'blog', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'blog', 'category');
INSERT INTO `django_content_type` VALUES ('9', 'blog', 'friendlink');
INSERT INTO `django_content_type` VALUES ('10', 'blog', 'tags');
INSERT INTO `django_content_type` VALUES ('22', 'comment', 'articlecomment');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('11', 'oauth', 'ouser');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('16', 'sites', 'site');
INSERT INTO `django_content_type` VALUES ('19', 'socialaccount', 'socialaccount');
INSERT INTO `django_content_type` VALUES ('20', 'socialaccount', 'socialapp');
INSERT INTO `django_content_type` VALUES ('21', 'socialaccount', 'socialtoken');
INSERT INTO `django_content_type` VALUES ('12', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('15', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('13', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('14', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-09-09 09:17:23.581911');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-09-09 09:17:27.752870');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-09-09 09:17:39.612429');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-09-09 09:17:45.644174');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-09-09 09:17:45.927130');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-09-09 09:17:46.027071');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-09-09 09:17:46.121028');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-09-09 09:17:46.348934');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-09-09 09:17:46.687769');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-09-09 09:17:46.930599');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2019-09-09 09:17:47.178461');
INSERT INTO `django_migrations` VALUES ('12', 'oauth', '0001_initial', '2019-09-09 09:18:01.616318');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2019-09-09 09:18:11.047176');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2019-09-09 09:18:11.234063');
INSERT INTO `django_migrations` VALUES ('15', 'blog', '0001_initial', '2019-09-09 09:18:25.461451');
INSERT INTO `django_migrations` VALUES ('16', 'blog', '0002_article_user', '2019-09-09 09:18:29.077085');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2019-09-09 09:18:33.052230');
INSERT INTO `django_migrations` VALUES ('18', 'xadmin', '0001_initial', '2019-09-09 10:06:34.714681');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0002_log', '2019-09-09 10:06:43.868055');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0003_auto_20160715_0100', '2019-09-09 10:06:46.025220');
INSERT INTO `django_migrations` VALUES ('21', 'blog', '0003_auto_20190909_2056', '2019-09-09 12:56:55.474578');
INSERT INTO `django_migrations` VALUES ('22', 'blog', '0004_auto_20190911_2327', '2019-09-11 15:28:00.500337');
INSERT INTO `django_migrations` VALUES ('23', 'blog', '0005_auto_20190912_0021', '2019-09-11 16:21:40.384407');
INSERT INTO `django_migrations` VALUES ('24', 'blog', '0006_auto_20190913_1722', '2019-09-13 09:23:12.418885');
INSERT INTO `django_migrations` VALUES ('26', 'account', '0001_initial', '2019-09-19 09:05:30.401375');
INSERT INTO `django_migrations` VALUES ('27', 'account', '0002_email_max_length', '2019-09-19 09:05:36.604189');
INSERT INTO `django_migrations` VALUES ('28', 'sites', '0001_initial', '2019-09-19 09:05:37.241854');
INSERT INTO `django_migrations` VALUES ('29', 'sites', '0002_alter_domain_unique', '2019-09-19 09:05:37.843500');
INSERT INTO `django_migrations` VALUES ('30', 'socialaccount', '0001_initial', '2019-09-19 09:05:55.855726');
INSERT INTO `django_migrations` VALUES ('31', 'socialaccount', '0002_token_max_lengths', '2019-09-19 09:05:57.025375');
INSERT INTO `django_migrations` VALUES ('32', 'socialaccount', '0003_extra_data_default_dict', '2019-09-19 09:05:57.137308');
INSERT INTO `django_migrations` VALUES ('33', 'comment', '0001_initial', '2019-09-20 10:09:53.789014');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('enhg37lf2cg1pfejgqjkeoa55gj5ckcc', 'YjVkMDdmYTRlOGZmYmMwODBmZjQ0MjhiNTdjNGNjMWM4OWJkODZhNDp7InNvY2lhbGFjY291bnRfc29jaWFsbG9naW4iOnsiYWNjb3VudCI6eyJpZCI6bnVsbCwidXNlcl9pZCI6bnVsbCwicHJvdmlkZXIiOiJiYWlkdSIsInVpZCI6Ijc0MTM1MzIwNCIsImxhc3RfbG9naW4iOm51bGwsImRhdGVfam9pbmVkIjpudWxsLCJleHRyYV9kYXRhIjp7InVpZCI6Ijc0MTM1MzIwNCIsInVuYW1lIjoiYSoqKjYiLCJwb3J0cmFpdCI6IjY4MmM2MTczMzczODMxMzkzNzM3MzQzNTM2MmIzNCJ9fSwidXNlciI6eyJpZCI6bnVsbCwicGFzc3dvcmQiOiIhc2NrTkVHbUFRVHl0YjVSWm9tRENEYk51WU9rQXhsbk9PaTZ4TVEwTiIsImxhc3RfbG9naW4iOm51bGwsImlzX3N1cGVydXNlciI6ZmFsc2UsInVzZXJuYW1lIjoiNzQxMzUzMjA0IiwiZmlyc3RfbmFtZSI6ImEqKio2IiwibGFzdF9uYW1lIjoiIiwiZW1haWwiOiIiLCJpc19zdGFmZiI6ZmFsc2UsImlzX2FjdGl2ZSI6dHJ1ZSwiZGF0ZV9qb2luZWQiOiIyMDE5LTA5LTIxVDA5OjI4OjI4LjA1MFoiLCJsaW5rIjoiIiwiYXZhdGFyIjoidXBpYy9kZWZhdWx0LnBuZyJ9LCJzdGF0ZSI6eyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImVtYWlsX2FkZHJlc3NlcyI6W10sInRva2VuIjp7ImlkIjpudWxsLCJhcHBfaWQiOjEsImFjY291bnRfaWQiOm51bGwsInRva2VuIjoiMjEuYzYxOTI5YmMzNWNhNWNmMzhhNTA4M2EyNzMyMWFlYmYuMjU5MjAwMC4xNTcxNjUwMTA3Ljc0MTM1MzIwNC0xNzMwMjI3MSIsInRva2VuX3NlY3JldCI6IjIyLjA3YjBhZTFlMGNlYmIzYzZiMDU1ZTFlMDdmOTFlMGQ5LjMxNTM2MDAwMC4xODg0NDE4MTA3Ljc0MTM1MzIwNC0xNzMwMjI3MSIsImV4cGlyZXNfYXQiOiIyMDE5LTEwLTIxVDA5OjI4OjI3Ljc2MVoifX19', '2019-10-05 09:28:28.058710');
INSERT INTO `django_session` VALUES ('l6qq50uj1g1jsxr936hug4vka51q6my9', 'Yzc2NTJiNjM1ZWRlMDEwNDEwZDE1MDM2ZTdlY2MwZTFmOGI2MmQ3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNDkxZGRhNTQ5YTA5NDRkMDY1M2IxM2VlNzc1YjI4Yjc5YjZjNTUzIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsInRhZ3MiXSwiX3BfbmFtZV9fY29udGFpbnM9bXkiXX0=', '2019-10-04 17:31:29.496581');
INSERT INTO `django_session` VALUES ('qnah92qzk7eybt6pugl8qzs6hkzw5cu4', 'OGUyYzZhYzViZDM4NTE0ZjdjNjQ5NjNhNzk5YWMwOWUzODYyNGQ4ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNDkxZGRhNTQ5YTA5NDRkMDY1M2IxM2VlNzc1YjI4Yjc5YjZjNTUzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-10-05 07:05:41.975581');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('2', '127.0.0.1', 'localhost');

-- ----------------------------
-- Table structure for friendlink
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------
INSERT INTO `friendlink` VALUES ('1', 'django中文网', 'https://www.django.cn', '1');
INSERT INTO `friendlink` VALUES ('2', '百度', 'https://www.baidu.com', '1');
INSERT INTO `friendlink` VALUES ('3', 'CSDN博客', 'https://blog.csdn.net/weixin_43667829', '1');

-- ----------------------------
-- Table structure for oauth_ouser
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser`;
CREATE TABLE `oauth_ouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `link` varchar(200) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_ouser
-- ----------------------------
INSERT INTO `oauth_ouser` VALUES ('1', 'pbkdf2_sha256$100000$maOgTkJXgSt7$C5JiNlysTYm1wq5XSAh9Bnb1cCifeetGXa+DSD19vaM=', '2019-09-21 09:13:29.777757', '1', 'admin', '', '', '781977456@qq.com', '1', '1', '2019-09-09 09:26:03.307356', 'http://aagag.com', 'upic/default.png');
INSERT INTO `oauth_ouser` VALUES ('5', 'pbkdf2_sha256$100000$vtA4BxExtSlW$biFgHBhPRSLtIPMP55470jL0Ul/Bu6bi8HN1Yllun18=', '2019-09-21 08:59:40.288980', '0', 'woajgajohahagh', '', '', '17336102346@qq.com', '0', '1', '2019-09-20 14:37:00.000000', '', 'upic/2019/09/21/session_redis.PNG');
INSERT INTO `oauth_ouser` VALUES ('9', 'pbkdf2_sha256$100000$TL58vIAOf4nE$hLBaWc61dkY44nyqNfX8QeiWgr9BOmKs7O+GAf5y1PQ=', null, '0', 'aaaaaaaaaaa', '', '', 'jasehuwei@qq.com', '0', '1', '2019-09-21 07:58:15.879986', '', 'upic/default.png');
INSERT INTO `oauth_ouser` VALUES ('10', 'pbkdf2_sha256$100000$S41YKYh7gW9z$yvNF6DoQbW4CwrIeJXp/FrhhkcRbn9t2jYkT0aeFgtw=', null, '0', 'age33', '', '', '151616126@qq.com', '0', '1', '2019-09-21 08:07:02.311190', '', 'upic/default.png');
INSERT INTO `oauth_ouser` VALUES ('11', '!P35cM3WnanoSoaa3n7DfWb5uuHLEqeyC8kZb4buW', '2019-09-21 09:13:05.967978', '0', '741353204', 'a***6', '', '121515161616161@qq.com', '0', '1', '2019-09-21 09:05:05.810000', '', 'upic/default.png');

-- ----------------------------
-- Table structure for oauth_ouser_groups
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser_groups`;
CREATE TABLE `oauth_ouser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_groups_ouser_id_group_id_4a9e5409_uniq` (`ouser_id`,`group_id`),
  KEY `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` (`group_id`),
  CONSTRAINT `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `oauth_ouser_groups_ouser_id_c543bcdc_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_ouser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_ouser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser_user_permissions`;
CREATE TABLE `oauth_ouser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_user_permiss_ouser_id_permission_id_ab6b2ccc_uniq` (`ouser_id`,`permission_id`),
  KEY `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `oauth_ouser_user_permissions_ouser_id_12e23549_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_ouser_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for socialaccount_socialaccount
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialaccount
-- ----------------------------

-- ----------------------------
-- Table structure for socialaccount_socialapp
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialapp
-- ----------------------------
INSERT INTO `socialaccount_socialapp` VALUES ('1', 'baidu', 'django-allauth', 'PE7UAaFNBd5BdKGuZQG8DFZG', '7KkqzUWDGSyIAZDMUvlBQkFGOFno8shY', '');

-- ----------------------------
-- Table structure for socialaccount_socialapp_sites
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialapp_sites
-- ----------------------------
INSERT INTO `socialaccount_socialapp_sites` VALUES ('3', '1', '2');

-- ----------------------------
-- Table structure for socialaccount_socialtoken
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialtoken
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_d06e0d9e_uniq` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', 'django', 'django');
INSERT INTO `tags` VALUES ('2', 'Python教程', 'pythonjiao-cheng');
INSERT INTO `tags` VALUES ('6', 'mysql', 'mysql');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2019-09-11 14:57:34.127901', '127.0.0.1', '1', 'Django', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2019-09-11 14:58:27.536890', '127.0.0.1', '1', 'django', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2019-09-11 14:58:37.949086', '127.0.0.1', '2', 'Python教程', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2019-09-11 15:00:44.500190', '127.0.0.1', '1', '雅虎正式宣布全球裁员600人 占公司员工4%', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2019-09-11 15:02:18.013178', '127.0.0.1', '2', '运维知识', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2019-09-11 15:02:21.213382', '127.0.0.1', '2', '运维知识', 'change', '没有字段被修改。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2019-09-11 15:04:00.133297', '127.0.0.1', '2', 'git常用命令', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2019-09-11 15:04:43.059795', '127.0.0.1', '3', 'JS判断单、多张图片加载完成', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2019-09-11 15:05:29.183388', '127.0.0.1', '4', '完美快速解决百度分享不支持HTTPS的问题', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2019-09-11 15:05:57.537422', '127.0.0.1', '5', '分享一个生成二维码的插件–QRCode.js', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2019-09-11 15:28:46.104434', '127.0.0.1', '5', '分享一个生成二维码的插件–QRCode.js', 'change', '修改 content 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2019-09-11 15:29:29.450264', '127.0.0.1', '4', '完美快速解决百度分享不支持HTTPS的问题', 'change', '修改 content 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2019-09-11 15:29:49.053400', '127.0.0.1', '3', 'JS判断单、多张图片加载完成', 'change', '修改 content 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2019-09-11 15:30:04.826468', '127.0.0.1', '2', 'git常用命令', 'change', '修改 content 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2019-09-11 15:30:20.022675', '127.0.0.1', '1', '雅虎正式宣布全球裁员600人 占公司员工4%', 'change', '修改 content 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2019-09-11 15:58:04.751657', '127.0.0.1', '3', 'Django', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2019-09-11 15:58:15.041183', '127.0.0.1', null, '', 'delete', '批量删除 1 个 标签', null, '1');
INSERT INTO `xadmin_log` VALUES ('18', '2019-09-11 15:58:21.115915', '127.0.0.1', '4', 'django', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2019-09-11 15:58:36.044595', '127.0.0.1', null, '', 'delete', '批量删除 1 个 标签', null, '1');
INSERT INTO `xadmin_log` VALUES ('20', '2019-09-11 16:53:15.913202', '127.0.0.1', '1', 'FriendLink object (1)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2019-09-11 16:53:24.285111', '127.0.0.1', '1', 'FriendLink object (1)', 'change', '修改 is_show', '9', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2019-09-11 16:53:38.594389', '127.0.0.1', '2', 'FriendLink object (2)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2019-09-11 16:53:48.902440', '127.0.0.1', '2', 'FriendLink object (2)', 'change', '修改 link_url', '9', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2019-09-11 16:54:27.794347', '127.0.0.1', '3', 'FriendLink object (3)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2019-09-11 16:59:10.873604', '127.0.0.1', '1', 'Banner object (1)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2019-09-11 16:59:58.152894', '127.0.0.1', '2', 'Banner object (2)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2019-09-11 17:00:19.690300', '127.0.0.1', '3', 'Banner object (3)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2019-09-11 17:00:46.660430', '127.0.0.1', '4', 'Banner object (4)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2019-09-11 17:01:02.225750', '127.0.0.1', '4', 'Banner object (4)', 'change', '修改 img', '7', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2019-09-11 17:01:31.824117', '127.0.0.1', '5', 'Banner object (5)', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2019-09-13 07:54:33.570457', '127.0.0.1', '5', '分享一个生成二维码的插件–QRCode.js', 'change', '修改 desc 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2019-09-13 07:58:53.348059', '127.0.0.1', '5', '分享一个生成二维码的插件–QRCode.js', 'change', '修改 img_link 和 scan_num', '6', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2019-09-13 07:59:23.885084', '127.0.0.1', '4', '完美快速解决百度分享不支持HTTPS的问题', 'change', '修改 desc，img_link 和 scan_num', '6', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2019-09-13 07:59:48.064770', '127.0.0.1', '3', 'JS判断单、多张图片加载完成', 'change', '修改 desc，img_link 和 scan_num', '6', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2019-09-13 08:00:13.422398', '127.0.0.1', '2', 'git常用命令', 'change', '修改 desc 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2019-09-13 08:00:47.684752', '127.0.0.1', '1', '雅虎正式宣布全球裁员600人 占公司员工4%', 'change', '修改 desc，img_link 和 scan_num', '6', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2019-09-13 09:47:11.667799', '127.0.0.1', '1', 'Django', 'change', '修改 slug', '8', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2019-09-13 10:08:13.953687', '127.0.0.1', '5', '四', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2019-09-13 10:08:19.426497', '127.0.0.1', '5', '四', 'delete', '', '10', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2019-09-13 10:09:20.540288', '127.0.0.1', '6', 'mysql', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2019-09-13 10:10:25.574222', '127.0.0.1', '6', 'mysql', 'change', '没有字段被修改。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2019-09-13 10:13:27.568934', '127.0.0.1', '7', '运维', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2019-09-13 10:16:57.595150', '127.0.0.1', '2', '运维知识', 'change', '修改 slug', '8', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2019-09-13 10:17:04.471618', '127.0.0.1', '1', 'Django', 'change', '没有字段被修改。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2019-09-13 14:19:41.215133', '127.0.0.1', null, '', 'delete', '批量删除 1 个 标签', null, '1');
INSERT INTO `xadmin_log` VALUES ('46', '2019-09-13 14:19:51.590668', '127.0.0.1', '2', 'Python教程', 'change', '修改 slug', '10', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2019-09-13 14:19:57.434774', '127.0.0.1', '1', 'django', 'change', '修改 slug', '10', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2019-09-13 14:20:00.520930', '127.0.0.1', '1', 'django', 'change', '没有字段被修改。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2019-09-16 14:00:36.373831', '127.0.0.1', '5', '分享一个生成二维码的插件–QRCode.js', 'change', '修改 tags 和 img_link', '6', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2019-09-19 05:35:52.796448', '127.0.0.1', '2', 'admin1', 'delete', '', '11', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2019-09-19 11:10:30.792901', '127.0.0.1', '3', 'admin1', 'delete', '', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2019-09-19 11:12:00.744601', '127.0.0.1', '4', 'admin1', 'delete', '', '11', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2019-09-21 07:45:01.900866', '127.0.0.1', '5', 'woajgajohahagh', 'change', '修改 last_login，username 和 avatar', '11', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2019-09-21 07:51:37.349540', '127.0.0.1', null, '', 'delete', '批量删除 3 个 用户', null, '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'oauth_ouser_editform_portal', 'box-0,box-1,box-2,box-3,box-4|box-5', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
