-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab1test_s4682748
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `trades_fact`
--

DROP TABLE IF EXISTS `trades_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trades_fact` (
  `TradeID` int NOT NULL,
  `TradeDate` date NOT NULL,
  `AccountID` int NOT NULL,
  `SecurityID` int NOT NULL,
  `TradeType` char(10) NOT NULL,
  `TradeVolume` int NOT NULL,
  PRIMARY KEY (`TradeID`),
  KEY `AccountID` (`AccountID`),
  KEY `SecurityID` (`SecurityID`),
  CONSTRAINT `trades_fact_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `customer` (`AccountID`),
  CONSTRAINT `trades_fact_ibfk_2` FOREIGN KEY (`SecurityID`) REFERENCES `stock` (`SecurityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trades_fact`
--

LOCK TABLES `trades_fact` WRITE;
/*!40000 ALTER TABLE `trades_fact` DISABLE KEYS */;
INSERT INTO `trades_fact` VALUES (1000,'2023-07-21',1,101,'stock',10),(1001,'2023-07-12',1,103,'crypto',3),(1002,'2023-01-20',1,102,'stock',5),(1004,'2023-07-20',2,101,'stock',12),(1005,'2023-01-20',1,105,'crypto',10);
/*!40000 ALTER TABLE `trades_fact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 15:14:26
