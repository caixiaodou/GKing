-- phpMyAdmin SQL Dump
-- version 2.11.2.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 07 月 23 日 23:23
-- 服务器版本: 5.0.45
-- PHP 版本: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `caixiaodou`
--

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE `manager` (
  `managerId` int(255) NOT NULL,
  `managerPassword` varchar(30) NOT NULL,
  `managerName` varchar(30) NOT NULL,
  PRIMARY KEY  (`managerId`),
  KEY `index_ManagerName` (`managerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `manager`
--


-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `orderId` int(255) NOT NULL auto_increment,
  `orderNumber` int(30) NOT NULL,
  `userPhone` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `orderAmount` int(30) NOT NULL,
  `orderDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `orderTime` time NOT NULL default '18:00:00',
  `orderFlag` char(10) NOT NULL,
  `orderAddress` varchar(255) NOT NULL,
  PRIMARY KEY  (`orderId`),
  KEY `index_UserPhone` (`userPhone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 导出表中的数据 `orders`
--

INSERT INTO `orders` (`orderId`, `orderNumber`, `userPhone`, `userName`, `orderAmount`, `orderDate`, `orderTime`, `orderFlag`, `orderAddress`) VALUES
(1, 123, 22, 'maomao', 21, '2015-07-23 20:08:44', '16:30:00', '待付款', '广州大学城华南理工大学C10——247房'),
(2, 123, 22, 'maomao', 21, '2015-07-23 23:15:58', '16:30:00', '待付款', '广州大学城华南理工大学C10——247房'),
(3, 123, 22, 'maomao', 21, '2015-07-23 23:16:08', '16:30:00', '待付款', '广州大学城华南理工大学C10——247房'),
(4, 123, 22, 'maomao', 21, '2015-07-23 23:16:08', '16:30:00', '待付款', '广州大学城华南理工大学C10——247房'),
(5, 123, 22, 'maomao', 21, '2015-07-23 23:16:08', '16:30:00', '待付款', '广州大学城华南理工大学C10——247房'),
(6, 123, 22, 'maomao', 21, '2015-07-23 23:17:41', '16:30:00', '待付款', '广州大学城华南理工大学C10——247房');

-- --------------------------------------------------------

--
-- 表的结构 `productchange`
--

CREATE TABLE `productchange` (
  `productId` int(255) NOT NULL,
  `productQuantity` int(30) NOT NULL,
  `productFlag` char(6) default 'true',
  `productLove` int(255) NOT NULL,
  PRIMARY KEY  (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `productchange`
--

INSERT INTO `productchange` (`productId`, `productQuantity`, `productFlag`, `productLove`) VALUES
(31313131, 12, 'true', 1);

-- --------------------------------------------------------

--
-- 表的结构 `productimg`
--

CREATE TABLE `productimg` (
  `imgId` int(255) NOT NULL auto_increment,
  `productId` int(30) NOT NULL,
  `imgName` varchar(30) NOT NULL,
  `imgRoot` varchar(64) NOT NULL,
  `imgFlag` char(3) NOT NULL,
  PRIMARY KEY  (`imgId`),
  KEY `index_productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `productimg`
--


-- --------------------------------------------------------

--
-- 表的结构 `productkind`
--

CREATE TABLE `productkind` (
  `productId` int(255) NOT NULL,
  `productKind` char(5) NOT NULL,
  `productToday` char(5) NOT NULL,
  PRIMARY KEY  (`productId`),
  KEY `index_ProductKind` (`productKind`),
  KEY `index_ProductToday` (`productToday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `productkind`
--


-- --------------------------------------------------------

--
-- 表的结构 `products`
--

CREATE TABLE `products` (
  `productId` int(255) NOT NULL auto_increment,
  `productNumber` char(20) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `productCharacter` text NOT NULL,
  `productInfo` text NOT NULL,
  `productWeigth` char(10) NOT NULL,
  `productOrigin` char(10) NOT NULL,
  `productPrice` char(10) NOT NULL,
  `productTime` char(10) NOT NULL,
  PRIMARY KEY  (`productId`),
  UNIQUE KEY `index_productName` (`productName`),
  KEY `index_productNumber` (`productNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `products`
--

INSERT INTO `products` (`productId`, `productNumber`, `productName`, `productCharacter`, `productInfo`, `productWeigth`, `productOrigin`, `productPrice`, `productTime`) VALUES
(1, 'GZ68688', ' 椒丝腐肉空心菜', '萨法费萨芬撒放宣传周安静会发生', '发生分萨芬撒放撒发萨法奋斗飞洒发撒发生发生发生飞洒发发沙发就撒开发和萨芬还萨克飞洒', '250kg', '广州', '￥12', '12:30'),
(2, '132131', '311', '3131', '3131', '3131', '3131', '131', '13:44:20');

-- --------------------------------------------------------

--
-- 表的结构 `product_order`
--

CREATE TABLE `product_order` (
  `id` int(255) NOT NULL auto_increment,
  `productId` int(255) NOT NULL,
  `quantity` int(20) NOT NULL,
  `orderId` int(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `index_orderId` (`orderId`),
  KEY `index_productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `product_order`
--


-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `userId` int(255) NOT NULL auto_increment,
  `userTel` char(11) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `sex` enum('男','女','保密') NOT NULL default '保密',
  `email` varchar(30) NOT NULL default '@caixiaodou.com',
  `regTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`userId`),
  UNIQUE KEY `Index_UserTel` (`userTel`),
  KEY `index_UserName` (`userName`),
  KEY `index_regTime` (`regTime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `users`
--

INSERT INTO `users` (`userId`, `userTel`, `userPassword`, `userName`, `sex`, `email`, `regTime`) VALUES
(1, '1', '17ba0791499db908433b80f37c5fbc89b870084b', '1', '保密', '1', '2015-07-23 23:14:42');
