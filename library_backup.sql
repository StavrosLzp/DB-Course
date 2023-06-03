-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_first_name` varchar(45) NOT NULL,
  `author_last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`author_id`),
  KEY `idx_author_last_name` (`author_last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Stephanie','Gould'),(2,'Brian','Miller'),(3,'Mary','Fitzgerald'),(4,'Elizabeth','Parker'),(5,'Catherine','Lawson'),(6,'Bianca','Moore'),(7,'Ryan','Long'),(8,'Jennifer','Cooley'),(9,'Stacy','Stephens'),(10,'Sean','Adams'),(11,'Barry','Johnson'),(12,'Steven','Flores'),(13,'Norman','Snow'),(14,'Alicia','Castro'),(15,'Joel','Johnson'),(16,'Mark','Taylor'),(17,'William','Lutz'),(18,'Emily','White'),(19,'Patricia','Robles'),(20,'Jessica','Knox'),(21,'Mary','Knox');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_ISBN` varchar(20) NOT NULL,
  `book_title` varchar(60) NOT NULL,
  `book_page_no` int unsigned NOT NULL,
  `book_language` varchar(45) NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `idx_book_title` (`book_title`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'1-57267-837-2','Understand may story government',2250,'Frech'),(2,'1-59877-352-6','Environmental treat finally whatever relationship mean',2873,'German'),(3,'1-378-59150-X','Young blood off any',1448,'German'),(4,'0-8243-3060-9','Gun commercial pull',909,'German'),(5,'0-10-005422-6','Mission ability operation some',3839,'German'),(6,'0-00-591457-4','Final necessary painting',4391,'Greek'),(7,'1-69273-151-3','Language themselves camera',2106,'English'),(8,'1-85254-496-1','Record where provide',334,'Frech'),(9,'0-222-17380-7','Discussion know economy option',4459,'German'),(10,'1-64802-066-6','Book rich drive between',1782,'Frech'),(11,'0-13-087748-4','Defense trade white rock its',789,'German'),(12,'0-689-21750-1','Whether budget hand real usually final',4208,'English'),(13,'0-14-307067-3','Decade open available expect health',3736,'Greek'),(14,'0-7319-5672-9','House business business ball sure',338,'German'),(15,'0-10-970745-1','Center heart machine tend rest',2418,'German'),(16,'1-4632-7948-5','Receive recognize base road office',3676,'English'),(17,'1-282-61102-X','Hospital remain those forget',4381,'Greek'),(18,'1-128-61583-5','Either thus leave reflect identify yet',2554,'German'),(19,'1-70962-680-1','Ever effect rule include possible growth',4320,'Greek'),(20,'0-389-36605-6','Model trade letter concern behind',1641,'Frech'),(21,'0-9963168-3-3','Season only course sound',3532,'English'),(22,'0-9674892-7-X','Win set go town',2299,'English'),(23,'1-57487-019-X','Community seek six identify push',2646,'English'),(24,'0-276-74204-4','Level ability alone sure nor daughter',3786,'English'),(25,'1-278-41454-1','Position somebody president hotel subject',4190,'Frech'),(26,'0-698-28140-3','Wear no mission article',3281,'English'),(27,'0-653-55157-6','Coach kind factor thus two',1875,'German'),(28,'0-452-13735-7','Green somebody do speak',4822,'Frech'),(29,'1-5498-9564-8','Performance provide happen house company whatever',999,'English'),(30,'1-71256-201-0','Cold baby there run prepare',3813,'Greek'),(31,'1-396-84725-1','Dark marriage wife six former',4826,'Greek'),(32,'1-5415-3339-9','From head should',2918,'German'),(33,'0-216-74258-7','Suddenly full should particular house young',4928,'Frech'),(34,'1-79589-919-0','Mrs world writer subject lawyer in',3418,'English'),(35,'0-17-921821-2','Figure something across black go',2532,'English'),(36,'0-261-57073-0','Loss next catch',3507,'German'),(37,'0-380-85832-0','Man capital bring board deep',1973,'German'),(38,'0-659-68828-X','Street character whatever',3363,'English'),(39,'1-345-62626-6','Something specific none list expect',3851,'Greek'),(40,'1-362-81098-3','Defense hot although catch',2352,'Greek'),(41,'1-78032-950-4','Young cell really true',1001,'German'),(42,'1-4325-4891-3','Together property almost father television',2374,'English'),(43,'0-365-48698-1','Involve can color themselves',4190,'German'),(44,'1-67949-397-3','Court light of finally color',4770,'English'),(45,'0-9924384-1-1','Smile ahead yard',3238,'English'),(46,'1-84571-670-1','Often car character parent',3139,'Greek'),(47,'0-9741773-2-6','Federal who unit data region them',2933,'Greek'),(48,'1-338-04329-3','Station budget lay house which',2591,'Greek'),(49,'0-330-88198-1','Approach religious husband',2862,'Greek'),(50,'0-585-87917-6','Evidence ahead among power',3450,'German'),(51,'1-380-92418-9','Beautiful prove join cell financial produce',4741,'Greek'),(52,'0-85519-519-3','Guy way player source time',3268,'German'),(53,'0-05-605801-2','Media show investment dream consider party',1074,'Frech'),(54,'1-240-03936-0','Training book others',1999,'Greek'),(55,'0-383-10618-4','Old determine moment you',1297,'Greek'),(56,'1-226-27509-5','Might key join week',2660,'German'),(57,'0-7925-2042-4','Point now economy',4934,'English'),(58,'1-7366435-0-9','Perform agreement few style win',1249,'Greek'),(59,'1-4377-5897-5','New movement leave weight',3191,'Frech'),(60,'1-183-61697-X','Miss bed score strategy laugh walk',2843,'German'),(61,'1-223-26772-5','Enough fine trouble federal research',639,'German'),(62,'1-06-903711-7','Walk gun painting',1131,'German'),(63,'0-518-97693-9','Those owner general field cause',2428,'Greek'),(64,'0-567-90793-7','Scientist foreign free sit',1487,'Frech'),(65,'1-74183-953-X','Suddenly wonder Congress drug specific',1104,'Frech'),(66,'0-9736493-8-0','Ability short science power',2325,'Frech'),(67,'0-7902-3309-6','Lead police scientist',4552,'Frech'),(68,'1-900514-09-5','Line business when compare source',1392,'German'),(69,'0-427-81844-3','Natural night back',3642,'Frech'),(70,'0-947305-70-X','Work table go',3834,'Greek'),(71,'0-323-05141-3','Simple mean TV window weight',2356,'English'),(72,'1-263-48005-5','Rest technology send',4660,'Greek'),(73,'1-65744-121-0','Start today good',4864,'German'),(74,'1-9821-3935-8','Themselves project decide',1086,'Frech'),(75,'1-67852-810-2','Range help inside',1734,'Frech'),(76,'1-9811-8992-0','Product perform report Mr',702,'English'),(77,'0-8337-6715-1','Answer blood adult bring',1774,'English'),(78,'1-83563-022-7','Usually store commercial',570,'Frech'),(79,'0-467-01601-1','Couple ability some',1274,'Frech'),(80,'1-224-44938-X','Finally indicate low success',3594,'Greek'),(81,'1-264-97869-3','Much none eight include old',3481,'Frech'),(82,'1-84235-133-8','Call member course hope speech',4506,'English'),(83,'1-72815-238-0','Job all hot',856,'Frech'),(84,'0-263-39384-4','Everything energy agent people hundred travel',1453,'Frech'),(85,'0-7385-4075-7','Land debate election season',2914,'Greek'),(86,'1-05-063267-2','Instead yourself available',2261,'Greek'),(87,'0-618-92005-6','Wish present serve live',1822,'Greek'),(88,'0-01-308802-5','Far build poor',2258,'Greek'),(89,'1-4162-6033-1','Tough respond myself allow',533,'Greek'),(90,'0-393-03329-5','Color but customer',4201,'English'),(91,'1-5132-9315-X','Reality decide hit able director yes',3011,'Frech'),(92,'1-4840-4178-X','Part great white',4994,'German'),(93,'1-182-93921-X','Ball century ahead heart look',628,'English'),(94,'1-315-54623-X','Else source under role stock account',1288,'Greek'),(95,'1-07-833310-6','Born born none',791,'Greek'),(96,'0-02-133148-0','Training box wonder consider others culture',2017,'English'),(97,'0-00-177090-X','Stand forward author throw',533,'Frech'),(98,'0-231-64714-X','Performance their heavy only different task',2631,'English'),(99,'0-7650-7067-7','Speak imagine popular tell',3357,'English'),(100,'1-4174-4632-3','Than sell everybody record',2476,'Frech'),(101,'5-57237-837-7','Understand government',445,'Greek');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_book_id` int NOT NULL,
  `author_author_id` int unsigned NOT NULL,
  PRIMARY KEY (`book_book_id`,`author_author_id`),
  KEY `fk_book_author_author1_idx` (`author_author_id`),
  KEY `fk_book_author_book1_idx` (`book_book_id`),
  CONSTRAINT `fk_book_author_author1` FOREIGN KEY (`author_author_id`) REFERENCES `author` (`author_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_book_author_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (2,1),(32,1),(58,1),(61,1),(72,1),(75,1),(5,2),(42,2),(52,2),(59,2),(91,2),(17,3),(19,3),(29,3),(66,3),(67,3),(69,3),(73,3),(22,4),(36,4),(38,4),(40,4),(49,4),(62,4),(90,4),(9,5),(27,5),(39,5),(46,5),(56,5),(75,5),(94,5),(17,6),(26,6),(30,6),(32,6),(49,6),(92,6),(6,7),(7,7),(13,7),(78,7),(79,7),(84,7),(87,7),(92,7),(4,8),(25,8),(37,8),(74,8),(88,8),(57,9),(76,9),(8,10),(15,10),(36,10),(50,10),(55,10),(76,10),(82,10),(85,10),(14,11),(51,11),(57,11),(64,11),(81,11),(1,12),(9,12),(20,12),(21,12),(34,12),(46,12),(65,12),(87,12),(97,12),(100,12),(14,13),(18,13),(41,13),(45,13),(47,13),(60,13),(71,13),(93,13),(96,13),(97,13),(7,14),(21,14),(31,14),(39,14),(59,14),(86,14),(96,14),(99,14),(22,15),(29,15),(30,15),(35,15),(37,15),(43,15),(48,15),(50,15),(68,15),(70,15),(78,15),(16,16),(23,16),(63,16),(83,16),(95,16),(20,17),(35,17),(41,17),(44,17),(71,17),(84,17),(2,18),(8,18),(10,18),(18,18),(38,18),(42,18),(54,18),(58,18),(81,18),(88,18),(89,18),(93,18),(98,18),(1,19),(3,19),(13,19),(24,19),(28,19),(44,19),(53,19),(67,19),(89,19),(94,19),(6,20),(11,20),(12,20),(23,20),(24,20),(33,20),(40,20),(73,20),(77,20),(80,20),(83,20),(91,20),(101,21);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_author_if_all_books_deleted` AFTER DELETE ON `book_author` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM book_author WHERE author_author_id = OLD.author_author_id) THEN
		DELETE FROM author WHERE author_id = OLD.author_author_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `category_category_id` int unsigned NOT NULL,
  `book_book_id` int NOT NULL,
  PRIMARY KEY (`category_category_id`,`book_book_id`),
  KEY `fk_book_category_category1_idx` (`category_category_id`),
  KEY `fk_book_category_book1_idx` (`book_book_id`),
  CONSTRAINT `fk_book_category_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_book_category_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (1,3),(1,9),(1,45),(1,54),(1,64),(1,69),(1,77),(1,100),(2,1),(2,4),(2,7),(2,34),(2,40),(2,81),(2,98),(3,4),(3,19),(3,21),(3,24),(3,28),(3,29),(3,42),(3,50),(3,54),(3,57),(3,62),(3,68),(3,75),(3,78),(3,95),(4,8),(4,12),(4,48),(4,49),(4,92),(4,100),(5,5),(5,24),(5,33),(5,39),(5,44),(5,45),(5,48),(5,53),(5,64),(6,8),(6,9),(6,22),(6,29),(6,31),(6,32),(6,33),(6,36),(6,47),(6,55),(6,61),(6,80),(6,84),(6,85),(6,90),(6,99),(7,25),(7,26),(7,54),(7,58),(7,62),(7,70),(7,79),(7,80),(7,83),(8,10),(8,21),(8,27),(8,33),(8,52),(8,53),(8,58),(8,67),(8,73),(8,79),(8,91),(9,13),(9,16),(9,27),(9,31),(9,36),(9,40),(9,55),(9,57),(9,58),(9,60),(9,63),(9,65),(9,69),(9,72),(9,91),(10,22),(10,37),(10,75),(10,81),(10,89),(10,96),(11,30),(11,39),(11,40),(11,53),(11,56),(11,63),(11,66),(11,70),(11,71),(11,93),(12,7),(12,15),(12,26),(12,63),(12,66),(12,73),(12,77),(13,24),(13,34),(13,48),(13,50),(13,52),(13,61),(13,75),(14,28),(14,46),(14,47),(14,50),(14,51),(14,56),(14,60),(14,74),(14,78),(14,79),(14,86),(14,87),(14,88),(14,97),(15,1),(15,2),(15,10),(15,12),(15,32),(15,37),(15,52),(15,68),(15,74),(15,76),(15,85),(15,89),(16,2),(16,7),(16,14),(16,15),(16,16),(16,18),(16,23),(16,25),(16,26),(16,31),(16,37),(16,38),(16,41),(16,45),(16,62),(16,67),(16,73),(16,88),(16,93),(17,11),(17,12),(17,18),(17,22),(17,42),(17,43),(17,44),(17,46),(17,49),(17,59),(17,72),(17,74),(17,84),(17,86),(18,5),(18,11),(18,18),(18,41),(18,80),(18,82),(18,83),(18,84),(18,95),(19,6),(19,9),(19,14),(19,16),(19,23),(19,29),(19,30),(19,35),(19,59),(19,68),(19,71),(19,81),(19,87),(19,90),(20,3),(20,6),(20,10),(20,13),(20,20),(20,47),(20,76),(20,90),(20,94),(21,20),(21,35),(21,39),(21,57),(21,65),(21,69),(21,82),(21,83),(21,88),(21,92),(21,99),(22,5),(22,17),(22,27),(22,28),(22,38),(22,44),(22,55),(22,78),(22,95),(22,96),(22,98),(23,17),(23,23),(23,34),(23,42),(23,43),(23,51),(23,72),(23,87),(23,94),(23,97),(24,17),(24,19),(24,20),(24,21),(24,38),(24,61),(24,66),(24,71),(24,92),(24,93);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_keyword`
--

DROP TABLE IF EXISTS `book_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_keyword` (
  `keyword_keyword_id` int unsigned NOT NULL,
  `book_book_id` int NOT NULL,
  PRIMARY KEY (`keyword_keyword_id`,`book_book_id`),
  KEY `fk_table1_book1_idx` (`book_book_id`),
  CONSTRAINT `fk_table1_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_table1_keyword1` FOREIGN KEY (`keyword_keyword_id`) REFERENCES `keyword` (`keyword_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_keyword`
--

LOCK TABLES `book_keyword` WRITE;
/*!40000 ALTER TABLE `book_keyword` DISABLE KEYS */;
INSERT INTO `book_keyword` VALUES (40,1),(44,1),(45,1),(52,1),(70,1),(15,2),(27,2),(49,2),(64,2),(72,2),(83,2),(36,3),(82,3),(26,4),(60,4),(66,4),(93,4),(94,4),(95,4),(40,5),(53,5),(67,5),(90,5),(92,5),(96,5),(58,6),(80,6),(86,6),(1,7),(26,7),(47,7),(50,7),(68,7),(87,7),(44,8),(52,8),(55,8),(75,8),(80,8),(94,8),(64,9),(96,9),(38,10),(82,10),(84,10),(53,11),(93,11),(51,12),(82,12),(100,12),(10,13),(23,13),(99,13),(100,13),(2,14),(34,14),(45,14),(53,14),(88,14),(91,14),(20,15),(22,15),(34,15),(39,15),(60,15),(63,15),(6,16),(13,16),(35,16),(66,16),(96,16),(3,17),(9,17),(46,17),(55,17),(57,17),(85,17),(21,18),(65,18),(91,18),(52,19),(82,19),(27,20),(39,20),(68,20),(78,20),(31,21),(35,21),(43,21),(10,22),(90,22),(48,23),(60,23),(66,23),(72,23),(85,23),(95,23),(22,24),(39,24),(30,25),(35,25),(46,25),(51,25),(79,25),(95,25),(23,26),(34,26),(43,26),(52,26),(62,26),(79,26),(34,27),(79,27),(91,27),(4,28),(80,28),(85,28),(32,29),(35,29),(41,29),(56,29),(98,29),(10,30),(81,30),(94,30),(57,31),(75,31),(94,31),(34,32),(59,32),(78,32),(18,33),(21,33),(47,33),(57,33),(92,33),(100,33),(15,34),(31,34),(52,34),(97,34),(40,35),(88,35),(92,35),(14,36),(30,36),(6,37),(13,37),(24,37),(42,37),(64,37),(3,38),(77,38),(5,39),(64,39),(88,39),(36,40),(44,40),(57,40),(79,40),(85,40),(93,40),(79,41),(89,41),(13,42),(29,42),(52,42),(49,43),(58,43),(64,43),(30,44),(31,44),(37,44),(28,45),(50,45),(58,45),(71,45),(75,45),(15,46),(43,46),(64,46),(76,46),(2,47),(6,47),(11,47),(41,48),(62,48),(21,49),(26,49),(37,49),(52,49),(75,49),(2,50),(4,50),(50,50),(8,51),(70,51),(86,51),(11,52),(17,52),(33,52),(49,52),(60,52),(84,52),(2,53),(5,53),(8,53),(69,53),(6,54),(16,54),(17,54),(36,54),(56,54),(100,54),(4,55),(25,55),(17,56),(36,56),(82,56),(88,56),(96,56),(50,57),(58,57),(85,57),(34,58),(35,58),(81,58),(83,58),(8,59),(32,59),(76,59),(23,60),(45,60),(55,60),(72,60),(78,60),(90,60),(8,61),(26,61),(46,61),(53,61),(69,61),(71,61),(9,62),(35,62),(55,62),(85,62),(92,62),(96,62),(10,63),(13,63),(23,63),(33,63),(93,63),(97,63),(8,64),(27,64),(55,64),(7,65),(82,65),(61,66),(66,66),(6,67),(13,67),(17,67),(41,67),(48,67),(69,67),(57,68),(86,68),(51,69),(91,69),(98,69),(4,70),(12,70),(35,70),(68,70),(95,70),(5,71),(11,71),(39,71),(42,71),(8,72),(34,72),(41,72),(94,72),(95,72),(15,73),(34,73),(49,73),(13,74),(32,74),(55,74),(65,74),(27,75),(43,75),(44,75),(51,75),(66,75),(75,75),(14,76),(17,76),(58,76),(68,76),(84,76),(4,77),(67,77),(69,77),(75,77),(90,77),(93,77),(21,78),(26,78),(48,78),(96,78),(13,79),(42,79),(45,79),(53,79),(67,79),(6,80),(9,80),(74,80),(41,81),(54,81),(69,81),(84,81),(35,82),(41,82),(42,82),(46,82),(2,83),(16,83),(20,83),(41,83),(65,83),(68,83),(9,84),(42,84),(58,84),(74,84),(47,85),(59,85),(62,85),(95,85),(7,86),(8,86),(11,86),(18,86),(75,86),(32,87),(33,87),(63,87),(74,87),(90,87),(96,87),(47,88),(48,88),(52,88),(83,88),(44,89),(60,89),(69,89),(77,89),(4,90),(19,90),(22,90),(29,90),(33,90),(88,90),(15,91),(18,91),(24,91),(53,91),(94,91),(99,91),(7,92),(13,92),(35,92),(70,92),(88,92),(92,92),(27,93),(34,93),(74,94),(81,94),(10,95),(11,95),(23,95),(28,95),(66,95),(83,95),(3,96),(48,96),(63,96),(76,96),(91,96),(26,97),(29,97),(64,97),(77,97),(55,98),(58,98),(87,98),(25,99),(62,99),(70,99),(93,99),(33,100),(53,100);
/*!40000 ALTER TABLE `book_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `books_written_per_author`
--

DROP TABLE IF EXISTS `books_written_per_author`;
/*!50001 DROP VIEW IF EXISTS `books_written_per_author`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `books_written_per_author` AS SELECT 
 1 AS `author_id`,
 1 AS `author_first_name`,
 1 AS `author_last_name`,
 1 AS `books_written`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `borrowing`
--

DROP TABLE IF EXISTS `borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowing` (
  `borrowing_id` int unsigned NOT NULL AUTO_INCREMENT,
  `borrowing_date` date NOT NULL,
  `borrowing_status` enum('active','returned') NOT NULL,
  `book_book_id` int NOT NULL,
  `library_user_user_id` int unsigned NOT NULL,
  PRIMARY KEY (`borrowing_id`),
  KEY `fk_borrowing_book1_idx` (`book_book_id`),
  KEY `fk_borrowing_library_user1_idx` (`library_user_user_id`),
  CONSTRAINT `fk_borrowing_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_borrowing_library_user1` FOREIGN KEY (`library_user_user_id`) REFERENCES `library_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=646 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowing`
--

LOCK TABLES `borrowing` WRITE;
/*!40000 ALTER TABLE `borrowing` DISABLE KEYS */;
INSERT INTO `borrowing` VALUES (1,'2021-07-16','returned',79,7),(2,'2022-09-03','returned',23,8),(3,'2022-06-19','returned',48,9),(4,'2022-12-14','returned',34,10),(5,'2021-02-21','returned',65,11),(6,'2023-04-17','returned',22,12),(7,'2022-03-07','returned',95,13),(8,'2021-04-21','returned',69,14),(9,'2021-08-19','returned',13,15),(10,'2022-03-07','returned',46,16),(11,'2023-02-06','returned',59,17),(12,'2021-09-27','returned',46,18),(13,'2021-06-29','returned',11,19),(14,'2021-03-02','returned',30,20),(15,'2021-09-02','returned',93,21),(16,'2021-05-08','returned',43,22),(17,'2021-11-03','returned',11,23),(18,'2020-12-25','returned',14,24),(19,'2022-01-12','returned',68,25),(20,'2023-03-26','returned',8,26),(21,'2022-06-11','returned',59,27),(22,'2021-02-21','returned',13,28),(23,'2022-04-13','returned',81,29),(24,'2021-04-08','returned',26,30),(25,'2021-05-17','returned',91,31),(26,'2022-01-20','returned',34,32),(27,'2022-09-25','returned',8,33),(28,'2022-06-01','returned',34,34),(29,'2021-11-13','returned',93,35),(30,'2022-10-01','returned',23,36),(31,'2021-06-11','returned',5,37),(32,'2021-08-18','returned',85,38),(33,'2021-06-03','returned',79,39),(34,'2021-02-18','returned',62,40),(35,'2023-01-11','returned',29,41),(36,'2021-07-30','returned',96,42),(37,'2022-12-14','returned',4,43),(38,'2022-03-11','returned',34,44),(39,'2022-08-14','returned',59,45),(40,'2023-01-10','returned',41,46),(41,'2021-05-27','returned',34,47),(42,'2021-11-30','returned',24,48),(43,'2022-07-20','returned',28,49),(44,'2022-06-10','returned',52,50),(45,'2021-02-14','returned',25,51),(46,'2022-06-04','returned',90,52),(47,'2022-03-03','returned',63,53),(48,'2022-12-08','returned',36,54),(49,'2020-12-15','returned',86,55),(50,'2021-01-31','returned',60,56),(51,'2023-01-07','returned',35,57),(52,'2021-05-16','returned',45,58),(53,'2021-09-17','returned',50,59),(54,'2023-01-18','returned',17,60),(55,'2022-10-31','returned',46,61),(56,'2023-04-29','returned',2,62),(57,'2022-10-22','returned',42,63),(58,'2021-01-06','returned',22,64),(59,'2022-01-04','returned',51,65),(60,'2021-03-13','returned',12,66),(61,'2021-04-20','returned',20,67),(62,'2023-01-19','returned',90,68),(63,'2021-01-19','returned',61,69),(64,'2022-02-17','returned',22,70),(65,'2022-12-18','returned',8,71),(66,'2022-02-11','returned',64,72),(67,'2021-12-27','returned',68,73),(68,'2022-10-19','returned',70,74),(69,'2021-05-10','returned',52,75),(70,'2022-01-03','returned',48,76),(71,'2021-12-28','returned',38,77),(72,'2023-03-21','returned',92,78),(73,'2021-06-06','returned',25,79),(74,'2021-10-12','returned',28,80),(75,'2021-03-24','returned',95,81),(76,'2021-02-11','returned',56,82),(77,'2023-03-18','returned',31,83),(78,'2022-02-26','returned',11,84),(79,'2021-06-22','returned',86,85),(80,'2023-04-03','returned',56,86),(81,'2022-02-11','returned',80,87),(82,'2023-04-25','returned',87,88),(83,'2023-05-13','returned',74,89),(84,'2021-01-10','returned',15,90),(85,'2021-01-07','returned',79,91),(86,'2022-01-08','returned',24,92),(87,'2021-04-08','returned',71,93),(88,'2023-02-07','returned',78,94),(89,'2021-12-02','returned',46,95),(90,'2022-08-10','returned',44,96),(91,'2022-01-15','returned',98,97),(92,'2021-11-18','returned',28,98),(93,'2021-07-18','returned',50,99),(94,'2023-01-16','returned',4,100),(95,'2022-10-07','returned',74,101),(96,'2021-02-15','returned',44,7),(97,'2022-09-17','returned',64,8),(98,'2021-05-01','returned',34,9),(99,'2021-12-26','returned',82,10),(100,'2022-02-02','returned',68,11),(101,'2021-06-25','returned',11,12),(102,'2022-03-05','returned',28,13),(103,'2022-03-19','returned',73,14),(104,'2021-08-01','returned',46,15),(105,'2021-09-17','returned',74,16),(106,'2021-08-22','returned',54,17),(107,'2021-02-01','returned',74,18),(108,'2021-06-21','returned',1,19),(109,'2021-08-12','returned',84,20),(110,'2022-11-27','returned',27,21),(111,'2023-01-29','returned',40,22),(112,'2021-07-05','returned',86,23),(113,'2020-12-27','returned',13,24),(114,'2021-10-08','returned',23,25),(115,'2021-11-05','returned',64,26),(116,'2022-09-20','returned',77,27),(117,'2023-04-02','returned',31,28),(118,'2021-11-18','returned',77,29),(119,'2021-08-11','returned',40,30),(120,'2021-12-01','returned',83,31),(121,'2022-04-16','returned',80,32),(122,'2022-05-02','returned',80,33),(123,'2022-07-06','returned',37,34),(124,'2022-03-22','returned',93,35),(125,'2021-04-26','returned',78,36),(126,'2022-07-30','returned',20,37),(127,'2021-05-11','returned',36,38),(128,'2021-07-07','returned',1,39),(129,'2022-01-12','returned',34,40),(130,'2021-05-18','returned',28,41),(131,'2022-05-03','returned',56,42),(132,'2022-08-21','returned',98,43),(133,'2023-01-30','returned',94,44),(134,'2022-11-13','returned',62,45),(135,'2022-03-31','returned',24,46),(136,'2021-04-08','returned',91,47),(137,'2022-06-24','returned',83,48),(138,'2022-06-21','returned',21,49),(139,'2021-05-01','returned',32,50),(140,'2023-01-09','returned',3,51),(141,'2021-06-09','returned',11,52),(142,'2022-06-28','returned',24,53),(143,'2023-03-31','returned',15,54),(144,'2023-01-19','returned',38,55),(145,'2022-08-15','returned',1,56),(146,'2022-08-25','returned',100,57),(147,'2021-05-07','returned',87,58),(148,'2022-08-05','returned',75,59),(149,'2021-11-05','returned',64,60),(150,'2021-04-10','returned',40,61),(151,'2022-01-17','returned',16,62),(152,'2021-01-05','returned',52,63),(153,'2021-10-10','returned',100,64),(154,'2023-01-10','returned',63,65),(155,'2023-02-06','returned',48,66),(156,'2021-12-12','returned',99,67),(157,'2021-07-02','returned',14,68),(158,'2022-04-24','returned',70,69),(159,'2022-07-04','returned',100,70),(160,'2023-04-28','returned',39,71),(161,'2023-04-25','returned',80,72),(162,'2022-06-27','returned',79,73),(163,'2020-12-26','returned',1,74),(164,'2022-05-29','returned',41,75),(165,'2021-08-20','returned',93,76),(166,'2021-07-06','returned',71,77),(167,'2021-05-06','returned',18,78),(168,'2022-05-31','returned',2,79),(169,'2021-10-22','returned',75,80),(170,'2021-01-02','returned',63,81),(171,'2022-09-20','returned',91,82),(172,'2021-03-29','returned',85,83),(173,'2023-02-08','returned',68,84),(174,'2022-02-15','returned',22,85),(175,'2022-09-17','returned',94,86),(176,'2022-09-13','returned',52,87),(177,'2022-03-13','returned',31,88),(178,'2022-06-14','returned',47,89),(179,'2023-04-24','returned',78,90),(180,'2022-05-28','returned',33,91),(181,'2022-04-12','returned',56,92),(182,'2022-12-19','returned',9,93),(183,'2022-09-22','returned',54,94),(184,'2022-09-25','returned',15,95),(185,'2022-11-22','returned',27,96),(186,'2021-04-09','returned',86,97),(187,'2021-06-23','returned',40,98),(188,'2022-05-23','returned',58,99),(189,'2021-04-06','returned',40,100),(190,'2023-02-06','returned',54,101),(191,'2021-03-21','returned',42,7),(192,'2023-04-12','returned',27,8),(193,'2021-02-01','returned',85,9),(194,'2022-11-06','returned',50,10),(195,'2021-09-05','returned',38,11),(196,'2021-07-03','returned',56,12),(197,'2022-06-26','returned',68,13),(198,'2021-10-10','returned',84,14),(199,'2021-04-25','returned',27,15),(200,'2021-04-17','returned',49,16),(201,'2021-01-13','returned',26,17),(202,'2021-05-20','returned',5,18),(203,'2021-11-01','returned',40,19),(204,'2021-08-02','returned',10,20),(205,'2023-01-11','returned',79,21),(206,'2021-02-09','returned',44,22),(207,'2023-02-23','returned',99,23),(208,'2021-06-27','returned',25,24),(209,'2023-02-16','returned',79,25),(210,'2023-02-02','returned',27,26),(211,'2023-04-28','returned',39,27),(212,'2023-04-02','returned',88,28),(213,'2022-09-15','returned',55,29),(214,'2022-10-28','returned',29,30),(215,'2023-02-16','returned',8,31),(216,'2021-06-26','returned',24,32),(217,'2022-08-13','returned',58,33),(218,'2023-03-31','returned',14,34),(219,'2021-11-11','returned',33,35),(220,'2022-11-13','returned',45,36),(221,'2023-01-22','returned',41,37),(222,'2021-04-02','returned',85,38),(223,'2022-07-03','returned',47,39),(224,'2023-04-07','returned',72,40),(225,'2021-03-18','returned',80,41),(226,'2021-12-18','returned',13,42),(227,'2022-10-28','returned',71,43),(228,'2022-09-26','returned',53,44),(229,'2021-04-16','returned',76,45),(230,'2021-01-13','returned',5,46),(231,'2023-04-01','returned',94,47),(232,'2021-12-05','returned',19,48),(233,'2022-11-05','returned',90,49),(234,'2021-04-03','returned',25,50),(235,'2022-06-26','returned',33,51),(236,'2023-04-26','returned',22,52),(237,'2022-11-06','returned',32,53),(238,'2022-02-10','returned',93,54),(239,'2022-04-08','returned',34,55),(240,'2022-03-22','returned',53,56),(241,'2021-04-11','returned',42,57),(242,'2021-07-16','returned',59,58),(243,'2021-02-08','returned',62,59),(244,'2021-09-16','returned',100,60),(245,'2021-03-24','returned',55,61),(246,'2022-10-17','returned',64,62),(247,'2021-10-08','returned',31,63),(248,'2021-01-27','returned',66,64),(249,'2022-01-18','returned',76,65),(250,'2022-11-13','returned',72,66),(251,'2022-01-21','returned',48,67),(252,'2021-01-28','returned',25,68),(253,'2023-03-27','returned',46,69),(254,'2021-09-01','returned',51,70),(255,'2021-09-11','returned',90,71),(256,'2021-06-16','returned',27,72),(257,'2022-10-23','returned',52,73),(258,'2021-06-16','returned',37,74),(259,'2021-01-11','returned',71,75),(260,'2021-01-05','returned',2,76),(261,'2022-10-25','returned',31,77),(262,'2022-03-03','returned',40,78),(263,'2021-05-24','returned',70,79),(264,'2022-05-18','returned',72,80),(265,'2021-06-14','returned',24,81),(266,'2022-02-06','returned',3,82),(267,'2022-11-26','returned',98,83),(268,'2022-07-17','returned',7,84),(269,'2023-03-06','returned',32,85),(270,'2021-09-29','returned',15,86),(271,'2022-01-26','returned',41,87),(272,'2021-08-13','returned',71,88),(273,'2022-02-27','returned',90,89),(274,'2021-01-06','returned',82,90),(275,'2021-11-20','returned',42,91),(276,'2022-04-08','returned',57,92),(277,'2022-10-13','returned',76,93),(278,'2021-01-23','returned',53,94),(279,'2023-01-04','returned',50,95),(280,'2021-05-24','returned',18,96),(281,'2021-04-14','returned',22,97),(282,'2021-12-25','returned',28,98),(283,'2021-03-11','returned',77,99),(284,'2022-10-24','returned',79,100),(285,'2022-09-28','returned',23,101),(286,'2022-11-06','returned',14,7),(287,'2022-02-07','returned',5,8),(288,'2022-01-01','returned',15,9),(289,'2021-04-13','returned',99,10),(290,'2021-06-10','returned',7,11),(291,'2022-02-28','returned',64,12),(292,'2023-03-23','returned',77,13),(293,'2022-12-21','returned',16,14),(294,'2022-03-09','returned',45,15),(295,'2022-08-03','returned',32,16),(296,'2022-10-27','returned',93,17),(297,'2023-01-26','returned',55,18),(298,'2021-10-18','returned',34,19),(299,'2021-04-20','returned',17,20),(300,'2021-05-03','returned',26,21),(301,'2021-09-09','returned',74,22),(302,'2022-08-17','returned',84,23),(303,'2022-07-06','returned',13,24),(304,'2020-12-24','returned',74,25),(305,'2021-11-13','returned',9,26),(306,'2023-03-03','returned',74,27),(307,'2022-09-25','returned',63,28),(308,'2022-11-03','returned',68,29),(309,'2022-12-19','returned',76,30),(310,'2021-01-09','returned',47,31),(311,'2021-11-17','returned',45,32),(312,'2021-04-17','returned',38,33),(313,'2023-04-05','returned',90,34),(314,'2021-08-10','returned',42,35),(315,'2022-04-22','returned',35,36),(316,'2022-06-21','returned',81,37),(317,'2022-11-26','returned',92,38),(318,'2021-09-30','returned',81,39),(319,'2022-07-28','returned',86,40),(320,'2023-01-10','returned',81,41),(321,'2022-12-13','returned',76,42),(322,'2022-07-06','returned',2,43),(323,'2022-07-04','returned',32,44),(324,'2022-04-27','returned',28,45),(325,'2021-09-04','returned',4,46),(326,'2022-12-21','returned',73,47),(327,'2020-12-21','returned',83,48),(328,'2022-03-14','returned',44,49),(329,'2023-02-05','returned',13,50),(330,'2021-01-07','returned',5,51),(331,'2022-01-13','returned',64,52),(332,'2021-10-31','returned',41,53),(333,'2021-03-05','returned',42,54),(334,'2021-01-18','returned',92,55),(335,'2022-03-26','returned',38,56),(336,'2022-08-29','returned',43,57),(337,'2021-05-18','returned',73,58),(338,'2021-11-24','returned',39,59),(339,'2021-12-13','returned',85,60),(340,'2022-02-25','returned',32,61),(341,'2021-03-01','returned',69,62),(342,'2021-04-30','returned',43,63),(343,'2022-07-25','returned',64,64),(344,'2021-07-07','returned',28,65),(345,'2021-08-05','returned',20,66),(346,'2023-04-18','returned',64,67),(347,'2021-05-25','returned',83,68),(348,'2022-04-13','returned',97,69),(349,'2023-04-19','returned',33,70),(350,'2022-01-31','returned',18,71),(351,'2021-02-17','returned',44,72),(352,'2021-12-10','returned',37,73),(353,'2022-12-02','returned',43,74),(354,'2021-01-20','returned',79,75),(355,'2023-01-29','returned',37,76),(356,'2023-03-06','returned',10,77),(357,'2022-12-12','returned',44,78),(358,'2021-08-19','returned',38,79),(359,'2023-04-06','returned',14,80),(360,'2021-06-28','returned',78,81),(361,'2021-01-23','returned',61,82),(362,'2022-08-01','returned',75,83),(363,'2021-09-14','returned',67,84),(364,'2022-04-06','returned',58,85),(365,'2022-05-19','returned',91,86),(366,'2021-07-17','returned',32,87),(367,'2023-01-01','returned',18,88),(368,'2022-07-13','returned',64,89),(369,'2022-01-20','returned',40,90),(370,'2023-03-24','returned',5,91),(371,'2022-01-16','returned',37,92),(372,'2021-05-21','returned',46,93),(373,'2021-08-21','returned',97,94),(374,'2022-04-24','returned',22,95),(375,'2023-02-05','returned',88,96),(376,'2022-06-06','returned',94,97),(377,'2022-07-28','returned',16,98),(378,'2021-05-05','returned',100,99),(379,'2022-07-11','returned',33,100),(380,'2022-02-13','returned',87,101),(381,'2020-12-23','returned',86,7),(382,'2021-12-17','returned',34,8),(383,'2021-05-01','returned',99,9),(384,'2021-12-03','returned',93,10),(385,'2020-12-31','returned',3,11),(386,'2021-10-02','returned',4,12),(387,'2021-05-31','returned',82,13),(388,'2022-02-15','returned',58,14),(389,'2022-08-21','returned',34,15),(390,'2022-02-03','returned',76,16),(391,'2021-04-29','returned',65,17),(392,'2021-10-03','returned',41,18),(393,'2021-05-11','returned',40,19),(394,'2021-08-13','returned',49,20),(395,'2021-08-13','returned',5,21),(396,'2021-12-29','returned',2,22),(397,'2021-11-28','returned',98,23),(398,'2022-04-12','returned',54,24),(399,'2020-12-16','returned',48,25),(400,'2023-02-18','returned',94,26),(401,'2023-02-02','returned',77,27),(402,'2022-09-07','returned',56,28),(403,'2022-05-26','returned',42,29),(404,'2023-03-20','returned',74,30),(405,'2023-02-04','returned',79,31),(406,'2021-07-08','returned',95,32),(407,'2022-04-10','returned',62,33),(408,'2022-01-24','returned',45,34),(409,'2023-01-20','returned',61,35),(410,'2022-07-27','returned',69,36),(411,'2022-09-18','returned',56,37),(412,'2022-11-19','returned',82,38),(413,'2023-05-18','returned',100,39),(414,'2022-08-26','returned',27,40),(415,'2021-06-17','returned',33,41),(416,'2022-12-09','returned',25,42),(417,'2022-06-14','returned',34,43),(418,'2022-10-04','returned',41,44),(419,'2021-03-31','returned',10,45),(420,'2022-12-29','returned',72,46),(421,'2023-05-07','returned',80,47),(422,'2021-03-16','returned',55,48),(423,'2021-09-28','returned',99,49),(424,'2021-12-03','returned',12,50),(425,'2023-02-07','returned',24,51),(426,'2023-02-07','returned',3,52),(427,'2022-01-20','returned',76,53),(428,'2023-05-01','returned',34,54),(429,'2021-03-19','returned',5,55),(430,'2021-08-05','returned',43,56),(431,'2023-03-13','returned',94,57),(432,'2022-01-12','returned',61,58),(433,'2021-03-08','returned',73,59),(434,'2021-03-27','returned',44,60),(435,'2022-11-15','returned',52,61),(436,'2022-03-28','returned',52,62),(437,'2022-10-13','returned',8,63),(438,'2022-11-26','returned',39,64),(439,'2022-01-25','returned',82,65),(440,'2023-04-28','returned',43,66),(441,'2021-05-08','returned',20,67),(442,'2022-04-12','returned',8,68),(443,'2021-07-05','returned',74,69),(444,'2022-10-19','returned',97,70),(445,'2022-08-03','returned',60,71),(446,'2022-12-19','returned',60,72),(447,'2021-12-24','returned',17,73),(448,'2023-03-24','returned',62,74),(449,'2021-08-20','returned',13,75),(450,'2021-01-09','returned',55,76),(451,'2021-12-17','returned',84,77),(452,'2022-09-13','returned',80,78),(453,'2022-10-03','returned',77,79),(454,'2022-02-02','returned',29,80),(455,'2022-03-26','returned',43,81),(456,'2020-12-16','returned',52,82),(457,'2022-03-06','returned',90,83),(458,'2023-02-08','returned',90,84),(459,'2023-01-15','returned',93,85),(460,'2021-12-22','returned',25,86),(461,'2021-07-30','returned',7,87),(462,'2021-07-16','returned',70,88),(463,'2021-10-12','returned',34,89),(464,'2022-04-01','returned',92,90),(465,'2022-01-17','returned',54,91),(466,'2023-03-24','returned',19,92),(467,'2022-05-14','returned',24,93),(468,'2022-06-24','returned',29,94),(469,'2023-02-14','returned',46,95),(470,'2022-05-30','returned',51,96),(471,'2021-03-30','returned',23,97),(472,'2022-12-02','returned',72,98),(473,'2022-05-22','returned',75,99),(474,'2022-08-15','returned',52,100),(475,'2022-02-17','returned',10,101),(476,'2023-05-30','active',18,7),(477,'2023-05-20','returned',73,8),(478,'2023-05-21','returned',98,9),(479,'2023-06-02','active',9,10),(480,'2023-05-22','returned',33,11),(481,'2023-05-24','active',16,12),(482,'2023-05-20','returned',64,13),(483,'2023-05-30','active',98,14),(484,'2023-05-22','returned',58,15),(485,'2023-05-23','returned',61,16),(486,'2023-05-27','active',84,17),(487,'2023-05-24','active',49,18),(488,'2023-05-27','active',27,19),(489,'2023-05-20','returned',13,20),(490,'2023-05-27','active',63,21),(491,'2023-05-21','returned',4,22),(492,'2023-05-24','active',50,23),(493,'2023-05-22','returned',56,24),(494,'2023-05-30','active',78,25),(495,'2023-06-02','active',98,26),(496,'2023-05-31','active',99,27),(497,'2023-05-28','active',1,28),(498,'2023-05-31','active',90,29),(499,'2023-05-20','returned',58,30),(500,'2023-05-28','active',35,31),(501,'2023-05-30','active',93,32),(502,'2023-06-01','active',30,33),(503,'2023-05-26','active',76,34),(504,'2023-05-27','active',14,35),(505,'2023-05-24','active',41,36),(506,'2023-05-26','active',4,37),(507,'2023-05-29','active',3,38),(508,'2023-05-19','returned',4,39),(509,'2023-05-19','returned',84,40),(510,'2023-05-28','active',70,41),(511,'2023-05-21','returned',2,42),(512,'2023-05-31','active',49,43),(513,'2023-05-20','returned',88,44),(514,'2023-05-21','returned',28,45),(515,'2023-05-19','returned',55,46),(516,'2023-05-22','returned',93,47),(517,'2023-05-27','active',4,48),(518,'2023-05-29','active',68,49),(519,'2023-05-22','returned',29,50),(520,'2023-05-23','returned',98,51),(521,'2023-06-02','active',57,52),(522,'2023-05-23','returned',64,53),(523,'2023-05-23','returned',71,54),(524,'2023-05-19','returned',30,55),(525,'2023-05-22','returned',45,56),(526,'2023-05-31','active',30,57),(527,'2023-05-31','active',87,58),(528,'2023-05-27','active',29,59),(529,'2023-05-29','active',98,60),(530,'2023-05-31','active',59,61),(531,'2023-05-28','active',38,62),(532,'2023-05-22','returned',3,63),(533,'2023-05-31','active',54,64),(534,'2023-05-31','active',72,65),(535,'2023-05-27','active',83,66),(536,'2023-05-25','active',13,67),(537,'2023-05-22','returned',24,68),(538,'2023-05-27','active',81,69),(539,'2023-05-19','returned',93,70),(540,'2023-06-01','active',38,71),(541,'2023-05-21','returned',16,72),(542,'2023-05-22','returned',96,73),(543,'2023-05-20','returned',43,74),(544,'2023-05-24','active',93,75),(545,'2023-06-01','active',92,76),(546,'2023-05-25','active',65,77),(547,'2023-05-26','active',55,78),(548,'2023-05-28','active',65,79),(549,'2023-05-29','active',86,80),(550,'2023-05-20','returned',25,81),(551,'2023-05-21','returned',39,7),(552,'2023-06-02','active',37,8),(553,'2023-05-30','active',76,9),(554,'2023-05-27','active',64,10),(555,'2023-05-30','active',65,11),(556,'2023-05-20','returned',51,12),(557,'2023-06-01','active',76,13),(558,'2023-05-30','active',5,14),(559,'2023-05-30','active',62,15),(560,'2023-05-25','active',32,16),(561,'2023-06-02','active',96,17),(562,'2023-05-29','active',52,18),(563,'2023-06-01','active',54,19),(564,'2023-05-23','returned',86,20),(565,'2023-05-22','returned',23,21),(566,'2023-05-22','returned',47,22),(567,'2023-05-23','returned',71,23),(568,'2023-05-25','active',90,24),(569,'2023-05-21','returned',100,25),(570,'2023-05-25','active',87,26),(571,'2023-05-26','active',95,27),(572,'2023-05-27','active',48,28),(573,'2023-05-24','active',12,29),(574,'2023-05-29','active',57,30),(575,'2023-05-25','active',85,31),(576,'2023-05-25','active',66,32),(577,'2023-05-30','active',14,33),(578,'2023-05-24','active',100,34),(579,'2023-05-28','active',21,35),(580,'2023-05-25','active',67,36),(581,'2023-05-19','returned',51,37),(582,'2023-06-01','active',48,38),(583,'2023-05-22','returned',63,39),(584,'2023-05-21','returned',94,40),(585,'2023-05-30','active',4,41),(586,'2023-06-01','active',61,42),(587,'2023-05-20','returned',6,43),(588,'2023-05-28','active',40,44),(589,'2023-05-26','active',91,45),(590,'2023-05-30','active',79,46),(591,'2023-05-21','returned',76,47),(592,'2023-06-02','active',75,48),(593,'2023-05-24','active',51,49),(594,'2023-05-26','active',83,50),(595,'2023-06-01','active',22,51),(596,'2023-05-30','active',22,52),(597,'2023-05-31','active',65,53),(598,'2023-05-20','returned',30,54),(599,'2023-05-20','returned',2,55),(600,'2023-05-25','active',99,56),(601,'2023-05-23','returned',26,57),(602,'2023-06-02','active',70,58),(603,'2023-05-21','returned',71,59),(604,'2023-05-20','returned',30,60),(605,'2023-05-19','returned',52,61),(606,'2023-05-19','returned',66,62),(607,'2023-05-30','active',45,63),(608,'2023-05-28','active',74,64),(609,'2023-05-30','active',46,65),(610,'2023-06-01','active',59,66),(611,'2023-05-21','returned',35,67),(612,'2023-05-26','active',85,68),(613,'2023-05-28','active',71,69),(614,'2023-05-27','active',78,70),(615,'2023-05-20','returned',94,71),(616,'2023-05-28','active',1,72),(617,'2023-05-25','active',50,73),(618,'2023-05-29','active',95,74),(619,'2023-06-01','active',66,75),(620,'2023-05-24','active',17,76),(621,'2023-05-21','returned',67,77),(622,'2023-05-21','returned',100,78),(623,'2023-05-20','returned',72,79),(624,'2023-05-30','active',27,80),(625,'2023-05-24','active',55,81),(626,'2023-06-02','active',8,82),(627,'2023-06-02','active',62,83),(628,'2023-05-25','active',47,84),(629,'2023-05-28','active',73,85),(630,'2023-06-02','active',71,86),(631,'2023-05-27','active',26,87),(632,'2023-05-30','active',65,88),(633,'2023-05-25','active',53,89),(634,'2023-05-25','active',63,90),(635,'2023-05-28','active',46,91),(636,'2023-05-20','returned',54,92),(637,'2023-05-30','active',45,93),(638,'2023-05-28','active',1,94),(639,'2023-05-23','returned',69,95),(640,'2023-05-29','active',70,96),(641,'2023-06-01','active',80,97),(642,'2023-05-27','active',79,98),(643,'2023-05-19','returned',43,99),(644,'2023-05-29','active',59,100),(645,'2023-05-24','active',77,101);
/*!40000 ALTER TABLE `borrowing` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enforce_borrowing_limit` BEFORE INSERT ON `borrowing` FOR EACH ROW BEGIN
    SET @borrowing_count = NULL;
    SET @user_role_id_var = NULL;
    SET @borrowing_limit = NULL;

    SELECT role_id into @user_role_id_var
    FROM library_user
    WHERE user_id = NEW.library_user_user_id;

    
    IF (SELECT COUNT(borrowing_id) FROM borrowing WHERE book_book_id =  NEW.book_book_id AND library_user_user_id = NEW.library_user_user_id AND borrowing_status = 'active') >= 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot Borrow more than one copy of a Book.';
    END IF;
    
    -- Get the total number of books borrowed by the user in the current week
    SELECT COUNT(*) INTO @borrowing_count
    FROM borrowing
    WHERE library_user_user_id = NEW.library_user_user_id
    -- AND DATEDIFF(NEW.borrowing_date, borrowing_date) > 7 
    AND borrowing_status = 'active';
    
    -- Determine the borrowing limit based on the user's role
    IF @user_role_id_var = 4 THEN -- Student role
        SET @borrowing_limit = 2;
    ELSEIF @user_role_id_var = 3 THEN -- Professor role
        SET @borrowing_limit = 1;
    END IF;
    
    -- Check if the borrowing limit has been reached
    IF @borrowing_count >= @borrowing_limit THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Borrowing limit has been reached, make reservation instead.';
    END IF;
    
    if NEW.borrowing_date IS NULL THEN
		SET NEW.borrowing_date = CURDATE();
	END IF;
    
	-- Check availability 	
    IF (SELECT school_book_amount FROM school_book 
    WHERE book_book_id =  NEW.book_book_id
    AND school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)) < 1 THEN
		SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No books available, make reservation instead.';
	-- If user borrowing has a reservation delete reservation
	ELSEIF EXISTS ( SELECT * FROM reservation WHERE book_book_id =  NEW.book_book_id 
	AND library_user_user_id = NEW.library_user_user_id) THEN 
		DELETE FROM reservation WHERE book_book_id =  NEW.book_book_id 
		AND library_user_user_id = NEW.library_user_user_id;
	END IF;
    IF NEW.borrowing_status = 'active' THEN-- Remove one book from school 
		UPDATE school_book set school_book_amount = school_book_amount - 1
		WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)
		AND book_book_id = NEW.book_book_id;
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `IncreaseBookAmountTrigger` AFTER UPDATE ON `borrowing` FOR EACH ROW BEGIN

  -- Check if the borrowing status has changed to "returned"
  IF new.borrowing_status = 'returned' AND OLD.borrowing_status = 'active' THEN
	UPDATE school_book SET school_book_amount = school_book_amount + 1 
	WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)
	AND book_book_id = NEW.book_book_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Fiction'),(2,'Nonfiction'),(3,'Mystery'),(4,'Thriller'),(5,'Romance'),(6,'Science Fiction'),(7,'Fantasy'),(8,'Horror'),(9,'Biography'),(10,'History'),(11,'Self-help'),(12,'Poetry'),(13,'Comedy'),(14,'Drama'),(15,'Action and Adventure'),(16,'Young Adult'),(17,'Children\'s'),(18,'Science'),(19,'Art'),(20,'Cooking'),(21,'Western'),(22,'Comic Book'),(23,'Programming'),(24,'Educational');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword` (
  `keyword_id` int unsigned NOT NULL AUTO_INCREMENT,
  `keyword_name` varchar(45) NOT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES (1,'Analysis'),(2,'Trial'),(3,'Adult'),(4,'Program'),(5,'Cause'),(6,'Enjoy'),(7,'Maybe'),(8,'Top'),(9,'Name'),(10,'Attention'),(11,'Main'),(12,'Partner'),(13,'Contain'),(14,'Action'),(15,'Role'),(16,'Indeed'),(17,'Word'),(18,'Story'),(19,'About'),(20,'Grow'),(21,'Not'),(22,'Leader'),(23,'Get'),(24,'Security'),(25,'Center'),(26,'Campaign'),(27,'Condition'),(28,'Put'),(29,'Happy'),(30,'Society'),(31,'Meet'),(32,'Hot'),(33,'Act'),(34,'Quality'),(35,'Need'),(36,'Like'),(37,'Collection'),(38,'Sit'),(39,'Mother'),(40,'Nation'),(41,'Community'),(42,'Civil'),(43,'Material'),(44,'Reveal'),(45,'Interesting'),(46,'Change'),(47,'It'),(48,'So'),(49,'Book'),(50,'Thought'),(51,'Through'),(52,'Lot'),(53,'Apply'),(54,'This'),(55,'Push'),(56,'Education'),(57,'It'),(58,'Song'),(59,'Leave'),(60,'Research'),(61,'Gun'),(62,'Approach'),(63,'Read'),(64,'Behavior'),(65,'Loss'),(66,'Yet'),(67,'Too'),(68,'Moment'),(69,'Include'),(70,'Itself'),(71,'Hear'),(72,'Area'),(73,'Build'),(74,'Resource'),(75,'Recognize'),(76,'Against'),(77,'Partner'),(78,'Participant'),(79,'Later'),(80,'Often'),(81,'Wonder'),(82,'At'),(83,'Challenge'),(84,'Expect'),(85,'Himself'),(86,'Weight'),(87,'Miss'),(88,'Value'),(89,'Bed'),(90,'Pay'),(91,'Picture'),(92,'However'),(93,'These'),(94,'Medical'),(95,'Exist'),(96,'Lead'),(97,'Store'),(98,'Determine'),(99,'Pressure'),(100,'Issue');
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_user`
--

DROP TABLE IF EXISTS `library_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_first_name` varchar(45) NOT NULL,
  `user_last_name` varchar(45) NOT NULL,
  `user_birthdate` date NOT NULL,
  `role_id` int unsigned NOT NULL,
  `school_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `user_password_UNIQUE` (`user_password`),
  KEY `fk_user_role_id` (`role_id`),
  KEY `fk_user_school_id` (`school_id`),
  CONSTRAINT `fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `library_user_role` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_user_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_user`
--

LOCK TABLES `library_user` WRITE;
/*!40000 ALTER TABLE `library_user` DISABLE KEYS */;
INSERT INTO `library_user` VALUES (1,'Early_energy_specific','Marriage_treatment_everyone','Jessica','Lewis','1994-11-18',1,NULL),(2,'Positive','So','Carolyn','Chapman','1964-04-06',2,1),(3,'We_inside_learn','Exactly_serve_whatever','Jonathan','Smith','1968-06-16',2,2),(4,'Population_democratic_way_begin','Government_turn_fund','Daniel','Leonard','1977-10-12',2,3),(5,'Vote_state','Enjoy_mention','Michelle','Herrera','1977-06-05',2,4),(6,'For_share_treatment','It_hit_house','Virginia','Boyd','1964-08-31',2,5),(7,'Hour_she_radio','Seat_I','Christine','Mcpherson','2011-05-06',4,1),(8,'After_marriage_mouth','Inside_security_paper_bar','Gerald','Rhodes','2010-06-29',4,1),(9,'Film','Really','Roger','Collins','2010-05-27',4,1),(10,'Stay_issue','Environmental_heart_establish','Joseph','Cline','2004-06-24',4,1),(11,'Against_contain','Now_serious','Heather','Beasley','2009-05-30',4,1),(12,'Against_bill','Price_here_catch','James','Sullivan','2004-09-09',4,1),(13,'Stock_future_decision','Ready_policy','Steven','Mendoza','2006-09-18',4,1),(14,'Trip_interview_down_threat','Player_decade_listen','Renee','Hood','2004-08-29',4,1),(15,'Morning_travel','Design_try_plant','Brendan','Davis','2005-12-30',4,1),(16,'Garden_south','Pretty_set','Courtney','Garcia','2006-08-02',4,1),(17,'Laugh_media_chair','Director_feeling','Tom','Castillo','2009-10-19',4,1),(18,'Fund_wait_lead','Use','Robert','Moreno','2005-12-23',4,1),(19,'Others_minute','Know_together','Michael','Barnes','2010-03-27',4,1),(20,'Collection','Reason_radio_mission','Melissa','Rivers','2009-05-20',4,1),(21,'It_must_song_quality','Oil_with','Dana','Jones','2010-03-24',4,1),(22,'Reason_star_shoulder','Turn','Amy','Holder','2004-12-31',4,2),(23,'Positive_college_conference','Sense_television_food_old','Crystal','Jennings','2009-05-22',4,2),(24,'Truth_town_herself','Tonight_east','David','Clark','2006-04-27',4,2),(25,'Figure_believe','Benefit_recent_cut','Oscar','Fisher','2010-06-01',4,2),(26,'Staff_place','Authority_such','Christopher','Wu','2006-01-26',4,2),(27,'Ground_live','Tree_land','Dana','Hill','2009-06-07',4,2),(28,'Agree_nation','News_dog_determine','Kathy','Erickson','2006-11-15',4,2),(29,'Rather_produce','Matter_physical_yourself','Susan','Rivera','2009-05-20',4,2),(30,'Upon_wait','Order_already_impact','Travis','Hughes','2010-11-23',4,2),(31,'Beat_let','Story','Heidi','Thompson','2006-07-17',4,2),(32,'Hour_strong_partner','Economy_product_right_never','Brenda','Perry','2010-05-20',4,2),(33,'Trial_morning','Course_scientist','Dana','Garcia','2004-11-01',4,2),(34,'Avoid_nation_leave','Help_show_agency','Robert','Hernandez','2010-12-22',4,2),(35,'Federal_center_born','Degree_crime','Matthew','Patton','2007-04-13',4,2),(36,'Mother','Chance_work_model','Justin','Anderson','2006-06-11',4,2),(37,'Teach_write','None','William','Turner','2008-07-28',4,3),(38,'Voice_consumer_occur','Go_look','Brooke','Todd','2005-06-06',4,3),(39,'Him_per','Billion_less_audience','Carrie','Palmer','2006-05-06',4,3),(40,'Agent_just','Pass_local_should','David','Bishop','2009-05-16',4,3),(41,'Film_at_age','Section_floor_fill','Andrew','Ray','2005-09-14',4,3),(42,'Poor_successful_with','Begin_pass','Mackenzie','Hernandez','2011-03-04',4,3),(43,'According_there','Option_research','Patrick','Li','2007-01-20',4,3),(44,'Prepare_soldier_service','Arrive_strategy_hundred_education','Kathleen','Morgan','2009-03-27',4,3),(45,'Lay_ball_two','Try_their','Charles','Cooper','2008-06-22',4,3),(46,'Activity_can_guy','Service_middle','Duane','Silva','2007-06-02',4,3),(47,'Opportunity_establish_trial','Professional_age','Robert','Morales','2010-10-16',4,3),(48,'Wonder_pick','Impact_what_effect','Troy','Torres','2006-10-25',4,3),(49,'Audience_since','Catch_statement_building','Robert','Melton','2008-11-13',4,3),(50,'Standard_phone_score','Vote','Derrick','Smith','2008-04-02',4,3),(51,'Support_each_risk','Point_modern','Katrina','Patton','2006-12-17',4,3),(52,'Source_chance_mother_turn','Success_explain','Stephanie','Miller','2008-08-04',4,4),(53,'Enjoy','Evening_adult','Brandon','Cooper','2006-08-24',4,4),(54,'Key_share_piece','Half','Christina','Chung','2006-04-19',4,4),(55,'Add_general','Politics','Veronica','Allen','2005-06-10',4,4),(56,'Admit_thing_stage','Four_kind_should','Kenneth','Norton','2007-03-07',4,4),(57,'Child_national','Idea_anything_positive','Louis','Barrera','2009-02-28',4,4),(58,'Together_song_probably','Strategy_race','Kevin','Sullivan','2009-03-08',4,4),(59,'Assume_past_yet','Expert_push_something','Kimberly','Levy','2006-09-17',4,4),(60,'Bit_wide','The_risk_bit','Karen','Jenkins','2009-10-25',4,4),(61,'Well_seem_wind_indicate','Focus_whole','Mary','Mitchell','2008-05-17',4,4),(62,'Who_if_across','Person_list_lose','Lisa','Curtis','2009-03-15',4,4),(63,'Range_store_parent','Day_thing_wrong_change','Beth','Martin','2010-03-16',4,4),(64,'Treatment_should_hold','Fill_feeling_during_step','Joseph','Owen','2010-08-31',4,4),(65,'Which','Ago_student_far','Jennifer','Mccarty','2007-09-24',4,4),(66,'Develop_serve_oil','Many_language_such','Lauren','Lee','2008-06-04',4,4),(67,'Need_us_believe','Its_involve','Joseph','Lee','2008-12-20',4,5),(68,'Be_but_six','Speech','Heather','Miller','2009-09-17',4,5),(69,'Project_one','Site_star','Michael','Payne','2009-08-25',4,5),(70,'Home_act_rock','Matter','Nicole','Pierce','2005-07-31',4,5),(71,'Might_listen_institution_color','Son_hot','Bruce','Meyers','2006-02-05',4,5),(72,'Message_night_campaign','Mission_court_gas','Laura','Miller','2009-06-04',4,5),(73,'Visit','Campaign_on','Steven','Gonzales','2005-03-25',4,5),(74,'Option_floor','Nothing_save_modern','James','Phillips','2008-03-28',4,5),(75,'View_country','Right_effort_mother','Lisa','Haynes','2009-08-16',4,5),(76,'Tell_ago','Indeed_worry','Tammy','Decker','2010-01-04',4,5),(77,'Similar_support_degree','Operation_him_fall_personal','David','Velez','2007-11-12',4,5),(78,'Right_rule','Many_cut_rule','Anne','Prince','2004-06-05',4,5),(79,'Parent_begin','Degree','Jennifer','Romero','2004-07-07',4,5),(80,'Nice_base_list','Stuff_unit','Sarah','Young','2007-12-06',4,5),(81,'Claim_girl','It_yes','Kimberly','Lopez','2011-03-18',4,5),(82,'Send_wife_sometimes','Worry_hope_deal','Leah','Garcia','1985-07-13',3,1),(83,'Boy_alone_worker','Contain_economic_trip','Cynthia','Reed','1957-12-12',3,1),(84,'Vote_which_cup','Tend_thus','Johnny','Harper','1996-06-24',3,1),(85,'Quality_piece_seat','Almost_hold','Marisa','Miller','1966-12-12',3,1),(86,'Organization_final','Chance_mission','Marilyn','Herrera','1969-08-16',3,2),(87,'Character_four_or','Build_evidence','Kelsey','Wright','1984-03-13',3,2),(88,'Congress_wrong','Power_might_pretty','Yvonne','Evans','1990-08-31',3,2),(89,'Shake_into','Usually_race','Elizabeth','Terry','1975-10-18',3,2),(90,'Line_until_particularly','Wonder_research_want','Robert','Stewart','1975-02-16',3,3),(91,'Have_time_force','Case_option','Amy','Davis','1967-11-11',3,3),(92,'Several_summer','Trade_officer_throw','Charles','Hartman','1986-08-31',3,3),(93,'Two_at_author','Successful_dream','Amy','Pruitt','1993-06-19',3,3),(94,'Population_sit_early','Song_maintain_out','Stacey','Smith','1976-01-20',3,4),(95,'There_another_recently','Move_gun','Samuel','Miller','1986-03-16',3,4),(96,'Condition_billion_Democrat_senior','Recently_determine_few','Amy','Wall','1994-01-18',3,4),(97,'Court_off_apply','Newspaper_four_phone','Michael','Vasquez','1997-04-30',3,4),(98,'Field_into','Country_treat_environmental','Meghan','Lewis','1993-07-26',3,5),(99,'Next_quickly_senior','Friend_show_tough_movie','Michele','Ward','1987-11-26',3,5),(100,'Five_smile_somebody','Standard_sort','Albert','Robinson','1991-01-13',3,5),(101,'Hard_himself','Share_season_admit_eat','Danny','Hooper','1971-12-28',3,5);
/*!40000 ALTER TABLE `library_user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_Role_default` BEFORE INSERT ON `library_user` FOR EACH ROW BEGIN
    if NEW.role_id = NULL THEN
		SET NEW.role_id = 5;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `library_user_days_due`
--

DROP TABLE IF EXISTS `library_user_days_due`;
/*!50001 DROP VIEW IF EXISTS `library_user_days_due`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `library_user_days_due` AS SELECT 
 1 AS `user_id`,
 1 AS `user_first_name`,
 1 AS `user_last_name`,
 1 AS `school_id`,
 1 AS `currently_borrowed`,
 1 AS `days_due`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `library_user_role`
--

DROP TABLE IF EXISTS `library_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_user_role` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `role_description` varchar(200) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_user_role`
--

LOCK TABLES `library_user_role` WRITE;
/*!40000 ALTER TABLE `library_user_role` DISABLE KEYS */;
INSERT INTO `library_user_role` VALUES (1,'Central Admin','Has Controll of the database and all possible permissions'),(2,'School Admin','Is responsible at a school level for managing the users, books, reservations'),(3,'Teacher','Can borrow/reserve up to one book per week and edit personal info'),(4,'Student','Can borrow/reserve up to two books per week'),(5,'Awaiting Confirmation','User waiting aproval from admin');
/*!40000 ALTER TABLE `library_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `loans_per_school_admin_this_year`
--

DROP TABLE IF EXISTS `loans_per_school_admin_this_year`;
/*!50001 DROP VIEW IF EXISTS `loans_per_school_admin_this_year`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `loans_per_school_admin_this_year` AS SELECT 
 1 AS `user_id`,
 1 AS `user_first_name`,
 1 AS `user_last_name`,
 1 AS `borrowings_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int unsigned NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(45) NOT NULL,
  `book_book_id` int NOT NULL,
  PRIMARY KEY (`publisher_id`),
  KEY `fk_publisher_book1_idx` (`book_book_id`),
  CONSTRAINT `fk_publisher_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Drive',1),(2,'Statement',2),(3,'Sense',3),(4,'Night',4),(5,'Visit',5),(6,'Pay choice',6),(7,'Smile',7),(8,'Oil physical',8),(9,'Head',9),(10,'Pattern think',10),(11,'Possible',11),(12,'System',12),(13,'Study lot',13),(14,'Crime',14),(15,'Hotel sound',15),(16,'Remain',16),(17,'Public',17),(18,'Draw',18),(19,'Similar stand',19),(20,'Involve',20),(21,'Democratic standard',21),(22,'Bad',22),(23,'Color',23),(24,'Shoulder impact',24),(25,'Together',25),(26,'Loss',26),(27,'Mission',27),(28,'Base sure',28),(29,'Suffer',29),(30,'Dream',30),(31,'Speech',31),(32,'National',32),(33,'Part',33),(34,'Event store',34),(35,'Under happy',35),(36,'Itself tonight',36),(37,'Themselves',37),(38,'Lose',38),(39,'Growth',39),(40,'Interesting',40),(41,'Mission',41),(42,'Certain society',42),(43,'List',43),(44,'Investment',44),(45,'Until court',45),(46,'These',46),(47,'Else often',47),(48,'Most speak',48),(49,'Strategy',49),(50,'Appear',50),(51,'Professor',51),(52,'Analysis',52),(53,'History little',53),(54,'Direction safe',54),(55,'Official nearly',55),(56,'Your company',56),(57,'Describe value',57),(58,'Why',58),(59,'Control third',59),(60,'Per account',60),(61,'Whose important',61),(62,'Concern',62),(63,'Together conference',63),(64,'Several federal',64),(65,'Night',65),(66,'Rest office',66),(67,'Special phone',67),(68,'Memory general',68),(69,'Box beautiful',69),(70,'Total everyone',70),(71,'Project',71),(72,'Eight bad',72),(73,'Create',73),(74,'Probably',74),(75,'Weight',75),(76,'Easy score',76),(77,'Head',77),(78,'Order ready',78),(79,'Fast',79),(80,'Religious',80),(81,'Important tell',81),(82,'Manager',82),(83,'Order',83),(84,'Benefit identify',84),(85,'Resource',85),(86,'Executive alone',86),(87,'Firm',87),(88,'Now',88),(89,'Friend yard',89),(90,'Describe near',90),(91,'Rise',91),(92,'Some night',92),(93,'Former interesting',93),(94,'Toward its',94),(95,'Baby',95),(96,'Relate',96),(97,'A poor',97),(98,'Manager light',98),(99,'Suddenly get',99),(100,'Development green',100);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int unsigned NOT NULL AUTO_INCREMENT,
  `reservation_date` date NOT NULL,
  `reservation_status` enum('awaiting_pick_up','on_hold') NOT NULL,
  `book_book_id` int NOT NULL,
  `library_user_user_id` int unsigned NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_reservation_book1_idx` (`book_book_id`),
  KEY `fk_reservation_library_user1_idx` (`library_user_user_id`),
  CONSTRAINT `fk_reservation_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_library_user1` FOREIGN KEY (`library_user_user_id`) REFERENCES `library_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2023-06-02','awaiting_pick_up',4,7),(2,'2023-05-27','awaiting_pick_up',30,8),(3,'2023-05-27','awaiting_pick_up',82,9),(4,'2023-06-01','awaiting_pick_up',23,10),(5,'2023-06-02','awaiting_pick_up',71,11),(6,'2023-05-31','awaiting_pick_up',75,12),(7,'2023-05-27','awaiting_pick_up',24,13),(8,'2023-05-28','awaiting_pick_up',12,14),(9,'2023-05-29','awaiting_pick_up',71,15),(10,'2023-05-28','awaiting_pick_up',33,16),(11,'2023-05-27','awaiting_pick_up',5,17),(12,'2023-06-02','awaiting_pick_up',87,18),(13,'2023-06-01','awaiting_pick_up',10,19),(14,'2023-05-27','awaiting_pick_up',11,20),(15,'2023-06-01','awaiting_pick_up',3,21),(16,'2023-05-29','awaiting_pick_up',58,22),(17,'2023-06-01','awaiting_pick_up',2,23),(18,'2023-05-28','awaiting_pick_up',97,24),(19,'2023-05-30','awaiting_pick_up',97,25),(20,'2023-05-30','awaiting_pick_up',36,26),(21,'2023-06-02','awaiting_pick_up',32,27),(22,'2023-05-29','awaiting_pick_up',35,28),(23,'2023-06-01','awaiting_pick_up',15,29),(24,'2023-05-30','awaiting_pick_up',80,30),(25,'2023-05-31','awaiting_pick_up',24,31),(26,'2023-05-29','awaiting_pick_up',45,32),(27,'2023-06-01','awaiting_pick_up',38,33),(28,'2023-05-30','awaiting_pick_up',9,34),(29,'2023-05-31','awaiting_pick_up',22,35),(30,'2023-05-28','awaiting_pick_up',21,36),(31,'2023-05-29','awaiting_pick_up',33,37),(32,'2023-05-27','awaiting_pick_up',68,38),(33,'2023-06-01','awaiting_pick_up',22,39),(34,'2023-05-29','awaiting_pick_up',85,40),(35,'2023-05-29','awaiting_pick_up',35,41),(36,'2023-05-30','awaiting_pick_up',83,42),(37,'2023-05-31','awaiting_pick_up',92,43),(38,'2023-05-27','awaiting_pick_up',38,44),(39,'2023-06-01','awaiting_pick_up',59,45),(40,'2023-06-01','awaiting_pick_up',90,46),(41,'2023-05-27','awaiting_pick_up',42,47),(42,'2023-06-01','awaiting_pick_up',64,48),(43,'2023-05-29','awaiting_pick_up',61,49),(44,'2023-06-02','awaiting_pick_up',15,50),(45,'2023-06-01','awaiting_pick_up',4,51),(46,'2023-05-30','awaiting_pick_up',40,52),(47,'2023-05-27','awaiting_pick_up',50,53),(48,'2023-06-02','awaiting_pick_up',44,54),(49,'2023-06-02','awaiting_pick_up',54,55),(50,'2023-05-29','awaiting_pick_up',25,56),(51,'2023-05-28','awaiting_pick_up',34,57),(52,'2023-05-27','awaiting_pick_up',14,58),(53,'2023-05-27','awaiting_pick_up',33,59),(54,'2023-06-01','awaiting_pick_up',94,60),(55,'2023-05-29','awaiting_pick_up',66,61),(56,'2023-05-28','awaiting_pick_up',27,62),(57,'2023-05-30','awaiting_pick_up',78,63),(58,'2023-05-31','awaiting_pick_up',56,64),(59,'2023-05-28','awaiting_pick_up',3,65),(60,'2023-06-01','awaiting_pick_up',29,66),(61,'2023-05-30','awaiting_pick_up',3,67),(62,'2023-05-29','awaiting_pick_up',51,68),(63,'2023-05-27','awaiting_pick_up',19,69),(64,'2023-05-29','awaiting_pick_up',5,70),(65,'2023-06-01','awaiting_pick_up',93,71),(66,'2023-05-27','awaiting_pick_up',21,72),(67,'2023-06-01','awaiting_pick_up',58,73),(68,'2023-05-27','awaiting_pick_up',91,74),(69,'2023-06-01','awaiting_pick_up',65,75),(70,'2023-06-02','awaiting_pick_up',87,76),(71,'2023-06-01','awaiting_pick_up',55,77),(72,'2023-05-31','awaiting_pick_up',70,78),(73,'2023-06-01','awaiting_pick_up',29,79),(74,'2023-05-30','awaiting_pick_up',81,80),(75,'2023-05-28','awaiting_pick_up',89,81),(76,'2023-06-02','awaiting_pick_up',67,82),(77,'2023-05-30','awaiting_pick_up',58,83),(78,'2023-05-27','awaiting_pick_up',29,84),(79,'2023-05-29','awaiting_pick_up',68,85),(80,'2023-05-31','awaiting_pick_up',84,86),(81,'2023-05-29','awaiting_pick_up',4,87),(82,'2023-05-30','awaiting_pick_up',51,88),(83,'2023-05-28','awaiting_pick_up',87,89),(84,'2023-05-27','awaiting_pick_up',74,90),(85,'2023-05-29','awaiting_pick_up',42,91),(86,'2023-06-02','awaiting_pick_up',85,92),(87,'2023-05-31','awaiting_pick_up',81,93),(88,'2023-05-29','awaiting_pick_up',55,94),(89,'2023-05-28','awaiting_pick_up',8,95),(90,'2023-06-01','awaiting_pick_up',95,96),(91,'2023-05-30','awaiting_pick_up',39,97),(92,'2023-05-27','awaiting_pick_up',17,98),(93,'2023-06-02','awaiting_pick_up',28,99),(94,'2023-06-02','awaiting_pick_up',7,100),(95,'2023-05-31','awaiting_pick_up',40,101);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enforce_reservation_limit` BEFORE INSERT ON `reservation` FOR EACH ROW BEGIN
    SET @reserve_count = NULL;
    SET @user_role_id_var = NULL;
    SET @reservation_limit = NULL;

    SELECT role_id into @user_role_id_var
    FROM library_user
    WHERE user_id = NEW.library_user_user_id;

    -- Prevent users from reserve book that they currently have borrowed
    IF (SELECT COUNT(borrowing_id) FROM borrowing WHERE book_book_id =  NEW.book_book_id AND library_user_user_id = NEW.library_user_user_id AND borrowing_status = 'active') >= 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot reserve a copy of a Book that the same user has borrowed';
    END IF;
    
	IF (SELECT COUNT(reservation_id) FROM reservation WHERE book_book_id =  NEW.book_book_id AND library_user_user_id = NEW.library_user_user_id ) >= 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot reserve two of the same book';
    END IF;
    
    -- Get the total number of books reserved by the user in the current week
    SELECT COUNT(*) INTO @reserve_count
    FROM reservation
    WHERE library_user_user_id = NEW.library_user_user_id
    AND DATEDIFF(NEW.reservation_date, reservation_date) <= 7;
    
    -- Determine the borrowing limit based on the user's role
    IF @user_role_id_var = 4 THEN -- Student role
        SET @reservation_limit = 2;
    ELSEIF @user_role_id_var = 3 THEN -- Professor role
        SET @reservation_limit = 1;
    END IF;
    
    -- Check if the reservation limit has been reached
    IF @reserve_count >= @reservation_limit THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Cannot reserve more books for that user';
    END IF;
    
    
	-- Check availability 
	
    IF (SELECT school_book_amount FROM school_book 
    WHERE book_book_id =  NEW.book_book_id
    AND school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)) < 1 THEN
		-- No books available  status -> on hold 
        SET NEW.reservation_status = 'on_hold';
	ELSE -- Remove one book from school and status -> waiting for pick up
		UPDATE school_book set school_book_amount = school_book_amount - 1
		WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)
		AND book_book_id = NEW.book_book_id;
        SET NEW.reservation_status = 'awaiting_pick_up';
	END IF;
    
    if NEW.reservation_date IS NULL THEN
		SET NEW.reservation_date = CURDATE();
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DecreaseBookAmountTrigger` AFTER UPDATE ON `reservation` FOR EACH ROW BEGIN
  -- Check if the borrowing status has changed to "awaiting_pick_up"
  IF new.reservation_status = 'awaiting_pick_up' AND OLD.reservation_status = 'on_hold' THEN
	UPDATE school_book SET school_book_amount = school_book_amount + - 1
	WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)
	AND book_book_id = NEW.book_book_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reservation_delete_update_availability` BEFORE DELETE ON `reservation` FOR EACH ROW BEGIN
	
	IF OLD.reservation_status = 'awaiting_pick_up' THEN
		UPDATE school_book set school_book_amount = school_book_amount + 1
		WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = OLD.library_user_user_id)
		AND book_book_id = OLD.book_book_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_text` text,
  `review_rating` int NOT NULL,
  `review_date` date NOT NULL,
  `review_status` enum('validated','pending_validation') NOT NULL DEFAULT 'validated',
  `book_book_id` int NOT NULL,
  `library_user_user_id` int unsigned NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_book1_idx` (`book_book_id`),
  KEY `fk_review_library_user1_idx` (`library_user_user_id`),
  CONSTRAINT `fk_review_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_review_library_user1` FOREIGN KEY (`library_user_user_id`) REFERENCES `library_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Although sure result under. Whether become admit send like expert. Team box federal agency.\nNor concern drug theory rich. Head respond table off. Moment find walk bad material physical so.',0,'2023-06-03','validated',10,7),(2,'Probably international figure help authority. Trip they every remember.\nAgainst half administration effect. Save raise produce story manager. Research door smile weight article.',2,'2023-06-03','validated',39,7),(3,'Attack have during.\nBad soon food gas through hospital. Finally this recently next.',5,'2023-06-03','validated',21,7),(4,'Through visit last main. Hair describe record girl small. Play community whom another decade book.',3,'2023-06-03','validated',73,8),(5,'Discuss local ask amount that sound.\nStatement same hand room. Eight field candidate detail amount body. Indeed red out establish large body start.\nRegion religious arm worker wrong.',2,'2023-06-03','validated',17,8),(6,'Something why say point material eye. Character charge game list. Add box when statement loss.',0,'2023-06-03','validated',72,8),(7,'Ten rest effort bed. Too friend fly put week past. Song drive involve night.',0,'2023-06-03','validated',76,9),(8,'Agreement style wrong full agree item. Practice himself service evidence.\nNetwork defense whole. Though stay voice do. Husband daughter require meeting edge mission.',1,'2023-06-03','validated',73,9),(9,'Couple whose leader rate. Near ten century forward long health catch.\nProperty song scientist should course. Recognize peace play executive sing center item.',3,'2023-06-03','validated',22,9),(10,'Say occur hit lawyer perhaps. Get such animal sit anyone issue what worker.\nDevelopment security century type. Sell dinner civil focus rock bring relate water. Space trip pull wish must.',5,'2023-06-03','validated',80,10),(11,'Assume share information security. Can style western direction pretty test amount product. I act executive fill fear.',4,'2023-06-03','validated',5,10),(12,'Various hour lose fear again near bag southern. Start individual forward seven there rule challenge.\nReflect play baby. Continue pull television how. Enter relationship common.',3,'2023-06-03','validated',26,10),(13,'And affect college get. Child worry nice think.\nImage who part about allow claim wish. Standard identify accept song plant.\nAll game girl sister inside cell.',2,'2023-06-03','validated',13,11),(14,'Black really war project cup. Argue few over player party new base democratic. Until institution employee effect follow per minute.',1,'2023-06-03','validated',74,11),(15,'Might exist none car list guy contain. Need why explain either raise indicate. Mouth these agency mean medical. Public allow travel probably.',5,'2023-06-03','validated',56,11),(16,'Attorney behind he market Democrat later south. Reason range few there role someone others. Nor contain say security party organization nation.',4,'2023-06-03','validated',25,12),(17,'Your technology become plan trip method ok. Live just more technology. Assume fast bring senior matter minute.',3,'2023-06-03','validated',14,12),(18,'Section service blue large many animal. Practice save create.\nProperty so upon again three.',5,'2023-06-03','validated',50,12),(19,'Thousand remain history suddenly society. Vote recognize trial manager serve improve. New truth power suddenly fall establish material.\nAgreement indicate chance better modern worker produce better.',2,'2023-06-03','validated',65,13),(20,'Risk federal draw finish yeah sort commercial down. Hold large concern experience green meeting into. Official foreign cold authority yes day.',3,'2023-06-03','validated',3,13),(21,'Institution chair evening free. Attack loss summer want task. Matter organization investment.',2,'2023-06-03','validated',79,13),(22,'Task employee join different magazine. This keep hot option.\nArm brother relationship movie alone.',3,'2023-06-03','validated',37,14),(23,'Daughter appear media as stay. Ten church authority responsibility little possible site.\nSea yourself up maybe food. Civil rate although.\nPage indicate picture cell.',0,'2023-06-03','validated',21,14),(24,'Choice reflect over. Cause choice no answer piece wonder. Case true lose democratic tree though cultural. Concern blue daughter project lay her.',1,'2023-06-03','validated',42,14),(25,'Number this cut doctor. Rate brother series. Affect early rock his.\nSpeech up indicate. Population program herself head question bed word. Anyone another thank claim specific billion yard.',4,'2023-06-03','validated',18,15),(26,'Standard get product why enter report board. Computer capital relate.\nDoor born less study. Teach law street financial year. High feel hundred international phone break.',2,'2023-06-03','validated',55,15),(27,'Bar cover resource. Free growth girl father these.\nChild mother do attorney.\nUnit music great card stuff however plan. Show almost plan home describe.',1,'2023-06-03','validated',35,15),(28,'Tough social unit concern anything new. Character feeling method join film score. Area public analysis.',5,'2023-06-03','validated',13,16),(29,'Course ten heavy address would ground chair. Some field member none policy current study expect. Coach wait significant military avoid fine particularly.',3,'2023-06-03','validated',71,16),(30,'Purpose start off approach. Organization provide exactly drug. Matter reflect avoid customer.\nSeek media difficult require friend soon clearly. Save wind all.',2,'2023-06-03','validated',88,16),(31,'Stuff discuss history paper. Trip prove at western here. Fight certainly television among alone and democratic.',4,'2023-06-03','validated',63,17),(32,'Various best artist cold majority set article. Director eye consumer. History yourself left all those and.',4,'2023-06-03','validated',31,17),(33,'Finish hot rest three under head. White happen possible personal level. Nature easy attorney moment either.',0,'2023-06-03','validated',93,17),(34,'Attorney writer particularly support remember employee. Mind protect effect leader network radio other. Blood kid material surface.\nOfficer field choose else cost. Impact think medical son price.',0,'2023-06-03','validated',11,18),(35,'Country site head month consumer floor reduce worker. Any yet decision make enough rather democratic. Maybe send experience resource.',1,'2023-06-03','validated',22,18),(36,'Pm news traditional pay describe design job.\nReal laugh away book. Very movement democratic too political both realize.',1,'2023-06-03','validated',69,18),(37,'Will huge so discover least. Arrive Congress actually tough to level so that. Century within reduce should within wear option.',1,'2023-06-03','validated',35,19),(38,'Energy real price may. Cut maintain energy reason woman son meeting. Consider place student.\nWest health boy space fall state activity. Maintain back figure drive this.',2,'2023-06-03','validated',77,19),(39,'Quality who scientist want audience Congress experience. Citizen hand local. Art throughout task.',4,'2023-06-03','validated',33,19),(40,'Financial capital way pressure realize issue. Style free relationship.\nCultural vote something guy weight live.\nCrime culture service actually quality bed computer.',2,'2023-06-03','validated',44,20),(41,'She similar sport according beat. Foot stand white box last cut government. President study pay TV Mrs measure everybody.\nTell seat how down exactly per care. Hour may remember sure left.',2,'2023-06-03','validated',15,20),(42,'Focus appear indeed enough see nothing. According that behind fund best. Although dream manage give drive program.',2,'2023-06-03','validated',31,20),(43,'Conference language truth become key open. Month generation interest scene area trip spend. More ago respond a car.\nDirection subject area feel. Building tree collection.',4,'2023-06-03','validated',100,21),(44,'Every tell actually car manager mission national result. Nearly interview court two grow fear call. Work live against factor major. Girl pretty describe live machine because available.',5,'2023-06-03','validated',63,21),(45,'Agree scientist budget sound draw poor. Those rate require game draw include current billion.\nDegree site camera bag. Avoid southern me produce stop. Morning economy several natural.',1,'2023-06-03','validated',75,21),(46,'Notice task wait worker mother card sort. Player eat mission energy. Reason second and.\nBecause method interest site. Finish report talk space.',4,'2023-06-03','validated',99,22),(47,'World cell over mouth social measure always. Pressure respond begin wish condition executive. Individual then suggest once tell herself early.\nEconomy Mrs reason strong.',0,'2023-06-03','validated',42,22),(48,'Point prevent who similar such left reveal. Western think story determine evening knowledge record return. Least entire color police political value end.',0,'2023-06-03','validated',53,22),(49,'Interest Republican place approach Congress pay yard. If product happy dark upon price strong nothing. Clear there development vote practice.',0,'2023-06-03','validated',49,23),(50,'Science why budget toward Mr. Discussion discover themselves same type officer. Green others month matter cultural himself these.',1,'2023-06-03','validated',17,23),(51,'Remain accept understand avoid south draw interview. Government issue drug relationship ahead. Forward knowledge share church.\nExist magazine whom story reveal. Age read party fight onto know.',2,'2023-06-03','validated',15,23),(52,'Explain religious soon. Form analysis different today campaign church worker.\nThemselves meet poor fear. Risk agent increase sense style energy beat spend. Figure hair student affect force.',4,'2023-06-03','validated',76,24),(53,'Blood now environmental reach produce high. Letter member room page. Oil civil similar big process such police point.',3,'2023-06-03','validated',10,24),(54,'Democratic than try action. Carry season bag director cause history computer consumer. Figure fact thing. Analysis hit quickly up easy remember tree.',4,'2023-06-03','validated',71,24),(55,'Record rich contain also my them.\nUse be member determine yet north. Skin for message real. Pm happy reach available control lose case. Home type food child visit three.',1,'2023-06-03','validated',73,25),(56,'Other south wear exactly information training security. Dark matter cause feel always issue drive fly. Wrong whose wall art five leave.',0,'2023-06-03','validated',35,25),(57,'Not either give let success many leader. Where travel thing never article worker.\nCollection protect anything fly change hold. Grow glass skin Republican of training.',2,'2023-06-03','validated',38,25),(58,'Five mind service entire might sport Mrs station. Garden society time include hotel southern it. Because character weight newspaper technology still show. Compare relate fast fine coach young.',4,'2023-06-03','validated',69,26),(59,'President if thought happen under later government. Myself they boy west again.\nAvoid into possible hair. Hit pay factor begin. Thousand individual hundred budget above. Article sound never question.',0,'2023-06-03','validated',59,26),(60,'Throw quite onto word American. Trouble point wrong. Give exactly little serious newspaper crime five none. Positive behavior national always news paper.',2,'2023-06-03','validated',14,26),(61,'Develop every evening during never. The trouble wait expect item movie.\nSomebody note effect task never message. Edge place ten data education use more. Make region think nothing affect stand term.',0,'2023-06-03','validated',38,27),(62,'Player kind nor region author day able. Item contain heavy own parent. Face must reflect.\nFear face boy over occur race capital. Consumer player only machine usually.',0,'2023-06-03','validated',79,27),(63,'Item standard watch box ask over serious. Evidence little life alone group everyone. Everything item role.',5,'2023-06-03','validated',2,27),(64,'Hold night artist. Where eat make special medical day action field. Certainly far of board simply design they arm.',0,'2023-06-03','validated',53,28),(65,'Whose yes star with reason treatment give. Human very all laugh.\nStreet note travel sell usually data program off. Sound camera work fast result.',0,'2023-06-03','validated',6,28),(66,'Forward different move our later role if. Upon same under technology. Most piece outside.\nSing best forward security capital try. Spring culture better.',1,'2023-06-03','validated',31,28),(67,'Choose risk front rich collection performance by letter.\nSpend medical series goal sound green. Oil rich brother we decade appear. Along hundred deep month everybody social if.',4,'2023-06-03','validated',54,29),(68,'Reality push them political approach. My measure later case develop movement. Cut customer and.',1,'2023-06-03','validated',15,29),(69,'Wait anything answer financial among major. Tv coach boy American fear most hard whose.\nReturn phone reality explain. Contain toward politics account almost despite goal.',3,'2023-06-03','validated',22,29),(70,'Development new skill. Again myself edge rather. Worry just wide result.\nDemocrat force or modern play stuff. Mention future street. North medical air.',5,'2023-06-03','validated',31,30),(71,'Factor toward school actually tax middle who. Structure TV history own charge us.\nRemember agency audience give. Central safe task high sound.',1,'2023-06-03','validated',96,30),(72,'With especially wife group. Others with institution concern cold assume. Through focus step citizen exist.\nStyle organization amount education. If body lead color next a. Party fly drug.',0,'2023-06-03','validated',56,30),(73,'Detail space artist whom find deep. Apply forward music its exactly.\nCare fear fund stop three make. Lose present foot produce leg people.',3,'2023-06-03','validated',70,31),(74,'Window ahead kitchen woman dog article national want. Car evidence long organization we easy increase. Away main field.\nParticular official job site. Now myself energy stuff start sort trade decide.',2,'2023-06-03','validated',71,31),(75,'Add decade prepare field ground. Your film eat give month write.\nAgainst get low letter special need participant build. Itself cut yourself technology name themselves.',2,'2023-06-03','validated',92,31),(76,'Offer tax manager. Sort lay address bad even way.\nLight size knowledge force who stage. Town travel form guess let start.',3,'2023-06-03','validated',41,32),(77,'Area majority pay serve next cost foot piece. Recognize bill meet article four building choose design. Authority your Mrs main executive rise.',0,'2023-06-03','validated',27,32),(78,'Human this matter watch. Note near our play later range. Deal build will leg suffer. Catch meeting statement argue thank.',5,'2023-06-03','validated',41,32),(79,'Establish couple maintain remember language. Across check tend.\nGroup organization agency seat. Trade travel company such one after east second. Give executive authority western protect set.',0,'2023-06-03','validated',4,33),(80,'Ask lot item general model thank place pressure. Half leg edge key themselves. Individual fall above sell onto test.',0,'2023-06-03','validated',38,33),(81,'Consumer involve mission activity. Rise range mouth serious already sit yourself. Movement according culture investment where all may.',5,'2023-06-03','validated',77,33),(82,'Human wait better consumer. Site pay social better trial listen. Standard word fund serve specific baby administration body.',2,'2023-06-03','validated',58,34),(83,'Group majority necessary anything. Father into continue decide your.\nMeasure ten structure toward order commercial better ready.',3,'2023-06-03','validated',41,34),(84,'At finally its act. Usually when pass theory appear without.\nThird adult beyond seem our keep project. Can white leader office individual. Concern lot from your Mr too population.',3,'2023-06-03','validated',9,34),(85,'Example method eye interest.\nA become care.\nLife himself table adult plant. But it here few could campaign. Set always care yet task.',0,'2023-06-03','validated',41,35),(86,'Space cover attention research service break. Understand season rock could raise this piece.',4,'2023-06-03','validated',59,35),(87,'Conference others marriage. Wind your development but.\nIn reach if lawyer south present. Upon remain either artist off.\nSuddenly because senior build drug.',0,'2023-06-03','validated',33,35),(88,'Attack my ready morning. Bank begin sort somebody get particular administration leave. Decision listen party around fast yeah thought. Leave check national fish successful.',1,'2023-06-03','validated',80,36),(89,'Upon away anything main. Raise service marriage view. Trouble early condition technology later figure.',4,'2023-06-03','validated',89,36),(90,'Wide back example serve usually prepare. Answer human find PM discussion language old. Leave sing second.\nState religious month. Scene sometimes data environment sit long.',3,'2023-06-03','validated',85,36),(91,'Do own if themselves western minute research remember.\nSoon determine recent fire. Consumer raise green long season school consumer Mr.',2,'2023-06-03','validated',34,37),(92,'Play question such anyone hot. Especially so good when church suggest second character. Explain air blue serious.\nAccount Mrs take Congress too. Turn whether military small sense.',1,'2023-06-03','validated',70,37),(93,'East too herself his entire sport well. Adult arm brother good indeed month. Fear successful particular play glass animal boy. Yet yard identify.',1,'2023-06-03','validated',40,37),(94,'Again month many brother government. Learn during should story usually. Government enough tree then follow way yourself.\nDo stop movie show. Issue if not degree him answer simply.',1,'2023-06-03','validated',32,38),(95,'Pull wish move season share network. Across range choice tree about artist finish leader.\nIt across level sign same federal detail. Produce likely how parent.',2,'2023-06-03','validated',11,38),(96,'Degree race southern support. Edge with able paper. Miss many tonight analysis big system total.\nFactor dinner protect outside huge particular authority. Memory else bit state daughter skin.',2,'2023-06-03','validated',12,38),(97,'Star late air in thus close get. Record group art. Role relate Mr approach line even.',3,'2023-06-03','validated',12,39),(98,'Around Congress full marriage dinner toward whether. Rich how as total.\nSeason positive community just continue. Operation pull share event.',5,'2023-06-03','validated',74,39),(99,'Shake attorney question evidence. Wrong together early standard.\nApply in according condition. State society address community fear available. She those fly in. Arrive north quality record.',5,'2023-06-03','validated',44,39),(100,'Kid free follow receive who well. Power oil most space watch.\nCell could beat full analysis factor. Same business effect deep necessary.',1,'2023-06-03','validated',50,40),(101,'Entire drug tree trip east song make. Budget let wife plan figure cultural sort. Quickly season attention heart ball campaign.',2,'2023-06-03','validated',6,40),(102,'Sit degree own society door drive. Single government again total say discuss. Laugh his policy.\nQuickly receive yourself prevent plant tree shoulder. Those bag son threat. Fish place difficult.',2,'2023-06-03','validated',24,40),(103,'Film rule late.\nType civil general pay allow.\nThough experience view president answer. Experience live edge participant lay which.\nAlthough him main firm. If while certain recently task hit east.',2,'2023-06-03','validated',75,41),(104,'Article wind kid film pay of always. Need fish memory according other here eye.\nSection finish lead old time fast national.\nAfter finish Mrs cultural even quality show water.',2,'2023-06-03','validated',32,41),(105,'Past to force eye candidate. Paper must bank one. Stay part your myself seat pattern.\nHelp analysis conference phone alone service seek. Republican pass area guess have serve picture.',2,'2023-06-03','validated',13,41),(106,'Work than save form. Forward specific far purpose three. Hour local test safe stay four similar.',4,'2023-06-03','validated',79,42),(107,'History do like wait election pick author. Whatever could radio author form word. Something and skin court blue understand.',4,'2023-06-03','validated',77,42),(108,'Less friend after should him station church. Tend site bill official.\nDinner pressure point fear start either. Pm player institution suffer identify none degree. Quite establish section since move.',0,'2023-06-03','validated',32,42),(109,'Say impact minute ago. Appear without eat. Focus production allow lose. Realize against man today.\nTonight friend wear not live strong vote. Happen this thousand network sell factor.',1,'2023-06-03','validated',3,43),(110,'Style hold of possible far. Interview seek thing you.\nChurch up hundred measure his. Game project determine us eight.',1,'2023-06-03','validated',52,43),(111,'Move address war according. Hand system form stand.\nSure north nice bring send size voice evening. Attorney car six trip decade.',0,'2023-06-03','validated',35,43),(112,'Argue sure property five energy. Your specific economy decade always serious improve early. Question song miss talk simply help.',4,'2023-06-03','validated',10,44),(113,'Hotel top own talk human table. Arrive force cover area.\nRaise myself scene partner behind. To four right evening song. Must international someone form treat picture.',5,'2023-06-03','validated',10,44),(114,'Individual official deep since source sound situation. Decade manage order record media.\nWhile only industry author senior. Economy respond stand bag.',0,'2023-06-03','validated',82,44),(115,'Final front always law. Amount early class. Stuff mention interest drug board yourself specific nice.\nFood base however resource fish word less. Professional way seek travel magazine.',0,'2023-06-03','validated',38,45),(116,'Each world eight follow out. Shoulder fly according paper attorney. Eight human see watch down daughter make. Would air mission eat.\nPlay beautiful themselves become. Beyond next enjoy or physical.',2,'2023-06-03','validated',64,45),(117,'Measure each become series stock enough public. Company class main service allow despite many. Wife hope ever early before team.',3,'2023-06-03','validated',20,45),(118,'Military decide experience lay community. May development level. Want quickly quality fear drop.',0,'2023-06-03','validated',65,46),(119,'Wear then need. Dog security eye. Model job whether water make image affect.\nComputer affect top project nor writer number put. Lead enough laugh catch. Look season treat safe.',2,'2023-06-03','validated',10,46),(120,'Box friend care cold actually. Top ago paper goal since follow reveal against. Me change phone test go same.',4,'2023-06-03','validated',86,46),(121,'Military particular increase must. System east itself perform. Player case edge.\nPerform example clear make might thousand question.',1,'2023-06-03','validated',23,47),(122,'Guess never help level finish. Fund on fact buy soon. His after alone join image ago them. Western idea dark once less special thousand rate.',1,'2023-06-03','validated',19,47),(123,'Radio move among history after news treat reality. Week federal top attention today. Civil pretty weight.\nHerself lay ok answer kind clearly artist. Reality up player already.',2,'2023-06-03','validated',40,47),(124,'Push church policy catch over nearly. Section baby budget five. Current movie course environmental majority great. Arrive sit cost.',0,'2023-06-03','validated',91,48),(125,'Now energy fear certainly. Recognize yet role nor face lay. Truth material head between each.\nDoor piece dream policy. Type upon example institution let cell. Pick play case statement bit.',4,'2023-06-03','validated',78,48),(126,'Especially employee have space activity leader according.\nTreat medical court air enter score. Manager especially partner recent arrive natural.',2,'2023-06-03','validated',17,48),(127,'Expect result language break control. Third enjoy indeed officer reality. Have analysis throw write popular.',1,'2023-06-03','validated',19,49),(128,'Design or drug Mrs up stand control arrive. Standard believe term them every. Water page PM management time must ask.\nRepublican land because partner machine. Cut product ask. Near be account.',4,'2023-06-03','validated',93,49),(129,'Rule single own pull thought. Character myself involve source Democrat.\nAccording do risk treat work. Sing executive firm let need cup. Piece woman across her bar buy.',0,'2023-06-03','validated',100,49),(130,'Strong take improve magazine. Author left information attention send PM like. Beyond couple section training.',2,'2023-06-03','validated',80,50),(131,'Both class rich live. Role scientist treat reflect. Deal medical buy without film from meeting size.',5,'2023-06-03','validated',71,50),(132,'Someone contain happen have be. Season station moment see step last after.\nGuess Republican face decade.',5,'2023-06-03','validated',89,50),(133,'Probably outside method despite treatment wait. Line start sea interview. Others plan recognize. Mission yeah grow wide.',1,'2023-06-03','validated',23,51),(134,'Wait hard machine around your deep what. Hear join particularly production notice.',2,'2023-06-03','validated',56,51),(135,'Health charge seat eight onto such cost. Big role participant send this young. Behind her particular toward Mrs.\nStatement red side city interest road total voice.',4,'2023-06-03','validated',21,51),(136,'War war either stand nation PM. Cup main us situation born cost I national.\nGround necessary level.',0,'2023-06-03','validated',92,52),(137,'Act professor leg media south. Face hotel another use game cause. Lawyer effort dinner page adult. Address pick mother shoulder opportunity.',5,'2023-06-03','validated',32,52),(138,'Performance still particularly job. Success note hold her affect.\nNatural become listen onto community majority no front. Notice career toward important.',2,'2023-06-03','validated',100,52),(139,'Single only wear others affect. Pm simple somebody begin skill political. Center win number information push.\nBed star near. Act who factor family today morning. Common world apply sing firm.',0,'2023-06-03','validated',88,53),(140,'Decide will federal government. Garden it blue least must. Television until year general international standard.',3,'2023-06-03','validated',56,53),(141,'Political ahead statement measure free. Sell after sound animal strong.\nDaughter east new person. Fact those trouble according form safe act.',4,'2023-06-03','validated',33,53),(142,'Hear meeting black effort. Market just factor left show above week.\nThere key wonder may young figure lose. Off open result require culture. Away Congress before particular.',4,'2023-06-03','validated',57,54),(143,'Decision type always. Floor also left past piece mind respond.\nDecade star task. Author two seven fire.\nClearly amount scientist ability worry social.',4,'2023-06-03','validated',59,54),(144,'Want ago focus ok cost. Claim answer pressure hope person. Stay sport buy system bag.\nOpen clearly almost strategy nice night. Control still fish wonder bed. Message improve great.\nBuild learn good.',0,'2023-06-03','validated',51,54),(145,'Theory because must know. Improve source kid option money student. Great rise guess senior popular public.\nI serve stay American low adult decade.',2,'2023-06-03','validated',22,55),(146,'Expect green ago century fact. Agency newspaper I thousand character. Because start goal national fish American.\nRequire they market much. Training meet hope financial.',2,'2023-06-03','validated',63,55),(147,'Several future keep really team season. Evidence behavior bad much girl her lose.\nFeeling difficult story benefit audience. Clearly address tree. Organization everybody box. Fast true trade.',0,'2023-06-03','validated',83,55),(148,'Likely speak thought believe focus stop contain behind. Firm state civil assume theory. Her no call work.\nEverybody market improve. Person long agreement past his.',3,'2023-06-03','validated',74,56),(149,'Trade everybody analysis second floor.\nMachine treat half likely interview. Should education town course question. A war investment writer against care pick.',0,'2023-06-03','validated',8,56),(150,'Thus issue need deal ten. For smile avoid get these west social. None probably month middle successful test rest network.',5,'2023-06-03','validated',46,56),(151,'Interview require cultural exist. Economy through authority parent.\nFire imagine member school year.',4,'2023-06-03','validated',18,57),(152,'Way college guy. Investment low feeling cut information size leg just. Spend at stage oil ok according wait.',4,'2023-06-03','validated',17,57),(153,'Recently human subject list. Natural recent game. Owner step matter be.',1,'2023-06-03','validated',34,57),(154,'Value pick alone beyond be. Always data prevent.\nStay general music many million. Arm before us around security enough around any. Town almost occur star art. Government present although low offer.',2,'2023-06-03','validated',51,58),(155,'Learn town always shoulder. Policy news your discussion require.\nBusiness grow these. Although produce ok above phone. Tend right total much cover. Loss alone type under current fund.',4,'2023-06-03','validated',52,58),(156,'Painting alone herself democratic name result we. I light guy safe. Common involve simple act speech culture.\nFamily agency push various back prepare. Effect enter business work sign.',1,'2023-06-03','validated',79,58),(157,'Walk fast building as plant news every your. Section try family sometimes live produce western.\nHear maintain response town let economic itself member. Training carry heavy else accept experience.',0,'2023-06-03','validated',30,59),(158,'Rise evening art really. Long beyond court likely.\nThink lose risk enjoy trial break. Church south life number.',3,'2023-06-03','validated',1,59),(159,'Suddenly member reality majority stop while campaign. Government upon trouble which nothing evidence.',1,'2023-06-03','validated',68,59),(160,'When mother audience suggest. Growth institution station parent to old. American bit site too answer city give few.\nInvolve past price listen president. Help theory phone season.',2,'2023-06-03','validated',65,60),(161,'Conference base threat financial your four past. Analysis billion care one least capital.\nDescribe physical plant get natural into center west. Figure growth capital pressure me.',5,'2023-06-03','validated',57,60),(162,'Range total type improve high maybe serve. Collection support attorney draw. Especially enough also sense morning throw.',5,'2023-06-03','validated',82,60),(163,'Affect indicate likely pretty political minute fall reveal. Air short card. Field soon agency challenge vote everybody. His value ask born head.',5,'2023-06-03','validated',29,61),(164,'Explain analysis mother nothing almost. Election indicate painting hear weight apply individual. Through national week daughter his role.',1,'2023-06-03','validated',41,61),(165,'Style smile imagine teach. Describe daughter person call.\nExactly attorney industry poor. Difference blood although perform ahead. Wide energy happy sit quality situation together fact.',3,'2023-06-03','validated',88,61),(166,'Along school environmental example use suggest red. Treatment prevent capital real oil. Work like style want enter.',3,'2023-06-03','validated',29,62),(167,'High Mr human federal each beyond listen whom. Identify beyond investment good. Image action reason usually become officer travel trip.',5,'2023-06-03','validated',53,62),(168,'Provide onto debate song mention. He ten themselves skin.\nSeat probably current rock focus attack. American hair world door.',2,'2023-06-03','validated',72,62),(169,'Development four choose environment whole. Issue positive today song report.\nMore effect go spend daughter career. Mind less capital skin.',4,'2023-06-03','validated',94,63),(170,'Expect at both a. Wish fill writer worry. Story himself first event it light military.\nSure fish take western. Sing direction tough enjoy.',5,'2023-06-03','validated',36,63),(171,'Culture some toward until owner old. Four capital drop finish represent. Land wait break value. Notice something anything state where.',5,'2023-06-03','validated',29,63),(172,'Particularly them Republican eight give together office education. Piece identify prepare while make.',0,'2023-06-03','validated',10,64),(173,'Good certainly people set. Building course reveal training. Music beautiful article system city.',4,'2023-06-03','validated',83,64),(174,'End sure evidence weight toward share newspaper. Be artist however all soon recognize new.',2,'2023-06-03','validated',21,64),(175,'Before agent product stage piece dinner meet. Investment town safe pass early.\nBit buy throw must garden. Region notice human.',4,'2023-06-03','validated',99,65),(176,'According eight indeed guess. Hotel with magazine town meeting not.\nDraw bar sort remain. Describe system single measure effect. Smile collection just out.',1,'2023-06-03','validated',40,65),(177,'Dream camera ready point. Make my building cultural power. Suffer develop health any executive American.',2,'2023-06-03','validated',89,65),(178,'Also oil area glass become want decade. Doctor reason middle.\nDecide middle guy station player major society around. Help best then study.',2,'2023-06-03','validated',71,66),(179,'Many those first might main lose. Opportunity drive partner tonight manage professional design. Cost woman us she tough own record.',2,'2023-06-03','validated',22,66),(180,'Week live against one with happy spend. He window nice direction PM significant close. Claim information animal money. Mean break month bed night try do.',5,'2023-06-03','validated',90,66),(181,'Order eye case practice people record measure. Himself sing high treat today.',5,'2023-06-03','validated',60,67),(182,'Purpose scene trouble it expert night standard. Green over task bed friend hand.\nHouse find generation sell form turn. Check maybe computer fire.',4,'2023-06-03','validated',11,67),(183,'Use her house give. Pattern the arm class. Store cause as nothing board.\nRecent statement military include situation capital media pattern. Day plant as impact nor.',0,'2023-06-03','validated',78,67),(184,'Security talk job about action loss. Week before some six them doctor.\nBecause indicate consumer especially. Mean easy develop. Relate method away do professional six laugh.',4,'2023-06-03','validated',74,68),(185,'Treat staff traditional event. Parent quality family western Democrat goal.\nLocal reduce writer more final fine. All serve remain friend its near.',3,'2023-06-03','validated',23,68),(186,'Agreement expect eye usually expert. Three director letter form.\nPresident until kind property. Hope ability call inside. Notice follow order real world ok.',1,'2023-06-03','validated',33,68),(187,'Anything note if animal from change region. Whatever effort lot sit admit these.',3,'2023-06-03','validated',28,69),(188,'Eye cultural read character yourself. Away turn study fight huge.\nParty option audience door stock goal teacher. Point accept remember vote probably admit raise. Treatment evidence beat ability.',4,'2023-06-03','validated',93,69),(189,'Get ok better serious message style sense. Letter campaign sister respond sea. Continue yet fly environmental husband today various.',0,'2023-06-03','validated',64,69),(190,'Area red TV resource eye. Society well happy crime.\nWall road individual outside television. Media girl also send yes piece PM. Theory story realize religious model wait.',5,'2023-06-03','validated',51,70),(191,'Large particularly young memory major possible particular. Hair his subject market nation by before.\nEnjoy not cost interest. Happen support although economic form. Determine not none bill right.',5,'2023-06-03','validated',82,70),(192,'Because down ready these. Reveal accept young my head charge pattern single. Spend letter want use. Officer research report listen people three area.',2,'2023-06-03','validated',50,70),(193,'Reach gas instead my service tell. Trouble inside across edge. Indeed may really both.\nNear under treat approach network structure image. Good central role rest.',4,'2023-06-03','validated',22,71),(194,'Push both letter fact professor safe paper red. Rest doctor minute leave check.\nEnough purpose who organization. Of anyone human policy sister war. Would many me study least yard.',4,'2023-06-03','validated',94,71),(195,'Listen growth day baby local check. Two message strong course agent laugh. Mention ahead sure respond information real.\nItem agree better thousand. Prove test seem maybe fast glass.',0,'2023-06-03','validated',68,71),(196,'Middle performance throw return we. Live with politics hard lawyer read. Interest together contain little.\nOwner during history beautiful hear. Indeed billion win look. Decision stock piece.',0,'2023-06-03','validated',33,72),(197,'Up statement along remember treatment. Rest television structure continue today whose time.\nTable cultural information detail machine.\nWrite resource try especially art.',5,'2023-06-03','validated',13,72),(198,'Smile look across lot sometimes serious police. Any store boy leader clearly. Training degree chair around everyone.',2,'2023-06-03','validated',95,72),(199,'Long party stock. Stand interview whose then significant church.\nBe protect interview new. Surface available choice brother animal grow.',0,'2023-06-03','validated',18,73),(200,'Financial thought improve to join. Sometimes wife moment exactly pick miss center. Star guess president bit when tonight morning majority.',4,'2023-06-03','validated',85,73),(201,'Image staff walk.\nWear particularly across available. Lead firm effect budget score car. Before design away add rise get cold.\nMany marriage thank key various. Audience your teach white decide.',5,'2023-06-03','validated',90,73),(202,'Myself second modern. True former force fly. Matter soon fear light floor without movement cost. Form rise they brother add design information.',0,'2023-06-03','validated',57,74),(203,'Bank increase chance bank himself. Method chance break although. Coach who particular hair watch ago himself.',1,'2023-06-03','validated',49,74),(204,'Oil be wife experience investment left those you. Visit pretty health money staff. Remain movie garden more professional project.',3,'2023-06-03','validated',51,74),(205,'Item sing management our audience. Single return simple age even find.\nMove feel view father. Man arm toward conference safe. Majority college amount brother fast order.',1,'2023-06-03','validated',42,75),(206,'Box wall will lay else well place. Each little country. Performance last clearly design analysis of.\nEconomic budget piece activity certain pull. Security item accept brother center billion example.',3,'2023-06-03','validated',17,75),(207,'Probably son join after part bag time. Education though model about into democratic from those.\nAttorney prepare structure door. Until choose true ago film.',4,'2023-06-03','validated',63,75),(208,'Without station that kid floor region. Today share try. Check last positive.\nFull local occur unit discussion. Offer fear third. Pattern window industry writer simply occur type.',1,'2023-06-03','validated',16,76),(209,'Through way economic across once. Evidence likely health brother international.\nSeat note hand ask. Score race option wind after pressure campaign sense. Out use memory performance.',3,'2023-06-03','validated',77,76),(210,'Coach good ok plan whole hot. Key large check bring.\nMeasure specific candidate pay. Arrive simple kind test sound. Laugh action available lay hour under.',4,'2023-06-03','validated',53,76),(211,'Development view face wonder listen enough. To now until meet. Win kid near area should.\nEvery represent sort as ahead east family feel. Create scene identify short.',0,'2023-06-03','validated',85,77),(212,'While military special join economic factor. Yes economic success worker southern develop debate.\nWhom kid others center. From she level position. Water feel arm particularly with.',2,'2023-06-03','validated',36,77),(213,'Like design happen remain yourself. Participant girl draw tax agreement mission different fund. Young thing under major behavior.',1,'2023-06-03','validated',49,77),(214,'Another buy final assume head various economy. Month work performance information become bag.\nPressure tell beyond skin six here bar practice. Trial hospital anyone time wait.',5,'2023-06-03','validated',72,78),(215,'Also significant ago.\nMemory production wish reflect Republican. Matter concern true.',0,'2023-06-03','validated',25,78),(216,'Issue green six data. Skill state wrong any page save.\nTeacher carry lose item by. Rock nature two major night enjoy certainly. Ball necessary expect local impact scene.',4,'2023-06-03','validated',57,78),(217,'Stop nothing quite walk. Sense fire particularly.\nMay economy general card difference very everyone dog. The arrive capital reach shake century specific little. Answer director produce ready.',4,'2023-06-03','validated',3,79),(218,'Simple yet less minute senior. Animal six method run join hour second.\nStop exist during goal. Big against traditional material run lose many behind.',0,'2023-06-03','validated',81,79),(219,'Project agreement any air. Indicate less music wrong.\nReally win school theory. Visit because green consumer across decide go.',4,'2023-06-03','validated',32,79),(220,'Religious cause as particularly data close. Beat west his.\nProduce soon stock hear leave. Simply someone education enough specific civil begin against.',2,'2023-06-03','validated',27,80),(221,'Modern training smile resource. Trade receive improve agency stop during travel.\nMemory through forward beautiful. Treat century wish. Service through class occur.',1,'2023-06-03','validated',37,80),(222,'People sometimes reality product consider sense page door. Seek enough teacher ten how person see might.\nBag through method particularly. Professor most church. Capital most such.',1,'2023-06-03','validated',70,80),(223,'Lot mother floor rich cut weight else.\nDrug benefit center serious public though. Space occur hear. People career measure get.',1,'2023-06-03','validated',35,81),(224,'Focus discuss piece point present. Rock bit win item area. Phone ahead number weight more.\nTeach next meeting once himself.',2,'2023-06-03','validated',75,81),(225,'Free big nature star subject. Main teach hear easy our girl.\nTable already result at no kitchen bed. Specific follow after there none against level.',2,'2023-06-03','validated',88,81),(226,'Likely deal show why second choose. Role vote guess around institution increase light. Blue offer along.\nAbout state laugh instead. Weight deep bit later. Doctor travel personal month.',3,'2023-06-03','validated',22,82),(227,'During east he collection benefit and my. Face similar alone. Firm evening bar report piece room technology.\nCommercial one trial else.',4,'2023-06-03','validated',46,83),(228,'Itself section according change. Ball approach stock in whole here.\nEffect surface vote store. Must happy mean professor thank.',3,'2023-06-03','validated',54,84),(229,'Structure feeling picture go organization rule. Politics worker region response.\nChoose tonight best protect. Back major determine three. Official hear difference.',0,'2023-06-03','validated',99,85),(230,'Race perform fact character crime number at. Natural final partner about. Expect rich author possible instead interesting.',1,'2023-06-03','validated',74,86),(231,'Fill young provide more. Spring stay standard ten.\nSituation likely make early worker now chair enjoy. Land cell glass trip up evening. Star case quality fund.',3,'2023-06-03','validated',27,87),(232,'Wife check eight month can travel. Street purpose happen but standard team protect.\nWorry mother job say plan threat term.\nAbove break middle defense down. Agency use pick recent should.',2,'2023-06-03','validated',14,88),(233,'Seek small without society discussion. Kitchen system own million international up capital.\nOwn compare think edge bad middle. Institution car recognize.',0,'2023-06-03','validated',16,89),(234,'Soldier price since step window through. Rise message mouth quite floor high want. Ever quickly whatever.\nThus success you lot. Similar true side kid.',4,'2023-06-03','validated',96,90),(235,'Low leave listen nothing result avoid keep goal. Structure research consumer put. Win save place total every hope single operation.',0,'2023-06-03','validated',70,91),(236,'Campaign great add thought. Among up chair skill floor ball development. White eye single consumer another.\nCentury simple none suffer leg decade. Put nature important son local ball peace.',2,'2023-06-03','validated',87,92),(237,'Discover perform fall yet. Single let line take doctor test. Although girl himself.\nFill sing lose example.',5,'2023-06-03','validated',84,93),(238,'News true bring financial many least. Perform doctor continue guess soldier better partner. Successful benefit indeed clearly American.',1,'2023-06-03','validated',10,94),(239,'Several small activity concern. Sell animal impact score leave hit end. Office sometimes until our. Investment player summer range hair add accept avoid.',4,'2023-06-03','validated',48,95),(240,'Else ten learn nice my. My argue since record. Identify two concern.\nTv need my movie determine real. Up write perhaps themselves class. Stop better language set in radio end.',4,'2023-06-03','validated',40,96),(241,'Can bring a including specific get third follow. Whom must beyond oil surface. Answer local seek know fire list change truth.',3,'2023-06-03','validated',65,97),(242,'Early song training news approach also. Final hope field go matter difference. Industry certain compare manage.',5,'2023-06-03','validated',46,98),(243,'Local approach she ask. Crime may sit various employee. I father fast poor into art result smile.\nDrive person debate live watch policy.\nArm ball interest training dream social. Change alone control.',4,'2023-06-03','validated',42,99),(244,'Fine its smile rise who. Authority imagine brother ten.\nRight stage during open director floor trouble. Whose my hot second nothing everybody. Able century during ask itself citizen.',0,'2023-06-03','validated',16,100),(245,'Trade herself person firm stage actually. Enjoy in action ago. Own teacher good contain successful military. Later eat picture election garden.',3,'2023-06-03','validated',92,101);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `review_BEFORE_INSERT` BEFORE INSERT ON `review` FOR EACH ROW BEGIN
	IF (NEW.review_rating > 5 OR NEW.review_rating < 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'review rating between 0 and 5';
    END IF;
    
    SET NEW.review_date = CURDATE();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `school_id` int unsigned NOT NULL AUTO_INCREMENT,
  `school_name` varchar(50) NOT NULL,
  `school_principal_name` varchar(50) NOT NULL,
  `school_mail_address` varchar(70) NOT NULL,
  `city` varchar(40) NOT NULL,
  `school_phone_number` varchar(10) NOT NULL,
  `school_email` varchar(50) NOT NULL,
  PRIMARY KEY (`school_id`),
  UNIQUE KEY `school_name_UNIQUE` (`school_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Beard-Aguilar','Michael Mccarthy','brownjamie@example.net','Amandaburgh','2343194888','tylerbailey@example.org'),(2,'Hamilton, Arnold and York','Dwayne Smith','kayleebrown@example.org','Lake Timothy','2361060418','whayes@example.org'),(3,'Collins PLC','Theresa Robinson','dgarcia@example.net','New Glenn','2299222883','jenniferyork@example.net'),(4,'Johnson Ltd','Lisa Franklin','mnguyen@example.net','North Ashley','2845789132','brendasosa@example.net'),(5,'Brown-Morton','Kyle Lee','smithgabriela@example.com','Lake Brandon','2363403315','kjones@example.net');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_book`
--

DROP TABLE IF EXISTS `school_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_book` (
  `school_school_id` int unsigned NOT NULL,
  `school_book_amount` int unsigned NOT NULL,
  `book_book_id` int NOT NULL,
  PRIMARY KEY (`school_school_id`,`book_book_id`),
  KEY `fk_school_book_book1_idx` (`book_book_id`),
  CONSTRAINT `fk_school_book_book1` FOREIGN KEY (`book_book_id`) REFERENCES `book` (`book_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_school_book_school1` FOREIGN KEY (`school_school_id`) REFERENCES `school` (`school_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_book`
--

LOCK TABLES `school_book` WRITE;
/*!40000 ALTER TABLE `school_book` DISABLE KEYS */;
INSERT INTO `school_book` VALUES (1,4,1),(1,4,2),(1,3,3),(1,3,4),(1,2,5),(1,4,6),(1,4,7),(1,3,8),(1,3,9),(1,3,10),(1,3,11),(1,3,12),(1,4,13),(1,4,14),(1,4,15),(1,3,16),(1,4,17),(1,3,18),(1,4,19),(1,4,20),(1,4,21),(1,4,22),(1,3,23),(1,3,24),(1,4,25),(1,4,26),(1,3,27),(1,4,28),(1,3,29),(1,3,30),(1,4,31),(1,3,32),(1,3,33),(1,4,34),(1,4,35),(1,4,36),(1,3,37),(1,4,38),(1,4,39),(1,4,40),(1,4,41),(1,4,42),(1,4,43),(1,4,44),(1,4,45),(1,4,46),(1,3,47),(1,4,48),(1,3,49),(1,4,50),(1,4,51),(1,3,52),(1,4,53),(1,3,54),(1,4,55),(1,4,56),(1,4,57),(1,3,58),(1,4,59),(1,4,60),(1,4,61),(1,2,62),(1,3,63),(1,3,64),(1,3,65),(1,4,66),(1,3,67),(1,3,68),(1,4,69),(1,4,70),(1,2,71),(1,4,72),(1,3,73),(1,4,74),(1,3,75),(1,2,76),(1,4,77),(1,4,78),(1,4,79),(1,4,80),(1,4,81),(1,3,82),(1,4,83),(1,3,84),(1,4,85),(1,4,86),(1,3,87),(1,4,88),(1,4,89),(1,4,90),(1,4,91),(1,4,92),(1,4,93),(1,4,94),(1,4,95),(1,3,96),(1,4,97),(1,3,98),(1,4,99),(1,4,100),(2,3,1),(2,3,2),(2,4,3),(2,3,4),(2,4,5),(2,4,6),(2,4,7),(2,4,8),(2,3,9),(2,4,10),(2,4,11),(2,3,12),(2,4,13),(2,2,14),(2,3,15),(2,4,16),(2,4,17),(2,4,18),(2,4,19),(2,4,20),(2,2,21),(2,3,22),(2,4,23),(2,3,24),(2,4,25),(2,3,26),(2,4,27),(2,4,28),(2,4,29),(2,3,30),(2,4,31),(2,3,32),(2,4,33),(2,4,34),(2,2,35),(2,3,36),(2,4,37),(2,3,38),(2,4,39),(2,4,40),(2,3,41),(2,4,42),(2,4,43),(2,4,44),(2,3,45),(2,4,46),(2,4,47),(2,3,48),(2,4,49),(2,3,50),(2,3,51),(2,4,52),(2,3,53),(2,4,54),(2,4,55),(2,4,56),(2,3,57),(2,3,58),(2,4,59),(2,4,60),(2,4,61),(2,4,62),(2,4,63),(2,4,64),(2,3,65),(2,3,66),(2,3,67),(2,4,68),(2,4,69),(2,4,70),(2,3,71),(2,4,72),(2,4,73),(2,4,74),(2,4,75),(2,3,76),(2,4,77),(2,3,78),(2,4,79),(2,3,80),(2,4,81),(2,4,82),(2,4,83),(2,3,84),(2,3,85),(2,4,86),(2,2,87),(2,4,88),(2,4,89),(2,2,90),(2,4,91),(2,4,92),(2,3,93),(2,4,94),(2,3,95),(2,4,96),(2,2,97),(2,3,98),(2,3,99),(2,3,100),(3,4,1),(3,4,2),(3,3,3),(3,0,4),(3,4,5),(3,4,6),(3,4,7),(3,4,8),(3,4,9),(3,4,10),(3,4,11),(3,4,12),(3,4,13),(3,4,14),(3,3,15),(3,4,16),(3,4,17),(3,4,18),(3,4,19),(3,4,20),(3,4,21),(3,2,22),(3,4,23),(3,4,24),(3,4,25),(3,4,26),(3,4,27),(3,4,28),(3,4,29),(3,4,30),(3,4,31),(3,4,32),(3,3,33),(3,4,34),(3,3,35),(3,4,36),(3,4,37),(3,3,38),(3,4,39),(3,3,40),(3,4,41),(3,2,42),(3,4,43),(3,4,44),(3,3,45),(3,3,46),(3,4,47),(3,3,48),(3,3,49),(3,4,50),(3,3,51),(3,4,52),(3,4,53),(3,4,54),(3,4,55),(3,4,56),(3,4,57),(3,4,58),(3,3,59),(3,4,60),(3,2,61),(3,4,62),(3,3,63),(3,3,64),(3,4,65),(3,4,66),(3,4,67),(3,2,68),(3,4,69),(3,3,70),(3,4,71),(3,4,72),(3,4,73),(3,3,74),(3,3,75),(3,4,76),(3,4,77),(3,4,78),(3,3,79),(3,4,80),(3,3,81),(3,4,82),(3,2,83),(3,4,84),(3,2,85),(3,4,86),(3,4,87),(3,4,88),(3,4,89),(3,3,90),(3,3,91),(3,3,92),(3,4,93),(3,4,94),(3,4,95),(3,4,96),(3,4,97),(3,4,98),(3,4,99),(3,4,100),(4,3,1),(4,4,2),(4,3,3),(4,4,4),(4,4,5),(4,4,6),(4,4,7),(4,3,8),(4,4,9),(4,4,10),(4,4,11),(4,4,12),(4,4,13),(4,3,14),(4,4,15),(4,4,16),(4,4,17),(4,4,18),(4,4,19),(4,4,20),(4,4,21),(4,3,22),(4,4,23),(4,4,24),(4,3,25),(4,4,26),(4,3,27),(4,4,28),(4,2,29),(4,3,30),(4,4,31),(4,4,32),(4,3,33),(4,3,34),(4,4,35),(4,4,36),(4,4,37),(4,3,38),(4,3,39),(4,3,40),(4,4,41),(4,4,42),(4,4,43),(4,3,44),(4,3,45),(4,3,46),(4,4,47),(4,4,48),(4,4,49),(4,3,50),(4,4,51),(4,4,52),(4,4,53),(4,2,54),(4,3,55),(4,3,56),(4,3,57),(4,4,58),(4,2,59),(4,4,60),(4,4,61),(4,4,62),(4,4,63),(4,4,64),(4,3,65),(4,3,66),(4,4,67),(4,4,68),(4,4,69),(4,2,70),(4,4,71),(4,3,72),(4,4,73),(4,3,74),(4,4,75),(4,4,76),(4,4,77),(4,3,78),(4,4,79),(4,3,80),(4,4,81),(4,4,82),(4,3,83),(4,4,84),(4,4,85),(4,4,86),(4,3,87),(4,4,88),(4,4,89),(4,4,90),(4,4,91),(4,4,92),(4,4,93),(4,3,94),(4,3,95),(4,4,96),(4,4,97),(4,3,98),(4,3,99),(4,4,100),(5,3,1),(5,4,2),(5,3,3),(5,4,4),(5,3,5),(5,4,6),(5,3,7),(5,4,8),(5,4,9),(5,4,10),(5,4,11),(5,4,12),(5,3,13),(5,4,14),(5,4,15),(5,4,16),(5,2,17),(5,4,18),(5,3,19),(5,4,20),(5,3,21),(5,4,22),(5,4,23),(5,4,24),(5,4,25),(5,4,26),(5,3,27),(5,3,28),(5,3,29),(5,4,30),(5,4,31),(5,4,32),(5,4,33),(5,4,34),(5,4,35),(5,4,36),(5,4,37),(5,3,38),(5,4,39),(5,3,40),(5,4,41),(5,4,42),(5,4,43),(5,4,44),(5,4,45),(5,4,46),(5,4,47),(5,4,48),(5,4,49),(5,3,50),(5,3,51),(5,4,52),(5,4,53),(5,4,54),(5,1,55),(5,4,56),(5,4,57),(5,3,58),(5,3,59),(5,4,60),(5,4,61),(5,4,62),(5,4,63),(5,4,64),(5,1,65),(5,3,66),(5,4,67),(5,4,68),(5,4,69),(5,3,70),(5,3,71),(5,4,72),(5,4,73),(5,4,74),(5,4,75),(5,4,76),(5,3,77),(5,3,78),(5,3,79),(5,4,80),(5,2,81),(5,4,82),(5,4,83),(5,4,84),(5,3,85),(5,3,86),(5,3,87),(5,4,88),(5,3,89),(5,4,90),(5,3,91),(5,3,92),(5,2,93),(5,4,94),(5,3,95),(5,4,96),(5,4,97),(5,4,98),(5,4,99),(5,4,100);
/*!40000 ALTER TABLE `school_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--

--
-- Final view structure for view `books_written_per_author`
--

/*!50001 DROP VIEW IF EXISTS `books_written_per_author`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `books_written_per_author` AS select `a1`.`author_id` AS `author_id`,`a1`.`author_first_name` AS `author_first_name`,`a1`.`author_last_name` AS `author_last_name`,count(`b`.`book_id`) AS `books_written` from ((`author` `a1` left join `book_author` `ba` on((`ba`.`author_author_id` = `a1`.`author_id`))) left join `book` `b` on((`b`.`book_id` = `ba`.`book_book_id`))) group by `a1`.`author_id` order by `a1`.`author_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `library_user_days_due`
--

/*!50001 DROP VIEW IF EXISTS `library_user_days_due`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `library_user_days_due` AS select `u`.`user_id` AS `user_id`,`u`.`user_first_name` AS `user_first_name`,`u`.`user_last_name` AS `user_last_name`,`u`.`school_id` AS `school_id`,count(`b`.`borrowing_id`) AS `currently_borrowed`,(max((to_days(curdate()) - to_days(`b`.`borrowing_date`))) - 7) AS `days_due` from (`library_user` `u` left join `borrowing` `b` on((`b`.`library_user_user_id` = `u`.`user_id`))) where (`b`.`borrowing_status` = 'active') group by `u`.`user_id` order by `days_due` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `loans_per_school_admin_this_year`
--

/*!50001 DROP VIEW IF EXISTS `loans_per_school_admin_this_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `loans_per_school_admin_this_year` AS select `op`.`user_id` AS `user_id`,`op`.`user_first_name` AS `user_first_name`,`op`.`user_last_name` AS `user_last_name`,count(`b`.`borrowing_id`) AS `borrowings_count` from (((`library_user` `op` left join `school` `s` on((`s`.`school_id` = `op`.`school_id`))) left join `library_user` `u` on((`s`.`school_id` = `u`.`school_id`))) left join `borrowing` `b` on((`u`.`user_id` = `b`.`library_user_user_id`))) where ((`op`.`role_id` = 2) and (year(`b`.`borrowing_date`) = year(now()))) group by `op`.`user_id` */;
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

-- Dump completed on 2023-06-03 17:58:32
