/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jjshop

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-11-30 16:05:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `n_id` int(11) DEFAULT NULL,
  `selected` varchar(255) DEFAULT NULL,
  `nums` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '果味');
INSERT INTO `category` VALUES ('2', '蔬菜');
INSERT INTO `category` VALUES ('3', '炒货');
INSERT INTO `category` VALUES ('4', '点心');
INSERT INTO `category` VALUES ('5', '粗茶');
INSERT INTO `category` VALUES ('6', '淡饭');

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES ('1', '果味', null, '梨花带雨', '1');
INSERT INTO `detail` VALUES ('2', '果味', null, '梨花带雨', '1');
INSERT INTO `detail` VALUES ('3', '果味', null, '梨花带雨', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `hot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `hot_id` (`hot_id`),
  CONSTRAINT `hot_id` FOREIGN KEY (`hot_id`) REFERENCES `hot` (`hot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '灰色家访套件', '/images/product/01-1.jpg', '1');
INSERT INTO `goods` VALUES ('2', '黄色家访套件', '/images/product/01-2.jpg', '1');
INSERT INTO `goods` VALUES ('3', '红色家访套件', '/images/product/01-3.jpg', '1');
INSERT INTO `goods` VALUES ('4', '蓝色家访套件', '/images/product/01-4.jpg', '1');
INSERT INTO `goods` VALUES ('5', '纯色家访被芯', '/images/product/02-1.jpg', '2');
INSERT INTO `goods` VALUES ('6', '纯色家访被芯', '/images/product/02-2.jpg', '2');
INSERT INTO `goods` VALUES ('7', '纯色家访被芯', '/images/product/02-3.jpg', '2');
INSERT INTO `goods` VALUES ('8', '纯色家访被芯', '/images/product/02-4.jpg', '2');
INSERT INTO `goods` VALUES ('9', '纯色家访枕头', '/images/product/03-1.jpg', '3');
INSERT INTO `goods` VALUES ('10', '纯色家访枕头', '/images/product/03-2.jpg', '3');
INSERT INTO `goods` VALUES ('11', '纯色家访枕头', '/images/product/03-3.jpg', '3');
INSERT INTO `goods` VALUES ('12', '纯色家访枕头', '/images/product/03-4.jpg', '3');
INSERT INTO `goods` VALUES ('13', '纯色家访床单', '/images/product/04-1.jpg', '4');
INSERT INTO `goods` VALUES ('14', '纯色家访床单', '/images/product/04-2.jpg', '4');
INSERT INTO `goods` VALUES ('15', '纯色家访床单', '/images/product/04-3.jpg', '4');
INSERT INTO `goods` VALUES ('16', '纯色家访床单', '/images/product/04-4.jpg', '4');

-- ----------------------------
-- Table structure for hot
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `hot_id` int(11) NOT NULL AUTO_INCREMENT,
  `hot_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hot
-- ----------------------------
INSERT INTO `hot` VALUES ('1', '热卖');
INSERT INTO `hot` VALUES ('2', '被芯');
INSERT INTO `hot` VALUES ('3', '枕头');
INSERT INTO `hot` VALUES ('4', '床单');

-- ----------------------------
-- Table structure for new
-- ----------------------------
DROP TABLE IF EXISTS `new`;
CREATE TABLE `new` (
  `new_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`new_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of new
-- ----------------------------
INSERT INTO `new` VALUES ('1', '新品1', '/images/new/01.jpg', '全棉加厚斜纹磨毛纯棉四件套被套 多花色', '全棉磨毛 温暖舒适 多花色可选');
INSERT INTO `new` VALUES ('2', '新品2', '/images/new/02.jpg', '纯棉斜纹磨毛四件套  纯棉磨绒床单被套批发', '床上用品 全棉磨毛 温暖舒适');
INSERT INTO `new` VALUES ('3', '新品3', '/images/new/03.jpg', '特价清仓处理全棉加厚斜纹磨毛四件套 ', '秋冬纯棉保暖 床上用品直销');

-- ----------------------------
-- Table structure for new2
-- ----------------------------
DROP TABLE IF EXISTS `new2`;
CREATE TABLE `new2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` double(65,1) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `stock` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `aftersold` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of new2
-- ----------------------------
INSERT INTO `new2` VALUES ('1', 'http://localhost:3000/images/index/s4.png', '瓜子 100g', '0.1', '我是呱呱呱呱子的详情', '有货', '免费的', '不支持售后');
INSERT INTO `new2` VALUES ('2', 'http://localhost:3000/images/index/s5.png', '粟米 375g', '0.3', '我是粟米啦啦啦的详情', '没货', '不要钱', '买完离手');
INSERT INTO `new2` VALUES ('3', 'http://localhost:3000/images/index/s6.png', '芹菜 半斤', '0.2', '我是芹菜哈哈哈的详情', '可能有货', '大甩卖，一块钱一斤', '支持售后');
INSERT INTO `new2` VALUES ('4', 'http://localhost:3000/images/index/s4.png', '瓜子 100g', '0.5', '我是呱呱呱呱子的详情', '可能没货', '不要钱', '不支持售后');
INSERT INTO `new2` VALUES ('5', 'http://localhost:3000/images/index/s5.png', '粟米 375g', '0.2', '我是粟米啦啦啦的详情', '有货', '不要钱', '不支持售后');
INSERT INTO `new2` VALUES ('6', 'http://localhost:3000/images/index/s6.png', '芹菜 半斤', '0.5', '我是芹菜哈哈哈的详情', '库存老多了', '不要钱', '不支持售后');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `uickname` varchar(255) DEFAULT NULL,
  `avatarUrl` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'o9Alr5HWQ5AyLbU9fQCyt3kk_HnA', 'gzc', '123', null, null);
