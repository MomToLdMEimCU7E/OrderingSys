/*
 Navicat Premium Data Transfer

 Source Server         : MyLink
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : orders

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 03/05/2023 18:38:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for group_class
-- ----------------------------
DROP TABLE IF EXISTS `group_class`;
CREATE TABLE `group_class`  (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `teacher_uid` int NULL DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进行到了第几年',
  `last_meeting_id` int NULL DEFAULT NULL COMMENT '上一次订货会的id',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_class
-- ----------------------------
INSERT INTO `group_class` VALUES (1, 1, '2023-1-周二345', '2', 4);
INSERT INTO `group_class` VALUES (2, 1, '2022-2-周一345', '1', 6);
INSERT INTO `group_class` VALUES (3, 1, '2021-2-周一345', '1', 100002);

-- ----------------------------
-- Table structure for market
-- ----------------------------
DROP TABLE IF EXISTS `market`;
CREATE TABLE `market`  (
  `market_id` int NOT NULL,
  `market_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `market_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `market_open_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`market_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of market
-- ----------------------------
INSERT INTO `market` VALUES (1, 'P1', '本地', '1-2-3-4-5-6');
INSERT INTO `market` VALUES (2, 'P2', '本地', '2-3-4-5-6');
INSERT INTO `market` VALUES (3, 'P3', '本地', '2-3-4-5-6');
INSERT INTO `market` VALUES (4, 'P4', '本地', '5-6');
INSERT INTO `market` VALUES (5, 'P1', '区域', '2-3-4-5-6');
INSERT INTO `market` VALUES (6, 'P2', '区域', '2-3-4-5-6');
INSERT INTO `market` VALUES (7, 'P3', '区域', '3-4-5-6');
INSERT INTO `market` VALUES (8, 'P4', '区域', '4-5-6');
INSERT INTO `market` VALUES (9, 'P1', '国内', '3-4-5-6');
INSERT INTO `market` VALUES (10, 'P2', '国内', '3-4-5-6');
INSERT INTO `market` VALUES (11, 'P3', '国内', '3-4-5-6');
INSERT INTO `market` VALUES (12, 'P4', '国内', '5-6');
INSERT INTO `market` VALUES (13, 'P1', '亚洲', '4-5-6');
INSERT INTO `market` VALUES (14, 'P2', '亚洲', '4-5-6');
INSERT INTO `market` VALUES (15, 'P3', '亚洲', '4-5-6');
INSERT INTO `market` VALUES (16, 'P4', '亚洲', '5-6');
INSERT INTO `market` VALUES (17, 'P1', '国际', '5-6');
INSERT INTO `market` VALUES (18, 'P2', '国际', '5-6');
INSERT INTO `market` VALUES (19, 'P3', '国际', '6');
INSERT INTO `market` VALUES (20, 'P4', '国际', '');

-- ----------------------------
-- Table structure for market_after
-- ----------------------------
DROP TABLE IF EXISTS `market_after`;
CREATE TABLE `market_after`  (
  `market_after_id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NULL DEFAULT NULL COMMENT '对应哪次订货会',
  `market_id` int NULL DEFAULT NULL,
  `boss_uid` int NULL DEFAULT NULL,
  PRIMARY KEY (`market_after_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of market_after
-- ----------------------------
INSERT INTO `market_after` VALUES (2, 3, 1, 2);
INSERT INTO `market_after` VALUES (3, 3, 2, 1);
INSERT INTO `market_after` VALUES (4, 3, 5, 1);
INSERT INTO `market_after` VALUES (23, 4, 1, 2);
INSERT INTO `market_after` VALUES (24, 4, 2, 3);
INSERT INTO `market_after` VALUES (25, 4, 3, 3);
INSERT INTO `market_after` VALUES (26, 4, 1, 2);
INSERT INTO `market_after` VALUES (27, 4, 2, 3);
INSERT INTO `market_after` VALUES (28, 4, 3, 3);
INSERT INTO `market_after` VALUES (29, 6, 1, 3);
INSERT INTO `market_after` VALUES (30, 100002, 2, 4);
INSERT INTO `market_after` VALUES (31, 100002, 2, 4);
INSERT INTO `market_after` VALUES (32, 100002, 2, 4);
INSERT INTO `market_after` VALUES (33, 100002, 2, 4);
INSERT INTO `market_after` VALUES (34, 100002, 2, 4);
INSERT INTO `market_after` VALUES (35, 100002, 2, 4);

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`  (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `meeting_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年份',
  `teacher_uid` int NULL DEFAULT NULL COMMENT '创建教师的uid',
  `group_id` int NULL DEFAULT NULL COMMENT '第几组的会议',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订货会状态',
  PRIMARY KEY (`meeting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES (3, 'group1meeting1', '1', 1, 1, '已结束');
INSERT INTO `meeting` VALUES (4, 'group1meeting2', '2', 1, 1, '投放广告中');
INSERT INTO `meeting` VALUES (6, 'gourp2meeting1', '1', 1, 2, '已结束');
INSERT INTO `meeting` VALUES (100000, 'test', '1', 1, 3, '选单中');
INSERT INTO `meeting` VALUES (100002, 'test', '1', 1, 3, '选单中');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单编号',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年度',
  `product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `market` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市场名称',
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '期数',
  `iso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `urgent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '加急订单',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('B0001', '1', 'P1', '本地', '4', 5.50, 22.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0002', '1', 'P1', '本地', '5', 5.20, 26.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0003', '1', 'P1', '本地', '3', 5.70, 17.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0004', '1', 'P1', '本地', '3', 5.00, 15.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0005', '1', 'P1', '本地', '2', 5.00, 10.00, '0', NULL, '');
INSERT INTO `orders` VALUES ('B0006', '1', 'P1', '本地', '4', 5.80, 23.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0007', '1', 'P1', '本地', '6', 5.30, 32.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0008', '1', 'P1', '本地', '2', 5.50, 11.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0009', '1', 'P1', '本地', '5', 4.80, 24.00, '1', NULL, '');
INSERT INTO `orders` VALUES ('B0010', '1', 'P1', '本地', '7', 4.90, 34.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0011', '1', 'P1', '本地', '6', 5.20, 31.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0012', '1', 'P1', '本地', '5', 5.00, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0013', '2', 'P1', '本地', '2', 5.00, 10.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0014', '2', 'P1', '本地', '4', 5.50, 22.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0015', '2', 'P1', '本地', '4', 4.80, 19.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0016', '2', 'P1', '本地', '5', 5.00, 25.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0017', '2', 'P1', '本地', '5', 5.20, 26.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0018', '2', 'P1', '本地', '6', 5.00, 30.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0019', '2', 'P1', '本地', '4', 5.30, 21.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0020', '2', 'P1', '本地', '3', 4.60, 14.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0021', '2', 'P1', '本地', '3', 5.30, 16.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0022', '2', 'P1', '本地', '2', 5.00, 10.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0023', '2', 'P1', '本地', '2', 5.50, 11.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0024', '2', 'P1', '本地', '4', 4.50, 18.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0025', '2', 'P1', '区域', '2', 4.50, 9.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0026', '2', 'P1', '区域', '3', 4.70, 14.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0027', '2', 'P1', '区域', '1', 5.00, 5.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0028', '2', 'P1', '区域', '3', 5.00, 15.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0029', '2', 'P1', '区域', '2', 4.50, 9.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0030', '2', 'P1', '区域', '3', 4.30, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0031', '2', 'P2', '本地', '1', 7.00, 7.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0032', '2', 'P2', '本地', '2', 6.00, 12.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0033', '2', 'P2', '本地', '1', 6.00, 6.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0034', '2', 'P2', '本地', '1', 6.00, 6.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0035', '2', 'P2', '本地', '2', 7.50, 15.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0036', '2', 'P2', '本地', '2', 6.50, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0037', '2', 'P2', '本地', '3', 6.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0038', '2', 'P2', '区域', '2', 7.50, 15.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0039', '2', 'P2', '区域', '1', 7.00, 7.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0040', '2', 'P2', '区域', '2', 7.50, 15.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0041', '2', 'P2', '区域', '1', 7.00, 7.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0042', '2', 'P2', '区域', '2', 7.50, 15.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0043', '2', 'P2', '区域', '3', 7.70, 23.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0044', '2', 'P2', '区域', '1', 8.00, 8.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0045', '2', 'P2', '区域', '1', 6.00, 6.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0046', '2', 'P3', '本地', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0047', '2', 'P3', '本地', '1', 8.00, 8.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0048', '2', 'P3', '本地', '2', 8.00, 16.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0049', '2', 'P3', '本地', '1', 8.00, 8.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0050', '2', 'P3', '本地', '2', 7.50, 15.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0051', '3', 'P1', '本地', '2', 5.00, 10.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0052', '3', 'P1', '本地', '5', 4.80, 24.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0053', '3', 'P1', '本地', '4', 4.70, 19.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0054', '3', 'P1', '本地', '3', 5.30, 16.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0055', '3', 'P1', '本地', '4', 5.00, 20.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0056', '3', 'P1', '本地', '2', 5.50, 11.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0057', '3', 'P1', '本地', '5', 4.60, 23.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0058', '3', 'P1', '本地', '4', 5.30, 21.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0059', '3', 'P1', '本地', '3', 4.70, 14.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0060', '3', 'P1', '本地', '5', 5.20, 26.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0061', '3', 'P1', '区域', '1', 5.00, 5.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0062', '3', 'P1', '区域', '1', 5.00, 5.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0063', '3', 'P1', '区域', '2', 5.50, 11.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0064', '3', 'P1', '区域', '2', 5.00, 10.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0065', '3', 'P1', '区域', '4', 5.00, 20.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0066', '3', 'P1', '国内', '3', 5.30, 16.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0067', '3', 'P1', '国内', '4', 4.80, 19.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0068', '3', 'P1', '国内', '2', 5.50, 11.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0069', '3', 'P1', '国内', '3', 5.30, 16.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0070', '3', 'P1', '国内', '1', 5.00, 5.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0071', '3', 'P1', '国内', '2', 5.50, 11.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0072', '3', 'P1', '国内', '4', 4.80, 19.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0073', '3', 'P1', '国内', '1', 5.00, 5.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0074', '3', 'P1', '国内', '3', 5.30, 16.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0075', '3', 'P1', '国内', '3', 5.00, 15.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0076', '3', 'P2', '本地', '2', 9.00, 18.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0077', '3', 'P2', '本地', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0078', '3', 'P2', '本地', '3', 8.60, 26.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0079', '3', 'P2', '本地', '4', 8.50, 33.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0080', '3', 'P2', '本地', '3', 8.30, 25.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0081', '3', 'P2', '本地', '2', 9.50, 19.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0082', '3', 'P2', '本地', '3', 8.70, 26.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0083', '3', 'P2', '本地', '4', 8.00, 32.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0084', '3', 'P2', '本地', '5', 8.00, 40.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0085', '3', 'P2', '本地', '2', 8.50, 17.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0086', '3', 'P2', '区域', '4', 7.30, 29.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0087', '3', 'P2', '区域', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0088', '3', 'P2', '区域', '2', 8.00, 16.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0089', '3', 'P2', '区域', '3', 8.30, 25.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0090', '3', 'P2', '区域', '2', 8.00, 16.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0091', '3', 'P2', '区域', '4', 8.30, 33.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0092', '3', 'P2', '区域', '3', 8.30, 25.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0093', '3', 'P2', '区域', '3', 7.70, 23.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0094', '3', 'P2', '国内', '1', 8.00, 8.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0095', '3', 'P2', '国内', '3', 9.00, 27.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0096', '3', 'P2', '国内', '2', 9.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0097', '3', 'P2', '国内', '4', 7.50, 30.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0098', '3', 'P2', '国内', '4', 8.00, 32.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0099', '3', 'P2', '国内', '2', 8.50, 17.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0100', '3', 'P2', '国内', '3', 7.70, 23.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0101', '3', 'P2', '国内', '1', 9.00, 9.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0102', '3', 'P2', '国内', '3', 8.00, 24.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0103', '3', 'P3', '本地', '2', 7.50, 15.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0104', '3', 'P3', '本地', '3', 7.40, 22.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0105', '3', 'P3', '本地', '1', 7.80, 8.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0106', '3', 'P3', '本地', '2', 8.00, 16.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0107', '3', 'P3', '本地', '2', 7.50, 15.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0108', '3', 'P3', '本地', '3', 7.00, 21.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0109', '3', 'P3', '区域', '2', 8.00, 16.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0110', '3', 'P3', '区域', '2', 9.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0111', '3', 'P3', '区域', '3', 8.70, 26.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0112', '3', 'P3', '区域', '3', 8.00, 24.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0113', '3', 'P3', '区域', '4', 8.50, 34.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0114', '3', 'P3', '区域', '2', 9.00, 18.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0115', '3', 'P3', '国内', '3', 7.70, 23.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0116', '3', 'P3', '国内', '3', 8.30, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0117', '3', 'P3', '国内', '5', 8.00, 40.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0118', '3', 'P3', '国内', '3', 9.00, 27.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0119', '3', 'P3', '国内', '4', 8.50, 34.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0120', '4', 'P1', '本地', '2', 5.00, 10.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0121', '4', 'P1', '本地', '3', 4.30, 13.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0122', '4', 'P1', '本地', '2', 4.50, 9.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0123', '4', 'P1', '本地', '5', 4.40, 22.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0124', '4', 'P1', '本地', '5', 4.30, 22.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0125', '4', 'P1', '本地', '1', 5.00, 5.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0126', '4', 'P1', '本地', '3', 4.40, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0127', '4', 'P1', '本地', '4', 4.70, 19.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0128', '4', 'P1', '本地', '2', 4.50, 9.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0129', '4', 'P1', '本地', '3', 5.00, 15.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0130', '4', 'P1', '本地', '2', 4.50, 9.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0131', '4', 'P1', '本地', '4', 4.70, 19.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0132', '4', 'P1', '区域', '1', 5.00, 5.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0133', '4', 'P1', '区域', '2', 4.50, 9.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0134', '4', 'P1', '区域', '1', 5.00, 5.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0135', '4', 'P1', '区域', '2', 4.50, 9.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0136', '4', 'P1', '区域', '2', 5.00, 10.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0137', '4', 'P1', '国内', '1', 4.00, 4.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0138', '4', 'P1', '国内', '2', 4.50, 9.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0139', '4', 'P1', '国内', '4', 4.30, 17.00, '4', NULL, '加急');
INSERT INTO `orders` VALUES ('B0140', '4', 'P1', '国内', '3', 4.30, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0141', '4', 'P1', '国内', '2', 4.50, 9.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0142', '4', 'P1', '国内', '4', 4.00, 16.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0143', '4', 'P1', '国内', '2', 5.00, 10.00, '4', NULL, '加急');
INSERT INTO `orders` VALUES ('B0144', '4', 'P1', '国内', '2', 4.00, 8.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0145', '4', 'P1', '国内', '3', 3.70, 11.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0146', '4', 'P1', '国内', '3', 4.40, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0147', '4', 'P1', '亚洲', '4', 4.50, 18.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0148', '4', 'P1', '亚洲', '3', 3.30, 10.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0149', '4', 'P1', '亚洲', '4', 3.80, 15.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0150', '4', 'P1', '亚洲', '2', 4.00, 8.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0151', '4', 'P1', '亚洲', '2', 4.00, 8.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0152', '4', 'P1', '亚洲', '2', 3.50, 7.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0153', '4', 'P1', '亚洲', '4', 4.00, 16.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0154', '4', 'P1', '亚洲', '1', 5.00, 5.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0155', '4', 'P1', '亚洲', '3', 5.00, 15.00, '3', 'ISO9000', '加急');
INSERT INTO `orders` VALUES ('B0156', '4', 'P1', '亚洲', '2', 4.50, 9.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0157', '4', 'P1', '亚洲', '2', 5.00, 10.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0158', '4', 'P2', '本地', '4', 8.50, 34.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0159', '4', 'P2', '本地', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0160', '4', 'P2', '本地', '3', 8.70, 26.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0161', '4', 'P2', '本地', '4', 9.00, 36.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0162', '4', 'P2', '本地', '2', 8.50, 17.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0163', '4', 'P2', '本地', '3', 9.00, 27.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0164', '4', 'P2', '本地', '4', 8.50, 34.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0165', '4', 'P2', '本地', '3', 9.40, 28.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0166', '4', 'P2', '本地', '3', 8.70, 26.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0167', '4', 'P2', '本地', '5', 8.60, 43.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0168', '4', 'P2', '区域', '5', 7.40, 37.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0169', '4', 'P2', '区域', '3', 7.30, 22.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0170', '4', 'P2', '区域', '2', 7.50, 15.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0171', '4', 'P2', '区域', '2', 7.00, 14.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0172', '4', 'P2', '区域', '4', 7.50, 30.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0173', '4', 'P2', '区域', '3', 7.30, 22.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0174', '4', 'P2', '区域', '4', 7.50, 30.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0175', '4', 'P2', '国内', '4', 8.30, 33.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0176', '4', 'P2', '国内', '5', 8.00, 40.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0177', '4', 'P2', '国内', '3', 8.70, 26.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0178', '4', 'P2', '国内', '4', 8.50, 34.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0179', '4', 'P2', '国内', '2', 9.00, 18.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0180', '4', 'P2', '国内', '4', 8.00, 32.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0181', '4', 'P2', '国内', '3', 8.00, 24.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0182', '4', 'P2', '国内', '2', 8.50, 17.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0183', '4', 'P2', '亚洲', '1', 7.00, 7.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0184', '4', 'P2', '亚洲', '3', 7.30, 22.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0185', '4', 'P2', '亚洲', '3', 6.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0186', '4', 'P2', '亚洲', '2', 6.50, 13.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0187', '4', 'P2', '亚洲', '4', 6.70, 27.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0188', '4', 'P2', '亚洲', '3', 6.60, 20.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0189', '4', 'P2', '亚洲', '4', 6.30, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0190', '4', 'P2', '亚洲', '3', 7.00, 21.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0191', '4', 'P2', '亚洲', '4', 7.00, 28.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0192', '4', 'P3', '本地', '5', 8.00, 40.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0193', '4', 'P3', '本地', '3', 9.00, 27.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0194', '4', 'P3', '本地', '4', 9.00, 36.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0195', '4', 'P3', '本地', '3', 9.30, 28.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0196', '4', 'P3', '本地', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0197', '4', 'P3', '本地', '2', 9.00, 18.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0198', '4', 'P3', '区域', '3', 7.60, 23.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0199', '4', 'P3', '区域', '2', 8.00, 16.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0200', '4', 'P3', '区域', '1', 8.00, 8.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0201', '4', 'P3', '区域', '2', 8.00, 16.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0202', '4', 'P3', '区域', '3', 8.30, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0203', '4', 'P3', '区域', '2', 8.50, 17.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0204', '4', 'P3', '国内', '3', 9.00, 27.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0205', '4', 'P3', '国内', '2', 8.50, 17.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0206', '4', 'P3', '国内', '5', 9.00, 45.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0207', '4', 'P3', '国内', '2', 8.50, 17.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0208', '4', 'P3', '国内', '4', 8.00, 32.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0209', '4', 'P3', '亚洲', '4', 10.30, 41.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0210', '4', 'P3', '亚洲', '5', 9.00, 45.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0211', '4', 'P3', '亚洲', '2', 9.50, 19.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0212', '4', 'P3', '亚洲', '2', 10.50, 21.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0213', '4', 'P3', '亚洲', '4', 9.30, 37.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0214', '4', 'P3', '亚洲', '3', 10.00, 20.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0215', '4', 'P4', '区域', '4', 10.50, 42.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0216', '4', 'P4', '区域', '4', 9.80, 39.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0217', '4', 'P4', '区域', '3', 10.30, 31.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0218', '5', 'P1', '本地', '4', 4.30, 17.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0219', '5', 'P1', '本地', '3', 3.30, 10.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0220', '5', 'P1', '本地', '2', 4.50, 9.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0221', '5', 'P1', '本地', '2', 4.00, 8.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0222', '5', 'P1', '本地', '3', 3.30, 10.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0223', '5', 'P1', '本地', '4', 3.50, 14.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0224', '5', 'P1', '本地', '2', 5.00, 10.00, '4', NULL, '加急');
INSERT INTO `orders` VALUES ('B0225', '5', 'P1', '本地', '2', 4.00, 8.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0226', '5', 'P1', '本地', '2', 4.00, 8.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0227', '5', 'P1', '区域', '1', 5.00, 5.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0228', '5', 'P1', '区域', '2', 4.50, 9.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0229', '5', 'P1', '区域', '1', 5.00, 5.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0230', '5', 'P1', '区域', '2', 5.00, 10.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0231', '5', 'P1', '区域', '1', 5.00, 5.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0232', '5', 'P1', '区域', '1', 5.00, 5.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0233', '5', 'P1', '区域', '1', 6.00, 6.00, '1', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0234', '5', 'P1', '国内', '4', 4.00, 16.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0235', '5', 'P1', '国内', '2', 4.50, 9.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0236', '5', 'P1', '国内', '3', 3.70, 11.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0237', '5', 'P1', '国内', '4', 3.50, 14.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0238', '5', 'P1', '国内', '3', 4.30, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0239', '5', 'P1', '国内', '2', 4.50, 9.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0240', '5', 'P1', '亚洲', '3', 3.30, 10.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0241', '5', 'P1', '亚洲', '5', 4.00, 20.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0242', '5', 'P1', '亚洲', '1', 4.00, 4.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0243', '5', 'P1', '亚洲', '2', 3.50, 7.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0244', '5', 'P1', '亚洲', '3', 3.30, 10.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0245', '5', 'P1', '亚洲', '4', 3.70, 15.00, '4', NULL, '加急');
INSERT INTO `orders` VALUES ('B0246', '5', 'P1', '亚洲', '2', 3.50, 7.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0247', '5', 'P1', '亚洲', '2', 4.50, 9.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0248', '5', 'P1', '国际', '2', 6.50, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0249', '5', 'P1', '国际', '1', 6.00, 6.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0250', '5', 'P1', '国际', '2', 6.00, 12.00, '4', NULL, '加急');
INSERT INTO `orders` VALUES ('B0251', '5', 'P1', '国际', '6', 5.00, 30.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0252', '5', 'P1', '国际', '4', 5.50, 22.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0253', '5', 'P1', '国际', '3', 6.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0254', '5', 'P1', '国际', '2', 6.00, 12.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0255', '5', 'P1', '国际', '1', 5.00, 5.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0256', '5', 'P1', '国际', '3', 5.30, 16.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0257', '5', 'P1', '国际', '5', 5.60, 28.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0258', '5', 'P1', '国际', '2', 5.00, 10.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0259', '5', 'P1', '国际', '5', 5.40, 27.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0260', '5', 'P2', '本地', '4', 8.30, 33.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0261', '5', 'P2', '本地', '4', 7.80, 31.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0262', '5', 'P2', '本地', '4', 8.30, 33.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0263', '5', 'P2', '本地', '3', 8.60, 26.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0264', '5', 'P2', '本地', '6', 7.70, 46.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0265', '5', 'P2', '本地', '4', 8.30, 33.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0266', '5', 'P2', '本地', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0267', '5', 'P2', '本地', '3', 8.60, 26.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0268', '5', 'P2', '本地', '2', 7.50, 15.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0269', '5', 'P2', '本地', '2', 8.00, 16.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0270', '5', 'P2', '区域', '2', 7.50, 15.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0271', '5', 'P2', '区域', '3', 6.30, 19.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0272', '5', 'P2', '区域', '2', 6.00, 12.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0273', '5', 'P2', '区域', '4', 6.50, 26.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0274', '5', 'P2', '区域', '1', 8.00, 8.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0275', '5', 'P2', '区域', '3', 6.30, 19.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0276', '5', 'P2', '国内', '1', 8.00, 8.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0277', '5', 'P2', '国内', '4', 7.50, 30.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0278', '5', 'P2', '国内', '2', 7.50, 15.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0279', '5', 'P2', '国内', '4', 6.20, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0280', '5', 'P2', '国内', '3', 7.00, 21.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0281', '5', 'P2', '国内', '2', 8.00, 16.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0282', '5', 'P2', '国内', '3', 8.00, 24.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0283', '5', 'P2', '国内', '3', 7.30, 22.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0284', '5', 'P2', '亚洲', '2', 6.00, 12.00, '0', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0285', '5', 'P2', '亚洲', '4', 5.00, 20.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0286', '5', 'P2', '亚洲', '2', 7.00, 14.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0287', '5', 'P2', '亚洲', '3', 7.00, 21.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0288', '5', 'P2', '亚洲', '3', 6.00, 18.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0289', '5', 'P2', '亚洲', '2', 6.50, 13.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0290', '5', 'P2', '亚洲', '4', 6.00, 24.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0291', '5', 'P2', '亚洲', '2', 7.00, 14.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0292', '5', 'P2', '亚洲', '2', 6.50, 13.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0293', '5', 'P2', '亚洲', '3', 7.00, 21.00, '3', 'ISO9000/ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0294', '5', 'P2', '国际', '2', 7.00, 14.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0295', '5', 'P2', '国际', '2', 6.50, 13.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0296', '5', 'P2', '国际', '2', 6.50, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0297', '5', 'P2', '国际', '3', 7.00, 21.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0298', '5', 'P2', '国际', '2', 7.00, 14.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0299', '5', 'P3', '本地', '4', 8.30, 33.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0300', '5', 'P3', '本地', '3', 9.70, 29.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0301', '5', 'P3', '本地', '3', 9.00, 27.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0302', '5', 'P3', '本地', '5', 8.20, 41.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0303', '5', 'P3', '本地', '4', 9.50, 38.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0304', '5', 'P3', '本地', '3', 9.30, 28.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0305', '5', 'P3', '本地', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0306', '5', 'P3', '本地', '5', 9.00, 45.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0307', '5', 'P3', '区域', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0308', '5', 'P3', '区域', '2', 9.00, 18.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0309', '5', 'P3', '区域', '3', 10.30, 31.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0310', '5', 'P3', '区域', '2', 9.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0311', '5', 'P3', '区域', '3', 9.30, 28.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0312', '5', 'P3', '区域', '1', 8.00, 8.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0313', '5', 'P3', '区域', '2', 10.00, 20.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0314', '5', 'P3', '区域', '2', 9.50, 19.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0315', '5', 'P3', '国内', '2', 8.50, 17.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0316', '5', 'P3', '国内', '3', 8.00, 24.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0317', '5', 'P3', '国内', '4', 8.00, 32.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0318', '5', 'P3', '国内', '2', 7.00, 14.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0319', '5', 'P3', '国内', '3', 9.00, 27.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0320', '5', 'P3', '国内', '4', 7.50, 30.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0321', '5', 'P3', '国内', '2', 7.50, 15.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0322', '5', 'P3', '国内', '2', 9.00, 18.00, '2', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0323', '5', 'P3', '亚洲', '4', 10.30, 41.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0324', '5', 'P3', '亚洲', '2', 10.00, 20.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0325', '5', 'P3', '亚洲', '4', 10.80, 43.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0326', '5', 'P3', '亚洲', '3', 11.30, 34.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0327', '5', 'P3', '亚洲', '4', 10.00, 40.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0328', '5', 'P3', '亚洲', '2', 10.50, 21.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0329', '5', 'P4', '本地', '2', 9.00, 18.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0330', '5', 'P4', '本地', '1', 9.00, 9.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0331', '5', 'P4', '本地', '2', 9.50, 19.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0332', '5', 'P4', '本地', '3', 9.00, 27.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0333', '5', 'P4', '本地', '2', 10.00, 20.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0334', '5', 'P4', '本地', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0335', '5', 'P4', '区域', '4', 11.00, 44.00, '3', 'ISO14000/ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0336', '5', 'P4', '区域', '3', 10.70, 32.00, '4', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0337', '5', 'P4', '区域', '2', 11.50, 23.00, '3', 'ISO14000/ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0338', '5', 'P4', '区域', '3', 10.30, 31.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0339', '5', 'P4', '国内', '2', 9.50, 19.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0340', '5', 'P4', '国内', '3', 9.70, 29.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0341', '5', 'P4', '国内', '1', 9.00, 9.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0342', '5', 'P4', '亚洲', '3', 11.00, 33.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0343', '5', 'P4', '亚洲', '4', 10.80, 43.00, '1', 'ISO9000/ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0344', '5', 'P4', '亚洲', '5', 10.20, 51.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0345', '5', 'P4', '亚洲', '2', 10.50, 21.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0346', '5', 'P4', '亚洲', '3', 10.30, 31.00, '2', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0347', '6', 'P1', '本地', '3', 3.40, 10.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0348', '6', 'P1', '本地', '2', 3.50, 7.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0349', '6', 'P1', '本地', '3', 4.00, 12.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0350', '6', 'P1', '本地', '3', 3.30, 10.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0351', '6', 'P1', '本地', '2', 4.00, 8.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0352', '6', 'P1', '本地', '3', 3.70, 11.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0353', '6', 'P1', '区域', '1', 5.00, 5.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0354', '6', 'P1', '区域', '2', 4.50, 9.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0355', '6', 'P1', '区域', '1', 5.00, 5.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0356', '6', 'P1', '区域', '2', 5.00, 10.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0357', '6', 'P1', '区域', '2', 5.00, 10.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0358', '6', 'P1', '国内', '2', 3.50, 7.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0359', '6', 'P1', '国内', '2', 3.50, 7.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0360', '6', 'P1', '国内', '3', 4.00, 12.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0361', '6', 'P1', '国内', '2', 3.50, 7.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0362', '6', 'P1', '国内', '3', 3.60, 11.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0363', '6', 'P1', '国内', '1', 4.00, 4.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0364', '6', 'P1', '亚洲', '2', 4.00, 8.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0365', '6', 'P1', '亚洲', '1', 4.00, 4.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0366', '6', 'P1', '亚洲', '3', 3.30, 10.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0367', '6', 'P1', '亚洲', '3', 3.00, 9.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0368', '6', 'P1', '亚洲', '4', 2.80, 11.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0369', '6', 'P1', '亚洲', '3', 4.00, 12.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0370', '6', 'P1', '亚洲', '2', 3.50, 7.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0371', '6', 'P1', '国际', '2', 5.50, 11.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0372', '6', 'P1', '国际', '2', 6.00, 12.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0373', '6', 'P1', '国际', '2', 5.50, 11.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0374', '6', 'P1', '国际', '3', 6.30, 19.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0375', '6', 'P1', '国际', '3', 6.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0376', '6', 'P1', '国际', '2', 6.50, 13.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0377', '6', 'P1', '国际', '4', 6.00, 24.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0378', '6', 'P1', '国际', '1', 6.00, 6.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0379', '6', 'P1', '国际', '3', 5.40, 16.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0380', '6', 'P1', '国际', '1', 6.00, 6.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0381', '6', 'P1', '国际', '4', 5.50, 22.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0382', '6', 'P1', '国际', '3', 6.30, 19.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0383', '6', 'P2', '本地', '1', 6.00, 6.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0384', '6', 'P2', '本地', '2', 6.00, 12.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0385', '6', 'P2', '本地', '3', 5.70, 17.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0386', '6', 'P2', '本地', '1', 6.00, 6.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0387', '6', 'P2', '本地', '2', 6.50, 13.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0388', '6', 'P2', '本地', '4', 5.50, 22.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0389', '6', 'P2', '本地', '3', 6.70, 20.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0390', '6', 'P2', '本地', '2', 6.00, 12.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0391', '6', 'P2', '本地', '4', 6.00, 24.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0392', '6', 'P2', '本地', '2', 5.50, 11.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0393', '6', 'P2', '区域', '2', 6.00, 12.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0394', '6', 'P2', '区域', '2', 5.50, 11.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0395', '6', 'P2', '区域', '1', 5.00, 5.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0396', '6', 'P2', '区域', '2', 6.50, 13.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0397', '6', 'P2', '区域', '1', 6.00, 6.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0398', '6', 'P2', '区域', '2', 5.50, 11.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0399', '6', 'P2', '国内', '3', 6.00, 18.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0400', '6', 'P2', '国内', '1', 6.00, 6.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0401', '6', 'P2', '国内', '3', 5.60, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0402', '6', 'P2', '国内', '2', 5.50, 11.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0403', '6', 'P2', '国内', '3', 6.00, 18.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0404', '6', 'P2', '国内', '1', 6.00, 6.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0405', '6', 'P2', '国内', '2', 5.50, 11.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0406', '6', 'P2', '国内', '4', 5.00, 20.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0407', '6', 'P2', '亚洲', '1', 6.00, 6.00, '0', NULL, '加急');
INSERT INTO `orders` VALUES ('B0408', '6', 'P2', '亚洲', '2', 5.50, 11.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0409', '6', 'P2', '亚洲', '3', 7.00, 21.00, '3', 'ISO9000/ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0410', '6', 'P2', '亚洲', '3', 5.70, 17.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0411', '6', 'P2', '亚洲', '2', 5.50, 11.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0412', '6', 'P2', '亚洲', '3', 6.70, 20.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0413', '6', 'P2', '亚洲', '3', 6.40, 19.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0414', '6', 'P2', '亚洲', '1', 5.00, 5.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0415', '6', 'P2', '国际', '3', 6.80, 20.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0416', '6', 'P2', '国际', '2', 7.50, 15.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0417', '6', 'P2', '国际', '2', 6.50, 13.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0418', '6', 'P2', '国际', '3', 7.00, 21.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0419', '6', 'P2', '国际', '2', 7.00, 14.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0420', '6', 'P2', '国际', '1', 8.00, 8.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0421', '6', 'P2', '国际', '1', 8.00, 8.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0422', '6', 'P2', '国际', '2', 7.00, 14.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0423', '6', 'P3', '本地', '5', 8.00, 40.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0424', '6', 'P3', '本地', '2', 9.50, 19.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0425', '6', 'P3', '本地', '2', 10.00, 20.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0426', '6', 'P3', '本地', '3', 8.30, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0427', '6', 'P3', '本地', '4', 8.50, 34.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0428', '6', 'P3', '本地', '3', 9.00, 27.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0429', '6', 'P3', '本地', '2', 8.00, 16.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0430', '6', 'P3', '本地', '4', 9.00, 36.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0431', '6', 'P3', '本地', '1', 9.00, 9.00, '2', 'ISO9000', '加急');
INSERT INTO `orders` VALUES ('B0432', '6', 'P3', '本地', '3', 9.60, 29.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0433', '6', 'P3', '区域', '3', 9.00, 27.00, '1', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0434', '6', 'P3', '区域', '4', 10.50, 42.00, '4', 'ISO14000/ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0435', '6', 'P3', '区域', '3', 11.00, 33.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0436', '6', 'P3', '区域', '4', 9.80, 39.00, '1', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0437', '6', 'P3', '区域', '5', 9.60, 48.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0438', '6', 'P3', '区域', '3', 10.30, 31.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0439', '6', 'P3', '国内', '1', 10.00, 10.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0440', '6', 'P3', '国内', '3', 8.70, 26.00, '0', NULL, NULL);
INSERT INTO `orders` VALUES ('B0441', '6', 'P3', '国内', '3', 9.00, 27.00, '2', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0442', '6', 'P3', '国内', '3', 9.00, 27.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0443', '6', 'P3', '国内', '2', 9.50, 19.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0444', '6', 'P3', '国内', '4', 8.50, 34.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0445', '6', 'P3', '国内', '2', 9.50, 19.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0446', '6', 'P3', '国内', '3', 9.30, 28.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0447', '6', 'P3', '亚洲', '4', 9.80, 39.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0448', '6', 'P3', '亚洲', '2', 11.50, 23.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0449', '6', 'P3', '亚洲', '4', 11.30, 45.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0450', '6', 'P3', '亚洲', '3', 10.00, 30.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0451', '6', 'P3', '亚洲', '2', 11.00, 22.00, '1', NULL, '加急');
INSERT INTO `orders` VALUES ('B0452', '6', 'P3', '亚洲', '3', 11.70, 35.00, '2', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0453', '6', 'P3', '亚洲', '3', 11.00, 33.00, '1', 'ISO9000/ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0454', '6', 'P3', '亚洲', '2', 9.50, 19.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0455', '6', 'P3', '国际', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0456', '6', 'P3', '国际', '3', 8.00, 24.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0457', '6', 'P3', '国际', '2', 8.00, 16.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0458', '6', 'P3', '国际', '2', 8.50, 17.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0459', '6', 'P3', '国际', '1', 8.00, 8.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0460', '6', 'P4', '本地', '2', 9.50, 19.00, '3', NULL, '加急');
INSERT INTO `orders` VALUES ('B0461', '6', 'P4', '本地', '3', 9.00, 27.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0462', '6', 'P4', '本地', '2', 9.00, 18.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0463', '6', 'P4', '本地', '3', 9.30, 28.00, '1', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0464', '6', 'P4', '本地', '2', 9.50, 19.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0465', '6', 'P4', '本地', '1', 9.00, 9.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0466', '6', 'P4', '本地', '1', 9.00, 9.00, '0', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0467', '6', 'P4', '区域', '2', 12.50, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0468', '6', 'P4', '区域', '3', 11.30, 34.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0469', '6', 'P4', '区域', '4', 12.00, 48.00, '3', 'ISO14000', NULL);
INSERT INTO `orders` VALUES ('B0470', '6', 'P4', '区域', '5', 12.20, 61.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES ('B0471', '6', 'P4', '区域', '3', 12.70, 38.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0472', '6', 'P4', '区域', '2', 11.00, 22.00, '2', NULL, '加急');
INSERT INTO `orders` VALUES ('B0473', '6', 'P4', '国内', '2', 9.00, 18.00, '1', NULL, NULL);
INSERT INTO `orders` VALUES ('B0474', '6', 'P4', '国内', '1', 10.00, 10.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0475', '6', 'P4', '国内', '2', 8.50, 17.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0476', '6', 'P4', '国内', '2', 10.00, 20.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0477', '6', 'P4', '国内', '2', 9.00, 18.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES ('B0478', '6', 'P4', '亚洲', '3', 13.70, 41.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES ('B0479', '6', 'P4', '亚洲', '4', 13.30, 53.00, '3', 'ISO9000/ISO1400', '加急');
INSERT INTO `orders` VALUES ('B0480', '6', 'P4', '亚洲', '3', 13.00, 39.00, '4', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0481', '6', 'P4', '亚洲', '4', 12.50, 50.00, '3', 'ISO9000', NULL);
INSERT INTO `orders` VALUES ('B0482', '6', 'P4', '亚洲', '2', 12.50, 25.00, '4', 'ISO14000', NULL);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_id` int NULL DEFAULT NULL COMMENT '哪一个市场',
  `uid` int NULL DEFAULT NULL,
  `meeting_id` int NULL DEFAULT NULL COMMENT '哪个订货会',
  `sequence` int NULL DEFAULT NULL COMMENT '选择的序位',
  `is_finished` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选择是否完成,排队中待选择选择中已完成，还有一个为广告额相同，联系教师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES (51, 1, 2, 3, 1, '选择中');
INSERT INTO `sequence` VALUES (52, 1, 1, 3, 2, '排队中');
INSERT INTO `sequence` VALUES (53, 2, 1, 3, 1, '排队中');
INSERT INTO `sequence` VALUES (54, 2, 2, 3, 2, '排队中');
INSERT INTO `sequence` VALUES (55, 5, 1, 3, 1, '排队中');
INSERT INTO `sequence` VALUES (85, 1, 2, 4, 1, '排队中');
INSERT INTO `sequence` VALUES (86, 2, 1, 4, 1, '排队中');
INSERT INTO `sequence` VALUES (87, 2, 3, 4, 2, '排队中');
INSERT INTO `sequence` VALUES (88, 3, 3, 4, 1, '排队中');
INSERT INTO `sequence` VALUES (89, 3, 2, 4, 2, '排队中');
INSERT INTO `sequence` VALUES (90, 3, 1, 4, 3, '排队中');
INSERT INTO `sequence` VALUES (91, 1, 2, 4, 1, '排队中');
INSERT INTO `sequence` VALUES (92, 2, 3, 4, 1, '排队中');
INSERT INTO `sequence` VALUES (93, 2, 1, 4, 2, '选择中');
INSERT INTO `sequence` VALUES (94, 3, 3, 4, 1, '排队中');
INSERT INTO `sequence` VALUES (95, 3, 2, 4, 2, '排队中');
INSERT INTO `sequence` VALUES (96, 3, 1, 4, 3, '排队中');
INSERT INTO `sequence` VALUES (97, 1, 3, 6, 1, '排队中');
INSERT INTO `sequence` VALUES (146, 1, 4, 100002, 1, '待选择');
INSERT INTO `sequence` VALUES (147, 1, 2, 100002, 2, '排队中');
INSERT INTO `sequence` VALUES (148, 1, 3, 100002, 3, '排队中');
INSERT INTO `sequence` VALUES (149, 2, 4, 100002, 1, '待选择');
INSERT INTO `sequence` VALUES (150, 2, 2, 100002, 2, '排队中');
INSERT INTO `sequence` VALUES (151, 2, 3, 100002, 3, '排队中');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `group_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '卓子公司', '123456', '教师', NULL);
INSERT INTO `user` VALUES (2, '再说吧', '123456', '学生', 3);
INSERT INTO `user` VALUES (3, '比奇堡', '321', '学生', 3);
INSERT INTO `user` VALUES (4, '妙妙屋', '123', '学生', 3);
INSERT INTO `user` VALUES (5, 'teacher1', '123456', '教师', NULL);
INSERT INTO `user` VALUES (6, 'teacher2', '123456', '教师', NULL);
INSERT INTO `user` VALUES (7, 'teacher3', '123456', '教师', NULL);
INSERT INTO `user` VALUES (8, 'teacher4', '123456', '教师', NULL);

-- ----------------------------
-- Table structure for user_market
-- ----------------------------
DROP TABLE IF EXISTS `user_market`;
CREATE TABLE `user_market`  (
  `user_market_id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `meeting_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对应的订货会',
  `market_id` int NULL DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投放的广告费',
  PRIMARY KEY (`user_market_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_market
-- ----------------------------
INSERT INTO `user_market` VALUES (1, 1, '3', 1, '1');
INSERT INTO `user_market` VALUES (2, 1, '3', 2, '5');
INSERT INTO `user_market` VALUES (3, 1, '3', 5, '7');
INSERT INTO `user_market` VALUES (4, 2, '3', 2, '3');
INSERT INTO `user_market` VALUES (5, 2, '3', 1, '3');
INSERT INTO `user_market` VALUES (6, 1, '4', 3, '2');
INSERT INTO `user_market` VALUES (7, 1, '4', 2, '1');
INSERT INTO `user_market` VALUES (8, 2, '4', 1, '1');
INSERT INTO `user_market` VALUES (9, 2, '4', 3, '4');
INSERT INTO `user_market` VALUES (10, 3, '4', 3, '5');
INSERT INTO `user_market` VALUES (11, 3, '4', 2, '3');
INSERT INTO `user_market` VALUES (12, 3, '6', 1, '1');
INSERT INTO `user_market` VALUES (13, 2, '100002', 1, '3');
INSERT INTO `user_market` VALUES (14, 2, '100002', 2, '5');
INSERT INTO `user_market` VALUES (15, 3, '100002', 1, '3');
INSERT INTO `user_market` VALUES (16, 3, '100002', 2, '1');
INSERT INTO `user_market` VALUES (17, 4, '100002', 1, '3');
INSERT INTO `user_market` VALUES (18, 4, '100002', 2, '9');

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order`  (
  `user_order_id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `meeting_id` int NULL DEFAULT NULL COMMENT '对应订货会id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年份',
  PRIMARY KEY (`user_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES (1, 1, 'B001', 3, '1');
INSERT INTO `user_order` VALUES (2, 2, 'B002', 3, '1');
INSERT INTO `user_order` VALUES (3, 3, 'B003', 3, '1');
INSERT INTO `user_order` VALUES (4, 2, 'B004', 3, '2');
INSERT INTO `user_order` VALUES (5, 2, 'B005', 3, '2');

SET FOREIGN_KEY_CHECKS = 1;
