-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: star_rail
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `all_light_cones`
--

DROP TABLE IF EXISTS `all_light_cones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_light_cones` (
  `name` varchar(50) NOT NULL,
  `level` int NOT NULL,
  `path` varchar(20) NOT NULL,
  `story` varchar(400) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_light_cones`
--

LOCK TABLES `all_light_cones` WRITE;
/*!40000 ALTER TABLE `all_light_cones` DISABLE KEYS */;
INSERT INTO `all_light_cones` VALUES ('我将，巡征追猎',5,'巡猎','\n「可悲可笑的奴隶们……」\n浩荡的丰饶民军队压境而来，狼毒如洪水般涌向青丘军，试图唤起军士深埋于心中的恐惧，化作种种可怖的幻象，使他们垂下武器，犹豫不前。\n但阵线犹如铜墙铁壁，不为步离人轻蔑的话音所动，一个身影缓步走出。\n她缓缓活动着身体，无形的煞气冲击下，旗帜猎猎作响。\n「将军，是将军出现了……」\n「飞霄将军……」\n「『天击』将军！」\n细微的呼唤汇聚起来，化作震天的战吼。\n\n「翾翔不坠，万载常胜！」\n她站在那里，一个人，就像一支军队。'),('星海巡航',5,'巡猎','\n来往于星海之间，\n祂的速度有如虹霓闪光的一瞬。\n围追不朽孽物，\n揽寻幻宝解药，\n寻求解脱之途。\n祂的航程将犹如永不被打破的誓言般，\n永无尽头。'),('胜利只在朝夕间',4,'记忆','\n泰坦眷属磅礴的战吼席卷战场，两道电光般的身影在其中拼杀出一条血路。\n\n「我一个人便能把它们都收拾了。」\n战士每一次出拳，蔓延的血刺贯穿敌人的身体。\n「蛮力罢了，看我的剑！」\n银白的剑甩出漂亮的弧度，怪物如落叶飘零。\n「比比速度么？」\n两人同时朝对面攻去——\n哀嚎声传来，那背后偷袭的怪物即刻殒命。\n两道声音撞在一起——\n「是我给了它最后一击！」'),('舞！舞！舞！',4,'同协','\n「为什么虎克不能像克拉拉一样跳舞转圈圈呢…」\n她握紧拳头，嘟囔起嘴，圆乎乎的面颊被毛毡帽烘得红润。\n「史瓦罗先生，可以帮帮虎克么？」\n不苟言笑的大机器人，一言不发地伸出机械手。\n\n「要、要转晕啦！！可恶…快放我下来！」'),('行于流逝的岸',5,'虚无','\n流淌于「有」与「无」的狭间，冰冷的潮水永世冲刷着两岸，将一切带向最终的归宿。\n\n溺水者于此间呼救，哀歌、欢乐、甜蜜、痛苦倒影其中…她无法经受，却可体会——\n在抵达尽头之前，仍有许多路要走，许多声音要倾听，许多事情可去改变。\n\n她伸出手，将溺水者从虚无的诱惑中救出，一个又一个幻影在她身后破碎。\n她继续行着，在这无垠的世间，为了一个不存在的终点。\n\n——而这里永远下着雨。'),('让告别，更美一些',5,'记忆','\n又是一场离别的仪式。\n少女踏着破碎的月光，于河畔编织告别的花环。\n\n古老的哀歌凝冻于寒冷的空气，静谧的河流注入遥远彼方的花乡。\n染血的书卷，生锈的长剑，绣着诗文的手帕…她接过他们的遗物，和他们一生的故事。\n\n「我的眼睛如同透镜，永远思念着星空。」\n那是献给早逝学者的墓志铭。\n「对人生，对死亡，骑士只给予冷然的一瞥。」\n那是无名战士坚持了一生的箴言。\n「生命只是闪烁着光芒的死亡。」\n那是追求永恒的诗人，以生命写就的最后一句。\n……\n\n「每一朵花，都曾骄傲地盛放过……」\n伴着河流的呜咽，她向逝者献上诗篇、花环与纪念——\n「如果枯萎不可避免，至少让我们的告别…更美一些。」'),('记一位星神的陨落',5,'毁灭','\n从一道光开始。\n祂们坠落，陨灭的威胁居高临下。\n祂们不得不停止自我复制，争先恐后拥抱彼此，\n试图用繁殖的权利为代价，换取生存的可能。\n祂们携手，从未如此团结\n——但命途戛然而止，\n祂们趋向真正的死亡。'),('记忆中的模样',4,'同协','\n官邸的桌上摆放着一张老相片，在远远的一角。\n偶尔目光落在上面，她总会不自觉地错开视线。\n记忆中的模样虽已远去，但今天的梦仍自萦绕。'),('记忆永不落幕',5,'记忆','\n不论繁华的、荒凉的、短暂的、漫长的…每一颗星球，每一个瞬间皆在发生无数的事件。\n那凝结的历史一触便融化于手中，化作泪水自世界的眼眸流淌而下——\n\n有人说，那是多么沉重的泪水，凝聚的岁月足以令永恒褪色。\n有人说，那是多么美妙的故事，悲哀澄澈，欢悦明静，其间不夹杂一丝虚伪。\n\n银河静默流淌，祂不语，只是凝望——\n凝望着，等待着它们成为「记忆」。'),('银河铁道之夜',5,'智识','\n若是担心脚下，只需再度抬头凝望，\n当繁星温柔地注视，心已乘风而上。\n每一个念想，每一声低语，\n都化作生命中的承载，再不会失去。'),('长路终有归途',5,'虚无','\n「她…是谁？」\n少女轻抚着陌生的自己。\n\n她想起了那日的火如何将她吞噬，珠宝折扇化作飞灰。\n\n自己曾走在漫长的道路上，寻找前方的光。\n外面的声音在呼唤她，领她前行，带着她穿越重重黑暗。\n内心的声音在提醒她，那些未完成的誓言，要赴的约定，未实现的梦，还在等着她——\n\n它们未曾消弭于火中，反而于火中愈发闪耀生辉。\n\n「那就是我……」\n\n她站在终点，不再回头留恋——\n「原来的我，亦是全新的我。」');
/*!40000 ALTER TABLE `all_light_cones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_relics`
--

DROP TABLE IF EXISTS `all_relics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_relics` (
  `name` varchar(15) NOT NULL,
  `effect1` varchar(100) NOT NULL,
  `effect2` varchar(200) NOT NULL,
  `head_name` varchar(15) NOT NULL,
  `hand_name` varchar(15) NOT NULL,
  `trunk_name` varchar(15) NOT NULL,
  `feet_name` varchar(15) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_relics`
--

LOCK TABLES `all_relics` WRITE;
/*!40000 ALTER TABLE `all_relics` DISABLE KEYS */;
INSERT INTO `all_relics` VALUES ('哀歌覆国的诗人','量子属性伤害提高 10% 。','使装备者的速度降低 8% 。进入战斗前，若装备者的速度小于 110 / 95 ，使装备者的暴击率提高 20% / 32% 。该效果同时对装备者的忆灵生效。','诗人的莳萝花冠','诗人的贵金手镯','诗人的缀星裙摆','诗人的钉银之履'),('死水深潜的先驱','对受负面状态影响的敌人造成的伤害提高12%。','暴击率提高4%，装备者对陷入不少于2/3个负面效果的敌方目标造成的暴击伤害提高8%/12%。装备者对敌方目标施加负面效果后，上述效果提高100%，持续1回合。','先驱的绝热围壳','先驱的虚极罗盘','先驱的密合铅衣','先驱的泊星桩锚'),('流行追迹的怪盗','击破特攻提高16%。','使装备者的击破特攻提高16%。当装备者击破敌方目标弱点后，恢复3点能量。','怪盗的千人假面','怪盗的绘纹手套','怪盗的纤钢爪钩','怪盗的流星快靴'),('荡除蠹灾的铁骑','击破特攻提高 16% 。','当装备者的击破特攻大于等于 150% 时，对敌方目标造成的击破伤害无视其 10% 的防御力。当装备者的击破特攻大于等于 250% 时，对敌方目标造成的超击破伤害额外无视其 15% 的防御力。','铁骑的索敌战盔','铁骑的摧坚铁腕','铁骑的银影装甲','铁骑的行空护胫'),('识海迷坠的学者','暴击率 提高 8% 。','战技和终结技造成的伤害提高 20% ，施放终结技后，下一次施放战技时造成的伤害额外提高 25% 。','学者的银边视镜','学者的辅助指节','学者的粗纺外套','学者的绒皮雪靴'),('重循苦旅的司铎','速度提高6%。','对我方单体目标施放战技或终结技时，使技能目标的暴击伤害提高18%，持续2回合，该效果最多叠加2次。','司铎的律音耳坠','司铎的授邀手套','司铎的圣职礼服','司铎的苦旅短靴'),('风举云飞的勇烈','攻击力提高12%。','使装备者暴击率提高6%，装备者施放追加攻击时，使终结技造成的伤害提高36%，该效果持续1回合','勇烈的玄枵面甲','勇烈的钩爪腕甲','勇烈的飞翎瓷甲','勇烈的逐猎腿甲'),('骇域漫游的信使','速度提高6%。','当装备者对我方目标施放终结技时，我方全体速度提高12%，持续1回合，该效果无法叠加。','信使的全息目镜','信使的百变义手','信使的密信挎包','信使的酷跑板鞋');
/*!40000 ALTER TABLE `all_relics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_roles`
--

DROP TABLE IF EXISTS `all_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_roles` (
  `name` varchar(15) NOT NULL,
  `attribute` varchar(5) NOT NULL,
  `path` varchar(20) NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_roles`
--

LOCK TABLES `all_roles` WRITE;
/*!40000 ALTER TABLE `all_roles` DISABLE KEYS */;
INSERT INTO `all_roles` VALUES ('大黑塔','冰','智识',5),('忘归人','火','虚无',5),('流萤','火','毁灭',5),('缇宝','量子','同协',5),('记忆主','冰','记忆',5),('遐蝶','量子','记忆',5),('阮梅','冰','同协',5),('风堇','风','记忆',5),('飞霄','风','巡猎人',5),('黄泉','雷','虚无',5);
/*!40000 ALTER TABLE `all_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `light_cones`
--

DROP TABLE IF EXISTS `light_cones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `light_cones` (
  `name` varchar(50) NOT NULL,
  `star_rating` int NOT NULL,
  `Paths` varchar(20) NOT NULL,
  `owner_id` int NOT NULL,
  `user` varchar(15) NOT NULL,
  PRIMARY KEY (`name`,`owner_id`,`user`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `player_uid_idx` (`owner_id`),
  KEY `uid_idx` (`owner_id`),
  CONSTRAINT `name` FOREIGN KEY (`name`) REFERENCES `all_light_cones` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`owner_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `light_cones`
--

LOCK TABLES `light_cones` WRITE;
/*!40000 ALTER TABLE `light_cones` DISABLE KEYS */;
INSERT INTO `light_cones` VALUES ('我将，巡征追猎',5,'巡猎',129099623,'飞霄'),('胜利只在朝夕间',4,'记忆',129099623,'无'),('行于流逝的岸',5,'虚无',129099623,'黄泉'),('让告别，更美一些',5,'记忆',129099623,'遐蝶'),('记一位星神的陨落',5,'毁灭',129099623,'流萤'),('记忆中的模样',4,'同协',129099623,'阮梅'),('记忆永不落幕',5,'记忆',129099623,'风堇'),('银河铁道之夜',5,'智识',129099623,'大黑塔'),('长路终有归途',5,'虚无',129099623,'忘归人');
/*!40000 ALTER TABLE `light_cones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `light_cones_view`
--

DROP TABLE IF EXISTS `light_cones_view`;
/*!50001 DROP VIEW IF EXISTS `light_cones_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `light_cones_view` AS SELECT 
 1 AS `owner_id`,
 1 AS `name`,
 1 AS `star_rating`,
 1 AS `Paths`,
 1 AS `user`,
 1 AS `light_cone_story`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `my_relics`
--

DROP TABLE IF EXISTS `my_relics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_relics` (
  `owner_uid` int NOT NULL,
  `name` varchar(15) NOT NULL,
  `id` int NOT NULL,
  `body` varchar(10) NOT NULL,
  `main_entry` varchar(20) NOT NULL,
  `secondary_entry1` varchar(20) NOT NULL,
  `secondary_entry2` varchar(20) NOT NULL,
  `secondary_entry3` varchar(20) NOT NULL,
  `secondary_entry4` varchar(20) NOT NULL,
  `package` varchar(15) NOT NULL,
  `user` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`owner_uid`,`name`,`id`),
  KEY `package_idx` (`package`),
  CONSTRAINT `package` FOREIGN KEY (`package`) REFERENCES `all_relics` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_relics`
--

LOCK TABLES `my_relics` WRITE;
/*!40000 ALTER TABLE `my_relics` DISABLE KEYS */;
INSERT INTO `my_relics` VALUES (129099623,'信使的密信挎包',1,'躯干','生命值：  43.2%','防御力：  38','攻击力：  11.2%','防御力：  4.3%','速度：  4','骇域漫游的信使','记忆主'),(129099623,'信使的密信挎包',2,'躯干','生命值：  43.2%','防御力：  38','攻击力：  4.3%','速度：  9','效果命中：  4.3%','骇域漫游的信使','阮梅'),(129099623,'信使的密信挎包',3,'躯干','治疗量加成：  34.5%','生命值：  7.7%','速度：  6','暴击伤害：  10.3%','击破特攻：  5.8%','骇域漫游的信使','风堇'),(129099623,'信使的百变义手',1,'手部','攻击力：  352','生命值：  38','防御力：  16','攻击力：  12.5%','速度：  7','骇域漫游的信使','风堇'),(129099623,'信使的酷跑板鞋',1,'脚部','速度：  25','攻击力：  38','生命值：  3.8%','暴击伤害：  11.6%','击破特攻：  16.8%','骇域漫游的信使','记忆主'),(129099623,'信使的酷跑板鞋',2,'脚部','速度：  25','生命值：  71','生命值：  7.7%','防御力：  5.4%','击破特攻：  16.2%','骇域漫游的信使','阮梅'),(129099623,'先驱的密合铅衣',1,'躯干','暴击率：  32.4%','攻击力：  40','攻击力：  3.4%','暴击伤害：  19.4%','效果抵抗：  8.2%','死水深潜的先驱','黄泉'),(129099623,'先驱的泊星桩锚',1,'脚部','攻击力：  43.2%','生命值：  76','生命值：  4.3%','暴击伤害：  23.9%','效果命中：  6.9%','死水深潜的先驱','黄泉'),(129099623,'先驱的泊星桩锚',2,'脚部','生命值：  43.2%','防御力：  8.6%','防御力：  76','攻击力：  56','暴击率：  7.0%','死水深潜的先驱',NULL),(129099623,'先驱的绝热围壳',1,'头部','生命值：  705','攻击力：  38','攻击力：  7.3%','暴击伤害：  15.5%','效果命中：  3.4%','死水深潜的先驱','黄泉'),(129099623,'先驱的虚极罗盘',1,'手部','攻击力：  352','攻击力：  4.3%','暴击率：  9.3%','暴击伤害：  18.1%','效果命中：  7.7%','死水深潜的先驱','黄泉'),(129099623,'勇烈的玄枵面甲',1,'头部','生命值：  705','攻击力：  35','攻击力：  11.2%','暴击伤害：  11.6%','效果命中：  4.3%','风举云飞的勇烈','飞霄'),(129099623,'勇烈的逐猎腿甲',1,'脚部','攻击力：  43.2%','生命值：  84','暴击率：  7.7%','暴击伤害：  12.3%','击破特攻：  6.4%','风举云飞的勇烈','飞霄'),(129099623,'勇烈的逐猎腿甲',2,'脚部','防御力：  54%','效果抵抗：  12.9%','生命值：  112','暴击率：  5.1%','速度：  6','风举云飞的勇烈',NULL),(129099623,'勇烈的逐猎腿甲',3,'脚部','防御力：  54%','击破特攻：  18.3%','暴击伤害：  10.3%','攻击力：  9.3%','效果命中：  6.9%','风举云飞的勇烈',NULL),(129099623,'勇烈的钩爪腕甲',1,'手部','攻击力：  352','防御力：  57','速度：  4','暴击率：  2.9%','暴击伤害：  18.7%','风举云飞的勇烈','飞霄'),(129099623,'勇烈的飞翎瓷甲',1,'躯干','暴击率：  32.4%','生命值：  71','攻击力：  40','速度：  4','暴击伤害：  11.6%','风举云飞的勇烈','飞霄'),(129099623,'司铎的律音耳坠',1,'头部','生命值：  706','速度：  4','暴击伤害：  11.0%','效果抵抗：  8.2%','击破特攻：  11.6%','重循苦旅的司铎','记忆主'),(129099623,'司铎的律音耳坠',2,'头部','生命值：  705','防御力：  14.0%','速度：  7','暴击率：  2.9%','暴击伤害：  5.1%','重循苦旅的司铎','风堇'),(129099623,'司铎的授邀手套',1,'手部','攻击力：  352','防御力：  84','防御力：  4.8%','速度：  4','暴击伤害：  11.0%','重循苦旅的司铎','记忆主'),(129099623,'司铎的苦旅短靴',1,'脚部','速度：  25','攻击力：  40','生命值：  3.8%','攻击力：  3.8%','防御力：  18.3%','重循苦旅的司铎','风堇'),(129099623,'学者的粗纺外套',1,'躯干','暴击率：  32.4%','攻击力：  35','速度：  7','暴击伤害：  11.6%','效果抵抗：  3.8%','识海迷坠的学者','大黑塔'),(129099623,'学者的绒皮雪靴',1,'脚部','攻击力：  43.2%','防御力：  15.1%','暴击率：  5.1%','暴击伤害：  17.4%','效果抵抗：  3.4%','识海迷坠的学者','大黑塔'),(129099623,'学者的辅助指节',1,'手部','攻击力：  352','生命值：  84','攻击力：  11.2%','暴击率：  6.1%','暴击伤害：  5.1%','识海迷坠的学者','大黑塔'),(129099623,'学者的银边视镜',1,'头部','生命值：  705','速度：  4','暴击率：  2.9%','暴击伤害：  22.0%','效果抵抗：  3.8%','识海迷坠的学者','大黑塔'),(129099623,'怪盗的千人假面',1,'头部','生命值：  705','防御力：  40','生命值：  7.7%','效果抵抗：  4.3%','击破特攻：  16.8%','流行追迹的怪盗','阮梅'),(129099623,'怪盗的绘纹手套',1,'手部','攻击力：  352','生命值：  110','防御力：  15.1%','效果抵抗：  4.3%','击破特攻：  10.3%','流行追迹的怪盗','阮梅'),(129099623,'诗人的缀星裙摆',1,'躯干','暴击伤害：  64.8%','防御力：  19','暴击率：  5.8%','效果命中：  8.2%','效果抵抗：  12.5%','哀歌覆国的诗人','缇宝'),(129099623,'诗人的缀星裙摆',2,'躯干','暴击伤害：  64.8%','生命值：  33','生命值：  15.5%','攻击力：  11.6%','效果抵抗：  4.3%','哀歌覆国的诗人','遐蝶'),(129099623,'诗人的缀星裙摆',3,'躯干','攻击力：  43.2%','速度：  5','击破特攻：  10.3%','防御力：  11.6%','效果命中：  9.3%','哀歌覆国的诗人',NULL),(129099623,'诗人的莳萝花冠',1,'头部','生命值：  705','速度：  6','暴击率：  5.1%','暴击伤害：  18.1%','击破特攻：  6.4%','哀歌覆国的诗人','缇宝'),(129099623,'诗人的莳萝花冠',2,'头部','生命值：  705','攻击力：  21','生命值：  6.9%','速度：  2','暴击伤害：  23.3%','哀歌覆国的诗人','遐蝶'),(129099623,'诗人的莳萝花冠',3,'头部','生命值：  705','防御力：  135','防御力：  8.6%','效果命中：  6.9%','生命值：  112','哀歌覆国的诗人',NULL),(129099623,'诗人的贵金手镯',1,'手部','攻击力：  352','生命值：  118','生命值：  16.4%','防御力：  4.8%','暴击伤害：  6.4%','哀歌覆国的诗人','缇宝'),(129099623,'诗人的贵金手镯',2,'手部','攻击力：  352','防御力：  16','暴击率：  6.1%','暴击伤害：  22.6%','效果命中：  4.3%','哀歌覆国的诗人','遐蝶'),(129099623,'诗人的钉银之履',1,'脚部','生命值：  43.2%','生命值：  80','暴击率：  9.0%','效果抵抗：  7.3%','击破特攻：  12.9%','哀歌覆国的诗人','缇宝'),(129099623,'诗人的钉银之履',2,'脚部','生命值：  43.2%','攻击力：  3.8%','暴击率：  11.3%','暴击伤害：  5.8%','效果抵抗：  7.3%','哀歌覆国的诗人','遐蝶'),(129099623,'铁骑的摧坚铁腕',1,'手部','攻击力：  352','防御力：  10.8%','速度：  4','效果命中：  3.4%','击破特攻：  18.7%','荡除蠹灾的铁骑','忘归人'),(129099623,'铁骑的摧坚铁腕',2,'手部','攻击力：  352','生命值：  110','防御力：  5.4%','速度：  7','击破特攻：  10.3%','荡除蠹灾的铁骑','流萤'),(129099623,'铁骑的索敌战盔',1,'头部','生命值：  705','速度：  8','效果命中：  7.7%','效果抵抗：  8.6%','击破特攻：  5.8%','荡除蠹灾的铁骑','忘归人'),(129099623,'铁骑的索敌战盔',2,'头部','生命值：  705','攻击力：  42','攻击力：  3.8%','防御力：  13.5%','击破特攻：  18.7%','荡除蠹灾的铁骑','流萤'),(129099623,'铁骑的行空护胫',1,'脚部','速度：  25','攻击力：  38','防御力：  9.7%','效果命中：  7.7%','击破特攻：  10.3%','荡除蠹灾的铁骑','忘归人'),(129099623,'铁骑的行空护胫',2,'脚部','速度：  25','生命值：  67','攻击力：  42','暴击率：  2.5%','击破特攻：  20.7%','荡除蠹灾的铁骑','流萤'),(129099623,'铁骑的银影装甲',1,'躯干','效果命中：  43.2%','生命值：  7.3%','速度：  4','暴击率：  6.1%','效果抵抗：  8.2%','荡除蠹灾的铁骑','忘归人'),(129099623,'铁骑的银影装甲',2,'躯干','攻击力：  43.2%','速度：  7','暴击率：  8.7%','效果命中：  3.4%','击破特攻：  11.6%','荡除蠹灾的铁骑','流萤'),(129099623,'铁骑的银影装甲',3,'躯干','暴击伤害：  64.8%','效果命中：  14.1%','攻击力：  56','生命值：  9.3%','攻击力：  6.9%','荡除蠹灾的铁骑',NULL);
/*!40000 ALTER TABLE `my_relics` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `my_relics_BEFORE_INSERT` BEFORE INSERT ON `my_relics` FOR EACH ROW BEGIN
    -- 检查所有字段是否为空
    IF (
        NEW.owner_uid = '' OR
        NEW.name = '' OR
        NEW.id = '' OR
        NEW.body = '' OR
        NEW.main_entry = '' OR
        NEW.secondary_entry1 = '' OR
        NEW.secondary_entry2 = '' OR
        NEW.secondary_entry3 = '' OR
        NEW.secondary_entry4 = '' OR
        NEW.package = ''
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '存在一个或多个字段为违规空值';
    END IF;
    
    -- 检查冒号后的负号
    IF (
        NEW.main_entry REGEXP '：[^：]*[-－][0-9]' OR   -- 中文冒号「：」
        NEW.secondary_entry1 REGEXP '：[^：]*[-－][0-9]' OR
        NEW.secondary_entry2 REGEXP '：[^：]*[-－][0-9]' OR
        NEW.secondary_entry3 REGEXP '：[^：]*[-－][0-9]' OR
        NEW.secondary_entry4 REGEXP '：[^：]*[-－][0-9]'
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '属性值不能包含负值';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `owner_uid` int NOT NULL,
  `role_name` varchar(15) NOT NULL,
  `HP` int NOT NULL,
  `ATK` int NOT NULL,
  `DEF` int NOT NULL,
  `SPD` int NOT NULL,
  `Crit_Rate` float NOT NULL,
  `Crit_Damage` float NOT NULL,
  `level` int NOT NULL,
  `Light_cone` varchar(50) DEFAULT NULL,
  `path` varchar(20) NOT NULL,
  PRIMARY KEY (`owner_uid`,`role_name`),
  KEY `cone_cones_idx` (`Light_cone`),
  KEY `name_idx` (`role_name`),
  KEY `role_name_idx` (`role_name`),
  CONSTRAINT `Light_cones` FOREIGN KEY (`Light_cone`) REFERENCES `light_cones` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `owner_id_uid` FOREIGN KEY (`owner_uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_name` FOREIGN KEY (`role_name`) REFERENCES `all_roles` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (129099623,'大黑塔',3132,2989,1010,115,81.5,129.7,80,'银河铁道之夜','智识'),(129099623,'忘归人',4117,1466,1505,164,13.7,62.9,80,'长路终有归途','虚无'),(129099623,'流萤',2832,2462,1589,161,21.5,50,80,'记一位星神的陨落','毁灭'),(129099623,'缇宝',5100,1271,1230,94,48.7,188.3,80,NULL,'同协'),(129099623,'记忆主',3745,1583,1708,162,7.5,173.5,80,NULL,'记忆'),(129099623,'遐蝶',9267,1590,970,92,46.7,233.7,80,'让告别，更美一些','记忆'),(129099623,'阮梅',4841,1420,1284,155,13.1,50,80,'记忆中的模样','同协'),(129099623,'风堇',4034,1493,1343,218,7.9,65.5,80,'记忆永不落幕','记忆'),(129099623,'飞霄',2862,3115,1118,135,88.5,129,80,'我将，巡征追猎','巡猎'),(129099623,'黄泉',3154,4068,833,105,70.4,216.9,80,'行于流逝的岸','虚无');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `phone` varchar(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('18876104065','123456',129099623);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'star_rail'
--

--
-- Dumping routines for database 'star_rail'
--
/*!50003 DROP PROCEDURE IF EXISTS `EquipLightCone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EquipLightCone`(
    IN p_uid INT,
    IN p_name VARCHAR(50),
    IN p_user VARCHAR(15)
)
BEGIN
    DECLARE v_lightcone_user VARCHAR(15);
    DECLARE v_role_lightcone VARCHAR(50);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    -- 检查光锥表：当前user值必须为"无"
    SELECT `user` INTO v_lightcone_user
    FROM `light_cones`
    WHERE `owner_id` = p_uid
    AND `name` = p_name
    FOR UPDATE;
    
    IF v_lightcone_user != '无' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '光锥已被其他角色装备';
    END IF;
    
    -- 检查角色表：当前Light_cone值必须为NULL
    SELECT `Light_cone` INTO v_role_lightcone
    FROM `roles`
    WHERE `owner_uid` = p_uid
    AND `role_name` = p_user
    FOR UPDATE;
    
    IF v_role_lightcone IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '角色已装备其他光锥';
    END IF;
    
    -- 执行光锥更新操作
    UPDATE `light_cones`
    SET `user` = p_user
    WHERE `owner_id` = p_uid
    AND `name` = p_name;
    
    -- 执行角色装备更新
    UPDATE `roles`
    SET `Light_cone` = p_name
    WHERE `owner_uid` = p_uid
    AND `role_name` = p_user;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `light_cones_view`
--

/*!50001 DROP VIEW IF EXISTS `light_cones_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `light_cones_view` AS select `lc`.`owner_id` AS `owner_id`,`lc`.`name` AS `name`,`lc`.`star_rating` AS `star_rating`,`lc`.`Paths` AS `Paths`,`lc`.`user` AS `user`,`alc`.`story` AS `light_cone_story` from (`light_cones` `lc` join `all_light_cones` `alc` on((`lc`.`name` = `alc`.`name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 11:33:57
