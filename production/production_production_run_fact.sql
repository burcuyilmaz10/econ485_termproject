-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: production
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `production_run_fact`
--

DROP TABLE IF EXISTS `production_run_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_run_fact` (
  `COST` int DEFAULT NULL,
  `COST_VARIANCE_FROM_STANDARD` int DEFAULT NULL,
  `DURATION` time DEFAULT NULL,
  `DURATION_VARIANCE_FROM_STANDARD` time DEFAULT NULL,
  `QUANTITY_PRODUCED` int DEFAULT NULL,
  `QUANTITY_REJECTED` int DEFAULT NULL,
  `time_by_day_DAY_ID` int NOT NULL,
  `manufactured_parts_PART_ID` int NOT NULL,
  `plant_locations_FACILITY_ID` int NOT NULL,
  `production_run_types_WORK_EFFORT_TYPE_ID` int NOT NULL,
  `responsible_partys_RESPONSIBLE_PARTY_ID` int NOT NULL,
  PRIMARY KEY (`time_by_day_DAY_ID`,`manufactured_parts_PART_ID`,`plant_locations_FACILITY_ID`,`production_run_types_WORK_EFFORT_TYPE_ID`,`responsible_partys_RESPONSIBLE_PARTY_ID`),
  KEY `fk_production_run_fact_manufactured_parts1_idx` (`manufactured_parts_PART_ID`),
  KEY `fk_production_run_fact_plant_locations1_idx` (`plant_locations_FACILITY_ID`),
  KEY `fk_production_run_fact_production_run_types1_idx` (`production_run_types_WORK_EFFORT_TYPE_ID`),
  KEY `fk_production_run_fact_responsible_partys1_idx` (`responsible_partys_RESPONSIBLE_PARTY_ID`),
  CONSTRAINT `fk_production_run_fact_manufactured_parts1` FOREIGN KEY (`manufactured_parts_PART_ID`) REFERENCES `manufactured_parts` (`PART_ID`),
  CONSTRAINT `fk_production_run_fact_plant_locations1` FOREIGN KEY (`plant_locations_FACILITY_ID`) REFERENCES `plant_locations` (`FACILITY_ID`),
  CONSTRAINT `fk_production_run_fact_production_run_types1` FOREIGN KEY (`production_run_types_WORK_EFFORT_TYPE_ID`) REFERENCES `production_run_types` (`WORK_EFFORT_TYPE_ID`),
  CONSTRAINT `fk_production_run_fact_responsible_partys1` FOREIGN KEY (`responsible_partys_RESPONSIBLE_PARTY_ID`) REFERENCES `responsible_partys` (`RESPONSIBLE_PARTY_ID`),
  CONSTRAINT `fk_production_run_fact_time_by_day` FOREIGN KEY (`time_by_day_DAY_ID`) REFERENCES `time_by_day` (`DAY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_run_fact`
--

LOCK TABLES `production_run_fact` WRITE;
/*!40000 ALTER TABLE `production_run_fact` DISABLE KEYS */;
INSERT INTO `production_run_fact` VALUES (1,1,'00:00:10','00:00:10',10,10,1,1,1,1,1),(2,2,'00:00:20','00:00:20',20,20,2,2,2,2,2);
/*!40000 ALTER TABLE `production_run_fact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-11 22:03:58
