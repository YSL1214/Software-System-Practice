/*
Navicat MySQL Data Transfer

Source Server         : lxh
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : db_garbage_collection

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-06-15 00:29:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `userid` int(8) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', '李白', '15964586425', '北京市五环1号');
INSERT INTO `address` VALUES ('2', '1', '李白', '15964586425', '北京市五环88号');
INSERT INTO `address` VALUES ('5', '4', '小白', '14862156348', '广州省佛山市顺德区101号');
INSERT INTO `address` VALUES ('4', '2', '张三', '1885964588825', '北京市五环888号');
INSERT INTO `address` VALUES ('7', '6', '笑笑', '1234567890', '北京市五环88号');
INSERT INTO `address` VALUES ('11', '8', '王娃娃', '15621648458', '北京市五环8888号');
INSERT INTO `address` VALUES ('9', '4', '韦小宝', '15621648649', '北京市五环8878号');
INSERT INTO `address` VALUES ('12', '8', '王大', '1234567890', '北京市五环6号');
INSERT INTO `address` VALUES ('15', '9', '小罗', '1234567890', '北京市五环8588号');
INSERT INTO `address` VALUES ('14', '9', '小罗', '123045678203', '北京市五环888号');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');
INSERT INTO `admin` VALUES ('2', 'root', '123456');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `userId` int(8) DEFAULT NULL,
  `allPrice` double DEFAULT NULL COMMENT '商品总价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='购物车表';

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '1', '500.22');
INSERT INTO `cart` VALUES ('2', '2', '888.22');
INSERT INTO `cart` VALUES ('3', '1', '888.22');
INSERT INTO `cart` VALUES ('5', '4', '580');
INSERT INTO `cart` VALUES ('6', '8', '0');
INSERT INTO `cart` VALUES ('7', '9', '0');

-- ----------------------------
-- Table structure for childorder
-- ----------------------------
DROP TABLE IF EXISTS `childorder`;
CREATE TABLE `childorder` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '子订单id',
  `orderId` int(8) DEFAULT NULL COMMENT '订单id(包含购物车和环保商城订单)',
  `childOrderType` int(8) DEFAULT NULL COMMENT '子订单类型（1购物车 2环保商城订单）',
  `goodsId` int(8) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='子订单表（关联Order表和cart表）';

-- ----------------------------
-- Records of childorder
-- ----------------------------
INSERT INTO `childorder` VALUES ('56', '18368481', '2', '15');
INSERT INTO `childorder` VALUES ('68', '46730505', '2', '11');
INSERT INTO `childorder` VALUES ('64', '40496261', '2', '15');
INSERT INTO `childorder` VALUES ('63', '40496261', '2', '11');
INSERT INTO `childorder` VALUES ('57', '18368481', '2', '14');
INSERT INTO `childorder` VALUES ('66', '39714300', '2', '11');
INSERT INTO `childorder` VALUES ('74', '5', '1', '9');
INSERT INTO `childorder` VALUES ('72', '89287915', '2', '11');
INSERT INTO `childorder` VALUES ('73', '5', '1', '10');
INSERT INTO `childorder` VALUES ('51', '75771821', '2', '15');
INSERT INTO `childorder` VALUES ('47', '47042875', '2', '11');
INSERT INTO `childorder` VALUES ('46', '47042875', '2', '10');
INSERT INTO `childorder` VALUES ('62', '40496261', '2', '13');
INSERT INTO `childorder` VALUES ('53', '60028054', '2', '13');
INSERT INTO `childorder` VALUES ('69', '46730505', '2', '11');
INSERT INTO `childorder` VALUES ('70', '46730505', '2', '11');
INSERT INTO `childorder` VALUES ('75', '5', '1', '15');
INSERT INTO `childorder` VALUES ('100', '31783095', '2', '11');
INSERT INTO `childorder` VALUES ('83', '14870016', '2', '15');
INSERT INTO `childorder` VALUES ('89', '60288265', '2', '13');
INSERT INTO `childorder` VALUES ('95', '97354679', '2', '15');
INSERT INTO `childorder` VALUES ('96', '97354679', '2', '9');
INSERT INTO `childorder` VALUES ('97', '97354679', '2', '11');
INSERT INTO `childorder` VALUES ('101', '31783095', '2', '11');

-- ----------------------------
-- Table structure for garbageinfo
-- ----------------------------
DROP TABLE IF EXISTS `garbageinfo`;
CREATE TABLE `garbageinfo` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of garbageinfo
-- ----------------------------
INSERT INTO `garbageinfo` VALUES ('大骨头', '干垃圾', '该类垃圾成分较为复杂，如有尖锐物品应包装好后再做投放，并保持好周边环境整洁。');
INSERT INTO `garbageinfo` VALUES ('电池', '有害垃圾', '有害垃圾需要进行固定的打包，防止其中的化学成分污染到环境，然后携带放置到有害垃圾投放点。');
INSERT INTO `garbageinfo` VALUES ('香蕉', '湿垃圾', '正常情况下，需要将湿垃圾沥干水分，然后再次携带到指定点投放。');
INSERT INTO `garbageinfo` VALUES ('易拉罐', '可回收垃圾', '1. 轻投轻放 2. 清洁干燥、避免污染，废纸尽量平整 3. 立体包装请清空内容物，清洁后压扁投放 4. 有尖锐边角的，应包裹后投放');

-- ----------------------------
-- Table structure for garbageorder
-- ----------------------------
DROP TABLE IF EXISTS `garbageorder`;
CREATE TABLE `garbageorder` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `userId` int(8) DEFAULT NULL COMMENT '用户id',
  `addressId` int(8) DEFAULT NULL COMMENT '地址id',
  `garbageName` varchar(50) DEFAULT NULL COMMENT '垃圾名称',
  `garbageTypeId` int(8) DEFAULT NULL COMMENT '垃圾类型id',
  `weight` double DEFAULT NULL COMMENT '重量',
  `money` double DEFAULT NULL COMMENT '价值积分（用户端看不到，管理员确认）',
  `appointmentTime` datetime DEFAULT NULL COMMENT '预约上门时间',
  `startTime` datetime DEFAULT NULL COMMENT '下单时间',
  `endTime` datetime DEFAULT NULL COMMENT '取货时间',
  `status` int(8) DEFAULT NULL COMMENT '订单状态（1待取货 2已完成）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='垃圾回收订单表\r\n';

-- ----------------------------
-- Records of garbageorder
-- ----------------------------
INSERT INTO `garbageorder` VALUES ('1', '8', '12', '电池', '1', '20', '500', '2019-12-15 14:12:00', '2019-12-13 14:16:51', '2019-12-13 15:57:30', '2');
INSERT INTO `garbageorder` VALUES ('9', '9', '15', '煤气罐', '2', '40', '5555', '2019-12-14 19:12:00', '2019-12-13 20:02:56', '2019-12-13 20:03:17', '2');

-- ----------------------------
-- Table structure for garbagetype
-- ----------------------------
DROP TABLE IF EXISTS `garbagetype`;
CREATE TABLE `garbagetype` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '垃圾类型id',
  `garbageTypeName` varchar(50) DEFAULT NULL COMMENT '垃圾类型名称',
  `garbageTip` varchar(255) DEFAULT NULL COMMENT '投放建议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='垃圾类型表';

-- ----------------------------
-- Records of garbagetype
-- ----------------------------
INSERT INTO `garbagetype` VALUES ('1', '可回收垃圾', '1. 轻投轻放 2. 清洁干燥、避免污染，废纸尽量平整 3. 立体包装请清空内容物，清洁后压扁投放 4. 有尖锐边角的，应包裹后投放');
INSERT INTO `garbagetype` VALUES ('2', '干垃圾', '该类垃圾成分较为复杂，如有尖锐物品应包装好后再做投放，并保持好周边环境整洁。');
INSERT INTO `garbagetype` VALUES ('4', '湿垃圾', '正常情况下，需要将湿垃圾沥干水分，然后再次携带到指定点投放。');
INSERT INTO `garbagetype` VALUES ('8', '有害垃圾', '有害垃圾需要进行固定的打包，防止其中的化学成分污染到环境，然后携带放置到有害垃圾投放点。');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goodsName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goodsType` int(8) DEFAULT NULL COMMENT '商品类型（1垃圾桶 2垃圾袋）',
  `goodsDesc` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `imageUrl` varchar(200) DEFAULT NULL COMMENT '商品图片url',
  `price` double DEFAULT NULL COMMENT '商品单价',
  `number` int(8) DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('11', '黄牌垃圾桶', '1', '一个非常厉害的黄牌垃圾桶', 'upload/476af1c879b4413a93efb5f9d59a3e63.jpg', '450', '498');
INSERT INTO `goods` VALUES ('10', '红色垃圾桶', '1', '一个非常厉害的红色的垃圾桶', 'upload/d2141e8083a54c29ba9d58a3e71f174a.jpg', '200', '886');
INSERT INTO `goods` VALUES ('9', '文艺垃圾桶', '1', '一个非常厉害的文艺垃圾桶', 'upload/30316b42f47a4b0f8e937c1266fac84a.jpg', '300', '500');
INSERT INTO `goods` VALUES ('13', '红色垃圾袋', '2', '一个非常厉害的红色垃圾袋', 'upload/8355d778a34d402a91979270ae0b7e57.jpg', '20', '499');
INSERT INTO `goods` VALUES ('14', '黑色垃圾袋', '2', '一个非常厉害的黑色垃圾袋', 'upload/412a3b84e5a54aa4bb9bf97890cc24e3.jpg', '50', '500');
INSERT INTO `goods` VALUES ('15', '彩色垃圾袋', '2', '一个非常厉害的彩色垃圾袋', 'upload/2725fad964dd45c29b4bab88d2c98c62.jpg', '80', '499');
INSERT INTO `goods` VALUES ('21', '双人份垃圾桶', '1', '双人份垃圾桶，适合公共场所', 'upload/02576cf5a0da4f53b829a20abfa91500.jpg', '999.9', '500');
INSERT INTO `goods` VALUES ('22', '原木色垃圾桶', '1', '原木色，适合电梯口摆放', 'upload/8e603fa1db914d3992d85ea71ec1d758.jpg', '888.8', '500');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `totalPrice` double(16,0) DEFAULT NULL COMMENT '商品总价',
  `userId` int(8) DEFAULT NULL COMMENT '用户id',
  `addressId` int(8) DEFAULT NULL COMMENT '地址id',
  `startTime` datetime DEFAULT NULL COMMENT '下单时间',
  `endTime` datetime DEFAULT NULL COMMENT '到货时间',
  `isStatus` int(8) DEFAULT NULL COMMENT '订单状态（1待付款 2待收货 3已完成）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=97354680 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='环保商城订单表';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('31783095', '900', '8', '11', '2019-12-13 20:53:27', null, '2');
INSERT INTO `order` VALUES ('97354679', '830', '9', null, '2019-12-13 20:04:37', null, '1');
INSERT INTO `order` VALUES ('60288265', '20', '9', '14', '2019-12-13 20:00:50', '2019-12-13 20:01:57', '3');
INSERT INTO `order` VALUES ('40496261', '550', '8', '11', '2019-12-12 23:07:36', '2019-12-13 13:25:45', '3');
INSERT INTO `order` VALUES ('18368481', '130', '8', '12', '2019-12-12 23:06:49', '2019-12-13 20:53:12', '3');
INSERT INTO `order` VALUES ('75771821', '80', '8', '12', '2019-12-12 22:54:31', '2019-12-12 23:07:06', '3');
INSERT INTO `order` VALUES ('60028054', '20', '8', '11', '2019-12-12 23:03:54', null, '2');
INSERT INTO `order` VALUES ('47042875', '650', '8', '11', '2019-12-12 22:27:31', '2019-12-12 23:03:14', '3');
INSERT INTO `order` VALUES ('39714300', '450', '8', '12', '2019-12-12 23:07:50', null, '2');
INSERT INTO `order` VALUES ('46730505', '1350', '4', '5', '2019-12-12 23:14:42', null, '2');
INSERT INTO `order` VALUES ('89287915', '450', '4', '5', '2019-12-12 23:17:08', '2019-12-12 23:17:31', '3');
INSERT INTO `order` VALUES ('14870016', '80', '8', '11', '2019-12-13 10:08:15', null, '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `money` double DEFAULT NULL COMMENT '可用积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lisi', '123456', '666.66');
INSERT INTO `user` VALUES ('4', 'user', '123456', '3432');
INSERT INTO `user` VALUES ('6', 'xiaoxiao', '123456', '100');
INSERT INTO `user` VALUES ('8', 'www', '123456', '4655');
INSERT INTO `user` VALUES ('9', 'lalala', '123456', '5635');
