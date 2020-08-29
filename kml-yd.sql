-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-08-02 17:59:44
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kmlyd`
--
DROP DATABASE  IF EXISTS `kmlyd`;

CREATE DATABASE IF  NOT EXISTS  `kmlyd` DEFAULT  CHARACTER SET 'utf8';

USE `kmlyd`;
-- --------------------------------------------------------

--
-- 表的结构 `kml_cake_detail`
--
DROP TABLE IF EXISTS `kml_cake_detail`;
CREATE TABLE `kml_cake_detail` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `subtitle` varchar(128) DEFAULT NULL,
  `remind` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `pic` varchar(488) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_cake_detail`
--

INSERT INTO `kml_cake_detail` (`cid`, `family_id`, `title`, `subtitle`, `remind`, `price`, `spec`,`pic`) VALUES
(1, 1, 'Vanilla Gelato 香草冰淇淋蛋糕', '香草杰拉朵，用100%牛乳，自然搅拌，均匀降温，全程手工制作。杰拉朵之上覆盖的乳脂奶油，经过处理之后冷冻，是普通蛋糕不可品尝之口感体验。', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '198.00', '1磅:直径约13cm','http://localhost:3000/img/detail/title/de01.jpg|http://localhost:3000/img/detail/detail/car.jpg|http://localhost:3000/img/detail/detail/detail01.jpg|http://localhost:3000/img/detail/detail/tableware.jpg|http://localhost:3000/img/detail/detail/detail011.jpg|http://localhost:3000/img/detail/detail/detail012.jpg|http://localhost:3000/img/detail/detail/detail013.jpg|http://localhost:3000/img/detail/detail/spec01.jpg'),
(2, 1, 'Strawberry Gelato 草莓冰淇淋蛋糕', '保持一丝不苟的Gelato品质，融合了最受欢迎的草莓元素。装饰几颗草莓与蓝莓鲜果，和少许玫瑰碎瓣，冰冷的口感却不失浪漫情怀。', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '198.00', '1.5磅：直径约13cm','http://localhost:3000/img/detail/title/de02.jpg|http://localhost:3000/img/detail/detail/car.jpg|http://localhost:3000/img/detail/detail/detail02.jpg|http://localhost:3000/img/detail/detail/tableware.jpg|http://localhost:3000/img/detail/detail/detail021.jpg|http://localhost:3000/img/detail/detail/detail022.jpg|http://localhost:3000/img/detail/detail/detail023.jpg|http://localhost:3000/img/detail/detail/spec02.jpg'),
(3, 1, 'Durian Gelato 榴莲冰淇淋蛋糕', '自然成熟的泰国金枕头榴莲，果肉品质上乘。与新鲜牛乳混合搅拌，冷却至-15℃，依然保持榴莲的原始浓郁味道。', '冰淇淋类蛋糕，收到后须立即冷冻保存。由于部分社区限制入内，此类区域/小区我们将采用无接触配送，感谢您的理解。', '198.00', '1磅：13×13cm','http://localhost:3000/img/detail/title/de03.jpg|http://localhost:3000/img/detail/detail/car.jpg|http://localhost:3000/img/detail/detail/detail03.jpg|http://localhost:3000/img/detail/detail/tableware.jpg|http://localhost:3000/img/detail/detail/detail031.jpg|http://localhost:3000/img/detail/detail/detail032.jpg|http://localhost:3000/img/detail/detail/detail033.jpg|http://localhost:3000/img/detail/detail/spec03.jpg');




-- --------------------------------------------------------

--
-- 表的结构 `kml_city`
--
DROP TABLE IF EXISTS `kml_city`;
CREATE TABLE `kml_city` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_city`
--

INSERT INTO `kml_city` (`cid`, `cname`) VALUES
(1, '重庆'),
(2, '成都');

-- --------------------------------------------------------

--
-- 表的结构 `kml_cake_family`
--
DROP TABLE IF EXISTS `kml_cake_family`;
CREATE TABLE `kml_cake_family` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(32) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_cake_family`
--

INSERT INTO `kml_cake_family` (`fid`, `fname`, `href`) VALUES
(1, '冰淇淋蛋糕', '/goods/1'),
(2, '卡通系列', '/goods/2'),
(3, '礼盒系列', '/goods/3'),
(4, '慕斯蛋糕', '/goods/4'),
(5, '乳脂奶油蛋糕', '/goods/5'),
(6, '芝士蛋糕', '/goods/6'),
(7, '巧克力蛋糕', '/goods/7');

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- 表的结构 `kml_goods_product`
--
DROP TABLE IF EXISTS `kml_goods_product`;
CREATE TABLE `kml_goods_product` (
  `pid` int(16) NOT NULL AUTO_INCREMENT,
  `family_id` int(16) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `subtitle` varchar(128) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_goods_product`
--

INSERT INTO `kml_goods_product` (`pid`, `family_id`, `title`,`subtitle`, `spec`, `price`, `pic`) VALUES
(1, 1, '香草冰淇淋蛋糕','Vanilla Gelato', '1磅：直径约13cm', '198.00', 'http://localhost:3000/img/goods/cake01.jpg'),
(2, 1, '草莓冰淇淋蛋糕','Strawberry Gelato', '1磅：直径约13cm', '198.00', 'http://localhost:3000/img/goods/cake02.jpg'),
(3, 1, '榴莲冰淇淋蛋糕','Durian Gelato', '1磅：直径约13cm', '198.00','http://localhost:3000/img/goods/cake03.jpg'),
(4, 1, '抹茶冰淇淋蛋糕','Matcha Gelato', '1磅：直径约13cm', '198.00','http://localhost:3000/img/goods/cake04.jpg'),
(5, 1, '鲜芒冰淇淋蛋糕','Mango Gelato', '1磅：直径约13cm', '198.00','http://localhost:3000/img/goods/cake05.jpg'),
(6, 2, '小象','Elephant','1磅：直径约13cm', '218.00','http://localhost:3000/img/goods/cake17.jpg'),
(7, 2, '小狗','Dog','1磅：直径约13cm', '198.00','http://localhost:3000/img/goods/cake18.jpg'),
(8, 3, '玫瑰蛋糕礼盒-','-Dream','1磅：直径约13cm', '198.00','http://localhost:3000/img/goods/cake06.jpg'),
(9, 3, '玫瑰蛋糕礼盒-爱尔兰玫瑰','Irish Rose','1磅：13x13cm', '218.00', 'http://localhost:3000/img/goods/cake07.jpg'),
(10, 3, ' 玫瑰蛋糕礼盒-日式草莓淡奶','- Strawberry Pistachio','1磅：直径约13cm', '268.00', 'http://localhost:3000/img/goods/cake12.jpg'),
(11, 3, ' 粉玫瑰蛋糕礼盒 ','Fall In Love','1磅：13x13cm', '369.00', 'http://localhost:3000/img/goods/cake11.jpg'),
(12, 4, '莫吉托(夏日限定)','Mojito (Only For Summer)', '1磅：约13x13cm', '198.00','http://localhost:3000/img/goods/cake16.jpg'),
(13, 4, '三生三世','love', '1.5磅：直径约17cm', '268.00','http://localhost:3000/img/goods/cake19.jpg'),
(14, 4, '慕心','Mousse Heart ', '1磅：约14×15cm', '238.00','http://localhost:3000/img/goods/cake22.jpg'),
(15, 5, '巧克力阿华田','Chocolate Ovaltine', '1磅：直径约13cm', '198.00','http://localhost:3000/img/goods/cake15.jpg'),
(16, 6, '北海道牛乳','Hokkaido Milk', '1磅：13x13cm', '198.00','http://localhost:3000/img/goods/cake20.jpg'),
(17, 6, '蓝莓芝士','Blueberry Cheese ', '1磅：13x13cm', '198.00','http://localhost:3000/img/goods/cake23.jpg'),
(18, 7, '榛子巧克力','ChocoNuts', '1磅：13x13cm', '198.00','http://localhost:3000/img/goods/cake21.jpg'),
(19, 7, '黑森林','Black Forest', '1磅：13x13cm', '198.00','http://localhost:3000/img/goods/cake24.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `kml_index_carousel`
--
DROP TABLE IF EXISTS `kml_index_carousel`;
CREATE TABLE `kml_index_carousel` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  `href` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_index_carousel`
--

INSERT INTO `kml_index_carousel` (`cid`, `img`, `href`) VALUES
(1, 'http://localhost:3000/img/index/banner1.jpg', '/detail/1'),
(2, 'http://localhost:3000/img/index/banner2.jpg', '/detail/1'),
(3, 'http://localhost:3000/img/index/banner3.jpg', '/detail/1'),
(4, 'http://localhost:3000/img/index/banner4.jpg', '/detail/1'),
(5, 'http://localhost:3000/img/index/banner5.jpg', '/detail/1'),
(6, 'http://localhost:3000/img/index/banner6.jpg', '/detail/1'),
(7, 'http://localhost:3000/img/index/banner7.jpg', '/detail/1');

-- --------------------------------------------------------

--
-- 表的结构 `kml_index_pic`
--
DROP TABLE IF EXISTS `kml_index_pic`;
CREATE TABLE `kml_index_pic` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_index_pic`
--

INSERT INTO `kml_index_pic` (`tid`, `img`) VALUES
(1, 'http://localhost:3000/img/index/car01.jpg'),
(2, 'http://localhost:3000/img/index/car02.jpg'),
(3, 'http://localhost:3000/img/index/car03.jpg'),
(4, 'http://localhost:3000/img/index/car04.jpg'),
(5, 'http://localhost:3000/img/index/car05.jpg'),
(6, 'http://localhost:3000/img/index/car06.jpg'),
(7, 'http://localhost:3000/img/index/car07.jpg'),
(8, 'http://localhost:3000/img/index/car08.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `kml_order`
--
DROP TABLE IF EXISTS `kml_order`;
CREATE TABLE `kml_order` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_time` bigint(20) DEFAULT NULL,
  `pay_time` bigint(20) DEFAULT NULL,
  `deliver_time` bigint(20) DEFAULT NULL,
  `received_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_order_detail`
--
DROP TABLE IF EXISTS `kml_order_detail`;
CREATE TABLE `kml_order_detail` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_receiver_address`
--
DROP TABLE IF EXISTS `kml_receiver_address`;
CREATE TABLE `kml_receiver_address` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver` varchar(16) DEFAULT NULL,
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `county` varchar(16) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `cellphone` varchar(16) DEFAULT NULL,
  `fixedphone` varchar(16) DEFAULT NULL,
  `postcode` char(6) DEFAULT NULL,
  `tag` varchar(16) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_shoppingcart_item`
--
DROP TABLE IF EXISTS `kml_shoppingcart_item`;
CREATE TABLE `kml_shoppingcart_item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `is_checked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `kml_shoppingcart_pic`
--
DROP TABLE IF EXISTS `kml_shoppingcart_pic`;
CREATE TABLE `kml_shoppingcart_pic` (
  `hid` int(10) NOT NULL AUTO_INCREMENT,
  `cake_id` int(11) DEFAULT NULL,
  `img` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_shoppingcart_pic`
--

INSERT INTO `kml_shoppingcart_pic` (`hid`,`cake_id`,`img`) VALUES
(1,1,'http://localhost:3000/img/details/sm/01-sm-01.jpg'),
(2,2,'http://localhost:3000/img/details/sm/01-sm-01.jpg'),
(3,3,'http://localhost:3000/img/details/sm/02-sm-01.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `kml_user`
--
DROP TABLE IF EXISTS `kml_user`;
CREATE TABLE `kml_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kml_user`
--

INSERT INTO `kml_user` (`uid`,`nickname`, `uname`, `upwd`, `email`, `phone`, `gender`, `birthday`) VALUES
(1, 'admin', 'admin123','小a', 'admin@qq.com', '13501234567', 0, '1993-6-21'),
(2, 'test', '123456','小t', 'test@qq.com', '13501234568', 1, '1998-6-1');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
