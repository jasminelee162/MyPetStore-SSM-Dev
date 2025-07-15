/*
 Navicat Premium Dump SQL

 Source Server         : mypetstore
 Source Server Type    : MySQL
 Source Server Version : 80011 (8.0.11)
 Source Host           : localhost:3306
 Source Schema         : mypetstore

 Target Server Type    : MySQL
 Target Server Version : 80011 (8.0.11)
 File Encoding         : 65001

 Date: 15/07/2025 19:28:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addr2` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1556044893@qq.com', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `account` VALUES ('111', '111@111', '11', '11', '11', '11', '1', '11', '1', '11', '1', '11');
INSERT INTO `account` VALUES ('1234', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', '1', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('12345', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', '111', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('1234567', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('12345678', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('123456789', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('1234567890', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('12345678901', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '11', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('234', '111@qq.com', '111', '111', '1', '11', '111', '1', 'sc', '1', 'ä¸­å½', '123');
INSERT INTO `account` VALUES ('3254532', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('345', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('432154323', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('456', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', '1', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('6768754321', 'uuuding@yourdomain.com', 'Uuu', 'Ding', '1', 'sc', 'hn', 'my', 'sc', '85551', 'ä¸­å½', '15983660989');
INSERT INTO `account` VALUES ('a', 'a@qq.com', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a');
INSERT INTO `account` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('j2ee', 'uuuding@yourdomain.com', 'Uuu', 'Ding', 'OK', 'sc', 'hn', 'my', '1', '85551', 'CHN', '15983660989');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
  `favcategory` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bannername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"Images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"Images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"Images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"Images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"Images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `itemId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (7, 'jz11', 'EST-18', 2);
INSERT INTO `cart` VALUES (8, 'jz11', 'EST-16', 1);
INSERT INTO `cart` VALUES (12, 'j2ee', 'EST-18', 3);
INSERT INTO `cart` VALUES (13, 'jz11', 'EST-18', 2);
INSERT INTO `cart` VALUES (14, 'jz11', 'EST-4', 1);
INSERT INTO `cart` VALUES (15, 'lxx', 'EST-18', 12);
INSERT INTO `cart` VALUES (16, 'lxx', 'EST-18', 12);
INSERT INTO `cart` VALUES (17, 'jz11', 'EST-13', 1);

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `itemid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`username`, `itemid`) USING BTREE,
  INDEX `itemid`(`itemid` ASC) USING BTREE,
  CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`username`) REFERENCES `signon` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('j2ee', 'EST-13', 2, 1);
INSERT INTO `cartitem` VALUES ('j2ee', 'EST-14', 4, 1);
INSERT INTO `cartitem` VALUES ('j2ee', 'EST-19', 1, 1);
INSERT INTO `cartitem` VALUES ('j2ee', 'EST-27', 4, 1);
INSERT INTO `cartitem` VALUES ('j2ee', 'EST-28', 1, 1);
INSERT INTO `cartitem` VALUES ('j2ee', 'EST-4', 2, 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', 'https://images.unsplash.com/photo-1555169062-013468b47731');
INSERT INTO `category` VALUES ('CATS', 'Cats', 'https://images.unsplash.com/photo-1544943910-4c1dc44aab44');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', 'https://images.unsplash.com/photo-1586671267731-da2cf3ceeb80');
INSERT INTO `category` VALUES ('FISH', 'Fish', 'https://images.unsplash.com/photo-1536590158209-e9d615d525e4');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', 'https://images.unsplash.com/photo-1610629651605-0b181ad69aab');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', 10000);
INSERT INTO `inventory` VALUES ('EST-10', 10000);
INSERT INTO `inventory` VALUES ('EST-11', 10000);
INSERT INTO `inventory` VALUES ('EST-12', 10000);
INSERT INTO `inventory` VALUES ('EST-13', 10000);
INSERT INTO `inventory` VALUES ('EST-14', 10000);
INSERT INTO `inventory` VALUES ('EST-15', 10000);
INSERT INTO `inventory` VALUES ('EST-16', 10000);
INSERT INTO `inventory` VALUES ('EST-17', 10000);
INSERT INTO `inventory` VALUES ('EST-18', 10000);
INSERT INTO `inventory` VALUES ('EST-19', 10000);
INSERT INTO `inventory` VALUES ('EST-2', 10000);
INSERT INTO `inventory` VALUES ('EST-20', 10000);
INSERT INTO `inventory` VALUES ('EST-21', 10000);
INSERT INTO `inventory` VALUES ('EST-22', 10000);
INSERT INTO `inventory` VALUES ('EST-23', 10000);
INSERT INTO `inventory` VALUES ('EST-24', 10000);
INSERT INTO `inventory` VALUES ('EST-25', 10000);
INSERT INTO `inventory` VALUES ('EST-26', 10000);
INSERT INTO `inventory` VALUES ('EST-27', 10000);
INSERT INTO `inventory` VALUES ('EST-28', 10000);
INSERT INTO `inventory` VALUES ('EST-3', 10000);
INSERT INTO `inventory` VALUES ('EST-4', 10000);
INSERT INTO `inventory` VALUES ('EST-5', 10000);
INSERT INTO `inventory` VALUES ('EST-6', 10000);
INSERT INTO `inventory` VALUES ('EST-7', 10000);
INSERT INTO `inventory` VALUES ('EST-8', 10000);
INSERT INTO `inventory` VALUES ('EST-9', 10000);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `listprice` decimal(10, 2) NULL DEFAULT NULL,
  `unitcost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier` int(11) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr3` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr4` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `attr5` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_item_2`(`supplier` ASC) USING BTREE,
  INDEX `itemProd`(`productid` ASC) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Large', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotted Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Venomless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', 18.50, 12.00, 1, 'P', 'Rattleless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', 18.50, 12.00, 1, 'P', 'Green Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', 58.50, 12.00, 1, 'P', 'Tailless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', 23.50, 12.00, 1, 'P', 'With tail', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', 93.50, 12.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', 193.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', 15.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', 16.50, 10.00, 1, 'P', 'Small', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', 5.50, 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', 5.29, 1.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', 135.50, 100.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', 145.49, 100.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', 255.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', 325.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', 125.50, 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', 155.29, 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', 18.50, 12.00, 1, 'P', 'Toothless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotted', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', 18.50, 12.00, 1, 'P', 'Spotless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Male Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', 18.50, 12.00, 1, 'P', 'Female Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', 18.50, 12.00, 1, 'P', 'Male Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', 18.50, 12.00, 1, 'P', 'Spotless Male Puppy', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem`  (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `itemid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES (1000, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1001, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1002, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1003, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1004, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1005, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1006, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1007, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1008, 1, 'EST-18', 1212, 92.00);
INSERT INTO `lineitem` VALUES (1010, 1, 'EST-18', 3, 193.50);
INSERT INTO `lineitem` VALUES (1012, 1, 'EST-18', 1, 92.00);
INSERT INTO `lineitem` VALUES (1013, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1014, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1015, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1015, 2, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1015, 3, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1016, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1017, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1018, 1, 'EST-18', 3, 193.50);
INSERT INTO `lineitem` VALUES (1018, 2, 'EST-6', 1, 18.50);
INSERT INTO `lineitem` VALUES (1018, 3, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1019, 1, 'EST-25', 1, 325.29);
INSERT INTO `lineitem` VALUES (1020, 1, 'EST-13', 999, 18.50);
INSERT INTO `lineitem` VALUES (1021, 1, 'EST-18', 5, 193.50);
INSERT INTO `lineitem` VALUES (1021, 2, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1022, 1, 'EST-18', 5, 193.50);
INSERT INTO `lineitem` VALUES (1022, 2, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1023, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1025, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1026, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1027, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1028, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1029, 1, 'EST-18', 10, 193.50);
INSERT INTO `lineitem` VALUES (1030, 1, 'EST-18', 5, 193.50);
INSERT INTO `lineitem` VALUES (1031, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1032, 1, 'EST-19', 10, 15.50);
INSERT INTO `lineitem` VALUES (1033, 1, 'EST-10', 10, 18.50);
INSERT INTO `lineitem` VALUES (1034, 1, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1035, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1036, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1037, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1038, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1039, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1040, 1, 'EST-18', 9, 193.50);
INSERT INTO `lineitem` VALUES (1041, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1042, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1043, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1044, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1045, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1046, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1047, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1048, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1049, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1050, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1051, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1052, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1053, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1054, 1, 'EST-18', 5, 193.50);
INSERT INTO `lineitem` VALUES (1054, 2, 'EST-7', 3, 18.50);
INSERT INTO `lineitem` VALUES (1055, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1056, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1056, 2, 'EST-7', 1, 18.50);
INSERT INTO `lineitem` VALUES (1057, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1058, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1059, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1060, 1, 'EST-18', 2, 193.50);
INSERT INTO `lineitem` VALUES (1060, 2, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1061, 1, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1062, 1, 'EST-18', 5, 193.50);
INSERT INTO `lineitem` VALUES (1063, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1064, 1, 'EST-4', 1, 18.50);
INSERT INTO `lineitem` VALUES (1079, 1, 'EST-5', 3, 18.50);
INSERT INTO `lineitem` VALUES (1081, 1, 'EST-13', 1, 18.50);
INSERT INTO `lineitem` VALUES (1081, 2, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1082, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1083, 1, 'EST-16', 1, 93.50);
INSERT INTO `lineitem` VALUES (1083, 2, 'EST-4', 6, 18.50);
INSERT INTO `lineitem` VALUES (1084, 1, 'EST-18', 6, 193.50);
INSERT INTO `lineitem` VALUES (1085, 1, 'EST-12', 1, 18.50);

-- ----------------------------
-- Table structure for log_record
-- ----------------------------
DROP TABLE IF EXISTS `log_record`;
CREATE TABLE `log_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1033 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_record
-- ----------------------------
INSERT INTO `log_record` VALUES (1, 'INFO', 'User j2ee login success!', '2025-03-15 23:04:07');
INSERT INTO `log_record` VALUES (2, 'INFO', 'User j2ee viewed category: FISH', '2025-03-15 23:04:27');
INSERT INTO `log_record` VALUES (3, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed product: FI-FW-01', '2025-03-15 23:04:29');
INSERT INTO `log_record` VALUES (4, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-15 23:04:29');
INSERT INTO `log_record` VALUES (5, 'INFO', 'Userj2ee added EST-5 to cart ', '2025-03-15 23:04:30');
INSERT INTO `log_record` VALUES (6, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed product: FI-SW-02', '2025-03-15 23:04:35');
INSERT INTO `log_record` VALUES (7, 'INFO', 'User j2ee viewed product: FI-SW-02', '2025-03-15 23:04:35');
INSERT INTO `log_record` VALUES (8, 'INFO', 'Userj2ee added EST-3 to cart ', '2025-03-15 23:04:37');
INSERT INTO `log_record` VALUES (9, 'INFO', 'User j2ee login success!', '2025-03-16 00:47:14');
INSERT INTO `log_record` VALUES (10, 'INFO', 'User j2ee login success!', '2025-03-16 00:50:31');
INSERT INTO `log_record` VALUES (11, 'INFO', 'User j2ee login success!', '2025-03-16 00:57:08');
INSERT INTO `log_record` VALUES (12, 'INFO', 'User j2ee login success!', '2025-03-16 01:07:39');
INSERT INTO `log_record` VALUES (13, 'INFO', 'User j2ee login success!', '2025-03-16 01:13:43');
INSERT INTO `log_record` VALUES (14, 'INFO', 'User j2ee login success!', '2025-03-16 01:17:06');
INSERT INTO `log_record` VALUES (15, 'INFO', 'User j2ee login success!', '2025-03-16 16:00:46');
INSERT INTO `log_record` VALUES (16, 'INFO', 'User j2ee viewed category: FISH', '2025-03-16 16:01:42');
INSERT INTO `log_record` VALUES (17, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed product: FI-FW-01', '2025-03-16 16:01:45');
INSERT INTO `log_record` VALUES (18, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-16 16:01:45');
INSERT INTO `log_record` VALUES (19, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed item: EST-4', '2025-03-16 16:01:48');
INSERT INTO `log_record` VALUES (20, 'INFO', 'User j2ee viewed item: EST-4', '2025-03-16 16:01:48');
INSERT INTO `log_record` VALUES (21, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed product: FI-FW-01', '2025-03-16 16:01:53');
INSERT INTO `log_record` VALUES (22, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-16 16:01:53');
INSERT INTO `log_record` VALUES (23, 'INFO', 'Userj2ee added EST-4 to cart ', '2025-03-16 16:02:06');
INSERT INTO `log_record` VALUES (24, 'INFO', 'Userj2ee removed EST-3 from cart ', '2025-03-16 16:05:14');
INSERT INTO `log_record` VALUES (25, 'INFO', 'User j2ee login success!', '2025-03-16 16:28:48');
INSERT INTO `log_record` VALUES (26, 'INFO', 'User j2ee login success!', '2025-03-16 16:38:39');
INSERT INTO `log_record` VALUES (27, 'INFO', 'User j2ee login success!', '2025-03-16 16:40:43');
INSERT INTO `log_record` VALUES (28, 'INFO', 'User j2ee login success!', '2025-03-16 16:42:24');
INSERT INTO `log_record` VALUES (29, 'INFO', 'User j2ee login success!', '2025-03-16 16:44:34');
INSERT INTO `log_record` VALUES (30, 'INFO', 'User j2ee login success!', '2025-03-16 16:48:06');
INSERT INTO `log_record` VALUES (31, 'INFO', 'User j2ee login success!', '2025-03-16 16:59:41');
INSERT INTO `log_record` VALUES (32, 'INFO', 'User j2ee login success!', '2025-03-16 17:02:33');
INSERT INTO `log_record` VALUES (33, 'INFO', 'User j2ee login success!', '2025-03-16 17:13:43');
INSERT INTO `log_record` VALUES (34, 'INFO', 'User j2ee login success!', '2025-03-16 17:15:41');
INSERT INTO `log_record` VALUES (35, 'INFO', 'User j2ee login success!', '2025-03-16 17:16:23');
INSERT INTO `log_record` VALUES (36, 'INFO', 'User j2ee login success!', '2025-03-16 19:16:23');
INSERT INTO `log_record` VALUES (37, 'INFO', 'User j2ee viewed category: DOGS', '2025-03-16 19:16:25');
INSERT INTO `log_record` VALUES (38, 'INFO', 'Userj2ee removed EST-4 from cart ', '2025-03-16 19:16:54');
INSERT INTO `log_record` VALUES (39, 'INFO', 'Userj2ee removed EST-5 from cart ', '2025-03-16 19:17:17');
INSERT INTO `log_record` VALUES (40, 'INFO', 'User j2ee viewed category: REPTILES', '2025-03-16 19:17:50');
INSERT INTO `log_record` VALUES (41, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed product: RP-LI-02', '2025-03-16 19:17:51');
INSERT INTO `log_record` VALUES (42, 'INFO', 'User j2ee viewed product: RP-LI-02', '2025-03-16 19:17:51');
INSERT INTO `log_record` VALUES (43, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed item: EST-13', '2025-03-16 19:17:52');
INSERT INTO `log_record` VALUES (44, 'INFO', 'User j2ee viewed item: EST-13', '2025-03-16 19:17:52');
INSERT INTO `log_record` VALUES (45, 'INFO', 'Userj2ee added EST-13 to cart ', '2025-03-16 19:17:55');
INSERT INTO `log_record` VALUES (46, 'INFO', 'User j2ee viewed category: BIRDS', '2025-03-16 19:17:59');
INSERT INTO `log_record` VALUES (47, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed product: AV-SB-02', '2025-03-16 19:18:00');
INSERT INTO `log_record` VALUES (48, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-16 19:18:00');
INSERT INTO `log_record` VALUES (49, 'INFO', 'Userj2ee added EST-19 to cart ', '2025-03-16 19:18:01');
INSERT INTO `log_record` VALUES (50, 'INFO', 'Userj2ee removed EST-13 from cart ', '2025-03-16 19:18:11');
INSERT INTO `log_record` VALUES (51, 'INFO', 'Userj2ee removed EST-19 from cart ', '2025-03-16 19:18:11');
INSERT INTO `log_record` VALUES (52, 'INFO', 'User j2ee login success!', '2025-03-17 14:11:07');
INSERT INTO `log_record` VALUES (53, 'INFO', 'User j2ee viewed category: CATS', '2025-03-17 14:11:20');
INSERT INTO `log_record` VALUES (54, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User viewed product: FL-DLH-02', '2025-03-17 14:11:21');
INSERT INTO `log_record` VALUES (55, 'INFO', 'User j2ee viewed product: FL-DLH-02', '2025-03-17 14:11:21');
INSERT INTO `log_record` VALUES (56, 'INFO', 'Userj2ee added EST-16 to cart ', '2025-03-17 14:11:22');
INSERT INTO `log_record` VALUES (57, 'INFO', 'Userj2ee removed EST-16 from cart ', '2025-03-17 14:11:34');
INSERT INTO `log_record` VALUES (58, 'INFO', 'User j2ee viewed category: CATS', '2025-03-17 14:11:59');
INSERT INTO `log_record` VALUES (59, 'INFO', 'User j2ee login success!', '2025-03-17 15:18:26');
INSERT INTO `log_record` VALUES (60, 'INFO', 'User j2ee login success!', '2025-03-18 10:51:35');
INSERT INTO `log_record` VALUES (61, 'INFO', 'User j2ee viewed category: FISH', '2025-03-18 10:51:42');
INSERT INTO `log_record` VALUES (62, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-03-18 10:51:46');
INSERT INTO `log_record` VALUES (63, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-18 10:51:46');
INSERT INTO `log_record` VALUES (64, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-03-18 10:51:52');
INSERT INTO `log_record` VALUES (65, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-18 10:51:52');
INSERT INTO `log_record` VALUES (66, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-03-18 10:51:53');
INSERT INTO `log_record` VALUES (67, 'INFO', 'User j2ee viewed item: EST-4', '2025-03-18 10:51:53');
INSERT INTO `log_record` VALUES (68, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: ', '2025-03-18 11:19:14');
INSERT INTO `log_record` VALUES (69, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: ', '2025-03-18 11:19:35');
INSERT INTO `log_record` VALUES (70, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: ', '2025-03-18 11:23:27');
INSERT INTO `log_record` VALUES (71, 'INFO', 'User j2ee login success!', '2025-03-18 12:50:58');
INSERT INTO `log_record` VALUES (72, 'INFO', 'User j2ee viewed category: BIRDS', '2025-03-18 12:51:00');
INSERT INTO `log_record` VALUES (73, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-18 12:51:02');
INSERT INTO `log_record` VALUES (74, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-18 12:51:02');
INSERT INTO `log_record` VALUES (75, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 12:52:56');
INSERT INTO `log_record` VALUES (76, 'INFO', 'User j2ee login success!', '2025-03-18 12:53:27');
INSERT INTO `log_record` VALUES (77, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 12:53:34');
INSERT INTO `log_record` VALUES (78, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 12:53:34');
INSERT INTO `log_record` VALUES (79, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 12:53:34');
INSERT INTO `log_record` VALUES (80, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 12:53:34');
INSERT INTO `log_record` VALUES (81, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: ssdf', '2025-03-18 12:53:54');
INSERT INTO `log_record` VALUES (82, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: fish', '2025-03-18 12:54:00');
INSERT INTO `log_record` VALUES (83, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 12:54:00');
INSERT INTO `log_record` VALUES (84, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 12:54:00');
INSERT INTO `log_record` VALUES (85, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 12:54:00');
INSERT INTO `log_record` VALUES (86, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: dog', '2025-03-18 12:54:06');
INSERT INTO `log_record` VALUES (87, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-03-18 12:54:06');
INSERT INTO `log_record` VALUES (88, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: K9-BD-01', '2025-03-18 12:54:06');
INSERT INTO `log_record` VALUES (89, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-03-18 12:54:06');
INSERT INTO `log_record` VALUES (90, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: car', '2025-03-18 12:54:17');
INSERT INTO `log_record` VALUES (91, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: cat', '2025-03-18 12:54:20');
INSERT INTO `log_record` VALUES (92, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: cats', '2025-03-18 12:54:23');
INSERT INTO `log_record` VALUES (93, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: dog', '2025-03-18 12:54:26');
INSERT INTO `log_record` VALUES (94, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-03-18 12:54:27');
INSERT INTO `log_record` VALUES (95, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: K9-BD-01', '2025-03-18 12:54:27');
INSERT INTO `log_record` VALUES (96, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-03-18 12:54:27');
INSERT INTO `log_record` VALUES (97, 'INFO', 'User j2ee viewed category: DOGS', '2025-03-18 12:54:34');
INSERT INTO `log_record` VALUES (98, 'INFO', 'User j2ee login success!', '2025-03-18 13:07:45');
INSERT INTO `log_record` VALUES (99, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: c', '2025-03-18 13:07:58');
INSERT INTO `log_record` VALUES (100, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-18 13:07:58');
INSERT INTO `log_record` VALUES (101, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-03-18 13:07:58');
INSERT INTO `log_record` VALUES (102, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-18 13:07:58');
INSERT INTO `log_record` VALUES (103, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 13:08:15');
INSERT INTO `log_record` VALUES (104, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:08:15');
INSERT INTO `log_record` VALUES (105, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 13:08:15');
INSERT INTO `log_record` VALUES (106, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:08:15');
INSERT INTO `log_record` VALUES (107, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: o', '2025-03-18 13:08:21');
INSERT INTO `log_record` VALUES (108, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-18 13:08:21');
INSERT INTO `log_record` VALUES (109, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-18 13:08:21');
INSERT INTO `log_record` VALUES (110, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-18 13:08:21');
INSERT INTO `log_record` VALUES (111, 'INFO', 'User j2ee login success!', '2025-03-18 13:10:38');
INSERT INTO `log_record` VALUES (112, 'INFO', 'User j2ee viewed category: BIRDS', '2025-03-18 13:10:40');
INSERT INTO `log_record` VALUES (113, 'INFO', 'User j2ee viewed category: FISH', '2025-03-18 13:10:45');
INSERT INTO `log_record` VALUES (114, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 13:10:48');
INSERT INTO `log_record` VALUES (115, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:10:48');
INSERT INTO `log_record` VALUES (116, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 13:10:48');
INSERT INTO `log_record` VALUES (117, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:10:48');
INSERT INTO `log_record` VALUES (118, 'INFO', 'User j2ee viewed category: FISH', '2025-03-18 13:10:51');
INSERT INTO `log_record` VALUES (119, 'INFO', 'User j2ee login success!', '2025-03-18 13:12:44');
INSERT INTO `log_record` VALUES (120, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: sdf', '2025-03-18 13:12:58');
INSERT INTO `log_record` VALUES (121, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: aaa', '2025-03-18 13:13:02');
INSERT INTO `log_record` VALUES (122, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: a', '2025-03-18 13:13:03');
INSERT INTO `log_record` VALUES (123, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-18 13:13:03');
INSERT INTO `log_record` VALUES (124, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-18 13:13:03');
INSERT INTO `log_record` VALUES (125, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-18 13:13:03');
INSERT INTO `log_record` VALUES (126, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: a', '2025-03-18 13:13:19');
INSERT INTO `log_record` VALUES (127, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-18 13:13:19');
INSERT INTO `log_record` VALUES (128, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-18 13:13:19');
INSERT INTO `log_record` VALUES (129, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-18 13:13:19');
INSERT INTO `log_record` VALUES (130, 'INFO', 'User j2ee login success!', '2025-03-18 13:18:04');
INSERT INTO `log_record` VALUES (131, 'INFO', 'User j2ee login success!', '2025-03-18 13:20:15');
INSERT INTO `log_record` VALUES (132, 'INFO', 'User j2ee login success!', '2025-03-18 13:27:52');
INSERT INTO `log_record` VALUES (133, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: df', '2025-03-18 13:27:57');
INSERT INTO `log_record` VALUES (134, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:27:57');
INSERT INTO `log_record` VALUES (135, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 13:27:57');
INSERT INTO `log_record` VALUES (136, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:27:57');
INSERT INTO `log_record` VALUES (137, 'INFO', 'User j2ee viewed category: DOGS', '2025-03-18 13:28:03');
INSERT INTO `log_record` VALUES (138, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: f', '2025-03-18 13:28:04');
INSERT INTO `log_record` VALUES (139, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-18 13:28:04');
INSERT INTO `log_record` VALUES (140, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-03-18 13:28:04');
INSERT INTO `log_record` VALUES (141, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-18 13:28:04');
INSERT INTO `log_record` VALUES (142, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 13:28:06');
INSERT INTO `log_record` VALUES (143, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:28:06');
INSERT INTO `log_record` VALUES (144, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 13:28:06');
INSERT INTO `log_record` VALUES (145, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:28:06');
INSERT INTO `log_record` VALUES (146, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: c', '2025-03-18 13:28:07');
INSERT INTO `log_record` VALUES (147, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-18 13:28:07');
INSERT INTO `log_record` VALUES (148, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-03-18 13:28:07');
INSERT INTO `log_record` VALUES (149, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-18 13:28:07');
INSERT INTO `log_record` VALUES (150, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: x', '2025-03-18 13:28:08');
INSERT INTO `log_record` VALUES (151, 'INFO', 'User j2ee viewed product: FL-DSH-01', '2025-03-18 13:28:08');
INSERT INTO `log_record` VALUES (152, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FL-DSH-01', '2025-03-18 13:28:08');
INSERT INTO `log_record` VALUES (153, 'INFO', 'User j2ee viewed product: FL-DSH-01', '2025-03-18 13:28:08');
INSERT INTO `log_record` VALUES (154, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 13:28:27');
INSERT INTO `log_record` VALUES (155, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:28:27');
INSERT INTO `log_record` VALUES (156, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 13:28:27');
INSERT INTO `log_record` VALUES (157, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 13:28:27');
INSERT INTO `log_record` VALUES (158, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: 吃吧电费', '2025-03-18 16:03:33');
INSERT INTO `log_record` VALUES (159, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: sa', '2025-03-18 16:03:40');
INSERT INTO `log_record` VALUES (160, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 16:03:41');
INSERT INTO `log_record` VALUES (161, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 16:03:59');
INSERT INTO `log_record` VALUES (162, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: sd', '2025-03-18 16:08:48');
INSERT INTO `log_record` VALUES (163, 'INFO', 'User j2ee login success!', '2025-03-18 16:09:03');
INSERT INTO `log_record` VALUES (164, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: D', '2025-03-18 16:09:31');
INSERT INTO `log_record` VALUES (165, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 16:09:31');
INSERT INTO `log_record` VALUES (166, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 16:09:31');
INSERT INTO `log_record` VALUES (167, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 16:09:31');
INSERT INTO `log_record` VALUES (168, 'INFO', 'User j2ee login success!', '2025-03-18 16:09:53');
INSERT INTO `log_record` VALUES (169, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 16:10:08');
INSERT INTO `log_record` VALUES (170, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 16:10:08');
INSERT INTO `log_record` VALUES (171, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 16:10:08');
INSERT INTO `log_record` VALUES (172, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 16:10:08');
INSERT INTO `log_record` VALUES (173, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 16:11:18');
INSERT INTO `log_record` VALUES (174, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 16:11:22');
INSERT INTO `log_record` VALUES (175, 'INFO', 'User j2ee login success!', '2025-03-18 16:12:08');
INSERT INTO `log_record` VALUES (176, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: S', '2025-03-18 16:12:19');
INSERT INTO `log_record` VALUES (177, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 16:12:19');
INSERT INTO `log_record` VALUES (178, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 16:12:19');
INSERT INTO `log_record` VALUES (179, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 16:12:20');
INSERT INTO `log_record` VALUES (180, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 16:15:16');
INSERT INTO `log_record` VALUES (181, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: sd', '2025-03-18 16:29:50');
INSERT INTO `log_record` VALUES (182, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: d', '2025-03-18 16:29:52');
INSERT INTO `log_record` VALUES (183, 'INFO', 'User j2ee login success!', '2025-03-18 16:30:00');
INSERT INTO `log_record` VALUES (184, 'INFO', 'User j2ee login success!', '2025-03-18 16:36:24');
INSERT INTO `log_record` VALUES (185, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: d', '2025-03-18 16:44:00');
INSERT INTO `log_record` VALUES (186, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-18 17:32:40');
INSERT INTO `log_record` VALUES (187, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: d', '2025-03-18 21:13:04');
INSERT INTO `log_record` VALUES (188, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: d', '2025-03-18 21:13:15');
INSERT INTO `log_record` VALUES (189, 'INFO', 'User j2ee login success!', '2025-03-18 21:13:29');
INSERT INTO `log_record` VALUES (190, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: d', '2025-03-18 21:13:35');
INSERT INTO `log_record` VALUES (191, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 21:13:35');
INSERT INTO `log_record` VALUES (192, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 21:13:35');
INSERT INTO `log_record` VALUES (193, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 21:13:35');
INSERT INTO `log_record` VALUES (194, 'INFO', 'User j2ee login success!', '2025-03-18 21:15:57');
INSERT INTO `log_record` VALUES (195, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: S', '2025-03-18 21:16:02');
INSERT INTO `log_record` VALUES (196, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 21:16:02');
INSERT INTO `log_record` VALUES (197, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-18 21:16:02');
INSERT INTO `log_record` VALUES (198, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-18 21:16:02');
INSERT INTO `log_record` VALUES (199, 'INFO', 'User j2ee login success!', '2025-03-18 21:24:39');
INSERT INTO `log_record` VALUES (200, 'INFO', 'User j2ee viewed category: FISH', '2025-03-18 21:24:56');
INSERT INTO `log_record` VALUES (201, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-03-18 21:24:57');
INSERT INTO `log_record` VALUES (202, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-18 21:24:57');
INSERT INTO `log_record` VALUES (203, 'INFO', 'Userj2ee added EST-4 to cart ', '2025-03-18 21:24:58');
INSERT INTO `log_record` VALUES (204, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: s', '2025-03-19 21:26:06');
INSERT INTO `log_record` VALUES (205, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: q', '2025-03-19 21:26:10');
INSERT INTO `log_record` VALUES (206, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: s', '2025-03-19 21:26:12');
INSERT INTO `log_record` VALUES (207, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: ', '2025-03-19 21:26:16');
INSERT INTO `log_record` VALUES (208, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: d', '2025-03-19 21:26:18');
INSERT INTO `log_record` VALUES (209, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: s\\', '2025-03-19 21:55:44');
INSERT INTO `log_record` VALUES (210, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: s', '2025-03-19 21:55:47');
INSERT INTO `log_record` VALUES (211, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: ', '2025-03-19 21:55:50');
INSERT INTO `log_record` VALUES (212, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: a', '2025-03-19 21:55:54');
INSERT INTO `log_record` VALUES (213, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: s', '2025-03-19 22:01:26');
INSERT INTO `log_record` VALUES (214, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0] User searched product: a', '2025-03-19 22:08:01');
INSERT INTO `log_record` VALUES (215, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: a', '2025-03-19 22:12:12');
INSERT INTO `log_record` VALUES (216, 'INFO', 'User j2ee login success!', '2025-03-19 22:31:52');
INSERT INTO `log_record` VALUES (217, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-19 22:31:58');
INSERT INTO `log_record` VALUES (218, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-19 22:31:58');
INSERT INTO `log_record` VALUES (219, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-19 22:31:58');
INSERT INTO `log_record` VALUES (220, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-19 22:31:58');
INSERT INTO `log_record` VALUES (221, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-19 22:32:09');
INSERT INTO `log_record` VALUES (222, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-19 22:32:09');
INSERT INTO `log_record` VALUES (223, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-19 22:32:09');
INSERT INTO `log_record` VALUES (224, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-19 22:32:09');
INSERT INTO `log_record` VALUES (225, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: d', '2025-03-19 22:32:11');
INSERT INTO `log_record` VALUES (226, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-19 22:32:11');
INSERT INTO `log_record` VALUES (227, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-19 22:32:11');
INSERT INTO `log_record` VALUES (228, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-19 22:32:11');
INSERT INTO `log_record` VALUES (229, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: q', '2025-03-19 22:32:12');
INSERT INTO `log_record` VALUES (230, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: c', '2025-03-19 22:32:14');
INSERT INTO `log_record` VALUES (231, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-19 22:32:14');
INSERT INTO `log_record` VALUES (232, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-03-19 22:32:14');
INSERT INTO `log_record` VALUES (233, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-19 22:32:14');
INSERT INTO `log_record` VALUES (234, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: f', '2025-03-19 22:32:20');
INSERT INTO `log_record` VALUES (235, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-19 22:32:20');
INSERT INTO `log_record` VALUES (236, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-03-19 22:32:20');
INSERT INTO `log_record` VALUES (237, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-03-19 22:32:20');
INSERT INTO `log_record` VALUES (238, 'INFO', '[IP: 127.0.0.1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-03-19 22:34:49');
INSERT INTO `log_record` VALUES (239, 'INFO', 'User j2ee login success!', '2025-03-19 22:35:03');
INSERT INTO `log_record` VALUES (240, 'INFO', 'User j2ee login success!', '2025-03-19 22:41:53');
INSERT INTO `log_record` VALUES (241, 'INFO', 'User j2ee viewed category: FISH', '2025-03-19 22:44:34');
INSERT INTO `log_record` VALUES (242, 'INFO', 'User j2ee viewed category: REPTILES', '2025-03-19 22:45:32');
INSERT INTO `log_record` VALUES (243, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: a', '2025-03-19 22:45:44');
INSERT INTO `log_record` VALUES (244, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-19 22:45:45');
INSERT INTO `log_record` VALUES (245, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-19 22:45:45');
INSERT INTO `log_record` VALUES (246, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-19 22:45:45');
INSERT INTO `log_record` VALUES (247, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-19 22:49:38');
INSERT INTO `log_record` VALUES (248, 'INFO', 'User j2ee login success!', '2025-03-19 23:35:46');
INSERT INTO `log_record` VALUES (249, 'INFO', 'User j2ee viewed category: FISH', '2025-03-19 23:36:01');
INSERT INTO `log_record` VALUES (250, 'INFO', 'User j2ee login success!', '2025-03-19 23:37:00');
INSERT INTO `log_record` VALUES (251, 'INFO', 'User j2ee login success!', '2025-03-20 00:19:26');
INSERT INTO `log_record` VALUES (252, 'INFO', 'User j2ee login success!', '2025-03-20 00:20:41');
INSERT INTO `log_record` VALUES (253, 'INFO', 'User j2ee login success!', '2025-03-20 00:21:48');
INSERT INTO `log_record` VALUES (254, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-20 00:21:51');
INSERT INTO `log_record` VALUES (255, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-20 00:21:51');
INSERT INTO `log_record` VALUES (256, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-20 00:21:51');
INSERT INTO `log_record` VALUES (257, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-20 00:21:51');
INSERT INTO `log_record` VALUES (258, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-20 00:22:05');
INSERT INTO `log_record` VALUES (259, 'INFO', 'User j2ee login success!', '2025-03-20 00:22:18');
INSERT INTO `log_record` VALUES (260, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-20 00:23:45');
INSERT INTO `log_record` VALUES (261, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-20 00:23:45');
INSERT INTO `log_record` VALUES (262, 'INFO', 'User j2ee viewed category: BIRDS', '2025-03-20 00:29:23');
INSERT INTO `log_record` VALUES (263, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-20 21:25:55');
INSERT INTO `log_record` VALUES (264, 'INFO', 'User j2ee login success!', '2025-03-20 22:05:03');
INSERT INTO `log_record` VALUES (265, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-20 22:06:00');
INSERT INTO `log_record` VALUES (266, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-20 22:06:00');
INSERT INTO `log_record` VALUES (267, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-20 22:06:00');
INSERT INTO `log_record` VALUES (268, 'INFO', 'User j2ee viewed product: FI-FW-02', '2025-03-20 22:06:00');
INSERT INTO `log_record` VALUES (269, 'INFO', 'User j2ee login success!', '2025-03-20 22:07:13');
INSERT INTO `log_record` VALUES (270, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-SW-02', '2025-03-20 22:20:16');
INSERT INTO `log_record` VALUES (271, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-20 23:54:33');
INSERT INTO `log_record` VALUES (272, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-20 23:59:37');
INSERT INTO `log_record` VALUES (273, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: RP-LI-02', '2025-03-21 00:11:33');
INSERT INTO `log_record` VALUES (274, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: K9-CW-01', '2025-03-21 00:27:12');
INSERT INTO `log_record` VALUES (275, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-03-21 10:13:35');
INSERT INTO `log_record` VALUES (276, 'INFO', 'User j2ee login success!', '2025-03-21 10:13:41');
INSERT INTO `log_record` VALUES (277, 'INFO', 'User j2ee login success!', '2025-03-21 10:13:58');
INSERT INTO `log_record` VALUES (278, 'INFO', 'User j2ee login success!', '2025-03-21 10:14:08');
INSERT INTO `log_record` VALUES (279, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-21 10:14:26');
INSERT INTO `log_record` VALUES (280, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-21 10:14:26');
INSERT INTO `log_record` VALUES (281, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-03-21 10:21:29');
INSERT INTO `log_record` VALUES (282, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-03-21 10:21:29');
INSERT INTO `log_record` VALUES (283, 'INFO', 'User j2ee login success!', '2025-03-21 10:28:12');
INSERT INTO `log_record` VALUES (284, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User searched product: s', '2025-03-21 12:53:41');
INSERT INTO `log_record` VALUES (285, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-SW-01', '2025-03-23 14:03:09');
INSERT INTO `log_record` VALUES (286, 'INFO', 'User j2ee login success!', '2025-03-23 14:06:06');
INSERT INTO `log_record` VALUES (287, 'INFO', 'User j2ee viewed category: FISH', '2025-03-23 14:06:08');
INSERT INTO `log_record` VALUES (288, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-03-23 14:06:15');
INSERT INTO `log_record` VALUES (289, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-23 14:06:15');
INSERT INTO `log_record` VALUES (290, 'INFO', 'Userj2ee added EST-4 to cart ', '2025-03-23 14:06:20');
INSERT INTO `log_record` VALUES (291, 'INFO', 'User j2ee viewed category: CATS', '2025-03-23 14:06:35');
INSERT INTO `log_record` VALUES (292, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-03-23 14:06:36');
INSERT INTO `log_record` VALUES (293, 'INFO', 'User j2ee viewed product: FL-DLH-02', '2025-03-23 14:06:36');
INSERT INTO `log_record` VALUES (294, 'INFO', 'Userj2ee added EST-16 to cart ', '2025-03-23 14:06:38');
INSERT INTO `log_record` VALUES (295, 'INFO', 'Userj2ee removed EST-16 from cart ', '2025-03-23 14:07:00');
INSERT INTO `log_record` VALUES (296, 'INFO', 'Userj2ee removed EST-4 from cart ', '2025-03-23 14:07:01');
INSERT INTO `log_record` VALUES (297, 'INFO', 'User j2eesubmit order 1083', '2025-03-23 14:07:01');
INSERT INTO `log_record` VALUES (298, 'INFO', 'User j2ee login success!', '2025-03-23 14:10:15');
INSERT INTO `log_record` VALUES (299, 'INFO', 'User j2ee viewed category: FISH', '2025-03-23 14:10:16');
INSERT INTO `log_record` VALUES (300, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-03-23 14:10:17');
INSERT INTO `log_record` VALUES (301, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-03-23 14:10:17');
INSERT INTO `log_record` VALUES (302, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-03-23 14:10:19');
INSERT INTO `log_record` VALUES (303, 'INFO', 'User j2ee viewed item: EST-4', '2025-03-23 14:10:19');
INSERT INTO `log_record` VALUES (304, 'INFO', 'Userj2ee added EST-4 to cart ', '2025-03-23 14:10:27');
INSERT INTO `log_record` VALUES (305, 'INFO', 'Userj2ee removed EST-4 from cart ', '2025-03-23 14:11:08');
INSERT INTO `log_record` VALUES (306, 'INFO', 'User j2ee viewed category: DOGS', '2025-03-23 14:11:11');
INSERT INTO `log_record` VALUES (307, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: K9-BD-01', '2025-03-23 14:11:12');
INSERT INTO `log_record` VALUES (308, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-03-23 14:11:12');
INSERT INTO `log_record` VALUES (309, 'INFO', 'Userj2ee added EST-6 to cart ', '2025-03-23 14:11:13');
INSERT INTO `log_record` VALUES (310, 'INFO', 'User j2ee login success!', '2025-04-07 14:05:10');
INSERT INTO `log_record` VALUES (311, 'INFO', 'User j2ee viewed category: DOGS', '2025-04-07 14:05:50');
INSERT INTO `log_record` VALUES (312, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: K9-BD-01', '2025-04-07 14:05:54');
INSERT INTO `log_record` VALUES (313, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-04-07 14:05:54');
INSERT INTO `log_record` VALUES (314, 'INFO', 'Userj2ee added EST-6 to cart ', '2025-04-07 14:05:55');
INSERT INTO `log_record` VALUES (315, 'INFO', 'Userj2ee removed EST-6 from cart ', '2025-04-07 14:24:46');
INSERT INTO `log_record` VALUES (316, 'INFO', 'User j2ee viewed category: BIRDS', '2025-04-07 14:26:07');
INSERT INTO `log_record` VALUES (317, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-07 14:26:09');
INSERT INTO `log_record` VALUES (318, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-04-07 14:26:09');
INSERT INTO `log_record` VALUES (319, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed item: EST-18', '2025-04-07 14:26:11');
INSERT INTO `log_record` VALUES (320, 'INFO', 'User j2ee viewed item: EST-18', '2025-04-07 14:26:11');
INSERT INTO `log_record` VALUES (321, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed item: EST-18', '2025-04-07 14:31:43');
INSERT INTO `log_record` VALUES (322, 'INFO', 'User j2ee login success!', '2025-04-07 14:32:23');
INSERT INTO `log_record` VALUES (323, 'INFO', 'User j2ee viewed category: REPTILES', '2025-04-07 14:32:26');
INSERT INTO `log_record` VALUES (324, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: RP-LI-02', '2025-04-07 14:32:31');
INSERT INTO `log_record` VALUES (325, 'INFO', 'User j2ee viewed product: RP-LI-02', '2025-04-07 14:32:31');
INSERT INTO `log_record` VALUES (326, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed item: EST-13', '2025-04-07 14:32:33');
INSERT INTO `log_record` VALUES (327, 'INFO', 'User j2ee viewed item: EST-13', '2025-04-07 14:32:33');
INSERT INTO `log_record` VALUES (328, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: RP-SN-01', '2025-04-07 14:32:43');
INSERT INTO `log_record` VALUES (329, 'INFO', 'User j2ee viewed product: RP-SN-01', '2025-04-07 14:32:43');
INSERT INTO `log_record` VALUES (330, 'INFO', 'User j2ee viewed category: CATS', '2025-04-07 14:32:47');
INSERT INTO `log_record` VALUES (331, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-07 14:32:49');
INSERT INTO `log_record` VALUES (332, 'INFO', 'User j2ee viewed product: FL-DLH-02', '2025-04-07 14:32:49');
INSERT INTO `log_record` VALUES (333, 'INFO', 'Userj2ee added EST-16 to cart ', '2025-04-07 14:34:41');
INSERT INTO `log_record` VALUES (334, 'INFO', 'Userj2ee removed EST-16 from cart ', '2025-04-07 14:34:52');
INSERT INTO `log_record` VALUES (335, 'INFO', 'User j2ee viewed category: BIRDS', '2025-04-07 14:34:54');
INSERT INTO `log_record` VALUES (336, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-07 14:34:56');
INSERT INTO `log_record` VALUES (337, 'INFO', 'User j2ee viewed product: AV-CB-01', '2025-04-07 14:34:56');
INSERT INTO `log_record` VALUES (338, 'INFO', 'Userj2ee added EST-18 to cart ', '2025-04-07 14:34:58');
INSERT INTO `log_record` VALUES (339, 'INFO', 'Userj2ee removed EST-18 from cart ', '2025-04-07 14:35:18');
INSERT INTO `log_record` VALUES (340, 'INFO', 'User j2eesubmit order 1084', '2025-04-07 14:35:18');
INSERT INTO `log_record` VALUES (341, 'INFO', 'User j2ee viewed category: REPTILES', '2025-04-07 14:35:43');
INSERT INTO `log_record` VALUES (342, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: RP-LI-02', '2025-04-07 14:35:44');
INSERT INTO `log_record` VALUES (343, 'INFO', 'User j2ee viewed product: RP-LI-02', '2025-04-07 14:35:44');
INSERT INTO `log_record` VALUES (344, 'INFO', 'Userj2ee added EST-13 to cart ', '2025-04-07 14:35:45');
INSERT INTO `log_record` VALUES (345, 'INFO', 'User j2ee viewed category: FISH', '2025-04-07 14:35:47');
INSERT INTO `log_record` VALUES (346, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-SW-01', '2025-04-07 14:35:49');
INSERT INTO `log_record` VALUES (347, 'INFO', 'User j2ee viewed product: FI-SW-01', '2025-04-07 14:35:49');
INSERT INTO `log_record` VALUES (348, 'INFO', 'Userj2ee added EST-2 to cart ', '2025-04-07 14:35:50');
INSERT INTO `log_record` VALUES (349, 'INFO', 'User j2ee viewed category: REPTILES', '2025-04-07 14:35:52');
INSERT INTO `log_record` VALUES (350, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: RP-SN-01', '2025-04-07 14:35:53');
INSERT INTO `log_record` VALUES (351, 'INFO', 'User j2ee viewed product: RP-SN-01', '2025-04-07 14:35:53');
INSERT INTO `log_record` VALUES (352, 'INFO', 'Userj2ee added EST-12 to cart ', '2025-04-07 14:35:55');
INSERT INTO `log_record` VALUES (353, 'INFO', 'User j2ee viewed category: CATS', '2025-04-07 14:35:59');
INSERT INTO `log_record` VALUES (354, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FL-DSH-01', '2025-04-07 14:36:01');
INSERT INTO `log_record` VALUES (355, 'INFO', 'User j2ee viewed product: FL-DSH-01', '2025-04-07 14:36:01');
INSERT INTO `log_record` VALUES (356, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed item: EST-14', '2025-04-07 14:36:02');
INSERT INTO `log_record` VALUES (357, 'INFO', 'User j2ee viewed item: EST-14', '2025-04-07 14:36:02');
INSERT INTO `log_record` VALUES (358, 'INFO', 'Userj2ee added EST-14 to cart ', '2025-04-07 14:36:03');
INSERT INTO `log_record` VALUES (359, 'INFO', 'Userj2ee removed EST-2 from cart ', '2025-04-07 14:36:10');
INSERT INTO `log_record` VALUES (360, 'INFO', 'User j2ee viewed category: BIRDS', '2025-04-07 14:37:46');
INSERT INTO `log_record` VALUES (361, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-04-07 14:37:48');
INSERT INTO `log_record` VALUES (362, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-04-07 14:37:48');
INSERT INTO `log_record` VALUES (363, 'INFO', 'Userj2ee added EST-19 to cart ', '2025-04-07 14:37:49');
INSERT INTO `log_record` VALUES (364, 'INFO', 'User j2ee viewed category: DOGS', '2025-04-07 14:38:26');
INSERT INTO `log_record` VALUES (365, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: K9-CW-01', '2025-04-07 14:38:39');
INSERT INTO `log_record` VALUES (366, 'INFO', 'User j2ee viewed product: K9-CW-01', '2025-04-07 14:38:39');
INSERT INTO `log_record` VALUES (367, 'INFO', 'Userj2ee added EST-27 to cart ', '2025-04-07 14:38:58');
INSERT INTO `log_record` VALUES (368, 'INFO', 'User j2ee login success!', '2025-04-07 14:42:38');
INSERT INTO `log_record` VALUES (369, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed item: EST-12', '2025-04-07 14:44:39');
INSERT INTO `log_record` VALUES (370, 'INFO', 'User j2ee viewed item: EST-12', '2025-04-07 14:44:39');
INSERT INTO `log_record` VALUES (371, 'INFO', 'Userj2ee removed EST-12 from cart ', '2025-04-07 14:46:57');
INSERT INTO `log_record` VALUES (372, 'INFO', 'Userj2ee removed EST-19 from cart ', '2025-04-07 14:54:23');
INSERT INTO `log_record` VALUES (373, 'INFO', 'User j2ee login success!', '2025-04-07 15:11:37');
INSERT INTO `log_record` VALUES (374, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-04-09 10:03:53');
INSERT INTO `log_record` VALUES (375, 'INFO', 'User j2ee login success!', '2025-04-09 10:06:42');
INSERT INTO `log_record` VALUES (376, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-SW-02', '2025-04-09 10:06:49');
INSERT INTO `log_record` VALUES (377, 'INFO', 'User j2ee viewed product: FI-SW-02', '2025-04-09 10:06:49');
INSERT INTO `log_record` VALUES (378, 'INFO', 'User j2ee viewed category: FISH', '2025-04-09 10:07:13');
INSERT INTO `log_record` VALUES (379, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: RP-SN-01', '2025-04-09 10:07:27');
INSERT INTO `log_record` VALUES (380, 'INFO', 'User j2ee viewed product: RP-SN-01', '2025-04-09 10:07:27');
INSERT INTO `log_record` VALUES (381, 'INFO', 'Userj2ee added EST-12 to cart ', '2025-04-09 10:07:38');
INSERT INTO `log_record` VALUES (382, 'INFO', 'Userj2ee removed EST-12 from cart ', '2025-04-09 10:07:50');
INSERT INTO `log_record` VALUES (383, 'INFO', 'User j2eesubmit order 1085', '2025-04-09 10:07:50');
INSERT INTO `log_record` VALUES (384, 'INFO', 'User j2ee viewed category: DOGS', '2025-04-09 10:12:47');
INSERT INTO `log_record` VALUES (385, 'INFO', 'User j2ee login success!', '2025-04-09 10:18:22');
INSERT INTO `log_record` VALUES (386, 'INFO', 'User j2ee viewed category: CATS', '2025-04-09 10:18:24');
INSERT INTO `log_record` VALUES (387, 'INFO', 'User j2ee login success!', '2025-04-09 10:20:21');
INSERT INTO `log_record` VALUES (388, 'INFO', 'User j2ee viewed category: CATS', '2025-04-09 10:21:14');
INSERT INTO `log_record` VALUES (389, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-09 10:21:15');
INSERT INTO `log_record` VALUES (390, 'INFO', 'User j2ee viewed product: FL-DLH-02', '2025-04-09 10:21:16');
INSERT INTO `log_record` VALUES (391, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-16', '2025-04-09 10:21:17');
INSERT INTO `log_record` VALUES (392, 'INFO', 'User j2ee viewed item: EST-16', '2025-04-09 10:21:17');
INSERT INTO `log_record` VALUES (393, 'INFO', 'User j2ee viewed category: DOGS', '2025-04-09 10:27:49');
INSERT INTO `log_record` VALUES (394, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: K9-RT-01', '2025-04-09 10:28:02');
INSERT INTO `log_record` VALUES (395, 'INFO', 'User j2ee viewed product: K9-RT-01', '2025-04-09 10:28:02');
INSERT INTO `log_record` VALUES (396, 'INFO', 'Userj2ee added EST-28 to cart ', '2025-04-09 10:28:03');
INSERT INTO `log_record` VALUES (397, 'INFO', 'User j2ee viewed category: BIRDS', '2025-04-09 10:28:10');
INSERT INTO `log_record` VALUES (398, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-SB-02', '2025-04-09 10:28:12');
INSERT INTO `log_record` VALUES (399, 'INFO', 'User j2ee viewed product: AV-SB-02', '2025-04-09 10:28:12');
INSERT INTO `log_record` VALUES (400, 'INFO', 'Userj2ee added EST-19 to cart ', '2025-04-09 10:28:14');
INSERT INTO `log_record` VALUES (401, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User searched product: s', '2025-04-09 11:29:31');
INSERT INTO `log_record` VALUES (402, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User searched product: f', '2025-04-09 11:29:37');
INSERT INTO `log_record` VALUES (403, 'INFO', 'User j2ee login success!', '2025-04-16 16:50:09');
INSERT INTO `log_record` VALUES (404, 'INFO', 'User j2ee viewed category: BIRDS', '2025-04-16 16:56:28');
INSERT INTO `log_record` VALUES (405, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:01:44');
INSERT INTO `log_record` VALUES (406, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:02:23');
INSERT INTO `log_record` VALUES (407, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:03:25');
INSERT INTO `log_record` VALUES (408, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:05:44');
INSERT INTO `log_record` VALUES (409, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:05:48');
INSERT INTO `log_record` VALUES (410, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:05:54');
INSERT INTO `log_record` VALUES (411, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:05:59');
INSERT INTO `log_record` VALUES (412, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:08:13');
INSERT INTO `log_record` VALUES (413, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:08:52');
INSERT INTO `log_record` VALUES (414, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:10:20');
INSERT INTO `log_record` VALUES (415, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:10:20');
INSERT INTO `log_record` VALUES (416, 'INFO', 'User null viewed category: CATS', '2025-04-16 17:14:56');
INSERT INTO `log_record` VALUES (417, 'INFO', 'User null viewed category: CATS', '2025-04-16 17:14:56');
INSERT INTO `log_record` VALUES (418, 'INFO', 'User null viewed category: DOGS', '2025-04-16 17:14:59');
INSERT INTO `log_record` VALUES (419, 'INFO', 'User null viewed category: DOGS', '2025-04-16 17:14:59');
INSERT INTO `log_record` VALUES (420, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:15:02');
INSERT INTO `log_record` VALUES (421, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:15:02');
INSERT INTO `log_record` VALUES (422, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:15:14');
INSERT INTO `log_record` VALUES (423, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:15:14');
INSERT INTO `log_record` VALUES (424, 'INFO', 'User null viewed category: FISH', '2025-04-16 17:15:18');
INSERT INTO `log_record` VALUES (425, 'INFO', 'User null viewed category: DOGS', '2025-04-16 17:15:20');
INSERT INTO `log_record` VALUES (426, 'INFO', 'User null viewed category: FISH', '2025-04-16 23:30:33');
INSERT INTO `log_record` VALUES (427, 'INFO', 'User null viewed category: FISH', '2025-04-16 23:30:33');
INSERT INTO `log_record` VALUES (428, 'INFO', 'User null viewed category: FISH', '2025-04-16 23:30:38');
INSERT INTO `log_record` VALUES (429, 'INFO', 'User null viewed category: FISH', '2025-04-16 23:30:45');
INSERT INTO `log_record` VALUES (430, 'INFO', 'User null viewed category: FISH', '2025-04-16 23:30:45');
INSERT INTO `log_record` VALUES (431, 'INFO', 'User null viewed category: REPTILES', '2025-04-16 23:31:04');
INSERT INTO `log_record` VALUES (432, 'INFO', 'User null viewed category: REPTILES', '2025-04-16 23:31:04');
INSERT INTO `log_record` VALUES (433, 'INFO', 'User null viewed category: REPTILES', '2025-04-17 00:05:26');
INSERT INTO `log_record` VALUES (434, 'INFO', 'User null viewed category: REPTILES', '2025-04-17 00:05:28');
INSERT INTO `log_record` VALUES (435, 'INFO', 'User null viewed category: REPTILES', '2025-04-17 00:05:28');
INSERT INTO `log_record` VALUES (436, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:09');
INSERT INTO `log_record` VALUES (437, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:09');
INSERT INTO `log_record` VALUES (438, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:12');
INSERT INTO `log_record` VALUES (439, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:20');
INSERT INTO `log_record` VALUES (440, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:20');
INSERT INTO `log_record` VALUES (441, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:25');
INSERT INTO `log_record` VALUES (442, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:29');
INSERT INTO `log_record` VALUES (443, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:09:29');
INSERT INTO `log_record` VALUES (444, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:11:40');
INSERT INTO `log_record` VALUES (445, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:11:40');
INSERT INTO `log_record` VALUES (446, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:11:41');
INSERT INTO `log_record` VALUES (447, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:11:41');
INSERT INTO `log_record` VALUES (448, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:11:45');
INSERT INTO `log_record` VALUES (449, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:11:52');
INSERT INTO `log_record` VALUES (450, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:11:52');
INSERT INTO `log_record` VALUES (451, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:12:03');
INSERT INTO `log_record` VALUES (452, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:12:03');
INSERT INTO `log_record` VALUES (453, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:14:33');
INSERT INTO `log_record` VALUES (454, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:14:33');
INSERT INTO `log_record` VALUES (455, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:14:34');
INSERT INTO `log_record` VALUES (456, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:14:34');
INSERT INTO `log_record` VALUES (457, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:14:35');
INSERT INTO `log_record` VALUES (458, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:14:35');
INSERT INTO `log_record` VALUES (459, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:14:51');
INSERT INTO `log_record` VALUES (460, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:14:51');
INSERT INTO `log_record` VALUES (461, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:17:17');
INSERT INTO `log_record` VALUES (462, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:17:17');
INSERT INTO `log_record` VALUES (463, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:17:26');
INSERT INTO `log_record` VALUES (464, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:17:26');
INSERT INTO `log_record` VALUES (465, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:17:27');
INSERT INTO `log_record` VALUES (466, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:17:27');
INSERT INTO `log_record` VALUES (467, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: PostmanRuntime/7.43.3] User viewed product: FI-FW-01', '2025-04-17 00:19:36');
INSERT INTO `log_record` VALUES (468, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:19:36');
INSERT INTO `log_record` VALUES (469, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-17 00:22:30');
INSERT INTO `log_record` VALUES (470, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:22:30');
INSERT INTO `log_record` VALUES (471, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 00:22:41');
INSERT INTO `log_record` VALUES (472, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:22:41');
INSERT INTO `log_record` VALUES (473, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:22:43');
INSERT INTO `log_record` VALUES (474, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:22:47');
INSERT INTO `log_record` VALUES (475, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:22:47');
INSERT INTO `log_record` VALUES (476, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 00:22:50');
INSERT INTO `log_record` VALUES (477, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:22:50');
INSERT INTO `log_record` VALUES (478, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:23:42');
INSERT INTO `log_record` VALUES (479, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:23:50');
INSERT INTO `log_record` VALUES (480, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:23:50');
INSERT INTO `log_record` VALUES (481, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:27:54');
INSERT INTO `log_record` VALUES (482, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:27:57');
INSERT INTO `log_record` VALUES (483, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:28:04');
INSERT INTO `log_record` VALUES (484, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:28:04');
INSERT INTO `log_record` VALUES (485, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 00:28:06');
INSERT INTO `log_record` VALUES (486, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 00:28:06');
INSERT INTO `log_record` VALUES (487, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:28:08');
INSERT INTO `log_record` VALUES (488, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:28:09');
INSERT INTO `log_record` VALUES (489, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:28:10');
INSERT INTO `log_record` VALUES (490, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:28:21');
INSERT INTO `log_record` VALUES (491, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:28:21');
INSERT INTO `log_record` VALUES (492, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:31:07');
INSERT INTO `log_record` VALUES (493, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:31:07');
INSERT INTO `log_record` VALUES (494, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 00:31:16');
INSERT INTO `log_record` VALUES (495, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 00:31:16');
INSERT INTO `log_record` VALUES (496, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:31:59');
INSERT INTO `log_record` VALUES (497, 'INFO', 'User null viewed category: FISH', '2025-04-17 00:31:59');
INSERT INTO `log_record` VALUES (498, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 00:32:02');
INSERT INTO `log_record` VALUES (499, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 00:32:02');
INSERT INTO `log_record` VALUES (500, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 00:41:39');
INSERT INTO `log_record` VALUES (501, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 00:41:39');
INSERT INTO `log_record` VALUES (502, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:36:34');
INSERT INTO `log_record` VALUES (503, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:36:34');
INSERT INTO `log_record` VALUES (504, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 12:36:36');
INSERT INTO `log_record` VALUES (505, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 12:36:36');
INSERT INTO `log_record` VALUES (506, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 12:36:36');
INSERT INTO `log_record` VALUES (507, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 12:36:36');
INSERT INTO `log_record` VALUES (508, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 12:38:52');
INSERT INTO `log_record` VALUES (509, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 12:38:53');
INSERT INTO `log_record` VALUES (510, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:38:59');
INSERT INTO `log_record` VALUES (511, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:38:59');
INSERT INTO `log_record` VALUES (512, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-04-17 12:39:01');
INSERT INTO `log_record` VALUES (513, 'INFO', 'User null viewed product: FI-FW-02', '2025-04-17 12:39:01');
INSERT INTO `log_record` VALUES (514, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-04-17 12:39:01');
INSERT INTO `log_record` VALUES (515, 'INFO', 'User null viewed product: FI-FW-02', '2025-04-17 12:39:01');
INSERT INTO `log_record` VALUES (516, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-21', '2025-04-17 12:39:02');
INSERT INTO `log_record` VALUES (517, 'INFO', 'User null viewed item: EST-21', '2025-04-17 12:39:02');
INSERT INTO `log_record` VALUES (518, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:39:26');
INSERT INTO `log_record` VALUES (519, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:39:26');
INSERT INTO `log_record` VALUES (520, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-04-17 12:39:28');
INSERT INTO `log_record` VALUES (521, 'INFO', 'User null viewed product: FI-FW-02', '2025-04-17 12:39:28');
INSERT INTO `log_record` VALUES (522, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-02', '2025-04-17 12:39:28');
INSERT INTO `log_record` VALUES (523, 'INFO', 'User null viewed product: FI-FW-02', '2025-04-17 12:39:28');
INSERT INTO `log_record` VALUES (524, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:39:33');
INSERT INTO `log_record` VALUES (525, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:41:31');
INSERT INTO `log_record` VALUES (526, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:41:31');
INSERT INTO `log_record` VALUES (527, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 12:41:32');
INSERT INTO `log_record` VALUES (528, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 12:41:32');
INSERT INTO `log_record` VALUES (529, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 12:41:32');
INSERT INTO `log_record` VALUES (530, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 12:41:32');
INSERT INTO `log_record` VALUES (531, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:41:33');
INSERT INTO `log_record` VALUES (532, 'INFO', 'User null viewed category: FISH', '2025-04-17 12:41:34');
INSERT INTO `log_record` VALUES (533, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 12:41:35');
INSERT INTO `log_record` VALUES (534, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 12:41:35');
INSERT INTO `log_record` VALUES (535, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 12:41:35');
INSERT INTO `log_record` VALUES (536, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 12:41:35');
INSERT INTO `log_record` VALUES (537, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 12:41:45');
INSERT INTO `log_record` VALUES (538, 'INFO', 'User null viewed item: EST-4', '2025-04-17 12:41:45');
INSERT INTO `log_record` VALUES (539, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:48:40');
INSERT INTO `log_record` VALUES (540, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:48:40');
INSERT INTO `log_record` VALUES (541, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:48:43');
INSERT INTO `log_record` VALUES (542, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:48:43');
INSERT INTO `log_record` VALUES (543, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:48:43');
INSERT INTO `log_record` VALUES (544, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:48:43');
INSERT INTO `log_record` VALUES (545, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:48:59');
INSERT INTO `log_record` VALUES (546, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:48:59');
INSERT INTO `log_record` VALUES (547, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:48:59');
INSERT INTO `log_record` VALUES (548, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:48:59');
INSERT INTO `log_record` VALUES (549, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:49:00');
INSERT INTO `log_record` VALUES (550, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:49:00');
INSERT INTO `log_record` VALUES (551, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:49:00');
INSERT INTO `log_record` VALUES (552, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:49:00');
INSERT INTO `log_record` VALUES (553, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:49:03');
INSERT INTO `log_record` VALUES (554, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:49:03');
INSERT INTO `log_record` VALUES (555, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 21:49:06');
INSERT INTO `log_record` VALUES (556, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 21:49:06');
INSERT INTO `log_record` VALUES (557, 'INFO', 'User null viewed category: REPTILES', '2025-04-17 21:49:09');
INSERT INTO `log_record` VALUES (558, 'INFO', 'User null viewed category: REPTILES', '2025-04-17 21:49:09');
INSERT INTO `log_record` VALUES (559, 'INFO', 'User null viewed category: CATS', '2025-04-17 21:49:09');
INSERT INTO `log_record` VALUES (560, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:11');
INSERT INTO `log_record` VALUES (561, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:11');
INSERT INTO `log_record` VALUES (562, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:11');
INSERT INTO `log_record` VALUES (563, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:11');
INSERT INTO `log_record` VALUES (564, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:14');
INSERT INTO `log_record` VALUES (565, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:14');
INSERT INTO `log_record` VALUES (566, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:14');
INSERT INTO `log_record` VALUES (567, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:14');
INSERT INTO `log_record` VALUES (568, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:15');
INSERT INTO `log_record` VALUES (569, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:15');
INSERT INTO `log_record` VALUES (570, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:15');
INSERT INTO `log_record` VALUES (571, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:15');
INSERT INTO `log_record` VALUES (572, 'INFO', 'User null viewed category: CATS', '2025-04-17 21:49:17');
INSERT INTO `log_record` VALUES (573, 'INFO', 'User null viewed category: CATS', '2025-04-17 21:49:17');
INSERT INTO `log_record` VALUES (574, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:18');
INSERT INTO `log_record` VALUES (575, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:18');
INSERT INTO `log_record` VALUES (576, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 21:49:18');
INSERT INTO `log_record` VALUES (577, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 21:49:18');
INSERT INTO `log_record` VALUES (578, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 21:49:19');
INSERT INTO `log_record` VALUES (579, 'INFO', 'User null viewed category: BIRDS', '2025-04-17 21:49:19');
INSERT INTO `log_record` VALUES (580, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:20');
INSERT INTO `log_record` VALUES (581, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:20');
INSERT INTO `log_record` VALUES (582, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:20');
INSERT INTO `log_record` VALUES (583, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:20');
INSERT INTO `log_record` VALUES (584, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:22');
INSERT INTO `log_record` VALUES (585, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:22');
INSERT INTO `log_record` VALUES (586, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:22');
INSERT INTO `log_record` VALUES (587, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:22');
INSERT INTO `log_record` VALUES (588, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:27');
INSERT INTO `log_record` VALUES (589, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:27');
INSERT INTO `log_record` VALUES (590, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:27');
INSERT INTO `log_record` VALUES (591, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:27');
INSERT INTO `log_record` VALUES (592, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:28');
INSERT INTO `log_record` VALUES (593, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:28');
INSERT INTO `log_record` VALUES (594, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: AV-CB-01', '2025-04-17 21:49:28');
INSERT INTO `log_record` VALUES (595, 'INFO', 'User null viewed product: AV-CB-01', '2025-04-17 21:49:28');
INSERT INTO `log_record` VALUES (596, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-18', '2025-04-17 21:50:04');
INSERT INTO `log_record` VALUES (597, 'INFO', 'User null viewed item: EST-18', '2025-04-17 21:50:05');
INSERT INTO `log_record` VALUES (598, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: PostmanRuntime/7.43.3] User viewed item: EST-18', '2025-04-17 21:53:09');
INSERT INTO `log_record` VALUES (599, 'INFO', 'User null viewed item: EST-18', '2025-04-17 21:53:09');
INSERT INTO `log_record` VALUES (600, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-18', '2025-04-17 21:54:58');
INSERT INTO `log_record` VALUES (601, 'INFO', 'User null viewed item: EST-18', '2025-04-17 21:54:58');
INSERT INTO `log_record` VALUES (602, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:55:04');
INSERT INTO `log_record` VALUES (603, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:55:04');
INSERT INTO `log_record` VALUES (604, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:55:05');
INSERT INTO `log_record` VALUES (605, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:55:05');
INSERT INTO `log_record` VALUES (606, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:55:05');
INSERT INTO `log_record` VALUES (607, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:55:05');
INSERT INTO `log_record` VALUES (608, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 21:55:43');
INSERT INTO `log_record` VALUES (609, 'INFO', 'User null viewed item: EST-4', '2025-04-17 21:55:43');
INSERT INTO `log_record` VALUES (610, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 21:55:58');
INSERT INTO `log_record` VALUES (611, 'INFO', 'User null viewed item: EST-4', '2025-04-17 21:55:58');
INSERT INTO `log_record` VALUES (612, 'INFO', 'User null viewed category: REPTILES', '2025-04-17 21:56:13');
INSERT INTO `log_record` VALUES (613, 'INFO', 'User null viewed category: REPTILES', '2025-04-17 21:56:13');
INSERT INTO `log_record` VALUES (614, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: RP-LI-02', '2025-04-17 21:56:14');
INSERT INTO `log_record` VALUES (615, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: RP-LI-02', '2025-04-17 21:56:14');
INSERT INTO `log_record` VALUES (616, 'INFO', 'User null viewed product: RP-LI-02', '2025-04-17 21:56:14');
INSERT INTO `log_record` VALUES (617, 'INFO', 'User null viewed product: RP-LI-02', '2025-04-17 21:56:14');
INSERT INTO `log_record` VALUES (618, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: RP-LI-02', '2025-04-17 21:56:28');
INSERT INTO `log_record` VALUES (619, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: RP-LI-02', '2025-04-17 21:56:28');
INSERT INTO `log_record` VALUES (620, 'INFO', 'User null viewed product: RP-LI-02', '2025-04-17 21:56:28');
INSERT INTO `log_record` VALUES (621, 'INFO', 'User null viewed product: RP-LI-02', '2025-04-17 21:56:28');
INSERT INTO `log_record` VALUES (622, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-13', '2025-04-17 21:56:41');
INSERT INTO `log_record` VALUES (623, 'INFO', 'User null viewed item: EST-13', '2025-04-17 21:56:41');
INSERT INTO `log_record` VALUES (624, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:56:51');
INSERT INTO `log_record` VALUES (625, 'INFO', 'User null viewed category: FISH', '2025-04-17 21:56:51');
INSERT INTO `log_record` VALUES (626, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:56:52');
INSERT INTO `log_record` VALUES (627, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 21:56:52');
INSERT INTO `log_record` VALUES (628, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:56:52');
INSERT INTO `log_record` VALUES (629, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 21:56:52');
INSERT INTO `log_record` VALUES (630, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: PostmanRuntime/7.43.3] User viewed item: EST-4', '2025-04-17 21:58:10');
INSERT INTO `log_record` VALUES (631, 'INFO', 'User null viewed item: EST-4', '2025-04-17 21:58:10');
INSERT INTO `log_record` VALUES (632, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:00:39');
INSERT INTO `log_record` VALUES (633, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:00:39');
INSERT INTO `log_record` VALUES (634, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:00:41');
INSERT INTO `log_record` VALUES (635, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:00:41');
INSERT INTO `log_record` VALUES (636, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:00:41');
INSERT INTO `log_record` VALUES (637, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:00:41');
INSERT INTO `log_record` VALUES (638, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:01:17');
INSERT INTO `log_record` VALUES (639, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:01:17');
INSERT INTO `log_record` VALUES (640, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:01:17');
INSERT INTO `log_record` VALUES (641, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:01:17');
INSERT INTO `log_record` VALUES (642, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 22:03:54');
INSERT INTO `log_record` VALUES (643, 'INFO', 'User null viewed item: EST-4', '2025-04-17 22:03:55');
INSERT INTO `log_record` VALUES (644, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:04:03');
INSERT INTO `log_record` VALUES (645, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:04:03');
INSERT INTO `log_record` VALUES (646, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:04:03');
INSERT INTO `log_record` VALUES (647, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:04:03');
INSERT INTO `log_record` VALUES (648, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:04:03');
INSERT INTO `log_record` VALUES (649, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:04:03');
INSERT INTO `log_record` VALUES (650, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 22:04:04');
INSERT INTO `log_record` VALUES (651, 'INFO', 'User null viewed item: EST-4', '2025-04-17 22:04:04');
INSERT INTO `log_record` VALUES (652, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 22:04:04');
INSERT INTO `log_record` VALUES (653, 'INFO', 'User null viewed item: EST-4', '2025-04-17 22:04:04');
INSERT INTO `log_record` VALUES (654, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:08:07');
INSERT INTO `log_record` VALUES (655, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:08:07');
INSERT INTO `log_record` VALUES (656, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 22:10:34');
INSERT INTO `log_record` VALUES (657, 'INFO', 'User null viewed item: EST-4', '2025-04-17 22:10:34');
INSERT INTO `log_record` VALUES (658, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:10:37');
INSERT INTO `log_record` VALUES (659, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:10:37');
INSERT INTO `log_record` VALUES (660, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:10:42');
INSERT INTO `log_record` VALUES (661, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:10:42');
INSERT INTO `log_record` VALUES (662, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:10:43');
INSERT INTO `log_record` VALUES (663, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:10:43');
INSERT INTO `log_record` VALUES (664, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:10:43');
INSERT INTO `log_record` VALUES (665, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:10:43');
INSERT INTO `log_record` VALUES (666, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 22:10:44');
INSERT INTO `log_record` VALUES (667, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-17 22:10:44');
INSERT INTO `log_record` VALUES (668, 'INFO', 'User null viewed item: EST-4', '2025-04-17 22:10:44');
INSERT INTO `log_record` VALUES (669, 'INFO', 'User null viewed item: EST-4', '2025-04-17 22:10:44');
INSERT INTO `log_record` VALUES (670, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:10:47');
INSERT INTO `log_record` VALUES (671, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-17 22:10:47');
INSERT INTO `log_record` VALUES (672, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:10:47');
INSERT INTO `log_record` VALUES (673, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-17 22:10:47');
INSERT INTO `log_record` VALUES (674, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:10:49');
INSERT INTO `log_record` VALUES (675, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:10:49');
INSERT INTO `log_record` VALUES (676, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:10:51');
INSERT INTO `log_record` VALUES (677, 'INFO', 'User null viewed category: FISH', '2025-04-17 22:10:51');
INSERT INTO `log_record` VALUES (678, 'INFO', 'User null viewed category: CATS', '2025-04-17 22:11:10');
INSERT INTO `log_record` VALUES (679, 'INFO', 'User null viewed category: CATS', '2025-04-17 22:11:10');
INSERT INTO `log_record` VALUES (680, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 22:11:12');
INSERT INTO `log_record` VALUES (681, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-17 22:11:12');
INSERT INTO `log_record` VALUES (682, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 22:11:12');
INSERT INTO `log_record` VALUES (683, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-17 22:11:12');
INSERT INTO `log_record` VALUES (684, 'INFO', 'User null viewed category: DOGS', '2025-04-17 22:11:17');
INSERT INTO `log_record` VALUES (685, 'INFO', 'User null viewed category: DOGS', '2025-04-17 22:11:17');
INSERT INTO `log_record` VALUES (686, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:25:34');
INSERT INTO `log_record` VALUES (687, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:25:34');
INSERT INTO `log_record` VALUES (688, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:25:35');
INSERT INTO `log_record` VALUES (689, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:25:35');
INSERT INTO `log_record` VALUES (690, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:25:35');
INSERT INTO `log_record` VALUES (691, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:25:35');
INSERT INTO `log_record` VALUES (692, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:25:36');
INSERT INTO `log_record` VALUES (693, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:25:36');
INSERT INTO `log_record` VALUES (694, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:25:36');
INSERT INTO `log_record` VALUES (695, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:25:36');
INSERT INTO `log_record` VALUES (696, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:25:39');
INSERT INTO `log_record` VALUES (697, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:25:39');
INSERT INTO `log_record` VALUES (698, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:25:39');
INSERT INTO `log_record` VALUES (699, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:25:39');
INSERT INTO `log_record` VALUES (700, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:28:32');
INSERT INTO `log_record` VALUES (701, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:28:32');
INSERT INTO `log_record` VALUES (702, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:28:33');
INSERT INTO `log_record` VALUES (703, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:28:33');
INSERT INTO `log_record` VALUES (704, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: PostmanRuntime/7.43.3] User viewed product: FI-SW-01', '2025-04-18 11:42:23');
INSERT INTO `log_record` VALUES (705, 'INFO', 'User null viewed product: FI-SW-01', '2025-04-18 11:42:23');
INSERT INTO `log_record` VALUES (706, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:44:39');
INSERT INTO `log_record` VALUES (707, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:44:39');
INSERT INTO `log_record` VALUES (708, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:44:47');
INSERT INTO `log_record` VALUES (709, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:44:47');
INSERT INTO `log_record` VALUES (710, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:44:48');
INSERT INTO `log_record` VALUES (711, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:44:48');
INSERT INTO `log_record` VALUES (712, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:44:48');
INSERT INTO `log_record` VALUES (713, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:44:48');
INSERT INTO `log_record` VALUES (714, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:45:00');
INSERT INTO `log_record` VALUES (715, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:45:00');
INSERT INTO `log_record` VALUES (716, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:45:06');
INSERT INTO `log_record` VALUES (717, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:45:06');
INSERT INTO `log_record` VALUES (718, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:45:06');
INSERT INTO `log_record` VALUES (719, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:45:06');
INSERT INTO `log_record` VALUES (720, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:48:07');
INSERT INTO `log_record` VALUES (721, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:48:07');
INSERT INTO `log_record` VALUES (722, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:48:20');
INSERT INTO `log_record` VALUES (723, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:48:20');
INSERT INTO `log_record` VALUES (724, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:48:21');
INSERT INTO `log_record` VALUES (725, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:48:21');
INSERT INTO `log_record` VALUES (726, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:48:21');
INSERT INTO `log_record` VALUES (727, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:48:21');
INSERT INTO `log_record` VALUES (728, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:50:33');
INSERT INTO `log_record` VALUES (729, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:50:33');
INSERT INTO `log_record` VALUES (730, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:50:49');
INSERT INTO `log_record` VALUES (731, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:50:49');
INSERT INTO `log_record` VALUES (732, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:51:04');
INSERT INTO `log_record` VALUES (733, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:51:11');
INSERT INTO `log_record` VALUES (734, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:51:11');
INSERT INTO `log_record` VALUES (735, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:51:12');
INSERT INTO `log_record` VALUES (736, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:51:12');
INSERT INTO `log_record` VALUES (737, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:51:12');
INSERT INTO `log_record` VALUES (738, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:51:12');
INSERT INTO `log_record` VALUES (739, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:51:16');
INSERT INTO `log_record` VALUES (740, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:51:16');
INSERT INTO `log_record` VALUES (741, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:51:21');
INSERT INTO `log_record` VALUES (742, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:51:21');
INSERT INTO `log_record` VALUES (743, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:51:23');
INSERT INTO `log_record` VALUES (744, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:51:23');
INSERT INTO `log_record` VALUES (745, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:51:23');
INSERT INTO `log_record` VALUES (746, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:51:23');
INSERT INTO `log_record` VALUES (747, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:51:25');
INSERT INTO `log_record` VALUES (748, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:51:25');
INSERT INTO `log_record` VALUES (749, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:51:25');
INSERT INTO `log_record` VALUES (750, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:51:25');
INSERT INTO `log_record` VALUES (751, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:51:29');
INSERT INTO `log_record` VALUES (752, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:51:29');
INSERT INTO `log_record` VALUES (753, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:51:29');
INSERT INTO `log_record` VALUES (754, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:51:29');
INSERT INTO `log_record` VALUES (755, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:53:19');
INSERT INTO `log_record` VALUES (756, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:53:19');
INSERT INTO `log_record` VALUES (757, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:53:25');
INSERT INTO `log_record` VALUES (758, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:53:25');
INSERT INTO `log_record` VALUES (759, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:53:26');
INSERT INTO `log_record` VALUES (760, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:53:26');
INSERT INTO `log_record` VALUES (761, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:53:26');
INSERT INTO `log_record` VALUES (762, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:53:26');
INSERT INTO `log_record` VALUES (763, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:53:28');
INSERT INTO `log_record` VALUES (764, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:53:28');
INSERT INTO `log_record` VALUES (765, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:53:28');
INSERT INTO `log_record` VALUES (766, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:53:28');
INSERT INTO `log_record` VALUES (767, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:53:31');
INSERT INTO `log_record` VALUES (768, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:53:31');
INSERT INTO `log_record` VALUES (769, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:53:31');
INSERT INTO `log_record` VALUES (770, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:53:31');
INSERT INTO `log_record` VALUES (771, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:53:33');
INSERT INTO `log_record` VALUES (772, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 11:53:33');
INSERT INTO `log_record` VALUES (773, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:53:33');
INSERT INTO `log_record` VALUES (774, 'INFO', 'User null viewed item: EST-4', '2025-04-18 11:53:33');
INSERT INTO `log_record` VALUES (775, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:53:38');
INSERT INTO `log_record` VALUES (776, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 11:53:38');
INSERT INTO `log_record` VALUES (777, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:53:38');
INSERT INTO `log_record` VALUES (778, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 11:53:38');
INSERT INTO `log_record` VALUES (779, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:53:41');
INSERT INTO `log_record` VALUES (780, 'INFO', 'User null viewed category: FISH', '2025-04-18 11:53:41');
INSERT INTO `log_record` VALUES (781, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:37:50');
INSERT INTO `log_record` VALUES (782, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:37:50');
INSERT INTO `log_record` VALUES (783, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:37:52');
INSERT INTO `log_record` VALUES (784, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:37:52');
INSERT INTO `log_record` VALUES (785, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:37:52');
INSERT INTO `log_record` VALUES (786, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:37:52');
INSERT INTO `log_record` VALUES (787, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 20:37:57');
INSERT INTO `log_record` VALUES (788, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 20:37:57');
INSERT INTO `log_record` VALUES (789, 'INFO', 'User null viewed item: EST-4', '2025-04-18 20:37:57');
INSERT INTO `log_record` VALUES (790, 'INFO', 'User null viewed item: EST-4', '2025-04-18 20:37:57');
INSERT INTO `log_record` VALUES (791, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:38:00');
INSERT INTO `log_record` VALUES (792, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:38:00');
INSERT INTO `log_record` VALUES (793, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:38:00');
INSERT INTO `log_record` VALUES (794, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:38:00');
INSERT INTO `log_record` VALUES (795, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:44:53');
INSERT INTO `log_record` VALUES (796, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:44:53');
INSERT INTO `log_record` VALUES (797, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:45:01');
INSERT INTO `log_record` VALUES (798, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:45:01');
INSERT INTO `log_record` VALUES (799, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:45:03');
INSERT INTO `log_record` VALUES (800, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:45:03');
INSERT INTO `log_record` VALUES (801, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:45:03');
INSERT INTO `log_record` VALUES (802, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:45:03');
INSERT INTO `log_record` VALUES (803, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:47:47');
INSERT INTO `log_record` VALUES (804, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:47:47');
INSERT INTO `log_record` VALUES (805, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:47:53');
INSERT INTO `log_record` VALUES (806, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:47:53');
INSERT INTO `log_record` VALUES (807, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:47:54');
INSERT INTO `log_record` VALUES (808, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:47:54');
INSERT INTO `log_record` VALUES (809, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:47:54');
INSERT INTO `log_record` VALUES (810, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:47:54');
INSERT INTO `log_record` VALUES (811, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:49:22');
INSERT INTO `log_record` VALUES (812, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:49:22');
INSERT INTO `log_record` VALUES (813, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:49:27');
INSERT INTO `log_record` VALUES (814, 'INFO', 'User null viewed category: FISH', '2025-04-18 20:49:27');
INSERT INTO `log_record` VALUES (815, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:49:29');
INSERT INTO `log_record` VALUES (816, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 20:49:29');
INSERT INTO `log_record` VALUES (817, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:49:29');
INSERT INTO `log_record` VALUES (818, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 20:49:29');
INSERT INTO `log_record` VALUES (819, 'INFO', 'User j2ee login success!', '2025-04-18 20:54:44');
INSERT INTO `log_record` VALUES (820, 'INFO', 'User j2ee login success!', '2025-04-18 20:56:35');
INSERT INTO `log_record` VALUES (821, 'INFO', 'User null viewed category: CATS', '2025-04-18 21:01:15');
INSERT INTO `log_record` VALUES (822, 'INFO', 'User null viewed category: CATS', '2025-04-18 21:01:15');
INSERT INTO `log_record` VALUES (823, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-18 21:01:19');
INSERT INTO `log_record` VALUES (824, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-18 21:01:19');
INSERT INTO `log_record` VALUES (825, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FL-DLH-02', '2025-04-18 21:01:19');
INSERT INTO `log_record` VALUES (826, 'INFO', 'User null viewed product: FL-DLH-02', '2025-04-18 21:01:19');
INSERT INTO `log_record` VALUES (827, 'INFO', 'User null viewed category: FISH', '2025-04-18 21:01:24');
INSERT INTO `log_record` VALUES (828, 'INFO', 'User null viewed category: FISH', '2025-04-18 21:01:24');
INSERT INTO `log_record` VALUES (829, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 21:01:26');
INSERT INTO `log_record` VALUES (830, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 21:01:26');
INSERT INTO `log_record` VALUES (831, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 21:01:26');
INSERT INTO `log_record` VALUES (832, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 21:01:26');
INSERT INTO `log_record` VALUES (833, 'INFO', 'User null viewed category: FISH', '2025-04-18 21:01:36');
INSERT INTO `log_record` VALUES (834, 'INFO', 'User null viewed category: FISH', '2025-04-18 21:01:36');
INSERT INTO `log_record` VALUES (835, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User searched product: as', '2025-04-18 21:01:40');
INSERT INTO `log_record` VALUES (836, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User searched product: 按时', '2025-04-18 21:01:41');
INSERT INTO `log_record` VALUES (837, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User searched product: dog', '2025-04-18 21:01:48');
INSERT INTO `log_record` VALUES (838, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-04-18 21:01:48');
INSERT INTO `log_record` VALUES (839, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User searched product: dog', '2025-04-18 21:01:50');
INSERT INTO `log_record` VALUES (840, 'INFO', 'User j2ee viewed product: K9-BD-01', '2025-04-18 21:01:50');
INSERT INTO `log_record` VALUES (841, 'INFO', 'User null viewed category: FISH', '2025-04-18 22:12:55');
INSERT INTO `log_record` VALUES (842, 'INFO', 'User null viewed category: FISH', '2025-04-18 22:12:55');
INSERT INTO `log_record` VALUES (843, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:00:19');
INSERT INTO `log_record` VALUES (844, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:00:25');
INSERT INTO `log_record` VALUES (845, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:00:25');
INSERT INTO `log_record` VALUES (846, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:11:40');
INSERT INTO `log_record` VALUES (847, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:11:40');
INSERT INTO `log_record` VALUES (848, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:11:42');
INSERT INTO `log_record` VALUES (849, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:11:42');
INSERT INTO `log_record` VALUES (850, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:11:42');
INSERT INTO `log_record` VALUES (851, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:11:42');
INSERT INTO `log_record` VALUES (852, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:12:24');
INSERT INTO `log_record` VALUES (853, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:12:24');
INSERT INTO `log_record` VALUES (854, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:12:25');
INSERT INTO `log_record` VALUES (855, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:12:25');
INSERT INTO `log_record` VALUES (856, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:12:25');
INSERT INTO `log_record` VALUES (857, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:12:25');
INSERT INTO `log_record` VALUES (858, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 23:12:45');
INSERT INTO `log_record` VALUES (859, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 23:12:45');
INSERT INTO `log_record` VALUES (860, 'INFO', 'User null viewed item: EST-4', '2025-04-18 23:12:45');
INSERT INTO `log_record` VALUES (861, 'INFO', 'User null viewed item: EST-4', '2025-04-18 23:12:45');
INSERT INTO `log_record` VALUES (862, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:13:03');
INSERT INTO `log_record` VALUES (863, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:13:03');
INSERT INTO `log_record` VALUES (864, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:13:03');
INSERT INTO `log_record` VALUES (865, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:13:03');
INSERT INTO `log_record` VALUES (866, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:18:12');
INSERT INTO `log_record` VALUES (867, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:18:12');
INSERT INTO `log_record` VALUES (868, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:18:17');
INSERT INTO `log_record` VALUES (869, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:18:17');
INSERT INTO `log_record` VALUES (870, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:18:18');
INSERT INTO `log_record` VALUES (871, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:18:18');
INSERT INTO `log_record` VALUES (872, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:18:18');
INSERT INTO `log_record` VALUES (873, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:18:18');
INSERT INTO `log_record` VALUES (874, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 23:19:21');
INSERT INTO `log_record` VALUES (875, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed item: EST-4', '2025-04-18 23:19:21');
INSERT INTO `log_record` VALUES (876, 'INFO', 'User null viewed item: EST-4', '2025-04-18 23:19:21');
INSERT INTO `log_record` VALUES (877, 'INFO', 'User null viewed item: EST-4', '2025-04-18 23:19:21');
INSERT INTO `log_record` VALUES (878, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:19:28');
INSERT INTO `log_record` VALUES (879, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36] User viewed product: FI-FW-01', '2025-04-18 23:19:28');
INSERT INTO `log_record` VALUES (880, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:19:28');
INSERT INTO `log_record` VALUES (881, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-18 23:19:28');
INSERT INTO `log_record` VALUES (882, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:19:29');
INSERT INTO `log_record` VALUES (883, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:19:29');
INSERT INTO `log_record` VALUES (884, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:45:28');
INSERT INTO `log_record` VALUES (885, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:45:28');
INSERT INTO `log_record` VALUES (886, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:59:49');
INSERT INTO `log_record` VALUES (887, 'INFO', 'User null viewed category: FISH', '2025-04-18 23:59:49');
INSERT INTO `log_record` VALUES (888, 'INFO', 'User null viewed category: BIRDS', '2025-04-19 00:03:48');
INSERT INTO `log_record` VALUES (889, 'INFO', 'User null viewed category: BIRDS', '2025-04-19 00:03:48');
INSERT INTO `log_record` VALUES (890, 'INFO', 'User null viewed category: BIRDS', '2025-04-19 00:15:09');
INSERT INTO `log_record` VALUES (891, 'INFO', 'User null viewed category: BIRDS', '2025-04-19 00:15:09');
INSERT INTO `log_record` VALUES (892, 'INFO', 'User null viewed category: CATS', '2025-04-19 00:15:17');
INSERT INTO `log_record` VALUES (893, 'INFO', 'User null viewed category: CATS', '2025-04-19 00:15:17');
INSERT INTO `log_record` VALUES (894, 'INFO', 'User null viewed category: FISH', '2025-04-19 00:33:18');
INSERT INTO `log_record` VALUES (895, 'INFO', 'User null viewed category: FISH', '2025-04-19 00:33:18');
INSERT INTO `log_record` VALUES (896, 'INFO', 'User null viewed category: FISH', '2025-04-19 01:21:06');
INSERT INTO `log_record` VALUES (897, 'INFO', 'User null viewed category: FISH', '2025-04-19 01:21:06');
INSERT INTO `log_record` VALUES (898, 'INFO', 'User j2ee login success!', '2025-04-20 16:34:50');
INSERT INTO `log_record` VALUES (899, 'INFO', 'User j2ee login success!', '2025-04-20 16:35:00');
INSERT INTO `log_record` VALUES (900, 'INFO', 'User j2ee login success!', '2025-04-20 16:35:01');
INSERT INTO `log_record` VALUES (901, 'INFO', 'User j2ee login success!', '2025-04-20 16:35:02');
INSERT INTO `log_record` VALUES (902, 'INFO', 'User j2ee login success!', '2025-04-20 16:35:23');
INSERT INTO `log_record` VALUES (903, 'INFO', 'User null viewed category: FISH', '2025-04-20 16:35:44');
INSERT INTO `log_record` VALUES (904, 'INFO', 'User null viewed category: FISH', '2025-04-20 16:35:44');
INSERT INTO `log_record` VALUES (905, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-20 16:35:45');
INSERT INTO `log_record` VALUES (906, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-20 16:35:45');
INSERT INTO `log_record` VALUES (907, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-20 16:35:45');
INSERT INTO `log_record` VALUES (908, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-20 16:35:45');
INSERT INTO `log_record` VALUES (909, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-20 16:35:47');
INSERT INTO `log_record` VALUES (910, 'INFO', 'User null viewed item: EST-4', '2025-04-20 16:35:47');
INSERT INTO `log_record` VALUES (911, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-20 16:35:47');
INSERT INTO `log_record` VALUES (912, 'INFO', 'User null viewed item: EST-4', '2025-04-20 16:35:47');
INSERT INTO `log_record` VALUES (913, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-20 16:36:24');
INSERT INTO `log_record` VALUES (914, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-20 16:36:24');
INSERT INTO `log_record` VALUES (915, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-20 16:36:24');
INSERT INTO `log_record` VALUES (916, 'INFO', 'User null viewed product: FI-FW-01', '2025-04-20 16:36:24');
INSERT INTO `log_record` VALUES (917, 'INFO', 'User j2ee login success!', '2025-04-20 16:36:55');
INSERT INTO `log_record` VALUES (918, 'INFO', 'User j2ee login success!', '2025-04-20 16:37:01');
INSERT INTO `log_record` VALUES (919, 'INFO', 'User j2ee login success!', '2025-04-20 16:37:02');
INSERT INTO `log_record` VALUES (920, 'INFO', 'User j2ee login success!', '2025-04-20 16:37:02');
INSERT INTO `log_record` VALUES (921, 'INFO', 'User j2ee login success!', '2025-04-20 16:37:08');
INSERT INTO `log_record` VALUES (922, 'INFO', 'User j2ee login success!', '2025-04-20 16:37:11');
INSERT INTO `log_record` VALUES (923, 'INFO', 'User j2ee login success!', '2025-04-20 16:37:11');
INSERT INTO `log_record` VALUES (924, 'INFO', 'User j2ee login success!', '2025-04-20 16:37:11');
INSERT INTO `log_record` VALUES (925, 'INFO', 'User j2ee login success!', '2025-04-26 17:38:24');
INSERT INTO `log_record` VALUES (926, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:38:28');
INSERT INTO `log_record` VALUES (927, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:38:29');
INSERT INTO `log_record` VALUES (928, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 17:38:30');
INSERT INTO `log_record` VALUES (929, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 17:38:30');
INSERT INTO `log_record` VALUES (930, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 17:38:30');
INSERT INTO `log_record` VALUES (931, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 17:38:30');
INSERT INTO `log_record` VALUES (932, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-26 17:38:58');
INSERT INTO `log_record` VALUES (933, 'INFO', 'User j2ee viewed item: EST-4', '2025-04-26 17:38:58');
INSERT INTO `log_record` VALUES (934, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-26 17:38:58');
INSERT INTO `log_record` VALUES (935, 'INFO', 'User j2ee viewed item: EST-4', '2025-04-26 17:38:58');
INSERT INTO `log_record` VALUES (936, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 17:39:05');
INSERT INTO `log_record` VALUES (937, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 17:39:05');
INSERT INTO `log_record` VALUES (938, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 17:39:05');
INSERT INTO `log_record` VALUES (939, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 17:39:05');
INSERT INTO `log_record` VALUES (940, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:42:38');
INSERT INTO `log_record` VALUES (941, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:42:38');
INSERT INTO `log_record` VALUES (942, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:42:48');
INSERT INTO `log_record` VALUES (943, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:42:48');
INSERT INTO `log_record` VALUES (944, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:43:23');
INSERT INTO `log_record` VALUES (945, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 17:43:23');
INSERT INTO `log_record` VALUES (946, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 17:43:25');
INSERT INTO `log_record` VALUES (947, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 17:43:25');
INSERT INTO `log_record` VALUES (948, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 17:43:25');
INSERT INTO `log_record` VALUES (949, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 17:43:25');
INSERT INTO `log_record` VALUES (950, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:22:19');
INSERT INTO `log_record` VALUES (951, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:22:19');
INSERT INTO `log_record` VALUES (952, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:22:21');
INSERT INTO `log_record` VALUES (953, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:22:21');
INSERT INTO `log_record` VALUES (954, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:22:21');
INSERT INTO `log_record` VALUES (955, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:22:21');
INSERT INTO `log_record` VALUES (956, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:23:01');
INSERT INTO `log_record` VALUES (957, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:23:01');
INSERT INTO `log_record` VALUES (958, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:23:03');
INSERT INTO `log_record` VALUES (959, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:23:03');
INSERT INTO `log_record` VALUES (960, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:23:03');
INSERT INTO `log_record` VALUES (961, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:23:03');
INSERT INTO `log_record` VALUES (962, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-26 19:23:13');
INSERT INTO `log_record` VALUES (963, 'INFO', 'User j2ee viewed item: EST-4', '2025-04-26 19:23:13');
INSERT INTO `log_record` VALUES (964, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-26 19:23:13');
INSERT INTO `log_record` VALUES (965, 'INFO', 'User j2ee viewed item: EST-4', '2025-04-26 19:23:13');
INSERT INTO `log_record` VALUES (966, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:23:15');
INSERT INTO `log_record` VALUES (967, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:23:15');
INSERT INTO `log_record` VALUES (968, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:23:15');
INSERT INTO `log_record` VALUES (969, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:23:15');
INSERT INTO `log_record` VALUES (970, 'INFO', 'User j2ee login success!', '2025-04-26 19:23:46');
INSERT INTO `log_record` VALUES (971, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:23:47');
INSERT INTO `log_record` VALUES (972, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:23:47');
INSERT INTO `log_record` VALUES (973, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:23:48');
INSERT INTO `log_record` VALUES (974, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:23:48');
INSERT INTO `log_record` VALUES (975, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:23:48');
INSERT INTO `log_record` VALUES (976, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:23:48');
INSERT INTO `log_record` VALUES (977, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:27:06');
INSERT INTO `log_record` VALUES (978, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:27:06');
INSERT INTO `log_record` VALUES (979, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:27:08');
INSERT INTO `log_record` VALUES (980, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:27:08');
INSERT INTO `log_record` VALUES (981, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:27:08');
INSERT INTO `log_record` VALUES (982, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:27:08');
INSERT INTO `log_record` VALUES (983, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:34:12');
INSERT INTO `log_record` VALUES (984, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:34:12');
INSERT INTO `log_record` VALUES (985, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:34:13');
INSERT INTO `log_record` VALUES (986, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:34:13');
INSERT INTO `log_record` VALUES (987, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:34:13');
INSERT INTO `log_record` VALUES (988, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:34:13');
INSERT INTO `log_record` VALUES (989, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:41:30');
INSERT INTO `log_record` VALUES (990, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:41:30');
INSERT INTO `log_record` VALUES (991, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:41:31');
INSERT INTO `log_record` VALUES (992, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:41:31');
INSERT INTO `log_record` VALUES (993, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:41:31');
INSERT INTO `log_record` VALUES (994, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:41:31');
INSERT INTO `log_record` VALUES (995, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-26 19:41:34');
INSERT INTO `log_record` VALUES (996, 'INFO', 'User j2ee viewed item: EST-4', '2025-04-26 19:41:34');
INSERT INTO `log_record` VALUES (997, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed item: EST-4', '2025-04-26 19:41:34');
INSERT INTO `log_record` VALUES (998, 'INFO', 'User j2ee viewed item: EST-4', '2025-04-26 19:41:34');
INSERT INTO `log_record` VALUES (999, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:41:44');
INSERT INTO `log_record` VALUES (1000, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:41:44');
INSERT INTO `log_record` VALUES (1001, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:41:44');
INSERT INTO `log_record` VALUES (1002, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:41:44');
INSERT INTO `log_record` VALUES (1003, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:48:43');
INSERT INTO `log_record` VALUES (1004, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:48:43');
INSERT INTO `log_record` VALUES (1005, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:48:46');
INSERT INTO `log_record` VALUES (1006, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:48:47');
INSERT INTO `log_record` VALUES (1007, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:48:47');
INSERT INTO `log_record` VALUES (1008, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:48:47');
INSERT INTO `log_record` VALUES (1009, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:49:52');
INSERT INTO `log_record` VALUES (1010, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:49:52');
INSERT INTO `log_record` VALUES (1011, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:49:52');
INSERT INTO `log_record` VALUES (1012, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:49:52');
INSERT INTO `log_record` VALUES (1013, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:52:29');
INSERT INTO `log_record` VALUES (1014, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:52:29');
INSERT INTO `log_record` VALUES (1015, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:52:31');
INSERT INTO `log_record` VALUES (1016, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:52:31');
INSERT INTO `log_record` VALUES (1017, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:52:31');
INSERT INTO `log_record` VALUES (1018, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:52:31');
INSERT INTO `log_record` VALUES (1019, 'INFO', 'Userj2ee added EST-4 to cart ', '2025-04-26 19:52:32');
INSERT INTO `log_record` VALUES (1020, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:52:35');
INSERT INTO `log_record` VALUES (1021, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:52:35');
INSERT INTO `log_record` VALUES (1022, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:52:35');
INSERT INTO `log_record` VALUES (1023, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:52:35');
INSERT INTO `log_record` VALUES (1024, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:52:36');
INSERT INTO `log_record` VALUES (1025, 'INFO', 'User j2ee viewed category: FISH', '2025-04-26 19:52:36');
INSERT INTO `log_record` VALUES (1026, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:52:37');
INSERT INTO `log_record` VALUES (1027, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:52:37');
INSERT INTO `log_record` VALUES (1028, 'INFO', '[IP: 0:0:0:0:0:0:0:1] [User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0] User viewed product: FI-FW-01', '2025-04-26 19:52:37');
INSERT INTO `log_record` VALUES (1029, 'INFO', 'User j2ee viewed product: FI-FW-01', '2025-04-26 19:52:37');
INSERT INTO `log_record` VALUES (1030, 'INFO', 'Userj2ee added EST-4 to cart ', '2025-04-26 19:52:38');
INSERT INTO `log_record` VALUES (1031, 'INFO', 'User j2ee login success!', '2025-06-02 16:37:34');
INSERT INTO `log_record` VALUES (1032, 'INFO', 'User j2ee login success!', '2025-06-02 16:38:01');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int(11) NOT NULL,
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderdate` timestamp NOT NULL,
  `shipaddr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipaddr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipcity` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipstate` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipzip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shipcountry` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billaddr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billaddr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `billcity` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billstate` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billzip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billcountry` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `courier` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totalprice` decimal(10, 2) NOT NULL,
  `billtofirstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `billtolastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shiptofirstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shiptolastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creditcard` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exprdate` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cardtype` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `locale` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1009, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 387.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1011, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 555.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1012, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1013, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1014, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1015, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 305.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1016, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1017, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 15.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1018, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 333.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1019, 'j2ee', '2024-11-06 00:00:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 325.29, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1021, 'j2ee', '2024-11-06 18:38:23', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 982.89, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1022, 'j2ee', '2024-11-06 18:39:54', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 983.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1023, 'j2ee', '2024-11-06 18:59:33', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 387.00, '111', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1024, 'j2ee', '2024-11-06 19:00:06', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '8555113241`', 'CHN4`43', 'UPS', 0.00, '111', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1025, 'j2ee', '2024-11-06 19:05:50', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, '111', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1026, 'j2ee', '2024-11-06 19:12:29', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 387.00, '111', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1027, 'j2ee', '2024-11-06 19:14:03', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, '11111111', '11111111', 'Uuu', 'Ding', '999 9999 9999 1111', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1028, 'j2ee', '2024-11-06 19:16:29', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', '11', '11111', '111', 'UPS', 193.50, '1111111', '1111111', 'Uuu', 'Ding', '999 9999 1111 1111', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1029, 'j2ee', '2024-11-06 19:24:24', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 1935.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1030, 'j2ee', '2024-11-11 20:39:51', 'gasd', 'hnagsdg', 'mysagd', 'scgad', '31255', 'KAF', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 967.50, 'Uuu', 'Ding', '111111111', 'fd gagz', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1031, 'j2ee', '2024-11-11 21:11:10', '31524321', '423', '2153', '523', '512435', '5145', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', '231314', '34125', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1032, 'j2ee', '2024-11-11 21:14:14', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 155.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1033, 'j2ee', '2024-11-13 23:43:51', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 185.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1034, 'j2ee', '2024-12-21 17:18:35', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 15.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1035, 'j2ee', '2024-12-21 19:18:45', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1036, 'j2ee', '2024-12-21 20:01:20', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1037, 'j2ee', '2024-12-21 21:10:52', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1038, 'j2ee', '2024-12-21 21:15:27', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 18.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1039, 'j2ee', '2024-12-21 21:20:20', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1040, 'j2ee', '2024-12-21 22:18:47', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 1741.50, 'Uuu', 'Ding', '111', '111', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1041, 'j2ee', '2024-12-23 14:31:55', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1042, 'j2ee', '2024-12-23 14:33:48', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1043, 'j2ee', '2024-12-23 14:37:14', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1044, 'j2ee', '2024-12-23 14:40:35', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1045, 'j2ee', '2024-12-23 14:42:03', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 387.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1046, 'j2ee', '2024-12-23 14:46:29', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1047, 'j2ee', '2024-12-23 14:53:29', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1048, 'j2ee', '2024-12-23 14:54:51', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', 'CHN', '85551', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1049, 'j2ee', '2024-12-23 14:59:11', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1050, 'j2ee', '2024-12-23 15:03:00', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1051, 'j2ee', '2024-12-23 15:05:16', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1052, 'j2ee', '2024-12-23 15:06:23', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1053, 'j2ee', '2024-12-23 15:12:16', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1054, 'j2ee', '2024-12-23 15:12:33', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 1023.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1055, 'j2ee', '2024-12-23 15:27:22', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1056, 'j2ee', '2024-12-23 15:29:53', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 212.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1057, 'j2ee', '2024-12-23 15:31:19', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1058, 'j2ee', '2024-12-25 08:23:01', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1059, 'j2ee', '2024-12-25 08:23:25', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1060, 'j2ee', '2024-12-25 08:37:34', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'sc', 'hn', 'my', 'sc', '85551', 'CHN', 'UPS', 402.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1061, 'j2ee', '2024-12-26 16:48:08', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'UPS', 193.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1062, 'j2ee', '2025-01-19 13:41:36', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'UPS', 967.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1063, '1', '2025-03-16 00:53:28', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'UPS', 18.50, '1', '1', '1', '1', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1064, '1', '2025-03-16 00:53:36', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'UPS', 18.50, '1', '1', '1', '1', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1065, 'j2ee', '2025-03-16 16:02:20', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1066, 'j2ee', '2025-03-16 16:06:29', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1067, 'j2ee', '2025-03-16 16:28:55', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1068, 'j2ee', '2025-03-16 16:32:41', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1069, 'j2ee', '2025-03-16 16:38:46', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1070, 'j2ee', '2025-03-16 16:40:51', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1071, 'j2ee', '2025-03-16 16:42:31', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1072, 'j2ee', '2025-03-16 16:44:42', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1073, 'j2ee', '2025-03-16 16:48:13', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1074, 'j2ee', '2025-03-16 16:59:49', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1075, 'j2ee', '2025-03-16 17:02:38', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1076, 'j2ee', '2025-03-16 17:13:50', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1077, 'j2ee', '2025-03-16 17:15:47', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1078, 'j2ee', '2025-03-16 17:16:29', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UIO', 123.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'ads');
INSERT INTO `orders` VALUES (1079, 'j2ee', '2025-03-16 19:17:17', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UPS', 55.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1080, '1111', '2004-11-24 00:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1.00, '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `orders` VALUES (1081, 'j2ee', '2025-03-16 19:18:11', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UPS', 34.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1082, 'j2ee', '2025-03-17 14:11:33', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UPS', 93.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1083, 'j2ee', '2025-03-23 14:07:00', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UPS', 204.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1084, 'j2ee', '2025-04-07 14:35:17', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UPS', 1161.00, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');
INSERT INTO `orders` VALUES (1085, 'j2ee', '2025-04-09 10:07:49', 'sc', 'hn', 'my', '1', '85551', 'CHN', 'sc', 'hn', 'my', '1', 'CHN', '85551', 'UPS', 18.50, 'Uuu', 'Ding', 'Uuu', 'Ding', '999 9999 9999 9999', '12/03', 'Visa', 'CA');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES (1009, 1009, '2024-11-06', 'S');
INSERT INTO `orderstatus` VALUES (1011, 1011, '2024-11-06', 'S');
INSERT INTO `orderstatus` VALUES (1012, 1012, '2024-11-06', 'S');
INSERT INTO `orderstatus` VALUES (1013, 1013, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1014, 1014, '2024-11-06', 'S');
INSERT INTO `orderstatus` VALUES (1015, 1015, '2024-11-06', '');
INSERT INTO `orderstatus` VALUES (1016, 1016, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1017, 1017, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1018, 1018, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1019, 1019, '2024-11-06', 'S');
INSERT INTO `orderstatus` VALUES (1021, 1021, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1022, 1022, '2024-11-06', 'S');
INSERT INTO `orderstatus` VALUES (1023, 1023, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1024, 1024, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1025, 1025, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1026, 1026, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1027, 1027, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1028, 1028, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1029, 1029, '2024-11-06', 'P');
INSERT INTO `orderstatus` VALUES (1030, 1030, '2024-11-11', 'P');
INSERT INTO `orderstatus` VALUES (1031, 1031, '2024-11-11', 'P');
INSERT INTO `orderstatus` VALUES (1032, 1032, '2024-11-11', 'P');
INSERT INTO `orderstatus` VALUES (1033, 1033, '2024-11-13', 'P');
INSERT INTO `orderstatus` VALUES (1034, 1034, '2024-12-21', 'P');
INSERT INTO `orderstatus` VALUES (1035, 1035, '2024-12-21', 'P');
INSERT INTO `orderstatus` VALUES (1036, 1036, '2024-12-21', 'P');
INSERT INTO `orderstatus` VALUES (1037, 1037, '2024-12-21', 'P');
INSERT INTO `orderstatus` VALUES (1038, 1038, '2024-12-21', 'P');
INSERT INTO `orderstatus` VALUES (1039, 1039, '2024-12-21', 'P');
INSERT INTO `orderstatus` VALUES (1040, 1040, '2024-12-21', 'P');
INSERT INTO `orderstatus` VALUES (1041, 1041, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1042, 1042, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1043, 1043, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1044, 1044, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1045, 1045, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1046, 1046, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1047, 1047, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1048, 1048, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1049, 1049, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1050, 1050, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1051, 1051, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1052, 1052, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1053, 1053, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1054, 1054, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1055, 1055, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1056, 1056, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1057, 1057, '2024-12-23', 'P');
INSERT INTO `orderstatus` VALUES (1058, 1058, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1059, 1059, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1060, 1060, '2024-12-25', 'P');
INSERT INTO `orderstatus` VALUES (1061, 1061, '2024-12-26', 'P');
INSERT INTO `orderstatus` VALUES (1062, 1062, '2025-01-19', 'P');
INSERT INTO `orderstatus` VALUES (1063, 1063, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1064, 1064, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1065, 1065, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1066, 1066, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1067, 1067, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1068, 1068, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1069, 1069, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1070, 1070, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1071, 1071, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1072, 1072, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1073, 1073, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1074, 1074, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1075, 1075, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1076, 1076, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1077, 1077, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1078, 1078, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1079, 1079, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1081, 1081, '2025-03-16', 'P');
INSERT INTO `orderstatus` VALUES (1082, 1082, '2025-03-17', 'P');
INSERT INTO `orderstatus` VALUES (1083, 1083, '2025-03-23', 'P');
INSERT INTO `orderstatus` VALUES (1084, 1084, '2025-04-07', 'P');
INSERT INTO `orderstatus` VALUES (1085, 1085, '2025-04-09', 'P');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productCat`(`category` ASC) USING BTREE,
  INDEX `productName`(`name` ASC) USING BTREE,
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', '/src/images/bird2.gif');
INSERT INTO `product` VALUES ('AV-SB-02', 'BIRDS', 'Finch', '/src/images/bird1.gif');
INSERT INTO `product` VALUES ('FI-FW-01', 'FISH', 'Koi', '/src/images/fish3.gif');
INSERT INTO `product` VALUES ('FI-FW-02', 'FISH', 'Goldfish', '/src/images/fish2.gif');
INSERT INTO `product` VALUES ('FI-SW-01', 'FISH', 'Angelfish', '/src/images/fish1.gif');
INSERT INTO `product` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', '/src/images/fish4.gif');
INSERT INTO `product` VALUES ('FL-DLH-02', 'CATS', 'Persian', '/src/images/cat1.gif');
INSERT INTO `product` VALUES ('FL-DSH-01', 'CATS', 'Manx', '/src/images/cat2.gif');
INSERT INTO `product` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', '/src/images/dog2.gif');
INSERT INTO `product` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', '/src/images/dog4.gif');
INSERT INTO `product` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', '/src/images/dog5.gif');
INSERT INTO `product` VALUES ('K9-PO-02', 'DOGS', 'Poodle', '/src/images/dog6.gif');
INSERT INTO `product` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', '/src/images/dog1.gif');
INSERT INTO `product` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', '/src/images/dog5.gif');
INSERT INTO `product` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', '/src/images/lizard1.gif');
INSERT INTO `product` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', '/src/images/snake1.gif');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `langpref` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `favcategory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mylistopt` int(11) NULL DEFAULT NULL,
  `banneropt` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'english', 'FISH', 1, 0);
INSERT INTO `profile` VALUES ('111', '1', '1', 0, 0);
INSERT INTO `profile` VALUES ('123', 'english', 'DOGS', 0, 0);
INSERT INTO `profile` VALUES ('1234', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('12345', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('123456', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('1234567', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('12345678', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('123456789', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('1234567890', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('12345678901', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('222', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('2314324', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('234', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('3254532', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('333', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('345', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('456', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('567', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('676875432', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('6768754321', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('a', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('ACID', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('admin', 'english', 'FISH', 0, 0);
INSERT INTO `profile` VALUES ('j2ee', 'japanese', 'FISH', 1, 1);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nextid` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('ordernum', 1086);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('1', '1', 1);
INSERT INTO `signon` VALUES ('111', '111', 0);
INSERT INTO `signon` VALUES ('123', '123', 0);
INSERT INTO `signon` VALUES ('1234', '123', 0);
INSERT INTO `signon` VALUES ('12345', '123', 0);
INSERT INTO `signon` VALUES ('123456', '123', 0);
INSERT INTO `signon` VALUES ('1234567', '123', 0);
INSERT INTO `signon` VALUES ('12345678', '123', 0);
INSERT INTO `signon` VALUES ('123456789', '123', 0);
INSERT INTO `signon` VALUES ('1234567890', '123', 0);
INSERT INTO `signon` VALUES ('12345678901', '123', 0);
INSERT INTO `signon` VALUES ('222', '222', 0);
INSERT INTO `signon` VALUES ('2314324', '123', 0);
INSERT INTO `signon` VALUES ('234', '123', 0);
INSERT INTO `signon` VALUES ('3254532', '123', 0);
INSERT INTO `signon` VALUES ('333', '333', 0);
INSERT INTO `signon` VALUES ('345', '123', 0);
INSERT INTO `signon` VALUES ('432154323', '123', 0);
INSERT INTO `signon` VALUES ('456', '123', 0);
INSERT INTO `signon` VALUES ('567', '123', 0);
INSERT INTO `signon` VALUES ('676875432', '123', 0);
INSERT INTO `signon` VALUES ('6768754321', '123', 0);
INSERT INTO `signon` VALUES ('a', 'a', 0);
INSERT INTO `signon` VALUES ('ACID', 'ACID', 0);
INSERT INTO `signon` VALUES ('j2ee', 'j2ee', 0);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `suppid` int(11) NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `zip` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

-- ----------------------------
-- Table structure for user_activity_log
-- ----------------------------
DROP TABLE IF EXISTS `user_activity_log`;
CREATE TABLE `user_activity_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timestamp` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_activity_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_activity_log
-- ----------------------------
INSERT INTO `user_activity_log` VALUES (1, 'j2ee', 'Add to Cart', 'EST-18', '2024-10-31 20:27:39');
INSERT INTO `user_activity_log` VALUES (2, 'j2ee', 'browse item', 'EST-18', '2024-10-31 20:33:32');
INSERT INTO `user_activity_log` VALUES (3, 'j2ee', 'browse item', 'EST-19', '2024-10-31 23:46:27');
INSERT INTO `user_activity_log` VALUES (4, 'j2ee', 'Add to Cart', 'EST-19', '2024-10-31 23:46:38');
INSERT INTO `user_activity_log` VALUES (5, 'j2ee', 'Add to Cart', 'EST-16', '2024-11-04 11:36:36');
INSERT INTO `user_activity_log` VALUES (6, 'j2ee', 'Add to Cart', 'EST-13', '2024-11-04 22:54:46');
INSERT INTO `user_activity_log` VALUES (7, 'j2ee', 'Add to Cart', 'EST-6', '2024-11-04 22:56:21');
INSERT INTO `user_activity_log` VALUES (9, 'j2ee', 'Add to Cart', 'EST-6', '2024-11-04 22:58:24');
INSERT INTO `user_activity_log` VALUES (11, 'j2ee', 'Add to Cart', 'EST-4', '2024-11-04 23:04:37');
INSERT INTO `user_activity_log` VALUES (13, 'j2ee', 'Add to Cart', 'EST-5', '2024-11-04 23:05:47');
INSERT INTO `user_activity_log` VALUES (15, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-04 23:20:27');
INSERT INTO `user_activity_log` VALUES (16, 'j2ee', 'Add to Cart', 'EST-19', '2024-11-04 23:20:44');
INSERT INTO `user_activity_log` VALUES (17, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-04 23:25:01');
INSERT INTO `user_activity_log` VALUES (18, 'j2ee', 'Create Order', 'EST-18', '2024-11-04 23:25:04');
INSERT INTO `user_activity_log` VALUES (19, 'j2ee', 'Add to Cart', 'EST-13', '2024-11-04 23:25:45');
INSERT INTO `user_activity_log` VALUES (20, 'j2ee', 'Add to Cart', 'EST-7', '2024-11-04 23:26:32');
INSERT INTO `user_activity_log` VALUES (21, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-04 23:30:17');
INSERT INTO `user_activity_log` VALUES (22, 'j2ee', 'Create Order', 'EST-18', '2024-11-04 23:30:20');
INSERT INTO `user_activity_log` VALUES (23, 'j2ee', 'Add to Cart', 'EST-19', '2024-11-04 23:30:42');
INSERT INTO `user_activity_log` VALUES (24, 'j2ee', 'Create Order', 'EST-18, EST-19', '2024-11-04 23:30:45');
INSERT INTO `user_activity_log` VALUES (25, 'j2ee', 'Add to Cart', 'EST-4', '2024-11-05 00:45:20');
INSERT INTO `user_activity_log` VALUES (26, 'j2ee', 'Create Order', 'EST-4', '2024-11-05 00:45:24');
INSERT INTO `user_activity_log` VALUES (27, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 09:48:47');
INSERT INTO `user_activity_log` VALUES (28, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 09:48:51');
INSERT INTO `user_activity_log` VALUES (29, 'jz11', 'Create Order', 'EST-18', '2024-11-05 09:48:57');
INSERT INTO `user_activity_log` VALUES (30, 'jz11', 'Add to Cart', 'EST-13', '2024-11-05 09:49:48');
INSERT INTO `user_activity_log` VALUES (31, 'jz11', 'Create Order', 'EST-18, EST-13', '2024-11-05 09:49:56');
INSERT INTO `user_activity_log` VALUES (32, 'jz11', 'Add to Cart', 'EST-13', '2024-11-05 09:55:00');
INSERT INTO `user_activity_log` VALUES (33, 'jz11', 'browse item', 'EST-18', '2024-11-05 09:55:02');
INSERT INTO `user_activity_log` VALUES (34, 'jz11', 'browse item', 'EST-18', '2024-11-05 09:55:08');
INSERT INTO `user_activity_log` VALUES (35, 'jz11', 'Create Order', 'EST-18, EST-13', '2024-11-05 09:55:15');
INSERT INTO `user_activity_log` VALUES (36, 'j2ee', 'browse item', 'EST-18', '2024-11-05 10:34:36');
INSERT INTO `user_activity_log` VALUES (37, 'jz11', 'Add to Cart', 'EST-4', '2024-11-05 10:38:56');
INSERT INTO `user_activity_log` VALUES (38, 'jz11', 'Create Order', 'EST-4', '2024-11-05 10:39:02');
INSERT INTO `user_activity_log` VALUES (39, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 10:44:14');
INSERT INTO `user_activity_log` VALUES (40, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 10:44:17');
INSERT INTO `user_activity_log` VALUES (41, 'jz11', 'Create Order', 'EST-18', '2024-11-05 10:44:21');
INSERT INTO `user_activity_log` VALUES (42, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 10:45:22');
INSERT INTO `user_activity_log` VALUES (43, 'jz11', 'Create Order', 'EST-18', '2024-11-05 10:45:24');
INSERT INTO `user_activity_log` VALUES (44, 'jz11', 'Add to Cart', 'EST-19', '2024-11-05 10:51:58');
INSERT INTO `user_activity_log` VALUES (45, 'jz11', 'Create Order', 'EST-19', '2024-11-05 10:52:01');
INSERT INTO `user_activity_log` VALUES (46, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 11:18:07');
INSERT INTO `user_activity_log` VALUES (47, 'jz11', 'Create Order', 'EST-18', '2024-11-05 11:18:31');
INSERT INTO `user_activity_log` VALUES (48, 'j2ee', 'Add to Cart', 'EST-4', '2024-11-05 11:20:49');
INSERT INTO `user_activity_log` VALUES (49, 'j2ee', 'Create Order', 'EST-4', '2024-11-05 11:21:02');
INSERT INTO `user_activity_log` VALUES (50, 'j2ee', 'Add to Cart', 'EST-21', '2024-11-05 11:21:15');
INSERT INTO `user_activity_log` VALUES (51, 'j2ee', 'Create Order', 'EST-21', '2024-11-05 11:21:19');
INSERT INTO `user_activity_log` VALUES (52, 'j2ee', 'Add to Cart', 'EST-1', '2024-11-05 11:25:19');
INSERT INTO `user_activity_log` VALUES (53, 'j2ee', 'Create Order', 'EST-1', '2024-11-05 11:25:34');
INSERT INTO `user_activity_log` VALUES (54, 'jz11', 'Add to Cart', 'EST-19', '2024-11-05 12:38:23');
INSERT INTO `user_activity_log` VALUES (55, 'jz11', 'Create Order', 'EST-19', '2024-11-05 12:38:28');
INSERT INTO `user_activity_log` VALUES (56, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 12:46:28');
INSERT INTO `user_activity_log` VALUES (57, 'jz11', 'Create Order', 'EST-18', '2024-11-05 12:46:31');
INSERT INTO `user_activity_log` VALUES (59, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 13:05:50');
INSERT INTO `user_activity_log` VALUES (60, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 13:05:59');
INSERT INTO `user_activity_log` VALUES (61, 'jz11', 'Add to Cart', 'EST-1', '2024-11-05 13:06:10');
INSERT INTO `user_activity_log` VALUES (63, 'jz11', 'Add to Cart', 'EST-19', '2024-11-05 18:42:05');
INSERT INTO `user_activity_log` VALUES (66, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 18:53:14');
INSERT INTO `user_activity_log` VALUES (68, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-05 22:14:48');
INSERT INTO `user_activity_log` VALUES (69, 'j2ee', 'Add to Cart', 'EST-4', '2024-11-05 22:26:47');
INSERT INTO `user_activity_log` VALUES (70, 'jz11', 'Add to Cart', 'EST-18', '2024-11-05 23:31:47');
INSERT INTO `user_activity_log` VALUES (72, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-05 23:35:29');
INSERT INTO `user_activity_log` VALUES (73, 'jz11', 'Add to Cart', 'EST-4', '2024-11-05 23:45:45');
INSERT INTO `user_activity_log` VALUES (74, 'jz11', 'Create Order', 'EST-4', '2024-11-05 23:45:49');
INSERT INTO `user_activity_log` VALUES (75, 'jz11', 'browse item', 'EST-4', '2024-11-05 23:46:27');
INSERT INTO `user_activity_log` VALUES (76, 'jz11', 'Add to Cart', 'EST-4', '2024-11-05 23:46:33');
INSERT INTO `user_activity_log` VALUES (77, 'jz11', 'Create Order', 'EST-4', '2024-11-05 23:46:37');
INSERT INTO `user_activity_log` VALUES (78, 'jz11', 'Add to Cart', 'EST-28', '2024-11-05 23:48:58');
INSERT INTO `user_activity_log` VALUES (79, 'jz11', 'Add to Cart', 'EST-28', '2024-11-05 23:49:01');
INSERT INTO `user_activity_log` VALUES (80, 'jz11', 'Create Order', 'EST-28', '2024-11-05 23:49:04');
INSERT INTO `user_activity_log` VALUES (81, 'j2ee', 'Add to Cart', 'EST-4', '2024-11-05 23:50:12');
INSERT INTO `user_activity_log` VALUES (82, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-05 23:53:02');
INSERT INTO `user_activity_log` VALUES (83, 'jz11', 'Add to Cart', 'EST-4', '2024-11-05 23:55:19');
INSERT INTO `user_activity_log` VALUES (84, 'jz11', 'Create Order', 'EST-4', '2024-11-05 23:55:26');
INSERT INTO `user_activity_log` VALUES (85, 'j2ee', 'Add to Cart', 'EST-16', '2024-11-05 23:58:39');
INSERT INTO `user_activity_log` VALUES (86, 'j2ee', 'Add to Cart', 'EST-27', '2024-11-05 23:59:26');
INSERT INTO `user_activity_log` VALUES (87, 'j2ee', 'Create Order', 'EST-16', '2024-11-06 00:00:33');
INSERT INTO `user_activity_log` VALUES (88, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 00:06:40');
INSERT INTO `user_activity_log` VALUES (89, 'j2ee', 'Add to Cart', 'EST-19', '2024-11-06 00:06:53');
INSERT INTO `user_activity_log` VALUES (90, 'jz11', 'Add to Cart', 'EST-13', '2024-11-06 00:07:12');
INSERT INTO `user_activity_log` VALUES (91, 'jz11', 'Add to Cart', 'EST-13', '2024-11-06 00:07:14');
INSERT INTO `user_activity_log` VALUES (92, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 00:18:00');
INSERT INTO `user_activity_log` VALUES (93, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 00:19:01');
INSERT INTO `user_activity_log` VALUES (94, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 00:20:43');
INSERT INTO `user_activity_log` VALUES (95, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 00:26:31');
INSERT INTO `user_activity_log` VALUES (96, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 00:44:30');
INSERT INTO `user_activity_log` VALUES (97, 'jz11', 'Add to Cart', 'EST-6', '2024-11-06 01:14:49');
INSERT INTO `user_activity_log` VALUES (98, 'jz11', 'Add to Cart', 'EST-4', '2024-11-06 01:15:08');
INSERT INTO `user_activity_log` VALUES (99, 'jz11', 'Add to Cart', 'EST-27', '2024-11-06 01:15:18');
INSERT INTO `user_activity_log` VALUES (100, 'jz11', 'Add to Cart', 'EST-4', '2024-11-06 01:15:56');
INSERT INTO `user_activity_log` VALUES (101, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27', '2024-11-06 01:16:32');
INSERT INTO `user_activity_log` VALUES (102, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27', '2024-11-06 01:22:19');
INSERT INTO `user_activity_log` VALUES (103, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27', '2024-11-06 01:30:31');
INSERT INTO `user_activity_log` VALUES (104, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27', '2024-11-06 01:30:45');
INSERT INTO `user_activity_log` VALUES (105, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27', '2024-11-06 01:33:51');
INSERT INTO `user_activity_log` VALUES (106, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27', '2024-11-06 01:35:04');
INSERT INTO `user_activity_log` VALUES (107, 'jz11', 'Add to Cart', 'EST-18', '2024-11-06 08:00:40');
INSERT INTO `user_activity_log` VALUES (108, 'jz11', 'Create Order', 'EST-18', '2024-11-06 08:00:43');
INSERT INTO `user_activity_log` VALUES (109, 'jz11', 'Add to Cart', 'EST-16', '2024-11-06 08:02:49');
INSERT INTO `user_activity_log` VALUES (110, 'jz11', 'browse item', 'EST-6', '2024-11-06 08:10:03');
INSERT INTO `user_activity_log` VALUES (111, 'j2ee', 'Create Order', 'EST-18', '2024-11-06 08:11:05');
INSERT INTO `user_activity_log` VALUES (112, 'j2ee', 'Add to Cart', 'EST-4', '2024-11-06 08:13:05');
INSERT INTO `user_activity_log` VALUES (113, 'j2ee', 'Create Order', 'EST-4', '2024-11-06 08:13:08');
INSERT INTO `user_activity_log` VALUES (114, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 08:18:25');
INSERT INTO `user_activity_log` VALUES (115, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 08:26:37');
INSERT INTO `user_activity_log` VALUES (116, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 08:29:37');
INSERT INTO `user_activity_log` VALUES (117, 'j2ee', 'Add to Cart', 'EST-18', '2024-11-06 08:32:00');
INSERT INTO `user_activity_log` VALUES (118, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 08:36:02');
INSERT INTO `user_activity_log` VALUES (119, 'jz11', 'Add to Cart', 'EST-18', '2024-11-06 08:42:10');
INSERT INTO `user_activity_log` VALUES (120, 'jz11', 'Add to Cart', 'EST-18', '2024-11-06 08:42:13');
INSERT INTO `user_activity_log` VALUES (121, 'jz11', 'Create Order', 'EST-18', '2024-11-06 08:42:45');
INSERT INTO `user_activity_log` VALUES (122, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 08:46:43');
INSERT INTO `user_activity_log` VALUES (123, 'j2ee', 'browse item', 'EST-18', '2024-11-06 08:48:09');
INSERT INTO `user_activity_log` VALUES (124, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 08:51:01');
INSERT INTO `user_activity_log` VALUES (125, 'jz11', 'Add to Cart', 'EST-6', '2024-11-06 08:57:20');
INSERT INTO `user_activity_log` VALUES (126, 'jz11', 'browse item', 'EST-6', '2024-11-06 08:57:26');
INSERT INTO `user_activity_log` VALUES (127, 'jz11', 'Add to Cart', 'EST-6', '2024-11-06 08:57:28');
INSERT INTO `user_activity_log` VALUES (128, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 08:57:30');
INSERT INTO `user_activity_log` VALUES (129, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 09:00:00');
INSERT INTO `user_activity_log` VALUES (130, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 09:11:05');
INSERT INTO `user_activity_log` VALUES (131, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 09:17:39');
INSERT INTO `user_activity_log` VALUES (132, 'j2ee', 'Create Order', 'EST-18', '2024-11-06 09:31:48');
INSERT INTO `user_activity_log` VALUES (133, 'jz11', 'Create Order', 'EST-6, EST-4, EST-27, EST-18, EST-16', '2024-11-06 09:46:23');
INSERT INTO `user_activity_log` VALUES (134, 'jz11', 'Add to Cart', 'EST-4', '2024-11-06 09:47:20');
INSERT INTO `user_activity_log` VALUES (135, 'jz11', 'Create Order', 'EST-27, EST-18, EST-16, EST-4', '2024-11-06 09:47:29');
INSERT INTO `user_activity_log` VALUES (136, 'lxx', 'Add to Cart', 'EST-18', '2024-11-06 09:48:53');
INSERT INTO `user_activity_log` VALUES (137, 'lxx', 'Add to Cart', 'EST-18', '2024-11-06 09:48:54');
INSERT INTO `user_activity_log` VALUES (138, 'jz11', 'Add to Cart', 'EST-13', '2024-11-06 09:52:41');
INSERT INTO `user_activity_log` VALUES (139, 'zxy111', 'Add to Cart', 'EST-18', '2024-11-06 09:57:38');
INSERT INTO `user_activity_log` VALUES (140, 'zxy111', 'Create Order', 'EST-18, EST-16, EST-13', '2024-11-06 09:58:06');
INSERT INTO `user_activity_log` VALUES (141, 'jz11', 'Create Order', 'EST-18, EST-16, EST-4, EST-13', '2024-11-06 12:35:13');

-- ----------------------------
-- Table structure for user_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_details` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `request_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_logs
-- ----------------------------
INSERT INTO `user_logs` VALUES (1, '', 'Browse category', 'category ID: FISH', '2024-11-11 21:18:48');
INSERT INTO `user_logs` VALUES (2, '', 'Browse product', 'product ID: FI-FW-01', '2024-11-11 21:18:50');
INSERT INTO `user_logs` VALUES (3, '', 'Add to Cart', 'category - product - item: FISH - FI-FW-01 - EST-4', '2024-11-11 21:18:52');
INSERT INTO `user_logs` VALUES (4, '', 'Browse category', 'category ID: FISH', '2024-11-11 21:24:54');
INSERT INTO `user_logs` VALUES (5, '', 'Browse category', 'category ID: BIRDS', '2024-11-13 23:27:07');
INSERT INTO `user_logs` VALUES (6, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-11-13 23:29:36');
INSERT INTO `user_logs` VALUES (7, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-11-13 23:29:37');
INSERT INTO `user_logs` VALUES (8, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-11-13 23:29:38');
INSERT INTO `user_logs` VALUES (9, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-11-13 23:32:56');
INSERT INTO `user_logs` VALUES (10, '', 'Browse category', 'category ID: BIRDS', '2024-11-13 23:41:05');
INSERT INTO `user_logs` VALUES (11, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-11-13 23:41:26');
INSERT INTO `user_logs` VALUES (12, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-11-13 23:41:31');
INSERT INTO `user_logs` VALUES (13, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-11-13 23:41:31');
INSERT INTO `user_logs` VALUES (14, '', 'Browse category', 'category ID: FISH', '2024-12-21 17:16:29');
INSERT INTO `user_logs` VALUES (15, '', 'Browse category', 'category ID: BIRDS', '2024-12-21 17:17:22');
INSERT INTO `user_logs` VALUES (16, '', 'Browse category', 'category ID: FISH', '2024-12-21 17:17:53');
INSERT INTO `user_logs` VALUES (17, '', 'Browse product', 'product ID: FI-FW-01', '2024-12-21 17:17:54');
INSERT INTO `user_logs` VALUES (18, '', 'Add to Cart', 'category - product - item: FISH - FI-FW-01 - EST-4', '2024-12-21 17:17:55');
INSERT INTO `user_logs` VALUES (19, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 17:18:20');
INSERT INTO `user_logs` VALUES (20, 'j2ee', 'Browse product', 'product ID: AV-SB-02', '2024-12-21 17:18:21');
INSERT INTO `user_logs` VALUES (21, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-SB-02 - EST-19', '2024-12-21 17:18:22');
INSERT INTO `user_logs` VALUES (22, '', 'Browse category', 'category ID: BIRDS', '2024-12-21 18:51:03');
INSERT INTO `user_logs` VALUES (23, '', 'Browse category', 'category ID: BIRDS', '2024-12-21 19:16:55');
INSERT INTO `user_logs` VALUES (24, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 19:18:24');
INSERT INTO `user_logs` VALUES (25, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 19:18:25');
INSERT INTO `user_logs` VALUES (26, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 19:18:26');
INSERT INTO `user_logs` VALUES (27, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 19:58:21');
INSERT INTO `user_logs` VALUES (28, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 19:58:22');
INSERT INTO `user_logs` VALUES (29, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 19:58:23');
INSERT INTO `user_logs` VALUES (30, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 20:50:47');
INSERT INTO `user_logs` VALUES (31, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 20:50:48');
INSERT INTO `user_logs` VALUES (32, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 20:52:00');
INSERT INTO `user_logs` VALUES (33, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 20:52:00');
INSERT INTO `user_logs` VALUES (34, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 20:53:48');
INSERT INTO `user_logs` VALUES (35, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 20:53:48');
INSERT INTO `user_logs` VALUES (36, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 20:53:49');
INSERT INTO `user_logs` VALUES (37, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 20:57:18');
INSERT INTO `user_logs` VALUES (38, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 20:57:19');
INSERT INTO `user_logs` VALUES (39, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 20:57:20');
INSERT INTO `user_logs` VALUES (40, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 21:04:49');
INSERT INTO `user_logs` VALUES (41, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 21:04:50');
INSERT INTO `user_logs` VALUES (42, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - null', '2024-12-21 21:04:52');
INSERT INTO `user_logs` VALUES (43, 'j2ee', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-21 21:06:18');
INSERT INTO `user_logs` VALUES (44, 'j2ee', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-21 21:08:17');
INSERT INTO `user_logs` VALUES (45, 'j2ee', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-21 21:10:26');
INSERT INTO `user_logs` VALUES (46, 'j2ee', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-21 21:15:16');
INSERT INTO `user_logs` VALUES (47, 'j2ee', 'Browse category', 'category ID: FISH', '2024-12-21 21:15:21');
INSERT INTO `user_logs` VALUES (48, 'j2ee', 'Browse product', 'product ID: FI-FW-01', '2024-12-21 21:15:22');
INSERT INTO `user_logs` VALUES (49, 'j2ee', 'Add to Cart', 'category - product - item: FISH - FI-FW-01 - EST-4', '2024-12-21 21:15:23');
INSERT INTO `user_logs` VALUES (50, 'j2ee', 'Add to Cart', 'category - product - item: FISH - FI-FW-01 - EST-4', '2024-12-21 21:16:16');
INSERT INTO `user_logs` VALUES (51, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 21:19:57');
INSERT INTO `user_logs` VALUES (52, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 21:19:58');
INSERT INTO `user_logs` VALUES (53, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 21:19:59');
INSERT INTO `user_logs` VALUES (54, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 21:51:55');
INSERT INTO `user_logs` VALUES (55, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 21:51:56');
INSERT INTO `user_logs` VALUES (56, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 21:51:56');
INSERT INTO `user_logs` VALUES (57, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 21:54:25');
INSERT INTO `user_logs` VALUES (58, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 21:54:26');
INSERT INTO `user_logs` VALUES (59, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 21:54:27');
INSERT INTO `user_logs` VALUES (60, 'j2ee', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-21 21:58:17');
INSERT INTO `user_logs` VALUES (61, 'j2ee', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-21 21:59:05');
INSERT INTO `user_logs` VALUES (62, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:00:38');
INSERT INTO `user_logs` VALUES (63, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 22:00:39');
INSERT INTO `user_logs` VALUES (64, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 22:00:40');
INSERT INTO `user_logs` VALUES (65, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:06:32');
INSERT INTO `user_logs` VALUES (66, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 22:06:32');
INSERT INTO `user_logs` VALUES (67, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 22:06:33');
INSERT INTO `user_logs` VALUES (68, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:10:08');
INSERT INTO `user_logs` VALUES (69, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 22:10:09');
INSERT INTO `user_logs` VALUES (70, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 22:10:10');
INSERT INTO `user_logs` VALUES (71, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:15:57');
INSERT INTO `user_logs` VALUES (72, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 22:15:58');
INSERT INTO `user_logs` VALUES (73, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 22:15:58');
INSERT INTO `user_logs` VALUES (74, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:16:34');
INSERT INTO `user_logs` VALUES (75, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 22:16:36');
INSERT INTO `user_logs` VALUES (76, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 22:16:37');
INSERT INTO `user_logs` VALUES (77, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:17:53');
INSERT INTO `user_logs` VALUES (78, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 22:17:53');
INSERT INTO `user_logs` VALUES (79, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 22:17:54');
INSERT INTO `user_logs` VALUES (80, '', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:32:29');
INSERT INTO `user_logs` VALUES (81, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-21 22:32:39');
INSERT INTO `user_logs` VALUES (82, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-21 22:32:40');
INSERT INTO `user_logs` VALUES (83, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-21 22:32:41');
INSERT INTO `user_logs` VALUES (84, 'j2ee', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-23 14:31:27');
INSERT INTO `user_logs` VALUES (85, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 14:36:57');
INSERT INTO `user_logs` VALUES (86, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 14:36:59');
INSERT INTO `user_logs` VALUES (87, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 14:37:00');
INSERT INTO `user_logs` VALUES (88, '', 'Add to Cart', 'category - product - item: null - null - null', '2024-12-23 14:40:21');
INSERT INTO `user_logs` VALUES (89, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 14:40:29');
INSERT INTO `user_logs` VALUES (90, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 14:40:30');
INSERT INTO `user_logs` VALUES (91, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 14:40:31');
INSERT INTO `user_logs` VALUES (92, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 14:41:36');
INSERT INTO `user_logs` VALUES (93, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 14:41:38');
INSERT INTO `user_logs` VALUES (94, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 14:41:39');
INSERT INTO `user_logs` VALUES (95, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 14:46:00');
INSERT INTO `user_logs` VALUES (96, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 14:46:01');
INSERT INTO `user_logs` VALUES (97, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 14:46:02');
INSERT INTO `user_logs` VALUES (98, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 14:53:03');
INSERT INTO `user_logs` VALUES (99, 'j2ee', 'Browse item', 'item ID: EST-18', '2024-12-23 14:53:08');
INSERT INTO `user_logs` VALUES (100, 'j2ee', 'Browse item', 'item ID: EST-18', '2024-12-23 14:53:13');
INSERT INTO `user_logs` VALUES (101, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 14:53:25');
INSERT INTO `user_logs` VALUES (102, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 14:54:42');
INSERT INTO `user_logs` VALUES (103, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 14:54:44');
INSERT INTO `user_logs` VALUES (104, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 14:54:45');
INSERT INTO `user_logs` VALUES (105, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 14:58:59');
INSERT INTO `user_logs` VALUES (106, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 14:59:00');
INSERT INTO `user_logs` VALUES (107, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 14:59:01');
INSERT INTO `user_logs` VALUES (108, 'j2ee', 'Browse item', 'item ID: EST-18', '2024-12-23 15:02:27');
INSERT INTO `user_logs` VALUES (109, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:02:42');
INSERT INTO `user_logs` VALUES (110, 'j2ee', 'Browse item', 'item ID: EST-18', '2024-12-23 15:02:49');
INSERT INTO `user_logs` VALUES (111, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:02:52');
INSERT INTO `user_logs` VALUES (112, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:02:53');
INSERT INTO `user_logs` VALUES (113, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:02:54');
INSERT INTO `user_logs` VALUES (114, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:05:10');
INSERT INTO `user_logs` VALUES (115, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:05:11');
INSERT INTO `user_logs` VALUES (116, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:05:11');
INSERT INTO `user_logs` VALUES (117, 'j2ee', 'Browse item', 'item ID: null', '2024-12-23 15:05:19');
INSERT INTO `user_logs` VALUES (118, 'j2ee', 'Browse item', 'item ID: null', '2024-12-23 15:05:27');
INSERT INTO `user_logs` VALUES (119, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:06:16');
INSERT INTO `user_logs` VALUES (120, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:06:17');
INSERT INTO `user_logs` VALUES (121, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:06:18');
INSERT INTO `user_logs` VALUES (122, 'j2ee', 'Browse item', 'item ID: EST-18', '2024-12-23 15:06:25');
INSERT INTO `user_logs` VALUES (123, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:12:10');
INSERT INTO `user_logs` VALUES (124, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:12:11');
INSERT INTO `user_logs` VALUES (125, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:12:11');
INSERT INTO `user_logs` VALUES (126, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:12:19');
INSERT INTO `user_logs` VALUES (127, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:12:21');
INSERT INTO `user_logs` VALUES (128, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:12:22');
INSERT INTO `user_logs` VALUES (129, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:12:23');
INSERT INTO `user_logs` VALUES (130, 'j2ee', 'Browse category', 'category ID: DOGS', '2024-12-23 15:12:26');
INSERT INTO `user_logs` VALUES (131, 'j2ee', 'Browse product', 'product ID: K9-BD-01', '2024-12-23 15:12:27');
INSERT INTO `user_logs` VALUES (132, 'j2ee', 'Add to Cart', 'category - product - item: DOGS - K9-BD-01 - EST-7', '2024-12-23 15:12:29');
INSERT INTO `user_logs` VALUES (133, 'j2ee', 'Browse item', 'item ID: EST-7', '2024-12-23 15:12:42');
INSERT INTO `user_logs` VALUES (134, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:27:13');
INSERT INTO `user_logs` VALUES (135, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:27:14');
INSERT INTO `user_logs` VALUES (136, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:27:16');
INSERT INTO `user_logs` VALUES (137, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:29:31');
INSERT INTO `user_logs` VALUES (138, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:29:32');
INSERT INTO `user_logs` VALUES (139, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:29:33');
INSERT INTO `user_logs` VALUES (140, 'j2ee', 'Browse category', 'category ID: DOGS', '2024-12-23 15:29:35');
INSERT INTO `user_logs` VALUES (141, 'j2ee', 'Browse product', 'product ID: K9-BD-01', '2024-12-23 15:29:36');
INSERT INTO `user_logs` VALUES (142, 'j2ee', 'Add to Cart', 'category - product - item: DOGS - K9-BD-01 - EST-7', '2024-12-23 15:29:37');
INSERT INTO `user_logs` VALUES (143, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-23 15:31:13');
INSERT INTO `user_logs` VALUES (144, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-23 15:31:14');
INSERT INTO `user_logs` VALUES (145, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-23 15:31:15');
INSERT INTO `user_logs` VALUES (146, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:22:32');
INSERT INTO `user_logs` VALUES (147, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:22:33');
INSERT INTO `user_logs` VALUES (148, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-25 08:22:34');
INSERT INTO `user_logs` VALUES (149, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:23:09');
INSERT INTO `user_logs` VALUES (150, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:23:10');
INSERT INTO `user_logs` VALUES (151, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-25 08:23:11');
INSERT INTO `user_logs` VALUES (152, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:23:13');
INSERT INTO `user_logs` VALUES (153, 'j2ee', 'Browse product', 'product ID: AV-SB-02', '2024-12-25 08:23:14');
INSERT INTO `user_logs` VALUES (154, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-SB-02 - EST-19', '2024-12-25 08:23:15');
INSERT INTO `user_logs` VALUES (155, 'j2ee', 'Browse category', 'category ID: DOGS', '2024-12-25 08:23:46');
INSERT INTO `user_logs` VALUES (156, 'j2ee', 'Browse category', 'category ID: REPTILES', '2024-12-25 08:23:47');
INSERT INTO `user_logs` VALUES (157, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:23:48');
INSERT INTO `user_logs` VALUES (158, 'j2ee', 'Browse category', 'category ID: CATS', '2024-12-25 08:23:49');
INSERT INTO `user_logs` VALUES (159, 'j2ee', 'Browse category', 'category ID: FISH', '2024-12-25 08:23:50');
INSERT INTO `user_logs` VALUES (160, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:24:43');
INSERT INTO `user_logs` VALUES (161, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:29:25');
INSERT INTO `user_logs` VALUES (162, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:29:26');
INSERT INTO `user_logs` VALUES (163, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-25 08:29:27');
INSERT INTO `user_logs` VALUES (164, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:30:15');
INSERT INTO `user_logs` VALUES (165, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:30:32');
INSERT INTO `user_logs` VALUES (166, '', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:31:45');
INSERT INTO `user_logs` VALUES (167, '', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:34:42');
INSERT INTO `user_logs` VALUES (168, '', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:37:05');
INSERT INTO `user_logs` VALUES (169, '', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:37:08');
INSERT INTO `user_logs` VALUES (170, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:37:19');
INSERT INTO `user_logs` VALUES (171, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-25 08:37:22');
INSERT INTO `user_logs` VALUES (172, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-25 08:37:23');
INSERT INTO `user_logs` VALUES (173, 'j2ee', 'Browse item', 'item ID: EST-18', '2024-12-25 08:37:36');
INSERT INTO `user_logs` VALUES (174, 'j2ee', 'Browse item', 'item ID: EST-19', '2024-12-25 08:37:43');
INSERT INTO `user_logs` VALUES (175, 'j2ee', 'Browse item', 'item ID: EST-18', '2024-12-25 08:37:49');
INSERT INTO `user_logs` VALUES (176, 'j2ee', 'Browse item', 'item ID: EST-19', '2024-12-25 08:37:59');
INSERT INTO `user_logs` VALUES (177, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:38:17');
INSERT INTO `user_logs` VALUES (178, 'j2ee', 'Browse category', 'category ID: CATS', '2024-12-25 08:38:18');
INSERT INTO `user_logs` VALUES (179, 'j2ee', 'Browse category', 'category ID: REPTILES', '2024-12-25 08:38:19');
INSERT INTO `user_logs` VALUES (180, 'j2ee', 'Browse category', 'category ID: DOGS', '2024-12-25 08:38:21');
INSERT INTO `user_logs` VALUES (181, 'j2ee', 'Browse category', 'category ID: FISH', '2024-12-25 08:38:22');
INSERT INTO `user_logs` VALUES (182, '12345678', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:47:14');
INSERT INTO `user_logs` VALUES (183, '6768754321', 'Browse category', 'category ID: BIRDS', '2024-12-25 08:58:04');
INSERT INTO `user_logs` VALUES (184, 'j2ee', 'Browse category', 'category ID: BIRDS', '2024-12-26 16:42:33');
INSERT INTO `user_logs` VALUES (185, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2024-12-26 16:42:35');
INSERT INTO `user_logs` VALUES (186, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2024-12-26 16:42:36');
INSERT INTO `user_logs` VALUES (187, 'j2ee', 'Browse category', 'category ID: BIRDS', '2025-01-19 13:40:45');
INSERT INTO `user_logs` VALUES (188, 'j2ee', 'Browse product', 'product ID: AV-CB-01', '2025-01-19 13:40:47');
INSERT INTO `user_logs` VALUES (189, 'j2ee', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2025-01-19 13:40:48');
INSERT INTO `user_logs` VALUES (190, '', 'Browse category', 'category ID: BIRDS', '2025-03-10 15:06:46');
INSERT INTO `user_logs` VALUES (191, '1', 'Add to Cart', 'category - product - item: null - null - null', '2025-03-16 00:53:09');
INSERT INTO `user_logs` VALUES (192, '1', 'Browse product', 'product ID: FI-FW-01', '2025-03-16 00:53:14');
INSERT INTO `user_logs` VALUES (193, '1', 'Add to Cart', 'category - product - item: null - FI-FW-01 - EST-4', '2025-03-16 00:53:17');
INSERT INTO `user_logs` VALUES (194, '', 'Browse category', 'category ID: BIRDS', '2025-03-17 15:16:43');
INSERT INTO `user_logs` VALUES (195, '', 'Browse product', 'product ID: AV-CB-01', '2025-03-17 15:16:47');
INSERT INTO `user_logs` VALUES (196, '', 'Browse item', 'item ID: EST-18', '2025-03-17 15:16:49');
INSERT INTO `user_logs` VALUES (197, '', 'Add to Cart', 'category - product - item: BIRDS - AV-CB-01 - EST-18', '2025-03-17 15:16:59');
INSERT INTO `user_logs` VALUES (198, '', 'Browse category', 'category ID: FISH', '2025-03-17 15:17:07');

SET FOREIGN_KEY_CHECKS = 1;
