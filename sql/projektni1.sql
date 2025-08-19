CREATE DATABASE  IF NOT EXISTS `projektni1` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projektni1`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: projektni1
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `aktivni_proizvodi_od_drveta`
--

DROP TABLE IF EXISTS `aktivni_proizvodi_od_drveta`;
/*!50001 DROP VIEW IF EXISTS `aktivni_proizvodi_od_drveta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `aktivni_proizvodi_od_drveta` AS SELECT 
 1 AS `SifraProizvoda`,
 1 AS `NazivProizvoda`,
 1 AS `VrstaDrveta`,
 1 AS `CijenaProizvoda`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `brentista`
--

DROP TABLE IF EXISTS `brentista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brentista` (
  `RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`RADNIK_jmb`),
  CONSTRAINT `fk_BRENTISTA_RADNIK1` FOREIGN KEY (`RADNIK_jmb`) REFERENCES `radnik` (`jmb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brentista`
--

LOCK TABLES `brentista` WRITE;
/*!40000 ALTER TABLE `brentista` DISABLE KEYS */;
INSERT INTO `brentista` VALUES (123456774);
/*!40000 ALTER TABLE `brentista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cjenovnik`
--

DROP TABLE IF EXISTS `cjenovnik`;
/*!50001 DROP VIEW IF EXISTS `cjenovnik`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cjenovnik` AS SELECT 
 1 AS `naziv`,
 1 AS `Drvo_Vrsta`,
 1 AS `cijena`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dnevni_radni_nalog`
--

DROP TABLE IF EXISTS `dnevni_radni_nalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dnevni_radni_nalog` (
  `idRADNI_NALOG` int NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `MENADZER_RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`idRADNI_NALOG`),
  KEY `fk_RADNI_NALOG_MENADZER1_idx` (`MENADZER_RADNIK_jmb`),
  CONSTRAINT `fk_RADNI_NALOG_MENADZER1` FOREIGN KEY (`MENADZER_RADNIK_jmb`) REFERENCES `menadzer` (`jmb`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dnevni_radni_nalog`
--

LOCK TABLES `dnevni_radni_nalog` WRITE;
/*!40000 ALTER TABLE `dnevni_radni_nalog` DISABLE KEYS */;
INSERT INTO `dnevni_radni_nalog` VALUES (1,'2023-08-07',123456800),(2,'2023-08-08',123456800);
/*!40000 ALTER TABLE `dnevni_radni_nalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dobavljac`
--

DROP TABLE IF EXISTS `dobavljac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dobavljac` (
  `nazivFirme` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mjesto` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Telefon` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`nazivFirme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dobavljac`
--

LOCK TABLES `dobavljac` WRITE;
/*!40000 ALTER TABLE `dobavljac` DISABLE KEYS */;
INSERT INTO `dobavljac` VALUES ('Drvo Promet','Banjaluka','065 200 200'),('Hrast Promet','Knezevo','065 300 300');
/*!40000 ALTER TABLE `dobavljac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drvo`
--

DROP TABLE IF EXISTS `drvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drvo` (
  `Vrsta` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`Vrsta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drvo`
--

LOCK TABLES `drvo` WRITE;
/*!40000 ALTER TABLE `drvo` DISABLE KEYS */;
INSERT INTO `drvo` VALUES ('Bor'),('Bukva'),('Grab'),('Hrast'),('Lipa');
/*!40000 ALTER TABLE `drvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menadzer`
--

DROP TABLE IF EXISTS `menadzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menadzer` (
  `jmb` int NOT NULL,
  `ime` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prezime` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`jmb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menadzer`
--

LOCK TABLES `menadzer` WRITE;
/*!40000 ALTER TABLE `menadzer` DISABLE KEYS */;
INSERT INTO `menadzer` VALUES (123456800,'Bojan','Bojanic'),(123456801,'Pero','Kecman');
/*!40000 ALTER TABLE `menadzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narudzba`
--

DROP TABLE IF EXISTS `narudzba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `narudzba` (
  `idNARUDZBA` int NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `DOBAVLJAC_nazivFirme` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `MENADZER_RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`idNARUDZBA`),
  KEY `fk_NARUDZBA_DOBAVLJAC_idx` (`DOBAVLJAC_nazivFirme`),
  KEY `fk_NARUDZBA_MENADZER1_idx` (`MENADZER_RADNIK_jmb`),
  CONSTRAINT `fk_NARUDZBA_DOBAVLJAC` FOREIGN KEY (`DOBAVLJAC_nazivFirme`) REFERENCES `dobavljac` (`nazivFirme`),
  CONSTRAINT `fk_NARUDZBA_MENADZER1` FOREIGN KEY (`MENADZER_RADNIK_jmb`) REFERENCES `menadzer` (`jmb`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narudzba`
--

LOCK TABLES `narudzba` WRITE;
/*!40000 ALTER TABLE `narudzba` DISABLE KEYS */;
INSERT INTO `narudzba` VALUES (1,'2023-08-04','Drvo Promet',123456800),(2,'2023-08-05','Drvo Promet',123456800),(3,'2023-08-06','Hrast Promet',123456801),(4,'2023-08-11','Hrast Promet',123456801),(5,'2025-08-11','Hrast Promet',123456800),(6,'2025-08-08','Hrast Promet',123456801),(7,'2025-08-09','Drvo Promet',123456800),(8,'2025-08-09','Drvo Promet',123456801);
/*!40000 ALTER TABLE `narudzba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narudzba_has_drvo`
--

DROP TABLE IF EXISTS `narudzba_has_drvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `narudzba_has_drvo` (
  `NARUDZBA_idNARUDZBA` int NOT NULL,
  `DRVO_Vrsta` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kolicina (m3)` decimal(6,2) NOT NULL,
  `cijena (po m3)` decimal(6,2) NOT NULL,
  PRIMARY KEY (`NARUDZBA_idNARUDZBA`,`DRVO_Vrsta`),
  KEY `fk_NARUDZBA_has_DRVO_DRVO1_idx` (`DRVO_Vrsta`),
  KEY `fk_NARUDZBA_has_DRVO_NARUDZBA1_idx` (`NARUDZBA_idNARUDZBA`),
  CONSTRAINT `fk_NARUDZBA_has_DRVO_DRVO1` FOREIGN KEY (`DRVO_Vrsta`) REFERENCES `drvo` (`Vrsta`),
  CONSTRAINT `fk_NARUDZBA_has_DRVO_NARUDZBA1` FOREIGN KEY (`NARUDZBA_idNARUDZBA`) REFERENCES `narudzba` (`idNARUDZBA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narudzba_has_drvo`
--

LOCK TABLES `narudzba_has_drvo` WRITE;
/*!40000 ALTER TABLE `narudzba_has_drvo` DISABLE KEYS */;
INSERT INTO `narudzba_has_drvo` VALUES (1,'bukva',50.00,90.00),(1,'hrast',100.00,150.00),(2,'bor',120.00,80.00),(2,'grab',150.00,110.00),(3,'bukva',98.00,92.00),(4,'hrast',80.00,150.00);
/*!40000 ALTER TABLE `narudzba_has_drvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `neaktivni_proizvodi_od_drveta`
--

DROP TABLE IF EXISTS `neaktivni_proizvodi_od_drveta`;
/*!50001 DROP VIEW IF EXISTS `neaktivni_proizvodi_od_drveta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `neaktivni_proizvodi_od_drveta` AS SELECT 
 1 AS `SifraProizvoda`,
 1 AS `NazivProizvoda`,
 1 AS `VrstaDrveta`,
 1 AS `CijenaProizvoda`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prodavac`
--

DROP TABLE IF EXISTS `prodavac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodavac` (
  `RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`RADNIK_jmb`),
  CONSTRAINT `fk_PRODAVAC_RADNIK1` FOREIGN KEY (`RADNIK_jmb`) REFERENCES `radnik` (`jmb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodavac`
--

LOCK TABLES `prodavac` WRITE;
/*!40000 ALTER TABLE `prodavac` DISABLE KEYS */;
INSERT INTO `prodavac` VALUES (123456773),(123456774);
/*!40000 ALTER TABLE `prodavac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proizvedeni_artikli`
--

DROP TABLE IF EXISTS `proizvedeni_artikli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proizvedeni_artikli` (
  `PROIZVOD_od_DRVETA_PROIZVOD_sifra` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROIZVOD_od_DRVETA_DRVO_Vrsta` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kolicina` decimal(8,2) NOT NULL,
  `ZADATAK_idZadatak` int NOT NULL,
  `BRENTISTA_RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`PROIZVOD_od_DRVETA_PROIZVOD_sifra`,`PROIZVOD_od_DRVETA_DRVO_Vrsta`,`BRENTISTA_RADNIK_jmb`),
  KEY `fk_BRENTISTA_has_PROIZVOD_od_DRVETA_PROIZVOD_od_DRVETA1_idx` (`PROIZVOD_od_DRVETA_PROIZVOD_sifra`,`PROIZVOD_od_DRVETA_DRVO_Vrsta`),
  KEY `fk_PROIZVEDENI_ARTIKLI_ZADATAK1_idx` (`ZADATAK_idZadatak`),
  KEY `fk_PROIZVEDENI_ARTIKLI_BRENTISTA1_idx` (`BRENTISTA_RADNIK_jmb`),
  CONSTRAINT `fk_BRENTISTA_has_PROIZVOD_od_DRVETA_PROIZVOD_od_DRVETA1` FOREIGN KEY (`PROIZVOD_od_DRVETA_PROIZVOD_sifra`, `PROIZVOD_od_DRVETA_DRVO_Vrsta`) REFERENCES `proizvod_od_drveta` (`PROIZVOD_sifra`, `DRVO_Vrsta`),
  CONSTRAINT `fk_PROIZVEDENI_ARTIKLI_BRENTISTA1` FOREIGN KEY (`BRENTISTA_RADNIK_jmb`) REFERENCES `brentista` (`RADNIK_jmb`),
  CONSTRAINT `fk_PROIZVEDENI_ARTIKLI_ZADATAK1` FOREIGN KEY (`ZADATAK_idZadatak`) REFERENCES `zadatak` (`idZadatak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proizvedeni_artikli`
--

LOCK TABLES `proizvedeni_artikli` WRITE;
/*!40000 ALTER TABLE `proizvedeni_artikli` DISABLE KEYS */;
INSERT INTO `proizvedeni_artikli` VALUES ('#104','hrast',10.00,1,123456774);
/*!40000 ALTER TABLE `proizvedeni_artikli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proizvod`
--

DROP TABLE IF EXISTS `proizvod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proizvod` (
  `naziv` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sifra` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proizvod`
--

LOCK TABLES `proizvod` WRITE;
/*!40000 ALTER TABLE `proizvod` DISABLE KEYS */;
INSERT INTO `proizvod` VALUES ('Parket','#100'),('Fosna','#101'),('Greda','#102'),('Daska','#103'),('Letva','#104'),('Krovna greda','#105'),('Drvena ploca','#106');
/*!40000 ALTER TABLE `proizvod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proizvod_od_drveta`
--

DROP TABLE IF EXISTS `proizvod_od_drveta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proizvod_od_drveta` (
  `PROIZVOD_sifra` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `DRVO_Vrsta` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Cijena` decimal(7,2) DEFAULT NULL,
  `aktivan` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`PROIZVOD_sifra`,`DRVO_Vrsta`),
  KEY `fk_PROIZVOD_has_DRVO_DRVO1_idx` (`DRVO_Vrsta`),
  KEY `fk_PROIZVOD_has_DRVO_PROIZVOD1_idx` (`PROIZVOD_sifra`),
  CONSTRAINT `fk_PROIZVOD_has_DRVO_DRVO1` FOREIGN KEY (`DRVO_Vrsta`) REFERENCES `drvo` (`Vrsta`),
  CONSTRAINT `fk_PROIZVOD_has_DRVO_PROIZVOD1` FOREIGN KEY (`PROIZVOD_sifra`) REFERENCES `proizvod` (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proizvod_od_drveta`
--

LOCK TABLES `proizvod_od_drveta` WRITE;
/*!40000 ALTER TABLE `proizvod_od_drveta` DISABLE KEYS */;
INSERT INTO `proizvod_od_drveta` VALUES ('#100','bor',63.00,1),('#100','bukva',70.00,1),('#100','grab',103.00,1),('#100','hrast',81.50,1),('#101','bor',10.00,1),('#101','hrast',50.00,1),('#102','Bor',1.00,1),('#102','Bukva',2.00,1),('#102','Grab',3.00,1),('#102','Hrast',2.00,1),('#103','bor',400.00,1),('#103','bukva',500.00,1),('#104','Bor',23.00,1),('#104','hrast',11.00,1),('#106','Bor',4.00,1),('#106','Bukva',1.00,1),('#106','Grab',1.00,1),('#106','Hrast',1.00,1);
/*!40000 ALTER TABLE `proizvod_od_drveta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racun`
--

DROP TABLE IF EXISTS `racun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racun` (
  `idRacun` int NOT NULL AUTO_INCREMENT,
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRODAVAC_RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`idRacun`),
  KEY `fk_RACUN_PRODAVAC1_idx` (`PRODAVAC_RADNIK_jmb`),
  CONSTRAINT `fk_RACUN_PRODAVAC1` FOREIGN KEY (`PRODAVAC_RADNIK_jmb`) REFERENCES `prodavac` (`RADNIK_jmb`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racun`
--

LOCK TABLES `racun` WRITE;
/*!40000 ALTER TABLE `racun` DISABLE KEYS */;
INSERT INTO `racun` VALUES (1,'2023-08-07 12:41:19',123456773),(2,'2023-08-07 12:42:29',123456773),(3,'2023-08-07 12:43:16',123456773),(10,'2023-08-16 10:39:49',123456773),(27,'2023-08-17 11:34:49',123456773),(28,'2023-08-17 11:36:02',123456773),(29,'2023-08-18 10:26:23',123456773),(30,'2023-08-18 10:47:52',123456773),(31,'2023-08-18 19:49:19',123456773),(32,'2023-08-22 15:12:57',123456773),(33,'2023-08-23 12:15:55',123456773),(34,'2023-08-24 10:30:10',123456773),(36,'2025-08-07 14:02:29',123456774),(38,'2025-08-07 14:02:56',123456774),(39,'2025-08-08 11:06:09',123456774),(41,'2025-08-08 11:06:27',123456774),(42,'2025-08-08 11:07:49',123456774),(43,'2025-08-08 11:07:49',123456774),(44,'2025-08-08 11:07:49',123456774);
/*!40000 ALTER TABLE `racun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radnik`
--

DROP TABLE IF EXISTS `radnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radnik` (
  `jmb` int NOT NULL,
  `ime` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prezime` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`jmb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radnik`
--

LOCK TABLES `radnik` WRITE;
/*!40000 ALTER TABLE `radnik` DISABLE KEYS */;
INSERT INTO `radnik` VALUES (123456771,'Momcilo','Djuric'),(123456772,'Mitar','Miric'),(123456773,'Milomir','Kerezovic'),(123456774,'Vlado','Stankovic'),(123456775,'Igor','Vuleta'),(123456776,'Stefan','Bijak'),(123456777,'Boro','Stankovic'),(123456778,'Novica','Tepic'),(123456779,'Darko','Kovacevic'),(123456780,'Marko','Markovic');
/*!40000 ALTER TABLE `radnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skladistar`
--

DROP TABLE IF EXISTS `skladistar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skladistar` (
  `RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`RADNIK_jmb`),
  CONSTRAINT `fk_SKLADISTAR_RADNIK1` FOREIGN KEY (`RADNIK_jmb`) REFERENCES `radnik` (`jmb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skladistar`
--

LOCK TABLES `skladistar` WRITE;
/*!40000 ALTER TABLE `skladistar` DISABLE KEYS */;
INSERT INTO `skladistar` VALUES (123456771),(123456772),(123456776),(123456778),(123456779),(123456780);
/*!40000 ALTER TABLE `skladistar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `skladistar_detalji`
--

DROP TABLE IF EXISTS `skladistar_detalji`;
/*!50001 DROP VIEW IF EXISTS `skladistar_detalji`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `skladistar_detalji` AS SELECT 
 1 AS `RADNIK_jmb`,
 1 AS `ime`,
 1 AS `prezime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `skladistari_u_svim_skladistima`
--

DROP TABLE IF EXISTS `skladistari_u_svim_skladistima`;
/*!50001 DROP VIEW IF EXISTS `skladistari_u_svim_skladistima`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `skladistari_u_svim_skladistima` AS SELECT 
 1 AS `SKLADISTE_redniBroj`,
 1 AS `SKLADISTAR_RADNIK_jmb`,
 1 AS `ime`,
 1 AS `prezime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `skladiste`
--

DROP TABLE IF EXISTS `skladiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skladiste` (
  `redniBroj` int NOT NULL,
  `kapacitet` decimal(8,2) NOT NULL,
  PRIMARY KEY (`redniBroj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skladiste`
--

LOCK TABLES `skladiste` WRITE;
/*!40000 ALTER TABLE `skladiste` DISABLE KEYS */;
INSERT INTO `skladiste` VALUES (1,200.00),(2,300.00),(3,350.00),(4,420.00);
/*!40000 ALTER TABLE `skladiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skladiste_has_proizvod_od_drveta`
--

DROP TABLE IF EXISTS `skladiste_has_proizvod_od_drveta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skladiste_has_proizvod_od_drveta` (
  `SKLADISTE_redniBroj` int NOT NULL,
  `PROIZVOD_od_DRVETA_PROIZVOD_sifra` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROIZVOD_od_DRVETA_DRVO_Vrsta` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `kolicina` decimal(6,2) NOT NULL,
  PRIMARY KEY (`SKLADISTE_redniBroj`,`PROIZVOD_od_DRVETA_PROIZVOD_sifra`,`PROIZVOD_od_DRVETA_DRVO_Vrsta`),
  KEY `fk_SKLADISTE_has_PROIZVOD_od_DRVETA_PROIZVOD_od_DRVETA1_idx` (`PROIZVOD_od_DRVETA_PROIZVOD_sifra`,`PROIZVOD_od_DRVETA_DRVO_Vrsta`),
  KEY `fk_SKLADISTE_has_PROIZVOD_od_DRVETA_SKLADISTE1_idx` (`SKLADISTE_redniBroj`),
  CONSTRAINT `fk_SKLADISTE_has_PROIZVOD_od_DRVETA_PROIZVOD_od_DRVETA1` FOREIGN KEY (`PROIZVOD_od_DRVETA_PROIZVOD_sifra`, `PROIZVOD_od_DRVETA_DRVO_Vrsta`) REFERENCES `proizvod_od_drveta` (`PROIZVOD_sifra`, `DRVO_Vrsta`),
  CONSTRAINT `fk_SKLADISTE_has_PROIZVOD_od_DRVETA_SKLADISTE1` FOREIGN KEY (`SKLADISTE_redniBroj`) REFERENCES `skladiste` (`redniBroj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skladiste_has_proizvod_od_drveta`
--

LOCK TABLES `skladiste_has_proizvod_od_drveta` WRITE;
/*!40000 ALTER TABLE `skladiste_has_proizvod_od_drveta` DISABLE KEYS */;
INSERT INTO `skladiste_has_proizvod_od_drveta` VALUES (1,'#100','bor',16.00),(1,'#100','bukva',170.00),(1,'#101','bor',3.00),(1,'#101','hrast',2.00),(1,'#103','bukva',2.00),(2,'#101','bor',2.00);
/*!40000 ALTER TABLE `skladiste_has_proizvod_od_drveta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skladiste_has_skladistar`
--

DROP TABLE IF EXISTS `skladiste_has_skladistar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skladiste_has_skladistar` (
  `SKLADISTE_redniBroj` int NOT NULL,
  `SKLADISTAR_RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`SKLADISTE_redniBroj`,`SKLADISTAR_RADNIK_jmb`),
  KEY `fk_SKLADISTE_has_SKLADISTAR_SKLADISTAR1_idx` (`SKLADISTAR_RADNIK_jmb`),
  KEY `fk_SKLADISTE_has_SKLADISTAR_SKLADISTE1_idx` (`SKLADISTE_redniBroj`),
  CONSTRAINT `fk_SKLADISTE_has_SKLADISTAR_SKLADISTAR1` FOREIGN KEY (`SKLADISTAR_RADNIK_jmb`) REFERENCES `skladistar` (`RADNIK_jmb`),
  CONSTRAINT `fk_SKLADISTE_has_SKLADISTAR_SKLADISTE1` FOREIGN KEY (`SKLADISTE_redniBroj`) REFERENCES `skladiste` (`redniBroj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skladiste_has_skladistar`
--

LOCK TABLES `skladiste_has_skladistar` WRITE;
/*!40000 ALTER TABLE `skladiste_has_skladistar` DISABLE KEYS */;
INSERT INTO `skladiste_has_skladistar` VALUES (2,123456771),(1,123456778),(1,123456779);
/*!40000 ALTER TABLE `skladiste_has_skladistar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stavka_u_racunu`
--

DROP TABLE IF EXISTS `stavka_u_racunu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stavka_u_racunu` (
  `RACUN_idRacun` int NOT NULL,
  `PROIZVOD_od_DRVETA_PROIZVOD_sifra` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROIZVOD_od_DRVETA_DRVO_Vrsta` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Cijena` decimal(8,2) DEFAULT NULL,
  `Kolicina` decimal(8,2) NOT NULL,
  `NazivProizvoda` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RACUN_idRacun`,`PROIZVOD_od_DRVETA_PROIZVOD_sifra`,`PROIZVOD_od_DRVETA_DRVO_Vrsta`),
  KEY `fk_RACUN_has_PROIZVOD_od_DRVETA_PROIZVOD_od_DRVETA1_idx` (`PROIZVOD_od_DRVETA_PROIZVOD_sifra`,`PROIZVOD_od_DRVETA_DRVO_Vrsta`),
  KEY `fk_RACUN_has_PROIZVOD_od_DRVETA_RACUN1_idx` (`RACUN_idRacun`),
  CONSTRAINT `fk_RACUN_has_PROIZVOD_od_DRVETA_PROIZVOD_od_DRVETA1` FOREIGN KEY (`PROIZVOD_od_DRVETA_PROIZVOD_sifra`, `PROIZVOD_od_DRVETA_DRVO_Vrsta`) REFERENCES `proizvod_od_drveta` (`PROIZVOD_sifra`, `DRVO_Vrsta`),
  CONSTRAINT `fk_RACUN_has_PROIZVOD_od_DRVETA_RACUN1` FOREIGN KEY (`RACUN_idRacun`) REFERENCES `racun` (`idRacun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stavka_u_racunu`
--

LOCK TABLES `stavka_u_racunu` WRITE;
/*!40000 ALTER TABLE `stavka_u_racunu` DISABLE KEYS */;
INSERT INTO `stavka_u_racunu` VALUES (1,'#100','bukva',6.50,0.10,'Parket'),(1,'#100','hrast',8.00,0.10,'Parket'),(2,'#100','hrast',8.00,0.10,'Parket');
/*!40000 ALTER TABLE `stavka_u_racunu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadatak`
--

DROP TABLE IF EXISTS `zadatak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zadatak` (
  `zadatakObavljen` tinyint NOT NULL,
  `opisZadatka` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `DNEVNI_RADNI_NALOG_idRADNI_NALOG` int NOT NULL,
  `idZadatak` int NOT NULL AUTO_INCREMENT,
  `BRENTISTA_RADNIK_jmb` int NOT NULL,
  PRIMARY KEY (`idZadatak`),
  KEY `fk_ZADATAK_DNEVNI_RADNI_NALOG1_idx` (`DNEVNI_RADNI_NALOG_idRADNI_NALOG`),
  KEY `fk_ZADATAK_BRENTISTA1_idx` (`BRENTISTA_RADNIK_jmb`),
  CONSTRAINT `fk_ZADATAK_BRENTISTA1` FOREIGN KEY (`BRENTISTA_RADNIK_jmb`) REFERENCES `brentista` (`RADNIK_jmb`),
  CONSTRAINT `fk_ZADATAK_DNEVNI_RADNI_NALOG1` FOREIGN KEY (`DNEVNI_RADNI_NALOG_idRADNI_NALOG`) REFERENCES `dnevni_radni_nalog` (`idRADNI_NALOG`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadatak`
--

LOCK TABLES `zadatak` WRITE;
/*!40000 ALTER TABLE `zadatak` DISABLE KEYS */;
INSERT INTO `zadatak` VALUES (1,'Izrezati 10 m3  -  letva  -  hrast',1,1,123456774),(0,'Izrezati 22 m3  -  fosna  - bor',1,2,123456774);
/*!40000 ALTER TABLE `zadatak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `aktivni_proizvodi_od_drveta`
--

/*!50001 DROP VIEW IF EXISTS `aktivni_proizvodi_od_drveta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aktivni_proizvodi_od_drveta` AS select `pod`.`PROIZVOD_sifra` AS `SifraProizvoda`,`p`.`naziv` AS `NazivProizvoda`,`pod`.`DRVO_Vrsta` AS `VrstaDrveta`,`pod`.`Cijena` AS `CijenaProizvoda` from (`proizvod_od_drveta` `pod` join `proizvod` `p` on((`pod`.`PROIZVOD_sifra` = `p`.`sifra`))) where (`pod`.`aktivan` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cjenovnik`
--

/*!50001 DROP VIEW IF EXISTS `cjenovnik`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cjenovnik` AS select `p`.`naziv` AS `naziv`,`pd`.`DRVO_Vrsta` AS `Drvo_Vrsta`,`pd`.`Cijena` AS `cijena` from (`proizvod_od_drveta` `pd` join `proizvod` `p` on((`pd`.`PROIZVOD_sifra` = `p`.`sifra`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `neaktivni_proizvodi_od_drveta`
--

/*!50001 DROP VIEW IF EXISTS `neaktivni_proizvodi_od_drveta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `neaktivni_proizvodi_od_drveta` AS select `pod`.`PROIZVOD_sifra` AS `SifraProizvoda`,`p`.`naziv` AS `NazivProizvoda`,`pod`.`DRVO_Vrsta` AS `VrstaDrveta`,`pod`.`Cijena` AS `CijenaProizvoda` from (`proizvod_od_drveta` `pod` join `proizvod` `p` on((`pod`.`PROIZVOD_sifra` = `p`.`sifra`))) where (`pod`.`aktivan` = false) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `skladistar_detalji`
--

/*!50001 DROP VIEW IF EXISTS `skladistar_detalji`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `skladistar_detalji` AS select `sk`.`RADNIK_jmb` AS `RADNIK_jmb`,`r`.`ime` AS `ime`,`r`.`prezime` AS `prezime` from (`skladistar` `sk` join `radnik` `r`) where (`sk`.`RADNIK_jmb` = `r`.`jmb`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `skladistari_u_svim_skladistima`
--

/*!50001 DROP VIEW IF EXISTS `skladistari_u_svim_skladistima`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `skladistari_u_svim_skladistima` AS select `shs`.`SKLADISTE_redniBroj` AS `SKLADISTE_redniBroj`,`shs`.`SKLADISTAR_RADNIK_jmb` AS `SKLADISTAR_RADNIK_jmb`,`r`.`ime` AS `ime`,`r`.`prezime` AS `prezime` from (`skladiste_has_skladistar` `shs` join `radnik` `r` on((`shs`.`SKLADISTAR_RADNIK_jmb` = `r`.`jmb`))) */;
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

-- Dump completed on 2025-08-19 12:52:53
