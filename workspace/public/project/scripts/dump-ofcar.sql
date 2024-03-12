CREATE DATABASE  IF NOT EXISTS `ofcar` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ofcar`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ofcar
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `full_name` varchar(128) NOT NULL,
                             `email` varchar(128) NOT NULL,
                             `cpf` varchar(11) NOT NULL,
                             `logradouro` varchar(128) DEFAULT NULL,
                             `number` varchar(10) DEFAULT NULL,
                             `city` varchar(64) DEFAULT NULL,
                             `state_id` int DEFAULT NULL,
                             `creator_user` int NOT NULL,
                             `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                             `updated_at` datetime DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `state_id` (`state_id`),
                             KEY `creator_user` (`creator_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `description` varchar(45) NOT NULL,
                              `data` varchar(45) NOT NULL,
                              `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                              `updated_at` datetime DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` VALUES (3,'Permissão Listar','list','2024-03-10 12:59:09',NULL),(4,'Permissão Leitura','read','2024-03-10 12:59:09',NULL),(5,'Permissão Criar','create','2024-03-10 12:59:09',NULL),(6,'Permissão Atualizar','update','2024-03-10 12:59:09',NULL),(7,'Permissão Deletar','delete','2024-03-10 12:59:09',NULL);
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `table_model` varchar(45) NOT NULL,
                              `permission` enum('list','read','create','update','delete') DEFAULT NULL,
                              `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                              `updated_at` datetime DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `table_model` (`table_model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'category','list','2024-03-09 19:46:09',NULL),(2,'category','read','2024-03-09 19:46:09',NULL),(3,'category','create','2024-03-09 19:46:09',NULL),(4,'category','update','2024-03-09 19:46:09',NULL),(5,'category','delete','2024-03-09 19:46:09',NULL),(6,'product','list','2024-03-09 19:46:09',NULL),(7,'product','read','2024-03-09 19:46:09',NULL),(8,'product','create','2024-03-09 19:46:09',NULL),(9,'product','update','2024-03-09 19:46:09',NULL),(10,'product','delete','2024-03-09 19:46:09',NULL),(11,'profile','list','2024-03-09 19:46:09',NULL),(12,'profile','read','2024-03-09 19:46:09',NULL),(13,'profile','create','2024-03-09 19:46:09',NULL),(14,'profile','update','2024-03-09 19:46:09',NULL),(15,'profile','delete','2024-03-09 19:46:09',NULL),(16,'user','list','2024-03-09 19:46:09',NULL),(17,'user','read','2024-03-09 19:46:09',NULL),(18,'user','create','2024-03-09 19:46:09',NULL),(19,'user','update','2024-03-09 19:46:09',NULL),(20,'user','delete','2024-03-09 19:46:09',NULL);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_profile`
--

DROP TABLE IF EXISTS `permission_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_profile` (
                                      `profile_id` int NOT NULL,
                                      `permission_id` int NOT NULL,
                                      `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                                      `updated_at` datetime DEFAULT NULL,
                                      PRIMARY KEY (`profile_id`,`permission_id`),
                                      KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_profile`
--

LOCK TABLES `permission_profile` WRITE;
/*!40000 ALTER TABLE `permission_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `description` varchar(45) NOT NULL,
                           `cost_value` decimal(10,2) NOT NULL DEFAULT '0.00',
                           `sale_value` decimal(10,2) NOT NULL DEFAULT '0.00',
                           `seller_profile` int NOT NULL,
                           `created_at` datetime NOT NULL,
                           `updated_at` datetime DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `seller_profile` (`seller_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `description` varchar(45) NOT NULL,
                           `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                           `updated_at` datetime DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (3,'asdasd','2024-03-10 14:53:29',NULL),(2,'Consultor Linha Leve Teste','2024-03-10 14:51:30','2024-03-10 18:49:40'),(4,'asdasd','2024-03-10 14:55:41',NULL),(5,'asdasd','2024-03-10 14:55:44',NULL),(6,'asdasd','2024-03-10 14:59:19',NULL),(7,'asdasd','2024-03-10 15:00:19',NULL),(8,'asdasd','2024-03-10 15:01:43',NULL),(9,'TEste','2024-03-10 15:01:49',NULL),(10,'TEste','2024-03-10 15:03:37',NULL),(11,'TEste','2024-03-10 15:07:45',NULL),(12,'Teste 3','2024-03-10 15:08:49',NULL),(13,'Teste 3','2024-03-10 15:09:35',NULL),(14,'Teste 3','2024-03-10 15:10:03',NULL),(15,'Teste 3','2024-03-10 15:10:18',NULL),(16,'Teste 3','2024-03-10 15:11:02',NULL),(17,'asdasdasd','2024-03-10 15:11:09',NULL),(18,'RETEC - Staging','2024-03-10 15:14:40',NULL),(19,'Compras Lagoa','2024-03-10 15:15:34',NULL),(20,'Compras Lagoa','2024-03-10 15:16:22',NULL),(21,'Compras Lagoa','2024-03-10 15:20:18',NULL),(22,'Compras Lagoa','2024-03-10 15:20:37',NULL),(23,'Compras Lagoa','2024-03-10 15:21:06',NULL),(24,'Compras Lagoa','2024-03-10 15:21:43',NULL),(25,'Compras Lagoa','2024-03-10 15:23:56',NULL),(26,'Compras Lagoa','2024-03-10 15:24:06',NULL),(27,'Folha de pagamento','2024-03-10 15:29:06',NULL),(28,'Compras Lagoa','2024-03-10 15:30:25',NULL),(29,'Compras Lagoa','2024-03-10 15:30:56',NULL),(30,'Compras Lagoa','2024-03-10 15:31:10',NULL),(31,'Compras Lagoa','2024-03-10 15:31:28',NULL),(32,'Compras Lagoa','2024-03-10 15:31:53',NULL),(33,'Compras Lagoa','2024-03-10 15:35:59',NULL),(34,'Compras Lagoa','2024-03-10 15:37:02',NULL),(35,'Compras Lagoa','2024-03-10 15:37:11',NULL),(36,'Compras Lagoa','2024-03-10 15:37:13',NULL),(37,'Compras Lagoa','2024-03-10 15:37:15',NULL),(38,'Compras Lagoa','2024-03-10 15:40:26',NULL),(39,'Folha de pagamento','2024-03-10 15:40:35',NULL),(40,'Compras Lagoa','2024-03-10 15:42:47',NULL),(41,'Compras Lagoa','2024-03-10 15:43:50',NULL),(42,'Compras Lagoa','2024-03-10 15:44:12',NULL),(43,'TEste','2024-03-10 15:47:28',NULL),(44,'TEste','2024-03-10 15:49:05',NULL),(45,'TEste','2024-03-10 15:49:11',NULL),(46,'TEste','2024-03-10 15:50:00',NULL),(47,'TEste','2024-03-10 15:50:11',NULL),(48,'TEste','2024-03-10 15:51:54',NULL),(49,'TEtaqatetea','2024-03-10 17:42:42',NULL),(50,'TEtaqatetea','2024-03-10 17:42:47',NULL),(51,'TEtaqatetea','2024-03-10 17:42:53',NULL),(52,'TEtaqatetea','2024-03-10 17:42:59',NULL),(53,'TEtaqatetea','2024-03-10 17:43:33',NULL),(54,'Folha de pagamento','2024-03-10 17:44:08',NULL),(55,'','2024-03-10 17:53:56',NULL),(56,'Compras Lagoa','2024-03-10 18:56:11',NULL),(57,'Folha de pagamento','2024-03-10 19:21:16',NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `gross_total_value` decimal(10,2) NOT NULL,
                               `net_total_value` decimal(10,2) NOT NULL,
                               `discount` decimal(10,2) DEFAULT NULL,
                               `user_id` int NOT NULL,
                               `status` int NOT NULL,
                               `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                               `updated_at` datetime DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `user_id` (`user_id`),
                               KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_products`
--

DROP TABLE IF EXISTS `sales_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_products` (
                                        `sales_order_id` int NOT NULL,
                                        `product_id` int NOT NULL,
                                        `order` int NOT NULL,
                                        `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                                        `updated_at` datetime DEFAULT NULL,
                                        PRIMARY KEY (`sales_order_id`,`product_id`),
                                        KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_products`
--

LOCK TABLES `sales_order_products` WRITE;
/*!40000 ALTER TABLE `sales_order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_status`
--

DROP TABLE IF EXISTS `sales_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_status` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `description` varchar(64) NOT NULL,
                                `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                                `updated_at` datetime DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_status`
--

LOCK TABLES `sales_status` WRITE;
/*!40000 ALTER TABLE `sales_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `name` varchar(128) NOT NULL,
                         `acronym` varchar(2) NOT NULL,
                         `ibge_code` int NOT NULL,
                         `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                         `updated_at` datetime DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Acre','AC',12,'2024-03-10 20:53:11',NULL),(2,'Alagoas','AL',27,'2024-03-10 20:53:11',NULL),(3,'Amapá','AP',16,'2024-03-10 20:53:11',NULL),(4,'Amazonas','AM',13,'2024-03-10 20:53:11',NULL),(5,'Bahia','BA',29,'2024-03-10 20:53:11',NULL),(6,'Ceará','CE',23,'2024-03-10 20:53:11',NULL),(7,'Distrito Federal','DF',53,'2024-03-10 20:53:11',NULL),(8,'Espírito Santo','ES',32,'2024-03-10 20:53:11',NULL),(9,'Goiás','GO',52,'2024-03-10 20:53:11',NULL),(10,'Maranhão','MA',21,'2024-03-10 20:53:11',NULL),(11,'Mato Grosso','MT',51,'2024-03-10 20:53:11',NULL),(12,'Mato Grosso do Sul','MS',50,'2024-03-10 20:53:11',NULL),(13,'Minas Gerais','MG',31,'2024-03-10 20:53:11',NULL),(14,'Pará','PA',15,'2024-03-10 20:53:11',NULL),(15,'Paraíba','PB',25,'2024-03-10 20:53:11',NULL),(16,'Paraná','PR',41,'2024-03-10 20:53:11',NULL),(17,'Pernambuco','PE',26,'2024-03-10 20:53:11',NULL),(18,'Piauí','PI',22,'2024-03-10 20:53:11',NULL),(19,'Rio de Janeiro','RJ',33,'2024-03-10 20:53:11',NULL),(20,'Rio Grande do Norte','RN',24,'2024-03-10 20:53:11',NULL),(21,'Rio Grande do Sul','RS',43,'2024-03-10 20:53:11',NULL),(22,'Rondônia','RO',11,'2024-03-10 20:53:11',NULL),(23,'Roraima','RR',14,'2024-03-10 20:53:11',NULL),(24,'Santa Catarina','SC',42,'2024-03-10 20:53:11',NULL),(25,'São Paulo','SP',35,'2024-03-10 20:53:11',NULL),(26,'Sergipe','SE',28,'2024-03-10 20:53:11',NULL),(27,'Tocantins','TO',17,'2024-03-10 20:53:11',NULL);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `username` varchar(64) NOT NULL,
                        `full_name` varchar(256) NOT NULL,
                        `cpf` varchar(11) NOT NULL,
                        `email` varchar(256) NOT NULL,
                        `password` varchar(256) NOT NULL,
                        `profile_id` int NOT NULL,
                        `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                        `updated_at` datetime DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `unique_cpf` (`cpf`),
                        UNIQUE KEY `unique_username` (`username`),
                        KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `valid_tables`
--

DROP TABLE IF EXISTS `valid_tables`;
/*!50001 DROP VIEW IF EXISTS `valid_tables`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `valid_tables` AS SELECT
 1 AS `table_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'ofcar'
--

--
-- Dumping routines for database 'ofcar'
--
/*!50003 DROP FUNCTION IF EXISTS `valida_cpf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valida_cpf`(cpf VARCHAR(14)) RETURNS tinyint(1)
BEGIN
    DECLARE var1, var2, i, soma, resto, digito1, digito2 INT;
    SET cpf = REPLACE(REPLACE(cpf,'.',''),'-','');
    IF LENGTH(cpf) != 11 THEN
        RETURN FALSE;
END IF;
    SET soma = 0;
    SET var1 = 10;
    SET i = 1;
    WHILE i <= 9 DO
        SET soma = soma + SUBSTRING(cpf, i, 1) * var1;
        SET var1 = var1 - 1;
        SET i = i + 1;
END WHILE;
    SET resto = soma % 11;
    IF resto < 2 THEN
        SET digito1 = 0;
ELSE
        SET digito1 = 11 - resto;
END IF;
    SET soma = 0;
    SET var2 = 11;
    SET i = 1;
    WHILE i <= 9 DO
        SET soma = soma + SUBSTRING(cpf, i, 1) * var2;
        SET var2 = var2 - 1;
        SET i = i + 1;
END WHILE;
    SET soma = soma + digito1 * 2;
    SET resto = soma % 11;
    IF resto < 2 THEN
        SET digito2 = 0;
ELSE
        SET digito2 = 11 - resto;
END IF;
    IF digito1 = SUBSTRING(cpf, 10, 1) AND digito2 = SUBSTRING(cpf, 11, 1) THEN
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

--
-- Final view structure for view `valid_tables`
--

/*!50001 DROP VIEW IF EXISTS `valid_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `valid_tables` AS select `information_schema`.`tables`.`TABLE_NAME` AS `table_name` from `information_schema`.`TABLES` where (`information_schema`.`tables`.`TABLE_SCHEMA` = 'ofcar') */;
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


DELIMITER //
CREATE TRIGGER valida_email_before_insert_customers BEFORE INSERT ON customers FOR EACH ROW
BEGIN
    IF NEW.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O email informado é inválido!';
END IF;
END
//

DELIMITER //
CREATE TRIGGER valida_email_before_update_customers BEFORE UPDATE ON customers FOR EACH ROW
BEGIN
    IF NEW.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O email informado é inválido!';
END IF;
END
//

DELIMITER //
CREATE TRIGGER valida_email_before_insert_user BEFORE INSERT ON user FOR EACH ROW
BEGIN
    IF NEW.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O email informado é inválido!';
END IF;
END
//

DELIMITER //
CREATE TRIGGER valida_email_before_update_user BEFORE UPDATE ON user FOR EACH ROW
BEGIN
    IF NEW.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O email informado é inválido!';
END IF;
END
//

DELIMITER //
-- Trigger para validar CPF antes da atualização
CREATE TRIGGER valida_cpf_before_insert_customers
    BEFORE INSERT ON customers
    FOR EACH ROW
BEGIN
    IF NOT valida_cpf(NEW.cpf) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O CPF informado não é válido!';
END IF;
END;
//

DELIMITER //
-- Trigger para validar CPF antes da atualização
CREATE TRIGGER valida_cpf_before_insert_user
    BEFORE INSERT ON user
    FOR EACH ROW
BEGIN
    IF NOT valida_cpf(NEW.cpf) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O CPF informado não é válido!';
END IF;
END;
//

DELIMITER //
-- Trigger para validar CPF antes da atualização
CREATE TRIGGER valida_cpf_before_update_customers
    BEFORE UPDATE ON customers
    FOR EACH ROW
BEGIN
    IF NOT valida_cpf(NEW.cpf) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O CPF informado não é válido!';
END IF;
END;
//

DELIMITER //
-- Trigger para validar CPF antes da atualização
CREATE TRIGGER valida_cpf_before_update_user
    BEFORE UPDATE ON user
    FOR EACH ROW
BEGIN
    IF NOT valida_cpf(NEW.cpf) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O CPF informado não é válido!';
END IF;
END;
//

-- Dump completed on 2024-03-10 23:11:59



