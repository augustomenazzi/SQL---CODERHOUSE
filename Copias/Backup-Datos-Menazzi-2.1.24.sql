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
-- Dumping data for table `auditoria_c_cliente`
--

LOCK TABLES `auditoria_c_cliente` WRITE;
/*!40000 ALTER TABLE `auditoria_c_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_c_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auditoria_cliente`
--

LOCK TABLES `auditoria_cliente` WRITE;
/*!40000 ALTER TABLE `auditoria_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auditoria_producto`
--

LOCK TABLES `auditoria_producto` WRITE;
/*!40000 ALTER TABLE `auditoria_producto` DISABLE KEYS */;
INSERT INTO `auditoria_producto` VALUES (1,'RTX 3050 Asus Dual Fan','Placas De VIdeo',4000.00,5400.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(2,'RTX 2060 SUPER Asus OC','Placas De VIdeo',3500.00,4725.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(3,'RTX 3060 12GB OC MSI VENTUS','Placas De VIdeo',2000.00,2700.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(4,'GTX 1660 SUPER ROG OC','Placas De VIdeo',2000.00,2700.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(5,'Gabinete Aerocool 200X','Gabinetes',1500.00,2025.00,10,NULL,NULL,NULL,1,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(6,'Gabinete ASUS AP2001','Gabinetes',1700.00,2295.00,10,NULL,NULL,NULL,1,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(7,'Gabinete ASUS ROG GT3000','Gabinetes',2500.00,3375.00,10,NULL,NULL,NULL,1,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(8,'Monitor Samsung 24p 75hz IPS','Monitores',2700.00,3645.00,10,NULL,NULL,NULL,3,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(9,'Monitor Samsung 27p 144hz IPS','Monitores',3500.00,4725.00,5,NULL,NULL,NULL,3,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(10,'Monitor ACER 27p 360hz TN','Monitores',4000.00,5400.00,5,NULL,NULL,NULL,3,'root@localhost','2023-12-16 03:21:05','Actualización del Precio Final'),(11,'RTX 4090 24GB ROG STRIX GAMING OC','Placas De VIdeo',2000.00,2700.00,10,NULL,NULL,NULL,2,'root@localhost','2023-12-16 03:21:20','Actualización de Titulo');
/*!40000 ALTER TABLE `auditoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'jacinto','matas','17308014'),(2,'marco','peller','16457852'),(3,'teofilo','padron','16354985'),(4,'jose','leiva','43658412'),(5,'rocio','carbonell','38256415'),(6,'maria','lopez','36251498'),(7,'georgina','llopis','25146987'),(8,'maria','verdugo','19654723'),(9,'maria sol','jara','16487513'),(10,'leticia','gonzalez','29874532');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contacto_cliente`
--

LOCK TABLES `contacto_cliente` WRITE;
/*!40000 ALTER TABLE `contacto_cliente` DISABLE KEYS */;
INSERT INTO `contacto_cliente` VALUES (1,'777-777-7777','610-411-9865','holaquease@gmail.ar',1),(2,'666-666-6666','555-555-5555','holaquease@gmail.PUTA',2),(3,'659-913-5816','812-225-5233','bbbbbb@gmail.com',3),(4,'419-810-2867','353-728-6559','bkearney3@nasa.gov',4),(5,'647-604-4998','155-525-4599','areidshaw4@techcrunch.com',5),(6,'484-250-7709','777-777-7777','tcolcomb5@mit.edu',6),(7,'666-666-6666','555-555-5555','twarcup6@ocn.ne.jp',7),(8,'801-478-3762','685-536-4217','dgiacobillo7@sciencedaily.com',8),(9,'636-158-9111','732-396-3097','oeschalotte8@bigcartel.com',9),(10,'432-755-3725','999-448-9979','gjertz9@cbslocal.com',10);
/*!40000 ALTER TABLE `contacto_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `contacto_proveedor`
--

LOCK TABLES `contacto_proveedor` WRITE;
/*!40000 ALTER TABLE `contacto_proveedor` DISABLE KEYS */;
INSERT INTO `contacto_proveedor` VALUES (1,'191-809-8815','231-221-5156','ralben0@hao123.com',1),(2,'691-293-0881','369-176-2734','ksheasby1@freewebs.com',2),(3,'231-541-5155','791-713-8176','mgrigor2@tiny.cc',3),(4,'191-410-0239','575-728-9317','lmessiter3@usa.gov',4);
/*!40000 ALTER TABLE `contacto_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Bv. Ballester 6084','CABA','Monserrat',NULL,1401,1),(2,'Cuba 3265','CABA','San Telmo',NULL,1201,2),(3,'Neuquen 3485','Retiro','Retiro',NULL,1106,3),(4,'Cuba 4056','CABA','San Telmo',NULL,1201,4),(5,'Neuquen 3085','CABA','Retiro',NULL,1106,5),(6,'Calchaqui 3022','Caseros','Caseros',NULL,1604,6),(7,'Calchaqui 3115','Caseros','Caseros',NULL,1604,7),(8,'marconi 2022','Palomar','El Palomar',NULL,1407,8),(9,'Peru 1205','Palomar','El Palomar',NULL,1407,9),(10,'Casco 4578','Hurlingham','Hurlingham',NULL,1427,10);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,'retiro',NULL,3),(2,'envio','andreani',10),(3,'envio','andreani',1),(4,'retiro',NULL,7),(5,'retiro',NULL,2),(6,'envio','andreani',9),(7,'envio','andreani',4),(8,'envio','andreani',5),(9,'envio','andreani',6),(10,'envio','andreani',8);
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hechos_ventas`
--

LOCK TABLES `hechos_ventas` WRITE;
/*!40000 ALTER TABLE `hechos_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `hechos_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Iphone 13',1000.00,'Credito',NULL,'en proceso',1,2),(2,'Samsung S23',999.00,'transferencia',NULL,'en proceso',2,6),(3,'Iphone 15 PRO',1500.00,'Debito',NULL,'en proceso',3,4),(4,'Monitor asus 24p 75hz',1499.50,'transferencia',NULL,'en proceso',4,8),(5,'Extensor 24pines ATX',540.00,'transferencia',NULL,'en proceso',5,10),(6,'Control remoto universal Samsung',899.00,'transferencia',NULL,'en proceso',6,3),(7,'Extensor Wifi 6.0',2250.99,'Debito',NULL,'en proceso',7,5),(8,'GeForce RTX 3060Ti Asus TUF',3050.00,'transferencia',NULL,'en proceso',8,7),(9,'GeForce RTX 4090 Asus ROG',5000.00,'Debito',NULL,'en proceso',9,1),(10,'Gabinete Gamer ID-COOLING 200X',1750.98,'Credito',NULL,'en proceso',10,9);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'RTX 3050 Asus Dual Fan','Placas De VIdeo',4000.00,10,NULL,NULL,NULL,2,5400.00),(2,'RTX 2060 SUPER Asus OC','Placas De VIdeo',3500.00,10,NULL,NULL,NULL,2,4725.00),(3,'RTX 4090 24GB ROG STRIX GAMING OC','Placas De VIdeo',2000.00,10,NULL,NULL,NULL,2,2700.00),(4,'GTX 1660 SUPER ROG OC','Placas De VIdeo',2000.00,10,NULL,NULL,NULL,2,2700.00),(5,'Gabinete Aerocool 200X','Gabinetes',1500.00,10,NULL,NULL,NULL,1,2025.00),(6,'Gabinete ASUS AP2001','Gabinetes',1700.00,10,NULL,NULL,NULL,1,2295.00),(7,'Gabinete ASUS ROG GT3000','Gabinetes',2500.00,10,NULL,NULL,NULL,1,3375.00),(8,'Monitor Samsung 24p 75hz IPS','Monitores',2700.00,10,NULL,NULL,NULL,3,3645.00),(9,'Monitor Samsung 27p 144hz IPS','Monitores',3500.00,5,NULL,NULL,NULL,3,4725.00),(10,'Monitor ACER 27p 360hz TN','Monitores',4000.00,5,NULL,NULL,NULL,3,5400.00),(11,'RTX 2060 SUPER 6GB 0C ASUS','Placas de Video',3999.99,10,'Sin asignar','Sin asignar','Sin asignar',2,5399.99);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Carlos','Gonzalez','12457865','Gabinetes',NULL),(2,'Juan','Del Valle','35479512','Hardware',NULL),(3,'Ernesto','Martin','25469832','Hardware',NULL),(4,'Claudia','Gimenez','35469874','Hardware',NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-02 21:24:32
