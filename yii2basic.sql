/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : yii2basic

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-11-20 17:02:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1447812913');
INSERT INTO `migration` VALUES ('m151118_022208_tbl_user', '1447813473');

-- ----------------------------
-- Table structure for `tbl_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_assignment`;
CREATE TABLE `tbl_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `tbl_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_assignment
-- ----------------------------
INSERT INTO `tbl_auth_assignment` VALUES ('admin', '1', '1447817140');
INSERT INTO `tbl_auth_assignment` VALUES ('author', '2', '1447817140');

-- ----------------------------
-- Table structure for `tbl_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_item`;
CREATE TABLE `tbl_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `tbl_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tbl_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_item
-- ----------------------------
INSERT INTO `tbl_auth_item` VALUES ('admin', 'Administrator', '1', null, null, null, '1447817140', '1447817140');
INSERT INTO `tbl_auth_item` VALUES ('author', 'Author', '1', null, null, null, '1447817140', '1447817140');
INSERT INTO `tbl_auth_item` VALUES ('createPost', 'Create Post Role', '2', 'Create a post', null, null, '1447817139', '1447817139');
INSERT INTO `tbl_auth_item` VALUES ('updateOwnPost', 'Update Own Post Role', '2', 'Update own post', 'isAuthor', null, '1447818010', '1447818010');
INSERT INTO `tbl_auth_item` VALUES ('updatePost', 'Update Post Role', '2', 'Update post', null, null, '1447817140', '1447817140');

-- ----------------------------
-- Table structure for `tbl_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_item_child`;
CREATE TABLE `tbl_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `tbl_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_item_child
-- ----------------------------
INSERT INTO `tbl_auth_item_child` VALUES ('admin', 'author');
INSERT INTO `tbl_auth_item_child` VALUES ('author', 'createPost');
INSERT INTO `tbl_auth_item_child` VALUES ('admin', 'updatePost');

-- ----------------------------
-- Table structure for `tbl_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_rule`;
CREATE TABLE `tbl_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_auth_rule
-- ----------------------------
INSERT INTO `tbl_auth_rule` VALUES ('isAuthor', 'O:30:\"app\\components\\rbac\\AuthorRule\":3:{s:4:\"name\";s:8:\"isAuthor\";s:9:\"createdAt\";i:1447818009;s:9:\"updatedAt\";i:1447818009;}', '1447818009', '1447818009');

-- ----------------------------
-- Table structure for `tbl_migration`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_migration
-- ----------------------------
INSERT INTO `tbl_migration` VALUES ('m000000_000000_base', '1447816326');
INSERT INTO `tbl_migration` VALUES ('m140506_102106_rbac_init', '1447816692');

-- ----------------------------
-- Table structure for `tbl_post`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` tinyint(2) NOT NULL DEFAULT '0',
  `phone` int(11) DEFAULT NULL,
  `auth_key` varchar(64) DEFAULT NULL,
  `password_reset_token` varchar(64) DEFAULT NULL,
  `access_token` varchar(64) DEFAULT NULL,
  `created_date` int(11) DEFAULT NULL,
  `updated_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'admin', '$2y$13$fLqoeuEaAoE/y2lFmBol7OghVwj82TUGGjJCI/llLWfQNrQuZNtEm', 'admin', 'binh.phamvan@gmail.com', 'Phạm Bình', '0', '989279795', null, null, null, null, '1448008815');
INSERT INTO `tbl_user` VALUES ('4', 'chuyenvien1', '$2y$13$GD01liz8u1QXSsKvpVcyUO50oUWiG6KHnwRgklOG0Teh9ENfmCgmG', 'author', 'chuyenvien1@gmail.com', 'chuyên viên 1', '0', '989279795', 'N-5JVLV9JcOUKepJYzEh3RHliY0MwbM4khNU_HsT6JG-WBYvp2fznJ9eYfumKG4F', null, null, null, null);
INSERT INTO `tbl_user` VALUES ('7', 'taikhoan1', '$2y$13$gPBivAxrWPZDIQJNCCLdguwu/qt0WNq9G4.96kXwM7Yd9OhS9Erq.', 'author', 'binh.phamvan@gmail.com', 'No Name', '1', '989279795', '_PVPTJzqLEhoQur_IdC0h_8eF-YsbBSTSlxrBqf9Od68DT28EbccUaWlW87PYAp7', null, null, '1447994622', null);
