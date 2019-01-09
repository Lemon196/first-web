/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : gmdb

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-01-02 10:33:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `aTitle` varchar(10) NOT NULL,
  `aText` varchar(500) NOT NULL,
  `aDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `A_title` (`aTitle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('1', '圣诞节拆扣狂欢', '全场3拆包邮', '2015-12-24');
INSERT INTO `announcement` VALUES ('2', '双十二购物节', '全场5拆买一送十二', '2015-12-12');
INSERT INTO `announcement` VALUES ('3', '元旦礼品送不停', '欢度2016迎新春买新衣', '2016-01-01');

-- ----------------------------
-- Table structure for `bigclass`
-- ----------------------------
DROP TABLE IF EXISTS `bigclass`;
CREATE TABLE `bigclass` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '大分类ID',
  `bigName` varchar(10) NOT NULL COMMENT '大分类名称',
  `bigText` varchar(50) NOT NULL COMMENT '大分类描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `B_name` (`bigName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bigclass
-- ----------------------------
INSERT INTO `bigclass` VALUES ('1', '家用电器', '电视，冰箱，空调');
INSERT INTO `bigclass` VALUES ('2', '手机数码', '手机，数码相机，平板电脑');
INSERT INTO `bigclass` VALUES ('3', '日用百货', '厨卫用品，床上用品');
INSERT INTO `bigclass` VALUES ('4', '书籍', '小说熟记');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '系统id',
  `cusName` varchar(8) NOT NULL COMMENT '顾客真实姓名',
  `cusLoginName` varchar(20) NOT NULL COMMENT '顾客登陆名',
  `cusPassword` varchar(50) NOT NULL COMMENT '顾客密码',
  `cusEmail` varchar(20) NOT NULL COMMENT '顾客邮箱',
  `cusSex` char(1) NOT NULL COMMENT '顾客性别',
  `cusPhoto` varchar(20) NOT NULL COMMENT '顾客头像',
  `cusHobby` varchar(20) NOT NULL COMMENT '顾客爱好',
  `cusCode` varchar(18) NOT NULL COMMENT '顾客身份证号',
  `cusBirthday` date NOT NULL COMMENT '顾客生日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `C_loginName_id` (`cusLoginName`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('4', 'zake', '123', '4297F44B13955235245B2497399D7A93', 'sdf@qq.com', '女', '1.png', '玩游戏,', '430104199012259845', '2015-12-30');
INSERT INTO `customer` VALUES ('6', '易大师', 'yi321', '4297F44B13955235245B2497399D7A93', 'yi321@qq.com', '女', '1.png', '运动,', '430102199001019548', '2015-12-30');
INSERT INTO `customer` VALUES ('7', '肖肖', 'xiao321', '4297F44B13955235245B2497399D7A93', 'xiao321@qq.com', '女', '1.png', '运动,', '430102199001015423', '2015-12-09');
INSERT INTO `customer` VALUES ('8', '兔子', 'tutu321', '4297F44B13955235245B2497399D7A93', 'tutu321@qq.com', '女', '1.png', '运动,', '430104199012254521', '2015-12-22');
INSERT INTO `customer` VALUES ('9', '乐乐', 'lele321', '4297F44B13955235245B2497399D7A93', 'lele123@qq.com', '女', '3.png', '聊天,玩游戏,', '430104199508069659', '2015-12-16');
INSERT INTO `customer` VALUES ('10', '西西', 'xixi321', '4297F44B13955235245B2497399D7A93', 'xixi123@qq.com', '女', '1.png', '运动,玩游戏,', '430104199022259845', '2015-12-16');
INSERT INTO `customer` VALUES ('11', '大兵', 'bing321', '4297F44B13955235245B2497399D7A93', 'bing123@qq.com', '女', '4.png', '运动,', '430104199022259845', '2015-12-17');
INSERT INTO `customer` VALUES ('12', '初夏', 'xiaixa', '4297F44B13955235245B2497399D7A93', 'xiaixa@qq.com', '女', '1.png', '运动,聊天,', '430104198804154568', '2015-12-08');
INSERT INTO `customer` VALUES ('13', '吴雅倩', 'qianqian', '4297F44B13955235245B2497399D7A93', 'qian123@qq.com', '女', '3.png', '聊天,玩游戏,', '430104198804154577', '2015-12-03');
INSERT INTO `customer` VALUES ('14', '舒琪', 'qiqi123', '4297F44B13955235245B2497399D7A93', 'qiqi123@qq.com', '女', '1.png', '运动,聊天,', '430104198804154781', '2015-12-09');
INSERT INTO `customer` VALUES ('15', '潘朵拉', 'duoduo', '4297F44B13955235245B2497399D7A93', 'duoduo@qq.com', '女', '1.png', '聊天,玩游戏,', '430104198804454568', '2015-11-30');
INSERT INTO `customer` VALUES ('16', '不知火舞', 'huowu', '4297F44B13955235245B2497399D7A93', 'huowu@qq.com', '女', '1.png', '运动,', '430104298804154577', '2015-12-08');
INSERT INTO `customer` VALUES ('17', '八神', 'xiaoba', '4297F44B13955235245B2497399D7A93', 'xiao8@qq.com', '男', '1.png', '运动,', '430104199108069527', '2015-12-16');
INSERT INTO `customer` VALUES ('18', '草稚', 'xiaozhi', '4297F44B13955235245B2497399D7A93', 'xiaozhi@qq.com', '男', '1.png', '聊天,', '430104199528069527', '2015-12-16');
INSERT INTO `customer` VALUES ('19', '包子', 'baozi', '4297F44B13955235245B2497399D7A93', 'baozi@qq.com', '女', '2.png', '聊天,', '430104100508069527', '2015-12-23');
INSERT INTO `customer` VALUES ('20', '猴子', 'houzi', '4297F44B13955235245B2497399D7A93', 'hozi@qq.com', '男', '1.png', '聊天,', '430104199108069527', '2015-12-02');
INSERT INTO `customer` VALUES ('21', '樱木花道', 'xiaodao', '4297F44B13955235245B2497399D7A93', 'xiaodao@qq.com', '男', '1.png', '运动,', '430104199558069527', '2015-12-09');
INSERT INTO `customer` VALUES ('22', '冷冷', 'cold', '4297F44B13955235245B2497399D7A93', 'leng321@qq.com', '女', '6.png', '运动,聊天,玩游戏,', '430104199011214515', '1990-11-21');
INSERT INTO `customer` VALUES ('23', '小小', 'xiaoxiao', '4297F44B13955235245B2497399D7A93', 'xiaoxiao@qq.com', '男', '5.png', '运动,', '430104199011211253', '1989-12-25');
INSERT INTO `customer` VALUES ('24', '比卡丘', 'bika', '4297F44B13955235245B2497399D7A93', 'bika@qq.com', '男', '4.png', '运动,', '430104187845124458', '2015-12-22');
INSERT INTO `customer` VALUES ('25', '影魔', 'yingmo', '4297F44B13955235245B2497399D7A93', 'yingmo321@qq.com', '男', '1.png', '运动,聊天,', '430104187845124432', '2015-12-15');
INSERT INTO `customer` VALUES ('26', '冰女', 'xiaobingbing', '4297F44B13955235245B2497399D7A93', 'xiaobing321@qq.com', '女', '3.png', '运动,聊天,玩游戏,', '430104187812124432', '2015-12-23');
INSERT INTO `customer` VALUES ('27', '巨魔', 'jumo', '4297F44B13955235245B2497399D7A93', 'jumo@qq.com', '女', '1.png', '运动,', '465412459845126548', '2015-12-15');
INSERT INTO `customer` VALUES ('28', '张三', 'admins', '2AEFC34200A294A3CC7DB81B43A81873', '1233@qq.com', '男', '2.png', '运动,聊天,', '222222222222222222', '2015-12-31');
INSERT INTO `customer` VALUES ('30', '王继东', 'wangjidong', 'A4420CABA636670E1CF310AD1D69E0C3', '32323@qq.com', '女', '1.png', '运动,', '410256325545451254', '2016-04-12');

-- ----------------------------
-- Table structure for `discount`
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '折扣ID',
  `discRate` double DEFAULT '1' COMMENT '折扣率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discount
-- ----------------------------
INSERT INTO `discount` VALUES ('1', '1');
INSERT INTO `discount` VALUES ('2', '0.95');
INSERT INTO `discount` VALUES ('3', '0.9');
INSERT INTO `discount` VALUES ('4', '0.85');
INSERT INTO `discount` VALUES ('5', '0.8');
INSERT INTO `discount` VALUES ('6', '0.75');
INSERT INTO `discount` VALUES ('7', '0.7');
INSERT INTO `discount` VALUES ('8', '0.65');
INSERT INTO `discount` VALUES ('9', '0.6');
INSERT INTO `discount` VALUES ('10', '0.55');
INSERT INTO `discount` VALUES ('11', '0.5');
INSERT INTO `discount` VALUES ('12', '0.45');
INSERT INTO `discount` VALUES ('13', '0.4');
INSERT INTO `discount` VALUES ('14', '0.35');
INSERT INTO `discount` VALUES ('15', '0.3');
INSERT INTO `discount` VALUES ('16', '0.25');
INSERT INTO `discount` VALUES ('17', '0.2');
INSERT INTO `discount` VALUES ('18', '0.15');
INSERT INTO `discount` VALUES ('19', '0.1');
INSERT INTO `discount` VALUES ('20', '0.5');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goodsName` varchar(50) NOT NULL COMMENT '商品名称',
  `goodsSmalId` bigint(11) NOT NULL COMMENT '商品对应的小分类',
  `goodsMoney` double NOT NULL COMMENT '商品的价格',
  `goodsNumber` int(11) NOT NULL COMMENT '商品的数量',
  `goodsImage` varchar(50) NOT NULL COMMENT '商品的图像',
  `goodsCarriage` double NOT NULL COMMENT '商品的运费',
  `goodsType` int(1) NOT NULL COMMENT '商品的类型 新品或二手',
  `goodsDiscId` int(11) NOT NULL COMMENT '商品的折扣',
  PRIMARY KEY (`id`),
  KEY `G_Sm_id` (`goodsSmalId`),
  KEY `G_d_id` (`goodsDiscId`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('17', 'Diesel迪赛炫酷一代红色偏光个性真皮男表', '3', '1280', '99', 'promote_3.jpg', '20', '0', '4');
INSERT INTO `goods` VALUES ('18', 'Gopro山狗4户外骑行运动相机SJ6000', '9', '699', '99', 'promote_4.jpg', '20', '0', '3');
INSERT INTO `goods` VALUES ('19', 'iphone5S6S6P木质手机壳', '1', '23', '99', 'promote_5.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('20', 'iphone6闪星星液体手机壳', '1', '25', '12', 'promote_6.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('21', 'MOTO360 智能手表', '1', '1485', '123', 'promote_7.jpg', '123', '0', '1');
INSERT INTO `goods` VALUES ('22', 'T恤男黑色V领短袖打底小衫男', '1', '28', '123', 'promote_8.jpg', '12', '0', '1');
INSERT INTO `goods` VALUES ('25', 'zippo军队战争珍藏纪念版打火机', '11', '288', '123', 'promote_9.jpg', '20', '0', '2');
INSERT INTO `goods` VALUES ('26', '打火机zippo正版 美国原装芝宝正品古铜重甲', '11', '588', '123', 'promote_10.jpg', '20', '0', '3');
INSERT INTO `goods` VALUES ('27', '迪赛DZ4290 DZ4281男表时尚计时DZ4291大表盘', '11', '2088', '123', 'promote_11.jpg', '20', '0', '3');
INSERT INTO `goods` VALUES ('28', '分期购Diesel迪赛 炫酷一代 偏光个性超大石英男表 DZ', '11', '1333', '123', 'promote_12.jpg', '20', '0', '2');
INSERT INTO `goods` VALUES ('29', '杰伟世GZ_N1', '4', '2333', '123', 'promote_13.jpg', '20', '0', '2');
INSERT INTO `goods` VALUES ('30', '买一送三3D手机屏幕放大器', '4', '32', '123', 'promote_14.jpg', '20', '0', '2');
INSERT INTO `goods` VALUES ('31', '男士大头工装鞋男鞋圆头', '4', '388', '123', 'promote_15.jpg', '20', '0', '2');
INSERT INTO `goods` VALUES ('32', '仁风秋冬款男士加厚高领打底衫', '4', '68', '123', 'promote_16.jpg', '20', '0', '2');
INSERT INTO `goods` VALUES ('33', '新款男士商务牛皮旅行包行李包', '4', '156', '123', 'promote_17.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('34', '英伦男鞋潮鞋', '7', '266', '123', 'promote_18.jpg', '20', '0', '3');
INSERT INTO `goods` VALUES ('35', '正品警察铝镁男士太阳镜', '7', '35', '123', 'promote_19.jpg', '20', '0', '3');
INSERT INTO `goods` VALUES ('41', '康佳 BCD-170TA-GY双门冰箱', '6', '1100', '33', 'promote_23.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('44', '轻质透气男女跑步鞋 预售 FILA斐乐', '6', '398', '65', 'promote_24.jpg', '20', '0', '2');
INSERT INTO `goods` VALUES ('45', '斯诺德踏步机家用静音迷你椭圆机正品扶手脚踏机', '9', '266', '12', 'promote_25.jpg', '20', '0', '3');
INSERT INTO `goods` VALUES ('46', '特价 德约科维奇L5 正品海德 Head', '9', '128', '12', 'promote_26.jpg', '20', '0', '3');
INSERT INTO `goods` VALUES ('47', '通用4.1蓝牙耳机听歌电话', '9', '39', '99', 'promote_27.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('50', '联想i7处理器笔记本', '9', '4999', '12', 'promote_20.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('51', '超强力 大功率 吸尘器 ', '9', '456', '12', 'promote_21.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('54', '尼康智能 N65 超清', '10', '3000', '12', 'promote_4.jpg', '21', '0', '3');
INSERT INTO `goods` VALUES ('55', '重金属打火机zippo', '9', '888', '123', 'promote_10.jpg', '20', '0', '1');
INSERT INTO `goods` VALUES ('56', '游戏笔记本 高配电脑', '9', '4888', '12', 'promote_2.jpg', '20', '0', '4');

-- ----------------------------
-- Table structure for `orderse`
-- ----------------------------
DROP TABLE IF EXISTS `orderse`;
CREATE TABLE `orderse` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `orderseGoodsId` bigint(11) NOT NULL,
  `orderseCusId` bigint(11) NOT NULL,
  `orderseDate` date NOT NULL,
  `orderseAddress` varchar(200) NOT NULL,
  `orderseMoney` double NOT NULL,
  `orderseStatus` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderse
-- ----------------------------
INSERT INTO `orderse` VALUES ('1', '45', '30', '2018-07-09', '姓名:张拓,地址:湖南长沙岳麓区溁湾填,电话:0731-88858332-8888,手机:15874073679', '478.8', '0');
INSERT INTO `orderse` VALUES ('2', '41', '30', '2018-07-09', '姓名:张拓,地址:湖南长沙岳麓区溁湾填,电话:0731-88858332-8888,手机:15874073679', '1100', '0');

-- ----------------------------
-- Table structure for `seller`
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(20) NOT NULL,
  `sellerUser` varchar(20) NOT NULL,
  `sellerPassword` varchar(20) NOT NULL,
  `sellerSex` char(1) NOT NULL,
  `sellerBirthday` date NOT NULL,
  `sellerIdCard` varchar(18) NOT NULL,
  `sellerEmail` varchar(20) NOT NULL,
  `sellerTel` varchar(11) NOT NULL,
  `sellerAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', '马云电子', 'mayun321', '123123', '男', '1988-02-02', '425604198802028596', 'mayun321@qq.com', '15174015689', '北京');
INSERT INTO `seller` VALUES ('2', '乔布斯水果店', 'qiao321', '123123', '男', '1979-10-31', '46865587369894523', 'qiao321@qq.com', '12345678901', '美国');
INSERT INTO `seller` VALUES ('3', '盖茨家电', 'gaici321', '123123', '男', '1965-06-06', '132456789012346578', 'gaici321@qq.com', '12365498712', '美国');

-- ----------------------------
-- Table structure for `shoppingcar`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `scCusId` bigint(11) DEFAULT NULL,
  `scGoodsId` bigint(11) DEFAULT NULL,
  `scNumber` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `S_c_id` (`scCusId`),
  KEY `S_g_id` (`scGoodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES ('13', null, '27', '1');
INSERT INTO `shoppingcar` VALUES ('15', null, '26', '1');
INSERT INTO `shoppingcar` VALUES ('20', null, '21', '1');
INSERT INTO `shoppingcar` VALUES ('21', null, '46', '1');
INSERT INTO `shoppingcar` VALUES ('23', '22', '25', '1');
INSERT INTO `shoppingcar` VALUES ('24', null, '51', '1');
INSERT INTO `shoppingcar` VALUES ('26', null, '18', '1');
INSERT INTO `shoppingcar` VALUES ('29', null, '50', '1');
INSERT INTO `shoppingcar` VALUES ('30', null, '56', '1');
INSERT INTO `shoppingcar` VALUES ('31', null, '21', '1');
INSERT INTO `shoppingcar` VALUES ('32', null, '20', '1');
INSERT INTO `shoppingcar` VALUES ('35', null, '19', '1');
INSERT INTO `shoppingcar` VALUES ('37', '4', '56', '1');
INSERT INTO `shoppingcar` VALUES ('38', null, '27', '1');

-- ----------------------------
-- Table structure for `SmallClass`
-- ----------------------------
DROP TABLE IF EXISTS `smallclass`;
CREATE TABLE `smallclass` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '小分类ID',
  `smallName` varchar(10) NOT NULL COMMENT '小分类名称',
  `smallBigId` bigint(11) NOT NULL COMMENT '小分类对应的大分类ID',
  `smallText` varchar(50) NOT NULL COMMENT '小分类描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of SmallClass
-- ----------------------------
INSERT INTO `smallclass` VALUES ('1', '液晶电视', '1', '345');
INSERT INTO `smallclass` VALUES ('3', '冰箱', '1', '12');
INSERT INTO `smallclass` VALUES ('4', '冰柜', '1', '123');
INSERT INTO `smallclass` VALUES ('5', '空调', '1', '123');
INSERT INTO `smallclass` VALUES ('6', '直板手机', '2', '123');
INSERT INTO `smallclass` VALUES ('7', '翻盖手机', '2', '123');
INSERT INTO `smallclass` VALUES ('9', '摄像机', '2', '123');
INSERT INTO `smallclass` VALUES ('10', '照像机', '2', '123');
INSERT INTO `smallclass` VALUES ('11', '卫生间用具', '3', '111');
INSERT INTO `smallclass` VALUES ('12', '厨房用品', '3', '123');
INSERT INTO `smallclass` VALUES ('13', '沙发', '3', '123');
INSERT INTO `smallclass` VALUES ('14', '创意小家居', '3', '123');
INSERT INTO `smallclass` VALUES ('15', '杂物', '3', '123');
INSERT INTO `smallclass` VALUES ('16', '历史类', '4', '123');
INSERT INTO `smallclass` VALUES ('17', '科学类', '4', '123');
INSERT INTO `smallclass` VALUES ('18', '教育类', '4', '123');
INSERT INTO `smallclass` VALUES ('19', '小说类', '4', '123');
INSERT INTO `smallclass` VALUES ('20', '人文类', '4', '123');
INSERT INTO `smallclass` VALUES ('21', '电风扇', '1', '123');
INSERT INTO `smallclass` VALUES ('22', '洗衣机', '1', '123');
INSERT INTO `smallclass` VALUES ('23', '电热水器', '1', '123');
INSERT INTO `smallclass` VALUES ('24', '家庭音响', '1', '123');
INSERT INTO `smallclass` VALUES ('25', '电饭煲', '1', '123');
INSERT INTO `smallclass` VALUES ('26', 'DVD', '1', '123');
INSERT INTO `smallclass` VALUES ('27', '电吹风', '1', '123');
INSERT INTO `smallclass` VALUES ('28', '燃器灶', '1', '123');
INSERT INTO `smallclass` VALUES ('29', '灯具', '1', '123');
INSERT INTO `smallclass` VALUES ('30', '吸尘器', '1', '123');
INSERT INTO `smallclass` VALUES ('31', '空气净化机', '1', '123');
INSERT INTO `smallclass` VALUES ('34', '平板电脑', '2', '123123');
INSERT INTO `smallclass` VALUES ('35', '安卓手机', '2', '123');
INSERT INTO `smallclass` VALUES ('36', '苹果手机', '2', '123');
INSERT INTO `smallclass` VALUES ('37', 'MP3', '2', '123');
INSERT INTO `smallclass` VALUES ('38', 'PM4', '2', '123');
INSERT INTO `smallclass` VALUES ('39', '电子相框', '2', '123');
INSERT INTO `smallclass` VALUES ('40', '电子阅读器', '2', '123');
INSERT INTO `smallclass` VALUES ('41', '笔记本', '2', '123');
INSERT INTO `smallclass` VALUES ('42', '掌上电脑', '2', '123');
INSERT INTO `smallclass` VALUES ('43', '台式机', '2', '123');
INSERT INTO `smallclass` VALUES ('44', '上网本', '2', '123');
INSERT INTO `smallclass` VALUES ('45', '计算机类', '4', '123');
INSERT INTO `smallclass` VALUES ('46', '散文类', '4', '123');
INSERT INTO `smallclass` VALUES ('47', '诗歌类', '4', '123');
INSERT INTO `smallclass` VALUES ('48', '图书类', '4', '123');
INSERT INTO `smallclass` VALUES ('49', '侦探类', '4', '123');
INSERT INTO `smallclass` VALUES ('50', '军事类', '4', '123');
INSERT INTO `smallclass` VALUES ('51', '经济类', '4', '123');
INSERT INTO `smallclass` VALUES ('52', '外语类', '4', '123');
INSERT INTO `smallclass` VALUES ('53', '法律类', '4', '123');
INSERT INTO `smallclass` VALUES ('54', '书刊类', '4', '123');
INSERT INTO `smallclass` VALUES ('55', '装饰品', '3', '123');
INSERT INTO `smallclass` VALUES ('56', '书柜,衣柜', '3', '1234');
INSERT INTO `smallclass` VALUES ('57', '床上用品', '3', '床垫,羽绒被,床单,被套,枕套,');
INSERT INTO `smallclass` VALUES ('58', '地毯', '3', '123');
INSERT INTO `smallclass` VALUES ('59', '窗帘', '3', '123');
INSERT INTO `smallclass` VALUES ('60', '家务清洁', '3', '123');
INSERT INTO `smallclass` VALUES ('61', '收纳容器', '3', '123');
INSERT INTO `smallclass` VALUES ('62', '五金挂件', '3', '123');
INSERT INTO `smallclass` VALUES ('63', '装修配牛', '3', '123');
INSERT INTO `smallclass` VALUES ('64', '桌,椅', '3', '123');

-- ----------------------------
-- Table structure for `superuser`
-- ----------------------------
DROP TABLE IF EXISTS `superuser`;
CREATE TABLE `superuser` (
  `id` int(11) NOT NULL COMMENT '用户ID',
  `userName` varchar(20) NOT NULL COMMENT '用户真实姓名',
  `userPassword` varchar(50) NOT NULL COMMENT '用户密码',
  `userImage` varchar(40) DEFAULT NULL COMMENT '用户的头像(可设置默认)',
  `userStatus` int(1) NOT NULL DEFAULT '0' COMMENT '用户状态 0 可用 1冻结',
  `userID` varchar(18) DEFAULT NULL COMMENT '用户的身份证号',
  `userLoginName` varchar(50) NOT NULL COMMENT '用户的登录名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of superuser
-- ----------------------------
INSERT INTO `superuser` VALUES ('1', '张小黑', '123435', null, '0', '41092819990909', 'xiaohei');
