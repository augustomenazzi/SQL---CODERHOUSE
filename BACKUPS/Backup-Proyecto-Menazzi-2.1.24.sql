/*
TABLAS INCLUIDAS EN ESTE BACKUP: 
1. cliente
2. auditoria_cliente
3. contacto_cliente
4. auditoria_c_cliente
5. direccion
6. envio
7. pedido
8. proveedor
9. contacto_proveedor
10. producto
11. auditoria_producto
12. hechos_ventas
*/

CREATE DATABASE  IF NOT EXISTS `curso_coderhouse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `curso_coderhouse`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: curso_coderhouse
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

--
-- Table structure for table `auditoria_c_cliente`
--

DROP TABLE IF EXISTS `auditoria_c_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_c_cliente` (
  `id_contacto_cliente` int NOT NULL AUTO_INCREMENT,
  `telefono1` varchar(20) NOT NULL,
  `telefono2` varchar(20) DEFAULT 'Sin asignar',
  `email` varchar(120) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `tipo_mov` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_contacto_cliente`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `auditoria_c_cliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_c_cliente`
--

LOCK TABLES `auditoria_c_cliente` WRITE;
/*!40000 ALTER TABLE `auditoria_c_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_c_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_cliente`
--

DROP TABLE IF EXISTS `auditoria_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `documento` varchar(14) DEFAULT 'Sin asignar',
  `usuario` varchar(100) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `tipo_mov` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_cliente`
--

LOCK TABLES `auditoria_cliente` WRITE;
/*!40000 ALTER TABLE `auditoria_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_producto`
--

DROP TABLE IF EXISTS `auditoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `precio_final` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `medidas` varchar(20) DEFAULT 'Sin asignar',
  `peso` varchar(15) DEFAULT 'Sin asignar',
  `descripcion` varchar(500) DEFAULT 'Sin asignar',
  `id_proveedor` int DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `tipo_mov` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `auditoria_producto_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_producto`
--

LOCK TABLES `auditoria_producto` WRITE;
/*!40000 ALTER TABLE `auditoria_producto` DISABLE KEYS */;
INSERT INTO `auditoria_producto` VALUES (1,'RTX 3050 Asus Dual Fan','Placas De VIdeo',4000.00,5400.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(2,'RTX 2060 SUPER Asus OC','Placas De VIdeo',3500.00,4725.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(3,'RTX 3060 12GB OC MSI VENTUS','Placas De VIdeo',2000.00,2700.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(4,'GTX 1660 SUPER ROG OC','Placas De VIdeo',2000.00,2700.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(5,'Gabinete Aerocool 200X','Gabinetes',1500.00,2025.00,10,NULL,NULL,NULL,1,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(6,'Gabinete ASUS AP2001','Gabinetes',1700.00,2295.00,10,NULL,NULL,NULL,1,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(7,'Gabinete ASUS ROG GT3000','Gabinetes',2500.00,3375.00,10,NULL,NULL,NULL,1,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(8,'Monitor Samsung 24p 75hz IPS','Monitores',2700.00,3645.00,10,NULL,NULL,NULL,3,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(9,'Monitor Samsung 27p 144hz IPS','Monitores',3500.00,4725.00,5,NULL,NULL,NULL,3,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(10,'Monitor ACER 27p 360hz TN','Monitores',4000.00,5400.00,5,NULL,NULL,NULL,3,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(11,'RTX 4090 24GB ROG STRIX GAMING OC','Placas De VIdeo',2000.00,2700.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:20','Actualización de Titulo');
/*!40000 ALTER TABLE `auditoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `documento` varchar(14) DEFAULT 'Sin asignar',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `documento` (`documento`),
  KEY `idx_dni` (`documento`),
  KEY `nombre` (`nombre`,`apellido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'jacinto','matas','17308014'),(2,'marco','peller','16457852'),(3,'teofilo','padron','16354985'),(4,'jose','leiva','43658412'),(5,'rocio','carbonell','38256415'),(6,'maria','lopez','36251498'),(7,'georgina','llopis','25146987'),(8,'maria','verdugo','19654723'),(9,'maria sol','jara','16487513'),(10,'leticia','gonzalez','29874532');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_insercion_cliente` AFTER INSERT ON `cliente` FOR EACH ROW INSERT INTO auditoria_cliente VALUES
(NEW.id_cliente, NEW.nombre, NEW.apellido, NEW.documento, USER(), NOW(), 'Se inserto un nuevo cliente') */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_eliminacion_cliente` BEFORE DELETE ON `cliente` FOR EACH ROW INSERT INTO auditoria_cliente VALUES
(OLD.id_cliente, OLD.nombre, OLD.apellido, OLD.documento, USER(), NOW(), 'Se elimina un cliente') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contacto_cliente`
--

DROP TABLE IF EXISTS `contacto_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_cliente` (
  `id_contacto_cliente` int NOT NULL AUTO_INCREMENT,
  `telefono1` varchar(20) NOT NULL,
  `telefono2` varchar(20) DEFAULT 'Sin asignar',
  `email` varchar(120) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_contacto_cliente`),
  UNIQUE KEY `uni_email` (`email`),
  KEY `fk_contacto_cliente` (`id_cliente`),
  CONSTRAINT `fk_contacto_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_cliente`
--

LOCK TABLES `contacto_cliente` WRITE;
/*!40000 ALTER TABLE `contacto_cliente` DISABLE KEYS */;
INSERT INTO `contacto_cliente` VALUES (1,'777-777-7777','610-411-9865','holaquease@gmail.ar',1),(2,'666-666-6666','555-555-5555','holaquease@gmail.PUTA',2),(3,'659-913-5816','812-225-5233','bbbbbb@gmail.com',3),(4,'419-810-2867','353-728-6559','bkearney3@nasa.gov',4),(5,'647-604-4998','155-525-4599','areidshaw4@techcrunch.com',5),(6,'484-250-7709','777-777-7777','tcolcomb5@mit.edu',6),(7,'666-666-6666','555-555-5555','twarcup6@ocn.ne.jp',7),(8,'801-478-3762','685-536-4217','dgiacobillo7@sciencedaily.com',8),(9,'636-158-9111','732-396-3097','oeschalotte8@bigcartel.com',9),(10,'432-755-3725','999-448-9979','gjertz9@cbslocal.com',10);
/*!40000 ALTER TABLE `contacto_cliente` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_update_c_cliente` BEFORE UPDATE ON `contacto_cliente` FOR EACH ROW BEGIN

	DECLARE cliente_id INT;
    SET cliente_id = OLD.id_cliente;

	IF OLD.telefono1 <> NEW.telefono1 THEN
		INSERT INTO auditoria_c_cliente VALUES
			(DEFAULT, NEW.telefono1, OLD.telefono2, OLD.email, cliente_id, USER(), NOW(), 'Actualización de Telefono1');
            
	END IF;
    
    IF OLD.telefono2 <> NEW.telefono2 THEN
		INSERT INTO auditoria_c_cliente VALUES
			(DEFAULT, OLD.telefono1, NEW.telefono2, OLD.email, cliente_id, USER(), NOW(), 'Actualización de Telefono2');
            
	END IF;
    
    IF OLD.email <> NEW.email THEN
		INSERT INTO auditoria_c_cliente VALUES
		(DEFAULT, OLD.telefono1, OLD.telefono2, NEW.email, cliente_id, USER(), NOW(), 'Actualización de Email');
        
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contacto_proveedor`
--

DROP TABLE IF EXISTS `contacto_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_proveedor` (
  `id_contacto_proveedor` int NOT NULL AUTO_INCREMENT,
  `telefono1` varchar(20) NOT NULL,
  `telefono2` varchar(20) DEFAULT 'Sin asignar',
  `email` varchar(120) NOT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_contacto_proveedor`),
  UNIQUE KEY `uni_email` (`email`),
  KEY `fk_contacto_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_contacto_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_proveedor`
--

LOCK TABLES `contacto_proveedor` WRITE;
/*!40000 ALTER TABLE `contacto_proveedor` DISABLE KEYS */;
INSERT INTO `contacto_proveedor` VALUES (1,'191-809-8815','231-221-5156','ralben0@hao123.com',1),(2,'691-293-0881','369-176-2734','ksheasby1@freewebs.com',2),(3,'231-541-5155','791-713-8176','mgrigor2@tiny.cc',3),(4,'191-410-0239','575-728-9317','lmessiter3@usa.gov',4);
/*!40000 ALTER TABLE `contacto_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(30) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `barrio` varchar(30) NOT NULL,
  `referencia` varchar(50) DEFAULT 'Sin asignar',
  `codigo_postal` decimal(4,0) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_cliente` (`id_cliente`),
  CONSTRAINT `fk_direccion_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Bv. Ballester 6084','CABA','Monserrat',NULL,1401,1),(2,'Cuba 3265','CABA','San Telmo',NULL,1201,2),(3,'Neuquen 3485','Retiro','Retiro',NULL,1106,3),(4,'Cuba 4056','CABA','San Telmo',NULL,1201,4),(5,'Neuquen 3085','CABA','Retiro',NULL,1106,5),(6,'Calchaqui 3022','Caseros','Caseros',NULL,1604,6),(7,'Calchaqui 3115','Caseros','Caseros',NULL,1604,7),(8,'marconi 2022','Palomar','El Palomar',NULL,1407,8),(9,'Peru 1205','Palomar','El Palomar',NULL,1407,9),(10,'Casco 4578','Hurlingham','Hurlingham',NULL,1427,10);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `forma` varchar(10) NOT NULL,
  `empresa` varchar(20) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `fk_envio_cliente` (`id_cliente`),
  CONSTRAINT `fk_envio_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,'retiro',NULL,3),(2,'envio','andreani',10),(3,'envio','andreani',1),(4,'retiro',NULL,7),(5,'retiro',NULL,2),(6,'envio','andreani',9),(7,'envio','andreani',4),(8,'envio','andreani',5),(9,'envio','andreani',6),(10,'envio','andreani',8);
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hechos_ventas`
--

DROP TABLE IF EXISTS `hechos_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hechos_ventas` (
  `id_cliente` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  KEY `fk_ventas_cliente` (`id_cliente`),
  KEY `fk_ventas_pedido` (`id_pedido`),
  KEY `fk_ventas_producto` (`id_producto`),
  CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ventas_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ventas_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hechos_ventas`
--

LOCK TABLES `hechos_ventas` WRITE;
/*!40000 ALTER TABLE `hechos_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `hechos_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `Articulos` varchar(100) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Pago` varchar(20) NOT NULL,
  `Promociones` varchar(20) DEFAULT 'Sin asignar',
  `Estado` varchar(20) NOT NULL,
  `id_envio` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`id_cliente`),
  KEY `id_envio` (`id_envio`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_envio`) REFERENCES `envio` (`id_envio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Iphone 13',1000.00,'Credito',NULL,'en proceso',1,2),(2,'Samsung S23',999.00,'transferencia',NULL,'en proceso',2,6),(3,'Iphone 15 PRO',1500.00,'Debito',NULL,'en proceso',3,4),(4,'Monitor asus 24p 75hz',1499.50,'transferencia',NULL,'en proceso',4,8),(5,'Extensor 24pines ATX',540.00,'transferencia',NULL,'en proceso',5,10),(6,'Control remoto universal Samsung',899.00,'transferencia',NULL,'en proceso',6,3),(7,'Extensor Wifi 6.0',2250.99,'Debito',NULL,'en proceso',7,5),(8,'GeForce RTX 3060Ti Asus TUF',3050.00,'transferencia',NULL,'en proceso',8,7),(9,'GeForce RTX 4090 Asus ROG',5000.00,'Debito',NULL,'en proceso',9,1),(10,'Gabinete Gamer ID-COOLING 200X',1750.98,'Credito',NULL,'en proceso',10,9);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `categoria` varchar(20) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `medidas` varchar(20) DEFAULT 'Sin asignar',
  `peso` varchar(15) DEFAULT 'Sin asignar',
  `descripcion` varchar(500) DEFAULT 'Sin asignar',
  `id_proveedor` int DEFAULT NULL,
  `precio_final` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'RTX 3050 Asus Dual Fan','Placas De VIdeo',4000.00,10,NULL,NULL,NULL,2,5400.00),(2,'RTX 2060 SUPER Asus OC','Placas De VIdeo',3500.00,10,NULL,NULL,NULL,2,4725.00),(3,'RTX 4090 24GB ROG STRIX GAMING OC','Placas De VIdeo',2000.00,10,NULL,NULL,NULL,2,2700.00),(4,'GTX 1660 SUPER ROG OC','Placas De VIdeo',2000.00,10,NULL,NULL,NULL,2,2700.00),(5,'Gabinete Aerocool 200X','Gabinetes',1500.00,10,NULL,NULL,NULL,1,2025.00),(6,'Gabinete ASUS AP2001','Gabinetes',1700.00,10,NULL,NULL,NULL,1,2295.00),(7,'Gabinete ASUS ROG GT3000','Gabinetes',2500.00,10,NULL,NULL,NULL,1,3375.00),(8,'Monitor Samsung 24p 75hz IPS','Monitores',2700.00,10,NULL,NULL,NULL,3,3645.00),(9,'Monitor Samsung 27p 144hz IPS','Monitores',3500.00,5,NULL,NULL,NULL,3,4725.00),(10,'Monitor ACER 27p 360hz TN','Monitores',4000.00,5,NULL,NULL,NULL,3,5400.00),(11,'RTX 2060 SUPER 6GB 0C ASUS','Placas de Video',3999.99,10,'Sin asignar','Sin asignar','Sin asignar',2,5399.99);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `t_update_producto` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN

	DECLARE proveedor_id INT;
    SET proveedor_id = OLD.id_proveedor;
	
	IF OLD.titulo <> NEW.titulo THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, NEW.titulo, OLD.categoria, OLD.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización de Titulo');
            
	END IF;
    
    IF OLD.categoria <> NEW.categoria THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, NEW.categoria, OLD.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización de Categoria');
            
	END IF;
    
    IF OLD.precio <> NEW.precio THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, OLD.categoria, NEW.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización de Precio');
	
    END IF;
	
     IF OLD.precio_final <> NEW.precio_final THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, OLD.categoria, OLD.precio, NEW.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, proveedor_id, USER(), NOW(), 'Actualización del Precio Final');
	
	END IF;
    
    IF OLD.cantidad <> NEW.cantidad OR OLD.medidas <> NEW.medidas OR OLD.peso <> NEW.peso OR OLD.descripcion <> NEW.descripcion THEN
        INSERT INTO auditoria_producto VALUES 
			(DEFAULT, OLD.titulo, OLD.categoria, OLD.precio, OLD.precio_final, NEW.cantidad, NEW.medidas, NEW.peso, NEW.descripcion, proveedor_id, USER(), NOW(), 'Actualización del Stock');
    
    END IF;
    
    IF OLD.id_proveedor <> NEW.id_proveedor THEN
		INSERT INTO auditoria_producto VALUES
			(DEFAULT, OLD.titulo, OLD.categoria, OLD.precio, OLD.precio_final, OLD.cantidad, OLD.medidas, OLD.peso, OLD.descripcion, NEW.id_proveedor, USER(), NOW(), 'Actualización del Precio Final');
	
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `documento` varchar(14) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `pedido` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `documento` (`documento`),
  KEY `idx_dni` (`documento`),
  KEY `nombre` (`nombre`,`apellido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Carlos','Gonzalez','12457865','Gabinetes',NULL),(2,'Juan','Del Valle','35479512','Hardware',NULL),(3,'Ernesto','Martin','25469832','Hardware',NULL),(4,'Claudia','Gimenez','35469874','Hardware',NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista1`
--

DROP TABLE IF EXISTS `vista1`;
/*!50001 DROP VIEW IF EXISTS `vista1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista1` AS SELECT 
 1 AS `id_producto`,
 1 AS `titulo`,
 1 AS `categoria`,
 1 AS `precio`,
 1 AS `nombre`,
 1 AS `id_proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista2`
--

DROP TABLE IF EXISTS `vista2`;
/*!50001 DROP VIEW IF EXISTS `vista2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista2` AS SELECT 
 1 AS `id_producto`,
 1 AS `titulo`,
 1 AS `categoria`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista3`
--

DROP TABLE IF EXISTS `vista3`;
/*!50001 DROP VIEW IF EXISTS `vista3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista3` AS SELECT 
 1 AS `titulo`,
 1 AS `categoria`,
 1 AS `PRECIO_FINAL`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista4`
--

DROP TABLE IF EXISTS `vista4`;
/*!50001 DROP VIEW IF EXISTS `vista4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista4` AS SELECT 
 1 AS `id_pedido`,
 1 AS `Articulos`,
 1 AS `Monto`,
 1 AS `Pago`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `documento`,
 1 AS `telefono1`,
 1 AS `telefono2`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista5`
--

DROP TABLE IF EXISTS `vista5`;
/*!50001 DROP VIEW IF EXISTS `vista5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista5` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `documento`,
 1 AS `telefono1`,
 1 AS `telefono2`,
 1 AS `email`,
 1 AS `id_pedido`,
 1 AS `Articulos`,
 1 AS `id_envio`,
 1 AS `empresa`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'curso_coderhouse'
--

--
-- Dumping routines for database 'curso_coderhouse'
--
/*!50003 DROP FUNCTION IF EXISTS `f_precio_final` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_precio_final`(precio_unitario DECIMAL(10,2), cantidad INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN

	DECLARE total DECIMAL(10,2);
	SET total = precio_unitario * cantidad;
    
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_busqueda_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_busqueda_proveedor`(IN n_id_prov INT)
BEGIN

	DECLARE id_existente INT;
    
    SELECT COUNT(*) INTO id_existente FROM proveedor WHERE id_proveedor = n_id_prov;
    
	IF id_existente = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay ningun proveedor con el ID ingresado';
	ELSE
		SELECT A.id_proveedor, A.nombre, A.apellido, A.documento, A.categoria, P.id_producto, P.titulo, P.precio, P.precio_final, P.cantidad 
        FROM proveedor A
        JOIN producto P ON (P.id_proveedor = A.id_proveedor) 
        WHERE A.id_proveedor = n_id_prov;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_registro_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_registro_cliente`(IN n_nombre VARCHAR(30), IN n_apellido VARCHAR(30), IN n_documento VARCHAR(14))
BEGIN

	DECLARE documento_existente INT;
	
    SELECT COUNT(*) INTO documento_existente FROM cliente WHERE documento = n_documento;
    
    IF documento_existente = 0 THEN
		INSERT INTO cliente 
			(nombre, apellido, documento) VALUES (n_nombre, n_apellido, n_documento);
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El documento ingresado ya esta asignado a otro cliente';
	END IF;

	/* este procedimiento guarda en "documento_existente" el conteo del total de los documentos encontrados iguales al ingresado como parametro en "n_documento"
    si hay algun documento igual al que se ingreso como parametro, "documento_existente" se carga con esa cantidad, que deberia ser 1 maximo ya que documento es UNIQUE
    si es asi, salta error asignado, sino sigue la carga del nuevo registro con ese documento, ya que es valido. */
	 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_registro_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_registro_producto`(IN n_titulo VARCHAR(50), IN n_categoria VARCHAR(20), IN n_precio DECIMAL(10,2), IN n_precio_final DECIMAL(10,2), IN n_cantidad INT, IN n_id_proveedor INT)
BEGIN
    
    DECLARE proveedor_inexistente INT;
    
    SELECT COUNT(*) INTO proveedor_inexistente FROM proveedor WHERE id_proveedor = n_id_proveedor;
    
    IF proveedor_inexistente = 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proveedor ingresado no existe';
    ELSE
		INSERT INTO producto
			(id_producto, titulo, categoria, precio, precio_final, cantidad, id_proveedor) VALUES 
				(default, n_titulo, n_categoria, n_precio, n_precio_final, n_cantidad, n_id_proveedor);
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenar_tabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_tabla`(IN tabla VARCHAR(20), IN columna VARCHAR(30), in orden VARCHAR(4))
BEGIN

	SET @ordenar = CONCAT('SELECT * FROM',' ', tabla, ' ', 'ORDER BY', ' ', columna, ' ', orden);
    
	PREPARE ordenar FROM @ordenar;
    EXECUTE ordenar;
    DEALLOCATE PREPARE ordenar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista1`
--

/*!50001 DROP VIEW IF EXISTS `vista1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista1` AS select `p`.`id_producto` AS `id_producto`,`p`.`titulo` AS `titulo`,`p`.`categoria` AS `categoria`,`p`.`precio` AS `precio`,`a`.`nombre` AS `nombre`,`a`.`id_proveedor` AS `id_proveedor` from (`producto` `p` join `proveedor` `a` on((`p`.`id_proveedor` = `a`.`id_proveedor`))) where (`a`.`documento` = 12457865) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista2`
--

/*!50001 DROP VIEW IF EXISTS `vista2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista2` AS select `p`.`id_producto` AS `id_producto`,`p`.`titulo` AS `titulo`,`p`.`categoria` AS `categoria`,`p`.`precio` AS `precio` from `producto` `p` where ((`p`.`categoria` = 'Gabinetes') and (`p`.`precio` > 1600)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista3`
--

/*!50001 DROP VIEW IF EXISTS `vista3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista3` AS select `p`.`titulo` AS `titulo`,`p`.`categoria` AS `categoria`,(`p`.`precio` * 1.3) AS `PRECIO_FINAL` from `producto` `p` order by `p`.`precio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista4`
--

/*!50001 DROP VIEW IF EXISTS `vista4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista4` AS select `p`.`id_pedido` AS `id_pedido`,`p`.`Articulos` AS `Articulos`,`p`.`Monto` AS `Monto`,`p`.`Pago` AS `Pago`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`c`.`documento` AS `documento`,`cc`.`telefono1` AS `telefono1`,`cc`.`telefono2` AS `telefono2`,`cc`.`email` AS `email` from ((`pedido` `p` join `cliente` `c` on((`p`.`id_cliente` = `c`.`id_cliente`))) join `contacto_cliente` `cc` on((`p`.`id_cliente` = `cc`.`id_cliente`))) where (`p`.`Pago` = 'Debito') order by `p`.`Monto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista5`
--

/*!50001 DROP VIEW IF EXISTS `vista5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista5` AS select `c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`c`.`documento` AS `documento`,`cc`.`telefono1` AS `telefono1`,`cc`.`telefono2` AS `telefono2`,`cc`.`email` AS `email`,`p`.`id_pedido` AS `id_pedido`,`p`.`Articulos` AS `Articulos`,`e`.`id_envio` AS `id_envio`,`e`.`empresa` AS `empresa` from (((`cliente` `c` join `pedido` `p` on((`p`.`id_cliente` = `c`.`id_cliente`))) join `contacto_cliente` `cc` on((`p`.`id_cliente` = `cc`.`id_cliente`))) join `envio` `e` on((`e`.`id_envio` = `p`.`id_envio`))) where (`e`.`empresa` = 'Andreani') */;
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

-- Dump completed on 2024-01-02 21:53:13
