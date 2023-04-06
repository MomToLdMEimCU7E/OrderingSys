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

 Date: 06/04/2023 11:30:59
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
INSERT INTO `group_class` VALUES (1, 1, NULL, '2', 4);
INSERT INTO `group_class` VALUES (2, 1, NULL, '1', 6);

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
INSERT INTO `market` VALUES (1, 'P1', '本地', '123');
INSERT INTO `market` VALUES (2, 'P2', '本地', '123');
INSERT INTO `market` VALUES (3, 'P3', '本地', '23');
INSERT INTO `market` VALUES (4, 'P4', '本地', '3');
INSERT INTO `market` VALUES (5, 'P1', '区域', '123');
INSERT INTO `market` VALUES (6, 'P2', '区域', '123');
INSERT INTO `market` VALUES (7, 'P3', '区域', '23');
INSERT INTO `market` VALUES (8, 'P4', '区域', '3');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`meeting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES (3, NULL, '1', 1, 1);
INSERT INTO `meeting` VALUES (4, NULL, '2', 1, 1);
INSERT INTO `meeting` VALUES (6, NULL, '1', 1, 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int NOT NULL COMMENT '订单编号',
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
INSERT INTO `orders` VALUES (1, '1', 'P1', '本地', '3', 5.00, 15.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES (2, '1', 'P1', '本地', '5', 4.70, 24.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES (3, '1', 'P1', '本地', '3', 5.20, 16.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES (4, '2', 'P1', '本地', '5', 5.00, 25.00, '2', NULL, NULL);
INSERT INTO `orders` VALUES (5, '2', 'P1', '区域', '3', 2.00, 6.00, '0', NULL, '1');
INSERT INTO `orders` VALUES (6, '2', 'P2', '本地', '5', 4.00, 20.00, '4', NULL, NULL);
INSERT INTO `orders` VALUES (7, '3', 'P1', '本地', '4', 5.00, 20.00, '3', NULL, NULL);
INSERT INTO `orders` VALUES (8, '3', 'P3', '本地', '2', 6.00, 12.00, '2', 'iso9000', NULL);
INSERT INTO `orders` VALUES (9, '3', 'P3', '区域', '2', 2.00, 4.00, '0', NULL, '1');

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
  `is_finished` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选择是否完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES (51, 1, 2, 3, 1, '0');
INSERT INTO `sequence` VALUES (52, 1, 1, 3, 2, '0');
INSERT INTO `sequence` VALUES (53, 2, 1, 3, 1, '0');
INSERT INTO `sequence` VALUES (54, 2, 2, 3, 2, '0');
INSERT INTO `sequence` VALUES (55, 5, 1, 3, 1, '0');
INSERT INTO `sequence` VALUES (85, 1, 2, 4, 1, '0');
INSERT INTO `sequence` VALUES (86, 2, 1, 4, 1, '0');
INSERT INTO `sequence` VALUES (87, 2, 3, 4, 2, '0');
INSERT INTO `sequence` VALUES (88, 3, 3, 4, 1, '0');
INSERT INTO `sequence` VALUES (89, 3, 2, 4, 2, '0');
INSERT INTO `sequence` VALUES (90, 3, 1, 4, 3, '0');
INSERT INTO `sequence` VALUES (91, 1, 2, 4, 1, '0');
INSERT INTO `sequence` VALUES (92, 2, 3, 4, 1, '0');
INSERT INTO `sequence` VALUES (93, 2, 1, 4, 2, '0');
INSERT INTO `sequence` VALUES (94, 3, 3, 4, 1, '0');
INSERT INTO `sequence` VALUES (95, 3, 2, 4, 2, '0');
INSERT INTO `sequence` VALUES (96, 3, 1, 4, 3, '0');
INSERT INTO `sequence` VALUES (97, 1, 3, 6, 1, '0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '123456', '教师', 1);
INSERT INTO `user` VALUES (2, '1233', '123456', '学生', 1);
INSERT INTO `user` VALUES (3, '4321', '321', '学生', 2);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order`  (
  `user_order_id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  `meeting_id` int NULL DEFAULT NULL COMMENT '对应订货会id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年份',
  PRIMARY KEY (`user_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES (1, 1, 1, 1, '1');

SET FOREIGN_KEY_CHECKS = 1;
