/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : springdb

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 25/04/2021 16:02:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provinceid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, '石家庄市', 1);
INSERT INTO `city` VALUES (2, '秦皇岛', 1);
INSERT INTO `city` VALUES (3, '保定市', 1);
INSERT INTO `city` VALUES (4, '张家口', 1);
INSERT INTO `city` VALUES (5, '南昌市', 9);
INSERT INTO `city` VALUES (6, '九江市', 9);
INSERT INTO `city` VALUES (7, '宜春市', 9);
INSERT INTO `city` VALUES (8, '福州市', 8);
INSERT INTO `city` VALUES (9, '厦门市', 8);
INSERT INTO `city` VALUES (10, '泉州市', 8);
INSERT INTO `city` VALUES (11, '龙岩市', 8);
INSERT INTO `city` VALUES (12, '太原', 2);
INSERT INTO `city` VALUES (13, '大同', 2);
INSERT INTO `city` VALUES (14, '呼和浩特', 3);
INSERT INTO `city` VALUES (15, '包头', 3);
INSERT INTO `city` VALUES (16, '呼伦贝尔', 3);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `collectionId` int(0) NOT NULL AUTO_INCREMENT,
  `movieId` int(0) NOT NULL,
  `studentId` int(0) NOT NULL,
  PRIMARY KEY (`collectionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 4, 1);
INSERT INTO `collection` VALUES (4, 4, 2);
INSERT INTO `collection` VALUES (6, 4, 3);
INSERT INTO `collection` VALUES (11, 3, 5);
INSERT INTO `collection` VALUES (20, 9, 5);
INSERT INTO `collection` VALUES (21, 4, 5);
INSERT INTO `collection` VALUES (23, 1, 5);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentId` int(0) NOT NULL AUTO_INCREMENT,
  `movieId` int(0) NOT NULL,
  `studentId` int(0) NOT NULL,
  `commentTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commentContent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 4, 5, '2021-4-15 20:30:43', '123456798');
INSERT INTO `comment` VALUES (7, 4, 5, '2021-4-15 20:30:56', '123456798');
INSERT INTO `comment` VALUES (8, 4, 5, '2021-4-15 20:31:42', '123456798');
INSERT INTO `comment` VALUES (9, 4, 5, '2021-4-15 20:31:49', '4564564');
INSERT INTO `comment` VALUES (10, 4, 1, '2021-4-15 20:32:31', '6546579865323');
INSERT INTO `comment` VALUES (11, 4, 1, '2021-4-15 20:37:17', '123');
INSERT INTO `comment` VALUES (12, 4, 5, '2021-4-15 20:39:38', '123456');
INSERT INTO `comment` VALUES (13, 4, 5, '2021-4-15 20:44:5', '465564');
INSERT INTO `comment` VALUES (14, 4, 5, '2021-4-15 20:44:5', '465564');
INSERT INTO `comment` VALUES (15, 4, 5, '2021-4-15 20:44:5', '465564');
INSERT INTO `comment` VALUES (16, 4, 5, '2021-4-15 20:47:2', '465564');
INSERT INTO `comment` VALUES (17, 4, 5, '2021-4-16 16:5:18', '666');
INSERT INTO `comment` VALUES (18, 9, 5, '2021-4-16 16:13:18', '66666');
INSERT INTO `comment` VALUES (19, 3, 5, '2021-4-18 1:2:25', '12616');
INSERT INTO `comment` VALUES (20, 9, 5, '2021-4-18 1:12:20', '132');
INSERT INTO `comment` VALUES (21, 4, 5, '2021-4-18 1:14:5', '123');
INSERT INTO `comment` VALUES (22, 4, 5, '2021-4-25 14:11:27', '132465');
INSERT INTO `comment` VALUES (23, 4, 5, '2021-4-25 14:11:55', '123456');
INSERT INTO `comment` VALUES (24, 4, 5, '2021-4-25 14:12:3', '123456');
INSERT INTO `comment` VALUES (25, 1, 5, '2021-4-25 14:23:16', '123');
INSERT INTO `comment` VALUES (26, 1, 5, '2021-4-25 14:23:24', '666');
INSERT INTO `comment` VALUES (27, 4, 5, '2021-4-25 15:54:20', '3333');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `movieId` int(0) NOT NULL,
  `movieName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `movieOtherName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `movieTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moviePicture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `movieType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isHot` double(255, 0) NULL DEFAULT NULL,
  `isNew` double(255, 0) NULL DEFAULT NULL,
  `movieCountry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `movieDirector` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `movieLength` int(0) NULL DEFAULT NULL,
  `movieIntroduce` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`movieId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '刺杀小说家', 'Assassin in Red', '2021-02-12', 'images/1.jpg', '动作', 1, 1, '中国', '路阳', 130, '异世界皇都，天神赤发鬼残暴统治，滥杀无辜。少年空文因被赤发鬼追杀，决定奋起反击。在黑甲（郭京飞 饰）的指引下，踏上了凡人弑神之路。这是小说家路空文（董子健 饰）笔下的奇幻世界。没想到小说的进程，竟然影响着现实世界。这时一名男子（雷佳音 饰）接下了刺杀他的任务……');
INSERT INTO `movie` VALUES (2, '寻龙传说', 'Raya and The Last Dragon', '2021-03-05', 'images/2.jpg', '动画', 1, 1, '美国', '唐·霍尔 ', 108, '很久以前，在充满奇幻色彩的龙佑之邦，人类和龙和谐地生活在一起。但当一股邪恶的力量袭来，龙牺牲了自己来拯救人类。500年后，同样的邪恶力量卷土重来，只有一个孤独的战士拉雅（凯莉·玛丽·陈 配音）承担重任，追踪传说中的最后一条龙，以修复这块破碎的土地，团结分裂的人民。在她的旅程中，她也会逐渐了解到拯救世界不仅仅需要一条龙，还需要信任和团队合作。');
INSERT INTO `movie` VALUES (3, '你好，李焕英', 'Hi, Mom', '2021-02-12', 'images/3.jpg', '剧情', 1, 1, '中国', '贾玲', 128, '2001年的某一天，刚刚考上大学的贾晓玲（贾玲 饰）经历了人生中的一次大起大落。一心想要成为母亲骄傲的她却因母亲突遭严重意外，而悲痛万分。在贾晓玲情绪崩溃的状态下，竟意外的回到了1981年，并与年轻的母亲李焕英（张小斐 饰）相遇，二人形影不离，宛如闺蜜。与此同时，也结识了一群天真善良的好朋友。晓玲以为来到了这片“广阔天地”，她可以凭借自己超前的思维，让母亲“大有作为”，但结果却让晓玲感到意外......');
INSERT INTO `movie` VALUES (4, '哥斯拉大战金刚', 'Godzilla vs Kong', '2021-03-26', 'images/4.jpg', '动作', 1, 20, '美国', '亚当·温加德', 113, '这两位宛如神衹一般强大的对手于一场壮观的战争中相遇，彼时世界命运正悬于一线。为了找到真正的家园，金刚与他的保护者们踏上了一次艰难的旅程。与他们一道前行的还有一个年轻的孤儿女孩——吉雅，这个女孩与金刚之间存在着一种独特而强大的紧密联系。但意想不到的是，他们在前行的航道上与愤怒的哥斯拉狭路相逢，也由此在全球引起了一系列破坏。一股无形的力量造成了这两只巨兽之间的巨大冲突，深藏在地心深处的奥秘也由此揭开。');
INSERT INTO `movie` VALUES (5, '别对映像研出手！', '映像研には手を出すな！', '2020-09-25', 'images/5.jpg', '喜剧', 1, 1, '日本', '英勉', 120, '高中1年级学生浅草绿（斋藤飞鸟 饰），是强调“设定即生命”的动画迷。\r\n　　在素描本上描绘积累各种各样的想法，却因不能一个人行动做事而无法迈出走向动画制作的一步。对于浅草这种才能，拥有制片人气质的金森沙耶加（梅泽美波 饰）很快注意到了。同时，了解到同学兼新星读者模特的水崎燕（山下美月 饰），其实上希望成为动画家，3人为了展现脑内“最强的世界”而设立了映像研。\r\n　　电影版『别对映像研出手！』2020年初夏上映');
INSERT INTO `movie` VALUES (6, '命运之夜——天之杯Ⅲ：春之歌 劇場版 ', 'Fate/stay night [Heaven\'s Feel] III. spring song', '2020-08-15', 'images/6.jpg', '动画', 12, 1, '日本', '须藤友德', 122, '本片改编自TYPE-MOON出品的文字冒险类游戏《Fate/stay night》，是该游戏的Heaven\'s Feel路线，简称“HF”或“樱线”，是该系列作品动画剧场版全三部作品中的最终章。\r\n　　在剧场版作品第二章黑化之后的樱吸收了众多Servant的灵魂后，被世间 所有的恶控制，成为黑色圣杯的化身。\r\n　　最终，得知一切的士郎放弃了成为正义的伙伴，选择了保护樱...');
INSERT INTO `movie` VALUES (7, '信条', 'Tenet', '2020-09-04', 'images/7.jpg', '剧情', 13, 1, '美国', '克里斯托弗·诺兰', 150, '世界存亡危在旦夕，“信条”一词是唯一的线索与武器。主人公穿梭于全球各地，开展特工活动，力求揭示“信条”之谜，并完成一项超越了真实时间的神秘任务。这项任务并非时间之旅，而是【时空逆转】。');
INSERT INTO `movie` VALUES (8, '鬼灭之刃 剧场版 无限列车篇', '劇場版「鬼滅の刃」無限列車編', '2020-10-16', 'images/8.jpg', '动画', 15, 1, '日本', '外崎春雄', 117, '该片基于吾峠呼世所著漫画《鬼灭之刃》创作而成，是2019年播出的TV动画的续篇，讲述灶门炭治郎和炼狱杏寿郎与下弦之壹魇梦作战的故事。');
INSERT INTO `movie` VALUES (9, '夺冠', 'Leap', '2020-09-25', 'images/9.jpg', '剧情', 20, 1, '中国', '陈可辛', 135, '2008年8月15日，北京奥运会女排比赛，中国VS美国。戴着金丝框眼镜的郎平（巩俐 饰）坐在美国队教练席上，大气沉稳，目光如电；中国队教练（黄渤 饰）站在场边，全神贯注，面带笑容。中国队教练望向郎平，目光充满深意，不断经过的人影遮蔽了他的视线，中国女排三十余年的沉浮图景被缓缓打开……');
INSERT INTO `movie` VALUES (10, '八佰', 'The Eight Hundred', '2020-08-21', 'images/10.jpg', '剧情', 1, 1, '中国', '管虎', 147, '937年淞沪会战的最后一役，“八百壮士”奉命坚守上海四行仓库，以少敌多顽强抵抗四天四夜。电影《八佰》由管虎导演，是亚洲首部全片使用IMAX摄影机拍摄的商业电影，将于2020年8月21日全国影院上映。');
INSERT INTO `movie` VALUES (11, '我是大哥大 电影版 ', '今日から俺は！！劇場版 ', '2020-07-17', 'images/11.jpg', '喜剧', 1, 1, '日本', '福田雄一', 114, '三桥贵志以转校为契机，决定在新学校“嚣张”一把，从此做个不良少年。为了能在同学中获得存在感，他还特地去发廊弄了一头金色卷发。而和他转到同一所学校的伊藤也有同样的想法。在开学第一天，伊藤和三桥就发现了彼此的秘密，也因此结成盟友。三桥的信条是“无论用多么卑鄙的手段，只要能赢就行”，所以，在和别人打架的时候只要能玩阴的就绝对不正面对抗，但他真正的实力也不容小觑。伊藤为人处世相对正经，有时候甚至会慢半拍，也因此常常被三桥利用且被蒙在鼓里，而在打架方面，他战斗力超群，有着不服输的信念。两个人一起挑战校内校外的不良少年，引发了一连串爆笑事件。');
INSERT INTO `movie` VALUES (12, '姜子牙', 'Legend of Deification', '2020-10-01', 'images/12.jpg', '动画', 1, 1, '中国', '程腾 ', 110, '故事发生于封神大战后。姜子牙率领众神伐纣，赢得封神大战胜利，以为可以唤回世间安宁。然而，一切并未结束。一个偶然，姜子牙发现了原来“封神大战”之下酝酿着更大的阴谋。姜子牙开始踏上探寻真相的旅途......');
INSERT INTO `movie` VALUES (13, '飙速宅男', '弱虫ペダル', '2020-08-14', 'images/13.jpg', '运动', 1, 1, '日本', '三木康一郎', 113, '影片改编自渡边航所著同名漫画，讲述主人公小野田坂道在机缘巧合之下加入学校的自行车社，在自行车竞速的世界之中逐渐发挥自己潜能的故事');
INSERT INTO `movie` VALUES (14, '釜山行2：半岛', '부산행2-반도', '2020-07-15', 'images/14.jpg', '惊悚', 1, 1, '韩国', '延尚昊', 115, '上集列车驶往釜山后，丧尸病毒瞬间全国爆发，4年后的韩国尸毒遍野，被全球孤立，沦为死城。所馀无几的生还者踏上最后一艘难民船，离开被世人遗弃的朝鲜半岛。退伍军人正锡(姜栋元 饰)和家人有幸登上难民船，但一上船便发现丧尸潜伏，幸得香港收容，这批韩国人才得以上岸，以「半岛难民」身分在香港重新生活。但正锡受不住金钱诱惑，加入了一个回国窃取巨额美金的行动。他和队友重返韩国，竟然发现仍有一班未受尸毒感染的人在挣扎求存，正锡决定带这班倖存者逃生，他们最后能否成功逃出尸杀半岛？');
INSERT INTO `movie` VALUES (15, '猫和老鼠', 'Tom and Jerry', '2021-02-26', 'images/15.jpg', '喜剧', 10, 1, '美国', '蒂姆·斯托瑞', 101, '　“超杀女”科洛·莫瑞兹饰演的少女凯拉刚刚入职豪华大酒店，就碰上了叫人头疼的难题——杰瑞竟然想在酒店里定居，令酒店最近承接的世纪婚礼岌岌可危。于是，汤姆被凯拉雇佣成为酒店员工，目的是赶走杰瑞，这对欢喜冤家就此展开了一场你追我赶的爆笑喜剧。');
INSERT INTO `movie` VALUES (16, '侍神令', 'The YinYang Master', '2021-02-12', 'images/16.jpg', '奇幻', 1, 1, '中国', '李蔚然', 120, '穿行于人妖两界的阴阳师晴明（陈坤 饰），因与一众妖怪缔结契约，酿成大祸，深陷危机。而与此同时，妖皇势力正卷土重来，一场恶战一触即发。在风云突变、局势动荡的危急时刻，晴明恍然发现，自己人妖混血的身份，竟是这一切灾祸的关键......');
INSERT INTO `movie` VALUES (17, '名侦探柯南：绯色的不在场证明', '名探偵コナン 緋色の不在証明', '2021-02-11', 'images/17.jpg', '动画', 1, 1, '日本', '山本泰一郎', 94, '真实身份谜团重重、每个人都有着复杂背景的危险一家——赤井家族。 在来叶崖假死的FBI探员赤井秀一，《名侦探柯南 绯色的不在证明》以他为中心展开，揭开了赤井秀一、世良真纯、羽田秀吉、玛丽等人的个性，以及他们几人之间的关系。 故事的高潮则在讲述赤井秀一华丽复活的“绯色”系列 。在某个事件中，赤井秀一的宿敌、代号为波本的安室透从FBI那打听到了“线索”。之后，安室透便深入调查赤井秀一与冲矢昴的关系。在经过了一系列的高智商攻防战后，赤井秀一的回归给所有人带来了冲击。 而在这一连串的“不在场证明剧”的真相背后，都有着柯南的身影—— 《名侦探柯南》系列中不可缺少的赤井一家，该总集篇将彻底解剖他们至今为止的行动轨迹、以及他们与柯南的关系。');
INSERT INTO `movie` VALUES (18, '送你一朵小红花', 'A Little Red Flower', '2020-12-31', 'images/18.jpg', '剧情', 1, 1, '中国', '韩延', 128, '两个抗癌家庭，两组生活轨迹。影片讲述了一个温情的现实故事，思考和直面了每一个普通人都会面临的终极问题——想象死亡随时可能到来，我们唯一要做的就是爱和珍惜。');
INSERT INTO `movie` VALUES (19, '陈翔六点半之民间高手', 'Fight For Love', '2020-12-30', 'images/19.jpg', '喜剧', 1, 1, '中国', '陈翔', 117, '影片讲述了三十年前，乒坛老将杨国强（妹大爷 饰），为照顾孙儿杨双喜（蘑菇头饰），放弃了人生最重要比赛。如今杨国强患老年痴呆，杨双喜得知当年真相，感动不已。为了圆满爷爷的人生，他游说几个身怀绝技的民间乒乓球高手，带着爷爷踏上了夺冠征程......');
INSERT INTO `movie` VALUES (20, '哆啦A梦：伴我同行2', 'STAND BY ME ドラえもん2', '2020-11-20', 'images/20.jpg', '动画', 1, 1, '日本', '八木龙一', 96, 'STAND BY ME 哆啦A梦2」官方宣布将于明年8月7日公映。\r\n　　依然八木龙一与山崎贵共同执导，故事将以原作第4卷“奶奶的回忆”为基础进行制作。');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份名称',
  `jiancheng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `shenghui` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, '河北', '冀', '石家庄');
INSERT INTO `province` VALUES (2, '山西', '晋', '太原市');
INSERT INTO `province` VALUES (3, '内蒙古', '蒙', '呼和浩特市	');
INSERT INTO `province` VALUES (4, '辽宁', '辽', '沈阳');
INSERT INTO `province` VALUES (5, '江苏', '苏', '南京');
INSERT INTO `province` VALUES (6, '浙江', '浙', '杭州');
INSERT INTO `province` VALUES (7, '安徽', '皖', '合肥');
INSERT INTO `province` VALUES (8, '福建', '闽', '福州');
INSERT INTO `province` VALUES (9, '江西', '赣', '南昌');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(0) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int(0) NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '123456', 'aaa', 22, '男', '493399126@qq.com');
INSERT INTO `student` VALUES (2, '123456', 'bbb', 21, '女', '123456@qq.com');
INSERT INTO `student` VALUES (3, '123456', 'ccc', 111, '男', '123456@qq.com');
INSERT INTO `student` VALUES (4, '123456', 'ddd', 22, '男', '493399126@qq.com');
INSERT INTO `student` VALUES (5, '123456', 'CharlesJodyLee', 22, '男', '493399126@qq.com');
INSERT INTO `student` VALUES (6, '123456', '张三', 22, '男', '123456@qq.com');
INSERT INTO `student` VALUES (7, '123456', 'lisi', 56, '男', '493399126@qq.com');
INSERT INTO `student` VALUES (8, '123456', 'wangwu', 15, '男', '123456@qq.com');
INSERT INTO `student` VALUES (99999, '123456789', 'root', 999, '嬲', 'root@root.com');

SET FOREIGN_KEY_CHECKS = 1;
