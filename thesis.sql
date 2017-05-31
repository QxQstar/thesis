-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1:3306
-- 生成日期: 2017 年 05 月 31 日 08:39
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `thesis`
--

-- --------------------------------------------------------

--
-- 表的结构 `activemessage`
--

CREATE TABLE IF NOT EXISTS `activemessage` (
  `activeCode` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号，自增长',
  `sTime` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '活动开始时间',
  `eTime` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '活动结束时间',
  `status` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态',
  `title` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `intro` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '介绍',
  `img` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '宣传图',
  `zpNum` int(20) NOT NULL COMMENT '作品数量',
  PRIMARY KEY (`activeCode`),
  UNIQUE KEY `activeCode` (`activeCode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='活动信息表' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `activemessage`
--

INSERT INTO `activemessage` (`activeCode`, `sTime`, `eTime`, `status`, `title`, `intro`, `img`, `zpNum`) VALUES
(14, '2017-3-4', '2017-4-2', '0', '百创未来 智驭出行 - 百度无人车LOGO设计征集', '互联网+时代，改变了我们的生活。\r\n\r\n你有没有想过，或许3年后的今天，你不必再用钥匙亲自打开车门，因为“它”的横空出世，给予你最大的便利；又或许5年后某一天，你不必为了一个上路pass证，三番五次的苦苦练习，因为“它”的时刻陪伴，让路途变成随手输一输起点和终点，就可以轻松无忧的到达各个地方。\r\n\r\n这，才是最理想的出行方式！这，就是百度无人车！\r\n\r\n用百种智慧，打破常规，颠覆未来。用最强汽车大脑，创造一切可能！\r\n启迪未来的道路上，需要有你的一臂之力！你，决不能错过这一集！', 'uploads/aa45a9dc64ff4bd3f2f1697722e6247f.jpg', 5),
(29, '2017-4-5', '2017-5-6', '0', '富文本', '<p>的点点滴滴</p><p>对方打款发货的</p><p>服服服开发角度看</p><p><br></p>', 'uploads/103fc8047b341446899284a07d818a36.jpg', 0),
(16, '2017-4-5', '2017-7-8', '2', '画出你的新熊YOUNG - 熊博士品牌卡通形象创意设计征集', '谁说年轻就是稚嫩无知？\r\n我说年轻是有颜有FUN、是敢ZUO敢当、是熊博士入口那一刻的快乐。\r\n时间在变，童趣不变，年轻就要嚼出趣！\r\n熊博士邀你一起YOUNG起来：用你的画笔，画出你的熊YOUNG，FUN享年轻的定义。\r\n让快乐来势“熊熊”，势不可挡！', 'uploads/e726c8b15dc31314eb2489249da07b37.jpg', 0),
(17, '2017-3-4', '2017-5-6', '0', '别具匠心的美好 第三期：“梳”情画意 “镜”月花颜 - 第二届谭木匠创意产品设计征集', '谭木匠控股有限公司管理中心位于香港和江苏句容[1]  ，工厂坐落在三峡之滨重庆万州；环境优美；占地面积54000平方米。在1997年由谭传华创一家重庆市专门销售梳子、镜子、组合礼盒、其他饰品等，另外还有特许加盟商店。而香港、马来西亚、韩国、新加坡、德国，以及美国纽约也有分店。\r\n谭木匠秉承中国传统手工艺精华，奉行“我善治木”的质量方针，历经十余年的发展，现已发展成为集梳理用品、饰品于一体的专业化公司。', 'uploads/9e5d4e032504443cfa11d1ad4c5cec52.jpg', 3),
(27, '2017-4-1', '2017-4-10', '0', '清明时节雨纷纷', '清明时节雨纷纷', 'uploads/62a7a60792f95b2c371044824668eae1.jpg', 0),
(22, '2017-5-6', '2017-5-8', '0', '1', '1111111111111111111111111', 'uploads/060c4b592ea67953ea811602b7e146c6.jpg', 0),
(24, '2017-3-4', '2017-4-6', '0', '3', '3', 'uploads/1d064b423854f5e1e6339f3aba0365ce.jpg', 2);

-- --------------------------------------------------------

--
-- 表的结构 `adminmessage`
--

CREATE TABLE IF NOT EXISTS `adminmessage` (
  `code` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '账号',
  `password` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `role` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '权限',
  `question1` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '安全问题一',
  `answer1` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '答案一',
  `question2` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '安全问题二',
  `answer2` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '答案二',
  `hasQuestion` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '是否设置了安全问题',
  `time` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管理员信息表';

--
-- 转存表中的数据 `adminmessage`
--

INSERT INTO `adminmessage` (`code`, `password`, `role`, `question1`, `answer1`, `question2`, `answer2`, `hasQuestion`, `time`) VALUES
('123321', '123456', '1', '', '', '', '', '0', '2017-3-4'),
('admin', '123456', '2', '小学班主任的名字', '刘欢', '小学学号', '13', '1', '2017-3-6'),
('super', '123321', '3', '小学班主任的名字', '张华', '小学学号', '2', '1', '2017-3-4');

-- --------------------------------------------------------

--
-- 表的结构 `designermessage`
--

CREATE TABLE IF NOT EXISTS `designermessage` (
  `email` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '设计师账号',
  `nickname` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '设计师昵称',
  `password` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '登录密码',
  `img` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '头像',
  `intro` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '简介',
  `question1` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '安全问题一',
  `answer1` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '答案一',
  `question2` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '安全问题二',
  `answer2` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '答案二',
  `role` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '权限',
  `hasQuestion` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '是否设置了安全问题',
  `focus` int(20) NOT NULL COMMENT '粉丝数量',
  `time` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`email`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='设计师基本信息表';

--
-- 转存表中的数据 `designermessage`
--

INSERT INTO `designermessage` (`email`, `nickname`, `password`, `img`, `intro`, `question1`, `answer1`, `question2`, `answer2`, `role`, `hasQuestion`, `focus`, `time`) VALUES
('1395294694@qq.com', 'QxQstar', 'qxqdzh0102!', 'uploads/9f9dc3003f39cb07c6d3410000fe3912.jpg', '地方大家好浮动就大幅度发', '小学学号', '14', '小学班主任的名字', '刘欢', '0', '1', 1, '2017-3-4'),
('1375294694@qq.com', '自己听', '123456', 'uploads/598a87e7df5fd6d7c524a850622dce0f.jpg', '', '小学班主任的名字', '刘欢', '高中班主任的名字', '李强', '0', '1', 2, '2017-3-7'),
('1395294699@qq.com', '', '123123', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '小学班主任的名字', '李丽', '小学学号', '23', '0', '1', 1, '2017-03-31'),
('1395294696@qq.com', '一颗苏', '123456', 'uploads/1df22872a201501b3c6a25210c62b9e4.jpg', '', '小学学号', '12', '高中班主任的名字', '李杰', '0', '1', 1, '2017-03-30'),
('1395294697@qq.com', '', '123321', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 1, '2017-03-31'),
('1395294688@qq.com', '', '123321', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-03-31'),
('1395294664@qq.com', '', '123456', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-03-30'),
('1395294645@qq.com', '', '123456', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-03-30'),
('yf@qq.com', '', '123456', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-05-24'),
('345@qq.com', '', '123456', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-05-24'),
('678@qq.com', '', '123456', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-05-24'),
('qxq@qq.com', '', '123456', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-05-24'),
('139@qq.com', '', '123456', 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg', '', '', '', '', '', '0', '0', 0, '2017-05-24');

-- --------------------------------------------------------

--
-- 表的结构 `discuss`
--

CREATE TABLE IF NOT EXISTS `discuss` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号，自增长',
  `email` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '设计师账号',
  `zpCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '作品编号',
  `time` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '评价时间',
  `content` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '内容',
  `toEmail` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '被回复的设计师',
  `toContent` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '被回复的内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评价表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `discuss`
--

INSERT INTO `discuss` (`id`, `email`, `zpCode`, `time`, `content`, `toEmail`, `toContent`) VALUES
(1, '1395294694@qq.com', '22', '2017-03-26 00:00:00', '很酷', '', ''),
(2, '1395294694@qq.com', '22', '2017-03-26 00:00:00', '我也觉得', '1395294694@qq.com', '很酷'),
(3, '1395294694@qq.com', '22', '2017-03-26 00:00:00', '超级酷', '1395294694@qq.com', '我也觉得'),
(4, '1395294694@qq.com', '23', '2017-03-26 00:00:00', '好看', '', ''),
(5, '1395294694@qq.com', '23', '2017-03-26 00:00:00', '是的', '1395294694@qq.com', '好看'),
(6, '1395294694@qq.com', '23', '2017-03-26 00:00:00', '有质感', '', ''),
(7, '1395294694@qq.com', '23', '2017-03-26 00:00:00', '好好好', '1395294694@qq.com', '有质感'),
(8, '1395294694@qq.com', '24', '2017-03-26 00:00:00', '喜欢', '', ''),
(9, '1395294694@qq.com', '27', '2017-03-26 00:00:00', 'buh', '', ''),
(10, '1395294694@qq.com', '43', '2017-04-01', '沙发', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `focus`
--

CREATE TABLE IF NOT EXISTS `focus` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号，自增长',
  `email` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '设计师账号',
  `beEmail` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '被关注的设计师账号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  UNIQUE KEY `id_3` (`id`),
  UNIQUE KEY `id_4` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='设计师关注表' AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `focus`
--

INSERT INTO `focus` (`id`, `email`, `beEmail`) VALUES
(12, '1395294694@qq.com', '1375294694@qq.com'),
(13, '1395294694@qq.com', '1395294696@qq.com'),
(16, '1395294694@qq.com', '1395294697@qq.com'),
(18, '1395294694@qq.com', '1395294699@qq.com'),
(19, '1395294688@qq.com', '1395294694@qq.com'),
(20, '1395294696@qq.com', '1375294694@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `good`
--

CREATE TABLE IF NOT EXISTS `good` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号，自增长',
  `zpCode` int(20) NOT NULL COMMENT '作品编号',
  `email` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '设计师账号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='点赞表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `good`
--

INSERT INTO `good` (`id`, `zpCode`, `email`) VALUES
(23, 15, '1395294694@qq.com'),
(21, 15, '1845294694@qq.com'),
(20, 12, '1845294694@qq.com'),
(24, 15, '1375294694@qq.com'),
(25, 22, '1395294694@qq.com'),
(26, 27, '1375294694@qq.com'),
(27, 43, '1395294696@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `headimg`
--

CREATE TABLE IF NOT EXISTS `headimg` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `img` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`,`img`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统头像表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `headimg`
--

INSERT INTO `headimg` (`id`, `img`) VALUES
(2, 'uploads/c3fe7dcc0c945a672f608221c86b8482.jpg'),
(3, 'uploads/77d02ff75d9ab80095b4cffd7059d608.png'),
(4, 'uploads/5bf2cccab095f769f6392223c83448f0.png'),
(5, 'uploads/54df43ed3c0057408262b970e5bef43e.png'),
(6, 'uploads/22abe436d8fa6fe9bb959f9036f218d9.png');

-- --------------------------------------------------------

--
-- 表的结构 `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号，自增长',
  `form` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '来源账号',
  `email` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '接受账号',
  `time` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '时间',
  `content` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '内容',
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='消息表' AUTO_INCREMENT=86 ;

--
-- 转存表中的数据 `note`
--

INSERT INTO `note` (`id`, `form`, `email`, `time`, `content`, `status`) VALUES
(26, 'system', '1375294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=22"> 1</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-5-6至2017-5-8</p>', 1),
(27, 'system', '1395294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=22"> 1</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-5-6至2017-5-8</p>', 1),
(30, 'system', '1375294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=24"> 3</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-3-4至2017-4-6</p>', 1),
(29, 'system', '1395294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=23"> 2</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-6-7至2017-8-9</p>', 1),
(28, 'system', '1375294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=23"> 2</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-6-7至2017-8-9</p>', 1),
(31, 'system', '1395294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=24"> 3</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-3-4至2017-4-6</p>', 1),
(21, '1395294694@qq.com', '1375294694@qq.com', '2017-03-26 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=27">作品评价</a> </h2><p class="content">设计师1395294694@qq.com评价了你的作品，ta说buh</p>', 1),
(25, 'system', '1395294694@qq.com', '2017-03-27 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=31">白色</a> </h2><p class="content">你的作品白色 通过了管理员的审核</p>', 1),
(23, 'system', '1395294694@qq.com', '2017-03-26 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=21"> 信息</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-6</p>', 1),
(24, '1375294694@qq.com', '1395294694@qq.com', '2017-03-26 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1375294694@qq.com">设计师1375294694@qq.com</a>取消了对你的关注！ </h2><p class="content">设计师1375294694@qq.com取消了对你的关注！</p>', 1),
(32, 'system', '1375294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=25"> 4</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-8</p>', 1),
(33, 'system', '1395294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=25"> 4</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-8</p>', 1),
(34, 'system', '1375294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=26"> 5</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 1),
(35, 'system', '1395294694@qq.com', '2017-03-29 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=26"> 5</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 1),
(36, 'system', '1375294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=27"> 清明时节雨纷纷</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-1至2017-4-10</p>', 1),
(37, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=27"> 清明时节雨纷纷</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-1至2017-4-10</p>', 1),
(38, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=33">3333333333</a> </h2><p class="content">你的作品3333333333 通过了管理员的审核</p>', 1),
(39, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=37">顶顶顶顶顶顶顶顶顶顶大大大</a> </h2><p class="content">你的作品顶顶顶顶顶顶顶顶顶顶大大大 通过了管理员的审核</p>', 1),
(40, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=35">舒适版</a> </h2><p class="content">你的作品舒适版 通过了管理员的审核</p>', 1),
(41, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=36">顶顶顶顶</a> </h2><p class="content">你的作品顶顶顶顶 通过了管理员的审核</p>', 1),
(42, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=34">百川</a> </h2><p class="content">你的作品百川 通过了管理员的审核</p>', 1),
(43, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=38">方法方法付付付付付</a> </h2><p class="content">你的作品方法方法付付付付付 通过了管理员的审核</p>', 1),
(44, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=39">方法方法付付付付付付付付</a> </h2><p class="content">你的作品方法方法付付付付付付付付 通过了管理员的审核</p>', 1),
(45, 'system', '1395294694@qq.com', '2017-03-30 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=40">对对对</a> </h2><p class="content">你的作品对对对 通过了管理员的审核</p>', 1),
(46, 'system', '1375294694@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=42">www</a> </h2><p class="content">你的作品www没有通过管理员审核</p>', 0),
(47, 'system', '1375294694@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=43">盒子</a> </h2><p class="content">你的作品盒子 通过了管理员的审核</p>', 0),
(48, 'system', '1395294664@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=45">得到</a> </h2><p class="content">你的作品得到 通过了管理员的审核</p>', 0),
(49, 'system', '1395294645@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=46">得到</a> </h2><p class="content">你的作品得到 通过了管理员的审核</p>', 0),
(50, 'system', '1395294696@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=44">好好好</a> </h2><p class="content">你的作品好好好 通过了管理员的审核</p>', 1),
(51, '1395294694@qq.com', '1375294694@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>关注了你！ </h2><p class="content">设计师1395294694@qq.com关注了你！</p>', 0),
(52, '1395294694@qq.com', '1395294696@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>关注了你！ </h2><p class="content">设计师1395294694@qq.com关注了你！</p>', 1),
(53, '1395294694@qq.com', '1395294664@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>关注了你！ </h2><p class="content">设计师1395294694@qq.com关注了你！</p>', 0),
(54, '1395294694@qq.com', '1395294645@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>关注了你！ </h2><p class="content">设计师1395294694@qq.com关注了你！</p>', 0),
(55, 'system', '1395294688@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=47">电放费</a> </h2><p class="content">你的作品电放费 通过了管理员的审核</p>', 0),
(56, 'system', '1395294697@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=48">对对对</a> </h2><p class="content">你的作品对对对 通过了管理员的审核</p>', 0),
(57, '1395294694@qq.com', '1395294697@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>关注了你！ </h2><p class="content">设计师1395294694@qq.com关注了你！</p>', 0),
(58, '1395294694@qq.com', '1395294688@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>关注了你！ </h2><p class="content">设计师1395294694@qq.com关注了你！</p>', 0),
(59, 'system', '1395294699@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=49">对对对</a> </h2><p class="content">你的作品对对对 通过了管理员的审核</p>', 1),
(60, '1395294694@qq.com', '1395294699@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>关注了你！ </h2><p class="content">设计师1395294694@qq.com关注了你！</p>', 1),
(61, '1395294688@qq.com', '1395294694@qq.com', '2017-03-31 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294688@qq.com">设计师1395294688@qq.com</a>关注了你！ </h2><p class="content">设计师1395294688@qq.com关注了你！</p>', 1),
(62, '1395294694@qq.com', '1375294694@qq.com', '2017-04-01 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=43">作品评价</a> </h2><p class="content">设计师1395294694@qq.com评价了你的作品，ta说沙发</p>', 0),
(63, 'system', '1375294694@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 0),
(64, 'system', '1395294645@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 0),
(65, 'system', '1395294664@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 0),
(66, 'system', '1395294688@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 0),
(67, 'system', '1395294694@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 1),
(68, 'system', '1395294696@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 1),
(69, 'system', '1395294697@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 0),
(70, 'system', '1395294699@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=28"> eee</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-4-7</p>', 1),
(71, 'system', '1375294694@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 0),
(72, 'system', '1395294645@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 0),
(73, 'system', '1395294664@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 0),
(74, 'system', '1395294688@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 0),
(75, 'system', '1395294694@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 1),
(76, 'system', '1395294696@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 1),
(77, 'system', '1395294697@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 0),
(78, 'system', '1395294699@qq.com', '2017-04-02 00:00:00', '<h2 class="title"><a href="/thesis/src/PHP/show/activeDetail.php?code=29"> 富文本</a></h2><p class="content">又有一个新的活动发布了,快去看看吧！</p><p class="info">活动有效时间：2017-4-5至2017-5-6</p>', 1),
(84, '1395294694@qq.com', '1395294664@qq.com', '2017-05-04', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>取消了对你的关注！ </h2><p class="content">设计师1395294694@qq.com取消了对你的关注！</p>', 0),
(81, 'system', '1395294694@qq.com', '2017-04-03', '<h2 class="title"><a href="/thesis/src/PHP/show/zpDetail.php?role=me&&code=51">作品intro</a> </h2><p class="content">你的作品作品intro 通过了管理员的审核</p>', 1),
(82, '1395294696@qq.com', '1375294694@qq.com', '2017-04-06', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294696@qq.com">设计师1395294696@qq.com</a>关注了你！ </h2><p class="content">设计师1395294696@qq.com关注了你！</p>', 0),
(83, '1395294694@qq.com', '1395294645@qq.com', '2017-05-04', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>取消了对你的关注！ </h2><p class="content">设计师1395294694@qq.com取消了对你的关注！</p>', 0),
(85, '1395294694@qq.com', '1395294688@qq.com', '2017-05-04', '<h2 class="title"><a href="/thesis/src/PHP/show/designerHome.php?email=1395294694@qq.com">设计师1395294694@qq.com</a>取消了对你的关注！ </h2><p class="content">设计师1395294694@qq.com取消了对你的关注！</p>', 0);

-- --------------------------------------------------------

--
-- 表的结构 `productionmessage`
--

CREATE TABLE IF NOT EXISTS `productionmessage` (
  `email` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '设计师账号',
  `zpCode` int(20) NOT NULL AUTO_INCREMENT COMMENT '作品编号,自动生成',
  `title` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '作品标题',
  `img` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '图片',
  `intro` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `status` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态',
  `activeCode` int(20) NOT NULL COMMENT '活动编号',
  `time` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '上传时间',
  `likeNum` int(20) NOT NULL COMMENT ' 点赞数量',
  `discussNum` int(20) NOT NULL COMMENT '评价数量',
  PRIMARY KEY (`zpCode`),
  UNIQUE KEY `zpCode` (`zpCode`),
  UNIQUE KEY `zpCode_2` (`zpCode`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='作品信息表' AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `productionmessage`
--

INSERT INTO `productionmessage` (`email`, `zpCode`, `title`, `img`, `intro`, `status`, `activeCode`, `time`, `likeNum`, `discussNum`) VALUES
('1395294694@qq.com', 33, '3333333333', 'uploads/9001c701127accdb07ce93600b2be6f8.jpg', '3333333333333', '2', 24, '2017-03-30', 0, 0),
('1395294694@qq.com', 16, '3 不通过', 'uploads/3f5820b1916acef360418156a1f5b9c8.png', '2333', '1', 0, '2017-03-22', 0, 0),
('1395294694@qq.com', 37, '顶顶顶顶顶顶顶顶顶顶大大大', 'uploads/b039514004aea7e7b1b1bb4f94956398.jpg', '反反复复', '2', 14, '2017-03-30', 0, 0),
('1395294694@qq.com', 35, '舒适版', 'uploads/c1bb05c7f2447581536426518f12f7ce.png', '顶顶顶顶', '2', 17, '2017-03-30', 0, 0),
('1395294694@qq.com', 36, '3', 'uploads/91dccbabf27115c0e2b2a8a3d074a35b.jpg', '灌灌灌灌灌过过过过过过过', '2', 14, '2017-03-30', 0, 0),
('1395294694@qq.com', 30, '31', 'uploads/07be7aad6e8a4f6f2fd3fb92c4f9c4cc.jpg', 'ddd', '2', 0, '2017-03-26', 0, 0),
('1395294694@qq.com', 31, '32', 'uploads/bf8aa39973941a2c5b89399341717525.jpg', '对对对', '2', 0, '2017-03-27', 0, 0),
('1395294694@qq.com', 34, '百川', 'uploads/4957b34a11f3264aecc122765a14276f.jpg', '拜拜拜', '2', 14, '2017-03-30', 0, 0),
('1395294694@qq.com', 23, '"梳"情画意', 'uploads/5f3561adf7b53d8140056cf1fb89a94e.jpg', '梳子采用深浅木材拼出图案，梳子是画，画也是梳子。算是合木梳的延伸设计，利用合木的结构做出图案变化，既保证了结构强度又美观。主题从父亲、母亲、情侣（夫妻）三个角度出发进行设计。简单的水墨风景饱含了爱意。', '2', 17, '2017-03-23', 0, 4),
('1395294694@qq.com', 24, '生命地图上的经与纬,在彼此最好的时候相遇', 'uploads/9df64cdef05b64c8bf11c5279232f19e.jpg', '生命地图上的经与纬,在彼此最好的时候相遇---谭木匠编织效果随身镜\r\n\r\n以可批量生产的木质部件作组合,用仿编织的效果给使用者一种对木料在视觉与触感上的新体验.', '2', 17, '2017-03-23', 0, 1),
('1395294694@qq.com', 38, '34', 'uploads/0f8a38fa2a0b86b78a72daf3bc9c0d6d.jpg', '33333333333333', '2', 24, '2017-03-30', 0, 0),
('1395294694@qq.com', 39, '35方法方法付付付付付付付付', 'uploads/d4ff5453e433345a3ba1594190e2ac95.jpg', '对对对对对对多多多多多', '2', 14, '2017-03-30', 0, 0),
('1395294694@qq.com', 40, '对对对', 'uploads/cdecd209f57bdcfc93206ed92a059b7d.jpg', '对对对对对对多', '2', 14, '2017-03-30', 0, 0),
('1375294694@qq.com', 42, '3www', 'uploads/c722978a26f5f99de70f99e14dc6223b.png', 'ddd', '1', 0, '2017-03-31', 0, 0),
('1395294696@qq.com', 44, '好好好', 'uploads/53172876539619d3d34f8ab3758366f9.jpg', '对对对', '2', 0, '2017-03-31', 0, 0),
('1395294664@qq.com', 45, '得到', 'uploads/9089cd2a0b8ed60f6442882e2347d5d9.jpg', '发发发', '2', 0, '2017-03-31', 0, 0),
('1395294645@qq.com', 46, '3得到', 'uploads/aa5e3c300adcc486ef999c86ed37effc.jpg', '拜拜拜', '2', 0, '2017-03-31', 0, 0),
('1395294688@qq.com', 47, '电放费', 'uploads/28df328624d9d6698500ca11d9686d0d.jpg', '得到', '2', 0, '2017-03-31', 0, 0),
('1395294697@qq.com', 48, '对3对对', 'uploads/2abbf7432f161184aa9fd48f12ac54bf.jpg', 'vvv', '2', 0, '2017-03-31', 0, 0),
('1395294699@qq.com', 49, '对对对', 'uploads/7377eebd0dd421060dc53177bb41d492.jpg', '对对对', '2', 0, '2017-03-31', 0, 0),
('1395294694@qq.com', 52, '更好的', 'uploads/d4a0ed024c1e2b6f88b765e22ac8b074.jpg', '<p>更好的你我他<br></p>', '0', 0, '2017-05-06', 0, 0),
('1395294694@qq.com', 50, '富文本', 'uploads/34fe7b96758b8425a65700f6a7e5c87d.png', '<p><br></p>', '1', 0, '2017-04-02', 0, 0),
('1395294694@qq.com', 51, '作品intro', 'uploads/a19d63460df0b2cea78713aece94909d.jpg', '<p>你好吗？</p>', '2', 0, '2017-04-03', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号，自增长',
  `question` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '问题',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='作品信息表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `questions`
--

INSERT INTO `questions` (`id`, `question`) VALUES
(1, '小学班主任的名字'),
(2, '小学学号'),
(3, '高中班主任的名字');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号，自增长',
  `code` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '代号',
  `info` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `code`, `info`) VALUES
(1, '0', '设计师'),
(2, '1', '普通管理员'),
(3, '3', '超级管理员'),
(4, '2', '高级管理员');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
