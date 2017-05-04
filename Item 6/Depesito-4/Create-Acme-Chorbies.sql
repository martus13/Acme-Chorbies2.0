start transaction;

drop database if exists `Acme-Chorbies`;
create database `Acme-Chorbies`;

use `Acme-Chorbies`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete 
 on `Acme-Chorbies`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `Acme-Chorbies`.* to 'acme-manager'@'%';


-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Chorbies
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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (93,0,'castell96@us.es','Castell','955876632','Torri Campi',92);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
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
  `bannerUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (77,0,'http://s2.subirimagenes.com/imagen/previo/thump_9717193padthai.png'),(78,0,'http://s2.subirimagenes.com/imagen/previo/thump_9717202bnb.png'),(79,0,'http://s2.subirimagenes.com/imagen/previo/thump_9717204cng.png');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `copiaSender` bit(1) NOT NULL,
  `moment` date DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_20arsrvo5x8fqqrj7o5tomu6f` (`recipient_id`),
  KEY `FK_7nnun85ngke6yiv2qnerep5uc` (`sender_id`),
  CONSTRAINT `FK_7nnun85ngke6yiv2qnerep5uc` FOREIGN KEY (`sender_id`) REFERENCES `chorbi` (`id`),
  CONSTRAINT `FK_20arsrvo5x8fqqrj7o5tomu6f` FOREIGN KEY (`recipient_id`) REFERENCES `chorbi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (147,0,'\0','2016-04-22','Respuesta','Que feo eres illo',121,133),(148,0,'\0','2016-04-22','Respuesta','Que feo eres illo',124,135),(149,0,'\0','2016-04-22','Respuesta','Que feo eres illo',127,137),(150,0,'\0','2016-04-22','Respuesta','Que feo eres illo',129,139),(151,0,'\0','2016-04-22','Respuesta','Que feo eres illo',131,141),(32768,1,'','2017-05-01','asd','asd',124,121),(32769,1,'\0','2017-05-01','asd','asd',124,121),(65536,1,'','2017-05-01','asd','asd',121,139),(65537,1,'\0','2017-05-01','asd','asd',121,139);
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp_attachments`
--

DROP TABLE IF EXISTS `chirp_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp_attachments` (
  `Chirp_id` int(11) NOT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  KEY `FK_19xst1rktyonkumt1r20fe0gh` (`Chirp_id`),
  CONSTRAINT `FK_19xst1rktyonkumt1r20fe0gh` FOREIGN KEY (`Chirp_id`) REFERENCES `chirp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp_attachments`
--

LOCK TABLES `chirp_attachments` WRITE;
/*!40000 ALTER TABLE `chirp_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `chirp_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirpbroadcast`
--

DROP TABLE IF EXISTS `chirpbroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirpbroadcast` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` date DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e35wap9coceo2ewdmvdqac920` (`event_id`),
  CONSTRAINT `FK_e35wap9coceo2ewdmvdqac920` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirpbroadcast`
--

LOCK TABLES `chirpbroadcast` WRITE;
/*!40000 ALTER TABLE `chirpbroadcast` DISABLE KEYS */;
INSERT INTO `chirpbroadcast` VALUES (115,0,'2016-10-12','titulo broadcast 1','Este no lo quiere nadie',104),(116,0,'2016-10-12','titulo broadcast 2','va a llover',104),(117,0,'2016-10-12','titulo broadcast 3','sa suspendio la funcion',111),(118,0,'2016-10-12','titulo broadcast 4','sa suspendio la funcion otra vez',112),(119,0,'2016-10-12','titulo broadcast 5','sa suspendio la funcion otra vez',113);
/*!40000 ALTER TABLE `chirpbroadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirpbroadcast_attachments`
--

DROP TABLE IF EXISTS `chirpbroadcast_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirpbroadcast_attachments` (
  `ChirpBroadcast_id` int(11) NOT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  KEY `FK_ejhtj210jq4sdbqwu947ma0sn` (`ChirpBroadcast_id`),
  CONSTRAINT `FK_ejhtj210jq4sdbqwu947ma0sn` FOREIGN KEY (`ChirpBroadcast_id`) REFERENCES `chirpbroadcast` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirpbroadcast_attachments`
--

LOCK TABLES `chirpbroadcast_attachments` WRITE;
/*!40000 ALTER TABLE `chirpbroadcast_attachments` DISABLE KEYS */;
INSERT INTO `chirpbroadcast_attachments` VALUES (115,'http://www.twitter.com'),(116,'http://www.twitter.com'),(117,'http://www.twitter.com'),(118,'http://www.twitter.com'),(119,'http://www.twitter.com');
/*!40000 ALTER TABLE `chirpbroadcast_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chorbi`
--

DROP TABLE IF EXISTS `chorbi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chorbi` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  `avgStars` double DEFAULT NULL,
  `banned` bit(1) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `accountNumber` varchar(255) DEFAULT NULL,
  `brandName` int(11) DEFAULT NULL,
  `cVV` int(11) DEFAULT NULL,
  `expirationMonth` int(11) DEFAULT NULL,
  `expirationYear` int(11) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL,
  `kindOfRelationship` int(11) DEFAULT NULL,
  `numStars` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `totalFee` double DEFAULT NULL,
  `coordinates_id` int(11) DEFAULT NULL,
  `searchComplete_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qrvmwkp25xc5exr6m3jgaxu4x` (`userAccount_id`),
  KEY `UK_6xvlagjrb5shtl4hw30mpm8ix` (`kindOfRelationship`),
  KEY `UK_ovkyoevssjuf41lisig22x0b8` (`birthDate`),
  KEY `UK_5wdj0ha7n2mjpiojoe3gy0qh9` (`description`),
  KEY `UK_hdlfsw7lxgcbclq2iom6me4h8` (`genre`),
  KEY `FK_hjmrn8vvm3631n2jvyojlilsj` (`coordinates_id`),
  KEY `FK_k7ibta9mi6lucwk776tk0s47t` (`searchComplete_id`),
  CONSTRAINT `FK_qrvmwkp25xc5exr6m3jgaxu4x` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_hjmrn8vvm3631n2jvyojlilsj` FOREIGN KEY (`coordinates_id`) REFERENCES `coordinates` (`id`),
  CONSTRAINT `FK_k7ibta9mi6lucwk776tk0s47t` FOREIGN KEY (`searchComplete_id`) REFERENCES `searching` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chorbi`
--

LOCK TABLES `chorbi` WRITE;
/*!40000 ALTER TABLE `chorbi` DISABLE KEYS */;
INSERT INTO `chorbi` VALUES (121,1,'wisa@us.es','Antonio','955888632','Carras Marq',120,NULL,'\0','1996-10-22','4149390898022867',0,396,1,2019,'Tarjeta1','Busco amigas jeje',0,1,NULL,'http://www.garuyo.com/sites/default/files/images/2014/05/hombres-sexy-rockeros_130860.jpg_547813373.jpg',1,80,122),(124,1,'casol@us.es','Casol','955788632','El ligon',123,NULL,'\0','1996-03-29','4563804981065093',0,683,1,2019,'Tarjeta3','Me gustan todas',0,1,NULL,'http://lh5.ggpht.com/-NKEw62bEU9k/UyzgLbhXjlI/AAAAAAAAV0Y/6cEMKIGPz0Y/feoscosasdivertidas1_thumb1.png?imgmax=800',10,81,125),(127,0,'juanillo@us.es','Er Juan','935788632','master',126,NULL,'\0','1996-05-15','4985474478693946',1,216,1,2019,'Tarjeta2','A por todas',0,2,NULL,'https://gcdn.emol.cl/hombres/files/2013/10/feo-3.jpg',0,82,NULL),(129,0,'borderline@us.es','Pepe','935788631','Strifler',128,NULL,'\0','1996-05-18','4985474478693946',1,216,1,2019,'Tarjeta2','No se lo que me gusta',0,2,NULL,'https://gcdn.emol.cl/hombres/files/2013/10/feo-7.jpg',4,85,NULL),(131,0,'barto@us.es','Bartolo','935788231','er Camionero',130,NULL,'\0','1990-05-18','4563804981065093',0,683,1,2019,'Tarjeta3','Violador de camioneros en la S30',0,0,NULL,'http://img.rtve.es/v/3112919/',0,83,NULL),(133,0,'lajessy@us.es','la Jessy','935782831','la guay del barrio',132,2,'\0','1995-12-18','4563804981065093',0,683,1,2019,'Tarjeta3','Diva se nace no se hace',1,0,2,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRf9uBXXz77v7quaSPXDQRdVm-XvfFKeLrKLLTDVoRjO6OcJWlgUw',4,86,NULL),(135,0,'lajuany@us.es','la Juany','975782831','la envidiada',134,0,'\0','1995-12-25','4985474478693946',1,216,1,2019,'Tarjeta2','De tu envida sale mi fama',1,2,0,'http://www.lahiguera.net/cinemania/actores/veronica_echegui/fotos/3460/veronica_echegui.jpg',2,84,NULL),(137,0,'lamary@us.es','la mary','975782831','la diva',136,1,'\0','1994-12-25','4985474478693946',1,216,1,2019,'Tarjeta2','Te miro por encima ed tu hombro',1,2,1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReG9CLSjQGVjAuEIqcVrvih9BZDxIg84lHNgjQinRtRZQPNv-p',4,88,NULL),(139,0,'lacastada@us.es','la laurita','975789831','la castada',138,3,'','1996-12-25','4985474478693946',1,216,1,2019,'Tarjeta2','Me encanta hacer castadas',1,1,3,'http://3.bp.blogspot.com/_Yo_dpYfwiJI/TBSby3mdYnI/AAAAAAAAAHg/ToJSoLpNsfs/s1600/cani2kq8.jpg',5,91,NULL),(141,0,'latronca@us.es','la tronca','977782831','del arbol',140,NULL,'\0','1991-12-25','4563804981065093',0,683,1,2019,'Tarjeta3','Mi vida es un arbol caido',1,1,NULL,'http://1.bp.blogspot.com/_6_NBn7UBQA4/TL7CaHoonbI/AAAAAAAAIY8/c0tHM3REwqY/s400/lydia1gd.jpg',4,87,NULL);
/*!40000 ALTER TABLE `chorbi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chorbi_event`
--

DROP TABLE IF EXISTS `chorbi_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chorbi_event` (
  `Chorbi_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  KEY `FK_8u6bk1ul230x0i5g0ftnk5ijr` (`event_id`),
  KEY `FK_dyykoiykndln5kuj0fyvvdt6j` (`Chorbi_id`),
  CONSTRAINT `FK_dyykoiykndln5kuj0fyvvdt6j` FOREIGN KEY (`Chorbi_id`) REFERENCES `chorbi` (`id`),
  CONSTRAINT `FK_8u6bk1ul230x0i5g0ftnk5ijr` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chorbi_event`
--

LOCK TABLES `chorbi_event` WRITE;
/*!40000 ALTER TABLE `chorbi_event` DISABLE KEYS */;
INSERT INTO `chorbi_event` VALUES (121,104),(121,111),(121,112),(121,113),(124,104),(124,113),(129,104),(129,111),(129,112),(129,113),(133,104),(135,104),(135,111),(137,112),(137,113),(139,113),(141,104),(141,111),(141,112),(141,113);
/*!40000 ALTER TABLE `chorbi_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinates`
--

DROP TABLE IF EXISTS `coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinates` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_euu6v4as8xmbdohwle87755dd` (`country`),
  KEY `UK_d70etifmvemmrunavcayuh821` (`state`),
  KEY `UK_9pfiy0hcosbd9ksl8u9b7q06o` (`province`),
  KEY `UK_pvt53kmofix4yr038656p7lsu` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinates`
--

LOCK TABLES `coordinates` WRITE;
/*!40000 ALTER TABLE `coordinates` DISABLE KEYS */;
INSERT INTO `coordinates` VALUES (80,0,'Talarrubia','Spain','Badajoz','Extremadura'),(81,0,'Brenes','Spain','Sevilla','Andalucia'),(82,0,'Cantillana','Spain','Sevilla','Andalucia'),(83,0,'Talarrubia','Spain','Badajoz','Extremadura'),(84,0,'Brenes','Spain','Sevilla','Andalucia'),(85,0,'Cantillana','Spain','Sevilla','Andalucia'),(86,0,'Talarrubia','Spain','Badajoz','Extremadura'),(87,0,'Brenes','Spain','Sevilla','Andalucia'),(88,0,'Cantillana','Spain','Sevilla','Andalucia'),(89,0,'Talarrubia','Spain','Badajoz','Extremadura'),(90,0,'Brenes','Spain','Sevilla','Andalucia'),(91,0,'Cantillana','Spain','Sevilla','Andalucia');
/*!40000 ALTER TABLE `coordinates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `borrado` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `eventMoment` date DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `remainingSeats` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cm6wrj8rjwiu1ftcjtq0l6wuo` (`manager_id`),
  CONSTRAINT `FK_cm6wrj8rjwiu1ftcjtq0l6wuo` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (104,0,'','Que feo eres illo','2016-05-10','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',20,40,'titulo evento 1',95),(105,0,'\0','Que feo eres illo','2017-05-30','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',40,40,'titulo evento 6',95),(106,0,'\0','Que feo eres illo','2017-05-30','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',35,40,'titulo evento 6',95),(107,0,'\0','Que feo eres illo','2017-05-30','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',30,40,'titulo evento 6',95),(108,0,'\0','Que feo eres illo','2017-05-30','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',25,40,'titulo evento 6',95),(109,0,'\0','Que feo eres illo','2017-05-30','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',20,40,'titulo evento 6',95),(110,0,'\0','Que feo eres illo','2017-05-30','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',15,40,'titulo evento 6',95),(111,0,'\0','Se Casol','2017-04-10','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',10,10,'titulo evento 2',95),(112,0,'\0','Gafas de Pino Baratas','2017-03-10','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',5,15,'titulo evento 3',97),(113,0,'\0','Esto ya cansa','2018-10-12','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',10,100,'titulo evento 4',99),(114,0,'\0','Este no lo quiere nadie','2017-10-11','https://image.freepik.com/vector-gratis/piratas-simple_17-1111184221.jpg',50,150,'titulo evento 5',101);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_chorbi`
--

DROP TABLE IF EXISTS `event_chorbi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_chorbi` (
  `Event_id` int(11) NOT NULL,
  `chorbi_id` int(11) NOT NULL,
  KEY `FK_fljwkl3hnr5f6otmsxuotjdmj` (`chorbi_id`),
  KEY `FK_5uahmqgn27ap6mv4m43irmwjy` (`Event_id`),
  CONSTRAINT `FK_5uahmqgn27ap6mv4m43irmwjy` FOREIGN KEY (`Event_id`) REFERENCES `event` (`id`),
  CONSTRAINT `FK_fljwkl3hnr5f6otmsxuotjdmj` FOREIGN KEY (`chorbi_id`) REFERENCES `chorbi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_chorbi`
--

LOCK TABLES `event_chorbi` WRITE;
/*!40000 ALTER TABLE `event_chorbi` DISABLE KEYS */;
INSERT INTO `event_chorbi` VALUES (104,121),(104,124),(104,129),(104,133),(104,135),(104,141),(111,121),(111,129),(111,135),(111,141),(112,121),(112,129),(112,137),(112,141),(113,121),(113,124),(113,129),(113,137),(113,141);
/*!40000 ALTER TABLE `event_chorbi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global`
--

DROP TABLE IF EXISTS `global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `chorbiFee` double DEFAULT NULL,
  `hoursSearchCached` int(11) DEFAULT NULL,
  `managerFee` double DEFAULT NULL,
  `minutesSearchCached` int(11) DEFAULT NULL,
  `secondsSearchCached` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global`
--

LOCK TABLES `global` WRITE;
/*!40000 ALTER TABLE `global` DISABLE KEYS */;
INSERT INTO `global` VALUES (152,0,0,12,0,0,0);
/*!40000 ALTER TABLE `global` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',3);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `accountNumber` varchar(255) DEFAULT NULL,
  `brandName` int(11) DEFAULT NULL,
  `cVV` int(11) DEFAULT NULL,
  `expirationMonth` int(11) DEFAULT NULL,
  `expirationYear` int(11) DEFAULT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `totalFee` double DEFAULT NULL,
  `vatNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_84bmmxlq61tiaoc7dy7kdcghh` (`userAccount_id`),
  CONSTRAINT `FK_84bmmxlq61tiaoc7dy7kdcghh` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (95,0,'porki@us.es','Spider Cerdo','696969696','the pork',94,'Mapfre','4149390898022867',0,396,1,2019,'Tarjeta1',10,'Hola123'),(97,0,'cipote@us.es','HarryPopotter','999999999','the Popotter Mage',96,'Orange','4563804981065093',0,683,1,2019,'Tarjeta3',10,'Adios123'),(99,0,'Mongo@us.es','Mongomerings Burns','123456789','Burns',98,'RedBull','4985474478693946',1,216,1,2019,'Tarjeta2',0,'Toro69'),(101,0,'Holita@us.es','Ned Flanders','121212121','Holita vecinito',100,'Monster','4563804981065093',0,683,1,2019,'Tarjeta3',15,'Hoooo1'),(103,0,'SheRalhp@us.es','Ralph Bigunm','000000001','PatoPatoPatoPatoPatoPatoPato....',102,'CocaColita','4149390898022867',0,396,1,2019,'Tarjeta1',5,'34queso');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searching`
--

DROP TABLE IF EXISTS `searching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searching` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `kindOfRelationship` int(11) DEFAULT NULL,
  `timeCache` date DEFAULT NULL,
  `chorbiComplete_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_40dnhm1sjhbf2kow7tpa0f5u8` (`chorbiComplete_id`),
  CONSTRAINT `FK_40dnhm1sjhbf2kow7tpa0f5u8` FOREIGN KEY (`chorbiComplete_id`) REFERENCES `chorbi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searching`
--

LOCK TABLES `searching` WRITE;
/*!40000 ALTER TABLE `searching` DISABLE KEYS */;
INSERT INTO `searching` VALUES (122,0,NULL,NULL,NULL,NULL,'2016-04-22',121),(125,0,NULL,NULL,NULL,NULL,'2016-04-22',124);
/*!40000 ALTER TABLE `searching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searching_chorbi`
--

DROP TABLE IF EXISTS `searching_chorbi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searching_chorbi` (
  `Searching_id` int(11) NOT NULL,
  `chorbiCache_id` int(11) NOT NULL,
  KEY `FK_88xuooc74t55wxndffqps8jki` (`chorbiCache_id`),
  KEY `FK_63aqcfsu3a809vbxfio9oq3fu` (`Searching_id`),
  CONSTRAINT `FK_63aqcfsu3a809vbxfio9oq3fu` FOREIGN KEY (`Searching_id`) REFERENCES `searching` (`id`),
  CONSTRAINT `FK_88xuooc74t55wxndffqps8jki` FOREIGN KEY (`chorbiCache_id`) REFERENCES `chorbi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searching_chorbi`
--

LOCK TABLES `searching_chorbi` WRITE;
/*!40000 ALTER TABLE `searching_chorbi` DISABLE KEYS */;
/*!40000 ALTER TABLE `searching_chorbi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searching_coordinates`
--

DROP TABLE IF EXISTS `searching_coordinates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searching_coordinates` (
  `Searching_id` int(11) NOT NULL,
  `coordinates_id` int(11) NOT NULL,
  UNIQUE KEY `UK_meoyhntlwqybtahgu1jg03mgi` (`coordinates_id`),
  KEY `FK_3m5hmpm881vmg0xwawt1btfwi` (`Searching_id`),
  CONSTRAINT `FK_3m5hmpm881vmg0xwawt1btfwi` FOREIGN KEY (`Searching_id`) REFERENCES `searching` (`id`),
  CONSTRAINT `FK_meoyhntlwqybtahgu1jg03mgi` FOREIGN KEY (`coordinates_id`) REFERENCES `coordinates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searching_coordinates`
--

LOCK TABLES `searching_coordinates` WRITE;
/*!40000 ALTER TABLE `searching_coordinates` DISABLE KEYS */;
INSERT INTO `searching_coordinates` VALUES (122,89),(122,90);
/*!40000 ALTER TABLE `searching_coordinates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taste`
--

DROP TABLE IF EXISTS `taste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taste` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `moment` date DEFAULT NULL,
  `starts` int(11) DEFAULT NULL,
  `chorbiWhoIsLiked_id` int(11) NOT NULL,
  `chorbiWhoLiked_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_isjvkj1y17ndqkxskp1itor0` (`chorbiWhoIsLiked_id`),
  KEY `FK_31wm03ws0k0tsaw867on94f1j` (`chorbiWhoLiked_id`),
  CONSTRAINT `FK_31wm03ws0k0tsaw867on94f1j` FOREIGN KEY (`chorbiWhoLiked_id`) REFERENCES `chorbi` (`id`),
  CONSTRAINT `FK_isjvkj1y17ndqkxskp1itor0` FOREIGN KEY (`chorbiWhoIsLiked_id`) REFERENCES `chorbi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taste`
--

LOCK TABLES `taste` WRITE;
/*!40000 ALTER TABLE `taste` DISABLE KEYS */;
INSERT INTO `taste` VALUES (142,0,'Madre mia que rica','2007-12-25',2,133,121),(143,0,'Madre mia que rica','2007-12-25',0,135,124),(144,0,'Madre mia que rica','2007-12-25',1,137,127),(145,0,'Madre mia que rica','2007-12-25',3,139,129),(146,0,'Madre mia que rica','2007-12-25',NULL,141,131);
/*!40000 ALTER TABLE `taste` ENABLE KEYS */;
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
INSERT INTO `useraccount` VALUES (92,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(94,0,'c240642ddef994358c96da82c0361a58','manager1'),(96,0,'8df5127cd164b5bc2d2b78410a7eea0c','manager2'),(98,0,'2d3a5db4a2a9717b43698520a8de57d0','manager3'),(100,0,'e1ec6fc941af3ba79a4ac5242dd39735','manager4'),(102,0,'029cb1d27c0b9c551703ccba2591c334','manager5'),(120,0,'3daa859a294cdefb20a84840240a76f5','chorbi1'),(123,0,'0c8746de81268518ff83490301db8652','chorbi2'),(126,0,'a2da05a88eead7e64593826cafc6a7a7','chorbi3'),(128,0,'a09dd233386632e297a7f4f461989563','chorbi4'),(130,0,'7e062f6f2a4c0f7ec5abacef2917e033','chorbi5'),(132,0,'0b41c51bd4b755c5b639498f55058fd3','chorbi6'),(134,0,'cd33d975ad65688dc4d54b67ed48fd1a','chorbi7'),(136,0,'cf0216b73314f84c64fd88f5adf4dfb2','chorbi8'),(138,0,'f33e074e9fd8e9289b7f0d790acb917c','chorbi9'),(140,0,'5e446ee1e7cc817c52cc5d464ded75c5','chorbi10');
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
INSERT INTO `useraccount_authorities` VALUES (92,'ADMINISTRATOR'),(94,'MANAGER'),(96,'MANAGER'),(98,'MANAGER'),(100,'MANAGER'),(102,'MANAGER'),(120,'CHORBI'),(123,'CHORBI'),(126,'CHORBI'),(128,'CHORBI'),(130,'CHORBI'),(132,'CHORBI'),(134,'CHORBI'),(136,'CHORBI'),(138,'CHORBI'),(140,'CHORBI');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-01 23:55:09
commit;