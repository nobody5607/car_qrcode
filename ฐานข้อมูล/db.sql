/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : 127.0.0.1:3306
 Source Schema         : chanpan

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 05/07/2019 12:21:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `auth_assignment_user_id_idx`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', 1535696400);
INSERT INTO `auth_assignment` VALUES ('user', '2', 1562226673);
INSERT INTO `auth_assignment` VALUES ('user', '3', 1562228852);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/admin/*', 2, NULL, NULL, NULL, 1535696373, 1535696373);
INSERT INTO `auth_item` VALUES ('/core/*', 2, NULL, NULL, NULL, 1535699352, 1535699352);
INSERT INTO `auth_item` VALUES ('/debug/*', 2, NULL, NULL, NULL, 1562222244, 1562222244);
INSERT INTO `auth_item` VALUES ('/gii/*', 2, NULL, NULL, NULL, 1535706951, 1535706951);
INSERT INTO `auth_item` VALUES ('/informations/*', 2, NULL, NULL, NULL, 1562299552, 1562299552);
INSERT INTO `auth_item` VALUES ('/options/*', 2, NULL, NULL, NULL, 1562243863, 1562243863);
INSERT INTO `auth_item` VALUES ('/site/*', 2, NULL, NULL, NULL, 1562245386, 1562245386);
INSERT INTO `auth_item` VALUES ('/user/*', 2, NULL, NULL, NULL, 1535697098, 1535697098);
INSERT INTO `auth_item` VALUES ('/user/registration/register', 2, NULL, NULL, NULL, 1562221007, 1562221007);
INSERT INTO `auth_item` VALUES ('/user/security/logout', 2, NULL, NULL, NULL, 1562227469, 1562227469);
INSERT INTO `auth_item` VALUES ('/user/settings/account', 2, NULL, NULL, NULL, 1562226761, 1562226761);
INSERT INTO `auth_item` VALUES ('/user/settings/profile', 2, NULL, NULL, NULL, 1562226734, 1562226734);
INSERT INTO `auth_item` VALUES ('admin', 1, 'Admin', NULL, NULL, 1535696302, 1535696302);
INSERT INTO `auth_item` VALUES ('user', 1, 'User', NULL, NULL, 1535696315, 1535696315);

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/core/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/informations/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/options/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/*');
INSERT INTO `auth_item_child` VALUES ('user', '/site/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/*');
INSERT INTO `auth_item_child` VALUES ('user', '/user/security/logout');
INSERT INTO `auth_item_child` VALUES ('user', '/user/settings/account');
INSERT INTO `auth_item_child` VALUES ('user', '/user/settings/profile');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `file_storage_item`;
CREATE TABLE `file_storage_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_storage_item
-- ----------------------------
INSERT INTO `file_storage_item` VALUES (106, 'fileStorage', 'http://shop.local/source', '1/HfSgZ0jHjBR0T5af6q5XkXKWyeyEuz7O.png', 'image/png', 3556, 'HfSgZ0jHjBR0T5af6q5XkXKWyeyEuz7O', '::1', 1535699641);
INSERT INTO `file_storage_item` VALUES (107, 'fileStorage', 'http://storage.shop.local/source', '1/OuRcwvxrOLzLzvWR5QBNn6No1vd-2yf5.png', 'image/png', 4679, 'OuRcwvxrOLzLzvWR5QBNn6No1vd-2yf5', '::1', 1535700807);
INSERT INTO `file_storage_item` VALUES (110, 'fileStorage', 'http://storage.exomethai.local/source', '1/FxbtooSVWmIcxSAvrkcYtZACnNSDvlk1.jpg', 'image/jpeg', 210392, 'FxbtooSVWmIcxSAvrkcYtZACnNSDvlk1', '::1', 1562218782);
INSERT INTO `file_storage_item` VALUES (112, 'fileStorage', 'http://storage.exomethai.local/source', '1/8lHe0DJg_oKoIiMUdS06fwasOkLe2lGx.jpg', 'image/jpeg', 223823, '8lHe0DJg_oKoIiMUdS06fwasOkLe2lGx', '::1', 1562230810);

-- ----------------------------
-- Table structure for informations
-- ----------------------------
DROP TABLE IF EXISTS `informations`;
CREATE TABLE `informations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ไตเติ้ล',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รายละเอียด',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รูปขนาดย่อย',
  `rstat` int(1) DEFAULT NULL COMMENT 'สถานะ',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'สร้างโดย',
  `create_date` datetime(0) DEFAULT NULL COMMENT 'สร้างเมื่อ',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'แก้ไขโดย',
  `update_date` datetime(0) DEFAULT NULL COMMENT 'แก้ไขเมื่อ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1535696053);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1535696058);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1535696059);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1535696063);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1535696064);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1535696065);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1535696065);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1535696065);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1535696066);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1535696068);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1535696068);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1535696069);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1535696069);
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', 1535696117);
INSERT INTO `migration` VALUES ('m160312_050000_create_user', 1535696117);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1535696133);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1535696133);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Label',
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Value',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (1, 'about', '<p><strong>National Clinical Research Center (nCRC):&nbsp;Free Online Research Tools</strong></p><p><br></p><p><strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:</p><p><strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:<strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:<strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:</p><p><br></p>');
INSERT INTO `options` VALUES (2, 'contact', '<p><strong>National Clinical Research Center (nCRC):&nbsp;Free Online Research Tools</strong></p><p><br></p><p><strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:</p><p><strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:<strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:<strong>nCRC</strong> serves as an online research tools for researcher around the world. It is not merely a Clinical Trial Management System (CTMS) as it integrates all essential tools into a unified working environment. The nCRC can also be used to managed any types of research ranging from a very simple one such as a quick survey to a very complex multi-national randomized controlled trial. According to an aim of the Thai government&#39;s mission on having a unified system for clinical research and left no researcher behind, the first version of this CTMS was launched in the middle of 2018. It was then named the National Clinical Research Center (nCRC) accordingly. Any researcher can apply for an account and own the online clinical research tools. The nCRC will be forever free to be used for research purposes and under the DIY (do it yourself) manner. Additional services, if required, can be arranged with some service costs. The <a href=\"https://storage.work.ncrc.in.th/ezform/editor-upload/5b61bf9c043f2.pdf\" target=\"_blank\">nCRC QuickGuide_20180802.pdf</a> summarizes steps of using the nCRC as shown below:</p>');
INSERT INTO `options` VALUES (3, 'initial_name_app', 'APP');
INSERT INTO `options` VALUES (4, 'name_app', 'App Name');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `timezone` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitecode` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, 'nuttaphon chanpan', 'chanpan.nuttaphon1993@gmail.com', 'chanpan.nuttaphon1993@gmail.com', 'd70f6226ff8caba303baede9f0892c0e', '', '', '07/08/1993', NULL, 'nuttaphon', 'chanpan', '0650859480', '1/OuRcwvxrOLzLzvWR5QBNn6No1vd-2yf5.png', 'http://storage.shop.local/source', NULL);
INSERT INTO `profile` VALUES (2, NULL, 'user@gmail.com', 'user@gmail.com', 'cba1f2d695a5ca39ee6f343297a761a4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (3, 'user2 user2', 'user2@gmail.com', 'user2@gmail.com', 'fa7c3fcb670a58aa3e90a391ea533c99', NULL, NULL, '', NULL, 'user2', 'user2', ' ', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_unique`(`provider`, `client_id`) USING BTREE,
  UNIQUE INDEX `account_unique_code`(`code`) USING BTREE,
  INDEX `fk_user_account`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE INDEX `token_unique`(`user_id`, `code`, `type`) USING BTREE,
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `user_unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'chanpan.nuttaphon1993@gmail.com', '$2y$12$obnECeQ6R8r.lamu.Kdmo.S2OTh1Dh9TvsvfSpGQfpBChgFs3Tz6K', 'KSwmb0yFT6Jf14f82pSAnAedCN44uzAQ', 1535696234, NULL, NULL, '::1', 1535696234, 1535696234, 0, 1562302174);
INSERT INTO `user` VALUES (2, 'user', 'user@gmail.com', '$2y$12$XQqiA43J1Z9/yIfWc4N9lexmEpDatvryHr15PQ1f1udsM8ipsdldi', 'SIMHVxx-zsO9MyC9gN_ZxsolYakw9_5G', 1562226672, NULL, NULL, '::1', 1562226673, 1562226673, 0, 1562227547);
INSERT INTO `user` VALUES (3, 'user2', 'user2@gmail.com', '$2y$12$DTf.7SbmW8wmbdDBfB70deB6jIFRZrdU094K/VDUOF0d8Td2C0lRe', '_-aO2DARP_wh1gyK_XsE-DASfU5KkWDn', 1562228852, NULL, NULL, '::1', 1562228852, 1562228852, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
