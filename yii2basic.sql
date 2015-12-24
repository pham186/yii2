/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : yii2basic

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-12-24 17:38:41
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('24', 'Thể thao', 'the-thao', '<p>tin tức thể thao</p>', '1', '2', '1');
INSERT INTO `tbl_category` VALUES ('37', 'Văn hóa - xã hội', 'van-hoa', '', '3', '4', '1');
INSERT INTO `tbl_category` VALUES ('42', 'Du lịch', 'du-lich', '', '5', '6', '1');

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
  `image` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------
INSERT INTO `tbl_post` VALUES ('4', '5 lời khuyên khi sử dụng dầu ăn', '5-loi-khuyen-khi-su-dung-dau-an', 'Dầu ăn là nguyên liệu được sử dụng để nấu ăn hàng ngày trong các gia đình. Tuy nhiên không phải ai cũng biết lựa chọn và sử dụng dầu ăn sao cho đúng cách.', '<p><strong>T&igrave;m hiểu th&agrave;nh phần, nguy&ecirc;n liệu</strong></p>\r\n<p>Theo b&aacute;c sĩ Đỗ Thị Ngọc Diệp, Gi&aacute;m đốc Trung t&acirc;m Dinh dưỡng TP HCM: &ldquo;Th&agrave;nh phần nguy&ecirc;n liệu l&agrave; y&ecirc;́u t&ocirc;́ quan trọng h&agrave;ng đầu để c&acirc;n nhắc khi chọn dầu ăn bởi nguy&ecirc;n liệu tốt sẽ l&agrave;m n&ecirc;n sản phẩm chất lượng tốt. C&aacute;c nghi&ecirc;n cứu khoa học cho thấy, dầu thực vật c&oacute; chứa nhiều loại dưỡng chất tốt cho sức khỏe, hỗ trợ giảm nguy cơ một số bệnh tim mạch, ức chế c&aacute;c gốc tự do g&acirc;y l&atilde;o h&oacute;a v&agrave; ung thư&rdquo;. Cũng theo b&aacute;c sĩ Diệp, c&aacute;c loại dầu c&oacute; lợi cho sức khỏe c&oacute; thể kể đến l&agrave; dầu gạo, dầu &ocirc; liu, dầu hướng dương, dầu n&agrave;nh...</p>\r\n<table class=\"tplCaption\" style=\"width: 61.8417%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/19/19-11-201558-1734-1447926420.jpg\" alt=\"polyad\" data-natural-width=\"400\" data-width=\"400\" data-pwidth=\"646.8125\" /></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p class=\"Image\">Với h&agrave;m lượng Vitamin E cao nhất so với c&aacute;c loại dầu thực vật kh&aacute;c, c&aacute;c ax&iacute;t b&eacute;o thiết yếu, c&aacute;c chất chống &ocirc;xi h&oacute;a tự nhi&ecirc;n, dầu hướng dương được ghi nhận l&agrave; mang đến lợi &iacute;ch cao đối với tim mạch.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>N&ecirc;n đa dạng c&aacute;c loại dầu ăn</strong></p>\r\n<p>Theo Tiến sĩ Nguyễn Trọng Hưng, Ph&oacute; trưởng khoa Dinh dưỡng l&acirc;m s&agrave;ng v&agrave; tiết chế, Viện dinh dưỡng, mỗi loại dầu ăn đều c&oacute; c&aacute;c axit b&eacute;o v&agrave; dưỡng chất kh&aacute;c nhau, v&igrave; vậy n&ecirc;n sử dụng đa dạng c&aacute;c loại dầu ăn hoặc dầu phức hợp c&oacute; th&agrave;nh phần nguy&ecirc;n liệu từ c&aacute;c loại dầu ăn cao cấp như dầu gạo, hướng dương, n&agrave;nh... để cung cấp đa dạng dưỡng chất cho cơ thể.</p>\r\n<table class=\"tplCaption\" style=\"width: 77.3022%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/19/19-11-201513-9070-1447926421.jpg\" alt=\"polyad\" data-natural-width=\"500\" data-width=\"500\" data-pwidth=\"646.8125\" /></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p class=\"Image\">Dầu gạo cung cấp một tỷ lệ c&acirc;n bằng tối ưu giữa c&aacute;c ax&iacute;t b&eacute;o thiết yếu, gần với tỷ lệ khuyến c&aacute;o của tổ chức Y tế thế giới v&agrave; Hội Tim mạch Mỹ, gi&uacute;p l&agrave;m giảm cholesterol xấu trong m&aacute;u, ức chế sự h&igrave;nh th&agrave;nh của các gốc tự do.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Theo đ&oacute;, nhiều loại dầu c&oacute; h&agrave;m lượng ax&iacute;t b&eacute;o thiết yếu cao, nhiều dưỡng chất tự nhi&ecirc;n như: dầu gạo, dầu &ocirc;liu, hướng dương, dầu ng&ocirc;, dầu đậu n&agrave;nh, dầu vừng (m&egrave;) ...c&oacute; thể d&ugrave;ng để trộn salad, x&agrave;o, ướp thực phẩm gi&uacute;p bổ sung c&aacute;c ax&iacute;t b&eacute;o thiết yếu, c&aacute;c dưỡng chất tự nhi&ecirc;n cho người ăn, tăng vị ngon cho thức ăn v&agrave; gi&uacute;p hấp thu tốt c&aacute;c vitamin tan trong dầu của thực phẩm.</p>\r\n<table class=\"tplCaption\" style=\"width: 77.3022%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/19/19-11-201527-5181-1447926421.jpg\" alt=\"polyad\" data-natural-width=\"500\" data-width=\"500\" data-pwidth=\"646.8125\" /></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p class=\"Image\">Dầu đậu n&agrave;nh rất tốt cho sức khỏe tim mạch nhờ h&agrave;m lượng dồi d&agrave;o c&aacute;c ax&iacute;t b&eacute;o Omega 3,6,9, c&ugrave;ng với Vitamin E v&agrave; Phytosterols gi&uacute;p th&uacute;c đầy tuần ho&agrave;n m&aacute;u, giảm nguy cơ tăng huyết &aacute;p, đột quỵ, xơ vữa động mạch,&hellip;</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Mặt kh&aacute;c, dầu gạo, dầu n&agrave;nh, dầu hạt cải, dầu cọ... c&oacute; thể d&ugrave;ng cho c&aacute;c m&oacute;n chi&ecirc;n, r&aacute;n ở nhiệt độ cao như r&aacute;n nem, khoai t&acirc;y, c&aacute;&hellip;bởi loại dầu n&agrave;y c&oacute; điểm s&ocirc;i cao. Với c&aacute;c gia đ&igrave;nh c&oacute; trẻ nhỏ, n&ecirc;n d&ugrave;ng dầu ăn đặc chế cho trẻ em để bổ sung DHA, Omega 3,6,9 v&agrave; chỉ th&ecirc;m dầu sau khi tắt bếp để giữ chất dinh dưỡng.</p>\r\n<p><strong>Kh&ocirc;ng n&ecirc;n d&ugrave;ng dầu ở nhiệt độ cao</strong></p>\r\n<p>Nhiệt độ cao kh&ocirc;ng những ph&aacute; huỷ th&agrave;nh phần dinh dưỡng trong thực phẩm m&agrave; c&ograve;n sản sinh ra peroxide v&agrave; c&aacute;c chất g&acirc;y hại cho sức khỏe, g&acirc;y ch&aacute;y kh&eacute;t thực phẩm. V&igrave; vậy, tốt nhất người nội trợ sử dụng nhiệt độ vừa phải khi nấu nướng, đặc biệt l&agrave; khi chi&ecirc;n r&aacute;n. Nếu bạn c&oacute; th&oacute;i quen x&agrave;o nấu thực phẩm khi thấy dầu s&ocirc;i th&igrave; n&ecirc;n để chảo thật n&oacute;ng, sau đ&oacute; mới cho dầu v&agrave;o.</p>\r\n<p><strong>Kh&ocirc;ng d&ugrave;ng dầu chi&ecirc;n lại nhiều lần</strong></p>\r\n<p>B&aacute;c sĩ Đỗ Thị Ngọc Diệp, Gi&aacute;m đốc Trung t&acirc;m Dinh dưỡng TPHCM cũng cho biết th&ecirc;m, phần dầu ăn dư thừa sau khi đ&atilde; sử dụng để chế biến thức ăn n&ecirc;n đổ đi, kh&ocirc;ng sử dụng lại. Khi dầu ăn bị đun n&oacute;ng nhiều lần, kh&ocirc;ng chỉ c&aacute;c vitamin v&agrave; một số chất dinh dưỡng trong dầu bị ph&aacute; hủy m&agrave; c&ograve;n xuất hiện những chất g&acirc;y hại cho sức khỏe từ ch&iacute;nh bản th&acirc;n dầu ăn v&agrave; những phần thực phẩm ch&aacute;y kh&eacute;t sau qu&aacute; tr&igrave;nh đun nấu m&agrave; mắt thường kh&ocirc;ng nh&igrave;n thấy. Nếu thường xuy&ecirc;n sử dụng, sẽ l&agrave;m tăng nguy cơ mắc bệnh ung thư. Dầu ăn sử dụng lại cũng dễ bị &ocirc;xi h&oacute;a dẫn đến sự thay đổi về m&ugrave;i vị v&agrave; m&agrave;u sắc của m&oacute;n ăn. Thực phẩm khi chi&ecirc;n với dầu mới sẽ cho m&agrave;u tươi, thơm ngon, c&ograve;n với dầu sử dụng lại nhiều lần sẽ c&oacute; m&agrave;u v&agrave;ng sậm, m&ugrave;i kh&eacute;t, kh&ocirc;ng an to&agrave;n cho sức khỏe.</p>\r\n<p><strong>Bảo quản dầu ăn </strong></p>\r\n<p>Tiến sĩ Hưng khuy&ecirc;n n&ecirc;n bảo quản dầu ăn ở nơi tho&aacute;ng m&aacute;t, để dầu ở lọ s&agrave;nh, chai thủy tinh sạch v&agrave; kh&ocirc; r&aacute;o tr&aacute;nh đựng trong đồ vật bằng kim loại. Đồng thời, sau khi sử dụng, dầu cần được đậy nắp k&iacute;n v&agrave; tr&aacute;nh &aacute;nh s&aacute;ng trực tiếp.</p>\r\n<p style=\"text-align: right;\"><strong>T&uacute; Linh</strong></p>', '42', null, '', '', '1', '1448266590', '1448223360', '1450924358', '2', '');
INSERT INTO `tbl_post` VALUES ('5', '3 động tác cơ bản để rèn luyện cơ lưng chữ V', '3-dong-tac-co-ban-de-ren-luyen-co-lung-chu-v', 'Tập cơ lưng (xô) dễ ảnh hưởng đến xương sống nên khi tập phải có đai lưng, không nên kéo quá nặng có thể dẫn đến việc bị cong lưng, theo huấn luyện viên thể hình Võ Thanh Đại.', '<p class=\"Normal\">\r\n	Huấn luyện viên Võ Thanh Đại giới thiệu 3 bài tập cơ bản về cơ lưng (còn gọi là xô) gồm: bài tập xô dài, bài tập xô ngắn và bài tập xô dưới. Tập luyện thường xuyên sẽ giúp nam giới có thân hình chữ V rất đẹp.&nbsp;</p>\r\n<div style=\"text-align:center;\">\r\n	<div style=\"text-align:center;\">\r\n		<div class=\"embed-container\"><iframe width=\"480\" height=\"270\" src=\"http://vnexpress.net/parser_v3.php?id=71952&amp;t=2&amp;ft=video&amp;si=1003750&amp;ap=1&amp;ishome=0\" frameborder=\"0\" allowfullscreen=\"\"></iframe></div></div>\r\n	<div style=\"text-align:right;\">\r\n		<strong>An Nguyên</strong></div>\r\n</div>', '2', null, null, null, null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('6', 'Những điều cần biết để phòng trị ung thư đại tràng', 'nhung-dieu-can-biet-de-phong-tri-ung-thu-dai-trang', 'Ung thư đại tràng là một trong những loại ung thư thường gặp trên thế giới cũng như ở Việt Nam, độ tuổi bệnh nhân ngày càng trẻ hóa liên quan đến sự thay đổi lối sống.', '<p class=\"Normal\">\r\n	Theo bác sĩ chuyên khoa 1 Nguyễn Hữu Thịnh, Phó khoa Ngoại Tiêu hóa, Bệnh viện Đại học Y Dược TP HCM, những thắc mắc thường gặp về ung thư đại tràng như sau:</p>\r\n<p class=\"subtitle\">\r\n	Đại tràng là gì?</p>\r\n<p class=\"Normal\">\r\n	Đại tràng (hay ruột già) là phần ống tiêu hóa nối từ ruột non đến trực tràng tạo thành khung hình chữ U ngược vây quanh ruột non từ phải sang trái. Đại tràng gồm các phần: Manh tràng và ruột thừa, đại tràng lên, đại tràng góc gan, đại tràng ngang, đại tràng góc lách, đại tràng xuống, đại tràng chậu hông. Đại tràng có chức năng hấp thu nước, điện giải và một số chất dinh dưỡng còn lại của quá trình tiêu hóa. Tại đây, phân được hình thành và được đưa ra ngoài khi đi tiêu.</p>\r\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"0\" class=\"tbl_insert\" style=\"width:80%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"giai-dap-20-thac-mac-pho-bien-ve-ung-thu-dai-truc-trang\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang1-2632-1448094687.png\" data-width=\"250\" data-pwidth=\"646.8125\"></td>\r\n			<td style=\"text-align: center;\">\r\n				<img alt=\"giai-dap-20-thac-mac-pho-bien-ve-ung-thu-dai-truc-trang-1\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang-2525-1448094687.png\" data-width=\"250\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Ảnh 1: Vị trí của đại tràng.</p>\r\n			</td>\r\n			<td>\r\n				<p class=\"Image\">\r\n					Ảnh 2: Cấu tạo của đại tràng.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Ung thư là gì?</p>\r\n<p class=\"Normal\">\r\n	Ung thư là bệnh do các tế bào bất thường sinh sôi một cách tùy tiện không kiểm soát, xâm lấn xuyên qua các mô rào cản tự nhiên, ăn lan đến các mô tại chỗ và tràn đến các mô ở xa rồi sinh sản không ngừng. Nếu tế bào ung thư không bị tiêu diệt sẽ làm chết cơ thể chủ.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 77.3022%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"ai-de-bi-ung-thu-dai-truc-trang-2\" data-natural-width=\"500\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang3-8658-1448039204.png\" data-width=\"500\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Quá trình hình thành ung thư.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Ung thư đại tràng là gì?</p>\r\n<p class=\"Normal\">\r\n	Ung thư đại tràng là do sự tăng sinh bất thường không kiểm soát của các tế bào xuất phát từ đại tràng. 95% xuất phát từ niêm mạc đại tràng gọi là Adenocarcinoma, 5% còn lại là các ung thư hiếm gặp như sarcom, lymphoma…xuất phát từ các loại tế bào khác ở đại tràng.</p>\r\n<p class=\"subtitle\">\r\n	Phần nào thường bị ung thư?</p>\r\n<p class=\"Normal\">\r\n	Theo thống kê, 10% ung thư xuất phát từ đại tràng ngang, 15% ở đại tràng trái, 30% đại tràng phải, 25% đại tràng chậu hông, 20% trực tràng.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 57.2036%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"ai-de-bi-ung-thu-dai-truc-trang-2\" data-natural-width=\"370\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang4-7479-1448039204.png\" data-width=\"370\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Tỷ lệ ung thư xuất phát từ các vị trí của đại tràng.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Sự phổ biến của ung thư đại tràng</p>\r\n<p class=\"Normal\">\r\n	Đây là bệnh phổ biến tại các nước Âu Mỹ, đứng hàng đầu trong ung thư đường tiêu hóa. Tại Việt Nam và các nước châu Á, ung thư đại tràng đứng thứ hai trong nhóm các bệnh ung thư đường tiêu hóa, chỉ sau ung thư dạ dày.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 77.3022%;\"><tbody><tr><td style=\"text-align: center;\">\r\n				<img alt=\"ai-de-bi-ung-thu-dai-truc-trang-3\" data-natural-width=\"500\" src=\"http://img.f41.suckhoe.vnecdn.net/2015/11/21/ung-thu-dai-trang5-6981-1448039205.png\" data-width=\"500\" data-pwidth=\"646.8125\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Sự phổ biến của ung thư đại tràng trên thế giới.</p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"subtitle\">\r\n	Nguyên nhân</p>\r\n<p class=\"Normal\">\r\n	Hiện chưa thể xác định nguyên nhân chính xác gây ung thư đại tràng. Nhiều chuyên gia cho rằng có yếu tố nhiều nguy cơ gây bệnh liên quan tới lối sống và di truyền. Chế độ ăn nhiều chất béo và ít chất xơ, rau quả, ăn nhiều thịt đỏ như bò, heo, thực phẩm chiên nướng và các sản phẩm bơ sữa giàu chất béo có thể tăng nguy cơ ung thư đại tràng. Các yếu tố về lối sống như hút thuốc lá, ít vận động, béo phì cũng có thể tăng nguy cơ phát triển bệnh này.</p>\r\n<p class=\"Normal\">\r\n	Các yếu tố về di truyền quyết định người nào dễ bị bệnh này, trong khi các yếu tố về chế độ ăn và lối sống mang đến nguy cơ thực sự phát triển thành bệnh.</p>\r\n<p class=\"subtitle\">\r\n	Người nào có thể bị ung thư đại tràng?</p>\r\n<p class=\"Normal\">\r\n	Người có yếu tố nguy cơ sẽ dễ bị ung thư đại tràng hơn những người khác. Nhiều yếu tố có thể kiểm soát được nhưng một số khác thì không. Cụ thể bao gồm:</p>\r\n<p class=\"Normal\">\r\n	- Yếu tố gia đình: Bạn có thể bị bệnh nếu trong gia đình có cha mẹ, anh chị em ruột, con bị ung thư.</p>\r\n<p class=\"Normal\">\r\n	- Dân tộc: Người Do Thái có nguy cơ ung thư cao hơn các dân tộc khác.</p>\r\n<p class=\"Normal\">\r\n	- Polyp đại tràng: Một số bệnh polyp đại tràng có khả năng chuyển thành ung thư.</p>\r\n<p class=\"Normal\">\r\n	- Người từng bị ung thư đại tràng đã được điều trị thì khả năng bị ung thư ở phần còn lại của đại tràng cao hơn người khác.</p>\r\n<p class=\"Normal\">\r\n	- Viêm đại tràng: Bệnh Crohn, viêm đại tràng lâu ngày.</p>\r\n<p class=\"Normal\">\r\n	- Tuổi: Người trên 50 tuổi.</p>\r\n<p class=\"Normal\">\r\n	- Chế độ ăn: Người có chế độ ăn giàu chất béo, nhất là chất béo nguồn gốc động vật, ít chất xơ có nguy cơ ung thư đại tràng cao hơn.</p>\r\n<p class=\"Normal\">\r\n	- Một số yếu tố nguy cơ khác như béo, ít vận động, hút thuốc lá, uống rượu…</p>\r\n<p class=\"subtitle\">\r\n	Có thể ngăn chặn ung thư đại tràng không?</p>\r\n<p class=\"Normal\">\r\n	Dù không biết nguyên nhân chính xác của ung thư đại tràng, các chuyên gia cho biết vẫn có thể giảm nguy cơ bệnh bằng cách giảm yếu tố nguy cơ. Một số yếu tố nguy cơ có thể kiểm soát được, một số khác thì không. Vì vậy khám bệnh định kỳ để phát hiện sớm bệnh thì cơ hội chữa khỏi cao hơn.</p>\r\n<p class=\"Normal\">\r\n	Các yếu tố có thể can thiệp như chế độ ăn giàu chất xơ gồm rau, củ, quả và hạn chế chất béo. Những ai có người thân bị polyp đại tràng nên được soi đại tràng kiểm tra. Những người có các yếu tố nguy cơ nên có chế độ tái khám định kỳ.</p>\r\n<p class=\"Normal\" style=\"text-align:center;\">\r\n	<strong>&gt;&gt; </strong>Xem tiếp <strong><a title=\"phát hiện sớm và điều trị ung thư đại tràng\" href=\"http://suckhoe.vnexpress.net/tin-tuc/cac-benh/nhung-dieu-can-biet-de-phong-tri-ung-thu-dai-trang-3315588-p2.html\">phát hiện sớm và điều trị ung thư đại tràng</a></strong></p>\r\n<p class=\"Normal\" style=\"text-align:right;\">\r\n	<strong>Trần Ngoan</strong><br><em>tranngoan@vnexpress.net</em></p>', '2', null, null, null, null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('8', 'Tục kéo dài hộp sọ của bộ tộc Nam Mỹ', 'tuc-keo-dai-hop-so-cua-bo-toc-nam-my', 'Để kéo dài hộp sọ, người Patagonia sống cách đây 2.000 năm ở Nam Mỹ buộc chặt vải quanh đầu đứa trẻ hoặc ép chặt đầu chúng bằng ván gỗ', '<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"tuc-keo-dai-hop-so-cua-bo-toc-nam-my\" data-natural-width=\"500\" src=\"http://m.f29.img.vnecdn.net/2015/11/23/VNE-Skull-8226-1448251491.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Tập tục làm biến dạng hộp sọ rất phổ biến ở những bộ tộc thời tiền sử sống ở trung tâm dãy núi Andes, Nam Mỹ. Ảnh:&nbsp;<em>Didier Descouens.</em></p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	Năm 2009, một nhóm các nhà khảo cổ học tìm thấy những bộ hài cốt với hộp sọ biến dạng trong khu vực chôn cất có niên đại 2.000 năm ở Patagonia, Nam Mỹ.</p>\r\n<p class=\"Normal\">\r\n	Marta Alfonso-Durruty, nhà nhân chủng học tại Đại học Kansas, Manhattan, Mỹ, được mời đến Viện nghiên cứu Patagonia, Chile, để tìm hiểu. Khi Alfonso-Durruty đến nơi, bà phát hiện 18 (30 %) trong số 60 hộp sọ người trưởng thành bị kéo dài, <em>BBC</em> đưa tin.</p>\r\n<p class=\"Normal\">\r\n	Theo nghiên cứu của Alfonso-Durruty và đồng nghiệp, thay vì tác động đến hộp sọ thời kỳ trưởng thành, người Patagonia cổ tìm cách kéo dài hộp sọ ở đầu thời thơ ấu, khi xương vẫn đủ mềm để điều chỉnh hình dáng.</p>\r\n<p class=\"Normal\">\r\n	Để làm biến dạng dáng hộp sọ của đứa trẻ, người cha hoặc mẹ buộc chặt đầu con bằng những băng vải. Cách này khiến hộp sọ phát triển hướng lên trên theo hình trụ. Tuy nhiên, nếu quấn vải quá chặt, đứa trẻ có thể chết. Một cách làm khác giúp tạo ra hộp sọ phẳng là dùng ván gỗ cứng để ép chặt phần trước và sau đầu trẻ trong thời gian dài.</p>\r\n<p class=\"Normal\">\r\n	Alfonso-Durruty cho rằng, người Patagonia cổ không làm biến dạng hộp sọ để thể hiện đặc trưng cộng đồng, mà nhằm mở rộng lãnh thổ và tiếp cận những nguồn tài nguyên mới. Bà trình bày nhận định này trên Tạp chí Nhân chủng học Tự nhiên của Mỹ số tháng 9.</p>\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width: 100%;\"><tbody><tr><td>\r\n				<img alt=\"tuc-keo-dai-hop-so-cua-bo-toc-nam-my-1\" data-natural-width=\"500\" src=\"http://m.f29.img.vnecdn.net/2015/11/23/VNE-Skull-1-8385-1448251491.jpg\" data-width=\"500\" data-pwidth=\"470.40625\" style=\"width: 100%;\"></td>\r\n		</tr><tr><td>\r\n				<p class=\"Image\">\r\n					Làm dài hộp sọ là cách người Patagonia cổ đại xây dựng sự gắn bó giữa các bộ tộc. Ảnh:&nbsp;<em>Didier Descouens.</em></p>\r\n			</td>\r\n		</tr></tbody></table><p class=\"Normal\">\r\n	Người Patagonia cổ sống ở những khu vực với nguồn tài nguyên không đồng đều. \"Trong trường hợp đó, giải pháp hợp lý nhất là mở rộng mạng lưới để bộ tộc có thể tiếp cận những tài nguyên khác nhau dọc theo lãnh thổ\", Alfonso-Durruty cho biết.</p>\r\n<p class=\"Normal\">\r\n	Cách mở rộng tốt nhất là kết bạn với những bộ tộc khác. Do thay đổi hình dáng hộp sọ không dễ dàng, những người tiến hành quá trình này lập tức thể hiện họ là một bộ tộc đáng tin cậy. \"Nhờ đó, kéo dài hộp sọ giúp họ thông báo quan hệ với cá nhân ở những vùng miền khác\", Alfonso-Durruty nói.</p>\r\n<p class=\"Normal\">\r\n	Tập tục này thậm chí còn giúp họ mở rộng bộ tộc. Cách đây 2.000 năm, khu vực từng trải qua sự tăng vọt về dân số. Thông qua phân tích chế độ ăn của người Patagonia cổ đại, nhóm nghiên cứu phát hiện họ ăn cả thức ăn có trên mặt đất lẫn thức ăn ở biển, cho thấy họ đã sống ở nhiều vùng khác nhau.</p>\r\n<p align=\"right\" class=\"Normal\">\r\n	<strong>Phương Hoa</strong></p>', '3', null, '', '', null, '1448266590', '1448266590', null, '0', '');
INSERT INTO `tbl_post` VALUES ('10', 'hgjgh', 'hgjgh', 'fghjfg', 'hjfghj', '3', null, 'fghj', 'ghj', null, '1448269725', '1448269725', null, '0', '');
INSERT INTO `tbl_post` VALUES ('11', 'hjghj', 'hjghj', '', '<p>ghjfhj fj ghj</p>', '24', 'Nissan-Juke-Model-HIRES-17-7832-1442791311.jpg', '', '', '1', '1450940424', '1450890000', '1450943844', '0', '');

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
