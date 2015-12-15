/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : yii2basic

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-12-15 15:58:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migration
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
-- Table structure for tbl_auth_assignment
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
-- Table structure for tbl_auth_item
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
-- Table structure for tbl_auth_item_child
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
-- Table structure for tbl_auth_rule
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
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `left` int(11) NOT NULL DEFAULT '1',
  `right` int(11) NOT NULL DEFAULT '2',
  `level` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('1', 'Thể thao', 'the-thao', 'tin thể thao', '1', '6', '1');
INSERT INTO `tbl_category` VALUES ('2', 'Sức khỏe', 'suc-khoe', 'tư vấn sức khỏe', '11', '20', '1');
INSERT INTO `tbl_category` VALUES ('3', 'Khoa học', 'khoa-hoc', 'tin tức khoa học', '21', '28', '1');
INSERT INTO `tbl_category` VALUES ('4', 'Dân gian 1', 'dan-gian1', 'các bài thuốc dân gian', '12', '17', '2');
INSERT INTO `tbl_category` VALUES ('5', 'Đông y', 'dong-y', 'đông y', '13', '16', '3');
INSERT INTO `tbl_category` VALUES ('6', 'tin học', 'tin-hoc', 'tin tin học', '26', '27', '2');
INSERT INTO `tbl_category` VALUES ('9', 'sức khỏe 1', 'suc-khoe-1', 'dfgh', '18', '19', '2');
INSERT INTO `tbl_category` VALUES ('10', 'khoa học acb', 'acb-kh', 'khoa học acb', '24', '25', '2');
INSERT INTO `tbl_category` VALUES ('11', 'khoa học 2', 'khoa-hoc-2', 'khoa học 2', '22', '23', '2');
INSERT INTO `tbl_category` VALUES ('12', 'bóng đá', 'bong-da', 'bóng đá', '2', '3', '2');
INSERT INTO `tbl_category` VALUES ('13', 'Tennis', 'tennis', 'Tennis', '4', '5', '2');
INSERT INTO `tbl_category` VALUES ('14', 'Bóng bàn', 'bong-ban', 'bóng bàn', '14', '15', '4');
INSERT INTO `tbl_category` VALUES ('15', 'tenten', 'tenten', 'tenten', '7', '10', '1');
INSERT INTO `tbl_category` VALUES ('17', 'tenten1', 'tenten1', 'tin tức tenten1', '8', '9', '2');
INSERT INTO `tbl_category` VALUES ('23', 'kinh tế', 'kinh-te', 'ki', '29', '30', '1');
INSERT INTO `tbl_category` VALUES ('24', 'văn hóa', 'van-hoa', 'văn hóa', '31', '32', '1');
INSERT INTO `tbl_category` VALUES ('25', 'xã hội', 'xa-hoi', 'xã hội', '33', '34', '1');
INSERT INTO `tbl_category` VALUES ('26', 'đường hà nội', 'duong-ha-noi', 'đường hà nội', '35', '36', '1');
INSERT INTO `tbl_category` VALUES ('27', 'đường hà nội', 'duong-ha-noi', 'đường hà nội 2', '37', '38', '1');

-- ----------------------------
-- Table structure for tbl_migration
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
-- Table structure for tbl_post
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  `content` text,
  `category_id` int(11) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desciption` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` int(11) DEFAULT NULL,
  `publish_date` int(11) DEFAULT NULL,
  `updated_date` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------
INSERT INTO `tbl_post` VALUES ('1', 'Djokovic vô địch World Tour Finals năm thứ tư liên tiếp', 'djokovic-vo-dich-world-tour-finals-nam-thu-tu-lien-tiep', '', '<p class=\"Normal\" style=\"text-align: justify;\">Novak Djokovic chịu thất bại dễ d&agrave;ng trước Roger Federer ở v&ograve;ng bảng ATP World Tour Finals năm nay, nhưng điều đ&oacute; đ&atilde; kh&ocirc;ng lặp lại trong trận chung kết. Như những g&igrave; đ&atilde; thể hiện trong suốt năm 2015, tay vợt người Serbia vẫn khẳng định anh l&agrave; số một ở hiện tại với sức mạnh kh&ocirc;ng thể cản ph&aacute;.&nbsp;</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Ch&oacute;ng v&aacute;nh, thuyết phục, Djokovic cuốn phăng huyền thoại người Thụy Sỹ trong 80 ph&uacute;t, với c&aacute;c tỷ số 6-3, 6-4. Djoker qua đ&oacute; c&acirc;n bằng th&agrave;nh t&iacute;ch đối đầu 22-22 với Roger. Trước đ&oacute; ở b&aacute;n kết, Djokovic cũng đ&atilde; c&acirc;n bằng th&agrave;nh t&iacute;ch đối đầu với một tượng đ&agrave;i l&agrave;ng banh nỉ kh&aacute;c l&agrave; Rafael Nadal (23-23).</p>\r\n<table class=\"tplCaption\" style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img style=\"width: 100%;\" src=\"http://img.f1.thethao.vnecdn.net/2015/11/23/2015-11-22T210557Z-91227957-MT-4246-1645-1448230574.jpg\" alt=\"djokovic-vo-dich-world-tour-finals-nam-thu-tu-lien-tiep\" data-natural-width=\"500\" data-width=\"500\" data-pwidth=\"470.40625\" /></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p class=\"Image\" style=\"text-align: center;\">Tay vợt số một thế giới tr&ecirc;n bục vinh quang. Ảnh: <em>Reuters.</em></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Djokovic ho&agrave;n to&agrave;n &aacute;p đảo Federer, trong đ&oacute; gi&agrave;nh 16 tr&ecirc;n 19 điểm giao b&oacute;ng hai, cứu cả hai break-point.&nbsp;N&oacute;i về sức mạnh của Djokovic, h&atilde;y nghe suy nghĩ của Nadal sau khi chịu thua dễ d&agrave;ng ở b&aacute;n kết: \"Novak l&uacute;c n&agrave;y l&agrave; kh&ocirc;ng thể bị đ&aacute;nh bại. Điều duy nhất bạn c&oacute; thể l&agrave;m l&agrave; ch&uacute;c mừng cậu ấy th&ocirc;i\".</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Djokovic v&agrave; Federer đều c&oacute; cơ hội bẻ giao b&oacute;ng trong hai game đầu ti&ecirc;n nhưng cả hai đều cứu điểm th&agrave;nh c&ocirc;ng. Tay vợt số một thế giới ph&aacute; thế c&acirc;n bằng trong game thứ ba với việc c&oacute; break. Sau một m&agrave;n b&oacute;ng bền, Djokovic c&oacute; điểm winner tr&aacute;i tay để c&oacute; cơ hội gi&agrave;nh break. Federer sau đ&oacute; đ&aacute;nh thuận tay đưa b&oacute;ng r&uacute;c lưới, d&acirc;ng điểm cho đối thủ. Djokovic c&ograve;n gi&agrave;nh th&ecirc;m hai break nữa, một lần để kết th&uacute;c set một v&agrave; điểm c&ograve;n lại ở set hai khi Federer mắc lỗi k&eacute;p.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Tay vợt người Thụy Sỹ mắc đến 31 lỗi tự đ&aacute;nh hỏng, trong đ&oacute; c&oacute; 15 lần đến từ c&uacute; thuận tay, vốn chắc chắn của anh.</p>\r\n<div style=\"text-align: justify;\">\r\n<div class=\"embed-container\"><iframe src=\"http://vnexpress.net/parser_v3.php?id=72050&amp;t=2&amp;ft=video&amp;si=1002565&amp;ap=1&amp;ishome=0\" width=\"480\" height=\"270\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></div>\r\n</div>\r\n<p class=\"Normal\" style=\"text-align: justify;\">\"T&ocirc;i kh&ocirc;ng thể kết th&uacute;c tốt hơn thế n&agrave;y. Đ&acirc;y l&agrave; một năm rất d&agrave;i nhưng r&otilde; r&agrave;ng l&agrave; năm th&agrave;nh c&ocirc;ng nhất trong sự nghiệp của t&ocirc;i\", tay vợt số một thế giới chia sẻ.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Đ&acirc;y l&agrave; năm thứ tư li&ecirc;n tiếp Djokovic đăng quang World Tour Finals, giải đấu d&agrave;nh cho t&aacute;m tay vợt c&oacute; th&agrave;nh t&iacute;ch tốt nhất.&nbsp;<strong>Djokovic l&agrave; người đầu ti&ecirc;n trong lịch sử 45 năm của giải đạt được th&agrave;nh t&iacute;ch v&ocirc; địch bốn năm li&ecirc;n tiếp</strong>.&nbsp;</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">2015 l&agrave; một năm đại th&agrave;nh c&ocirc;ng của Nole, với rất nhiều kỷ lục được tay vợt người Serbia san bằng. Anh v&ocirc; địch ba Grand Slam, v&agrave;o chung kết giải c&ograve;n lại. Djokovic kết th&uacute;c năm với vị tr&iacute; số một ATP, lần thứ tư trong năm năm gần đ&acirc;y.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Sau khi mừng chiến thắng trước Federer, Nole tiến về ph&iacute;a m&aacute;y quay v&agrave; viết bằng tiếng Serbia: \"Ng&agrave;y nghỉ đến rồi\".</p>\r\n<table class=\"tplCaption\" style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img style=\"width: 100%;\" src=\"http://img.f1.thethao.vnecdn.net/2015/11/23/2015-11-22T204607Z-91226767-MT-8859-8611-1448230726.jpg\" alt=\"djokovic-vo-dich-world-tour-finals-nam-thu-tu-lien-tiep-1\" data-natural-width=\"500\" data-width=\"500\" data-pwidth=\"470.40625\" /></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p class=\"Image\" style=\"text-align: center;\">Federer kh&ocirc;ng thể đ&aacute;nh bại Djokovic, người c&oacute; phong độ hủy diệt trong năm 2015.&nbsp;Ảnh: <em>Reuters.</em></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"Normal\" style=\"text-align: justify;\">\"T&ocirc;i đ&atilde; chơi hết sức m&igrave;nh ở giải n&agrave;y\", Federer chia sẻ. \"T&ocirc;i nghĩ đ&atilde; thi đấu rất ấn tượng, thậm ch&iacute; l&agrave; ở trận chung kết. Novak xứng đ&aacute;ng với chiến thắng h&ocirc;m nay, như nhiều lần kh&aacute;c trong năm 2015. Ch&uacute;c mừng một năm th&agrave;nh c&ocirc;ng kh&ocirc;ng thể tin nổi của cậu ấy\".</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Đối với Federer, Djokovic thật sự l&agrave; đối thủ \"đ&aacute;ng gh&eacute;t\". Ba trận chung kết lớn gần đ&acirc;y m&agrave; Federer g&oacute;p mặt, ở Wimbledon, Mỹ Mở rộng v&agrave; World Tour Finals, anh đều chịu cảnh về nh&igrave; nh&igrave;n Djokovic xưng vương.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\"><strong>Khởi Nguy&ecirc;n</strong></p>', '1', '<script>alert(\'fgd\');</script>', '', '1', '1448266590', '1448046180', '1450146071', '18', '');
INSERT INTO `tbl_post` VALUES ('2', 'Klitschko: \'Tôi là võ sĩ số một mọi hạng cân, không phải Mayweather\'', 'klitschko-toi-la-vo-si-so-mot-moi-hang-can-khong-phai-mayweather', 'Wladimir Klitschko tuyên bố anh mới chính là võ sĩ quyền anh số một thế giới, nhằm cảnh báo đối thủ thách đấu Tyson Fury trước trận tranh chấp các đai vô địch hạng nặng tại Đức tối thứ bảy 28/11.', '<p class=\"Normal\">\r\n	Floyd Mayweather chính là người đầu tiên thổi bùng những ngọn lửa của cuộc tranh luận xem ai là võ sĩ quyền anh vĩ đại nhất thế giới, không tính đến yếu tố khác biệt giữa các hạng cân.</p>\r\n<p class=\"Normal\">\r\n	\"Độc cô cầu bại\" 38 tuổi người Mỹ gần đây đã khẳng định chấm dứt sự nghiệp thi đấu ở hạng bán trung, sau khi bảo vệ được thành tích 49 trận toàn thắng hôm 12/9. Anh luôn tự coi mình là “Võ sĩ hay nhất trong lịch sử”. Một số bình chọn top 10 võ sĩ quyền anh đương đại cũng ghi nhận Mayweather ở vị trí số một, trong khi Klitschko thường chỉ ở vị trí thứ tư hoặc thứ ba.</p>\r\n<p class=\"Normal\">\r\n	Nhưng Wladimir Klitschko hôm chủ nhật 22/11 nhấn mạnh rằng anh, chứ không phải võ sĩ có biệt danh “Tiền”, mới là chủ nhân đích thực của danh hiệu không chính thức đó.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"klitschko-toi-la-vo-si-so-mot-moi-hang-can-khong-phai-mayweather\" data-natural-width=\"500\" src=\"http://img.f1.thethao.vnecdn.net/2015/11/23/Wla-3098-1448235855.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Wladimir Klitschko quả quyết anh mới là tay đấm hay nhất.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	\"Tôi đã trở nên mệt mỏi khi nghe rằng Mayweather là võ sĩ hay nhất thế giới. Quyền anh hạng nặng phải được xếp ở vị trí cao nhất so với phần còn lại của các hạng cân. Vì sao ư? Các bạn hãy cố hình dung và tưởng tượng xem chuyện gì sẽ xảy ra nếu tôi đánh với Mayweather. Nếu có một trận đấu diễn ra, tôi chắc có lẽ sẽ đấm anh ấy bất tỉnh chỉ trong vòng một phút hai bên có mặt trên võ đài. Bất kỳ võ sĩ hàng đầu nào của quyền anh hạng nặng cũng có thể nhanh chóng đấm gục anh ấy\", Wladimir Klitschko phát biểu.</p>\r\n<p class=\"Normal\">\r\n	Anh nói thêm: \"Nếu chúng ta không có những giới hạn trọng lượng cơ thể để tách biệt các hạng cân thi đấu quyền anh, thì các võ sĩ hạng nặng sẽ chế ngự được tất cả những tay đấm của hạng trung và thấp hơn dù đó là những người có kỹ năng tốt nhất. Nếu đã xác định những võ sĩ của các hạng cân khác nhau không thể thi đấu trực tiếp với nhau trên sàn đấu nhà nghề, thì cũng không nên có những so sánh đánh đồng mọi hạng cân\".</p>\r\n<p class=\"Normal\">\r\n	Võ sĩ 39 tuổi người Ukraine đã thống trị quyền anh hạng nặng thế giới trong vòng hơn một thập kỷ qua. Anh hiện giữ tới năm trong tổng số sáu đai vô địch thế giới, gồm: ba danh hiệu major (WBO, IBF, WBA); và hai danh hiệu ít uy tín hơn (IBO), The Ring. Có thể nói, Klitschko không có đối thủ thực sự suốt từ năm 2006, và liên tục bảo vệ cả năm đai kể từ 2011.</p>\r\n<p class=\"Normal\">\r\n	Thực ra đây mới là lần đầu tiên ông em nhà Klitschko, em trai của Thị trưởng Kiev Vitali, có phát biểu kiểu tự tôn vinh mình như thế, sau khi liên tục bị kẻ thách đấu Tyson Fury khiêu khích trong các cuộc họp báo.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"klitschko-toi-la-vo-si-so-mot-moi-hang-can-khong-phai-mayweather-1\" data-natural-width=\"500\" src=\"http://img.f1.thethao.vnecdn.net/2015/11/23/Wla2-3691-1448235856.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Wladimir Klitschko đang giữ năm đai vô địch quyền anh hạng nặng.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	Wladimir muốn cho đối thủ người Anh biết về nguy cơ sẽ bị hạ knock-out tại Võ đài ở Esprit-Arena, sân vận động đa chức năng của CLB hạng hai Đức Fortuna Düsseldorf, vào thứ bảy 28/11.</p>\r\n<p class=\"Normal\">\r\n	Tạp chí nổi tiếng <em>The Ring</em>, chuyên về quyền Anh, gần đây cũng chỉ xếp Klitschko ở vị trí số sáu trong top 10, dưới cả Manny Pacquiao – võ sĩ đã thua Mayweather hồi tháng năm. Khi được hỏi về phản ứng trước việc này, anh nói: “Đã từ rất lâu rồi tôi không còn quan tâm đến những xếp hạng kiểu đó nữa”.</p>\r\n<p class=\"Normal\">\r\n	Klitschko cho biết anh chỉ tập trung hướng tới việc đánh bại Fury trận tới, và sau đó là giành trọn bộ các danh hiệu hạng nặng trong cuộc đấu thống nhất các đai vô địch thế giới với Deontay Wilder vào năm tới.</p>\r\n<p class=\"Normal\">\r\n	11 năm qua “Tiến sĩ búa thép” luôn giữ ít nhất một đai vô địch hạng nặng của WBA, IBF, WBO, hoặc IBO. Đai WBC từng do anh trai của anh, Vitali Klitschko, nắm giữ một thời gian dài cho tới khi giải nghệ hồi năm 2013 để tập trung cho sự nghiệp chính trị và sau đó trở thành Thị trưởng Kiev. Đai WBC này hiện thuộc về Wilder, niềm hy vọng mới của quyền anh Mỹ.</p>\r\n<p class=\"Normal\">\r\n	Ở tuổi 39, Wladimir vẫn còn rất sung sức. Thậm chí “gã khổng lồ” trông còn gọn gàng và nhanh nhẹn hơn trước trong những trận đánh gần đây. Thời gian qua, anh đã tập luyện ở Tyrol, Áo, để tăng tốc độ và lực ra đòn khi chuẩn bị phải thi đấu một trận hiếm hoi với đối thủ cao hơn mình 8 cm. Fury cao tới 2m06, và trẻ hơn đàn anh nổi tiếng 12 tuổi.</p>\r\n<p class=\"Normal\">\r\n	Tuy nhiên, Klitschko không lo ngại: “Thể hình của Fury không khiến trận đánh tới thêm phức tạp đối với tôi. Nhưng tôi thấy vui với thách thức của việc phải điều chỉnh lối đánh. Cuộc đấu sẽ rất thú vị\".</p>\r\n<p class=\"Normal\">\r\n	Klitschko chỉ đánh giá cao Fury ở nghệ thuật quảng cáo cho trận đánh sắp tới. “Tôi thực sự muốn cảm ơn Tyson vì anh ấy đã làm tất cả các phần việc chính trong mục tiêu thu hút sự chú ý của người hâm mộ đối với cuộc đấu giữa chúng tôi. Anh ấy đã làm tốt công việc kiếm tiền cho trận đánh sắp tới”, Klitschko nói thêm.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"klitschko-toi-la-vo-si-so-mot-moi-hang-can-khong-phai-mayweather-2\" data-natural-width=\"500\" src=\"http://img.f1.thethao.vnecdn.net/2015/11/23/Wla3-7006-1448235856.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Klitschko sẽ so găng với Tyson Fury ngày 28/11 tới.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	Trong khi đó Fury tiếp tục khiêu khích đối phương: “Tôi muốn đánh bại Klitschko không phải vì tiền hay các đai vô địch thế giới hiện trong tay anh ta. Tôi có trách nhiệm chấm dứt sự thống trị của một Klitschko nhàm chán, người đã hủy hoại quyền anh hạng nặng thời gian qua. Tôi sẽ mang niềm vui và sự phấn khích của thời huyền thoại Muhammad Ali trở lại với quyền anh hạng nặng. Tôi buộc phải đánh bại anh ta. Nhưng dù kết quả có thế nào thì tôi thà bị hạ đo ván thuyết phục, còn hơn là thua vì quyết định cho điểm của trọng tài”.</p>\r\n<p class=\"Normal\">\r\n	Tyson Fury hiện tại chỉ như một con số không khi sánh với bảng vàng thành tích của đối thủ đàn anh. Võ sĩ 27 tuổi người thành phố Manchester, Anh, chỉ là đương kim vô địch một số giải quốc gia và khu vực như: danh hiệu hạng nặng của EBU (Liên đoàn Quyền anh châu Âu), Khối Thịnh vượng chung, chức vô địch Ireland và Vương quốc Anh. Nhưng nếu thắng trận thư hùng sắp tới, Tyson Fury sẽ lập tức “từ số không trở thành người hùng” của thể thao Anh quốc.</p>\r\n<p align=\"right\" class=\"Normal\">\r\n	<strong>Nguyễn Phát</strong></p>', '1', null, null, null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('3', 'Rivaldo khẳng định Zidane sẽ là HLV mới của Real', 'rivaldo-khang-dinh-zidane-se-la-hlv-moi-cua-real', 'Trong khi Real chưa quyết định thay HLV Rafa Benitez sau trận El Clasico, huyền thoại Rivaldo của Barca sớm cho rằng Zidane sẽ ngồi vào \"ghế nóng\" trong tương lai gần.', '<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"rivaldo-khang-dinh-zidane-se-la-hlv-moi-cua-real\" data-natural-width=\"500\" src=\"http://img.f1.thethao.vnecdn.net/2015/11/22/zidane-6709-1448202407.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Bức ảnh ghép được Rivaldo chia sẻ trên Instagram, trong đó Zidane được dự đoán sẽ là thuyền trưởng mới mà Real đang cần.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	Sau chiến thắng 4-0 của Barca trước Real tối 21/11, Rivaldo viết trên <em>Instagram</em>: \"Xin chúc mừng tất cả các cầu thủ Barca. Chiến thắng 4-0 tại Madrid là một kết quả không thể tin nổi, còn hai hiệp giống như hai buổi tập của Barca. Real đã có một HLV mới là Zidane. Tôi tin giờ là lúc trao cơ hội cho anh ấy, giống như Barca từng làm với Pep Guardiola và Luis Enrique\".</p>\r\n<p class=\"Normal\">\r\n	Trên thực tế, thông điệp của Rivaldo không khác quá nhiều so với thông tin trước trận El Clasico. Theo đó, Chủ tịch Florentino Perez có thể sẽ cân nhắc sa thải Rafa Benitez nếu Real để thua Barca, đồng thời <a href=\"http://thethao.vnexpress.net/tin-tuc/la-liga/zidane-co-the-len-thay-benitez-neu-real-thua-o-el-clasico-3315062.html\">đề cử HLV đội B là Zinedine Zidane lên thay</a>.</p>\r\n<p class=\"Normal\">\r\n	Thi đấu cùng thời với Zidane, Rivaldo trở thành một huyền thoại tại Barca cuối những năm 1990 khi giành Quả bóng Vàng châu Âu, Cầu thủ hay nhất FIFA và hai chức vô địch Liga.Trong khi đó, Zidane đến Real vào năm 2001 và giành Champions League sau đó một năm.</p>\r\n<p class=\"Normal\">\r\n	Thất bại trong trận El Clasico tối 21/11 thực sự là một cú sốc đối với Real. Đoàn quân của HLV Benitez không chỉ muối mặt với tỷ số 0-4 trên sân nhà, mà còn để Barca vượt lên tạo khoảng cách sáu điểm trên bảng tổng sắp Liga 2015-2016.</p>\r\n<p class=\"Normal\">\r\n	Benitez bắt đầu dẫn dắt Real thay Carlo Ancelotti từ tháng Bảy năm nay. Đến giờ \"triều đại mới\" tỏ ra thiếu thuyết phục cả về lối chơi lẫn thành tích so với \"triều đại cũ\".</p>\r\n<p class=\"Normal\" style=\"text-align:right;\">\r\n	<strong><span>Kim Thành</span></strong></p>', '1', null, null, null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('4', '5 lời khuyên khi sử dụng dầu ăn', '5-loi-khuyen-khi-su-dung-dau-an', 'Dầu ăn là nguyên liệu được sử dụng để nấu ăn hàng ngày trong các gia đình. Tuy nhiên không phải ai cũng biết lựa chọn và sử dụng dầu ăn sao cho đúng cách.', '<strong>Tìm hiểu thành phần, nguyên liệu</strong></p>\r\n<p>\r\n	Theo bác sĩ Đỗ Thị Ngọc Diệp, Giám đốc Trung tâm Dinh dưỡng TP HCM: “Thành phần nguyên liệu là yếu tố quan trọng hàng đầu để cân nhắc khi chọn dầu ăn bởi nguyên liệu tốt sẽ làm nên sản phẩm chất lượng tốt. Các nghiên cứu khoa học cho thấy, dầu thực vật có chứa nhiều loại dưỡng chất tốt cho sức khỏe, hỗ trợ giảm nguy cơ một số bệnh tim mạch, ức chế các gốc tự do gây lão hóa và ung thư”. Cũng theo bác sĩ Diệp, các loại dầu có lợi cho sức khỏe có thể kể đến là dầu gạo, dầu ô liu, dầu hướng dương, dầu nành...</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 61.8417%;\"><tbody><tr><td>\r\n				<img alt=\"polyad\" data-natural-width=\"400\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/19/19-11-201558-1734-1447926420.jpg\" data-width=\"400\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Với hàm lượng Vitamin E cao nhất so với các loại dầu thực vật khác, các axít béo thiết yếu, các chất chống ôxi hóa tự nhiên, dầu hướng dương được ghi nhận là mang đến lợi ích cao đối với tim mạch.</p>\r\n			</td>\r\n		</tr></tbody></table><p>\r\n	<strong>Nên đa dạng các loại dầu ăn</strong></p>\r\n<p>\r\n	Theo Tiến sĩ Nguyễn Trọng Hưng, Phó trưởng khoa Dinh dưỡng lâm sàng và tiết chế, Viện dinh dưỡng, mỗi loại dầu ăn đều có các axit béo và dưỡng chất khác nhau, vì vậy nên sử dụng đa dạng các loại dầu ăn hoặc dầu phức hợp có thành phần nguyên liệu từ các loại dầu ăn cao cấp như dầu gạo, hướng dương, nành... để cung cấp đa dạng dưỡng chất cho cơ thể.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 77.3022%;\"><tbody><tr><td>\r\n				<img alt=\"polyad\" data-natural-width=\"500\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/19/19-11-201513-9070-1447926421.jpg\" data-width=\"500\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Dầu gạo cung cấp một tỷ lệ cân bằng tối ưu giữa các axít béo thiết yếu, gần với tỷ lệ khuyến cáo của tổ chức Y tế thế giới và Hội Tim mạch Mỹ, giúp làm giảm cholesterol xấu trong máu, ức chế sự hình thành của các gốc tự do.</p>\r\n			</td>\r\n		</tr></tbody></table><p>\r\n	Theo đó, nhiều loại dầu có hàm lượng axít béo thiết yếu cao, nhiều dưỡng chất tự nhiên như: dầu gạo, dầu ôliu, hướng dương, dầu ngô, dầu đậu nành, dầu vừng (mè) ...có thể dùng để trộn salad, xào, ướp thực phẩm giúp bổ sung các axít béo thiết yếu, các dưỡng chất tự nhiên cho người ăn, tăng vị ngon cho thức ăn và giúp hấp thu tốt các vitamin tan trong dầu của thực phẩm.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 77.3022%;\"><tbody><tr><td>\r\n				<img alt=\"polyad\" data-natural-width=\"500\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/19/19-11-201527-5181-1447926421.jpg\" data-width=\"500\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Dầu đậu nành rất tốt cho sức khỏe tim mạch nhờ hàm lượng dồi dào các axít béo Omega 3,6,9, cùng với Vitamin E và Phytosterols giúp thúc đầy tuần hoàn máu, giảm nguy cơ tăng huyết áp, đột quỵ, xơ vữa động mạch,…</p>\r\n			</td>\r\n		</tr></tbody></table><p>\r\n	Mặt khác, dầu gạo, dầu nành, dầu hạt cải, dầu cọ... có thể dùng cho các món chiên, rán ở nhiệt độ cao như rán nem, khoai tây, cá…bởi loại dầu này có điểm sôi cao. Với các gia đình có trẻ nhỏ, nên dùng dầu ăn đặc chế cho trẻ em để bổ sung DHA, Omega 3,6,9 và chỉ thêm dầu sau khi tắt bếp để giữ chất dinh dưỡng.</p>\r\n<p>\r\n	<strong>Không nên dùng dầu ở nhiệt độ cao</strong></p>\r\n<p>\r\n	Nhiệt độ cao không những phá huỷ thành phần dinh dưỡng trong thực phẩm mà còn sản sinh ra peroxide và các chất gây hại cho sức khỏe, gây cháy khét thực phẩm. Vì vậy, tốt nhất người nội trợ sử dụng nhiệt độ vừa phải khi nấu nướng, đặc biệt là khi chiên rán. Nếu bạn có thói quen xào nấu thực phẩm khi thấy dầu sôi thì nên để chảo thật nóng, sau đó mới cho dầu vào.</p>\r\n<p>\r\n	<strong>Không dùng dầu chiên lại nhiều lần</strong></p>\r\n<p>\r\n	Bác sĩ Đỗ Thị Ngọc Diệp, Giám đốc Trung tâm Dinh dưỡng TPHCM cũng cho biết thêm, phần dầu ăn dư thừa sau khi đã sử dụng để chế biến thức ăn nên đổ đi, không sử dụng lại. Khi dầu ăn bị đun nóng nhiều lần, không chỉ các vitamin và một số chất dinh dưỡng trong dầu bị phá hủy mà còn xuất hiện những chất gây hại cho sức khỏe từ chính bản thân dầu ăn và những phần thực phẩm cháy khét sau quá trình đun nấu mà mắt thường không nhìn thấy. Nếu thường xuyên sử dụng, sẽ làm tăng nguy cơ mắc bệnh ung thư. Dầu ăn sử dụng lại cũng dễ bị ôxi hóa dẫn đến sự thay đổi về mùi vị và màu sắc của món ăn. Thực phẩm khi chiên với dầu mới sẽ cho màu tươi, thơm ngon, còn với dầu sử dụng lại nhiều lần sẽ có màu vàng sậm, mùi khét, không an toàn cho sức khỏe.</p>\r\n<p>\r\n	<strong>Bảo quản dầu ăn </strong></p>\r\n<p>\r\n	Tiến sĩ Hưng khuyên nên bảo quản dầu ăn ở nơi thoáng mát, để dầu ở lọ sành, chai thủy tinh sạch và khô ráo tránh đựng trong đồ vật bằng kim loại. Đồng thời, sau khi sử dụng, dầu cần được đậy nắp kín và tránh ánh sáng trực tiếp.</p>\r\n<p style=\"text-align:right;\">\r\n	<strong>Tú Linh</strong></p>', '2', '', '', null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('5', '3 động tác cơ bản để rèn luyện cơ lưng chữ V', '3-dong-tac-co-ban-de-ren-luyen-co-lung-chu-v', 'Tập cơ lưng (xô) dễ ảnh hưởng đến xương sống nên khi tập phải có đai lưng, không nên kéo quá nặng có thể dẫn đến việc bị cong lưng, theo huấn luyện viên thể hình Võ Thanh Đại.', '<p class=\"Normal\">\r\n	Huấn luyện viên Võ Thanh Đại giới thiệu 3 bài tập cơ bản về cơ lưng (còn gọi là xô) gồm: bài tập xô dài, bài tập xô ngắn và bài tập xô dưới. Tập luyện thường xuyên sẽ giúp nam giới có thân hình chữ V rất đẹp.&nbsp;</p>\r\n<div style=\"text-align:center;\">\r\n	<div style=\"text-align:center;\">\r\n		<div class=\"embed-container\"><iframe width=\"480\" height=\"270\" src=\"http://vnexpress.net/parser_v3.php?id=71952&amp;t=2&amp;ft=video&amp;si=1003750&amp;ap=1&amp;ishome=0\" frameborder=\"0\" allowfullscreen=\"\"></iframe></div></div>\r\n	<div style=\"text-align:right;\">\r\n		<strong>An Nguyên</strong></div>\r\n</div>', '2', null, null, null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('6', 'Những điều cần biết để phòng trị ung thư đại tràng', 'nhung-dieu-can-biet-de-phong-tri-ung-thu-dai-trang', 'Ung thư đại tràng là một trong những loại ung thư thường gặp trên thế giới cũng như ở Việt Nam, độ tuổi bệnh nhân ngày càng trẻ hóa liên quan đến sự thay đổi lối sống.', '<p class=\"Normal\">\r\n	Theo bác sĩ chuyên khoa 1 Nguyễn Hữu Thịnh, Phó khoa Ngoại Tiêu hóa, Bệnh viện Đại học Y Dược TP HCM, những thắc mắc thường gặp về ung thư đại tràng như sau:</p>\r\n<p class=\"subtitle\">\r\n	Đại tràng là gì?</p>\r\n<p class=\"Normal\">\r\n	Đại tràng (hay ruột già) là phần ống tiêu hóa nối từ ruột non đến trực tràng tạo thành khung hình chữ U ngược vây quanh ruột non từ phải sang trái. Đại tràng gồm các phần: Manh tràng và ruột thừa, đại tràng lên, đại tràng góc gan, đại tràng ngang, đại tràng góc lách, đại tràng xuống, đại tràng chậu hông. Đại tràng có chức năng hấp thu nước, điện giải và một số chất dinh dưỡng còn lại của quá trình tiêu hóa. Tại đây, phân được hình thành và được đưa ra ngoài khi đi tiêu.</p>\r\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"0\" class=\"tbl_insert\" style=\"width:80%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"giai-dap-20-thac-mac-pho-bien-ve-ung-thu-dai-truc-trang\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang1-2632-1448094687.png\" data-width=\"250\" data-pwidth=\"646.8125\"></td>\r\n			<td style=\"text-align: center;\">\r\n				<img alt=\"giai-dap-20-thac-mac-pho-bien-ve-ung-thu-dai-truc-trang-1\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang-2525-1448094687.png\" data-width=\"250\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Ảnh 1: Vị trí của đại tràng.</p>\r\n			</td>\r\n			<td>\r\n				<p class=\"Image\">\r\n					Ảnh 2: Cấu tạo của đại tràng.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Ung thư là gì?</p>\r\n<p class=\"Normal\">\r\n	Ung thư là bệnh do các tế bào bất thường sinh sôi một cách tùy tiện không kiểm soát, xâm lấn xuyên qua các mô rào cản tự nhiên, ăn lan đến các mô tại chỗ và tràn đến các mô ở xa rồi sinh sản không ngừng. Nếu tế bào ung thư không bị tiêu diệt sẽ làm chết cơ thể chủ.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 77.3022%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"ai-de-bi-ung-thu-dai-truc-trang-2\" data-natural-width=\"500\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang3-8658-1448039204.png\" data-width=\"500\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Quá trình hình thành ung thư.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Ung thư đại tràng là gì?</p>\r\n<p class=\"Normal\">\r\n	Ung thư đại tràng là do sự tăng sinh bất thường không kiểm soát của các tế bào xuất phát từ đại tràng. 95% xuất phát từ niêm mạc đại tràng gọi là Adenocarcinoma, 5% còn lại là các ung thư hiếm gặp như sarcom, lymphoma…xuất phát từ các loại tế bào khác ở đại tràng.</p>\r\n<p class=\"subtitle\">\r\n	Phần nào thường bị ung thư?</p>\r\n<p class=\"Normal\">\r\n	Theo thống kê, 10% ung thư xuất phát từ đại tràng ngang, 15% ở đại tràng trái, 30% đại tràng phải, 25% đại tràng chậu hông, 20% trực tràng.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 57.2036%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"ai-de-bi-ung-thu-dai-truc-trang-2\" data-natural-width=\"370\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang4-7479-1448039204.png\" data-width=\"370\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Tỷ lệ ung thư xuất phát từ các vị trí của đại tràng.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Sự phổ biến của ung thư đại tràng</p>\r\n<p class=\"Normal\">\r\n	Đây là bệnh phổ biến tại các nước Âu Mỹ, đứng hàng đầu trong ung thư đường tiêu hóa. Tại Việt Nam và các nước châu Á, ung thư đại tràng đứng thứ hai trong nhóm các bệnh ung thư đường tiêu hóa, chỉ sau ung thư dạ dày.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 77.3022%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"ai-de-bi-ung-thu-dai-truc-trang-3\" data-natural-width=\"500\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang5-6981-1448039205.png\" data-width=\"500\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Sự phổ biến của ung thư đại tràng trên thế giới.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Nguyên nhân</p>\r\n<p class=\"Normal\">\r\n	Hiện chưa thể xác định nguyên nhân chính xác gây ung thư đại tràng. Nhiều chuyên gia cho rằng có yếu tố nhiều nguy cơ gây bệnh liên quan tới lối sống và di truyền. Chế độ ăn nhiều chất béo và ít chất xơ, rau quả, ăn nhiều thịt đỏ như bò, heo, thực phẩm chiên nướng và các sản phẩm bơ sữa giàu chất béo có thể tăng nguy cơ ung thư đại tràng. Các yếu tố về lối sống như hút thuốc lá, ít vận động, béo phì cũng có thể tăng nguy cơ phát triển bệnh này.</p>\r\n<p class=\"Normal\">\r\n	Các yếu tố về di truyền quyết định người nào dễ bị bệnh này, trong khi các yếu tố về chế độ ăn và lối sống mang đến nguy cơ thực sự phát triển thành bệnh.</p>\r\n<p class=\"subtitle\">\r\n	Người nào có thể bị ung thư đại tràng?</p>\r\n<p class=\"Normal\">\r\n	Người có yếu tố nguy cơ sẽ dễ bị ung thư đại tràng hơn những người khác. Nhiều yếu tố có thể kiểm soát được nhưng một số khác thì không. Cụ thể bao gồm:</p>\r\n<p class=\"Normal\">\r\n	- Yếu tố gia đình: Bạn có thể bị bệnh nếu trong gia đình có cha mẹ, anh chị em ruột, con bị ung thư.</p>\r\n<p class=\"Normal\">\r\n	- Dân tộc: Người Do Thái có nguy cơ ung thư cao hơn các dân tộc khác.</p>\r\n<p class=\"Normal\">\r\n	- Polyp đại tràng: Một số bệnh polyp đại tràng có khả năng chuyển thành ung thư.</p>\r\n<p class=\"Normal\">\r\n	- Người từng bị ung thư đại tràng đã được điều trị thì khả năng bị ung thư ở phần còn lại của đại tràng cao hơn người khác.</p>\r\n<p class=\"Normal\">\r\n	- Viêm đại tràng: Bệnh Crohn, viêm đại tràng lâu ngày.</p>\r\n<p class=\"Normal\">\r\n	- Tuổi: Người trên 50 tuổi.</p>\r\n<p class=\"Normal\">\r\n	- Chế độ ăn: Người có chế độ ăn giàu chất béo, nhất là chất béo nguồn gốc động vật, ít chất xơ có nguy cơ ung thư đại tràng cao hơn.</p>\r\n<p class=\"Normal\">\r\n	- Một số yếu tố nguy cơ khác như béo, ít vận động, hút thuốc lá, uống rượu…</p>\r\n<p class=\"subtitle\">\r\n	Có thể ngăn chặn ung thư đại tràng không?</p>\r\n<p class=\"Normal\">\r\n	Dù không biết nguyên nhân chính xác của ung thư đại tràng, các chuyên gia cho biết vẫn có thể giảm nguy cơ bệnh bằng cách giảm yếu tố nguy cơ. Một số yếu tố nguy cơ có thể kiểm soát được, một số khác thì không. Vì vậy khám bệnh định kỳ để phát hiện sớm bệnh thì cơ hội chữa khỏi cao hơn.</p>\r\n<p class=\"Normal\">\r\n	Các yếu tố có thể can thiệp như chế độ ăn giàu chất xơ gồm rau, củ, quả và hạn chế chất béo. Những ai có người thân bị polyp đại tràng nên được soi đại tràng kiểm tra. Những người có các yếu tố nguy cơ nên có chế độ tái khám định kỳ.</p>\r\n<p class=\"Normal\" style=\"text-align:center;\">\r\n	<strong>&gt;&gt; </strong>Xem tiếp <strong><a title=\"phát hiện sớm và điều trị ung thư đại tràng\" href=\"http://suckhoe.vnexpress.net/tin-tuc/cac-benh/nhung-dieu-can-biet-de-phong-tri-ung-thu-dai-trang-3315588-p2.html\">phát hiện sớm và điều trị ung thư đại tràng</a></strong></p>\r\n<p class=\"Normal\" style=\"text-align:right;\">\r\n	<strong>Trần Ngoan</strong><br><em>tranngoan@vnexpress.net</em></p>', '2', null, null, null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('8', 'Tục kéo dài hộp sọ của bộ tộc Nam Mỹ', 'tuc-keo-dai-hop-so-cua-bo-toc-nam-my', 'Để kéo dài hộp sọ, người Patagonia sống cách đây 2.000 năm ở Nam Mỹ buộc chặt vải quanh đầu đứa trẻ hoặc ép chặt đầu chúng bằng ván gỗ', '<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"tuc-keo-dai-hop-so-cua-bo-toc-nam-my\" data-natural-width=\"500\" src=\"http://m.f29.img.vnecdn.net/2015/11/23/VNE-Skull-8226-1448251491.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Tập tục làm biến dạng hộp sọ rất phổ biến ở những bộ tộc thời tiền sử sống ở trung tâm dãy núi Andes, Nam Mỹ. Ảnh:&nbsp;<em>Didier Descouens.</em></p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	Năm 2009, một nhóm các nhà khảo cổ học tìm thấy những bộ hài cốt với hộp sọ biến dạng trong khu vực chôn cất có niên đại 2.000 năm ở Patagonia, Nam Mỹ.</p>\r\n<p class=\"Normal\">\r\n	Marta Alfonso-Durruty, nhà nhân chủng học tại Đại học Kansas, Manhattan, Mỹ, được mời đến Viện nghiên cứu Patagonia, Chile, để tìm hiểu. Khi Alfonso-Durruty đến nơi, bà phát hiện 18 (30 %) trong số 60 hộp sọ người trưởng thành bị kéo dài, <em>BBC</em> đưa tin.</p>\r\n<p class=\"Normal\">\r\n	Theo nghiên cứu của Alfonso-Durruty và đồng nghiệp, thay vì tác động đến hộp sọ thời kỳ trưởng thành, người Patagonia cổ tìm cách kéo dài hộp sọ ở đầu thời thơ ấu, khi xương vẫn đủ mềm để điều chỉnh hình dáng.</p>\r\n<p class=\"Normal\">\r\n	Để làm biến dạng dáng hộp sọ của đứa trẻ, người cha hoặc mẹ buộc chặt đầu con bằng những băng vải. Cách này khiến hộp sọ phát triển hướng lên trên theo hình trụ. Tuy nhiên, nếu quấn vải quá chặt, đứa trẻ có thể chết. Một cách làm khác giúp tạo ra hộp sọ phẳng là dùng ván gỗ cứng để ép chặt phần trước và sau đầu trẻ trong thời gian dài.</p>\r\n<p class=\"Normal\">\r\n	Alfonso-Durruty cho rằng, người Patagonia cổ không làm biến dạng hộp sọ để thể hiện đặc trưng cộng đồng, mà nhằm mở rộng lãnh thổ và tiếp cận những nguồn tài nguyên mới. Bà trình bày nhận định này trên Tạp chí Nhân chủng học Tự nhiên của Mỹ số tháng 9.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"tuc-keo-dai-hop-so-cua-bo-toc-nam-my-1\" data-natural-width=\"500\" src=\"http://m.f29.img.vnecdn.net/2015/11/23/VNE-Skull-1-8385-1448251491.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Làm dài hộp sọ là cách người Patagonia cổ đại xây dựng sự gắn bó giữa các bộ tộc. Ảnh:&nbsp;<em>Didier Descouens.</em></p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	Người Patagonia cổ sống ở những khu vực với nguồn tài nguyên không đồng đều. \"Trong trường hợp đó, giải pháp hợp lý nhất là mở rộng mạng lưới để bộ tộc có thể tiếp cận những tài nguyên khác nhau dọc theo lãnh thổ\", Alfonso-Durruty cho biết.</p>\r\n<p class=\"Normal\">\r\n	Cách mở rộng tốt nhất là kết bạn với những bộ tộc khác. Do thay đổi hình dáng hộp sọ không dễ dàng, những người tiến hành quá trình này lập tức thể hiện họ là một bộ tộc đáng tin cậy. \"Nhờ đó, kéo dài hộp sọ giúp họ thông báo quan hệ với cá nhân ở những vùng miền khác\", Alfonso-Durruty nói.</p>\r\n<p class=\"Normal\">\r\n	Tập tục này thậm chí còn giúp họ mở rộng bộ tộc. Cách đây 2.000 năm, khu vực từng trải qua sự tăng vọt về dân số. Thông qua phân tích chế độ ăn của người Patagonia cổ đại, nhóm nghiên cứu phát hiện họ ăn cả thức ăn có trên mặt đất lẫn thức ăn ở biển, cho thấy họ đã sống ở nhiều vùng khác nhau.</p>\r\n<p align=\"right\" class=\"Normal\">\r\n	<strong>Phương Hoa</strong></p>', '3', '', '', null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('10', 'hgjgh', 'hgjgh', 'fghjfg', 'hjfghj', '3', 'fghj', 'ghj', null, '1448269725', '1448269725', null, '0', '');

-- ----------------------------
-- Table structure for tbl_user
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
INSERT INTO `tbl_user` VALUES ('7', 'taikhoan1', '$2y$13$gPBivAxrWPZDIQJNCCLdguwu/qt0WNq9G4.96kXwM7Yd9OhS9Erq.', 'author', 'binh.phamvan@gmail.com', 'No Name', '1', '989279795', '_PVPTJzqLEhoQur_IdC0h_8eF-YsbBSTSlxrBqf9Od68DT28EbccUaWlW87PYAp7', null, '_PVPTJzqLEhoQur_IdC0h_8eF-YsbBSTSlxrBqf9Od68DT28EbccUaWlW87PYAp7', '1447994622', null);
