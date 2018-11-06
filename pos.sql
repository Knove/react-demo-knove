/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : pos

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 06/11/2018 16:26:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for desk
-- ----------------------------
DROP TABLE IF EXISTS `desk`;
CREATE TABLE `desk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `de_num` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `de_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:未使用 1:使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of desk
-- ----------------------------
INSERT INTO `desk` VALUES (1, '1', '0');
INSERT INTO `desk` VALUES (2, '2', '0');
INSERT INTO `desk` VALUES (3, '3', '0');
INSERT INTO `desk` VALUES (4, '4', '0');
INSERT INTO `desk` VALUES (5, '5', '0');
INSERT INTO `desk` VALUES (6, '6', '0');
INSERT INTO `desk` VALUES (7, '7', '0');
INSERT INTO `desk` VALUES (8, '8', '0');
INSERT INTO `desk` VALUES (9, '9', '0');
INSERT INTO `desk` VALUES (10, '10', '0');
INSERT INTO `desk` VALUES (11, '11', '0');
INSERT INTO `desk` VALUES (12, '12', '0');
INSERT INTO `desk` VALUES (13, '13', '0');
INSERT INTO `desk` VALUES (14, '14', '0');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dc_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_cn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_material` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `d_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `d_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_count` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：已删除 1：未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1, '1', '酸辣土豆丝', 'SLTDS', '2017-11-11 00:00:00', '辣椒、土豆', '对土豆过敏勿食', '12', '7', '1');
INSERT INTO `dish` VALUES (2, '1', '拍黄瓜', 'PHG', '2017-11-11 00:00:00', '黄瓜、蒜', '无', '16', '100', '1');
INSERT INTO `dish` VALUES (3, '1', '凉皮子', 'LPZ', '2017-11-11 00:00:00', '凉水、面皮', '无', '21', '2', '1');
INSERT INTO `dish` VALUES (4, '2', '油炸雪糕', 'YZXG', '2017-11-12 00:00:00', '油、雪糕', '雪糕温度要超过100度', '1', '100', '1');
INSERT INTO `dish` VALUES (5, '2', '蚂蚁上树', 'MYSS', '2017-11-12 00:00:00', '蚂蚁、树', '蚂蚁不少于一碗', '100', '100', '1');
INSERT INTO `dish` VALUES (6, '3', '雪碧', 'XB', '2017-11-13 00:00:00', '白开水', '无', '11', '11', '1');
INSERT INTO `dish` VALUES (7, '3', '露露', 'LL', '2017-11-13 00:00:00', '白开水', '无', '12', '111', '1');
INSERT INTO `dish` VALUES (8, '3', '脉动', 'MD', '2017-11-13 00:00:00', '白开水', '无', '13', '111', '1');
INSERT INTO `dish` VALUES (9, '3', '润田', 'RT', '2017-11-13 00:00:00', '白开水', '无', '14', '34', '1');
INSERT INTO `dish` VALUES (10, '3', '恒源', 'HY', '2017-11-13 00:00:00', '白开水', '无', '14', '0', '1');
INSERT INTO `dish` VALUES (11, '3', '不倒翁', 'BDW', '2017-11-13 00:00:00', '白开水', '无', '13', '111', '1');
INSERT INTO `dish` VALUES (12, '1', '六个核桃', 'LGHT', '2017-11-13 00:00:00', '白开水', '无', '12', '2', '1');
INSERT INTO `dish` VALUES (13, '3', '汇源果汁', 'HYGZ', '2017-11-13 00:00:00', '白开水', '无', '1', '0', '1');
INSERT INTO `dish` VALUES (14, '4', '把子肉', 'BZR', '2017-11-14 00:00:00', '肉', '含有猪肉，回族勿食', '23', '1', '1');
INSERT INTO `dish` VALUES (15, '4', '辣子鸡', 'LZJ', '2017-11-14 00:00:00', '辣子、鸡', '无', '42', '43', '1');
INSERT INTO `dish` VALUES (16, '4', '北京烤鸭', 'BJKY', '2017-11-14 00:00:00', '北京、烤鸭', '无', '15', '22', '1');
INSERT INTO `dish` VALUES (17, '5', '炒辣椒', 'CLJ', '2017-11-15 00:00:00', '辣椒', '无', '123', '1', '1');
INSERT INTO `dish` VALUES (18, '5', '水煮白菜', 'SZBC', '2017-11-15 00:00:00', '水、白菜', '无', '31', '0', '1');
INSERT INTO `dish` VALUES (19, '1', '水煮豆腐', 'SZDF', '2017-11-15 00:00:00', '水、豆腐', '无', '231', '23', '1');
INSERT INTO `dish` VALUES (20, '5', '炒豆芽', 'CDY', '2017-11-15 00:00:00', '豆芽', '无', '134', '53', '1');
INSERT INTO `dish` VALUES (21, '1', '炒白菜', 'CBC', '2017-11-15 00:00:00', '白菜', '无', '42', '25', '1');
INSERT INTO `dish` VALUES (22, '5', '炖白菜', 'DBC', '2017-11-15 00:00:00', '白菜', '无', '123', '0', '1');
INSERT INTO `dish` VALUES (23, '5', '蒸白菜', 'ZBC', '2017-11-15 00:00:00', '白菜', '无', '64', '27', '1');
INSERT INTO `dish` VALUES (24, '6', '紫菜鸡蛋汤', 'ZCJDT', '2017-11-16 00:00:00', '紫菜、鸡蛋', '无', '12', '35', '1');
INSERT INTO `dish` VALUES (25, '6', '玉米羹', 'YMG', '2017-11-16 00:00:00', '玉米', '无', '43', '222', '1');
INSERT INTO `dish` VALUES (26, '6', '白菜汤', 'BCT', '2017-11-16 00:00:00', '白菜、豆腐', '无', '34', '264', '1');
INSERT INTO `dish` VALUES (27, '6', '西红柿番茄汤', 'XHSFQT', '2017-11-16 00:00:00', '西红柿、番茄', '无', '2', '0', '1');
INSERT INTO `dish` VALUES (28, '7', '鸡蛋面条', 'JDMT', '2017-11-17 00:00:00', '鸡蛋、面条0\n', '无', '2', '3', '1');
INSERT INTO `dish` VALUES (29, '7', '米饭', 'MF', '2017-11-17 00:00:00', '东北大米', '无', '2', '232', '1');
INSERT INTO `dish` VALUES (30, '1', '馒头', 'MT', '2017-11-17 00:00:00', '面粉', '无', '2', '11', '1');
INSERT INTO `dish` VALUES (31, '7', '煎饼', 'JB', '2017-11-17 00:00:00', '面粉', '无', '2', '132', '1');
INSERT INTO `dish` VALUES (34, '4', '爆炒牛蛙', 'BCNW', '2017-11-14 00:00:00', '牛蛙 辣椒', '对牛蛙过敏者不要吃', '58', '15', '1');
INSERT INTO `dish` VALUES (40, '4', '拔丝地瓜', 'BSDG', '2017-11-14 00:00:00', '地瓜', '对地瓜过敏者不要点', '22', '10', '1');
INSERT INTO `dish` VALUES (41, '4', '拔丝地瓜', 'BSDG', '2017-11-14 00:00:00', '地瓜', '对地瓜过敏者不要点', '22', '10', '1');
INSERT INTO `dish` VALUES (42, '4', '拔丝地瓜', 'BSDG', '2017-11-14 00:00:00', '大地瓜', '很好吃', '35', '20', '1');
INSERT INTO `dish` VALUES (43, '4', '红烧猪蹄', 'BSDG', '2017-11-14 00:00:00', '猪蹄', '对猪过敏者不要吃', '50', '10', '1');
INSERT INTO `dish` VALUES (44, '4', '大肠炖豆腐', 'BCDDF', '2017-11-14 00:00:00', '大肠豆腐', '对猪过敏者不要吃', '50', '4', '1');
INSERT INTO `dish` VALUES (45, '5', '蛋花丝瓜汤', 'ZCDHT', '2017-11-15 00:00:00', '蛋黄1个30克,丝瓜100克', '不爱吃丝瓜的不要点', '12', '3', '1');
INSERT INTO `dish` VALUES (46, '3', '馄饨', 'HD', '2017-11-13 00:00:00', '馄饨皮6个50克,鲜虾仁80克,蛋清30克', '不爱吃馄饨的不要点', '10', '10', '1');
INSERT INTO `dish` VALUES (47, '3', '海蜇汤菜', 'HZTC', '2017-11-13 00:00:00', '海蜇300克,鸡蛋1个80克', '水', '15', '10', '1');
INSERT INTO `dish` VALUES (48, '3', '三色鲜贝', 'SSXB', '2017-11-13 00:00:00', '白糖,味精,淀粉,', '水', '15', '10', '1');
INSERT INTO `dish` VALUES (49, '3', '夹馅黄瓜', 'JXHG', '2017-11-13 00:00:00', '黄瓜', '水', '15', '10', '1');
INSERT INTO `dish` VALUES (50, 'undefined', '拔丝地瓜1', 'undefined', '2017-11-15 15:49:17', 'undefined', 'undefined', '12', 'undefined', '1');
INSERT INTO `dish` VALUES (51, '荤菜', '拔丝地瓜1', 'BSDG', '2017-11-15 15:49:59', 'undefined', 'undefined', '12', '5', '1');
INSERT INTO `dish` VALUES (52, '1', '测试菜品', 'CSCP', '2017-11-20 19:55:38', NULL, NULL, '111', '01', '1');

-- ----------------------------
-- Table structure for dish_catelog
-- ----------------------------
DROP TABLE IF EXISTS `dish_catelog`;
CREATE TABLE `dish_catelog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dc_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_catelog
-- ----------------------------
INSERT INTO `dish_catelog` VALUES (1, '特价菜品');
INSERT INTO `dish_catelog` VALUES (2, '热销菜品');
INSERT INTO `dish_catelog` VALUES (3, '饮料');
INSERT INTO `dish_catelog` VALUES (4, '荤菜');
INSERT INTO `dish_catelog` VALUES (5, '素菜');
INSERT INTO `dish_catelog` VALUES (6, '汤类');
INSERT INTO `dish_catelog` VALUES (7, '面食');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oi_count` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oi_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:未上菜 1：上菜',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 473 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (1, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (2, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (3, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (4, '2', '4', '2', '1');
INSERT INTO `order_item` VALUES (5, '2', '5', '1', '1');
INSERT INTO `order_item` VALUES (6, '3', '4', '2', '1');
INSERT INTO `order_item` VALUES (7, '8', '4', '1', '1');
INSERT INTO `order_item` VALUES (8, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (9, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (10, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (11, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (12, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (13, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (14, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (15, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (16, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (17, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (18, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (19, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (20, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (21, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (22, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (23, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (24, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (25, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (26, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (27, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (28, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (29, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (30, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (31, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (32, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (33, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (34, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (35, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (36, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (37, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (38, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (39, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (40, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (41, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (42, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (43, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (44, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (45, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (46, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (47, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (48, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (49, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (50, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (51, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (52, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (53, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (54, '1', '1', '1', '1');
INSERT INTO `order_item` VALUES (55, '1', '2', '1', '1');
INSERT INTO `order_item` VALUES (56, '1', '3', '1', '1');
INSERT INTO `order_item` VALUES (57, '29', '1', '1', '1');
INSERT INTO `order_item` VALUES (58, '29', '2', '1', '1');
INSERT INTO `order_item` VALUES (59, '29', '3', '1', '1');
INSERT INTO `order_item` VALUES (60, '30', '1', '1', '0');
INSERT INTO `order_item` VALUES (61, '30', '2', '1', '0');
INSERT INTO `order_item` VALUES (62, '30', '3', '1', '0');
INSERT INTO `order_item` VALUES (63, '39', '2', '1', '0');
INSERT INTO `order_item` VALUES (64, '39', '3', '1', '0');
INSERT INTO `order_item` VALUES (65, '40', '2', '1', '0');
INSERT INTO `order_item` VALUES (66, '40', '3', '1', '0');
INSERT INTO `order_item` VALUES (67, '41', '2', '1', '0');
INSERT INTO `order_item` VALUES (68, '41', '3', '1', '0');
INSERT INTO `order_item` VALUES (69, '42', '2', '1', '0');
INSERT INTO `order_item` VALUES (70, '42', '3', '1', '0');
INSERT INTO `order_item` VALUES (71, '43', '2', '1', '0');
INSERT INTO `order_item` VALUES (72, '43', '3', '1', '0');
INSERT INTO `order_item` VALUES (73, '44', '2', '1', '0');
INSERT INTO `order_item` VALUES (74, '44', '3', '1', '0');
INSERT INTO `order_item` VALUES (75, '45', '2', '1', '0');
INSERT INTO `order_item` VALUES (76, '45', '3', '1', '0');
INSERT INTO `order_item` VALUES (77, '46', '2', '1', '0');
INSERT INTO `order_item` VALUES (78, '46', '3', '1', '0');
INSERT INTO `order_item` VALUES (79, '47', '2', '1', '0');
INSERT INTO `order_item` VALUES (80, '47', '3', '1', '0');
INSERT INTO `order_item` VALUES (81, '48', '2', '1', '0');
INSERT INTO `order_item` VALUES (82, '48', '3', '1', '0');
INSERT INTO `order_item` VALUES (83, '49', '2', '1', '0');
INSERT INTO `order_item` VALUES (84, '49', '3', '1', '0');
INSERT INTO `order_item` VALUES (85, '50', '2', '1', '0');
INSERT INTO `order_item` VALUES (86, '50', '3', '1', '0');
INSERT INTO `order_item` VALUES (87, '51', '1', '1', '0');
INSERT INTO `order_item` VALUES (88, '51', '2', '1', '0');
INSERT INTO `order_item` VALUES (89, '52', '1', '1', '0');
INSERT INTO `order_item` VALUES (90, '52', '2', '1', '0');
INSERT INTO `order_item` VALUES (91, '55', '1', '1', '0');
INSERT INTO `order_item` VALUES (92, '55', '2', '1', '0');
INSERT INTO `order_item` VALUES (93, '56', '1', '1', '0');
INSERT INTO `order_item` VALUES (94, '56', '2', '1', '0');
INSERT INTO `order_item` VALUES (95, '57', '1', '1', '0');
INSERT INTO `order_item` VALUES (96, '57', '2', '1', '0');
INSERT INTO `order_item` VALUES (97, '57', '2', '1', '0');
INSERT INTO `order_item` VALUES (98, '59', '2', '1', '0');
INSERT INTO `order_item` VALUES (99, '59', '1', '1', '0');
INSERT INTO `order_item` VALUES (100, '59', '3', '1', '0');
INSERT INTO `order_item` VALUES (101, '60', '1', '1', '0');
INSERT INTO `order_item` VALUES (102, '60', '2', '1', '0');
INSERT INTO `order_item` VALUES (103, '60', '3', '1', '0');
INSERT INTO `order_item` VALUES (104, '61', '1', '1', '0');
INSERT INTO `order_item` VALUES (105, '61', '2', '1', '0');
INSERT INTO `order_item` VALUES (106, '63', '1', '1', '0');
INSERT INTO `order_item` VALUES (107, '63', '2', '1', '0');
INSERT INTO `order_item` VALUES (108, '64', '1', '1', '0');
INSERT INTO `order_item` VALUES (109, '64', '2', '1', '0');
INSERT INTO `order_item` VALUES (110, '65', '1', '1', '0');
INSERT INTO `order_item` VALUES (111, '65', '2', '1', '0');
INSERT INTO `order_item` VALUES (112, '66', '1', '1', '0');
INSERT INTO `order_item` VALUES (113, '66', '2', '1', '0');
INSERT INTO `order_item` VALUES (114, '67', '1', '1', '0');
INSERT INTO `order_item` VALUES (115, '67', '2', '1', '0');
INSERT INTO `order_item` VALUES (116, '68', '1', '1', '0');
INSERT INTO `order_item` VALUES (117, '68', '2', '1', '0');
INSERT INTO `order_item` VALUES (118, '69', '1', '1', '0');
INSERT INTO `order_item` VALUES (119, '69', '2', '1', '0');
INSERT INTO `order_item` VALUES (120, '70', '1', '1', '0');
INSERT INTO `order_item` VALUES (121, '70', '2', '1', '0');
INSERT INTO `order_item` VALUES (122, '71', '1', '1', '0');
INSERT INTO `order_item` VALUES (123, '71', '2', '1', '0');
INSERT INTO `order_item` VALUES (124, '72', '1', '1', '0');
INSERT INTO `order_item` VALUES (125, '72', '2', '1', '0');
INSERT INTO `order_item` VALUES (126, '73', '1', '1', '0');
INSERT INTO `order_item` VALUES (127, '73', '2', '1', '0');
INSERT INTO `order_item` VALUES (128, '74', '1', '1', '0');
INSERT INTO `order_item` VALUES (129, '74', '2', '1', '0');
INSERT INTO `order_item` VALUES (130, '75', '1', '1', '0');
INSERT INTO `order_item` VALUES (131, '75', '2', '1', '0');
INSERT INTO `order_item` VALUES (132, '76', '1', '1', '0');
INSERT INTO `order_item` VALUES (133, '76', '2', '1', '0');
INSERT INTO `order_item` VALUES (134, '77', '1', '1', '0');
INSERT INTO `order_item` VALUES (135, '77', '2', '1', '0');
INSERT INTO `order_item` VALUES (136, '78', '2', '1', '0');
INSERT INTO `order_item` VALUES (137, '78', '1', '1', '0');
INSERT INTO `order_item` VALUES (138, '79', '1', '1', '0');
INSERT INTO `order_item` VALUES (139, '79', '2', '1', '0');
INSERT INTO `order_item` VALUES (140, '80', '1', '1', '0');
INSERT INTO `order_item` VALUES (141, '80', '1', '1', '0');
INSERT INTO `order_item` VALUES (142, '80', '1', '1', '0');
INSERT INTO `order_item` VALUES (143, '81', '1', '1', '0');
INSERT INTO `order_item` VALUES (144, '81', '2', '1', '0');
INSERT INTO `order_item` VALUES (145, '82', '1', '1', '0');
INSERT INTO `order_item` VALUES (146, '82', '2', '1', '0');
INSERT INTO `order_item` VALUES (147, '83', '1', '1', '0');
INSERT INTO `order_item` VALUES (148, '83', '2', '1', '0');
INSERT INTO `order_item` VALUES (149, '84', '1', '1', '0');
INSERT INTO `order_item` VALUES (150, '84', '2', '1', '0');
INSERT INTO `order_item` VALUES (151, '85', '1', '1', '0');
INSERT INTO `order_item` VALUES (152, '85', '2', '1', '0');
INSERT INTO `order_item` VALUES (153, '86', '1', '1', '0');
INSERT INTO `order_item` VALUES (154, '86', '2', '1', '0');
INSERT INTO `order_item` VALUES (155, '92', '2', '1', '0');
INSERT INTO `order_item` VALUES (156, '92', '1', '1', '0');
INSERT INTO `order_item` VALUES (157, '92', '2', '1', '0');
INSERT INTO `order_item` VALUES (158, '96', '1', '1', '0');
INSERT INTO `order_item` VALUES (159, '96', '2', '1', '0');
INSERT INTO `order_item` VALUES (160, '97', '1', '1', '0');
INSERT INTO `order_item` VALUES (161, '97', '2', '1', '0');
INSERT INTO `order_item` VALUES (162, '98', '1', '1', '0');
INSERT INTO `order_item` VALUES (163, '98', '2', '1', '0');
INSERT INTO `order_item` VALUES (164, '99', '1', '1', '0');
INSERT INTO `order_item` VALUES (165, '99', '2', '1', '0');
INSERT INTO `order_item` VALUES (166, '100', '1', '1', '0');
INSERT INTO `order_item` VALUES (167, '100', '2', '1', '0');
INSERT INTO `order_item` VALUES (168, '101', '2', '1', '0');
INSERT INTO `order_item` VALUES (169, '101', '3', '1', '0');
INSERT INTO `order_item` VALUES (170, '102', '2', '1', '0');
INSERT INTO `order_item` VALUES (171, '102', '3', '1', '0');
INSERT INTO `order_item` VALUES (172, '103', '2', '1', '0');
INSERT INTO `order_item` VALUES (173, '103', '3', '1', '0');
INSERT INTO `order_item` VALUES (174, '104', '2', '1', '0');
INSERT INTO `order_item` VALUES (175, '104', '3', '1', '0');
INSERT INTO `order_item` VALUES (176, '105', '3', '1', '0');
INSERT INTO `order_item` VALUES (177, '105', '12', '1', '0');
INSERT INTO `order_item` VALUES (178, '106', '2', '1', '0');
INSERT INTO `order_item` VALUES (179, '106', '3', '1', '0');
INSERT INTO `order_item` VALUES (180, '108', '2', '1', '0');
INSERT INTO `order_item` VALUES (181, '108', '3', '1', '0');
INSERT INTO `order_item` VALUES (182, '111', '2', '1', '0');
INSERT INTO `order_item` VALUES (183, '111', '3', '1', '0');
INSERT INTO `order_item` VALUES (188, '114', '2', '1', '0');
INSERT INTO `order_item` VALUES (189, '114', '3', '1', '0');
INSERT INTO `order_item` VALUES (190, '116', '3', '1', '0');
INSERT INTO `order_item` VALUES (191, '116', '12', '1', '0');
INSERT INTO `order_item` VALUES (192, '120', '2', '1', '0');
INSERT INTO `order_item` VALUES (193, '120', '3', '1', '0');
INSERT INTO `order_item` VALUES (194, '121', '3', '5', '0');
INSERT INTO `order_item` VALUES (195, '121', '12', '1', '0');
INSERT INTO `order_item` VALUES (196, '122', '2', '1', '0');
INSERT INTO `order_item` VALUES (197, '122', '3', '1', '0');
INSERT INTO `order_item` VALUES (211, '128', '2', '1', '0');
INSERT INTO `order_item` VALUES (212, '128', '3', '1', '0');
INSERT INTO `order_item` VALUES (213, '129', '2', '1', '0');
INSERT INTO `order_item` VALUES (214, '129', '3', '1', '0');
INSERT INTO `order_item` VALUES (215, '131', '2', '1', '0');
INSERT INTO `order_item` VALUES (216, '131', '3', '1', '0');
INSERT INTO `order_item` VALUES (217, '132', '3', '1', '0');
INSERT INTO `order_item` VALUES (218, '132', '2', '1', '0');
INSERT INTO `order_item` VALUES (219, '133', '3', '1', '0');
INSERT INTO `order_item` VALUES (220, '133', '12', '1', '0');
INSERT INTO `order_item` VALUES (221, '134', '3', '1', '0');
INSERT INTO `order_item` VALUES (222, '134', '12', '1', '0');
INSERT INTO `order_item` VALUES (223, '135', '3', '1', '0');
INSERT INTO `order_item` VALUES (224, '135', '12', '1', '0');
INSERT INTO `order_item` VALUES (225, '136', '3', '1', '0');
INSERT INTO `order_item` VALUES (226, '137', '3', '1', '0');
INSERT INTO `order_item` VALUES (227, '137', '12', '1', '0');
INSERT INTO `order_item` VALUES (228, '138', '2', '1', '0');
INSERT INTO `order_item` VALUES (229, '138', '3', '1', '0');
INSERT INTO `order_item` VALUES (230, '139', '12', '1', '0');
INSERT INTO `order_item` VALUES (231, '139', '3', '1', '0');
INSERT INTO `order_item` VALUES (232, '140', '2', '1', '0');
INSERT INTO `order_item` VALUES (233, '140', '3', '1', '0');
INSERT INTO `order_item` VALUES (234, '141', '2', '1', '0');
INSERT INTO `order_item` VALUES (235, '142', '2', '1', '0');
INSERT INTO `order_item` VALUES (236, '143', '12', '1', '0');
INSERT INTO `order_item` VALUES (237, '144', '3', '1', '0');
INSERT INTO `order_item` VALUES (238, '144', '2', '1', '0');
INSERT INTO `order_item` VALUES (239, '145', '12', '1', '0');
INSERT INTO `order_item` VALUES (240, '145', '3', '1', '0');
INSERT INTO `order_item` VALUES (241, '146', '2', '1', '0');
INSERT INTO `order_item` VALUES (242, '146', '3', '1', '0');
INSERT INTO `order_item` VALUES (243, '147', '3', '1', '0');
INSERT INTO `order_item` VALUES (244, '147', '12', '1', '0');
INSERT INTO `order_item` VALUES (245, '148', '2', '1', '0');
INSERT INTO `order_item` VALUES (246, '148', '3', '1', '0');
INSERT INTO `order_item` VALUES (247, '149', '2', '1', '1');
INSERT INTO `order_item` VALUES (248, '149', '21', '1', '1');
INSERT INTO `order_item` VALUES (249, '150', '3', '1', '0');
INSERT INTO `order_item` VALUES (250, '150', '2', '2', '1');
INSERT INTO `order_item` VALUES (251, '150', '14', '1', '1');
INSERT INTO `order_item` VALUES (252, '150', '31', '3', '1');
INSERT INTO `order_item` VALUES (253, '151', '28', '2', '0');
INSERT INTO `order_item` VALUES (254, '151', '29', '1', '0');
INSERT INTO `order_item` VALUES (255, '152', '30', '1', '0');
INSERT INTO `order_item` VALUES (256, '152', '19', '1', '0');
INSERT INTO `order_item` VALUES (257, '153', '30', '1', '1');
INSERT INTO `order_item` VALUES (258, '153', '19', '1', '1');
INSERT INTO `order_item` VALUES (259, '153', '1', '1', '0');
INSERT INTO `order_item` VALUES (260, '153', '12', '2', '1');
INSERT INTO `order_item` VALUES (261, '153', '3', '1', '0');
INSERT INTO `order_item` VALUES (262, '154', '1', '1', '0');
INSERT INTO `order_item` VALUES (263, '154', '21', '1', '0');
INSERT INTO `order_item` VALUES (264, '155', '1', '1', '1');
INSERT INTO `order_item` VALUES (265, '155', '30', '1', '1');
INSERT INTO `order_item` VALUES (266, '156', '19', '1', '0');
INSERT INTO `order_item` VALUES (267, '156', '2', '1', '0');
INSERT INTO `order_item` VALUES (268, '157', '12', '1', '1');
INSERT INTO `order_item` VALUES (269, '157', '30', '1', '1');
INSERT INTO `order_item` VALUES (270, '157', '19', '4', '0');
INSERT INTO `order_item` VALUES (271, '158', '30', '1', '1');
INSERT INTO `order_item` VALUES (272, '158', '19', '1', '1');
INSERT INTO `order_item` VALUES (273, '158', '1', '1', '0');
INSERT INTO `order_item` VALUES (274, '159', '19', '1', '0');
INSERT INTO `order_item` VALUES (275, '159', '21', '1', '1');
INSERT INTO `order_item` VALUES (276, '159', '2', '1', '0');
INSERT INTO `order_item` VALUES (277, '160', '19', '1', '0');
INSERT INTO `order_item` VALUES (278, '160', '1', '1', '0');
INSERT INTO `order_item` VALUES (279, '160', '12', '1', '0');
INSERT INTO `order_item` VALUES (280, '161', '1', '1', '1');
INSERT INTO `order_item` VALUES (281, '161', '2', '1', '1');
INSERT INTO `order_item` VALUES (282, '161', '21', '1', '0');
INSERT INTO `order_item` VALUES (283, '162', '19', '1', '1');
INSERT INTO `order_item` VALUES (284, '162', '21', '1', '1');
INSERT INTO `order_item` VALUES (285, '162', '2', '1', '0');
INSERT INTO `order_item` VALUES (286, '163', '19', '3', '1');
INSERT INTO `order_item` VALUES (287, '164', '19', '1', '1');
INSERT INTO `order_item` VALUES (288, '164', '1', '1', '1');
INSERT INTO `order_item` VALUES (289, '164', '2', '1', '0');
INSERT INTO `order_item` VALUES (290, '165', '2', '1', '0');
INSERT INTO `order_item` VALUES (291, '165', '21', '1', '1');
INSERT INTO `order_item` VALUES (292, '165', '3', '1', '1');
INSERT INTO `order_item` VALUES (293, '166', '30', '1', '0');
INSERT INTO `order_item` VALUES (294, '167', '30', '1', '1');
INSERT INTO `order_item` VALUES (295, '167', '19', '1', '1');
INSERT INTO `order_item` VALUES (296, '167', '2', '2', '1');
INSERT INTO `order_item` VALUES (297, '168', '30', '1', '0');
INSERT INTO `order_item` VALUES (298, '168', '19', '1', '1');
INSERT INTO `order_item` VALUES (299, '169', '19', '1', '1');
INSERT INTO `order_item` VALUES (300, '169', '1', '1', '1');
INSERT INTO `order_item` VALUES (301, '170', '30', '1', '0');
INSERT INTO `order_item` VALUES (302, '170', '19', '1', '1');
INSERT INTO `order_item` VALUES (303, '170', '3', '1', '1');
INSERT INTO `order_item` VALUES (304, '171', '19', '1', '1');
INSERT INTO `order_item` VALUES (305, '171', '2', '1', '1');
INSERT INTO `order_item` VALUES (306, '171', '3', '1', '0');
INSERT INTO `order_item` VALUES (307, '172', '2', '1', '0');
INSERT INTO `order_item` VALUES (308, '172', '3', '1', '1');
INSERT INTO `order_item` VALUES (309, '172', '21', '1', '0');
INSERT INTO `order_item` VALUES (310, '173', '19', '1', '1');
INSERT INTO `order_item` VALUES (311, '173', '2', '1', '1');
INSERT INTO `order_item` VALUES (312, '173', '3', '1', '1');
INSERT INTO `order_item` VALUES (313, '174', '19', '1', '0');
INSERT INTO `order_item` VALUES (314, '174', '2', '1', '1');
INSERT INTO `order_item` VALUES (315, '174', '12', '1', '1');
INSERT INTO `order_item` VALUES (316, '175', '30', '1', '1');
INSERT INTO `order_item` VALUES (317, '175', '1', '1', '1');
INSERT INTO `order_item` VALUES (318, '175', '19', '1', '1');
INSERT INTO `order_item` VALUES (319, '176', '19', '1', '1');
INSERT INTO `order_item` VALUES (320, '176', '21', '1', '1');
INSERT INTO `order_item` VALUES (321, '176', '12', '1', '0');
INSERT INTO `order_item` VALUES (322, '177', '30', '1', '1');
INSERT INTO `order_item` VALUES (323, '177', '1', '1', '0');
INSERT INTO `order_item` VALUES (324, '177', '21', '1', '1');
INSERT INTO `order_item` VALUES (325, '178', '21', '1', '0');
INSERT INTO `order_item` VALUES (326, '178', '3', '1', '0');
INSERT INTO `order_item` VALUES (327, '178', '2', '1', '0');
INSERT INTO `order_item` VALUES (328, '179', '21', '1', '0');
INSERT INTO `order_item` VALUES (329, '179', '19', '1', '0');
INSERT INTO `order_item` VALUES (330, '180', '19', '1', '1');
INSERT INTO `order_item` VALUES (331, '180', '21', '1', '1');
INSERT INTO `order_item` VALUES (332, '180', '3', '1', '1');
INSERT INTO `order_item` VALUES (333, '181', '30', '1', '1');
INSERT INTO `order_item` VALUES (334, '181', '19', '1', '1');
INSERT INTO `order_item` VALUES (335, '182', '2', '1', '1');
INSERT INTO `order_item` VALUES (336, '182', '3', '1', '1');
INSERT INTO `order_item` VALUES (337, '182', '12', '1', '1');
INSERT INTO `order_item` VALUES (338, '183', '30', '1', '0');
INSERT INTO `order_item` VALUES (339, '183', '1', '1', '1');
INSERT INTO `order_item` VALUES (340, '183', '21', '1', '1');
INSERT INTO `order_item` VALUES (341, '184', '21', '1', '1');
INSERT INTO `order_item` VALUES (342, '184', '2', '4', '0');
INSERT INTO `order_item` VALUES (343, '184', '1', '2', '1');
INSERT INTO `order_item` VALUES (344, '185', '21', '1', '1');
INSERT INTO `order_item` VALUES (345, '185', '12', '1', '1');
INSERT INTO `order_item` VALUES (346, '186', '19', '1', '1');
INSERT INTO `order_item` VALUES (347, '186', '2', '1', '1');
INSERT INTO `order_item` VALUES (348, '186', '3', '1', '1');
INSERT INTO `order_item` VALUES (349, '187', '19', '1', '1');
INSERT INTO `order_item` VALUES (350, '187', '21', '1', '1');
INSERT INTO `order_item` VALUES (351, '187', '3', '1', '1');
INSERT INTO `order_item` VALUES (352, '188', '30', '1', '1');
INSERT INTO `order_item` VALUES (353, '188', '1', '1', '1');
INSERT INTO `order_item` VALUES (354, '188', '2', '1', '0');
INSERT INTO `order_item` VALUES (355, '189', '19', '1', '0');
INSERT INTO `order_item` VALUES (356, '189', '2', '1', '0');
INSERT INTO `order_item` VALUES (357, '190', '21', '1', '1');
INSERT INTO `order_item` VALUES (358, '190', '3', '1', '1');
INSERT INTO `order_item` VALUES (359, '190', '12', '1', '1');
INSERT INTO `order_item` VALUES (360, '191', '30', '1', '0');
INSERT INTO `order_item` VALUES (361, '191', '1', '1', '0');
INSERT INTO `order_item` VALUES (362, '191', '19', '1', '0');
INSERT INTO `order_item` VALUES (363, '192', '21', '1', '1');
INSERT INTO `order_item` VALUES (364, '192', '3', '1', '1');
INSERT INTO `order_item` VALUES (365, '192', '12', '1', '1');
INSERT INTO `order_item` VALUES (366, '193', '30', '1', '1');
INSERT INTO `order_item` VALUES (367, '193', '1', '1', '1');
INSERT INTO `order_item` VALUES (368, '193', '19', '1', '0');
INSERT INTO `order_item` VALUES (369, '194', '30', '1', '1');
INSERT INTO `order_item` VALUES (370, '194', '19', '1', '1');
INSERT INTO `order_item` VALUES (371, '195', '30', '1', '0');
INSERT INTO `order_item` VALUES (372, '195', '12', '1', '0');
INSERT INTO `order_item` VALUES (373, '195', '19', '1', '0');
INSERT INTO `order_item` VALUES (374, '196', '30', '1', '0');
INSERT INTO `order_item` VALUES (375, '196', '19', '1', '1');
INSERT INTO `order_item` VALUES (376, '196', '21', '1', '1');
INSERT INTO `order_item` VALUES (377, '197', '30', '1', '0');
INSERT INTO `order_item` VALUES (378, '197', '19', '1', '0');
INSERT INTO `order_item` VALUES (379, '197', '12', '1', '0');
INSERT INTO `order_item` VALUES (380, '198', '30', '1', '1');
INSERT INTO `order_item` VALUES (381, '198', '12', '1', '1');
INSERT INTO `order_item` VALUES (382, '198', '19', '1', '1');
INSERT INTO `order_item` VALUES (383, '199', '30', '1', '1');
INSERT INTO `order_item` VALUES (384, '199', '19', '1', '1');
INSERT INTO `order_item` VALUES (385, '199', '2', '1', '1');
INSERT INTO `order_item` VALUES (386, '200', '30', '1', '0');
INSERT INTO `order_item` VALUES (387, '200', '19', '1', '0');
INSERT INTO `order_item` VALUES (388, '201', '30', '1', '0');
INSERT INTO `order_item` VALUES (389, '201', '19', '1', '1');
INSERT INTO `order_item` VALUES (390, '201', '2', '1', '0');
INSERT INTO `order_item` VALUES (391, '202', '30', '1', '0');
INSERT INTO `order_item` VALUES (392, '202', '19', '1', '0');
INSERT INTO `order_item` VALUES (393, '203', '30', '1', '1');
INSERT INTO `order_item` VALUES (394, '203', '1', '1', '0');
INSERT INTO `order_item` VALUES (395, '203', '19', '1', '0');
INSERT INTO `order_item` VALUES (396, '204', '30', '2', '1');
INSERT INTO `order_item` VALUES (397, '204', '1', '1', '0');
INSERT INTO `order_item` VALUES (398, '204', '19', '1', '0');
INSERT INTO `order_item` VALUES (399, '205', '30', '1', '1');
INSERT INTO `order_item` VALUES (400, '205', '19', '1', '0');
INSERT INTO `order_item` VALUES (401, '206', '30', '1', '1');
INSERT INTO `order_item` VALUES (402, '206', '12', '1', '0');
INSERT INTO `order_item` VALUES (403, '206', '19', '1', '0');
INSERT INTO `order_item` VALUES (404, '207', '30', '1', '1');
INSERT INTO `order_item` VALUES (405, '207', '19', '1', '0');
INSERT INTO `order_item` VALUES (406, '208', '30', '1', '1');
INSERT INTO `order_item` VALUES (407, '208', '19', '1', '0');
INSERT INTO `order_item` VALUES (408, '209', '30', '1', '1');
INSERT INTO `order_item` VALUES (409, '209', '19', '1', '1');
INSERT INTO `order_item` VALUES (410, '210', '30', '1', '1');
INSERT INTO `order_item` VALUES (411, '210', '19', '1', '1');
INSERT INTO `order_item` VALUES (412, '211', '30', '1', '1');
INSERT INTO `order_item` VALUES (413, '211', '1', '1', '1');
INSERT INTO `order_item` VALUES (414, '211', '19', '1', '0');
INSERT INTO `order_item` VALUES (415, '212', '30', '1', '1');
INSERT INTO `order_item` VALUES (416, '212', '1', '1', '1');
INSERT INTO `order_item` VALUES (417, '212', '21', '1', '0');
INSERT INTO `order_item` VALUES (418, '213', '30', '1', '1');
INSERT INTO `order_item` VALUES (419, '213', '1', '1', '1');
INSERT INTO `order_item` VALUES (420, '213', '19', '1', '0');
INSERT INTO `order_item` VALUES (421, '214', '30', '1', '1');
INSERT INTO `order_item` VALUES (422, '214', '12', '1', '1');
INSERT INTO `order_item` VALUES (423, '214', '19', '1', '0');
INSERT INTO `order_item` VALUES (424, '215', '12', '1', '1');
INSERT INTO `order_item` VALUES (425, '215', '1', '1', '1');
INSERT INTO `order_item` VALUES (426, '216', '19', '1', '1');
INSERT INTO `order_item` VALUES (427, '216', '30', '1', '0');
INSERT INTO `order_item` VALUES (428, '216', '12', '1', '1');
INSERT INTO `order_item` VALUES (429, '217', '19', '1', '1');
INSERT INTO `order_item` VALUES (430, '217', '1', '1', '1');
INSERT INTO `order_item` VALUES (431, '218', '30', '1', '1');
INSERT INTO `order_item` VALUES (432, '218', '12', '1', '1');
INSERT INTO `order_item` VALUES (433, '218', '19', '1', '1');
INSERT INTO `order_item` VALUES (434, '219', '30', '1', '1');
INSERT INTO `order_item` VALUES (435, '219', '12', '2', '1');
INSERT INTO `order_item` VALUES (436, '220', '30', '1', '0');
INSERT INTO `order_item` VALUES (437, '220', '19', '1', '0');
INSERT INTO `order_item` VALUES (438, '220', '21', '1', '0');
INSERT INTO `order_item` VALUES (439, '221', '30', '1', '1');
INSERT INTO `order_item` VALUES (440, '221', '12', '1', '0');
INSERT INTO `order_item` VALUES (441, '221', '19', '1', '0');
INSERT INTO `order_item` VALUES (442, '222', '30', '1', '0');
INSERT INTO `order_item` VALUES (443, '222', '19', '1', '0');
INSERT INTO `order_item` VALUES (444, '223', '30', '1', '0');
INSERT INTO `order_item` VALUES (445, '223', '1', '1', '0');
INSERT INTO `order_item` VALUES (446, '223', '19', '1', '0');
INSERT INTO `order_item` VALUES (447, '224', '52', '2', '0');
INSERT INTO `order_item` VALUES (448, '225', '52', '2', '0');
INSERT INTO `order_item` VALUES (449, '226', '52', '2', '0');
INSERT INTO `order_item` VALUES (450, '227', '52', '2', '0');
INSERT INTO `order_item` VALUES (451, '228', '52', '6', '0');
INSERT INTO `order_item` VALUES (452, '229', '52', '3', '0');
INSERT INTO `order_item` VALUES (453, '230', '52', '2', '0');
INSERT INTO `order_item` VALUES (454, '231', '52', '2', '0');
INSERT INTO `order_item` VALUES (455, '232', '52', '4', '0');
INSERT INTO `order_item` VALUES (456, '233', '28', '4', '0');
INSERT INTO `order_item` VALUES (457, '234', '28', '100', '0');
INSERT INTO `order_item` VALUES (458, '235', '6', '100', '1');
INSERT INTO `order_item` VALUES (459, '236', '6', '100', '0');
INSERT INTO `order_item` VALUES (460, '237', '52', '3', '0');
INSERT INTO `order_item` VALUES (461, '238', '52', '6', '0');
INSERT INTO `order_item` VALUES (462, '239', '52', '4', '0');
INSERT INTO `order_item` VALUES (463, '240', '52', '12', '0');
INSERT INTO `order_item` VALUES (464, '241', '52', '4', '1');
INSERT INTO `order_item` VALUES (465, '242', '52', '100', '0');
INSERT INTO `order_item` VALUES (466, '243', '52', '66', '0');
INSERT INTO `order_item` VALUES (467, '244', '52', '99', '0');
INSERT INTO `order_item` VALUES (468, '245', '52', '55', '0');
INSERT INTO `order_item` VALUES (469, '246', '52', '4', '0');
INSERT INTO `order_item` VALUES (470, '247', '52', '5', '0');
INSERT INTO `order_item` VALUES (471, '248', '30', '1', '0');
INSERT INTO `order_item` VALUES (472, '249', '52', '1', '0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `o_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:已下单 1:待付款 2：已结账',
  `de_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_total` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `od_count` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '00001', '2017-11-11 10:00', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (2, '00002', '2017-11-11 10:10', '1', '3', '255', '2');
INSERT INTO `orders` VALUES (3, '00003', '2017-11-11 10:20', '1', '3', '232', '1');
INSERT INTO `orders` VALUES (8, '00004', '2017-11-11 18:00', '1', '7', '233', '2');
INSERT INTO `orders` VALUES (10, '151058082510048', '2017-11-13 21:47:05', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (11, '151058088425158', '2017-11-13 21:48:04', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (12, '151058103272538', '2017-11-13 21:50:32', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (13, '151058121526066', '2017-11-13 21:53:35', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (14, '151058128579820', '2017-11-13 21:54:45', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (15, '151058160630556', '2017-11-13 22:00:06', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (16, '151058174429095', '2017-11-13 22:02:24', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (17, '151058211262803', '2017-11-13 22:08:32', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (18, '151062667938958', '2017-11-14 10:31:19', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (19, '151062683022118', '2017-11-14 10:33:50', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (20, '151062714017164', '2017-11-14 10:39:00', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (21, '151062781280789', '2017-11-14 10:50:12', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (22, '151062797872131', '2017-11-14 10:52:58', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (23, '151064004670266', '2017-11-14 14:14:06', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (24, '151064223200413', '2017-11-14 14:50:32', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (25, '151064260900052', '2017-11-14 14:56:49', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (26, '151064288856795', '2017-11-14 15:01:28', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (27, '151064291667761', '2017-11-14 15:01:56', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (28, '151064293426675', '2017-11-14 15:02:14', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (29, '151064513187733', '2017-11-14 15:38:51', '1', '1', '143', '3');
INSERT INTO `orders` VALUES (30, '151064644507016', '2017-11-14 16:00:45', '0', '1', '143', '3');
INSERT INTO `orders` VALUES (31, '151071142005296', '2017-11-15 10:03:40', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (32, '151071206120992', '2017-11-15 10:14:21', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (33, '151071215797237', '2017-11-15 10:15:57', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (34, '151071217884168', '2017-11-15 10:16:18', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (35, '151071223455153', '2017-11-15 10:17:14', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (36, '151071322541551', '2017-11-15 10:33:45', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (37, '151071408806181', '2017-11-15 10:48:08', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (38, '151071410950003', '2017-11-15 10:48:29', '0', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (39, '151071753832553', '2017-11-15 11:45:38', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (40, '151071779114376', '2017-11-15 11:49:51', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (41, '151071779803286', '2017-11-15 11:49:58', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (42, '151071794499918', '2017-11-15 11:52:24', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (43, '151071815941509', '2017-11-15 11:55:59', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (44, '151071836205315', '2017-11-15 11:59:22', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (45, '151071838903096', '2017-11-15 11:59:49', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (46, '151071866662756', '2017-11-15 12:04:26', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (47, '151071867114194', '2017-11-15 12:04:31', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (48, '151071871731220', '2017-11-15 12:05:17', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (49, '151071873136790', '2017-11-15 12:05:31', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (50, '151071883334921', '2017-11-15 12:07:13', '0', '6', '53', '3');
INSERT INTO `orders` VALUES (51, '151071885126506', '2017-11-15 12:07:31', '0', '7', '40', '3');
INSERT INTO `orders` VALUES (52, '151071886789325', '2017-11-15 12:07:47', '0', '8', '80', '6');
INSERT INTO `orders` VALUES (53, '151071888876567', '2017-11-15 12:08:08', '0', '12', '0', '0');
INSERT INTO `orders` VALUES (54, '151071892457455', '2017-11-15 12:08:44', '0', '11', '0', '0');
INSERT INTO `orders` VALUES (55, '151071892944052', '2017-11-15 12:08:49', '0', '8', '40', '3');
INSERT INTO `orders` VALUES (56, '151071897922096', '2017-11-15 12:09:39', '0', '7', '40', '3');
INSERT INTO `orders` VALUES (57, '151071898772811', '2017-11-15 12:09:47', '0', '10', '84', '6');
INSERT INTO `orders` VALUES (58, '151071899214126', '2017-11-15 12:09:52', '0', '1', '0', '0');
INSERT INTO `orders` VALUES (59, '151071900501354', '2017-11-15 12:10:05', '0', '11', '93', '6');
INSERT INTO `orders` VALUES (60, '151071901079102', '2017-11-15 12:10:10', '0', '4', '89', '6');
INSERT INTO `orders` VALUES (61, '151071917467636', '2017-11-15 12:12:54', '0', '6', '40', '3');
INSERT INTO `orders` VALUES (62, '151072231223016', '2017-11-15 13:05:12', '0', '8', '0', '0');
INSERT INTO `orders` VALUES (63, '151072232787805', '2017-11-15 13:05:27', '0', '8', '40', '3');
INSERT INTO `orders` VALUES (64, '151072234205790', '2017-11-15 13:05:42', '0', '3', '40', '3');
INSERT INTO `orders` VALUES (65, '151072238595814', '2017-11-15 13:06:25', '0', '3', '40', '3');
INSERT INTO `orders` VALUES (66, '151072258925388', '2017-11-15 13:09:49', '0', '6', '28', '2');
INSERT INTO `orders` VALUES (67, '151072275721725', '2017-11-15 13:12:37', '0', '8', '28', '2');
INSERT INTO `orders` VALUES (68, '151072281814050', '2017-11-15 13:13:38', '0', '10', '28', '2');
INSERT INTO `orders` VALUES (69, '151072285983993', '2017-11-15 13:14:19', '0', '12', '28', '2');
INSERT INTO `orders` VALUES (70, '151072295275564', '2017-11-15 13:15:52', '0', '4', '28', '2');
INSERT INTO `orders` VALUES (71, '151072300629419', '2017-11-15 13:16:46', '0', '14', '28', '2');
INSERT INTO `orders` VALUES (72, '151072303399008', '2017-11-15 13:17:13', '0', '2', '28', '2');
INSERT INTO `orders` VALUES (73, '151072311105929', '2017-11-15 13:18:31', '0', '3', '28', '2');
INSERT INTO `orders` VALUES (74, '151072314373276', '2017-11-15 13:19:03', '0', '5', '28', '2');
INSERT INTO `orders` VALUES (75, '151072324927472', '2017-11-15 13:20:49', '0', '7', '28', '2');
INSERT INTO `orders` VALUES (76, '151072335689740', '2017-11-15 13:22:36', '0', '9', '28', '2');
INSERT INTO `orders` VALUES (77, '151072340411427', '2017-11-15 13:23:24', '0', '11', '28', '2');
INSERT INTO `orders` VALUES (78, '151072345250145', '2017-11-15 13:24:12', '0', '13', '28', '2');
INSERT INTO `orders` VALUES (79, '151072371959636', '2017-11-15 13:28:39', '0', '7', '28', '2');
INSERT INTO `orders` VALUES (80, '151072374075985', '2017-11-15 13:29:00', '0', '3', '36', '3');
INSERT INTO `orders` VALUES (81, '151072437307211', '2017-11-15 13:39:33', '0', '6', '28', '2');
INSERT INTO `orders` VALUES (82, '151072458735067', '2017-11-15 13:43:07', '0', '5', '28', '2');
INSERT INTO `orders` VALUES (83, '151072461764818', '2017-11-15 13:43:37', '0', '8', '28', '2');
INSERT INTO `orders` VALUES (84, '151072475961714', '2017-11-15 13:45:59', '0', '4', '28', '2');
INSERT INTO `orders` VALUES (85, '151072584225845', '2017-11-15 14:04:02', '0', '2', '28', '2');
INSERT INTO `orders` VALUES (86, '151072607157724', '2017-11-15 14:07:51', '0', '1', '28', '2');
INSERT INTO `orders` VALUES (87, '151072629744156', '2017-11-15 14:11:37', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (88, '151072630754020', '2017-11-15 14:11:47', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (89, '151072633297235', '2017-11-15 14:12:12', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (90, '151072658101910', '2017-11-15 14:16:21', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (91, '151072658637542', '2017-11-15 14:16:26', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (92, '151072662234775', '2017-11-15 14:17:02', '0', '3', '44', '3');
INSERT INTO `orders` VALUES (93, '151072676646527', '2017-11-15 14:19:26', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (94, '151072676851926', '2017-11-15 14:19:28', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (95, '151072676988500', '2017-11-15 14:19:29', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (96, '151072693098481', '2017-11-15 14:22:10', '0', '3', '28', '2');
INSERT INTO `orders` VALUES (97, '151072743645704', '2017-11-15 14:30:36', '0', '3', '28', '2');
INSERT INTO `orders` VALUES (98, '151072749167449', '2017-11-15 14:31:31', '0', '3', '28', '2');
INSERT INTO `orders` VALUES (99, '151072756177597', '2017-11-15 14:32:41', '0', '3', '28', '2');
INSERT INTO `orders` VALUES (100, '151072759142778', '2017-11-15 14:33:11', '0', '3', '28', '2');
INSERT INTO `orders` VALUES (101, '151072793323912', '2017-11-15 14:38:53', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (102, '151072823789272', '2017-11-15 14:43:57', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (103, '151072826175307', '2017-11-15 14:44:21', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (104, '151072835069950', '2017-11-15 14:45:50', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (105, '151072845003395', '2017-11-15 14:47:30', '0', '3', '33', '2');
INSERT INTO `orders` VALUES (106, '151072851134258', '2017-11-15 14:48:31', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (107, '151072877847126', '2017-11-15 14:52:58', '0', '2', '0', '0');
INSERT INTO `orders` VALUES (108, '151072879002782', '2017-11-15 14:53:10', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (109, '151072883017359', '2017-11-15 14:53:50', '0', '4', '0', '0');
INSERT INTO `orders` VALUES (110, '151072885512162', '2017-11-15 14:54:15', '0', '3', '0', '0');
INSERT INTO `orders` VALUES (111, '151072923807079', '2017-11-15 15:00:38', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (114, '151073064855850', '2017-11-15 15:24:08', '0', '8', '37', '2');
INSERT INTO `orders` VALUES (115, '151073100486188', '2017-11-15 15:30:04', '0', '4', '0', '0');
INSERT INTO `orders` VALUES (116, '151073107661319', '2017-11-15 15:31:16', '0', '7', '33', '2');
INSERT INTO `orders` VALUES (117, '151073109550138', '2017-11-15 15:31:35', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (118, '151073113362502', '2017-11-15 15:32:13', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (119, '151073113619003', '2017-11-15 15:32:16', '0', NULL, '0', '0');
INSERT INTO `orders` VALUES (120, '151073114293975', '2017-11-15 15:32:22', '0', '7', '37', '2');
INSERT INTO `orders` VALUES (121, '151073206507139', '2017-11-15 15:47:45', '0', '7', '117', '6');
INSERT INTO `orders` VALUES (122, '151073308653277', '2017-11-15 16:04:46', '0', '7', '37', '2');
INSERT INTO `orders` VALUES (128, '151075411525101', '2017-11-15 21:55:15', '0', '2', '37', '2');
INSERT INTO `orders` VALUES (129, '151075479450030', '2017-11-15 22:06:34', '0', '6', '37', '2');
INSERT INTO `orders` VALUES (131, '151075559462461', '2017-11-15 22:19:54', '0', '6', '37', '2');
INSERT INTO `orders` VALUES (132, '151075608063794', '2017-11-15 22:28:00', '0', '3', '37', '2');
INSERT INTO `orders` VALUES (133, '151075660139833', '2017-11-15 22:36:41', '0', '3', '33', '2');
INSERT INTO `orders` VALUES (134, '151075660619906', '2017-11-15 22:36:46', '0', '3', '0', '0');
INSERT INTO `orders` VALUES (135, '151075660915862', '2017-11-15 22:36:49', '0', '3', '0', '0');
INSERT INTO `orders` VALUES (136, '151075673374189', '2017-11-15 22:38:53', '0', '3', '21', '1');
INSERT INTO `orders` VALUES (137, '151075722632605', '2017-11-15 22:47:06', '0', '7', '33', '2');
INSERT INTO `orders` VALUES (138, '151079488651667', '2017-11-16 09:14:46', '0', '7', '37', '2');
INSERT INTO `orders` VALUES (139, '151079510841313', '2017-11-16 09:18:28', '0', '1', '33', '2');
INSERT INTO `orders` VALUES (140, '151079562860634', '2017-11-16 09:27:08', '0', '7', '37', '2');
INSERT INTO `orders` VALUES (141, '151079664896431', '2017-11-16 09:44:08', '0', '6', '16', '1');
INSERT INTO `orders` VALUES (142, '151079672759742', '2017-11-16 09:45:27', '0', '6', '16', '1');
INSERT INTO `orders` VALUES (143, '151079674623589', '2017-11-16 09:45:46', '0', '6', '12', '1');
INSERT INTO `orders` VALUES (144, '151079684831001', '2017-11-16 09:47:28', '0', '6', '37', '2');
INSERT INTO `orders` VALUES (145, '151079689559684', '2017-11-16 09:48:15', '0', '6', '33', '2');
INSERT INTO `orders` VALUES (146, '151079758389037', '2017-11-16 09:59:43', '0', '4', '37', '2');
INSERT INTO `orders` VALUES (147, '151079796853579', '2017-11-16 10:06:08', '0', '6', '33', '2');
INSERT INTO `orders` VALUES (148, '151079806815138', '2017-11-16 10:07:48', '0', '6', '37', '2');
INSERT INTO `orders` VALUES (149, '151090559997706', '2017-11-17 15:59:59', '0', '6', '58', '2');
INSERT INTO `orders` VALUES (150, '151090561812716', '2017-11-17 16:00:18', '0', '12', '82', '7');
INSERT INTO `orders` VALUES (151, '151090563801833', '2017-11-17 16:00:38', '2', '6', '6', '3');
INSERT INTO `orders` VALUES (152, '151090571806670', '2017-11-17 16:01:58', '2', '6', '233', '2');
INSERT INTO `orders` VALUES (153, '151090572398808', '2017-11-17 16:02:03', '0', '1', '290', '6');
INSERT INTO `orders` VALUES (154, '151090572752496', '2017-11-17 16:02:07', '2', '7', '54', '2');
INSERT INTO `orders` VALUES (155, '151090573179313', '2017-11-17 16:02:11', '0', '10', '14', '2');
INSERT INTO `orders` VALUES (156, '151090573449545', '2017-11-17 16:02:14', '2', '8', '247', '2');
INSERT INTO `orders` VALUES (157, '151090573978057', '2017-11-17 16:02:19', '0', '11', '938', '6');
INSERT INTO `orders` VALUES (158, '151090623454304', '2017-11-17 16:10:34', '0', '4', '245', '3');
INSERT INTO `orders` VALUES (159, '151090623848872', '2017-11-17 16:10:38', '0', '6', '289', '3');
INSERT INTO `orders` VALUES (160, '151090632331075', '2017-11-17 16:12:03', '2', '6', '255', '3');
INSERT INTO `orders` VALUES (161, '151090632702653', '2017-11-17 16:12:07', '0', '9', '70', '3');
INSERT INTO `orders` VALUES (162, '151090633060840', '2017-11-17 16:12:10', '0', '1', '289', '3');
INSERT INTO `orders` VALUES (163, '151090633375453', '2017-11-17 16:12:13', '0', '12', '693', '3');
INSERT INTO `orders` VALUES (164, '151090635607979', '2017-11-17 16:12:36', '0', '6', '259', '3');
INSERT INTO `orders` VALUES (165, '151090635928051', '2017-11-17 16:12:39', '0', '7', '79', '3');
INSERT INTO `orders` VALUES (166, '151090636614947', '2017-11-17 16:12:46', '2', '12', '2', '1');
INSERT INTO `orders` VALUES (167, '151090638829996', '2017-11-17 16:13:08', '0', '4', '265', '4');
INSERT INTO `orders` VALUES (168, '151090639446703', '2017-11-17 16:13:14', '0', '10', '233', '2');
INSERT INTO `orders` VALUES (169, '151090639751236', '2017-11-17 16:13:17', '0', '6', '243', '2');
INSERT INTO `orders` VALUES (170, '151090673028952', '2017-11-17 16:18:50', '0', '5', '254', '3');
INSERT INTO `orders` VALUES (171, '151090673303730', '2017-11-17 16:18:53', '0', '12', '268', '3');
INSERT INTO `orders` VALUES (172, '151090673964082', '2017-11-17 16:18:59', '0', '10', '79', '3');
INSERT INTO `orders` VALUES (173, '151090676120704', '2017-11-17 16:19:21', '0', '5', '268', '3');
INSERT INTO `orders` VALUES (174, '151090676732432', '2017-11-17 16:19:27', '0', '11', '259', '3');
INSERT INTO `orders` VALUES (175, '151090694302259', '2017-11-17 16:22:23', '0', '5', '245', '3');
INSERT INTO `orders` VALUES (176, '151090694602829', '2017-11-17 16:22:26', '0', '12', '285', '3');
INSERT INTO `orders` VALUES (177, '151090696090647', '2017-11-17 16:22:40', '0', '8', '56', '3');
INSERT INTO `orders` VALUES (178, '151090696389161', '2017-11-17 16:22:43', '0', '6', '79', '3');
INSERT INTO `orders` VALUES (179, '151090696765682', '2017-11-17 16:22:47', '0', '10', '273', '2');
INSERT INTO `orders` VALUES (180, '151090710095064', '2017-11-17 16:25:00', '0', '5', '294', '3');
INSERT INTO `orders` VALUES (181, '151090710552136', '2017-11-17 16:25:05', '0', '9', '233', '2');
INSERT INTO `orders` VALUES (182, '151090711665582', '2017-11-17 16:25:16', '0', '5', '49', '3');
INSERT INTO `orders` VALUES (183, '151090712057214', '2017-11-17 16:25:20', '0', '10', '56', '3');
INSERT INTO `orders` VALUES (184, '151090716124927', '2017-11-17 16:26:01', '0', '5', '130', '7');
INSERT INTO `orders` VALUES (185, '151090716426300', '2017-11-17 16:26:04', '0', '11', '54', '2');
INSERT INTO `orders` VALUES (186, '151090725872613', '2017-11-17 16:27:38', '0', '5', '268', '3');
INSERT INTO `orders` VALUES (187, '151090727116324', '2017-11-17 16:27:51', '0', '6', '294', '3');
INSERT INTO `orders` VALUES (188, '151090727941266', '2017-11-17 16:27:59', '0', '10', '30', '3');
INSERT INTO `orders` VALUES (189, '151090729408640', '2017-11-17 16:28:14', '2', '8', '247', '2');
INSERT INTO `orders` VALUES (190, '151090730266647', '2017-11-17 16:28:22', '0', '9', '75', '3');
INSERT INTO `orders` VALUES (191, '151090737701131', '2017-11-17 16:29:37', '2', '5', '245', '3');
INSERT INTO `orders` VALUES (192, '151090738520621', '2017-11-17 16:29:45', '0', '6', '75', '3');
INSERT INTO `orders` VALUES (193, '151090739263242', '2017-11-17 16:29:52', '0', '4', '245', '3');
INSERT INTO `orders` VALUES (194, '151090744017895', '2017-11-17 16:30:40', '0', '2', '233', '2');
INSERT INTO `orders` VALUES (195, '151090748350857', '2017-11-17 16:31:23', '2', '12', '245', '3');
INSERT INTO `orders` VALUES (196, '151090748947092', '2017-11-17 16:31:29', '0', '10', '275', '3');
INSERT INTO `orders` VALUES (197, '151090752510121', '2017-11-17 16:32:05', '2', '11', '245', '3');
INSERT INTO `orders` VALUES (198, '151090752995493', '2017-11-17 16:32:09', '0', '9', '245', '3');
INSERT INTO `orders` VALUES (199, '151090763581580', '2017-11-17 16:33:55', '0', '5', '249', '3');
INSERT INTO `orders` VALUES (200, '151090767903118', '2017-11-17 16:34:39', '2', '8', '233', '2');
INSERT INTO `orders` VALUES (201, '151090769337217', '2017-11-17 16:34:53', '0', '9', '249', '3');
INSERT INTO `orders` VALUES (202, '151090793925784', '2017-11-17 16:38:59', '2', '11', '233', '2');
INSERT INTO `orders` VALUES (203, '151090794483553', '2017-11-17 16:39:04', '0', '12', '245', '3');
INSERT INTO `orders` VALUES (204, '151090797660498', '2017-11-17 16:39:36', '0', '5', '247', '4');
INSERT INTO `orders` VALUES (205, '151090820590664', '2017-11-17 16:43:25', '0', '6', '233', '2');
INSERT INTO `orders` VALUES (206, '151090839786058', '2017-11-17 16:46:37', '0', '4', '245', '3');
INSERT INTO `orders` VALUES (207, '151090851051642', '2017-11-17 16:48:30', '0', '3', '233', '2');
INSERT INTO `orders` VALUES (208, '151090871248532', '2017-11-17 16:51:52', '0', '2', '233', '2');
INSERT INTO `orders` VALUES (209, '151090881962992', '2017-11-17 16:53:39', '0', '1', '233', '2');
INSERT INTO `orders` VALUES (210, '151090886048227', '2017-11-17 16:54:20', '2', '7', '233', '2');
INSERT INTO `orders` VALUES (211, '151090889646557', '2017-11-17 16:54:56', '2', '5', '245', '3');
INSERT INTO `orders` VALUES (212, '151090890549351', '2017-11-17 16:55:05', '2', '6', '56', '3');
INSERT INTO `orders` VALUES (213, '151090891033360', '2017-11-17 16:55:10', '0', '11', '245', '3');
INSERT INTO `orders` VALUES (214, '151090899939036', '2017-11-17 16:56:39', '2', '3', '245', '3');
INSERT INTO `orders` VALUES (215, '151090900398720', '2017-11-17 16:56:43', '0', '6', '24', '2');
INSERT INTO `orders` VALUES (216, '151090901579176', '2017-11-17 16:56:55', '0', '6', '245', '3');
INSERT INTO `orders` VALUES (217, '151090901934127', '2017-11-17 16:56:59', '0', '3', '243', '2');
INSERT INTO `orders` VALUES (218, '151090909347625', '2017-11-17 16:58:13', '2', '4', '245', '3');
INSERT INTO `orders` VALUES (219, '151090917039414', '2017-11-17 16:59:30', '0', '9', '26', '3');
INSERT INTO `orders` VALUES (220, '151090917334283', '2017-11-17 16:59:33', '0', '8', '275', '3');
INSERT INTO `orders` VALUES (221, '151090951551242', '2017-11-17 17:05:15', '0', '4', '245', '3');
INSERT INTO `orders` VALUES (222, '151090999148124', '2017-11-17 17:13:11', '2', '5', '233', '2');
INSERT INTO `orders` VALUES (223, '151091066690522', '2017-11-17 17:24:26', '2', '5', '245', '3');
INSERT INTO `orders` VALUES (224, '151117895425264', '2017-11-20 19:55:54', '2', '2', '222', '2');
INSERT INTO `orders` VALUES (225, '151117897615780', '2017-11-20 19:56:16', '2', '5', '222', '2');
INSERT INTO `orders` VALUES (226, '151117903692124', '2017-11-20 19:57:16', '2', '5', '222', '2');
INSERT INTO `orders` VALUES (227, '151117946402882', '2017-11-20 20:04:24', '2', '1', '222', '2');
INSERT INTO `orders` VALUES (228, '151117947824444', '2017-11-20 20:04:38', '2', '1', '666', '6');
INSERT INTO `orders` VALUES (229, '151117955109818', '2017-11-20 20:05:51', '0', '1', '333', '3');
INSERT INTO `orders` VALUES (230, '151118026185733', '2017-11-20 20:17:41', '0', '2', '222', '2');
INSERT INTO `orders` VALUES (231, '151118030469177', '2017-11-20 20:18:24', '0', '1', '222', '2');
INSERT INTO `orders` VALUES (232, '151118052741731', '2017-11-20 20:22:07', '2', '3', '444', '4');
INSERT INTO `orders` VALUES (233, '151118066512632', '2017-11-20 20:24:25', '0', '3', '8', '4');
INSERT INTO `orders` VALUES (234, '151118072109302', '2017-11-20 20:25:21', '0', '4', '200', '100');
INSERT INTO `orders` VALUES (235, '151118110013914', '2017-11-20 20:31:40', '2', '5', '1100', '100');
INSERT INTO `orders` VALUES (236, '151118112332883', '2017-11-20 20:32:03', '0', '5', '1100', '100');
INSERT INTO `orders` VALUES (237, '151118197801484', '2017-11-20 20:46:18', '0', '6', '333', '3');
INSERT INTO `orders` VALUES (238, '151118200423843', '2017-11-20 20:46:44', '0', '7', '666', '6');
INSERT INTO `orders` VALUES (239, '151118214197448', '2017-11-20 20:49:01', '0', '8', '444', '4');
INSERT INTO `orders` VALUES (240, '151118218092986', '2017-11-20 20:49:40', '0', '11', '1332', '12');
INSERT INTO `orders` VALUES (241, '151118221617914', '2017-11-20 20:50:16', '0', '12', '444', '4');
INSERT INTO `orders` VALUES (242, '151118232597083', '2017-11-20 20:52:05', '0', '13', '11100', '100');
INSERT INTO `orders` VALUES (243, '151118244863017', '2017-11-20 20:54:08', '0', '10', '7326', '66');
INSERT INTO `orders` VALUES (244, '151118275818056', '2017-11-20 20:59:18', '2', '2', '10989', '99');
INSERT INTO `orders` VALUES (245, '151118826575187', '2017-11-20 22:31:05', '2', '5', '6105', '55');
INSERT INTO `orders` VALUES (246, '151118928922322', '2017-11-20 22:48:09', '2', '6', '444', '4');
INSERT INTO `orders` VALUES (247, '151118937912685', '2017-11-20 22:49:39', '2', '6', '555', '5');
INSERT INTO `orders` VALUES (248, '151119318361754', '2017-11-20 23:53:03', '2', '1', '2', '1');
INSERT INTO `orders` VALUES (249, '151119401020343', '2017-11-21 00:06:50', '2', '1', '111', '1');

SET FOREIGN_KEY_CHECKS = 1;
