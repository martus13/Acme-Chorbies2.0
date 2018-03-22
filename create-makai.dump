start transaction;

drop database if exists `Makai`;
create database `Makai`;

use `Makai`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete
on `Makai`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter,
create temporary tables, lock tables, create view, create routine,
alter routine, execute, trigger, show view
on `Makai`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Academy
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `actor`
--

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `userAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  CONSTRAINT `FK_cgls5lrufx91ufsyh467spwa3` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `userAccount_id` int(11) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (86,0,'Jerez','Spain','Cadiz','Andalucia','11598','admin@gmail.com','administrator','+34 632144487','AC',65,'98698525D','SurnameAdmin');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `chipNumber` varchar(255) DEFAULT NULL,
  `isHidden` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `sex` int(11) DEFAULT NULL,
  `animalShelter_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8tf1ag339bn0vin3ee9ja5p6p` (`animalShelter_id`),
  KEY `FK_tnvgeyb8gdkxk2029w39podiv` (`customer_id`),
  CONSTRAINT `FK_8tf1ag339bn0vin3ee9ja5p6p` FOREIGN KEY (`animalShelter_id`) REFERENCES `animalshelter` (`id`),
  CONSTRAINT `FK_tnvgeyb8gdkxk2029w39podiv` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (106,0,2,'554784P','\0','Name Animal 1','BI',0,NULL,93),(107,0,5,'550084P','\0','Name Animal 2','BP',1,90,NULL),(108,0,8,'554711P','\0','Name Animal 3','@I',0,91,NULL);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_breed`
--

DROP TABLE IF EXISTS `animal_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal_breed` (
  `Animal_id` int(11) NOT NULL,
  `breeds_id` int(11) NOT NULL,
  KEY `FK_f44eop8njvmocbd1qeb97yy00` (`breeds_id`),
  KEY `FK_770vga86sxr38egrisvigqjut` (`Animal_id`),
  CONSTRAINT `FK_770vga86sxr38egrisvigqjut` FOREIGN KEY (`Animal_id`) REFERENCES `animal` (`id`),
  CONSTRAINT `FK_f44eop8njvmocbd1qeb97yy00` FOREIGN KEY (`breeds_id`) REFERENCES `breed` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_breed`
--

LOCK TABLES `animal_breed` WRITE;
/*!40000 ALTER TABLE `animal_breed` DISABLE KEYS */;
INSERT INTO `animal_breed` VALUES (106,102),(106,103),(107,104),(108,105);
/*!40000 ALTER TABLE `animal_breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animalshelter`
--

DROP TABLE IF EXISTS `animalshelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animalshelter` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `userAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ilyjxwhe8lst5x67fxvpxhw9a` (`userAccount_id`),
  CONSTRAINT `FK_ilyjxwhe8lst5x67fxvpxhw9a` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animalshelter`
--

LOCK TABLES `animalshelter` WRITE;
/*!40000 ALTER TABLE `animalshelter` DISABLE KEYS */;
INSERT INTO `animalshelter` VALUES (90,0,'Tenerife','Spain','Tenerife','Islas Canarias','66154','animalShelter1@gmail.com','Name Animal Shelter1','+35632144487','AC',75),(91,0,'Sevilla','Spain','Sevilla','Andalucia','410013','animalShelter2@gmail.com','Name Animal Shelter2','+34 632887487','AC',76),(92,0,'Almeria','Spain','Almeria','Andalucia','39954','animalShelter3@gmail.com','Name Animal Shelter3','+34 632144487','AC',77);
/*!40000 ALTER TABLE `animalshelter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `currentViews` int(11) DEFAULT NULL,
  `picture` tinyblob,
  `totalViews` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (82,0,198,'AC',250),(83,0,125,'AC',125),(84,0,6,'AC',10);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breed` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `breed` varchar(255) DEFAULT NULL,
  `specie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5l4m9bdndvmr5yb7se29yu0lw` (`specie_id`),
  CONSTRAINT `FK_5l4m9bdndvmr5yb7se29yu0lw` FOREIGN KEY (`specie_id`) REFERENCES `specie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed`
--

LOCK TABLES `breed` WRITE;
/*!40000 ALTER TABLE `breed` DISABLE KEYS */;
INSERT INTO `breed` VALUES (102,0,'Mastin',99),(103,0,'Siames',100),(104,0,'Iguana',101),(105,0,'Bulldog',99);
/*!40000 ALTER TABLE `breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `userAccount_id` int(11) DEFAULT NULL,
  `avgRating` double DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (93,0,'Huelva','Spain','Huelva','Andalucia','32004','customer1@gmail.com','Name Customer1','+34 632144487','BI',66,15.4,'326598T','Surname Customer1'),(94,0,'Lisboa','Portugal','Lisboa','Lisboa','87201','customer2@gmail.com','Name Customer2','+39632144487','@@',67,1.2,'300598T','Surname Customer2'),(95,0,'Rome','Italy','Rome','Rome','32664','customer3@gmail.com','Name Customer3','+34 699655654','BI',68,98.4,'326500T','Surname Customer3'),(32769,1,'prueba','prueba','','','prueba','prueba@prueba.es','prueba','+34697271194','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0°\0\0v\0\0\0O@{\\\0\0³IDATxœìİyt]u¹ÿñÏN’¦CÒtçJ\' ¥ee¨ (‚‚ x•{ñªˆÈ•uõzçû»8\\¡`K‹RZŠm)t›tnÓ’¦™§söğû£ë»{Ò‰IÎ9ÉûµK»3}³÷>tŸÏó|­0C\0\0\0\0\0\0iÊNõ\0\0\0\0\0\0€!À\0\0\0\0\0@Z#À\0\0\0\0\0@Z#À\0\0\0\0\0@Z#À\0\0\0\0\0@Z#À\0\0\0\0\0@Z#À\0\0\0\0\0@Z#À\0\0\0\0\0@Z#À\0\0\0\0\0@ZsS½\0\0\0€t†aômÛ²,ë¨ÏÙ³gŠ‹‹µuëVmÛ¶MÛ·o×úõëµuëV544È÷}1B£FÒ Aƒ4tèP\r2DÃ†\rÓ°aÃäºG?‚ù¾/IÇı™\0\0\0í™†a˜êE\0\0\0¤J†\n‚@A(CeeeE«««Ó›o¾©\r6hÏ=Ú½{·8 ºº:544Dÿ466FÇ‚ $åää¨C‡ÊÉÉQNN²³³£c]»vUß¾}Õ·o_\r6L^x¡†ı\\ÏóÇ!Ğ\0\0\0\0h§|ß—ïû²m»IEÔôöÛokÙ²eZµj•¶lÙ¢ıû÷«ªªªÙ×““£îİ»kÈ!\Z;v¬&O¬K.¹D£FŠ>\'C%	Ù¶-Çq³\0\0@»D€\0\0ÚSm•Z•””hãÆZ·nV¯^­%K–hÍš5G}­ëº²íC#D“[\rÍ÷M~¬²,ë¸ÿA D\"qÔ÷ïÛ·¯.¸àM˜0Agu–ÆÛ$Ì2?Ãqœf;\0\0\0™€\0\0\0´æ‘ÇT0ÕÖÖjÛ¶m***Ò[o½¥yóæiíÚµÑç;#×uåû~“°ª¹L˜eÛ¶lÛ*­Œ‚‚]uÕUºòÊ+uöÙgkèĞ¡êÙ³ç1\0\0€¶\0\0\0´+‰DBåååzî¹çôßÿıßÚ¼ysô1S•e*Zû1ÉZ–eEÁ™$uêÔIwŞy§î¾ûn=Z:thÕu\0\0¤\Z\0\0hÓÌvÇq{î9=õÔSZ·n]“(™¶Å=zèsŸûœ~øauïŞ½Én‰\0\0\0m\0\0h“|ß—çyÊÎÎ–$ê\'?ù‰Ş{ï=}ğÁÑç™6¼t|$:ÖÚ:uê¤áÃ‡ësŸûœ¾øÅ/*++KçICŞ\0@›E€\0\0Ú”0åyb±˜$iÙ²eúãÿ¨ùóç5ãêÈÁëéÌTYA éĞÀ÷©S§ê¶ÛnÓ­·Ş*Iò</š©\0\0Ğ–`\0€6Ã÷ıh†Tqq±æÌ™£W^yEóæÍ“¤(ÜÉ”ÖÁc1UV¦êjÔ¨QºñÆuİu×éâ‹/–Ôô<\0\0\0´X\0\0 Mğ}_ãH’V­Z¥Ÿşô§úÿïÿIRTåy^ÆWG2»$666J’¦Nªı×Õµ×^+×uA´Ó!\0\0@¦#À\0\0/Ãhç¾wß}W=ôŞ}÷]9#Û¶ÛTpu$ó;&	åççë¿ø…>şñ+77WÒás\0\0É\0\0\02™õê«¯êÓŸş´Ş}÷]I‡ª²‰D›\r¯¤Ã¿£eYª¨¨Ğ]wİ¥_üâª®®–tøÜ\0\0\0d2*°\0\0@Æ\n‚@AÈu]ıâ¿Ğ÷¿ÿ}íß¿?ÕËJ	Ë²¢ ®sçÎúìg?«G}T}ûöU<WVVVŠW\0\0pú°\0\0@Æ	ÃPAÈqÅãq=ùä“úõ¯­}ûöEíríõÇqù¾¯;êºë®Ó#<¢‰\'Êó¼h\0<\0\0@¦!À\0\0%C…a(Û¶µoß>=ıôÓzæ™gTSS£X,Ö¦ç]¬X,¦D\"!IúØÇ>¦¯ıëºüòË£óBˆ\0\02\r\0\0ÈÉ•W{öìÑ“O>©_şò—’¤¬¬,Åãñ¯0}˜ƒ Ğyç§ÿüÏÿÔôéÓ%j½´mF¡\0€ÌA€\0\02†ïûrGeeezòÉ\'õôÓOGmqç¥zyiÇqI‡ÎÛØ±cõ×¿şUãÆ“ïû²m›J,\0\01øOo\0\0 #˜¶Á0õç?ÿYO?ı´lÛ–ïû„WÇáû¾‚ eYZ¿~½|òImİº5š“\0\0)°\0\0@FH$²,KúÓŸôØcI:Ô\n‡33Ã$éÅ_Ô³Ï>«ªª*Y–Åù\0\0ƒ\0\0\0¤½ ”••¥×^{M?şñU^^.×uS½¬ŒbY–‰„~ñ‹_è/ù‹Ç‰½\0\0¤;,\0\0¶’wÜ¼y³~úÓŸjÕªUŠÅb´À¢0‹ÅtàÀıøÇ?Ö¬Y³”Íy\0\0\0\0\0¤%ÓöfY–jkkõ£ıH.”ã8\n‚@ìCsê‰„²²²TTT¤ïÿûZ»vm4èó	\0\0Ò\0\0HKaÊ²,ÅãqıÏÿüşøÇ?ª¡¡A–eQ5t<Ï“ëºzÿı÷õè£ª¢¢BRÓYY\0\0\0é†\0\0\0¤^…a¨wŞyGÿöoÿ¦ÆÆFIbÇÁ3dª×Â0Ô›o¾©ÿøÇª««“mÛu\0\0i‹\0\0\0¤Rëé§ŸVMM\rÕAÍÈ÷ı¨5ó¿ÿû¿µeËIŠBC\0\0€tC€\0\0ÒmÛ²,KË—/×o¼!‰p¥¥TTTèøƒöíÛ\'I´g\0€´D€\0\0ÒŠçyÑ®ƒúÓŸ¢ÖAÂ«æ,Ë’eYúË_ş¢\r6È¶y4\0\0é‰§\0\0v,ËÒë¯¿®ÂÂB¹®›êå´iaêÀzùå—UZZ*Û¶©Â\0\0i‡\0\0\0¤0åº®Š‹‹5wî\\Õ××Ë²¬T/«Í2Um®ëêÅ_Ôüùóæ\0\0Ò\0\0H&Pùãÿ¨7ß|S–e±ë`+°,K{öìÑo¼¡ÚÚZªŞ\0\0@Ú!À\0\0)g‚+Ë²T\\\\¬ùóç«¡¡A±XŒÙW­À´¾úê«úË_ş\"Ë²¨Â\0\0i…\0\0\0¤\\r€õ›ßüFK—.•Äx­%Åb1•””höìÙª®®f ;\0\0H+<™\0\0€”3s®vîÜ©W_}Ur]—\0+Ş{ï=½üòËQp\0\0 `\0€”\n‚ šuµpáB•””È¶m†··2Ïóä8öïß¯¿ıíoQ\0\0HX\0\0 ¥L¥O<Waa¡êêêÕW­,C9#ß÷µeËUUUIA\"\0\0HX\0\0 -ÔÕÕiÑ¢EjhhDåO*˜s^QQ¡·Şz+ªãZ\0\0€T#À\0\0)†¡\\×•$­_¿^»ví’$9Ch’¦\Z®²²Ro½õV&²#!\0\0H5,\0\02ÉÉÂ…åy$ª¯RÅT\\Õ××«°°Pñx\\ar=\0\0@Ê`\0€”ñ}_aêÀzóÍ7£ „À$5Â0”mÛ\nÃPÅÅÅÚ¶m›,Ë¢\"\0\0¤\0\0H)Ë²ôÁhùòåXi¤±±Q‹/V}}½,Ë¢\0\0¤\0\0H‰ ä8<ÏÓ¦M›TYY)‰]ïR-9<œ7o8 ‰9X\0\0 µ°\0\0@J„a(Çq´wï^-Z´ˆà*M˜\0Ë÷}-^¼X¥¥¥M\0\0¤\0\0H	SÑ³cÇÚÓH†Q˜XRRíifc\0\0¤\0\0H	†TTT¨¤¤„\n¬4URR¢0åº.\0\0H,\0\0&©­­Õ°ÒTYY™êëëS½\0\0ĞÎ`\0€”ª­­•çyXiª¼¼\\555©^\0\0hç°\0\0@JÕÖÖÊ²,¬4U^^®ºº:IÌ\'\0\0©C€\0\0RÂqIRUUÁH\Z;xğ \0\0H9,\0\0ĞêÂ0”mÛò}_©^N ¬¬,j!$À\0\0©B€\0\0RÂ¶mUTT¨ªª*ÕKÁ’ƒªƒª¶¶6…«\0\0 À\0\0)”`Qİ“~,ËREE-„\0\0 å°\0\0@«3AHEE…*++S¼\ZœÈ¢\n,,\0\0*X\0\0 e*++	°Ò˜mÛjll¤…\0\0¤\0\0H™ äû¾$ª{Ò‘eY’]\'\0\0€T\"À\0\0)“——§¼¼<I‡Ã¤ dÛ¶rssS½\0\0ĞÎ`\0€VgÂª¼¼<uéÒ%Å«ÁñA nİº©cÇ’\0@ê`\0€”ÉËËS~~¾$Â‘tE€\0\0Ò\0\0H‰0UPPµ\"}$U]»v%À\0\0)G€\0\0RÂ÷}Åb1uîÜ9ÕKÁ	0\0\0¤\0\0hu–eÉ÷}…aÍÀ¢º\'=`\0€t@€\0\0RÆ²¬¨+Ã¯ÇRPP@!\0\0H9,\0\0R:u’ã8\n‚ ÕKÁ1`\0€t@€\0\0RÂ„!;vT×®]	°ÒeYêÚµ«:uê”ê¥\0\0€v\0\0\0¤T§NÔ«W¯èÏTù¤0Õ»woÙ¶-ß÷¹6\0\0 e°\0\0@JØö¡Çè¬³Î\"ICyyyêß¿¿$`\0€”\"À\0\0)aæ^\r0@]tCÜÓ„eY\nÃP–eiòäÉêİ»wt\0\0 U°\0\0@JX–%Ïó”““£ñãÇËuİT/	:TY–¥+®¸B’WÌ\0\0¤O\"\0\0 eLXÒ»woM<Y’¢ê¤†9÷®ëjúôéÊËË“D€\0\0R‹\'\0\02&éŞ½»¦OŸUa`¥†eYò}_’4hĞ \Z5J’äy×\0\0¤\0\0H3o)//OW^ye4‹°$5ÌyÏÎÎÖE]¤ÜÜÜ¯\0\0à,\0\02¶m+9£³Î:K½zõ’$º§ˆmÛ²,K]ºtÑå—_®¬¬¬è8\0\0@*ñ4\0\0RÊ„U]ºtÑùçŸ/×u¡I\n˜Š¸.]ºèâ‹/–ëº\nÃk\0\0R§\0\0R¦m-++KW]u•:uê$‰ªŸÖfY–‚ eY\Z4h\r\Z$‰j8\0\0x2\0\0)e‚ª¬¬,]yå•*((Ä¬ÖfÛ¶|ßW·nİtÕUWEÇ¹\0\0 `\0€”2•?’4bÄ]vÙeÊÉÉaç»Væ8$éì³ÏÖİwßÍ@}\0\0V°\0\0@Ê™Ä²,=ğÀ\Z=z´Â0T,KñÊÚ\"vëÖMW_}µzôè‘ê%\0\04A€\0\0RÎX¾ïküøñºôÒKÕ¡C…aHP+pGçé¢‹.Ò\'?ùIù¾Ïy\0\0i…\0\0\0¤\rÛ¶>õ©OiâÄ‰J$QkZeYÊËËÓµ×^«Áƒ3¸\0\0¤,\0\06L+ÛùçŸ¯ë®»N±XŒJ VH$ôÑ~T—\\r‰|ßOõr\0\0\0B€\0\0ÒN†ºì²Ë4uêT%‰T/§ÍsGŸüä\'5jÔ(…aHÕ\0\0H;X\0\0 ­8£ tŞyçé;îÄNx-Á¶íèo¹åMš4)úç\0\0¤,\0\0V,ËŠª€.ºè\"M›6-:N°Ò|,ËŠB¬/}éKê×¯Ÿ|ß§ú\n\0\0¤%,\0\0vlÛ–ïû\Z2dˆzè!Ù¶Í„ÍÈT¹A ;ï¼Sçw^\\q\0@:\"À\0\0iÇTåääèšk®Ñı÷ß/I\n‚@®ë¦riÏ¶í(¤ºà‚ôoÿöoêĞ¡ƒ‚ ˆÎ;\0\0@ºá)\0\0¤%Çq†¡:vì¨Ç\\W_}µlÛ&h9C¶mËó<1B<òˆFŒZT_\0€tÅÓ\0\0Hka*//OO>ù¤&O¬ ˜ÓtšLx•ŸŸ¯/|áºñÆA“yX\0\0\0éˆ\'\0\0¶ÌàvË²4iÒ$}å+_ÑğáÃåy!Öi0!Õ¿øE=ôĞCT³\0€ŒÁ\0\0ÈajÆŒºç{”••EğrŠ\\×•çyºûî»õĞC1K\0\0dü\0\0@Fğ}_999úÜç>§{ï½W‰DBYYYÌmú¶mËqy§Ë.»L<ğ€zõê%Ïó\0@Æ°Â0S½\0\0€“Ç•••¥;vèşûï×œ9s$\Zøîû~ŠW—~Ìƒ¾ï«ÿşúÃş +®¸B¾ïËq,\0\01xj\0\0#‹É÷}\r\Z4HO=õ”¦N*éPuaLSã(ù¾¯¡C‡êÑGÕe—]&Im\0\0‡\n,\0\0QÂ0T†²m[ÅÅÅúÂ¾ ·ß~[çÉ²,ñh£¨­2C\Z5J>ú¨>ûÙÏ69w\0\0\0™„§\0\0Q’«‡†\r¦^xAŸøÄ\'š|¼½s]WajêÔ©úÕ¯~¥;î¸C•W\0\0 sñ\0\02Z·nİôóŸÿ\\<òHÜ´×ö,ËRVV–‰„fÌ˜¡_ÿú×š>}:¡\0\0Èx´\0€Œ•ÜwàÀ=ûì³úá¨ÒÒRÅb±hT[gYV´Ó $İÿızè¡‡4bÄIRT^\0€ŒF€\0\02Ù°¡¡AÏ>û¬~úÓŸjÃ†\r’U$µÕG×u‚ Pvv¶î¿ÿ~}ó›ßTïŞ½Â0”ã8©^&\0\0À!À\0\0mBcc£²³³%IÏ?ÿ¼~ò“ŸhéÒ¥Qpevåk+>¶mGh’4tèPİvÛmúŞ÷¾§X,&Ïóä8íƒ\0\0 M À\0\0mFrÅÑêÕ«õÔSO©°°PP’”ñ;¹ş¼¼<7N<ğ€n½õÖè÷¤e\0\0´%X\0\0 M2sŸ\nõä“OjÁ‚Ññ¶À²,\r<X_ûÚ×tçwªsçÎ\nÃŠ+\0\0Ğ&`\0€6-C•••éõ×_×SO=¥Õ«WK’b±˜|ßÏˆ@Ë²,¹®­·cÇzè¡‡t×]wiÀ€Që$\0\0@[E€\0\0Ú¤ä\n%É÷}­Y³FsæÌÑ3Ï<£İ»wK:4ä]R´ca:<\ZY–%Û¶£<Ï“ïû²m[Ÿıìgõ™Ï|F\'NTAA¤Ck·,‹ê+\0\0Ğf`\0€6ÍS±XL’T__¯×_]ÿûßõúë¯GA–thnTò®~­Y•Z…a(Ïó¢åääèª«®ÒÕW_­k®¹FC†‘t(”3_\0\0Ğ–`\0€váÈ ëÀzå•W´dÉmÚ´I[·nÕ={š|ã8’Ôd·¿æxt2•RÉÿëû~“ÏÉËËÓĞ¡C5|øp7N·Ür‹Æ+IJ$²m;Z\0\0@[G€\0\0ÚœäÇ›#ÛêLåºnô±mÛ¶éµ×^Óœ9s´qãF•——«¼¼ü¸XÇjÕ;Ö#ÕÉ~Ñ¥KuíÚUıû÷×¥—^ª~ô£ºè¢‹¢Ÿ(¸2ß—6B\0\0Ğ`\0€v)¹ª*¹oûöízíµ×ôòË/kÉ’%ª««‹Ú	›ó±É´şY–%ÇqtöÙgë#ùˆn¹åMš4)\n¢LˆÆŒ+\0\0Ğ`\0€6Í´æ™°èdÄãq544hÿşıš7oV¯^­­[·j×®]Ú¾}»êêêùuÉ!Ó‰ª·¨Áƒ«ÿş\Z;v¬.¿ür9R¹¹¹ÊÎÎ>©uš\0.¹®‚€™X\0\0 Í!À\0\0m‚	Œâñ¸şùÏª°°PW]u•.»ì2I‡Ÿä¼ä(y¾Õ‘áO}}½ªªªTWW§úúzÕÕÕ©ªªJ{öìÑîİ»µ{÷níÙ³GÅÅÅÚ½{·\Z¨!C†¨oß¾ê×¯Ÿ ª  @¹¹¹ÊÍÍUNN:wî¬.]º4ù™\'jô}_¾ïËqœ¨•p÷îİúóŸÿ¬††}÷»ß=jF\0\0€LG€\0\0ÚÏóäº®¶mÛ¦Ûo¿]kÖ¬Ñ˜1ctá…ê‚.ĞG>òuíÚUÒá9Xãò$W6™ö¾ã©­­UEE…***TZZªòòrù¾¯ TPP nİº)??_ùùùÑÏ>–0›ì(x¼¹]’¢!ô’´hÑ\"½ñÆzï½÷ôî»ïJ’şçşGW_}uô{1è\0\0´X\0\0 ã™ğª¢¢BO=õ”~øÃ6ùøĞ¡Cuíµ×ê¢‹.Ò„	4räÈèc\'j14A–	µÌ?–eÉuİS®pJ$Q0–üÏñ~ö±ZKKKµråJ-Y²DóæÍÓ‚š|İùçŸ¯?ÿùÏ\Z>|xt^\0\0\02\0\0ÈhÉ­ıë_õÅ/~1jã3­‚ñx\\Ò¡j¤3fèÖ[oÕ¸qãÔ¯_?åææ6ù^ÒÉíäwd¨•<Ş|ä$Tàu¬5x§’’mÛ¶M³gÏÖsÏ=§;wJR¤™AóAè‘GÑ·¾õ-uîÜ9ª4\0\0ÈdX\0\0 £™€æŸÿü§¾õ­oiÁ‚²,«ÉuSåd*š$iÂ„	º÷Ş{uíµ×ªgÏÊÉÉIÕ¯p\\‰DBµµµZ°`~ÿûßëõ×_Wccã1Ã„vøÃôéOú¨\n.\0\0€LD€\0\02šïûò<O<ğ€~ÿûßË¶my÷¡_gÛ¶b±˜ºwï®›nºIwİu—&O,IQÛà©ì\\x&’+¸LµTii©}öYı¿ÿ÷ÿT\\\\U•}Ë²†¡¦L™¢ÿøÿĞ¥—^\ZU£\0\0d*,\0\0‘’wÚ{ê©§ôÄO¨¦¦&j§;H%?åææªwïŞš8q¢n¾ùfÍ˜1CYYY’UAI:æÀ÷3]¿øn~–$-Y²DÏ>û¬.\\¨’’<xğ„k?–X,&ß÷u×]wéÇ?ş±:vìØdø;\0\0@¦!À\0\0\'9¼Z´h‘¾ğ…/hãÆŠÅbQàôaLtx»$\r6L&LĞ\\ ë®»N£FŠ>ÇeÛvÔ¦w:‚ çyr\'ªŠª¬¬ÔÜ¹sUXX¨Õ«WkÕªUÑÜ®µã8ò}_zä‘GôÍo~“YX\0\0 £`\0€Œ’^UUUéöÛo×o¼<ÉaÔÉ2ÕU¦\"J’:vì¨«¯¾Z—\\r‰Î;ï<M™2%\n€Lõ”mÛ\'=˜İ|ßäiÃ†\rZ¾|¹Ş~ûm½ùæ›Ú²eKô±¬¬¬è÷9Çµ¬¬,Åãq\r6LÏ>û¬¦M›­¥5Ú\"\0\0š\0\0È(¦’(ı×ı—¾ùÍo*‘HÈuİ“š}u\"–eEa–©€’¤©S§êSŸú”¦Nª!C†¨G§ı3jjj´}ûv­^½Z/½ô’fÏ­ÆÆFI‡B§äÖÂ3‘<¿ë²Ë.Ó/¼ üü|AĞdgD\0\0€L@€\0\02†	w¤C³¢®¿şzUVVFUEÍùXcZ÷,ËŠ‚±=zè3ŸùŒn»í6=Z:th2¿êx|ßWCCƒ>øàÍš5K¿ùÍo´nİ:I‡w\r‚àŒC«#™ /\'\'GßûŞ÷ôÅ/~Q;wVÍ:Ï\0\0 ¥`\0€´pä#É±Q<ÏSVV–6lØ ‡~XsçÎ•¤f¯ÇT.åäähúôéúüç?¯k®¹F¹¹¹G…B&T‚@«V­Òoû[ıíoÓÁƒO«ÍñLÖ†¡òòò4kÖ,]|ñÅ\'5äşx\0\0H7Õ\0\0\0í“©¦\nÃP±Xì¤‚Sídv\ZlÍpÅAaª®®N………ÊÍÍÕ”)S`¶mëı÷ß×¯ıë&ÁÑÉî(x¦LV]]íDxª-„‰D\"j¯$Ğ\0\0©@€\0\0ZU†ÑÌ*×=ô(RZZª¥K—ª¼¼\\UUUª¬¬TEE…\Z\Z\Z¢à¨®®N·ß~».¹äõïß_÷Ş{¯æÏŸÒ»6ÇºMˆc‚¬O|â*((PGíğgZ]×Õ¸qã4~üx­^½ºÅÚÅu]ù¾/×uuÿı÷køğáò}_;vìĞk¯½¦µk×Êuİèçää(//OùùùÑÿ^pÁêÖ­›¤C;(&‰c\0\0\0-‰\0\0\0´\ZÚ˜JªeË–iÉ’%z÷İwµvíZUUU©¶¶V555ª­­=êëËÊÊÔ·o_=ZùÈGtÇwè÷¿ÿ½¤CóZº5ÏìTèº®>ûÙÏêÖ[o•eYÑ„Çúü tî¹çê»ßı®n»í6566¶Êü©ä\n¯áÃ‡ë¡‡R·nİdY–Ş{ï==şøãÚ¿ÿQ_—››«Î;«S§NêÒ¥‹Æ§óÏ?_S¦LÑ¹çíhv‚\0\0h\rÌÀ\0\0­\"¹ÅnõêÕzë­·4kÖ,óó“wÑ“UeeeéñÇ×—¿üe…a¨;wêšk®Ñ–-[¢j£–|´1;;V3gÎÔğáÃ%¸%ÏìšØØØ¨;ï¼SÏ?ÿ¼Â0lñÀÍ¬5??_O<ñ„¾üå/K’öïß¯¯ıëúÓŸş¤œœœ&la·2ìª«®Òu×]§K/½Tçœs$1\0\0´\Z8\0\0@‹3Õ:AèİwßÕİwß­|P………ŠÅbŠÅbrG¶mGÁ•	SÌ?¾ï«¦¦F/¾ø¢–-[¦¬¬,\r>\\÷İwŸºví*ÏójãkNãÈó<uíÚUwŞy§F…V\'j§³m;šóõİï~W#FŒˆ·¨9£+¯¼R_úÒ—¢ª©ßıîwš={¶ÇQ<orM›¤¹ãD×ç7ŞĞƒ>¨»ï¾[ï½÷^^ñßB\0@k À\0\0-*9à˜;w®n¾ùf½÷Ş{’-‰DB‰DB¾ï7	RüÇT2-Z´HÏ<óLô=|ğA]tÑEÑŸ[j6“	œ®¸â\n}ík_köœˆYmÛ\Z3fŒî¸ã(‘H´Xàæ8‰„&Mš¤/~ñ‹Q µjÕ*Íœ9Srç¸ç:944×Çüï½÷n¾ùf½şúëÑÏ#Ä\0\0-\0\0\0´˜ä0ä—¿ü¥î¼óNíÙ³GÒ©MÉ!Iaa¡~ó›ßH:Ô*÷ÀhÒ¤I\n‚ \ZßœLØ3yòdİsÏ=§ü3’×‡z(\nÜZ¢\n+90»şúë5}úôèÜıà?ĞÊ•+£ó§û½wíÚ¥;î¸C¿ıío£¡ô„X\0\0 %`\0€cª¦~ñ‹_è‰\'PYYYÔŞfª}NõûÅb1íß¿_¿úÕ¯´wï^%	]rÉ%ºæšk¢@¨¹«°Ìğöüãš>}z“Š¤S:uê¤ûî»OçœsNt~š{­çéÖ[oÕ]wİ%×u•H$ô×¿şU………ÑÏ<Õ]Íõ2×ïÀúŞ÷¾§_şò—­2@\0\0´oX\0\0 Ù™`Êu]ıå/Ñ~ô#•””(;;û´‚«äïkşY³f~úi…a¨ììlİqÇºæšk”H$š­²É„5‰DB7Üpƒn¿ıvåääœv@fÛ¶âñ¸.¿ürİ|óÍÑ±æZ«tè\r8PŸıìg5`À\0IÒ¾}ûôÿñªªªŠf‘.sş³³³µgÏ=õÔSú¿ÿû¿¨*J,\0\0Ğ°\0\0@³J0öïß¯ÿøÇÚµk—rrrÔØØxÆßßó¼¨î7¿ù–,Y¢ÆÆF9Rwß}·zõêÕ¬Õ@aªGú—ù\r:TçQ›¢mÛÊÉÉÑ-·Ü¢+¯¼ò´«¹\'İsÏ=:÷Üs%IµµµúÃş Õ«WGÁÕ™XFcc£rrr´sçNıèG?Òşıû£b\0€æF€\0\0š•i3ÃPÏ<óŒvìØ\ro.¦2ª¦¦F?úÑ´sçNIÒyç§{ï½·ÉçÉÏ0AÌ½÷Ş«‰\'6K0fZúÎ>ûl=øàƒêÔ©Ó>É»?^wÜq‡zôè¡ ´hÑ\"=ıôÓQ¥Ws†Kfı;ôÌ3Ï4¹ö\0\0\0Í‰\0\0\04›äàb÷îİúßÿı_•••IR³VE™\n¢05kÖ,Í›7O¾ï«OŸ>úÌg>£1cÆD?+9„=z´î½÷^uïŞ]a6ËxóıÏ;ï<İÿıM¯Ÿóu;wÖ~ğõíÛW’´iÓ&ıáPMM‚ höpÉ\\Ó²²2ıïÿş¯vïŞ}Œ\0\04\',\0\0Ğl|ß—eYª¬¬Œ†¬K-f$ÏÿüÏÿTaa¡$iÈ!úÁ~ :HÒi\rI7_“ŸŸ¯ïÿûÑ,©æšWåº®|ßW=tï½÷jØ°aQ¸tª›È““£o¼Q—_~¹b±˜$éÕW_ÕÌ™3[¤úÊ0ßsïŞ½úÕ¯~¥ÊÊJY–ÅPw\0\0Ğ¬°\0\0@³0A†eYÚ¾}»yæ™h zsÌ\\:×uµuëV=ÿüóÚµk—,ËÒG>ò]wİuÊÉÉQ†§<™v¼ììl]uÕUºá†dY–‚ h¶\0ËüI\Z6l˜¾ûİï*77WaràfÎï!Côï|G:teYš;w®şçş§Y[7Åœ—D\"¡gyFÛ·oo2P\0\0 9`\0€faÂ—šš\Z½ıöÛ*//o•\0#9£Ù³gë¥—^’ëºêĞ¡ƒ¾ıíokàÀò}ÿ”‚\'Çqäû¾†®G}TYYY§İŠx\"&x\nÃPŸøÄ\'tÕUW);;;úØÉp]WA¨W¯^úüç?¯#FÈó¼¨¥oıúõŠÅb-\Z \Zaª¼¼\\o¿ı¶ª««å8\0\0h6X\0\0 Yx\'IÚµk—^zé¥¨’¨¥Ã`}ğÁúÓŸş¤õë×Ë¶m7NwÜq‡òóóåûşIU6™ğª  @Ÿşô§5aÂ„h×Ãæ°¤CA•eYÊÎÎÖÃ?írx²–iÕ»ôÒKuÇwÈ÷}¹®«?ÿùÏZ°`ATMÖÒA’¹Æãè¥—^Ò®]»$¾\'\0\0\0Î\0\0h6–e©¨¨H‹/n•ªÃó<9£5kÖè‡?ü¡‰„<ÏÓ=÷Ü£+¯¼ò¤ÛM«àG?úÑ&ĞÆUQQ!©y¹ ¢¿‹.ºH3fÌPnnîIU™¶½#Fè3ŸùŒzõê%Çq´}ûvıêW¿Ò¾}ûdÛv«†HAhñâÅ*..n‘À\0\0´_X\0\0àŒ…a¨X,&Ïóôşûï«¡¡¡U3‡©±±Q………š;w®$©wïŞºõÖ[5lØ0%‰]“çy\Z4hfÌ˜¡şıûËqÅãqÍš5+\ZHß–©ˆ*//×êÕ«£c÷İwŸ®¿şú“š…eY–ÇÑ½÷Ş«ë®»N’TSS£Ç\\Û¶mköO†eYjhhĞûï¿/Ïó‹Åh#\0\0Í‚\0\0\0œ± dY––-[¦HjıŞ¦Õ¯¤¤DßıîwUVV&Iºé¦›ô¹Ï}NÒ‰w$4O_şò—uıõ×K’ªªªôç?ÿYuuuÊÉÉ‘¤f	æLVQQ¡%K–¨¸¸Xñx\\ıúõÓÍ7ß¬Áƒw?óóƒ Ğ\r7Ü k®¹F’”H$ôÎ;ïèùçŸWCCƒlÛnõ\0Í5_°`–-[U´\0\0œ),\0\0pÆLH±lÙ2-Y²$%¼“­¯^½Z¿şõ¯uàÀ¹®«o¼Q×^{mè$‡Pf¾•i¼á†äº®$i÷îİzòÉ\'Õ·o_õïßÿ¨¯=S}úôQ§Nôıï_ÕÕÕ’¤k¯½Vwß}w4ÛëXlÛV‡tß}÷iÔ¨Q’Íûö·¿­ÚÚÚè|´6S9¶dÉ-[¶LRËÏ@\0\0í\0\08cã¨ººZkÖ¬‰ªRÁ„XAè™gÑúõë†¡FŒ¡ûî»O¹¹¹Ç][nn®|ğA\r:TAèàÁƒúÙÏ~¦¢¢\"M˜0AYYYò}¿Y,S•››«±cÇêoû›æÍ›§††uìØQ7ß|³¦OŸı<ó3M0¾ò•¯èÂ/”mÛ*++ÓsÏ=U=¥²òÉ¶m544hÍš5Ñn„\0\0\0gŠ\0\0\0œ6SåcY––/_®•+W¦döÒ±Ö³oß>=óÌ3Ú¹s§²³³uñÅëóŸÿ¼‚ ˆ†º›@(Cİu×]š>}º\\×•eYZ°`şøÇ?jĞ A\Z0`@5G€e¦0Õ·o_åååé\'?ù‰¶oß.I\Z2dˆ¾öµ¯©C‡Q(g~®mÛ:ë¬³tÿı÷+77W–eéİwßÕşğ‡”T¾É¬wåÊ•Z¾|y´îT¯\0\0d6,\0\0pÆ,ËÒo¼¡Í›7KR«Ï^Jf)×uõ×¿şU3gÎTCCƒòòòôµ¯}M#FŒˆ!óÏèÑ£õÈ#(\'\'G–eiÓ¦Múİï~§ÆÆFM˜0A±X¬IˆÔÌ÷ëĞ¡ƒÎ?ÿ|-]ºTıë_U[[«:èÒK/Õm·İ&éPëºò}_ùùùúú×¿®>}úÈ¶míÛ·OşóŸUTT”a‘¹ö›7oÖo¼Án„\0\0 Y`\0€ÓfÂ	Ïó´téRUUU¥ÍÎsfgÂç{Nï¼ó,ËRŸ>}ôğÃ«k×®ò}_ç©{÷îúò—¿¬È²,%	ıßÿıŸæÌ™£.]ºhâÄ‰êĞ¡ƒ¤æe¾WNN&L˜ N:éW¿ú•^ıuIRçÎõï|GC‡mR}5}útİu×]rGAè·¿ı­şù”m?³#eUU•–.]*Ïó$5ï¹\0\0í\0\08-É!Õ¼yó´sçÎ£§’‚¾téRıùÏ–ïûÊÊÊÒ=÷Ü£iÓ¦EŸwñÅëK_úR°Ìœ9S/¾ø¢$);;[“&MjÖä\0kÒ¤IêÜ¹³öïß¯—^zI»ví’$\r\Z4Hÿò/ÿ¢¾}ûÊó<şùú×ı×è{,Z´H³fÍR\"‘H‹öAÃ¬cçÎš7oŞQÇ\0\0N\0\08-ÉaÄßÿşwíØ±CRzí:gæLııï×/~ñY–%Çqôï|G}ûöÕÀõÍo~SãÈ÷}UTTèOú“6lØ éP;\\†Ñÿ6·äïm*•fÎœ©ßıîw²,K¶më_ø‚&L˜ Ë²tÃ\r7èÜsÏfqıüç?×Š+äºnôõéÀÜ;vìĞßÿş÷è8\0\08]X\0\0à´˜\n¢ªª*-X°@Q”.|ßW,SYY™}öY)‘Hè¼óÎÓƒ>¨¯ıëš2eŠ|ß—ã8ú¯ÿú/ÍŸ??\nˆ*++õË_şRµµµÍ>œŞ;¯­­Õ/ùKUTTÈqÕÖÖêÅ_ÔÛo¿-IêÔ©“>ûÙÏê‡?ü¡n¹åÙ¶-Û¶õûßÿ^………Qp•Ná9ŸZ°`ªªª$ÑF\0\0NŸ¦ÓÓ\0\0Èf¾T\"‘Ğüùóuë­·ªªªJ®ë*‘H¤zyM¸®« ”­Ï}îsúùÏ.I:pà€b±˜ºté\"Ë²´víZİxãÚ¾}{Ôg*‰şô§?éæ›oV,‹¤3‚ P\"‘ĞK/½¤Ï|æ3ÑZM•Ø5×\\£¿üå/rG555ÊÉÉ‰†ÉïÚµK×\\s6lØ Û¶£J³t‹Åäyºté¢çŸ^—]v™b±Xtï\0\0\0œ\n\0\0À)3ÁNCCƒşú×¿ª±±1j‡K7çÉ²,Õ××ëü£,X Û¶Õ³gOåççËqÕÕÕé?øJJJdÛv´“¡Ù)ğg?û™ŠŠŠ¢0ìL™]‹ŠŠô³Ÿı,ú9æü544¨°°PûÛßäº®òóóåº®Ç‘çyúÅ/~¡7Fß/İÂ+épûecc£şú×¿ª¡¡ARzµ˜\0€ÌA€\0\0N™	LÊËËõÆoDáD:)Òáv½úúz}ï{ßÓúõë•H$äû¾êêê4{öl½øâ‹jll”¤£*š–-[¦W_}Uñx<Úıït™áòñx\\¯¾úª–-[Öd‰DB–e©ªªJ?ş¸Ö®]«x<.ß÷U__¯×_]?ÿùÏ£-]!sş\Z\Z\ZôÆo¨¼¼¼Éq\0\0€SA€\0\0NIŠÅb\nÃPK—.Õîİ»%)ª\\JG&äñ<O,ĞÃ?¬W^yEk×®ÕSO=¥/~ñ‹QõSr dB\"Izæ™gôÚk¯5©”:¾ïË²,½öÚkzæ™gú9É¶lÙ¢{î¹Gÿ÷ÿ§M›6é§?ı©î¿ÿ~544DŸŸ®ç<Ã¨Up÷îİZºt©Â0ŒÚ\0\0N…›ê\0\0€ÌbfíÚµKsçÎ§kb$¯ï7ŞĞ{ï½§ììlUVVª¦¦æ„_ëº®vîÜ©¿ÿıïºà‚TPPUuê\ZlÛVii©şş÷¿kçÎÇÜA09œZºt©¶lÙ¢:¨ªªJÕÕÕ§ô3S)ùœÏ;WS¦LÑÀ™ƒ\0\0NO\0\0à”˜ê£]»vé•W^‰§{€e˜\nªhÏ=ª©©ùĞ ÊìJøòË/ëùçŸ?í6BÓ>øüóÏëå—_–eY\'ü>f]Ô={2*¼’šŞ¯¼òŠvíÚ%Ii9+\r\0\0¤7,\0\0pÒÂ0”ëºŠÇãZ»v­<˜ê%2Såº®b±X´ãà‰˜¡ëeeezşùçµuëÖ(\\:™àÎ|eYÚºu«şy•••}èPxSå•¼ÖS­úJŒæy¹®›1\'\0\0HX\0\0à¤™\n¢;vhŞ¼yÛ<Ï‹¹Ÿì×¸®«µk×ê×¿şõiıî¶më×¿şµÖ®]{Ò;\Z†aØd­™\ZüØ¶­yóæiÇg<\0\0´?™ùÔ	\0\0RÂ„+V¬Ğ;ï¼“±aÊé0Ã×<¨ç{Në×¯—t¨ªêDç!yVÖúõëõÜsÏéàÁƒg<>Ó„a¨wŞyG+V¬$,\0\0pJ°\0\0À)[µj•öîİ+×m_ûÁ˜ÀiïŞ½zâ‰\'¢áï\'\ncÌÇjjjôÄOhïŞ½M¾W{áº®öîİ«U«V¥z)\0\0 `\0€“bæ_­Y³&ª¢iOXÒáÊD\"¡W^yEK–,‰vÔ;Ö¹0ó¶‚ Ğ’%KôÊ+¯(‘H´Ë:s~V¬X¡5kÖ0\0\0œ,\0\0pJ,X ¥K—JjŸm`&t©««ÓO<¡İ»wË²,%‰£>7‘HÈ²,íŞ½[O<ñ„êêêš|öÄÜ+K—.Õ‚R¼\Z\0\0i°\0\0ÀI³,KK–,ÑÁƒOzy[,Ë’eYZ°`^{í5ÕÖÖ5ËÌ¾ª­­Õk¯½¦D_×^Ï›ëº:xğ /^œ±»)\0€Ô À\0\0\'%CmÚ´I7n”eYr\'ÕKJ)Óø»ßıNkÖ¬Q,k2×Ê÷}Åb1­Y³F¿ûİïÛfØ8#Ë²´qãFmÚ´©İŸ\0\0pò°\0\0À	™Á¶m½øâ‹Ú¹s§Â0”çy)^Yê$Ÿ“eË–iæÌ™ªªªjRUdY–ªªª4sæL-[¶L¶m7ùÚöÈó<…a¨]»véÅ_äœ\0\0€“F€\0\0NÈ„aª°°P¥¥¥Ñ`òöÎ´¾úê«š7o^4œİ{Ÿ7oæÌ™ÓnÛdŞ—––ª°°°É½\0\0p\"X\0\0à¸L›œth÷¸-[¶H:Ô\nFèpH†Ñ¼«#™¶AÎÕ!aF­§[¶l‰v³¤½\0\0|,\0\0p\\É;îÍ=[ååå’ÚçîƒÇbB«şıû«ÿşÑ1s¼_¿~Mãğ½S^^®Ù³g·ë\0ÀÉ#À\0\0ÇeÂ†††½ôÒKª¯¯—eYM†•·g&”\Z8p †zÔÇ‡\r¦4ùÜöÎ÷}Y–¥úúz½ôÒKjhhD(\n\0\0NŒ\0\0\0“i‚@›6mÒ†\r¢™Ohªoß¾êÚµk“Áöç©k×®ê×¯_\nW–ÌL°\r6hÓ¦MÑl,ª°\0\0Àñ`\0€cò}_¶m«ªªJ³fÍ¢êêLàÒ§OŸ¨2Í´ú¾¯0Õ§OŸ&Ÿ‹Ã|ß×¬Y³TUU%Û¶¹Ç\0\0Àq`\0€c2Ëîİ»5gÎœ(\\ ˆ9,uéÒE={ö”Ô´MĞY={öT^^-rIÌ=äû¾æÌ™£İ»w79\0\0p$,\0\0p”ä]õŠŠŠ´zõjI‡BB†ÃÂ0ÔğáÃ`IR÷îİ5lØ0Î[’äûkõêÕ***’Äı\0\0\0\0\0%C9£’’-\\¸PáÉAÕ°aÃÔ½{wI’mÛM>Çó<õë×OãÇ?æ×âĞ½¶páB•””Èqî5\0\0pLX\0\0à(¦]pÃ†\rš={vº.mèĞ¡êÕ«—$59OAÈu]mÙ²Eï¼óçğæ<X–¥Ù³gkÃ†\r’Ä,\0\0pLX\0\0à˜,ËÒÚµkµeË–&•EhjÄˆêÒ¥K4ã*C…a¨¬¬,½óÎ;zê©§´yóf*¯Ã¶mmÙ²Ek×®å\0€ãâi\0\04†¡\\×ÕÁƒµ|ùòh9màÀrGçEçÊ¶m½ûî»úú×¿®ùóç+++‹Ê«ã0çlùòå:xğ \\×å\\\0€£`\0€&Ì€íyóæiÙ²e’ÄzG0K^^\n\n\n¢c&è[±b…¾ğ…/hÉ’%ŠÅbJ$„2Çaî­eË–iŞ¼yr\0\0ÇD€\0\0š0áÁâÅ‹µaÃk!¹\ZmÌ˜1êÜ¹s“ã+W®Ô§>õ©hçFÏó8\'`6Ø°aƒ/^\0\0HF€\0\0$\rlÛÖ={´víZ…a(Û¶	’˜ Ê¶m3F¹¹¹ò<OYYYZ²d‰n¿ıvmÚ´)ú\\Îİ‰%ßck×®Õ={¢™kœ;\0\0``\0€&Â0Ô[o½¥Í›7K¢}ğHÉÖğáÃÕ¡C¹®«ÂÂB}éK_ŠvÓ#¼:yæÛ¼y³Şzë-Î\0\08\n\0\0hÂ¶mÍ=[%%%²m[¾ï§zIikäÈ‘êÖ­›æÏŸ¯o}ë[Z¹r¥b±áÕ)ò}_¶m«¤¤D³gÏf×K\0\0p\0\0@$C•––jÕªUŠÇãÌ¿:¬¬,}öÙzï½÷ôo|Cï¾û®:tèÀÀöÓ`æ`Åãq­ZµJ¥¥¥œC\0\0Ğ\0\0ïû²,KAèå—_VYY™$f‹Ùm°S§NÚ²e‹xà½ÿşûÊÊÊRCCCª——±Ì½VVV¦—_~YAÈ²,*\0\0€$,\0\0 ÃáACCƒfÍš¥HbşÕ‘LÈç8,ËÒç?ÿy½÷Ş{’DåÕ2÷Ú4kÖ¬(äœ\0\0‰\0\0€vÏì\'I%%%Z´h‘‚ ëºXG0aŠïû:pà€8 Ïóš|ìxlÛ‚/-ù[´h‘JJJ$‰]0\0€$,\0\0Ú=`ÕÔÔhŞ¼yªªªŠãØÂ0ŒÚ.O&rGAÈ÷}Îë	˜sSUU¥yóæ©¦¦†\0\0\0H\"À\0 İ3¡Jyy¹{î¹è8ÕW\'fv\Z<Q¸bª®|ßWïŞ½õå/Y={öŒ>†¦’ï¹ç{NåååQX\0\0Ú7œ\0\0hÇÌ@rË²´k×.-]º”°à$}XU©Ìò}_ıúõÓ·¿ım=şøãêÖ­›$Éuİ_c¦ò}_K—.Õ®]»¢û“*,\0\0Ú7,\0\0Ú±0åº®âñ¸şùÏª®®N’šIê×¯Ÿ¾ñoèşûïWAArrr$Ñ¢y,&P•¤ºº:ıóŸÿT<—ëºœ/\0\0Ú9,\0\0Ú1Ó²µnİ:½öÚk)^MÛaÀŞ½{ë±ÇÓƒ>0#G”th×BºŸØk¯½¦uëÖI¢¥\0€ö\0\0€vÌ„›6mÒ‚ä8$ªƒÎ„:Ş«W/ıøÇ?ÖwŞ© ¢°jøğáÊËË‹>M™{Ïq-X°@›6m’D€\0@{ÇS\0\0í”i¬ªªÒòåËåy^ª—”Ñ,ËŠvìÓ§şë¿şK3fÌP,k¾Œ9R]»v¾Ççy–/_®ªª*Ú\0hç°\0\0h§Ì¼¡5kÖèwŞaîÕ°m[¶mË÷}\r8PÿùŸÿ©[o½UYYYò<¯ÉÀöáÃ‡«  @Ö‰˜ûówŞÑš5k¸?\0hç°\0\0h§Ğ¦uêL ïû\Z:t¨¾÷½ïéÓŸş´Â0ŒÂ«äàeÄˆ´ÓvIÀ\n\0\0$,\0\0Ú-Ë²ÔĞĞ U«V©ººZ±X,ÕKÊ8&T	‚@C‡Õ¿ıÛ¿é®»î’çyQ‹¦ù<éPhØ£G¨\'‹ÅT]]­U«V©¡¡Š5\0\0Ú1,\0\0ÚSÅbÛ¶Ş~ûm­_¿^C²OG†\nÃPƒÖc=¦{î¹\'ªº:Vu•ùü~ıúÉ²,ù¾O(sæ\\¿~½Ş~ûíèœR‰\0@ûC€\0@;öü#\n°|ßOñj2‹	¬ıèGºıöÛA“yWÇ†¡¨üü|yG€uæ\\¿~½şñ¤x5\0\0 •°\0\0hGÌÜ+Iª¯¯×âÅ‹ÇÚ)ÇgvÃPC‡ÕÏ~ö3İpÃ\rrçC¿Öó<Ù¶­îİ»+;;»V›Ù‚ P,S<×âÅ‹U__/IÌÃ\0 \"À\0 ò}_‹-ÒÎ;%±ŞÉJŞmpÄˆzúé§uÃ\r7(‹EáÔ±A ß÷•••¥eË–éùçŸWEE…lÛ&ˆùæŞÜ¹s§-ZD¥ \0\0í\0\0íˆ©²²m[Ï=÷œ<(éPeNÌ„M¾ïkÌ˜1úÁ~ o¼±ÉnƒÇbæ\\9£•+WêñÇ×œ9sÔĞĞ ‰yNÆÜ›ÔsÏ=…„T\0Ğ¾`\0ĞUTTháÂ…ª««£\nè$$ï\"8vìXıû¿ÿ»>ñ‰OµÛà‘‚ ã8²,KëÖ­Ó¿ıÛ¿iöìÙ²m[ãÂœ„0eÛ¶êêê´páBUTT¤zI\0\0 °\0\0h\'L˜†¡Ş~ûm•””HÖI°,KAhôèÑzì±Çtûí·Ÿp·A©ieÕºuëôÕ¯~U¯½öZôù´Â`IRII‰Ş~ûm…aH\0\0@;C€\0@;aŞì8p@¯¼òJÔÂFğáÂ0TÇõÍo~S·Ür‹|ßÿĞİÍL¬åË—ëÁTaaaô½8ç§Æœ¯††½òÊ+:pà@“ã\0\0 í#À\0 0Aeeezå•Wäy^TY„3­ƒ£G–mÛzÎÌÎï¼ó¾ñohşüùÑù§ÚíÔA Ë²äy^yå•••Iâ\\\0Ğ`\0Ğ˜öÁx<®åË—G\0N,ywÆ#F¨k×®\n‚à„»\rz§¬¬,-X°@ßıîwõæ›oğkpjÊÊÊ´|ùrÅãqÚ\0hGx’\0 ğ}_¶m«¤¤D¯¾új“`Î²,\r<Xıúõ“mÛÇ<f·A×uµxñb}ï{ßÓ¼yódÛ¶\\×%hi&–eéÕW_UII‰lÛf–\0\0í\0\0í€iµÚ¼y³Şzë­Ô.&…a¨¡C‡ªsçÎQP•,y·Á÷ß_<òˆæÏŸ/ÇqdÛ¶<ÏKÑÊÛ¦·ŞzK›7o–D!\0\0í\0\0í€©TY·nöîİ0¼ù?9–e©ÿş\nÃ0šf„a(Ë²†¡–/_®x@o¿ıv´»#áUó0÷ªeYÚ»w¯Ö­[U\0€¶¿ñ\0hã‚ ëºÚ´i“-Z”êådJIRïŞ½ÕµkWY–uTõ•	´–,Y¢ûï¿_‹/–Änƒ-mÑ¢EÚ´ií™\0\0´X\0\0´qA(C-[¶LóçÏoÌàäŒ\Z5J]ºt‘Ôt°{cc£b±˜Ş|óM}ík_ÓÒ¥K£}Ø9¶m›ê¡Ó`*ŞæÏŸ¯eË–\0ĞNğÔ\0@gª†–/_®ƒÊu]¬“`‚*Ë²4zôè(À²m;Úm0;;[¯½öšşıßÿ]K–,iòu\'bª†Â0Ô¨Q£ú™8¾0åº®<¨åË—³*\0\0´=X\0\0´q–eiÓ¦MZ³fMª—’‘,ËÒÈ‘#•ŸŸ/IQµëºš7o¾÷½ïiñâÅQEÕ‡…ƒYYYò<O}ûöÕ£>ªüã0§iÍš5Ú´iç\0€v€\0\0€6Ê)¶mkÖ¬YZ¿~½,Ë’ïû)^Yf0¡H\Z=z´:tè Ïó‹ÅdÛ¶Şyç=òÈ#Z²dI´á‡µ²Ù¶­x<®>}úè«_ıª¾óïhúôéM®>œÙ	rıúõš5kVtŞ¨,\0 írS½\0\0\0Ğ²|ß×?ÿùOíß¿_®ë`\"×u5tèĞèÏajÉ’%úÒ—¾¤5kÖÈqœ“Ãòóóõo|C_úÒ—äº®ú÷ï/Çq¸.§ C9£ıû÷ëŸÿü§|ß—ã8©^\0\0hAüg>\0\0Ú 3èZ’Ö®]«-[¶HÒIµ¸AM*Õ\r\Z¤.]ºÈ²,9£…êŞ{ïZ2ƒ øĞğÊ\\‹¬¬,ığ‡?Ô—¾ô%eeeÉ¶muïŞ]t¸²\'†aTuµeË­]»V’Ø \0\0€6Œ\0\0€6È¼‰÷}_³fÍÒîİ»%‰İÚN’	‘ÇÑèÑ££ó9{öl=ğÀQ`\"}xÛZ,“$uèĞA¿üå/õÙÏ~V999Q@–­±cÇFÖÉ1÷òîİ»5kÖ¬è|`\0Ğ6`\0Ğ†…a¨Y³f©ªªŠ6µS`B¤X,¦‘#Gªoß¾zõÕWõè£F•W\'4egg+‘H(??_?ùÉOô™Ï|F:tPM~Æ¨Q£”}ÒßŠÚ«ªª4kÖ,‚+\0\0Ú8,\0\0ÚÓ>Ö¬Y£ââbA@ûà)0!R^^.¸àÍœ9S?ş¸Ö®]{Ò»\rfgg«±±Q}ûöÕã?®»ï¾[ÙÙÙQxe*®²²²4nÜ8åää4ùÙ81ÓFŠ‹‹µfÍšèÜrŸ\0Ğö0Ä\0€6&9£ºº:Íœ9SuuuÑqœ€A uëÖé…^ĞúõëåºîIÍ¼rG\Z0`€¾şõ¯ë_şå_¢ï—¼c^†ÊÎÎÖÀåº<–*sÌ½>räHuìØ‘¡î\0\0´AT`\0ĞÆ˜7õš5k–êëë›Ç‡3çêàÁƒúÉO~¢õë×G-˜\':¦zÊ÷}õèÑC>ú¨¾ò•¯D_gÂ«äÏ¯©©Ñ¢E‹ÔĞĞ ‰N§Â\\‹úúzÍš5KM\0€¶ƒ\0\0€6Ä´U…a¨¢¢\"­\\¹R»ªä!øUUUÑ®„vÍÇsssõ£ıH_øÂ¢–ÎäğÊ„YçéÅ_Ô÷¿ÿ}UWWË¶mæ”‚äİW®\\©¢¢¢&¯\0\0Ğv`\0Ğ†˜Ö©ÒÒRÍ;7:Î›ù3s2çÏqY–¥N:éw¿û>õ©OÉqœ&!‹ù^¦BÈìjhB+*‡N]òµ™;w®JKKÙ°\0\0€6ˆ\0\0€6ÄT	íÜ¹S3gÎŒ`µ¬ììlù¾¯nİºéW¿ú•fÌ˜¡X,Öd·A£±±Q®ëêµ×^ÓÃ?¬êêj·Ÿä{{æÌ™Ú¹s§Â0$À\0 !À\0 \r1U@›6mRQQÁH+0»\r8PO=õ”>ıéO7	¯’¯çyÊÉÉÑÛo¿­Ç{L[·nU,#`l–e©¨¨H›6m’eYq\0 !À\0 ‚@®ëª¬¬LK–,¡­˜İ‡ªoûÛúüç?/éğŒ+^™]×Õ†\rôÄOhéÒ¥ÊÊÊ’çy©üÚ” ´dÉ•••E;F\0€¶\0\0€6Â´L½ûî»š?¾,Ë¢²§…ù¾¯~ıúé;ßùî¹çcî6h®eY:pà€{ì1½ùæ›r]÷¤Ããä˜aùóçÏ×»ï¾+I´\0Ğ†`\0ĞF˜ dåÊ•Z·n-T­ K—.úÉO~¢;ï¼3jL¯$EÇ«««õä“OjÖ¬YQpEÀÒ¼ÇÑºuë¢İ7	\0h;°\0\0h#²²²´gÏèÍ;ó¯Z†	¨ÇÑ]wİ¥Ë.»L’ª¼’U\0Ù¶­ºº:ıïÿş¯yæÕ××Ë²,Â«`îù•+WjÏ=ÊÊÊJñŠ\0\0@s!À\0 ‚@o¿ı¶ŞÿıèÏ™À:·m[ùùùr]7:LEUúÛßş¦E‹I:<ç*ùóÌçÎ=[=ö˜\Z\Z\ZÒºµÓœs×uUPPÍñJ×kq$sÏ¿ÿşûzûí·3æ5\0\0\0>\0\0m@†²m[óçÏ×Î;£ùJ™À?yyyš0a‚rss%¥o€%^óŞ½{õè£êõ×_W,S<>\'‘H(‹iîÜ¹úîw¿«²²²¨B+İ¬ÜÜ\\M<Y;w>*˜Kg¾ïËu]íÜ¹SóçÏ—mÛ³v\0\0pbX\0\0´ûöíÓúõë•H$2fş•	tòòò4eÊuíÚ5Å+:5YYYÚ°aƒ{ì1-]ºTÙÙÙJ$J$ÊÎÎÖ’%KôøãkãÆÊÊÊR¨Ø¶­îİ»ëüóÏW§N¢c™Àq%	­_¿^ûöíKõr\0\0@3ÉŒ\'\0\0pL¦EÊ²,Í™3G;vì”9»¯™ ­OŸ>úä\'?©òòrÕÕÕ¥xU\'/+\'\'G‹/Ö·¾õ-mİºU±XL±XLÅÅÅzôÑGµdÉegg7©ÎJwµµµ*//×\'?ùIõë×O’2&5÷ş;4gÎœ¨ªŒvB\0\02\0\0mÄÜ¹sµgÏh>S&4h>ò‘¨¾¾^çIJß6»#Åãq9£yóæé«_ıªªªªTUU¥‡zHóçÏ*‚29ç‰DBuuuúÈG>¢¤xU§ÆÌÛ³gæÎ›êå\0\0€fB€\0@†2s¯$iÏ=Z¶l™‚ ëº`Ù¶­D\"!×uuÑE©k×®ªªª’”Şó¯”Ü¸páB}ñ‹_Ô}÷İ×d¸{&\\#UUU©Gš6mZt­2¡0ù5°lÙ2íÙ³G’˜‡\0@†Kÿ§\0\0pLæÍxCCƒæÌ™£òòò&ÇÓã8²,KcÇÕ7Ş¨x<®ÊÊJIJëúÅTúÛßş¦_|QM>–)LHUYY©x<®n¸AcÆŒ‘eYÓFhîòòrÍ™3G\r\r\rM\0€ÌC€\0@†ò}_aª±±QÏ=÷\\4;*SR?^cÆŒQ]]]FV`ÉqÏDaFç¾²²Rõõõ:çœs4~üø&Kwæ5PWW§ç{N\nÃ0cfÃ\0€£`\0Lû eYÚ¹s§Ş}÷]y\'Û¶3\"À²,K¾ï«  @“&M’ëºª­­‚ŸL	JÅ¶íŒhµ;sîëëëÇ‹Å4qâDåççË÷ıŒ¸6AÈ¶my§wß}W;wî”eY´\0Á2÷é\n\0€v,9£ÆÆF-\\¸PÕÕÕ’2\'ø±m[¾ïkêÔ©ºüòË†¡jjjR½¬fAF„ˆ&CÕÕÕ)C]zé¥:ï¼óäû~Æ„sæµP]]­…ª±±Qã´‰k\0@{”O \0\0 	Ó\nµsçN½üòËQ¨ioÎ/¼ğBsÎ9’Ô$À¢J&uÌ¹ÃPÕÕÕ²,K“&MÒÅ_œâ•\ZóZ°m[/¿ü²vîÜ)I´\0¡°\0\0È`;wîTaaaôf=S‚Ÿ Ô³gOM˜0A’äyªªª2fıíA†ªªªŠª®&Nœ¨‚‚‚Œ	IÍ½\n£\0\0\0d&,\0\02LŠÅbª®®ÖâÅ‹£ã™Ğ>hÖhY–®¹æ\Z3FÒ¡ß‰\0+½„a¨ÊÊÊ(°\Z3fŒ®¹æš&×0İ%¯qñâÅª®®V,Ë˜\0\0F€\0@†1o¾7nÜ¨×_=:IáOºá†Ô¿I‡ÛÕ2éwh’¯ÉÀuã7fTø“|?½şúëÚ¸q£¤Ìkµ\0\0X\0\0dœ dY–V­Z¥åË—ËqœT/é¤X–¥0eY–†ª±cÇ*‹I:4—¨ªª*ú\\‚¬ÔI>÷¦…P’b±˜Î:ë,\r<¸ÉµÌãhùòåZµj•,Ë\"À\0 `\0aÇQMMV¯^­ÚÚÚŒÙÎ¬Ó²,İzë­êÙ³g–$‰&RÏÌÀJ$ÑŸ{õê¥[n¹%º–™tïÕÖÖjõêÕª©©É˜Ğ\0\0–O\0\0@Ò¡Áq-[¶Lï¾û®,ËÊ¸]Õrssuıõ×«k×®Q€åy-„iÆ´uzı¹  @7Şx£:tèâÕ\Zß÷eY–Ş}÷]-[¶Lãp¯\0a°\0\0È æM÷Â…µbÅ\n…a˜oÄ“ƒ¶³Î:KãÇ—$ÅãqI‡¬ÊÊÊŒø]Ú“ªªª(À2×jâÄ‰\Z5j”¤ÃÁPº3¯“+VháÂ…Ñ1\0\09°\0\0È –e)‘Hèı÷ßW<WvvvF¼7-[İºuÓÍ7ß¬œœI‡w‰K$ª®®NÙúp4ÓBh,Ó.˜““£›nºI]»v•¤ŒhÇÃPÙÙÙŠÇãzÿı÷•H$2\"x\0\0‡`\0LH†¡,X âââ&ÇÓ	?ºuë¦O}êSGÍP23°’O¤Fò5HeÇqtûí·«[·n’2g–ù½Š‹‹µ`Áî5\0\02Lf<q\0\0ĞÎ™7Ù¶mkæÌ™Ú±c‡,ËŠªcÒ™it]WãÇ×€¢]ìZÓSr–¤hçÁ!C†hÜ¸qr\'cÚ=Ï“eYÚ±c‡fÎœoÜs\0\0d,\0\02€	ª««µtéRÕÖÖÊqAâ•}8×uåû¾úöí«ë¯¿¾I`päw¤—ä!îÉÂ0Ôµ×^«Ş½{Ë÷ıŒ¨Â\n‚@ã¨¶¶VK—.î·Lß\0\0\0\0\0iÏT½A E‹iïŞ½²,+cŞx›u;VW\\qÅ1?‡\0+ıÙBxd¥ÒUW]¥³Î:KRæ´š×ÍŞ½{µhÑ\"ApT5 \0\0HO™ñ´\0@;fª¬\Z\Z\Z4sæL•——+ÃŒ¨¾2Á›mÛ\Z?~¼úöí­;98ğ<OUUU©\\*áÈBFA êœsÎ‘mÛ\0A 0U^^®™3gª¡¡!:\0\0Ò\0\0iÎ„ÕÕÕš3g\Z\Z\ZdÛ¶|ßOñÊ>œ™5aÂMŸ>=:v¤D\"¡ÊÊÊèÏ™ˆ´EÉç¾²²ò˜Xæ\Z^|ñÅ\Z7n\\Æ´šu644hÎœ9QÕ÷\0\0é/ıŸ4\0\0hÇÌÜx<®wŞyG|ğ¤Ì™Ûcªs.¼ğBMŸ>=ªÆ:’ïûM*³Zæ\Z444s–©¬»âŠ+4mÚ4…a˜–tøwûàƒôÎ;ï(gÌ<9\0\0Ú³ÌxÒ\0\0 2UVeeezùå—£?gJÅHÊÍÍÕ¤I“”››{TÕ˜	êêêR±<|ˆ0Ç:n*ë:vì¨É“\'+\'\'\'c óÚñ}_/¿ü²ÊÊÊ¢?\0€ôE€\0@š³,K%%%*,,ŒŞ|§{X`‚©0uî¹çjüøñÇİLÕÜÓ—	Ua†¡Æ¯I“&E×7İ+èÌk\'Cª¤¤$í×\0\0°\0\0H[¦-+‘HhíÚµ*))‰v$Ìaê†nĞˆ#†¡Çiò1ŠÔÔÔ¤j‰ø&\\<rX»ã8\nÃP#FŒĞ\r7Ü1UÒá\rJJJ´víZ%‰Œ\ZF\0@{D€\0@š2ó¯¶oß®¹sçf\\p%IYYYºà‚Ô©S\'ywT	\r°Ò—¹6Çºvç)//OÓ¦MS,“”9í­Ò¡ kîÜ¹Ú¾};s°\0\0HsX\0\0¤)ß÷†¡Ö¯_¯×_=:î	:lÛÖ7Ş¨49n˜ß£¡¡\0+UWW+‘HDUKÉÌ58p ®»îº(dM÷îÉ¿Çë¯¿®õë×+Cæ`\0ÆÒûé\0€vÊ´ÛY–¥5kÖèàÁƒMÚïÒ™eYQqë­·ªoß¾’tÔúMˆĞØØÈ¬4VSS£ÆÆÆc~ÌUıúõÓŒ3dÛv“ëŸîÇÑÁƒµfÍ\ZY–µE\0€ôC€\0@\Z2ó¡6nÜ¨eË–EÇ2A\nÃPÔÔ©Så8|ß?n¨ÑØØHV\Z«®®VCCƒ¤£ïA³¡ëººè¢‹Ô·o_…a˜1­xæ÷Y¶l™6nÜÈ,\0\0Ò\0\0iÈkë­·´dÉÙ¶¡€	\0rrrtÕUW©{÷î\nÃğ„¡\0Vz;Q–i+ÃP=zôĞå—_®ììì&úÓY²m[K–,Ñ[o½uÌ6I\0\0ÒÿÉ\0€vÈ²,%	­X±B|ğAÆ´šuæççëSŸú”\\×Z³‡XéíD–¤¨ÕÕu]}úÓŸV~~~t<8£>ø@+V¬ˆf}\0€ôC€\0@\Z2íƒëÖ­‹f\neBeˆ©4h.¾øb¹®;ÖçJÌÀJwÕÕÕQ€u¬{ĞÜ›±XL—^zi4´?“îWË²´nİº¨\0\0¤ş†\0 $¿éŸ;w®6mÚ”1»£9#Ïó”ŸŸ¯}ìcr]÷„ŸŸ¼!Vúª©©‰f`¹–±XLW_}µòòòäy^FTa™İ>7mÚ¤¹sçFÇ3!€\0 =!À\0 Mª¬¬L®ëfL€eY–†ª›nºé¤¿îÈ\0‹à õ’¯Á‰†¸Év7ß|³†ú¡­£éÂ¡/++Saaaª—\0\0ƒ\0\0€4aÚ™‚ ĞÊ•+µuëÖŒ†mÖ†¡Î:ë,;6\Z:¼™BÉ-„ÌÀJ_555ŠÇã\'üsƒ Ğ¸qãtÖYgE»fÂL)³ùÀÖ­[µråÊhİ„©\0\0¤ô\"\0 0Oš9s¦JKK›Og–eÉ÷}õîİ[Ó¦MûĞöÁd\r\r\rª­­mÁÕáLÔÖÖpÖ‘b±˜¦Nª={fL€e^c¥¥¥š9sf“×\"\0\0HX\0\0¤™úúzÍ;WUUUQ0”îLË\\ +®¸â”‚‹ÆÆÆèwEúIn!ü0¦ïÊ+¯Ô”)SAFTú¾/Ë²TUU¥¹sçª¾¾>ÕK\0\0GHÿ\'\n\0\0ÚÓ*†¡6nÜ¨õë×K:4W*SÚ˜lÛÖäÉ“5|øğ(8ó{ÅãqÕÕÕ`¥!Ë²šìBx2Ÿïû¾F\Z¥sÏ=7#Â+éĞ½hæu­_¿^7nlòš\0\0©—O\0\0´q¦b©ªªJ/¿ü²‰Dt<x§áÃ‡kâÄ‰§üµ\r\r\r\'x¡õÙ¶­†††â~,“&MÒàÁƒåy^K-¯Y™×Z\"‘ĞË/¿UfÊk\0€¶\0\0€4àû¾Â0ÔôÒK/EC³Ó½úÃ„N–eéê«¯Öyç\'I\'µû\\òwIS­Ó˜ë{²-„Òákî¹çêê«¯®kº”É/½ô’8 03¢…\0€ö€\'E\0\0R,C¹®+Ë²´qãFmŞ¼Y’2b4³¾0uÙe—©{÷îJ$\'F™@ƒyCéË\\£“m!”‘‰DB½zõÒå—_U0eÂ½l~ßÍ›7kãÆ²,K®ë¦ıÚ\0h°\0\0H13èúÀzë­·2®eÉ²,?^£F:¥ĞÍ„\\uuu’Ò?àhÏLÈx²UT&\Z5j”Î:ë¬Œ«®‚@o½õ–8 Û¶3î5	\0@[”YO\0\0´A¦EiÓ¦Mš={vÆ¼Ù7ëÃP·ß~»úöíU“Ê×S•¾L¨hBÆ“½7Íæıû÷×í·ß@™toÏ=[›6m’$Ú\0H™ñ\0@gvÜ¸qc“céÌTãtèĞAW^y¥òóó›´aˆÙáÍì@ˆôV__íÔw2÷¥Ù½¯k×®ºòÊ+•-)sæ`IŠ^éş:\0 ½ À\0 …‚ PVV–öíÛ§Å‹§ı|Ã¶íhçÀK.¹Dƒ\r’tx7Å“aY–jjjT[[Û’KE3¨­­Ummí)][Su5tèP]xá…’”Q»MZ–¥Å‹kß¾}ÊÊÊ¢\0€#À\0 …Â0T†Zºt©-Zı9İ™V°¼¼<Í˜1C]ºtirüdÕÕÕ1+%·j¥œ¹ºté¢3f(??_ÒÉíP™jæu¸hÑ\"-]º4c^—\0\0´eX\0\0¤i¹[¶l™Š‹‹‹Å2â²©¢)((ĞÇ?şq¹®\r£?µµµÌÀÊ\0uuu§\\)g†ŸÇb1İ|óÍQ€•	Xa*‹©¸¸XË–-ËˆA\0hë°\0\0H!Û¶µgÏ­]»VçeÄ›{Ë²äû¾:tè .¸@İ»w?åuŸIeZß™TÊY–¥^½ziÊ”)ÊÉÉÉ˜6BË²äyÖ®]«={ödÌ\0z\0\0Ú*ş&\0 …lÛÖ›o¾©Õ«WKRFÌÙ1ÕV½{÷Ö\'?ùÉ3Z3Vf8Óë†¡n»í6õêÕë”vªL%s_¯^½Zo¾ù&\0\0)ÆßÄ\0\0¤@rË›o¾©;vD•M™bøğáš>}zôÆştªjêêê¢BZ´ÒOr¥ÜéÛ7÷„eYºôÒK5lØ°Œ¹Î¦RlÇzóÍ7£ã™²~\0\0Ú\Z,\0\0RÀ¼±/--ª¯2aş•i«ŠÅb:ÿüóÕ¹sgI‡gy**°2C}}ıi]§äÙQ]»vÕyç\'Çq2¢]ÖÌÁ’Ua•––JÊŒ^\0\0´EX\0\0´2Óš^yåíİ»WafDû ã8\nÃP“\'OÖUW]?İ7õµµµXàL‚Æä{ãª«®ÒäÉ“†aFìFÂ0ÔŞ½{õÊ+¯4yí\0€ÖE€\0@+Ã0ªJ™9s¦JKKeYVF¼)6aÄ¹ç«©S§vË£ùı“¬t¯>kÏÎdˆ»áû¾.ºè\"M<Y’2b¦T²,K¥¥¥š9s¦¤¦¯_\0\0ĞzÒÿÉ\0€6Æ¶mY–¥íÛ·kÅŠò}_¶m§}€eftuïŞ]&LPvvö¯ùtg+¡u˜ ¦¾¾şŒ¯SÊÎÎÖ„	Ôµk×ŒØ0Ù¶-ß÷µbÅ\nmß¾]–eeDø\0@[Ãß¾\0\0´\"SÑÑĞĞ ÂÂBUTTÈ²¬´#oA iÓ¦é‚.P†güFŞqÏ”ß¿½jVOÛ¶†¡.¸à‚3ªŞkmæõYQQ¡ÂÂB544dLÅ$\0\0m	\0\0­È¼i¯¬¬Ô/¼ D\"¡03æÍ¼$]~ùå\Z5jT³Xµµµò<Š–4fÛ¶\Z\Z\ZÎ¸ËX£GÖ•W^ÙL«ky¾ï+C%	½ğÂª¬¬Œ\0€ÖÃÓ\"\0\0)°wï^-\\¸0Ú-SfêhÂ„	²m[‰DâŒ+§LU	7~Ìµ9Ó\n,Ë²”H$‹Å4iÒ$ååå5Ó\n[–ÙaÓó<-\\¸P{÷îMõ’\0\0h—°\0\0h%¾ï+‹©¦¦FóæÍS<—tú;øµ³¾0uóÍ7kèĞ¡²,ëŒv‘3aUr€…ô“\\eg*°Î$h4÷ÌĞ¡CuÓM7Eß+S^ñx\\óæÍSMMb±UX\0\0´\"\0h%¦iûöíš3gNt<İ+’Ã…›nºI}ûöUg`™ïÙĞĞpÔÏ@z1V}}ı/Çq†¡úõë§›nº):î×?ù5:gÎmß¾=ãZ\0ÈtX\0\0´\"Ë²TTT¤¥K—FÁ@:X¦½Ñ²,=ZcÇ•ã8Ñ0ú3ù¾’ÔØØ()½ÏA{g®Ms„f\'KÇqtöÙgkøğáÑÏHçËœÛ¶µtéR¥õz\0h‹°\0\0haÊu]UUUiÅŠg<O¨µ˜ùGYYYºé¦›Ô­[7IÍS1“H$¢\0é/Ÿqp™¬GºñÆ•••Õ,´–ºº:­X±BUUUr]—ğ\0€V’O\n\0\0d8ß÷eÛ¶Ö®]«yóæeÌàvVtîÜY7ß|³:vìØ,aƒeYª®®&ÀÊ ñx<ªÂ:¦°cÇš1c†:uê$)ıÛ¥Ã•bóæÍÓÚµkeÛ6m„\0\0´,\0\0Z	«–/_®÷Ş{/#,Ë²lÛÖÈ‘#5~üxÙ¶İ,U8&À2ƒìÓı\\´gæÚ466ª²²²Y®½¹¯&O¬áÃ‡GÇÒ=Ä2Ö{ï½§åË—GÇ\0\0@Ë#À\0 8#ß÷µråJ566ÊuİT/éC™YWİºuÓŒ3¢¡íg2$¿ÙO®À\"H\r\r\rª©©i–É|ÇqtË-·¨   \nµÒëºjllÔÊ•+£y^\0\0 å¥ÿS\0\0m€eYzë­·´jÕ*IR)^Ñ‡sG–e©oß¾úÄ\'>…ÍU%S]]İ,-ihYÉXÕÕÕG?æ²m[ŸøÄ\'Ô·o_Y–•ayí®ZµJo½õVÚW\0ĞV`\0Ğ‚Ì›|Ë²ôüCëÖ­Ëˆ¹9–e)‘HH’&L˜ şıûKjŞİâ¨ÀÊ,ª©©i–ï•ÜB;dÈsÎ9\nÃPç¥} dæÙ­[·NÿøÇ?¢õr\0Ğ²°\0\0hUUUZ¹r¥êëë£!ÖéÌ´<XW]uU‹üŒäXH_æ^Çãªªªj‘Ÿqå•WjàÀ\n‚ í«°Â0”ã8ª¯¯×Ê•+[ìœ\0\0€¦°\0\0h!ÉÕJK—.Õ¶mÛdYVÚW˜HŠÚ\'Nœ¨K/½4j›jÎµ×ÖÖ`eæ¬À’ßKAèŠ+®ĞÄ‰%)#æ`™×ñ¶mÛ´téÒèXºÓ\0\0d²ôB\0\0 C%¿™}é¥—TRR\"Iò</UK:iA(‹éœsÎQ¿~ıZdfWò,Şø§¿x<Ş¬– sÎ9G®ëfÄ½`^Ã%%%zé¥—¢ã™°v\0\02\0\0-¬¶¶Vo½õ–jkk£Ö¼tfY–<ÏÓøñã5mÚ´èXs£…03oˆ{s1÷Ö´iÓtöÙg+‘H¤}•¢iuL~m\0€–E€\0@‚@¶mËó<Í›7O|ğAª—tÒL×ôéÓuÑE)Ãiëbˆ{fiîBÃÜ[]t‘.½ôÒŒi³5>øàÍ›7OçÉ¶í´¨\0ÈTX\0\0´€ †¡jjjôòË/G•+™Ô„a¨ììlM™2E:th±á’,¤¯ä\n¬–XnY–âñ¸:uê¤©S§fÄ&ÒáóR]]­—_~Y555\nÃ\0\0€B€\0@±,Kåååzíµ×¢¶¨t~s›R]pÁ\Z;vl‹ş¼êêj%	I™ìµw-ÕB˜lÌ˜1:ÿüó£{1+±‚ eYJ$zíµ×T^^Öë\0 Ó`\0ĞÌLû`<×òåË£áí™²KYš1c†Íúi	¦b%vkï,Ë’ïû-ÒB(I®ë*\r<X·ŞzkZ½Fò.£%%%Z¾|¹âñ8m„\0\0´\0hf¾ïË¶míß¿_/¾øbÆ4;vÔ´iÓÔ¹sgù¾ß¬U%É©æi©€Í#9dl©\n,uéÒEÓ¦MSnnn‹üœ–bÛ¶^|ñEíß¿_¶mË÷ıT/	\0€6\'³¨\0È\0&¤Ù±c‡\n£jŒt®¾²m;\n*®¿şzõéÓ\'úXKµE™0$S*ÓÚ«ãXÍyÍ’ï±şıûëcûX“{2]™s\nµcÇ&Ç\0@óIß\'\0\02P†ŠÅb’¤U«V©´´TRú‡4&$ÈÉÉÑŒ3Ô£GIÍ_•T444uéÉÜµµµ-ö3Ì½Ö£GÍ˜1C999’ÒûşHn#,--ÕªU«$I±X,­_ï\0\0d\",\0\0š‘©¶Ú¸q£,XOç7³ÉÃåûöí«K/½TãD­Íı³¤CámV™\'‘HD÷JsK¦õÎu]]qÅêÙ³§¤¦!Q:J~m/X°@7n”$æ`\0ĞÌ°\0\0hFffÔŠ+ôæ›ofÄ|\'3tºS§NºòÊ+•ŸŸß\"?\'ù~UU•<Ï;ê8Ò“¹FçEUX-YUXPP +®¸B;vŒ6EHwãèÍ7ßÔŠ+¢™^\0\0 ù¤ÿÓ\0\0\0Ä¶m%	­]»VeeeóÆ[:\ZÜqÇÑñ–\\{eee`!sx§ŠŠŠûşÉ÷ÜwÜ¡‚‚I™1èß¶m•••iíÚµJ$ñÚ\0 “ğ7+\0\0ÍÈu]mŞ¼Yï¿ÿ~4„:İ™5:TS¦L‰Â‚–lÛª®®¦B%ù¾ßb;J‡ï9ÇqtÁhÈ!’2£JÏœÿı÷µyóf¹®›ê%\0Ğ¦`\0ĞLÌ›ìyóæiåÊ•\nÃ0íçà˜Š±üü|]qÅQÕHKaÒB˜a’[«ªªZågÅb1]~ùåêÜ¹sFT4A 0µråJÍ›7O÷6\0\0Í)½Ÿ\0\0È@‹/Öşıû‹ÅÒ>À2ÕVgŸ}¶®»îº¨¦%ª¯Ì›ù#,d`µÆ}mY–®½öZ}öÙ’Ò¿0Åb1íß¿_‹/Nõr\0\0hs°\0\08CÉUË—/×–-[R¸šSc‚ªqãÆiÜ¸q­*…aØdU*éÏ\\#ß÷UYYÙ$Œlnæô}_&LĞ¸qãšÏ[¶lÑòåË£?s\0pæ°\0\08CæÍ©eYš3gŠ‹‹%)íg<Y–%Ïó4`À\0wŞyr§UB*°2—©Àj­@Æu]wŞyê×¯Ÿ<ÏKûË¼æ‹‹‹5gÎœh½X\0\0œ9,\0\0Îy“êy\nUQQ!Çq2¢}0]xá…ºâŠ+A«Ì\n‚@UUUiğáh­1Ë°m[AèÊ+¯ÔÔ©SAF´:£ŠŠ\nF!mºo\0\0d,\0\0Î@²,KAhİºuÚ¼y³,Ë’ã8i_uavM›2eŠØª[ò.„é~Ğ´…°ºººÕ®Y\Z<x°¦NÚdé*Ã¨’qóæÍZ·n]“G\0\0€ÓG€\0À0o¨‰„^xáÕÔÔ(ÃŒhó}_C‡Õøñã£[²R$ynRuuµ‰D‹ı,´ŒD\"Ñ$ÀjÉ@É„>ajÂ„	\Z4hPFTíy§0USS£^x!ºÏÓ=|\0 İ`\0pÌ›Òšš\ZÍ=[ÕÕÕM§£äêúë¯×Ø±c£ª±Ö`†¸S•97Ä½¥™j¦³Î:K7ÜpCt<[òÌ¹©®®ÖìÙ³USSÓä8\0\08=X\0\0œ¦ä™<k×®Õ†\r$)#Ú«¯¾Z={öT\"‘hÕ\0‹!î™ÉÌÀj­v8Çqäyz÷î­}ìc­ò3Ï”i#”¤\r6híÚµ’”sñ\0\0HgX\0\0œ¦0eY–ÊÊÊôüCñx<ÕKúP–eE³¯Î=÷\\\r6¬ÕªY’ÛÎ*++£7ó™öµgÇ«ÀjkgZ[‡®	&È¶íèµ—îâñ¸şñ¨¬¬,zí\0€ÓC€\0Ài2-pûöíÓ/¼½¡Nç*‹ä]?ùÉOªwïŞGoif2©kMæŞìÓ§n»í¶£§#óï\0Ë²ôÂ/hß¾}’”3¼\0\0HWéû7?\0\0iÎ¶mA Í›7«¨¨¨U«RN—Y[—.]ô‘|D:uŠ*²Zs\r&IçÇV]]İª!­iÉíÔ©“>úÑªsçÎ’2ãu†¡ŠŠŠ´yófAÀı\0ÀàoQ\0\0Nƒïûr]W¥¥¥š?~ôÆ4ÛšÌ®n¶mkÊ”)\Z6l˜Â0”ïû­ºîä\0‹¶ªÌaîñÖ®À²,K¾ï+C1B“&MŠÂãt½I‡ÎÛüùóUZZ*×u©Â\0à4`\0p\ZLÊÚµkUXX˜óœÌ`é‚‚İzë­ŠÅb²,«Õ«Bâñ¸êëë%¥wà‡Ã’«ôª««[ı>·m[–e)++K·İv›ºví*I­¶ñÀé0ç(FÃÜÓ¹Å\0€tF€\0ÀX»v­6mÚ$×uS½”eÂ¢^½zé¦›nR,kµöÁT h>ç©¶¶VRëfp{,Ó-·Ü¢=zDÇÓëºÚ´iS`\0€Ó“şë\0fÂ0”ëºª¨¨ĞÆ3¢¢Â¶my§:hêÔ©QKk¯A:Ô‚F€•¹RİÚ½{wM™2EÙÙÙò</#B¬ ´qãFUTTÈu]î\0\0NCúÿ\0@š	ÃP–e©¨¨HÅÅÅ1ÇÉ´Z\r0@7İtS«¯7ùçµö%4¯tÂÿñ\\P†iİF(ş÷Eqq±ŠŠŠ2âß\0\0¤#,\0\0NÓºuë´qãF…a˜UXajÌ˜1ºè¢‹Rº†ªªªŒ8_8¶ R\ZB†a¨K.¹D£GÂ¡tÂ0ÔÆµnİºT/\0€ŒE€\0À)2ÕEEEÚµkWÚ·0™]Ü²³³5iÒ$åååE¿Ck¿ù÷<O•••ÑÏ§%sYEgvÓk­khîÕ0UPP ‰\'*;;»ÕwÑ<¶mk×®]Ú²e‹$î{\0\0NGz?q\0Æöïß/IÑ0ôteÛ¶‚ ĞùçŸ¯Ë/¿<¥U+¾ï3+Ã…a¨ÊÊÊ(Àjm¦ïòË/×äÉ“åû~Z‡Èff$}ğÁ)^\r\0\0™+}ÿ¶\0 Í566Jjı*¦SeŞÜO:U\\pAJ*VL`åyV†‚@•••ò<ORëWY–¥ tñÅkêÔ©’Ò7B³¾D\"‘â•\0\0¹Òûo{\0\0ÒXª*PN•çyêÖ­›&Nœ(ÇqR\Z™\0ËÌÀ\"ÈÊÉmŸÕÕÕQ€•\nAÈqMš4I]»vMéZNE¦ü;\0€tD€\0À)2ÕKñx\\Rú†0f–eéâ‹/Ö¤I“$¥¦ZÅœ#ZÛ†TÌÀJfÚ\'Nœ¨/¼°É½Î2%h\0 `\0pš²²²R½„“®¹æ\Z\r2$åó‚L2—Ù…0•aŒã8\n‚@C‡Õ5×\\“ö»Zš/Sş\0@:\"À\0à™7£=zô¤´}ól†µwëÖM&LPVVVÊwló}_ÕÕÕT`e0ÓB˜Êv8³³fNNN´³¦©ÊJGæugş\0\0N\0\0§©OŸ>êĞ¡ƒ‰DÚµ.™*«0uë­·ªÿşM·¶äÂÊÊÊ&ó”YÂ0Ly¡tø^îß¿¿fÌ˜­#İ^‹–eÉó<åææªwïŞ©^\0\0‹\0\0€SdŞ ÷íÛ7zCšoš¥Coòoºé¦hã¤rYJ$M†¸#s$‡•••)ßQÏÜË}ûöÕÍ7ßZé¶#¡y-öêÕ+mÿ}\0@&H¯¿á\0È\0æÍçYg¥‘#GÊ¶í´{Cj¢±cÇjÜ¸qQËUªÖyäwd.`¥º+ù8q¢F)éĞ½ŸN¯GË²dÛ¶F©±cÇFÇ\0\0À©!À\0à™– Ñ£GkÒ¤Ii÷†ÙT¦äææê†nP~~~j”Äó<UWW§z8C©u¤‚‚]ıõÊÍÍ•”^UX–e)Mœ8Q£G–çyiõï\0\02Eúüí\0@ñ}_:tĞ¸qã”———êå4a†Y÷èÑCŸşô§•••¥0ÓâM½çyª¨¨Hõ2p†R½¡aÛ¶Â0”ëººã;Ô­[·hó‚t’——§qãÆ©C‡iü\0IRÿ$\0@rGajâÄ‰ºôÒKÓâÍ¼tè\r}ÊÎÎÖ…^¨±cÇFoòSù¦>¹…°®®N’Òz×8-ùZUWW§Å=oî!Çq4nÜ8M›6-­[éPh{é¥—jâÄ‰ÑZ\0À©K¿Ù\0È0æMèèÑ£uË-·Èu]I©Ÿmã8‚ Ğ!Ct÷İwG³°R½.#§ínqøpæš566FVªCH³¦ ôùÏ^C†‘ïû)ŠÌºb±˜fÌ˜¡Ñ£GKJıF\n\0\0d*,\0\0Nƒ™ƒ%I_|±®½öÚ¨\Z$UÁLrEÓäÉ“uÙe—EkIuõ•yÓÎ\0÷Ì–|%WÒ¥Rò=~ÕUWiòäÉG}¬µ%W=Şxãºä’K$)¥)\0\0é°\0\08M¦ÚiàÀúú×¿®X,&Û¶SÖº‹Åäy¦OŸ®‡~X–e¥Í›esNjjjR¼4s-MX“jæ~ÿêW¿ª‹/¾X‰D\"ªŒLÕZrssõõ¯]H‹ª0\0\02\0\0§É„2¶mkÊ”)úæ7¿)éP+S,kÕµ8#ß÷5xğ`İ{ï½š8qbZÌ(’Ô¤*-9ÀJ‡Ğ§æÈ9XRzíøçyÎ=÷\\İ{ï½\Z8p`JB£¬¬,ù¾/×uõío[ç{nh¥K \0@&JŸ\'\0\02iÛ‹ÅbzğÁuçwÊu]y§¬¬¬Vùù&¼ò}_÷Ş{¯®¹æ\Zù¾ŸVÁ‚eYò}?\n=ùª««AZİg¶mË÷}]wİuºï¾ûAbµFx”••¥x<®œœİwß}ºÿşû£\rÒé<\0‰ø›\0€3`Ş‡a¨îİ»ë[ßú–n¸áI‡–·ägÛ¶£`¨cÇºç{t×]w)???í‚éĞàoZÛÚÚZ%	IéSMgváÌÏÏ×ç>÷9}á_PÇ£ÙS-õš0Ar<W,Ó\'>ñ	=úè£êÜ¹sÚœ\0\02]j\0\0Ğ†˜€Ê÷}\r6LßúÖ·^ıuÕÖÖFŸÓœod-ËŠvìÚµ«î¸ãıÇü‡rssåy^«·0ˆù½\Z\ZâŞ†TVVª±±QÙÙÙ©^Jf\\Ÿ>}ô³ŸıL¹¹¹zöÙgU^^.©e^‹aÊ÷}uêÔIÿøÇõïÿşïêÓ§s¯\0\0hFéõŸf\0È`f¨ûÄ‰õÛßşV?üpÔFØÜU¦’¤Gzä‘Gô“ŸüD¹¹¹\n‚ eƒ«Çüî555Ú¿ŠWƒæ²ÿş¨¢.İªŒ\\×UêĞ¡ƒ~úiıë¿ş«zöì)©ùgv™ß=\'\'G>ú¨şû¿ÿ[#GT„W\0\04#,\0\0š‘ysÜ­[7=òÈ#zé¥—töÙgGÅbr]7jÿ;¦=)‹Eoˆ}ß×Í7ß¬™3gê+_ùJ“òéÆ¼Á?xğ ¶nİšâÕ ¹lİºU”¤¨\Z0$¿&xàÍœ9S7ß|³|ß—¤&¯©“}-Ú¶-Çqäºn“*ÇqãÆé¥—^ÒC=¤¼¼¼&?\0\04ôúO´\0\0´&°ÉÍÍÕµ×^«şıûkáÂ…zî¹çôÎ;ï4ùÜ¬¬¬c¶4™7ÔA(‘HDCÚ%éÊ+¯ÔwÜ¡‹/¾XC†‰>/]ß0\'XEEEGGæH¾fÅÅÅQ€•Î×ÒTbM›6M}úôÑ\r7Ü gŸ}Vo¾ùfôš’…Ëæ5”üû$Ï¹‹ÇãM¾÷¥—^ª[n¹E_|±ÆßäkÙq\0€æE€\0@33o\\=Ï“ëº\Z?~¼Æ¯É“\'káÂ…Z±b…6nÜ¨¢¢\"ÕÕÕ}è÷ËÍÍÕYg¥I“&Eÿœ{î¹’½9Ã0­[•Â0T†ª¨¨PIII4h™Ë¶míÚµKåååÑõMWfgBI\Z2dˆ†¢1cÆhùòåZ±b…Şÿ}mØ°á¤^‹ùùù\Z6l˜F­ñãÇë’K.Ñ”)S¢3ó\n\0€–C€\0@1sxL5mÚ4M›6M;vìˆB¬\r6¨´´T\r\r\rò}_‰DBaªcÇÊËËS·nİ4xğ`{î¹ºè¢‹”››+éĞe3ï*]+¯Ë²dY–JKK£‘Ù,ËR]]ÊÊÊ¢ë›ÎÇQ†J$²m[çŸ¾Î?ÿ|ÕÖÖêí·ßÖòåËµsçN•••©ªªJµµµ²,+j1ÌÉÉQ¯^½4vìX3F\'NTïŞ½%)z\'·ø\0€æG€\0@²m[YYY\nÃPçI’\r\Z¤AƒEŸÓĞĞ ŠŠ\n566ª¶¶VA¨wïŞêŞ½{“ïeZ˜ÌLx³†¡\\×•ïûÚ»woÚ8y–e©¤¤$\ZV†aZ__H™×bÊÍÍÕG?úQ}ô£>¯ªªJû÷ï—mÛêÔ©“²²²”ŸŸÔïf^ÏãD›5\0\0€–C€\0@+°,+ÚĞ´[™ÿÍÎÎª9Œ0›´Ù™*—L{£†¡lÛÖ={´{÷î´o7ÃÉÃP»wïÖÔ³gÏŒ¹®É¯EIGİ“;wV—.]š|\\:<¨ŞYé¶Û\'\0\0m]z÷\0\0Ğ™0Ê¶íãîF˜üñSÙ±0]íİ»W»víJõ2ĞLL¨³k×.íİ»·É±Lóa¯µc½^3ıõ\0@&\"À\0 M˜JL\rÅü.{÷îÍø ‡%_×’’’&ÇÚ‚¶ö:\0 - ö\0€4Ñ«:’ƒ;v´Éß±=Û±cGL¶%Ü§\0\0¤*°\0\0@‹+))QMMMFÇÉqGåååQVòÌ6\0\0€æF€\0\0ZŒeY\nÃP|ğ,ËŠv«Cf3»K†a¨}ûö¥z9\0\0  À\0\0-Æ¶mUUU©´´”¹BmŒ¹–¥¥¥jhh º\0\0´(,\0\0Ğb,ËÒ¶mÛTVV&©m\rúnïÌµ<pà€¶mÛ&Ûæ±\0\0´4\0\0@³Kª¶mÛ¦ÒÒÒ£#³™kYVV¦mÛ¶u\0\0 9`\0€µ}ûv8p@áF[’\\µ}ûöÔ.\0\0´yX\0\0 Å„a¨íÛ·«¢¢B–e±S]b®eYY™¶oßN8	\0\0Z\0\0h1–eiÇŠÇãùnƒÇQCCƒvìØ!Ë²R½\0\0Ğ†`\0€öïß/éPØA•NÛ†¡\\×•$íİ»—ê:\0\0Ğ¢°\0\0@³\nÃ0ªÆ)**RMMMtm‹¹¦ÕÕÕÚ½{·¤CUw\\k\0\0ĞÜ°\0\0@‹ÃP[¶lQmmmôg´-æšÖÖÖjË–-\\c\0\0Ğb°\0\0@³2!F†T`µqæšÖÔÔ4	°¸Ö\0\0 ¹`\0€feÂß÷U\\\\XÌHj{Ì5­©©Qqqqôg,\0\0ĞÜ°\0\0@‹°,K[¶lQCC;Ôµquuu***Jõ2\0\0@F€\0\0Z„ïûÚºu«Â0dÂ6Ê\\Û T\\\\,ß÷S½$\0\0ĞF`\0€f†¡lûĞãÅşıûuğàAIìL×V%_ï}ûö©²²R’¨¸\0\0Í\0\0\04›0£°jË–-J$Ñq´MæÚ&	mÙ²E’dÛ63Ï\0\0@³\"À\0\0ÍÆ„Ú¼ysÔRF€Õv™këy6oŞLh	\0\0Z\0\0h6&´hhhPQQaF;\\UTT¤úúú¯\0\0´EX\0\0 Ù544¨¸¸8\n°Ğöy§ââb544H\"´\0\0Í‹\0\0\04›äÂM›6Es3Ú.sm}ß×¦M›ÔØØØä8\0\0@s À\0\0ÍÆ„õõõ*..–Ä„mÜ/IEEET`\0€A€\0\0šE†rG’´gÏ¨}Ğ„h»Ì5®©©Ñşıû%Ú‰\0\04,\0\0Ğ,L€ÕØØ¨-[¶¤z9H‘mÛ¶Éó<9C€\0\0š\r\0\0hfŞUUUUÔ>(ÑJÖ$_ã¢¢\"UWWÓ:\n\0\0š\0\0hVÚ¾}{ª—Ù¶m›***$^\0€æC€\0\0š…	+***h!lÇŠ‹‹UYY)‰\0\0\04,\0\0Ğ,LaEE…¶mÛ\rö&Ähû’¯ñÖ­[©À\0\0Í\0\0\04«òòrUUU±û`;dÛ¶öïß¯òòrIX\0\0 ù`\0€3†¡b±˜$iïŞ½)^Më3amÛÊÍÍ•ëº)^Qê„a¨}ûöI;\0€fC€\0\0ÎX†²m[•••Ú¹sgt¬½0VNNF©AƒE^{ªD3×|÷îİª­­%À\0\0Í†\0\0\04›½{÷j÷îİ©^FÊäææjâÄ‰\Z?~¼rrr$ªÊjovíÚ¥ıû÷·«ğ\0\0´¬ö÷D\0\0š©²Ù¿»°LP“­³Î:KgŸ}¶:tèâU¥Îîİ»£6B*°\0\0@sh¿\Z\0\0@³1!EII‰vìØ‘âÕ´>Û¶åû¾rrr4aÂUTTDXí±\niÇX\0\0 Y`\0€3fBŠ}ûö©¤¤DãÈ÷ı¯ªõ$ÏÀ:çœsTQQU`µ§B3mçÎ*))‰\0\0œ),\0\0pÆ’¬0åºn»	°,ËŠ~ÿ®]»ª{÷îêÚµ«:uê$Ë²Ú]–ã8J$Q\0\0@sh?ÿI\0\0´×uU__¯ÒÒRIí«êÆ²,y\'×u5lØ0Y–%×u5pà@…a¨D\"Ñ®B,ó»–––*‚vU\0\0ZO\0\0àŒÙ¶­}ûöEV)^Që1Xyyy\Z=z´Â0T†\Z5j”rssA»\n°ŒÒÒR•––`\0€fÁ\0\0hÛ·o¬öÄ„S={öÔğáÃ£¶Á‘#GªwïŞ’Ú×,^–––jëÖ­í2¼\0\0Í¯ı<M\0€µcÇ}ğÁ’Ú_¡$uïŞ]cÆŒ‰\Z5Jİºukò9í¹ö¥¥¥ÚµkWŠW\0\0Ú\n,\0\0pÚ’ƒªö\Z`™êª=zD-„Ò¡\0«G’Úg€µÿ~mß¾ı¨ã\0\0\0§ƒ\0\0\0œ±0µ}ûvÕÕÕÉuİvV˜ßµwïŞrG¾ïË÷}´Û\0Ë¶mUTThûöííê^\0\0\0-‡\0\0\0œ6ÌX–¥’’…a(ÇqÚMhaY–‰„rss5pàÀèx†²,Kã8íj\'Â0£s×®]Mî\0\0€ÓE€\0\0NKrHUVV¦ŠŠŠÔ-&EÌ„}úôÑ Aƒ$j)4m…ƒV÷îİÛİN„æw-//Wuuut¼½›\0\0 ù`\0€3¶qãFÕÔÔH:¼]{2hĞ (ÀJ6pà@\r<¸õ”b&¨ª©©ÑÖ­[S¼\Z\0\0Ğ`\0€3¶uëÖ¨Ò¦=UÙ˜J£DA•eYÑñ!C†hÀ€M>·=0÷@uuµŠŠŠR¼\Z\0\0Ğ`\0€Ó’TmÙ²EUUUGoëL(5pà@õéÓG¾ïGÇÂ0Ô Aƒ¢ÙXí)À2UxUUUM¬öto\0\0€æE€\0\0ÎH*..Vee¥¤öR˜ßµÿş’$Ïó$î‹Å¢\n¬öÄœ—ªª*mÙ²¥]İ\0\0 e`\0€ÓbB	Û¶£Âqœv5+uïŞ]½zõ:êcæüôîİ[¹¹¹íê¼„a(Û¶ÇµeË–&Ui\0\0\0§ƒ\0\0\0œ³Ó^ee¥öïßßäX[—ÈŒ1B={ö”Ôô÷7ÿ¿gÏ\Z4hP`µ‡VB`IÒ={ÔĞĞ ©}üî\0\0 e´§L\0\0Ğ¬Â0”eY\nÃP[·nŠöhÄˆQVr€eÂš={jôèÑ)Y[*™ß¿¶¶V»ví’tèüP…\0\0N\0\08e&„ğ}_[¶lQ\"‘hr¼=1b„zôè!©i…‘ùÿ½{÷Ö°aÃR²¶T2÷B\"‘Ğ¦M›¢\n´öx\0\0€3G€\0\0N™	!ÌŒ£ö`uîÜ¹É„Òáj¬îİ»käÈ‘©Z^ÊyÄãñ&Ç\0\0N\0\08e&„hllÔ¦M›Ú]8a~OË²4pà@I‡v <²Ëœ—ö\\Çµyóf56669\0\0p*°\0\0À)K°ŠŠŠÚUVrH5|øpuéÒå¸ŸkÎGAAz÷îkÃÌ¬À\"À\0\0g‚\0\0\0œ2Bx§Í›77êŞÖ™ğÉ²,7N:u’tìÍ±N:iÌ˜1M¾¶­K¾\'6mÚ$Ïó¢ã\0\0\0§Š\0\0\0œ2Çq$IPYY™¤öÊ$³m[£G*°`™sÒ¹sg;ö˜ŸÓ–™ßwß¾}ª¬¬”Ôşî\0\0Ğ<Ú×S\0\08caÊqA âââvH$WQ;6ªÀ:Öy0Çºté¢±cÇ¶»sõÿÛ»›ØÈ²»üãÏ½·ªüşÒm·ßíö»«l÷ô0QABøC˜‘PD	A€‰„„AA‘\"‚”\rba‰„„bE‹DE ¦í*¿»ınwûİ®ºuş‹Ö¹]Õî™qwÛ.×¹ßÍÔ™ªsoQn=úß±\n…‚dŒQ\"‘ \n\0\0¼2,\0\0ğJŠÅ¢$éèèHsss±\r#|ß×ää¤’Éä‡öµ²HuuueXq	²J×F.—Óééil¶š\0€«E€\0\0^‰\rö÷÷•Íf/Œ»®´1{¿¤‹\'ZçE½ŸFGG•J¥nn¢·L6›Õşş¾¤ç!(\0\0Àe`\0€Wbœ§OŸ–Xqàû¾ŠÅ¢<ÏS:©ËTT566jttT’¢÷p]i¨Y\Z`Å%ì\0\0W‡\0\0\0¼>hffæÂ¸ËlèTSS£ééé¨™ıG…QöŸA éééÜrè²ÙÙÙ¨‘;\0\0À«\"À\0\0¯¤4ÀZ__¯ğl*£¾¾^“““¯´%0•JirrRõõõ’^~j¡Ë–——upp ‰-„\0\0àÕÅëÉ	\0\0¼1[u´±±õwŠK5‘\rjkk5==­D\"!érX‰DBSSSª««»ş‰Ş¥Uy\'\'\'Úİİ•Ÿõ\0\0®\0\0¸4cŒ‰„òù¼+=gƒ—††¥Óéèõe·–Xq	qJ¯siiIÆ˜h%\0\0Àe`\0€K³[¿666Ê¬8„çE×ßÑÑ¡{÷îIúø†ì¥ÿŞğğ°ššš¢ñ8(]‹‹‹ÚÚÚ’çy±X3\0\0àê`\0€K³¡Ã‹Vx§0•L&5>>şÚïaO\"Ìçó±ëƒµ¸¸¨ÍÍMIñ=\0ÀÕ‰×S\0\0x#6tØÜÜŒe€eŒQKK‹ÒétÙøeş]éÙıK§ÓjjjŠåI„KKKÚØØD€\0\0^\r\0\0¸4:lmmiee%VD6ljoo£\n¬‰‰	µ··—½gx§¹¹9mmmIâ$B\0\0ğjâóÔ	\0\0®Ìææ¦£	ãÀ†uwîÜÑôôôk¿Ïää¤îŞ½+)^VzòäI´…\0\0àU`\0€Kó}_ÆmllÈó¼X0öZÛÚÚ444U£½êÂÑÑÑXX¾ïËó¼haœ®\0\0¼9,\0\0pi‰DB»»»ÚØØ1&V}Œì–·îînAğZ×nŒQkkkt‚aœB»^666txx¨D\"Qé)\0€*B€\0\0.Å6ËËËZ__/sïû*\njhhĞĞĞĞ¿ßàà ‚ ĞùùylB,»VÖ××µ²²5Å\0\0¸,\0\0ğJcw’œ\r[zzz4<<½ÎûHÒĞĞ:;;cu¡]+±;Á\0\0¼9,\0\0ğJ–——µ¶¶&)>–Õßß¯ÁÁÁ7~ŸÁÁA\rHŠÏ6ÂÒ\n¬ååå\nÏ\0\0T,\0\0ğJ–––´··\'ß÷£¾P®³!Soo¯FFFŞ8¸S___Ù{ÇçyÚŞŞÖòòrìÂO\0\0ğf°\0\0À+Y]]U¡PP2™¬ôTnŒ\r™úúúÔŞŞ®0_{a±XT__Ÿz{{ËŞÛuÆ%	jyy96×\r\0\0®\0\0¸´|>¯íííJOãÆÙj¡IR†¯ı^…BAADïÆùş³GO{Š%\0\0Àe`\0€dƒÏó”ËåôôéÓ²ñ8(\nêêêRww·$EAÌ›èééQcc£\n…Â¿Wµ°kæéÓ§ZZZŠª°â´–\0\0Àë!À\0\0—V\Z`Å¥ÿ•522Xo²ıÍ†_İİİ\Z\Z\ZŠUxS\Z`år¹\nÏ\0\0T,\0\0ğ‘J–¹¹¹XU`•U£££êêêº0şºïÙÙÙ©±±±—~–«°\0\0Àë\"À\0\0—bŒÑÜÜœ<yRé©Ü8Ïó4::ªÎÎNc®$ÀêëëÓÈÈH,‚+ËXO<Ñüü|…g\0\0ª	\0\0¸Ïó”Ífurr\"ÏóbQec4<<¬†††×>Ğ²\'¶¶¶jtt4v÷Ñó<*›Í–\0\0|,\0\0p)Æ-,,H’‰D,z`Ù`Å÷ı²ß4ÀÊçó’¤û÷ïÇ®+c¨À\0\0¯„\0\0\0|(cLÔt|eeEÑÍ)\r–Òé´Z[[/Œ¿é{ß½{W½½½’ôÆ[«AézÚİİÕöö¶¤g!UX\0\0à£`\0€eC…b±¨ÙÙYŸŸ—ÇÅÔÔ”ZZZ$=?EğMØ ª¥¥E™Læß¯šØµszzÊ6B\0\0piX\0\0àCÙP¡P(hffFgggeãqàyŞµU`577+“É8_yUÊ®óósÍÌÌ¨P(TxF\0\0 \Z`\0€•Ïç•ÍfuzzZé©Ü[ieŒÑää¤ššš®l›Ÿ}ïÖÖV¥Óéã.³½ÓNOOËªú\0\0\0>ŠûOI\0\0àµ•V`ÍÎÎÆ²Ë÷}MLLDë¯ªË£ÚÚZMNNÆê~ZgggÊf³QVï\0\0¸<,\0\0ğ¡^°Â0,w™½Æ{÷î©³³S’®4À²ÁÍàà \Z\Z\ZÊ>Óeö\Zóù|ÙÂ8\\;\0\0x}X\0\0àCÙ°æèèH’¤ œ|ßW±X”ïûšVMM¤«éõ¢ºººháUd·™1FAH’²Ùl,«ú\0\0À«#À\0\0/U\Z4,,,ÄªW‘\r‘R©”¦§§•J¥ÊÆ¯‚íwuŸqÛkuuUR<‚Q\0\0ğú°\0\0ÀKÙ†ågggš‚•8„öZmªë¨À²ïUSSsmŸq[Ù5dŒÑìì¬òù¼|ßÅÚ\0\0¯‡\0\0\0¼”=-îèèH¹\\.z¥áÒÔÔ”‰Äµ}V*•*°âpa©l6«ããcIñG\0Àë‰×\0\0xe‡‡‡Êår±l*[tÕXv›fiŸ­81Æ(—Ëéğğ0z\r\0\0ğ2X\0\0à¥l˜ppp ÙÙÙ²m_.ó</ª6ëììT[[›¤«o°n,I\ZPkk«$÷ï¯T¾…0›Í`\0€E€\0\0^Ê†8‡‡‡šÆ]<ÏS†J¥Rššš*¿.¾ïG\'\n…Øl#´=°¢×\0\0\0/§#\0\0ğÚööö¢\n™84·áQKK‹2™Ì}n&“QKK‹$÷ïsévÌ­­-íïï^\0€D€\0\0.0Æ(™LÊ£åååJOçFÙ`åÎ;QUTéøu|–ô,ÀºsçÎµ}ÖmeŒÑêêª<ÏS•\0\0¸¥°\0\0ÀÅbQ¾ïk_•Î²áQKK‹¦§§/Œ_—L&õÁŠS€åyt||¬ buÚ%\0\0¸<,\0\0ğ¡677c`İ¹sG}}}7ö¹###ÑÂ¸ôÀ’U`-..jcc#z\r\0\0ğ¢ø<\0€K³!ÂöövY€‡p!Cy§%	I×wİ¥•VÍÍÍêèè¸ÖÏ»­´³³#)~×\0\0.‡\0\0\0\\`·q½`¹Î÷}\n566jllìF>³4°Q\"‘Ğùù¹óÛK¯{~~^ÛÛÛÆ\0\0,,\0\0p\r¶¶¶´¾¾›æÚ64êííÕèèè…ñëüLI\ZUww·¤øl#‚@‹‹‹ÚÚÚ’$z`\0€—ŠÇ“\0\0x%6<ÙÜÜŒ\ZºÇ\r“zzz4<<|ãŸ?<<¬ŞŞŞ²¹¸Î÷}…aX\0\0\0/§Q\0\0piÆ%	j}}=6AŠô,Lñ<Oİİİ\Z¿ñílãããQVœx§õõuåóy%	¶\0€°\0\0ÀçimmMkkk2ÆÄ*P0Æ¨»»[ÍÍÍ\nÃğÆ>7CuvvÆn¡]_kkkÚŞŞÍvU\0\0ğjâñd\0\0^Ùòò²?~,)>µívÉcn´S†J$êéé‘Ÿ{n¯smmMËËË\r\0\0¸­°\0\0@(¬®®jmm­lÌu…BAİİİêíí•çy7º}²´|ss³\n…Â}v%Ùµõøñã(ÀŠËz\0\0—G€\0\0^*nX6@\Z‰\Z©ßä6¾Ò\0kddDÆ˜Xô+\r°VVV*<\0\0p[`\0€2¶\'Ñòò²NNNb×T»4ÀªDVOOFFFnìs+Í\Z°¿¿¯åååØõ\\\0\0—C€\0\0ÊØ­s[[[’«¦ÚçihhHİİİ7^e?k``@CCC±¨¾²‚ 1&v§^\0€Ë#À\0\0e|ß×ÎÎööö*=•gŒÑàà jjjn¼•ïû*\njjjÒğğp,«ööötxx›\0Àåñt\0\0\0$•÷¹šÕîî®$İèI|•–J¥ÔÕÕ@xÓÕ@aÊ£ŞŞŞXU¾Ù5¶··§l6İ÷8†x\0\0àå°\0\0ÀsssQ–ë!BiX’N§ÕÚÚzã\'–ÎÅó<İ½{W½½½Ñ½w}[½Îİİ]ÍÏÏWx6\0\0à6\"À\0\0är¹ØX¥2™ŒÚÚÚ$İì	„–\rªÚÚÚ499yãŸ_)vÙ\n,\0\0€`\0\0IÏCcŒæççõäÉIîo!,­nJ§Óº{÷î…ñ›bC³ÖÖVe2™h<nX¥k\0\0@\"À\0\0/ğ<Osss*‹J$±\n2™ŒšššnüB«´kbbÂùàÊ2Æ(\nÍÍÍÅæº\0Àå`\0\0IÏÃ“££#mooKR¬\Z‰û¾¯ÑÑQA 0+¶…0C%“Ie2™Ø„‡6À’¤õõuIr¿ò\0\0\\\0\0(«8Êår:==Æ]g¯±³³Sííí’*·mÒXö$Â†††ŠÌ£’´¼¼,éÙıˆÃ\Z\0\0\0\0\0D!A±XÔìì¬NNNÊÆ]eß÷õàÁÕÔÔDã•œ“çyª­­ÕÔÔ”¤gß‹ëÕHv­jffÆùŞk\0\0àÕ`\0€H¡PĞÌÌŒ%¹ßÀİnL¥RšV]]]Ùx%Ø ª®®NÓÓÓJ¥Reã®²Öññ±fgg†aÙ8\0\0ˆ7,\0\0……B!vX’”L&5==­ÚÚÚ²ñJÎ©¶¶VÓÓÓJ&“ŸÓM°aéÉÉ‰fff°\0\0@,\0\0…ajvvVçççeã®*\r°&\'\'oEµSi€•ÉdnÅœnBéÂÙÙY\n…²q\0\0oX\0\0 R(477\nçzx`¯¯¾¾^ãããQO¬J†E¾ïG}¹¦¦¦bSe¯Ù£l6Ud¹¾\0Àå`\0s68¤ÍÍMíííIr?0ñ</\nIúúúÔÚÚ*évôı²sèîî.;Ñõïäeë°’ıÈ\0\0ÀíÁ\0\01WZù233U¼¸^ùb¬T*¥©©©¨çÒm399)Ïó†¡óÖ‹§aÆ¥\0\0|<,\0\0b®ôô·Ò­[®³•=---šœœŒ^ß†ÈÎÁ÷}MNNª¥¥¥lÜua*›ÍêôôTÒí¨Š\0\0•E€\0@ÌÙ\0ëèèH=ŠMï!İæ\0Ëó¼²\0Ëõít¥X=ÒññqÙ8\0\0ˆ/·Ÿ‚\0\0À¥)—ËE[é\\\rlÔÜÜ¬Dã·!À²<ÏÓÔÔ”ššš¢×.+\r°r¹œÊÆ\0@|`\0s¶âêôôT|ğAlz`Y­­­êêê’t{®Ù†(IÃÃÃjnnÆã X,jff&ªÀ\0\0 À\0 ælPrpp µµµ\nÏæfx§B¡ ß÷Õßß¯ *=¥U__lq8‰ĞZ^^*°è\0\0°\0\0ˆ1cŒ‰„$imm-Ú>èzHbOõkjjÒØØX¥§ó‘Œ1\ZU2™T>Ÿwú»1ÆD×w||¬íímIî÷ş\0\0§\0\0bÌ£ tzzª¹¹¹JOçÆØ¤»»[£££ÍGó<O£££êéé‰^ÇÅÜÜœŠÅ¢’É$UX\0\0Ä\0\01f·îîî*—ËUx67ÇVôtuui||<\Z¿MáPé\\&&&¢m„·i×mnnN;;;’nO2\0\0PX\0\0Ä˜\rvvv´°°PÙÉÜ Ïóäyººº”Édn}uO\\¬ùùy,\0\0 ‰\0\0€X³ÁÍîî®æçç£ñ8„Æuvvª¶¶6êıu…a¨öövuvvJr¿TéÚ›ŸŸ×îîî…q\0\0?n?\0€dC½½=---Å¦º\'C%“IõööŞú`¤X,*uwwKÒ­Û®’çyeÖm¯’\0\0×‹\0\0\0h{{[‡‡‡\n‚ ÒS¹vöÂ®®.õõõEÛ	o+;·¾¾>µ¶¶ªP(Üêù^• ´··m!\0\0ñF€\0@LÙ1Z[[«ôtnÜğğ°úûû%İî¾Rvnııı\Z©ğlnŞÆÆ†$÷·N\0€Æ“\0\0\01–H$´½½­ÕÕUIñè3d¡¡¡!\r”İFvn\Z\Z\Z*s™]‹+++ÚßßW2™ŒÅú\0\0/G€\0@LÙ0àñãÇ±°<ÏÓĞĞzzzT,ou dç688¨¡¡¡[=×«d×âêêª?~\\6\0\0â‡\0\0€˜zY€Æ\r(‘HÜúRç)ŸÏ«®®Nƒƒƒ2ÆÜêù^µ¸¬\0\0àå°\0\0ˆ¹Çkee¥ÒÓ¸1ÅbQêèè1¦*B‘b±(cŒººº”J¥ªbÎWeee%–=Ú\0\0@9,\0\0bª´kggG¾ï;ŒØª%cŒÆÆÆt÷î]yWÍÁí¶Ç¶¶6õöö:ı=Y¶Òlss“-„\0\0€\0\0€¸[[[S±XŒU“ìt:­öövIÕÑİÎ±½½]™L&úªaî¯Ë£d2©óóóØmq\0\0`\0S¾ïëììLÛÛÛ•Ê›˜˜¨ª\0ËV‰µ··+NWx67Ç~7[[[’TÕr\0\0àzğ\0\0@Lù¾¯ÅÅÅ(À*‹Ñõ²aˆçyÊd2jnn–1¦*B‘Ò\n¬t:]v-.³krggGKKKUñ]\0€ëÁS\0\0\01SºM0—Ëiww÷Â¸ë†‡‡åûş­?Ğò<O…BAAhbb\"6ß•½Îår¹ã\0\0 >°\0\0ˆ±ÅÅEíììHr?°Õ<½½½jmm•T=×ìyÂ0”1F÷îİSKK‹$÷«æ¬İİ]-,,Tz\Z\0\0 ‚°\0\0ˆ±ùùùXT`Ù*+ß÷õÖ[o©¶¶¶l¼\Zø¾/ÏóTWW§ÉÉÉXl#,İB¸¸¸XáÙ\0\0€J\"À\0 Ææççu||¬ b`%	MNNª¡¡¡l¼\ZØ¹666jjjJ‰D¢lÜE¶GÙşş¾æææ*=\0\0PAX\0\0ÄØÊÊŠ¤gÁN\\¬©©©(Àª¦¦àö\Zêëë555¥ ÊÆ]dŒ‰‚:*°\0\0ˆ·êyj\0\0oÌ+++:88ˆÆ]V\Z`MOO+•J•İ‹j`Ã¶ºº:MOO+™LJr;À*µ¿¿˜éyók\0\0”#À\0 Fì~cŒfggu||\\6îºúúzŒŒHzÖ_©šÂÛÈİó<e2™Xl!”¯Í££#år¹Ø¬U\0\0P\0\0€*‹Êf³±°lğ#ICCCÑöÁj¼f;ç»wïª§§G’¢ksİññ±fgg«ò{\0\0o\0\0€*‹Êår:<<”TaÎeÙíf555zğàAt­ÕX¹d·zõÁ*‹UÕËëUÙ“•Ëå¢×.¯Y\0\0p‘»O;\0\0à‚Ò-„333:99)w‘\rªšššœÙz2™Œššš$U÷µ|»6m\0\0ñD€\0@ŒØıÅbQ³³³\nÃP¾ï;Øê¤ÆÆFMMM•U1U« ÊNS¬ækù8¶Ù~>Ÿ×ÌÌL`\0€x!À\0 Flx³¿¿¯µµ5IÏÂ—,î466jzzºªÃ;wß÷555¥æææèµ«Œ1\n‚@’´´´U\r\0€xq÷i\0\0”1ÆDAÇÜÜœÎÏÏ+<£ëW\ZVİ½{W’WõTÛÏK’FGGÕØØ(ÏóªòZ^ÇÉÉ‰%ÉùÊA\0\0P\0\0€˜°[¯^ÜŠåú–¬B¡  488èT¥R*•R__ŸŒ1*\nN‡X¥[_gff¢ë%À\0 >ÜyŠ\0\0—r||¬l6«B¡Pé©\\;ß÷U,ÕÜÜ¬‰‰	§cŒÆÇÇU[[«0°¬B¡ \\.‹Ã\0\0@9,\0\0bÂşØ?==Õììl`¹ØP§³³ScccN…<çillL]]]ÑkWÙ5Z(4;;«ÓÓÓ²q\0\0à>,\0\0b¢4Àš™™Q†eã.²¡Î½{÷411QáÙ\\½‰‰	İ»wO’ûÜ%)CÍÌÌ`\0Cî>é\0\0€2öÇşÉÉ‰fff$Éù>B6ÔéèèP:ú}Usµ’»1Fêèè(w™1F=b!\0\01D€\0@”@¸½½­ÃÃCIî‡6àèììT*•rªa}±XT[[[,¬Òõ»³³£\'OHr?€\0\0Ï`\0A(C-,,Tz*7Âó<\nÕÖÖª¿¿ß¹ Ã†:½½½ò</6Ü1ZZZ’1F‰DÂ¹ï\0\0¼\0\01P,åy•Ëå*=S,Õİİ­û÷ïËó<§[}400 »wïÆâTI+—ËéøøØ©ï\0\0|4,\0\0bÀV©ìîîj~~şÂ¸‹l¸qÿş}\r”¹Âó<İ¿_ÃÃÃÑkW•®Õùùyíîî^\0\0î\"À\0 ìü½½½ØT`Ù0g``@÷ïß/s½–ÁÁAgº377§½½=Irª¯\0\0øpX\0\0Ä€\r°<yR`¹\\½R\Zğôöö*Ã\nÏèjÙ-„÷ïßw2 {QéZÍf³Q€åò\Z\0\0Ï`\0ÆcôäÉmllD\'ºÅA__Ÿ“MÎ=ÏS>ŸWMMMT¾ïkyyYO<‰Ö5\0\0p_|^\0ˆ){ZçyÚØØˆÍ–«0uçÎuvv:tØkêêêRmmml¾ÛB¡ ­­­¨1¿‹ß-\0\0(G€\0@$	jeeÅ©*¤bŒÑèè¨ÚÛÛåy“Ugöš:::Ôßß›\0Ëó<­®®*ŸÏ+‘HTz:\0\0à¸÷$\0\0ÊcäyÖ××µ²²â|µJi@766¦ã®°×tïŞ=¥Óéã®2ÆhuuU[[[ò}ßù5\r\0\0°\0\0pıq¿¶¶¦ååå²1×Ç\"ÀêèèĞØØX…gs3ìÚ]^^ÖãÇËÆ\0\0€»°\0\0p\\i€µ²²RáÙÜ¬‰‰	577«X,:¹…°4Àš˜˜¨ğlnÖòò²Ö××%`\0î=É\0€2öÇıãÇµ°°à|ÓëÒk”ô¬é·‹X¾ï+ŸÏKRl*°¬ÅÅE*°\0\0ˆ,\0\0gÜoll(ŸÏ+™LVxF×§4¤\Z\Z\ZRKKKgs3lãö¶¶6İ»wOÒó¾g.2Æ(‘HèğğPëëë„W\0\0Ä\0\0‚@ÅbQ[[[ò<ÏÙ`Cz`y§¨¾¾^’œÜ>hÙkkhhP:.»®\n‚@’´¹¹éüš\0\0Ï¸û4\0\0$=û±¿³³£­­-cbQ±Òé´ššš$¹æØkkllÔää¤Óae×ğöö¶¢@\0\0¸Ëı\'\0\0 ¹¹9mnnJr»_\rs|ß×ÔÔ”\ZËÆ]T\Z`MMMÅ*ÀÚÚÚÒÜÜœÓß/\0\0xÆı\'\0\0bª4¨Z\\\\Ôöö¶¤ç=“\\dƒŒ 499©T*åt?(©|áäädTäò5Ûµ½¹¹©………ÊN\0\0Ü,\0\0b`aa!X6œkjjrşBËó<\nIÒÄÄ„ÓMú-û=omm•X.¯m\0\0â\0\0\0Çc´°° §OŸÊ÷}gä{ãããª­­­ğŒn^sssÜ‹Egƒ;[U·³³£ÅÅEg×4\0\0x\0\0\0G•F·¼¼¬0•H$œı±o·ÒÕÔÔèÁƒÑë8ô„*İ:9==­d2éôÖIcŒ‰„\n…‚½N\0\0ğœûOt\0\0ÄÜÉÉ‰vvv$¹İ©´™y&“‰ÅVºÙŞ_\r\r\r’Üş¾}ß—çyÚÚÚÒùùy¥§\0\0®\0\0*­²Êf³:::º0î\ZÖÔÕÕijjJ‰D¢lÜeö\Z“É¤2™ŒêêêÊÆ]dŒ‘1F‡‡‡ZZZ’ôìz]^ã\0\0Ä\0\03ÆhvvVûûûÑkWÙ°¦¾¾^SSSe[(]÷âB`¹¼}Ò®åƒƒÍÎÎ:½¶\0\0\0\0Nz±ëğğPÒóÓÛ\\SÚÀ½½½]’Ünd^ªôúÇÆÆÔÔÔTá]¿¬Ç\0€[°\0\0pıoŒQ.—ÓÁÁAÙ¸k<Ï‹šÔÅ\"´ú0¾ïkhhH’”Ïç½v-ïïï+›Í:»¶\0À3X\0\08Ìó<ÍÌÌèüüÜéş@öÚZZZ411]§«áÍËØk5Æ(N«¾¾^Æg·ÚêºÓÓSår¹hÜÕ5\0@Ü¹ùD\0@ÌÙ0ãììLËËË2Æ(‚\nÏêúØëmoo×øøx¬‚«y§ñññh¥Ë÷Â÷}c4??¯0+=\0\0p°\0\0pŒ1&\n-?~mt½K’ÚÚÚ499YáÙT^:V[[›$w¬Òê²mmmIr»q=\0\0qÆÿÃ\0à`côèÑ#åóùhÜU6´hoo×èèhì·;`IÏ×t†š™™‘ävP\0@œ`\0àûãıôô4êU:î\"{m]]]J&“Î¶xÅbQmmmºwï¤xXçççzôè‘ÎÎÎ$¹{Ú&\0\0qF€\0€cìú³³3ÍÎÎ:_åyòù¼êëëuÿşıh,®ìµÈ÷ıXœDX(4;;X®®u\0\0âŒ\0\0\0G)›ÍÆ\"À2Æ¨««KCCC•Î­144¤{÷îE§õ¹¨4¬Íf³:==­ğŒ\0\0Àu!À\0À1vûT>Ÿ×|PÖËE¶ÿÕÀÀ@TéşıûÎß»¦‹ÅbY¿7¶\0à,\0\0c«m´ººZ6æ²şş~\rKŠÇõ~{í###êëë+s‘½¶ÅÅEWx6\0\0àº`\0àcŒ‚ $---©P(TxF×Ï}}}êêêR¡Pp:°¹cŒúûûc`œœèñãÇ’¤ œ­8\0 ®°\0\0pˆ1F¾ïëôôTÙl¶ÒÓ¹6¨°aM†•œNÅÙ¦ö©TJıııÑXd³YŸŸ`\0à ,\0\0b{ÿ<}úT¹\\.\ZwùÇ|†ºwïººº$Å\'¬¹ŒîînÕ××;ê•®íl6«ƒƒIôÁ\0À5X\0\08Äş˜úô©æææ*<››aŒÑÈÈˆ:;;%=oêg6ÄëììÔıû÷cæÌÍÍéÉ“\'’Üm\0ˆ#ğ\0\0pHi€5;;[áÙÜœÑÑÑ(À¢ëyˆ×ÑÑ¡ñññ\nÏææär9íïïWz\Z\0\0à\Z`\0à[ispp ¥¥¥hÜÅjTy§±±1uvvÊC€¥ç÷¦§§G£££Æ]5??ÏB\0\0E€\0€ClåÍŞŞ,¤gáÜØØ˜ššš†a,®ùãx\'cŒÚÛÛ566Véé\\+Îz§İİ]íííUxF\0\0à:`\0àcŒ‰„$•U_¹ª´ª¬ôB¬gaÎùù¹$ihh¨Â³¹~¥ßùÊÊŠ$)‘H8Yy\0@\\`\0àcŒ|ß×öö¶+=kU\ZXŒ«¥¥åÂxÜÙ{ÑÖÖ¦îînIrv‹eiPµ´´¤\'O(,\0\0B€\0€#ìõõõuç+°Jû_MOO«©©©lÏïEss³ÒétlîÍÒÒ’677%¹Ùû\r\0€¸\"À\0À1›››Ñ6*×À{§t:U`Ù`x`555)“É8`Ùµ¾²²¢²1\0\0PıxÊ\0ÀöÔµÍÍM-,,8XX™L†\n¬—(­ÀÊd2Æ]5??U`\0\0w`\0à[m²±±¡­­-APá]Âø¾¯L&£d2©b±è|8ó*ìI„õõõššš*wUZ[[£\0\0`\0àLØï.o§³ÁÄİ»wÕÛÛ+‰_äû¾\n…‚$iddDuuuÑõ‚@Åb‘\0\0\0¹ûd\0@Ì$	i}}]’»?Ş}ßª­&\'\'USS#ÉíÊ¢×eïICCƒÆÆÆ$Å#èÛØØP¡Ppº\n\0€¸!À\0ÀçiuuÕùØløRSS£ééi%“É²q<gïI2™ŒÅ½*İF»ººJ€\0€C°\0\0pÈââ¢¶¶¶$¹`YuuuÊd2J¥R’Ü\reŞDi€599m#tu{é‹\0\0\0w¸ùô\0@L-//G[]õaXøp©TJ“““ª­­­ôTnÄÆÆ†VVV*=\r\0\0p…°\0\0p€­¶Z\\\\Ôöövt‹l€UWW§t:½¦ë\"{O‚ ĞÔÔ”óıÂìš/­Àrõ¿\0\0â†\0\0€*Wú}iiIÇÇÇ\n‚ÀÉî¥Á\\GG‡:::$)jêrçEÛêFFFÔÒÒRá]/cŒ‚ ĞÁÁ–––ÊÆ\0@u#À\0 Ê•7’ät€U(”H$”N§+=ªâyFGG%Iù|ŞÉ>XÆ%	IÒãÇ£qÂM\0\0ªŸ{O.\0\0Äˆ\r©<ÏÓÚÚš>}Z6î\Zº´¶¶jrr2\Z\' ¸œL&£¦¦&Iîß³§OŸjgg\'ºNWÿ›\0\0 .°\0\0pÄÜÜœ$¹ûcİ†wïŞÕøøx…gSJƒªt:­¶¶¶ã.±[&9‰\0\0‡`\0àˆ………ØX­­­šššªğlªO&“Qkk«$w,ëàà€\0\0\0‡`\0PÅJƒªùùyíïï_wIiÖàà`ÙJ|¼ÑÑÑ(Àr±–ô¼k_óóó\r\0\0¸*n>¹\0\0CóóóÎW`ÙëêêêR2™,ÃË•ö€ºsçNtr£«ìzx±‹u\0@u#À\0À{{{Êçó’Üü±îû¾ÎÏÏÕØØ¦\'Q}õª†††äû¾ÎÎÎœ¾wgggzòäI¥§\0\0®\0\0899‘än c¯«§§G###Mõ\ZQOO$7·Úğ¶X,êøø¸Â³\0\0WÅ½§\0\0bêôôT’»–ôìÚzzz444½ÆåØ{588¨XÜ;[‘\0\0ª\0\0°Õ&¾ï;»…Ğ£¡¡!GÍºqyÅbQÓÓÓ\Z\Z\Z’1FATzJ×ÂV–ÙªD\0\0Pı°\0\0¨b¥AÕùùygrıŒ1J¥RšÖ;w†a¥§TuÂ0Tww·¦§§“Ag)×ÿ›\0\0 N°\0\0pD}}½¤gA‹ÛÃ\n…‚&\'\'õöÛo;{7Á£wŞyGÃÃÃÎn±³Á\\CCC…g\0\0®\n\0\0U¬4Äéíí•ô¬ÊÆÅpÇó<ı¿ÿ÷ÿôÖ[oÉó<\'_· äyŞ~ûm}ö³Ÿuvc”L&Õİİ]éé\0\0€+Â“\0\0èëë‹*N\\&l(ñS?õSjkkS>Ÿ\'Àz\r¾ï+ŸÏ«««KŸşô§¬d³×S__…º\0\0 úñä\0@+\rº»»Û2åû~^}æ3ŸÑÃ‡£×x=Æù¾¯Ÿø‰ŸĞOşäOF!–kAVCCƒ:;;£×®]\0\0qC€\0€#†‡‡ÕÔÔäÜö:cŒêëëõµ¯}M÷ïßW†J$•VÕJ$\nÃPƒƒƒúƒ?ø¥R)§Az666jdd¤ÒÓ\0\0WÄ§[\0\0bîŸø„:::œÙŠÅ¢$é7ó7õŞ{ï©¶¶6ª Âëñ}?\n?÷¹Ïé‹_ü¢¤gAaİ›³zzøğa¥§\0\0®O\0\0T1Tc488¨t:-ß÷£à§Z•p>Ôÿñ«¦¦FÆª¯®@Qˆõ­o}KÑ?«æğÓó<…a¨ 4==­¨º¬š¯\0\0`\0àûãüÓŸş´úûûU(ªºš&…a¨}ík_SWWÄ²UJçippP¿÷{¿§îîî(ü©V¾ï+CŒŒègög%\\\0à\n,\0\0òs?÷szğà$Uí6»d2©B¡ ööv}å+_Ñ¯şê¯F!aÄÕ±ëÃó<}ùË_Öoÿöo«¹¹Ya*™LVxv¯Ç^ÓÃ‡õÙÏ~Ö©Ş^\0\0Ä]u>Ù\0€Â0Ôıû÷õşûïGÍÜ«‰çyJ&“ÊçóêééÑ7¿ùM}ùË_V*•ªôÔœW[[«ßıİßÕ×¿şuµ¶¶*ŸÏ+™LVå\ZêèèĞûï¿¯ööv…aXé)\0€+B€\0€C<ÏÓ¾ğıÊ¯üŠÎÏÏ«¦_Tò}_ù|^ıııúÆ7¾¡/}éKjmmU¡P¨ôôœg+Ş~çw~G_ÿú×uïŞ=åóyù¾_5[\n“É¤ÎÏÏõÅ/~QŸûÜç†aÕV!\0€‹<Cm5\0\0Î°•3?øÁô¿ñÊf³ò<OçİÊÆî/Î-Në÷ÿ÷õ¥/}I©TJçççT`İ{¯õío[ßşö·•Ëå$=?ò6>6ÚS1Êd2ú›¿ù½ıöÛ¬\0\0C€\0€ClÈÏçõ÷ÿ÷úÊW¾¢İİ]IÏwß/W\r\r\rzûí·õ‡ø‡úüç?/cŒÂ0¬š\n2Wäóy%	y§¿ıÛ¿ÕŸÿùŸëşçtrr\"©<,º\rJ×t{{»şò/ÿR¿ôK¿­*°\0\0p\0\0±\'Éé¯şê¯ôGôGÚŞŞ–ïû·®\nËó<İ½{W¿õ[¿¥o~ó›jnnNÇCeØGCÏó´½½­o}ë[úë¿şkíïïßšàÊ²kº««Kú§ª_ÿõ_W*•R±X$¼\0À1X\0\08È†@ù|^ÿò/ÿ¢¯~õ«š™™QMM\n…BE¶ƒù¾6H{ÿı÷õo|Cï¾û®êêênt>¸œããc}ÿûß×ŸüÉŸè{ßû¤g[\nmİM‡¢çE½¹ÎÏÏ5==­¿ø‹¿Ğ§>õ)%“IP\0\0E€\0€ãŒ1ú÷ÿwıÙŸı™şáşAÒóÿl\0qÕÛÂlÈ`ÿ*=ë±d}á_Ğ/ÿò/ë§ú§5<<ÍÓş»¨¼¿l6«ïÿûú»¿û;ıÓ?ıSôçlŸ©ë\\Kvù¾_¶~í×~M_ıêWõî»ï^Ùç\0€Û‰\0\0\0‡•n¥úßÿı_}÷»ßÕ¿şë¿ê;ßù£?‚ ˆÂ‡ÒªšÒG…C\r.”ş½çy\nÃPa–ÍehhHï½÷>õ©OéwŞÑôôtôÏì¶GÜ>…B¡¬ÙücıèG?ÒüÇè;ßù–––Êş|\"‘(ë•U\Zh½ø×Ò°²ôïKÃÏB¡P¶–îÜ¹£÷ß_ŸùÌgô¿ğ\Z—$¶\r\0à8,\0\0W,†¡’É¤$éƒ>Ğ?şã?ê{ßûşïÿşOËËËÂ¦«ĞØØ¨ŞŞ^õööjttT?ó3?£_üÅ_T[[[Ù¼lÓpÜ^Æ\nA…D[[[úçşgıÛ¿ı›r¹œVWWµ¼¼¬ÓÓÓ+ÿüd2©MNNêçşçõùÏ>ªÜ+m<\0\0ÜE€\0@LØŞWvË×ŞŞ¾ûİïê‡?üa@êàà@GGGÑŸÃ0úk†2Æ(‘H(•J)™L–ıµ¶¶VÍÍÍêëëÓ;ï¼£·ŞzKo¿ı¶zzz¢yœŸŸG=Œª‹=²tIÒÊÊŠ~ô£é¿ÿû¿õ_ÿõ_züø±ö÷÷urr¢B¡ óósåóyåóyŸŸ«P(D[mõŸı_2™TCCƒšššÔĞĞ ¾¾>é“Ÿü¤Ş{ï=544Hz¶ì¿\0\0ÜG€\0@ÌØ-‚v›–upp üàúá¨ÿøÇÚŞŞÖéé©ttt¤ƒƒ+Cµ´´¨»»[êêêRWW—ÚÛÛ•N§õî»ïªµµµì3m…×‹Ÿ‰êUºÕôÅimmMÿùŸÿ©Gi{{[ëëëÚØØĞææ¦ÖÖÖ´¿¿¯T*UjjjR}}½:::ôğáC}ò“ŸÔ\'>ñ‰(°*ıLÖ\0\0ñC€\0\0\0\0\0€[N—\0\0\0\0\0\0¸Õ°\0\0\0\0\0\0p«`\0\0\0\0\0àV#À\0\0\0\0\0À­F€\0\0\0\0\0€[\0\0\0\0\0\0\0·\Z\0\0\0\0\0\0n5,\0\0\0\0\0\0ÜjX\0\0\0\0\0\0¸Õş?¯0(£•¢ç°\0\0\0\0IEND®B`‚',32768,0,'prueba','prueba');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',2);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (78,0,'Se han cambiado las politicas de uso','2018-03-12 09:25:00','Cambio en las politicas',5),(79,0,'Las tasas han aumentado.','2018-03-09 06:12:00','Cambio de tasas',5),(80,0,'Las tasas sobre el transporte han aumentado.','2018-02-18 06:12:00','Cambio de tasas',5),(81,0,'Las politicas de adopcion han cambiado.','2018-01-21 06:12:00','Cambio de tasas',5);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_actor`
--

DROP TABLE IF EXISTS `notification_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_actor` (
  `Notification_id` int(11) NOT NULL,
  `actors_id` int(11) NOT NULL,
  KEY `FK_2rjj76x0yut9u4lplhsd3cw5c` (`Notification_id`),
  CONSTRAINT `FK_2rjj76x0yut9u4lplhsd3cw5c` FOREIGN KEY (`Notification_id`) REFERENCES `notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_actor`
--

LOCK TABLES `notification_actor` WRITE;
/*!40000 ALTER TABLE `notification_actor` DISABLE KEYS */;
INSERT INTO `notification_actor` VALUES (78,93),(78,94),(78,95),(79,96),(79,97),(79,98),(80,87),(80,88),(80,89),(81,90),(81,91),(81,92);
/*!40000 ALTER TABLE `notification_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `isAccepted` bit(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `startMoment` datetime DEFAULT NULL,
  `animal_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ro7rlm9mc1pqndicpv2111j0s` (`animal_id`),
  KEY `FK_tmnqseleq7u3in8enca0wag9n` (`request_id`),
  KEY `FK_skwc6d8kbqqesqleg100m4r68` (`trainer_id`),
  CONSTRAINT `FK_ro7rlm9mc1pqndicpv2111j0s` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`),
  CONSTRAINT `FK_skwc6d8kbqqesqleg100m4r68` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`),
  CONSTRAINT `FK_tmnqseleq7u3in8enca0wag9n` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (115,0,'Comment Offer 1','Cordoba','Spain','Cordoba','Cordoba','38854',1,8,2,0,'\0',1580,'2018-11-24 09:00:00',106,109,96),(116,0,'Comment Offer 2','Jaen','Spain','Jaen','Jaen','32500',0,2,0,1,'\0',180,'2018-10-26 10:00:00',107,110,96),(117,0,'Comment Offer 3','Granada','Spain','Granada','Granada','31154',4,2,1,0,'',259,'2018-05-14 06:00:00',108,111,97);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `adoptionFee` double DEFAULT NULL,
  `bannerPrice` double DEFAULT NULL,
  `travelFee` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (85,0,15,0.02,10);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional`
--

DROP TABLE IF EXISTS `professional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professional` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `userAccount_id` int(11) DEFAULT NULL,
  `avgRating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gs7pec4fp5hprha5n76c6yedi` (`userAccount_id`),
  CONSTRAINT `FK_gs7pec4fp5hprha5n76c6yedi` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional`
--

LOCK TABLES `professional` WRITE;
/*!40000 ALTER TABLE `professional` DISABLE KEYS */;
INSERT INTO `professional` VALUES (87,0,'Palma de Mallorca','Spain','Mallorca','Islas Baleares','65897','profesional1@gmail.com','Name Profesional1','+34666944487','AC',69,2.5),(88,0,'Ferrol','Spain','CoruÃ±a','Galicia','32154','profesional2@gmail.com','Name Professional2','+38 632165112','AC',70,26.6),(89,0,'Madrir','Spain','Madrid','Madrid','32784','professional3@gmail.com','Name Professional3','+34 632144487','AC',71,32.4);
/*!40000 ALTER TABLE `professional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `travel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lmp6pjk3a5vj31cs7kfjljrbu` (`customer_id`),
  KEY `FK_hwkdwp7l3sstefhpsyv71s0jl` (`request_id`),
  KEY `FK_7mp693gklq46yg8m7jhtfaati` (`trainer_id`),
  KEY `FK_n8ra90uvtxcysq9edmdabetcl` (`travel_id`),
  CONSTRAINT `FK_7mp693gklq46yg8m7jhtfaati` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`),
  CONSTRAINT `FK_hwkdwp7l3sstefhpsyv71s0jl` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`),
  CONSTRAINT `FK_lmp6pjk3a5vj31cs7kfjljrbu` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_n8ra90uvtxcysq9edmdabetcl` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (126,0,'Muchas curvas','2018-01-20 09:00:00',2,93,NULL,NULL,123),(127,0,'Muy amable','2018-01-20 09:00:00',5,94,NULL,NULL,124),(128,0,'Me adiestro el perro flama','2018-01-20 09:00:00',4,94,111,97,NULL);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `commission` double DEFAULT NULL,
  `isPaid` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `request_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4v88q4mrc981mayx065mc9geg` (`request_id`),
  KEY `FK_e5726rs75038p8yaqdl8jb17h` (`trainer_id`),
  CONSTRAINT `FK_4v88q4mrc981mayx065mc9geg` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`),
  CONSTRAINT `FK_e5726rs75038p8yaqdl8jb17h` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (118,0,259,15,'\0',NULL,111,97);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isCancelled` bit(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `animal_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ila0mvu43vwy5hfbhu6ewx0ft` (`animal_id`),
  KEY `FK_4w7d65kg4g35nxkufpk7f4rpx` (`customer_id`),
  CONSTRAINT `FK_4w7d65kg4g35nxkufpk7f4rpx` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_ila0mvu43vwy5hfbhu6ewx0ft` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (109,0,3,'Description Request 1','\0','Tag Request 1',106,93),(110,0,2,'Description Request 2','\0','Tag Request 2',NULL,93),(111,0,4,'Description Request 3','\0','Tag Request 3',NULL,94);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specie`
--

DROP TABLE IF EXISTS `specie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specie` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specie`
--

LOCK TABLES `specie` WRITE;
/*!40000 ALTER TABLE `specie` DISABLE KEYS */;
INSERT INTO `specie` VALUES (99,0,'Perro'),(100,0,'Gato'),(101,0,'Reptil');
/*!40000 ALTER TABLE `specie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `userAccount_id` int(11) DEFAULT NULL,
  `avgRating` double DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1v0ljnwuhlwur1d8ukoe2vlhp` (`userAccount_id`),
  CONSTRAINT `FK_1v0ljnwuhlwur1d8ukoe2vlhp` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (96,0,'Paris','France','Paris','Paris','34454','trainer1@gmail.com','Name Trainer1','+34 632144487','B ',72,114.4,'116598T','Surname Trainer1'),(97,0,'Barcelona','Spain','Barcelona','Catalunya','37754','trainer2@gmail.com','Name Trainer2','+34 632144487','A ',73,16.4,'116698T','Surname Trainer2'),(98,0,'Valencia','Spain','Valencia','Comunidad Valenciana','32554','trainer3@gmail.com','Name Trainer3','+34 632144487','B ',74,42.9,'886598T','Surname Trainer3');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `trainer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ovgw9a8j3uacw3u2hhgbeua5a` (`trainer_id`),
  CONSTRAINT `FK_ovgw9a8j3uacw3u2hhgbeua5a` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (112,0,3,'Description training 1',1,8,2,0,1580,96),(113,0,2,'Description training 2',0,2,0,1,180,96),(114,0,4,'Description training 3',4,2,1,0,259,97);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter`
--

DROP TABLE IF EXISTS `transporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transporter` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `userAccount_id` int(11) DEFAULT NULL,
  `avgRating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qywrsv8uxytpwgtf5tl44qurc` (`userAccount_id`),
  CONSTRAINT `FK_qywrsv8uxytpwgtf5tl44qurc` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter`
--

LOCK TABLES `transporter` WRITE;
/*!40000 ALTER TABLE `transporter` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter_travel`
--

DROP TABLE IF EXISTS `transporter_travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transporter_travel` (
  `Transporter_id` int(11) NOT NULL,
  `travelPassengers_id` int(11) NOT NULL,
  KEY `FK_ov5tp9b1ovislpb34t1ya28bt` (`travelPassengers_id`),
  CONSTRAINT `FK_ov5tp9b1ovislpb34t1ya28bt` FOREIGN KEY (`travelPassengers_id`) REFERENCES `travel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter_travel`
--

LOCK TABLES `transporter_travel` WRITE;
/*!40000 ALTER TABLE `transporter_travel` DISABLE KEYS */;
INSERT INTO `transporter_travel` VALUES (93,123),(94,124);
/*!40000 ALTER TABLE `transporter_travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `animalSeats` int(11) DEFAULT NULL,
  `cityDestination` varchar(255) DEFAULT NULL,
  `countryDestination` varchar(255) DEFAULT NULL,
  `provinceDestination` varchar(255) DEFAULT NULL,
  `stateDestination` varchar(255) DEFAULT NULL,
  `zip_codeDestination` varchar(255) DEFAULT NULL,
  `endMoment` datetime DEFAULT NULL,
  `humanSeats` int(11) DEFAULT NULL,
  `cityOrigin` varchar(255) DEFAULT NULL,
  `countryOrigin` varchar(255) DEFAULT NULL,
  `provinceOrigin` varchar(255) DEFAULT NULL,
  `stateOrigin` varchar(255) DEFAULT NULL,
  `zip_codeOrigin` varchar(255) DEFAULT NULL,
  `startMoment` datetime DEFAULT NULL,
  `transporterOwner_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a7doeh55rblmfiqkbhh2hfinn` (`vehicle_id`),
  CONSTRAINT `FK_a7doeh55rblmfiqkbhh2hfinn` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (122,0,1,'Sevilla','Spain','Sevilla','Sevilla','31004','2018-04-20 11:00:00',2,'Cadiz','Spain','Cadiz','Cadiz','11487','2018-04-20 09:00:00',87,119),(123,0,1,'Malaga','Spain','Malaga','Malaga','30054','2018-02-20 11:00:00',3,'Huelva','Spain','Huelva','Huelva','31199','2018-02-20 09:00:00',87,120),(124,0,2,'Almeria','Spain','Almeria','Almeria','55154','2018-01-20 11:00:00',4,'Granada','Spain','Granada','Granada','31100','2018-01-20 09:00:00',93,121),(125,0,1,'Sevilla','Spain','Sevilla','Sevilla','51114','2018-04-26 11:30:00',1,'Almeria','Spain','Almeria','Almeria','55100','2018-04-26 09:00:00',87,120);
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (65,0,'','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin'),(66,0,'','dea26157fa355301663174eac368538cff8939f36681d6712dedba439ab98b70','customer1'),(67,0,'','c8c7cb5b9e8f7a1b3d1d02602ada62327132391dbe0e8ee07913cd550eea1f3b','customer2'),(68,0,'','18c5c9be898c65c5e5c51ac3e94feacff0b991f8463a3a18eb524e9f7e6131a8','customer3'),(69,0,'','79343603654a9d7ab7550de6020b8968cecd9b051f372f76e4c3bf8a02b1ee61','profesional1'),(70,0,'','99d5980282b6633c17349bb3d3d5f3e5fefda316f0f8be84b01648237958cf1b','profesional2'),(71,0,'','5e795db8cd035981c62fd5605aa491264ea16d32b1e107142afc600c9ee58972','profesional3'),(72,0,'','167ec7e469d6e543b4180fdbe60ddacf81563fb178f908896e46a5e86633c702','trainer1'),(73,0,'','16378a428f831c77c6c49def99620f0f17f4ba693df2826ee8fbd6c6d451e4b7','trainer2'),(74,0,'','29209ecd78e31959de6fcb45b068f221f1130de844cfddd0b63af57369cec375','trainer3'),(75,0,'','0f7395dd04906037a9a7cb770b347e787be1d096ff0190af6bd591b260d2f60e','animalshelter1'),(76,0,'','ce07a44593752910b4c9f35875b2db5c7e66fa44d2217ea5fd6d45d463759a56','animalshelter2'),(77,0,'','a3dc6a11182b57ea49b4e2386479d6ce25bdfc29210c22ac23ce8c9233684928','animalshelter3'),(32768,1,'','248d67c32335148922fa1a0aa9298cd732ee74a28aab774b6fdf120fa4839a1c','prueba');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (65,'ADMIN'),(66,'CUSTOMER'),(67,'CUSTOMER'),(68,'CUSTOMER'),(69,'PROFESSIONAL'),(70,'PROFESSIONAL'),(71,'PROFESSIONAL'),(72,'TRAINER'),(73,'TRAINER'),(74,'TRAINER'),(75,'ANIMALSHELTER'),(76,'ANIMALSHELTER'),(77,'ANIMALSHELTER'),(32768,'CUSTOMER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `accommodation` varchar(255) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `carType` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isActived` bit(1) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `picture` tinyblob,
  `seats` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `transporter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (119,0,'Tengo un cinturon para perros',0,2,'ROJO','Climatizado','','1234BCD','AC',3,2012,87),(120,0,'Tengo una jaula.',4,3,'VERDE','Climatizado','','1234BCR','AC',7,2016,87),(121,0,'Tengo un remolque adicional',4,1,'BLANCO','Climatizado','','1254BCD','AC',4,2015,93);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-22  1:08:06

commit;
