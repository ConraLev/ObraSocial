CREATE DATABASE  IF NOT EXISTS `obra_social` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `obra_social`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: obra_social
-- ------------------------------------------------------
-- Server version	8.0.34

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


/* TABLAS:
afiliados
afiliados_baja
auditoria_af
auditoria_aut
autorizaciones
factura_af
factura_prest
historial_consumo
pagos
planes
prestaciones
prestadores
usuarios
*/

-- Creacion de la tabla afiliados --

DROP TABLE IF EXISTS `afiliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afiliados` (
  `id_afiliado` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `id_plan` int NOT NULL,
  `nacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_afiliado`),
  KEY `id_plan` (`id_plan`),
  CONSTRAINT `afiliados_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Carga de datos en la tabla afiliados


LOCK TABLES `afiliados` WRITE;
/*!40000 ALTER TABLE `afiliados` DISABLE KEYS */;
INSERT INTO `afiliados` VALUES (1,35123321,'Santiago','Gonzalez',1,'1990-10-02','1122435201','santiGonzalez@yahoo.com'),(2,24123445,'Morena','Paz',3,'1981-01-10','1143512014','PazMore@gmail.com'),(3,22549875,'Jaime','Rodriguez',3,'1981-12-01','1143579875','JRodriguez@hotmail.com'),(4,42002452,'Augusto','Gimenez',1,'2011-02-06','1145624625','GimenezAgus@live.com'),(5,18004562,'Federico','Fernandez',4,'1985-07-16','1135734655','Fedefer@gmail.com'),(6,4245624,'Graciela','Gaitan',5,'1970-02-06','114564512','GlaGaitan@yahoo.com'),(7,42125456,'Cristian','Gonzalez',1,'2000-01-20','1157624625','Cris2000@hotmail.com'),(8,34999945,'Carla','Higgins',2,'1990-04-27','1145624625','Higca@live.com.ar'),(9,12564235,'Agustina','Alvarez',3,'1980-08-18','114561535','AAlvarez@gov.com'),(10,50045152,'Enzo','Perez',4,'2018-12-09','1202301503','EnzoCamp@gmail.com'),(11,45615852,'Rodrigo','Fernandez',2,'2010-07-02','1112524154','RodriF@gmail.com');
/*!40000 ALTER TABLE `afiliados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

/*  Creacion de TRIGGERS en tabla afiliados: 
		incorporar_afiliado 
        modificacion_afiliado
        eliminacion_afiliado
*/

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `incorporar_afiliado` AFTER INSERT ON `afiliados` FOR EACH ROW INSERT INTO auditoria_af VALUES
	(DEFAULT, USER(), 'Incorporacion de afiliado', CURRENT_DATE(), CURRENT_TIME) */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modificacion_afiliado` AFTER UPDATE ON `afiliados` FOR EACH ROW INSERT INTO auditoria_af VALUES
    (DEFAULT, USER(), 'Modificacion de afiliacion', CURRENT_DATE(), CURRENT_TIME) */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminacion_afiliado` BEFORE DELETE ON `afiliados` FOR EACH ROW BEGIN

	INSERT INTO afiliados_baja VALUES
	(DEFAULT, old.id_afiliado, old.dni, old.nombre, old.apellido, old.id_plan, old.nacimiento, old.telefono, old.correo);
    
	INSERT INTO auditoria_af VALUES
	(DEFAULT, USER(), 'Eliminacion de afiliado', CURRENT_DATE(), CURRENT_TIME);
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

-- Creacion de la tabla afiliados_baja

DROP TABLE IF EXISTS `afiliados_baja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afiliados_baja` (
  `id_baja_af` int NOT NULL AUTO_INCREMENT,
  `id_afiliado` int NOT NULL,
  `dni` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `id_plan` int NOT NULL,
  `nacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_baja_af`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `afiliados_baja` WRITE;
/*!40000 ALTER TABLE `afiliados_baja` DISABLE KEYS */;
/*!40000 ALTER TABLE `afiliados_baja` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla auditoria_af

DROP TABLE IF EXISTS `auditoria_af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_af` (
  `id_mov_af` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id_mov_af`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `auditoria_af` WRITE;
/*!40000 ALTER TABLE `auditoria_af` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_af` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla auditoria_aut

DROP TABLE IF EXISTS `auditoria_aut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_aut` (
  `id_mov_aut` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `id_aut` int NOT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id_mov_aut`),
  KEY `id_aut` (`id_aut`),
  CONSTRAINT `auditoria_aut_ibfk_1` FOREIGN KEY (`id_aut`) REFERENCES `autorizaciones` (`id_aut`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `auditoria_aut` WRITE;
/*!40000 ALTER TABLE `auditoria_aut` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_aut` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla aut_eliminadas

DROP TABLE IF EXISTS `aut_eliminadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aut_eliminadas` (
  `id_aut` int NOT NULL,
  `id_afiliado` int NOT NULL,
  `id_prestacion` int NOT NULL,
  `cantidad` int NOT NULL,
  `id_prestador` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` date NOT NULL,
  `vigencia` date NOT NULL,
  `copago` int NOT NULL,
  PRIMARY KEY (`id_aut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `aut_eliminadas` WRITE;
/*!40000 ALTER TABLE `aut_eliminadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aut_eliminadas` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla autorizaciones

DROP TABLE IF EXISTS `autorizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorizaciones` (
  `id_aut` int NOT NULL AUTO_INCREMENT,
  `id_afiliado` int NOT NULL,
  `id_prestacion` int NOT NULL,
  `cantidad` int NOT NULL,
  `id_prestador` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` date NOT NULL,
  `vigencia` date NOT NULL,
  `copago` int NOT NULL,
  PRIMARY KEY (`id_aut`),
  KEY `id_afiliado` (`id_afiliado`),
  KEY `id_prestacion` (`id_prestacion`),
  KEY `id_prestador` (`id_prestador`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `autorizaciones_ibfk_1` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliados` (`id_afiliado`),
  CONSTRAINT `autorizaciones_ibfk_2` FOREIGN KEY (`id_prestacion`) REFERENCES `prestaciones` (`id_prestacion`),
  CONSTRAINT `autorizaciones_ibfk_3` FOREIGN KEY (`id_prestador`) REFERENCES `prestadores` (`id_prestador`),
  CONSTRAINT `autorizaciones_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Carga de datos en la tabla autorizaciones --

LOCK TABLES `autorizaciones` WRITE;
/*!40000 ALTER TABLE `autorizaciones` DISABLE KEYS */;
INSERT INTO `autorizaciones` VALUES (1,3,2,1,5,7,'2023-12-02','2024-01-31',320),(2,3,2,1,5,8,'2023-11-22','2024-01-21',320),(3,2,4,2,1,2,'2023-10-30','2023-12-14',140),(4,5,3,1,2,3,'2023-10-04','2023-11-18',50),(5,11,3,2,2,4,'2023-12-27','2024-02-10',100),(6,9,8,1,2,2,'2023-11-06','2023-12-21',220),(7,1,5,1,10,2,'2023-12-07','2024-01-21',120),(8,8,2,2,8,10,'2023-10-08','2023-11-22',640),(9,6,10,1,7,5,'2023-11-09','2023-12-24',600),(10,6,9,1,2,9,'2023-10-10','2023-11-24',450),(11,1,2,1,11,7,'2023-09-18','2023-11-02',320);
/*!40000 ALTER TABLE `autorizaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

/*  Creacion de TRIGGERS en tabla afiliados: 
		auditoria_aut_insert 
        auditoria_aut_update
        eliminacion_aut
*/

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auditoria_aut_insert` AFTER INSERT ON `autorizaciones` FOR EACH ROW INSERT INTO auditoria_aut VALUES
    (DEFAULT, USER(), 'Generacion de autorizacion', new.id_aut, CURRENT_DATE(), CURRENT_TIME) */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auditoria_aut_update` AFTER UPDATE ON `autorizaciones` FOR EACH ROW INSERT INTO auditoria_aut VALUES
    (DEFAULT, USER(), 'Modificacion de autorizacion', id_aut, CURRENT_DATE(), CURRENT_TIME) */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminacion_aut` BEFORE DELETE ON `autorizaciones` FOR EACH ROW BEGIN

	INSERT INTO aut_eliminadas VALUES
	(OLD.id_aut, OLD.id_afiliado, OLD.id_prestacion, OLD.cantidad, OLD.id_prestador, OLD.id_usuario, OLD.fecha, OLD.vigencia, OLD.copago);
    
	INSERT INTO auditoria_aut VALUES
	(DEFAULT, USER(), OLD.id_aut,  'Eliminacion de autorizacion', CURRENT_DATE(), CURRENT_TIME);
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `factura_af`
--

DROP TABLE IF EXISTS `factura_af`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_af` (
  `id_fac_af` int NOT NULL AUTO_INCREMENT,
  `id_af` int NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `monto_copago` decimal(8,2) DEFAULT NULL,
  `total` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_fac_af`),
  KEY `id_af` (`id_af`),
  CONSTRAINT `factura_af_ibfk_1` FOREIGN KEY (`id_af`) REFERENCES `afiliados` (`id_afiliado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `factura_af` WRITE;
/*!40000 ALTER TABLE `factura_af` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_af` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla factura_prest

DROP TABLE IF EXISTS `factura_prest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_prest` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_prestador` int NOT NULL,
  `monto` decimal(8,2) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_prestador` (`id_prestador`),
  CONSTRAINT `factura_prest_ibfk_1` FOREIGN KEY (`id_prestador`) REFERENCES `prestadores` (`id_prestador`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_prest`
--

-- Carga de datos en la tabla factura_prest --

LOCK TABLES `factura_prest` WRITE;
/*!40000 ALTER TABLE `factura_prest` DISABLE KEYS */;
INSERT INTO `factura_prest` VALUES (1,2,128000.00,'2023-12-01'),(2,9,45000.00,'2023-12-05'),(3,5,12000.00,'2023-12-01'),(4,8,11000.00,'2023-12-01'),(5,3,10000.00,'2023-12-10'),(6,4,7000.00,'2023-11-30'),(7,10,6000.00,'2023-12-03');
/*!40000 ALTER TABLE `factura_prest` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla historial_consumo

DROP TABLE IF EXISTS `historial_consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_consumo` (
  `id_consumo` int NOT NULL AUTO_INCREMENT,
  `id_afiliado` int NOT NULL,
  `id_aut` int NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_consumo`),
  KEY `id_aut` (`id_aut`),
  KEY `id_afiliado` (`id_afiliado`),
  CONSTRAINT `historial_consumo_ibfk_1` FOREIGN KEY (`id_aut`) REFERENCES `autorizaciones` (`id_aut`),
  CONSTRAINT `historial_consumo_ibfk_2` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliados` (`id_afiliado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Carga de datos en la tabla historial_consumo 

LOCK TABLES `historial_consumo` WRITE;
/*!40000 ALTER TABLE `historial_consumo` DISABLE KEYS */;
INSERT INTO `historial_consumo` VALUES (1,3,1,'2023-12-02'),(2,3,2,'2023-11-22'),(3,2,3,'2023-10-30'),(4,5,4,'2023-10-04'),(5,11,5,'2023-12-27'),(6,9,6,'2023-11-06'),(7,1,7,'2023-12-07'),(8,8,8,'2023-10-08'),(9,6,9,'2023-11-09'),(10,6,10,'2023-10-10'),(11,1,11,'2023-09-18');
/*!40000 ALTER TABLE `historial_consumo` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla pagos

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `monto` decimal(8,2) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura_prest` (`id_factura`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Carga de datos en la tabla pagos --

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,128000.00,'2024-01-05'),(2,2,45000.00,'2024-01-09'),(3,3,12000.00,'2024-01-05'),(4,4,11000.00,'2024-01-05'),(5,5,10000.00,'2024-01-14'),(6,6,7000.00,'2024-01-04'),(7,7,6000.00,'2024-01-07');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla planes

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `porcentaje` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Carga de datos en la tabla planes --

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'JOVEN',15000.00,15.00),(2,'BASICO',20000.00,10.00),(3,'MEDIO',30000.00,8.00),(4,'PLUS',50000.00,3.00),(5,'JUBILADO',35000.00,6.00);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestaciones`
--

DROP TABLE IF EXISTS `prestaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestaciones` (
  `id_prestacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_prestacion`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Carga de datos en la tabla prestaciones --


LOCK TABLES `prestaciones` WRITE;
/*!40000 ALTER TABLE `prestaciones` DISABLE KEYS */;
INSERT INTO `prestaciones` VALUES (1,'Resonancia Magnetica',30000.00),(2,'Tomografia Computarizada',32000.00),(3,'Radiografía',5000.00),(4,'Espinografia',7000.00),(5,'EcoDoppler',12000.00),(6,'Electrocardiograma',9000.00),(7,'Endoscopia Alta/Baja',50000.00),(8,'Mamografia',11000.00),(9,'Polisomnografia',45000.00),(10,'Anatomia Patologica',6000.00),(11,'Densitometria',6000.00);
/*!40000 ALTER TABLE `prestaciones` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla prestadores

DROP TABLE IF EXISTS `prestadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestadores` (
  `id_prestador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_prestador`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Carga de datos en la tabla prestadores --

LOCK TABLES `prestadores` WRITE;
/*!40000 ALTER TABLE `prestadores` DISABLE KEYS */;
INSERT INTO `prestadores` VALUES (1,'Hospital Italiano','Juan Domingo Perón 4190, CABA','49590200'),(2,'Hospital Britanico','Perdriel 74, CABA','43096400'),(3,'Sanatorio Otamendi','Azcuénaga 870, CABA','49652900'),(4,'Hospital Español La Plata','C. 9 175, B1902 La Plata','44215350'),(5,'Hospital San Juan de Dios','Calle 27 y 70, La Plata','44123150'),(6,'Clínica Las Heras','Av. Sta. Fe 1752, CABA','42815460'),(7,'Clínica San Camilo','Angel Gallardo 899, CABA','4482000'),(8,'Clínica La Sagrada Familia','José Hernández 1642, CABA','41823230'),(9,'Sanatorio Finochietto','Av. Córdoba 2678, CABA','4231320'),(10,'Clínica Bazterrica','Juncal 3002, CABA','4515640'),(11,'Sanatorio Mater Dei','San Martín de Tours 2952, CABA','48095555');
/*!40000 ALTER TABLE `prestadores` ENABLE KEYS */;
UNLOCK TABLES;

-- Creacion de la tabla usuarios

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Carga de datos en la tabla usuarios --

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Sergio','Martinez','Gerente'),(2,'Juan','Perez','Aux Administrativo'),(3,'Ana','Gomez','Aux Administrativo'),(4,'Carlos','Rodriguez','Aux Administrativo'),(5,'Laura','Lopez','Aux Administrativo'),(6,'Roberto','Diaz','Sub Gerente'),(7,'María','Martinez','Medico Auditor'),(8,'Sofía','Fernandez','Medico Auditor'),(9,'Diego','Hernandez','Medico Auditor'),(10,'Valentina','Garcia','Medico Auditor'),(11,'Alejandro','Ramirez','Encargado');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

-- Estructura vista v_autporusuario

DROP TABLE IF EXISTS `v_autporusuario`;
/*!50001 DROP VIEW IF EXISTS `v_autporusuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_autporusuario` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `TotalAutorizaciones`*/;
SET character_set_client = @saved_cs_client;

-- Estructura vista v_consumoprestaciones

DROP TABLE IF EXISTS `v_consumoprestaciones`;
/*!50001 DROP VIEW IF EXISTS `v_consumoprestaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_consumoprestaciones` AS SELECT 
 1 AS `id_prestacion`,
 1 AS `Nombre`,
 1 AS `TotalAutorizadas`,
 1 AS `MontoTotal`*/;
SET character_set_client = @saved_cs_client;

-- Estructura de vista v_costoafiliado

DROP TABLE IF EXISTS `v_costoafiliado`;
/*!50001 DROP VIEW IF EXISTS `v_costoafiliado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_costoafiliado` AS SELECT 
 1 AS `id_afiliado`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `TotalAutorizaciones`,
 1 AS `MontoTotal`*/;
SET character_set_client = @saved_cs_client;

-- Estructura de vista v_detalleautorizacion

DROP TABLE IF EXISTS `v_detalleautorizacion`;
/*!50001 DROP VIEW IF EXISTS `v_detalleautorizacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_detalleautorizacion` AS SELECT 
 1 AS `id_aut`,
 1 AS `nombre_afiliado`,
 1 AS `apellido_afiliado`,
 1 AS `practica`,
 1 AS `cantidad`,
 1 AS `prestador`,
 1 AS `autorizado_por`,
 1 AS `fecha`,
 1 AS `vigencia`,
 1 AS `copago`*/;
SET character_set_client = @saved_cs_client;

-- Estructura de vista v_pagoprestadores

DROP TABLE IF EXISTS `v_pagoprestadores`;
/*!50001 DROP VIEW IF EXISTS `v_pagoprestadores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pagoprestadores` AS SELECT 
 1 AS `id_prestador`,
 1 AS `NombrePrestador`,
 1 AS `TotalAutorizaciones`,
 1 AS `MontoTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'obra_social'
--

--
-- Dumping routines for database 'obra_social'
--
/*!50003 DROP FUNCTION IF EXISTS `afiliado_menor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

/* Creacion de Funciones:
	afiliado_menor
    auto_vencidas
    calcular_copagos
    calcular_edad
*/

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `afiliado_menor`(id_af INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE fecha_nacimiento DATE;
    
	SELECT nacimiento INTO fecha_nacimiento
    FROM afiliados
    WHERE id_af = id_afiliado
    LIMIT 1;
	
    IF fecha_nacimiento > DATE_SUB(CURRENT_DATE(), INTERVAL 18 YEAR) THEN
		RETURN TRUE;
    ELSE
		RETURN FALSE;
	END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `auto_vencidas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `auto_vencidas`() RETURNS int
    READS SQL DATA
BEGIN
	DECLARE cant_aut_venc INT;
    
    SELECT COUNT(*)
    INTO cant_aut_venc
    FROM autorizaciones
    WHERE vigencia < CURRENT_DATE();
    
    RETURN cant_aut_venc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_copagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_copagos`(id_prest INT, cantidad INT, porcentaje DECIMAL(4,2)) RETURNS decimal(8,2)
    READS SQL DATA
BEGIN
	DECLARE precioPrestacion DECIMAL (8,2);
    DECLARE copago DECIMAL (8,2);
    DECLARE precioPrestacionFinal DECIMAL (8,2);
    
    SELECT precio INTO precioPrestacion
    FROM prestaciones 
    WHERE id_prest = id_prestacion
    LIMIT 1;
    
    SET precioPrestacionFinal =  precioPrestacion * cantidad;
    SET copago = (precioPrestacionFinal * porcentaje) / 100;
    RETURN copago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_edad`(id_af INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE fecha_nacimiento DATE;
    DECLARE edad INT;
    
    SELECT nacimiento INTO fecha_nacimiento
    FROM afiliados
    WHERE id_af = id_afiliado;
    
    SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURRENT_DATE());
    
    RETURN edad;
END ;;

/* Creacion de Stored Procedures:
	cargar_aut
    generar_historial
    ordenar_tabla
*/

-- Stored Procedure: cargar_aut 

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cargar_aut` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_aut`(
	IN id_af INT,
	IN id_pract INT,
	IN cant INT,
	IN id_prest INT,
	IN id_usu INT
)
BEGIN
	DECLARE	fecha_actual DATE;
    DECLARE fecha_vig DATE;
    DECLARE id_generado INT;
    DECLARE plan INT;
	DECLARE plan_af INT;
    DECLARE porc INT;
    DECLARE copago INT;
    
    SET fecha_actual = CURRENT_DATE();
    SET fecha_vig = CURRENT_DATE() + INTERVAL 45 DAY;
    
    
    IF id_af IS NOT NULL AND id_pract IS NOT NULL AND id_prest IS NOT NULL AND id_usu IS NOT NULL THEN
    
		SELECT id_plan INTO plan_af
        FROM afiliados
        WHERE id_af = id_afiliado;
			
		SELECT id_plan, porcentaje INTO plan, porc
        FROM planes
        WHERE plan_af = id_plan;

		INSERT INTO autorizaciones (id_aut, id_afiliado, id_prestacion, cantidad, id_prestador, id_usuario, fecha, vigencia, copago)
		VALUES (NULL, id_af, id_pract, cant, id_prest, id_usu, fecha_actual, fecha_vig, calcular_copagos(id_pract, cant, porc) );
        
        SET id_generado = LAST_INSERT_ID();
        CALL generar_historial(id_af, id_generado);
        
	ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Un campo ingresado no es valido';
        
    END IF;
    
END ;;

-- Stored Procedure: generar_historial 

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_historial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_historial`(
	IN id_af INT,
	IN id_auto INT
    )
BEGIN
	DECLARE fecha_actual DATE;
    
    IF id_auto IS NOT NULL AND id_af IS NOT NULL THEN
		SET fecha_actual = CURRENT_DATE();
		INSERT INTO historial_consumo (id_consumo, id_afiliado, id_aut, fecha)
		VALUES (NULL, id_af, id_auto, fecha_actual);
    END IF;
END ;;

-- Stored Procedure: ordenar_tabla 

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ordenar_tabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_tabla`(
	IN tabla VARCHAR(30),
    IN columna VARCHAR(30),
    IN orden VARCHAR(5)
    )
BEGIN
	SET @ordenar = CONCAT('SELECT * FROM ', tabla, ' ORDER BY ', columna, ' ', orden);
	PREPARE tabla FROM @ordenar;
	EXECUTE tabla;
	DEALLOCATE PREPARE tabla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



/* VISTAS:
v_autporusuario          - vista autorizaciones por usuario
v_consumoprestaciones    - vista consumo de prestaciones
v_costoafiliado          - vista consto de afiliado por prestaciones utlizadas
v_detalleautorizacion    - vista detallada de autorizaciones
v_pagoprestadores        - vista de pagos a prestadores
*/


/*!50001 DROP VIEW IF EXISTS `v_autporusuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_autporusuario` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,count(`a`.`id_aut`) AS `TotalAutorizaciones` from (`usuarios` `u` left join `autorizaciones` `a` on((`a`.`id_usuario` = `u`.`id_usuario`))) group by `u`.`id_usuario`,`u`.`nombre`,`u`.`apellido` order by `TotalAutorizaciones` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

-- Estructura final de vista v_consumoprestacione`

/*!50001 DROP VIEW IF EXISTS `v_consumoprestaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_consumoprestaciones` AS select `p`.`id_prestacion` AS `id_prestacion`,`p`.`nombre` AS `Nombre`,count(`a`.`id_aut`) AS `TotalAutorizadas`,sum(`p`.`precio`) AS `MontoTotal` from (`prestaciones` `p` join `autorizaciones` `a` on((`a`.`id_prestacion` = `p`.`id_prestacion`))) group by `p`.`id_prestacion`,`p`.`nombre` order by `MontoTotal` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

-- Estructura final de vista v_costoafiliado`

/*!50001 DROP VIEW IF EXISTS `v_costoafiliado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_costoafiliado` AS select `af`.`id_afiliado` AS `id_afiliado`,`af`.`nombre` AS `Nombre`,`af`.`apellido` AS `Apellido`,count(`a`.`id_aut`) AS `TotalAutorizaciones`,sum(`p`.`precio`) AS `MontoTotal` from ((`afiliados` `af` left join `autorizaciones` `a` on((`af`.`id_afiliado` = `a`.`id_afiliado`))) left join `prestaciones` `p` on((`a`.`id_prestacion` = `p`.`id_prestacion`))) group by `af`.`id_afiliado`,`af`.`nombre`,`af`.`apellido` order by `MontoTotal` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

-- Estructura final de vista v_detalleautorizacion

/*!50001 DROP VIEW IF EXISTS `v_detalleautorizacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detalleautorizacion` AS select `a`.`id_aut` AS `id_aut`,`af`.`nombre` AS `nombre_afiliado`,`af`.`apellido` AS `apellido_afiliado`,`p`.`nombre` AS `practica`,`a`.`cantidad` AS `cantidad`,`pr`.`nombre` AS `prestador`,`u`.`apellido` AS `autorizado_por`,`a`.`fecha` AS `fecha`,`a`.`vigencia` AS `vigencia`,`a`.`copago` AS `copago` from ((((`autorizaciones` `a` join `afiliados` `af` on((`a`.`id_afiliado` = `af`.`id_afiliado`))) join `prestaciones` `p` on((`a`.`id_prestacion` = `p`.`id_prestacion`))) join `usuarios` `u` on((`a`.`id_usuario` = `u`.`id_usuario`))) join `prestadores` `pr` on((`a`.`id_prestador` = `pr`.`id_prestador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

-- Estructura final de vista v_pagoprestadores

/*!50001 DROP VIEW IF EXISTS `v_pagoprestadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pagoprestadores` AS select `pr`.`id_prestador` AS `id_prestador`,`pr`.`nombre` AS `NombrePrestador`,count(`a`.`id_aut`) AS `TotalAutorizaciones`,sum(`p`.`precio`) AS `MontoTotal` from ((`prestadores` `pr` join `prestaciones` `p` on((`pr`.`id_prestador` = `p`.`id_prestacion`))) join `autorizaciones` `a` on((`p`.`id_prestacion` = `a`.`id_prestacion`))) group by `pr`.`id_prestador`,`pr`.`nombre` order by `MontoTotal` desc */;
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

-- Dump completed on 2024-01-07 18:59:12

