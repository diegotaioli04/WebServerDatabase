-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: corsirecupero
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `iddocente` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `idateria` int NOT NULL,
  PRIMARY KEY (`iddocente`),
  KEY `idmateria_idx` (`idateria`),
  CONSTRAINT `idateria` FOREIGN KEY (`idateria`) REFERENCES `materia` (`idmateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Fiorella','Mannoia',2),(2,'Franco','Zeffirelli',2),(3,'Giovanni','Verdi',2),(4,'Mario','Viola',1),(5,'Caterina','Rosso',1),(6,'Maurizio','Costanzo',3),(7,'Filippo','Bianchi',4),(8,'Roberto','Baggio',4);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `idmateria` int NOT NULL,
  `nomeMateria` varchar(45) NOT NULL,
  PRIMARY KEY (`idmateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Informatica'),(2,'Matematica'),(3,'Italiano'),(4,'Sistemi');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studente` (
  `idstudente` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `classe` varchar(45) NOT NULL,
  `datadinascita` date NOT NULL,
  PRIMARY KEY (`idstudente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studente`
--

LOCK TABLES `studente` WRITE;
/*!40000 ALTER TABLE `studente` DISABLE KEYS */;
INSERT INTO `studente` VALUES (1,'Mario','Rossi','3A','2003-11-15'),(2,'Franesca','Verdi','3A','2003-07-19'),(3,'Luisa','Blu','4A','2002-09-08'),(4,'Franco','Rossi','4A','2002-02-03'),(5,'Mario','Balotelli','5A','2001-01-09'),(6,'Enrico','Chiesa','5A','2001-12-31');
/*!40000 ALTER TABLE `studente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voti`
--

DROP TABLE IF EXISTS `voti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voti` (
  `idvoti` int NOT NULL,
  `idstudente` int NOT NULL,
  `idmateria` int NOT NULL,
  `voto` int NOT NULL,
  `data` date NOT NULL,
  `iddocente` int NOT NULL,
  PRIMARY KEY (`idvoti`),
  KEY `idstudente_idx` (`idstudente`),
  KEY `idmateria_idx` (`idmateria`),
  KEY `iddocente_idx` (`iddocente`),
  CONSTRAINT `iddocente` FOREIGN KEY (`iddocente`) REFERENCES `docente` (`iddocente`),
  CONSTRAINT `idmateria` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`),
  CONSTRAINT `idstudente` FOREIGN KEY (`idstudente`) REFERENCES `studente` (`idstudente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voti`
--

LOCK TABLES `voti` WRITE;
/*!40000 ALTER TABLE `voti` DISABLE KEYS */;
INSERT INTO `voti` VALUES (1,1,2,5,'2018-04-23',1),(2,2,2,7,'2018-02-21',1),(3,2,2,4,'2018-04-23',2),(4,3,2,4,'2018-02-21',2),(5,4,2,4,'2018-04-23',3),(6,4,2,5,'2018-02-21',3),(7,5,1,4,'2018-04-23',4),(8,6,1,4,'2018-01-21',4),(9,1,1,4,'2018-05-24',4),(10,2,1,5,'2018-03-11',5),(11,2,3,4,'2018-03-11',6),(12,3,3,5,'2018-03-22',6),(13,4,3,5,'2018-02-23',6),(14,5,3,6,'2018-02-21',6),(15,6,3,5,'2018-04-23',6),(16,1,4,7,'2018-03-21',7),(17,2,4,4,'2018-04-23',7),(18,3,4,5,'2018-04-21',8),(19,4,1,4,'2018-02-23',5),(20,5,1,4,'2018-01-21',5),(21,6,2,4,'2018-02-01',3);
/*!40000 ALTER TABLE `voti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-24 13:09:35
