CREATE DATABASE  IF NOT EXISTS `G3217_2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `G3217_2`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: mysql.labranet.jamk.fi    Database: G3217_2
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aanestys`
--

DROP TABLE IF EXISTS `Aanestys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aanestys` (
  `id` varchar(100) NOT NULL,
  `pvm` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aanestys`
--

LOCK TABLES `Aanestys` WRITE;
/*!40000 ALTER TABLE `Aanestys` DISABLE KEYS */;
INSERT INTO `Aanestys` VALUES ('','7.12.2014'),('G3217','1.1.2015'),('nikolauska1','31.3.2015'),('rasek24','27.4.2015'),('taniz117','27.4.2015');
/*!40000 ALTER TABLE `Aanestys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Arvosana`
--

DROP TABLE IF EXISTS `Arvosana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Arvosana` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arvosana` double DEFAULT NULL,
  `Ruoka_id` int(11) NOT NULL,
  `Aanestys_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Arvosana_Ruoka_idx` (`Ruoka_id`),
  KEY `fk_Arvosana_Aanestys1_idx` (`Aanestys_id`),
  CONSTRAINT `fk_Arvosana_Aanestys1` FOREIGN KEY (`Aanestys_id`) REFERENCES `Aanestys` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Arvosana_Ruoka` FOREIGN KEY (`Ruoka_id`) REFERENCES `Ruoka` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arvosana`
--

LOCK TABLES `Arvosana` WRITE;
/*!40000 ALTER TABLE `Arvosana` DISABLE KEYS */;
INSERT INTO `Arvosana` VALUES (110,2.5,124,'taniz117'),(111,4,124,'nikolauska1'),(114,5,228,'taniz117'),(116,4,228,'nikolauska1'),(117,4,130,'nikolauska1'),(129,3,259,'taniz117'),(130,4,260,'nikolauska1'),(131,3.5,271,'taniz117'),(132,3,271,'nikolauska1'),(133,3.5,178,'taniz117'),(134,3.5,119,'taniz117'),(135,4.5,124,'nikolauska1'),(136,4,136,'taniz117'),(137,2.5,329,'taniz117'),(138,3,130,'nikolauska1'),(139,5,350,'nikolauska1'),(140,3,355,'taniz117'),(141,2,119,'taniz117'),(142,3,126,'taniz117'),(143,4,329,'taniz117'),(144,4,329,'rasek24'),(145,2.5,344,'rasek24'),(146,4,350,'taniz117'),(147,5,350,'rasek24'),(148,3,355,'taniz117'),(149,2,384,'nikolauska1'),(150,2,387,'taniz117'),(152,4,177,'taniz117'),(153,2,294,'taniz117'),(154,0,407,'taniz117'),(155,2.5,419,'taniz117'),(156,2,124,'rasek24'),(157,3,424,'taniz117'),(158,3.5,221,'rasek24'),(159,3.5,221,'taniz117');
/*!40000 ALTER TABLE `Arvosana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ruoka`
--

DROP TABLE IF EXISTS `Ruoka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ruoka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nimi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nimi_UNIQUE` (`nimi`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ruoka`
--

LOCK TABLES `Ruoka` WRITE;
/*!40000 ALTER TABLE `Ruoka` DISABLE KEYS */;
INSERT INTO `Ruoka` VALUES (430,'Aasialainen kana-nuudelikeitto'),(245,'Ananasriisi'),(141,'Aprikoosikiisseli'),(247,'Avocadopasta'),(255,'Avokadopasta'),(276,'Banaani lassi'),(431,'Banaanirahka'),(286,'Bataatti-feta ciabatta'),(159,'Bataattisosekeitto'),(398,'Bolognesekastike'),(332,'Boysenmarja kiisseli'),(194,'Boysenmarjakiisseli'),(428,'Boysenmarjamousse ja kinuskikastike'),(390,'Broileri tagine'),(199,'Broileri tÃ¤ytteinen ciabatta'),(376,'Broileri tÃ¤ytteinen patonki'),(208,'Broileri(M,G)/ Vuohenjuusto(G)'),(122,'Broileri-appelsiiniwrap'),(242,'Broileri-chorizopaella'),(281,'Broileri-mango ciabatta'),(329,'Broileri-nuudeli wok'),(393,'Broileri/Feta salaatti'),(268,'Broileri/fetajuusto salaatti'),(341,'Broileri/grilattu halloumi salaatti'),(219,'Broileri/vuohenjuusto salaatti'),(119,'Broileria Korma'),(349,'Broileria Provencale'),(215,'Broileria tummassa punasipulikastikkeessa'),(260,'Broilerikiusaus'),(171,'Broilerilasagnette'),(380,'Broilerin fileepihvi'),(319,'Broilerin pihvi'),(234,'Broilerin pihviÃ¤'),(136,'Broilerinuggetit'),(415,'Broileripuikkoja'),(272,'Broileritagine'),(301,'BroileritÃ¤ytteinen patonki'),(162,'Broileriwokki'),(211,'Broilernugetit'),(190,'Burgundinpataa'),(330,'Chili sin carne'),(166,'Ciabatta savuporotÃ¤ytteellÃ¤'),(157,'Curry-broilerikeitto'),(192,'Emmental(L,G)/ Chilikalkkuna(M,G)'),(340,'Espanjalainen munakas'),(425,'Feta/grillattu halloumi salaatti'),(336,'Fetajuusto/palvikinkku salaatti'),(216,'Graavilohi(M,G) / ParmesaN(L,G)'),(320,'Graavilohi/feta salaatti'),(377,'Graavilohi/grillattu halloumi salaatti'),(397,'Graavilohi/raejuusto salaatti'),(429,'Graavilohi/Raejuustosalaatti'),(229,'Gratinoitu pinaattipasta'),(410,'Halloumi/ Graavilohi lohi'),(305,'Halloumi/kalkkuna salaatti'),(178,'HapanimelÃ¤ kanakastiketta'),(293,'HedelmÃ¤ smoothie'),(264,'HedelmÃ¤jogurtti'),(241,'HedelmÃ¤mousse'),(435,'HedelmÃ¤salaatti'),(355,'Hernekeittoa'),(189,'Hernekeittoa ja pannukakkua'),(187,'Hunaja-porsaanfiletÃ¤ytteinen patonki'),(273,'Intialainen linssi-kasvishÃ¶ystÃ¶'),(317,'Japanilainen teemaruoka'),(283,'Jauheliha burger'),(318,'Jauheliha Lasagne'),(278,'Jauheliha-perunasoselaatikkoa'),(130,'Jauhelihakastike'),(183,'Jauhelihakastiketta'),(350,'Jauhelihakebakot'),(356,'Jauhelihalasagnette'),(384,'Jauhelihaperunasoselaatikkoa'),(334,'Jauhemaksapihvi'),(233,'Joululounas'),(235,'Joulupuuro'),(391,'Juusto/minilihapulla salaatti'),(124,'Juustoinen jauheliha-perunavuoka'),(177,'Kaalilaatikkoa'),(364,'Kala-katkarapucurry'),(207,'Kalaa capers'),(149,'Kalaa Pomodoro Rosso'),(395,'Kalacurry intialaisittain'),(266,'Kalamurekepihvi'),(184,'KalapyÃ¶rykÃ¶itÃ¤'),(378,'KalapyÃ¶rykkÃ¤'),(324,'Kalaseljanka'),(231,'Kalkkuna tÃ¤ytteinen patonki'),(203,'Kalkkuna(M,G) / Katkarapu(M,G)'),(370,'Kalkkuna-ananas wrap'),(152,'Kalkkuna-appelsiinitÃ¤ytteinen wrap'),(299,'Kalkkuna-appelsiiniwrap'),(420,'Kalkkuna/Mozzarellasalaatti'),(133,'Kalkkuna/vuohenjuusto salaatti'),(426,'Karpalomousse ja kinuskikastike'),(261,'Kasvis - kvinoapihvi'),(185,'Kasvis jambalaya'),(294,'Kasvis paella'),(346,'Kasvis tagine'),(212,'Kasvis-bouillabaisse'),(335,'Kasvis-kvinoapihvi'),(279,'Kasvismoussaka'),(132,'Kasvispaella'),(238,'KasvispihvejÃ¤'),(313,'Kasvispihvit'),(433,'Kasvistortillla'),(375,'Katkarapu (M,G)/ /Briejuusto(G)'),(409,'Katkarapu /Briejuusto'),(198,'Katkarapu(M,G)/ /Briejuusto(L,G)'),(218,'Katkarapu/Fetajuusto salaatti'),(127,'Katkarapu/leipÃ¤juusto salaatti'),(306,'Katkarapu/Mozzarellajuusto salaatti'),(224,'Katkarapu/mozzarellasalaatti'),(358,'Katkarapu/palvikinkku salaatti'),(146,'KatkaraputÃ¤ytteinen patonki'),(193,'Katkarapuwrap'),(271,'Kebab ja riisiÃ¤'),(237,'Kermainen kalakeitto'),(158,'Kiinalainen possupata'),(351,'Kikherne-kasviscurry'),(419,'Kimchi '),(289,'Kinkku patonki'),(337,'Kinkku-cheddarpatonki'),(181,'Kinkku-juusto ciabatta'),(263,'Kinkku-juustopatonki'),(359,'Kinkku-juustotÃ¤ytteinen ciabatta'),(209,'Kinkku-melonitÃ¤ytteinen moniviljasÃ¤mpylÃ¤'),(195,'Kinkkukiusaus'),(240,'KinkkutÃ¤ytteinen club sandwich'),(128,'Kolmen juuston patonki'),(144,'Kolmen kaalin gratiini'),(328,'Kookos-ananas mousse'),(243,'Kookos-tofuwok'),(361,'Kookos-tofuwokki'),(311,'Korealainen teemaruoka'),(204,'Koskenlaskijan jauheliha-perunaviipalevuoka'),(148,'Koskenlaskijan jauheliha-perunavuoka'),(348,'Kotijuusto/tandooribroileri salaatti'),(288,'Kotijuusto/Tofusalaatti'),(163,'Kreolilainen lihapata'),(137,'Kreolilainen naudanlihapata'),(325,'Kung po tofupaistos'),(388,'KylmÃ¤savulohi/raejuusto salaatti'),(360,'Lammas-kikherne tagine'),(417,'LeipÃ¤juusto/porsaanpaisti salaatti'),(338,'Liha-makaronilaatikkoa'),(201,'Lihapullat tomaattikastikkeessa'),(142,'LihapyÃ¶rykÃ¤t'),(222,'LindstrÃ¶minpihvit'),(214,'Lohilasagnette'),(191,'Luomu tofu-pinaattipasta'),(365,'Makkarakastike'),(394,'Makkarakeitto'),(227,'Maksa-pekonipata'),(153,'Mango jogurtti'),(123,'Mangojogurtti'),(206,'Mansikka- appelsiinikiisseli'),(129,'Mansikka-appelsiinikiisseli'),(303,'Mansikkakiisseli'),(217,'Marenki- sitruspiirakka'),(147,'Marenki-sitruspiirakka'),(253,'Marianne mousse'),(343,'Marja-banaani smoothie'),(321,'meetvursti-juusto patonki'),(155,'MetsÃ¤sienikeitto'),(246,'Mexicolainen jauhelihakastike'),(254,'Mexikolainen jauhelihakastike'),(221,'Miilunpolttajan pasta'),(427,'Minilihapulla/grillattu halloumi salaatti'),(161,'MoniviljasÃ¤mpylÃ¤ salaami-melonitÃ¤ytteellÃ¤'),(154,'Mozzarella-tomaattigratiini'),(383,'Mozzarella/Ã„yriÃ¤isaiolisalaatti'),(382,'Mozzarella/Ã¤yriÃ¤isaioli salaatti'),(352,'Mozzarella/Broilerisalaatti'),(326,'Mozzarella/tandooribroileri salaatti'),(381,'Mozzarella/tandooribroileri salaatti salaatti'),(262,'Mozzarella/Tofusalaatti'),(347,'Mud cake'),(232,'Mustaherukkakerroskiisseli'),(202,'Mustajuurikeitto'),(251,'Mustapapu burrito'),(322,'Mustikka jogurtti'),(210,'Mustikka- talkkunarahka'),(135,'Mustikka-talkkunarahka'),(257,'Mustikkakiisseli'),(170,'Mustikkapiirakka'),(354,'Mustikkarahka'),(323,'Nakkeja'),(265,'Nakki stroganoff'),(386,'Nakkistroganoff'),(413,'Nasi Goreng naudanlihasta'),(403,'Nasi Goreng porsaanlihasta'),(405,'Omenapiirakka'),(182,'Omenapiiras'),(400,'Paahtopaisti ciabatta'),(389,'Paahtopaisti patonki'),(269,'Paahtopaisti-kapris patonki'),(399,'Paahtopaisti/Feta salaatti'),(406,'Paistettua katkarapuriisiÃ¤'),(223,'Palak Paneer'),(379,'Palapaistia'),(167,'Palsternakkasosekeitto'),(372,'Palvikinkku (M,G)/ Tofu (M)'),(297,'Palvikinkku(M,G)/ Mozzarella(VL,G)'),(180,'Palvikinkku(M,G)/ Tofu(M,G)'),(402,'Palvikinkku/ Tofu salaatti'),(280,'Palvikinkku/Halloumi salaatti'),(408,'Panertoitu broileripihvi'),(197,'Papuja sweet and sour'),(145,'Parmesan/Ã¤yriÃ¤isaioli salaatti'),(312,'Parsakaali-broilerigratiini'),(150,'Parsakaalisosekeitto'),(259,'Pasta bolognese'),(333,'Pasta Romana'),(169,'Patonki katkaraputÃ¤ytteellÃ¤'),(168,'PÃ¤ivÃ¤n salaatti Ã¤yriÃ¤isaioli/parmesan'),(165,'PÃ¤ivÃ¤n salaatti Broileri/grillattu halloumi'),(156,'PÃ¤ivÃ¤n salaatti leipÃ¤juusto/katkarapu'),(160,'PÃ¤ivÃ¤n salaatti minilihapulla/vuohenjuusto'),(151,'PÃ¤ivÃ¤n salaatti pestokalkkuna/tonnikala'),(424,'Pekoni toast'),(228,'Perinteinen pyttipannu '),(188,'Persikka- herukka crumble'),(126,'Phad thai'),(357,'Pinaattiohukainen'),(118,'PippurihÃ¤rkÃ¤Ã¤'),(236,'Porkkanaohukainen'),(179,'Porkkanaohukaiset'),(414,'PorsaanfileetÃ¤ytteinen leipÃ¤'),(418,'Porsaanpaisti-appelsiiniwrap'),(387,'Possu tandorikastike'),(392,'Possu wok'),(371,'Possu-kasvis-nuudeliwok'),(172,'Possua sukiyaki'),(196,'Possuwokki'),(423,'Puolukka vispipuuro'),(396,'Puolukka-kinuskirahka'),(308,'Puolukka-talkkunarahka'),(164,'Purjo-perunasosekeitto'),(174,'Raejuusto(G)/ Savulohi(M,G)'),(401,'Raejuusto/ LÃ¤mmin Savulohi'),(421,'Ramen burger'),(267,'Ratatouille'),(385,'Salaattijuusto/palvikinkku salaatti'),(307,'Salami-mangotÃ¤ytteinen moniviljasÃ¤mpylÃ¤'),(331,'Salami-meloni wrap'),(220,'Salami-melonitÃ¤ytteinen ciabatta'),(134,'Salami-melonitÃ¤ytteinen moniviljasÃ¤mpylÃ¤'),(342,'Savukalaruisruutu'),(304,'Savulohi(M,G)/ /Briejuusto(G)'),(225,'SavulohitÃ¤ytteinen patonki'),(205,'Savumakrilli(M,G) / LeipÃ¤juusto(VL,G)'),(434,'Savumakrilli/feta salaatti'),(366,'Savuolohi ciabatta'),(363,'Savupaisti-kapris patonki'),(140,'Savuporo-tuorejuustotÃ¤ytteinen ciabatta'),(339,'Sitruunabroileri kastiketta'),(284,'Soija-kasvislasagnette'),(173,'Soija-kasviswok'),(412,'Sukiyaki porsasta'),(226,'Suklaa-appelsiinimousse'),(200,'SuklaakÃ¤Ã¤retorttu'),(176,'Suklaakeitto'),(270,'Suklaamousse'),(374,'Sweet and sour kanakastiketta'),(344,'Sweet and sour possua'),(252,'Tandoori broileri/brie juusto salaatti'),(373,'Tandoori broileria(M,G)/ Cheddar (G)'),(295,'Tandoori broileria(M,G)/ Cheddar(L,G)'),(300,'Tandoori broileria(M,G)/ Halloumi(G)'),(404,'Tandoori broileria/ Cheddar'),(239,'Tandoori-broileri/brie juusto salaatti'),(369,'Tandooribroileri/briejuusto salaatti'),(258,'Tandooribroileri/briejuustosalaatti'),(327,'TÃ¤ytetty bataatti-feta ciabatta'),(277,'Thaimaalainen curry porsaanlihasta'),(186,'Tikka-masala broileria(M,G)/ Cheddar(L,G)'),(291,'Tofu (G)/ Savulohi(M,G)'),(230,'Tofu/Palvikinkku salaatti'),(175,'Tomaatti-Fetaciabatta'),(411,'Tomaatti-juustociabatta'),(315,'Tomaatti-mozzarella ciabatta'),(353,'Tomaatti-mozzarella patonki'),(292,'Tomaatti-Mozzarellaciabatta'),(125,'Tomaattinen bratwurstikeitto'),(416,'Tomaattinen juusto-perunavuoka'),(298,'Tomaattinen mozzarella-perunavuoka'),(120,'Tomaattinen parmesan-perunavuoka'),(432,'Tomaattisalsalla kuorrutettua seitÃ¤'),(296,'Tonnikala (M,G)/ Feta (G)'),(302,'Tonnikala (M,G)/ Feta (L,G)'),(407,'Tonnikala / Feta '),(275,'Tonnikala wrap'),(248,'Tonnikala/Feta salaatti'),(256,'Tonnikala/fetasalaatti'),(139,'Tonnikala/grillattu halloumi salaatti'),(121,'Tonnikala/kalkkuna salaatti'),(290,'Tonnikala/kotijuustosalaatti'),(274,'Tonnikala/raejuusto salaatti'),(143,'Tonnikalalasagnette'),(367,'Tonnikalapasta'),(309,'TonnikalatÃ¤ytteinen patonki'),(131,'Uunikalaa kapris-sitruuna-chilikastikkeella'),(345,'Uunikalaa sitruuna-chilikastikkeella'),(250,'Uunimakkara'),(138,'Uuniperuna yrtti-raejuustotÃ¤ytteellÃ¤ '),(287,'Vadelmakiisseli'),(249,'Vadelmarahka'),(316,'Vaniljakiisseli'),(282,'Vatkattu omenapuuro'),(368,'Vege burrito'),(310,'Vietnamilainen teemaruoka'),(213,'Yrttibroileri(M,G)/ Halloumi(G)'),(314,'Yrttibroileri/Ã„yriÃ¤isaioli salaatti'),(285,'Yrttibroileri/feta salaatti'),(244,'Yrttibroileri/kotijuusto salaatti'),(362,'Yrttibroileri/kotijuustosalaatti'),(422,'Yrttibroileri/tonnikalasalaatti');
/*!40000 ALTER TABLE `Ruoka` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-27 16:20:55
