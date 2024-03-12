USE `ofcar`;

DROP TABLE IF EXISTS `customers`;
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

LOCK TABLES `customers` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `parameters`;
CREATE TABLE `parameters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `data` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `parameters` WRITE;
INSERT INTO `parameters` VALUES (3,'Permissão Listar','list','2024-03-10 12:59:09',NULL),(4,'Permissão Leitura','read','2024-03-10 12:59:09',NULL),(5,'Permissão Criar','create','2024-03-10 12:59:09',NULL),(6,'Permissão Atualizar','update','2024-03-10 12:59:09',NULL),(7,'Permissão Deletar','delete','2024-03-10 12:59:09',NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_model` varchar(45) NOT NULL,
  `permission` enum('list','read','create','update','delete') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_model` (`table_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permission` WRITE;
INSERT INTO `permission` VALUES (1,'category','list','2024-03-09 19:46:09',NULL),(2,'category','read','2024-03-09 19:46:09',NULL),(3,'category','create','2024-03-09 19:46:09',NULL),(4,'category','update','2024-03-09 19:46:09',NULL),(5,'category','delete','2024-03-09 19:46:09',NULL),(6,'product','list','2024-03-09 19:46:09',NULL),(7,'product','read','2024-03-09 19:46:09',NULL),(8,'product','create','2024-03-09 19:46:09',NULL),(9,'product','update','2024-03-09 19:46:09',NULL),(10,'product','delete','2024-03-09 19:46:09',NULL),(11,'profile','list','2024-03-09 19:46:09',NULL),(12,'profile','read','2024-03-09 19:46:09',NULL),(13,'profile','create','2024-03-09 19:46:09',NULL),(14,'profile','update','2024-03-09 19:46:09',NULL),(15,'profile','delete','2024-03-09 19:46:09',NULL),(16,'user','list','2024-03-09 19:46:09',NULL),(17,'user','read','2024-03-09 19:46:09',NULL),(18,'user','create','2024-03-09 19:46:09',NULL),(19,'user','update','2024-03-09 19:46:09',NULL),(20,'user','delete','2024-03-09 19:46:09',NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `permission_profile`;
CREATE TABLE `permission_profile` (
  `profile_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`profile_id`,`permission_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permission_profile` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `product`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profile` WRITE;
INSERT INTO `profile` VALUES (3,'asdasd','2024-03-10 14:53:29',NULL),(2,'Consultor Linha Leve Teste','2024-03-10 14:51:30','2024-03-10 18:49:40'),(4,'asdasd','2024-03-10 14:55:41',NULL),(5,'asdasd','2024-03-10 14:55:44',NULL),(6,'asdasd','2024-03-10 14:59:19',NULL),(7,'asdasd','2024-03-10 15:00:19',NULL),(8,'asdasd','2024-03-10 15:01:43',NULL),(9,'TEste','2024-03-10 15:01:49',NULL),(10,'TEste','2024-03-10 15:03:37',NULL),(11,'TEste','2024-03-10 15:07:45',NULL),(12,'Teste 3','2024-03-10 15:08:49',NULL),(13,'Teste 3','2024-03-10 15:09:35',NULL),(14,'Teste 3','2024-03-10 15:10:03',NULL),(15,'Teste 3','2024-03-10 15:10:18',NULL),(16,'Teste 3','2024-03-10 15:11:02',NULL),(17,'asdasdasd','2024-03-10 15:11:09',NULL),(18,'RETEC - Staging','2024-03-10 15:14:40',NULL),(19,'Compras Lagoa','2024-03-10 15:15:34',NULL),(20,'Compras Lagoa','2024-03-10 15:16:22',NULL),(21,'Compras Lagoa','2024-03-10 15:20:18',NULL),(22,'Compras Lagoa','2024-03-10 15:20:37',NULL),(23,'Compras Lagoa','2024-03-10 15:21:06',NULL),(24,'Compras Lagoa','2024-03-10 15:21:43',NULL),(25,'Compras Lagoa','2024-03-10 15:23:56',NULL),(26,'Compras Lagoa','2024-03-10 15:24:06',NULL),(27,'Folha de pagamento','2024-03-10 15:29:06',NULL),(28,'Compras Lagoa','2024-03-10 15:30:25',NULL),(29,'Compras Lagoa','2024-03-10 15:30:56',NULL),(30,'Compras Lagoa','2024-03-10 15:31:10',NULL),(31,'Compras Lagoa','2024-03-10 15:31:28',NULL),(32,'Compras Lagoa','2024-03-10 15:31:53',NULL),(33,'Compras Lagoa','2024-03-10 15:35:59',NULL),(34,'Compras Lagoa','2024-03-10 15:37:02',NULL),(35,'Compras Lagoa','2024-03-10 15:37:11',NULL),(36,'Compras Lagoa','2024-03-10 15:37:13',NULL),(37,'Compras Lagoa','2024-03-10 15:37:15',NULL),(38,'Compras Lagoa','2024-03-10 15:40:26',NULL),(39,'Folha de pagamento','2024-03-10 15:40:35',NULL),(40,'Compras Lagoa','2024-03-10 15:42:47',NULL),(41,'Compras Lagoa','2024-03-10 15:43:50',NULL),(42,'Compras Lagoa','2024-03-10 15:44:12',NULL),(43,'TEste','2024-03-10 15:47:28',NULL),(44,'TEste','2024-03-10 15:49:05',NULL),(45,'TEste','2024-03-10 15:49:11',NULL),(46,'TEste','2024-03-10 15:50:00',NULL),(47,'TEste','2024-03-10 15:50:11',NULL),(48,'TEste','2024-03-10 15:51:54',NULL),(49,'TEtaqatetea','2024-03-10 17:42:42',NULL),(50,'TEtaqatetea','2024-03-10 17:42:47',NULL),(51,'TEtaqatetea','2024-03-10 17:42:53',NULL),(52,'TEtaqatetea','2024-03-10 17:42:59',NULL),(53,'TEtaqatetea','2024-03-10 17:43:33',NULL),(54,'Folha de pagamento','2024-03-10 17:44:08',NULL),(55,'','2024-03-10 17:53:56',NULL),(56,'Compras Lagoa','2024-03-10 18:56:11',NULL),(57,'Folha de pagamento','2024-03-10 19:21:16',NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `sales_order`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sales_order` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `sales_order_products`;
CREATE TABLE `sales_order_products` (
  `sales_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sales_order_id`,`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sales_order_products` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `sales_status`;
CREATE TABLE `sales_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sales_status` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `acronym` varchar(2) NOT NULL,
  `ibge_code` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `state` WRITE;
INSERT INTO `state` VALUES (1,'Acre','AC',12,'2024-03-10 20:53:11',NULL),(2,'Alagoas','AL',27,'2024-03-10 20:53:11',NULL),(3,'Amapá','AP',16,'2024-03-10 20:53:11',NULL),(4,'Amazonas','AM',13,'2024-03-10 20:53:11',NULL),(5,'Bahia','BA',29,'2024-03-10 20:53:11',NULL),(6,'Ceará','CE',23,'2024-03-10 20:53:11',NULL),(7,'Distrito Federal','DF',53,'2024-03-10 20:53:11',NULL),(8,'Espírito Santo','ES',32,'2024-03-10 20:53:11',NULL),(9,'Goiás','GO',52,'2024-03-10 20:53:11',NULL),(10,'Maranhão','MA',21,'2024-03-10 20:53:11',NULL),(11,'Mato Grosso','MT',51,'2024-03-10 20:53:11',NULL),(12,'Mato Grosso do Sul','MS',50,'2024-03-10 20:53:11',NULL),(13,'Minas Gerais','MG',31,'2024-03-10 20:53:11',NULL),(14,'Pará','PA',15,'2024-03-10 20:53:11',NULL),(15,'Paraíba','PB',25,'2024-03-10 20:53:11',NULL),(16,'Paraná','PR',41,'2024-03-10 20:53:11',NULL),(17,'Pernambuco','PE',26,'2024-03-10 20:53:11',NULL),(18,'Piauí','PI',22,'2024-03-10 20:53:11',NULL),(19,'Rio de Janeiro','RJ',33,'2024-03-10 20:53:11',NULL),(20,'Rio Grande do Norte','RN',24,'2024-03-10 20:53:11',NULL),(21,'Rio Grande do Sul','RS',43,'2024-03-10 20:53:11',NULL),(22,'Rondônia','RO',11,'2024-03-10 20:53:11',NULL),(23,'Roraima','RR',14,'2024-03-10 20:53:11',NULL),(24,'Santa Catarina','SC',42,'2024-03-10 20:53:11',NULL),(25,'São Paulo','SP',35,'2024-03-10 20:53:11',NULL),(26,'Sergipe','SE',28,'2024-03-10 20:53:11',NULL),(27,'Tocantins','TO',17,'2024-03-10 20:53:11',NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `user`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `valid_tables`;
CREATE VIEW `valid_tables` AS SELECT 1 AS `table_name`;

DELIMITER ;;
CREATE FUNCTION `valida_cpf`(cpf VARCHAR(14)) RETURNS tinyint(1)
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

insert into parameters (description, data) values ('Permissão Listar', 'list');
insert into parameters (description, data) values ('Permissão Leitura', 'read');
insert into parameters (description, data) values ('Permissão Criar', 'create');
insert into parameters (description, data) values ('Permissão Atualizar', 'update');
insert into parameters (description, data) values ('Permissão Deletar', 'delete');
insert into permission (table_model, permission) values ('sales_order', 'list');
insert into permission (table_model, permission) values ('sales_order', 'read');
insert into permission (table_model, permission) values ('sales_order', 'create');
insert into permission (table_model, permission) values ('sales_order', 'update');
insert into permission (table_model, permission) values ('sales_order', 'delete');
insert into permission (table_model, permission) values ('product', 'list');
insert into permission (table_model, permission) values ('product', 'read');
insert into permission (table_model, permission) values ('product', 'create');
insert into permission (table_model, permission) values ('product', 'update');
insert into permission (table_model, permission) values ('product', 'delete');
insert into permission (table_model, permission) values ('profile', 'list');
insert into permission (table_model, permission) values ('profile', 'read');
insert into permission (table_model, permission) values ('profile', 'create');
insert into permission (table_model, permission) values ('profile', 'update');
insert into permission (table_model, permission) values ('profile', 'delete');
insert into permission (table_model, permission) values ('user', 'list');
insert into permission (table_model, permission) values ('user', 'read');
insert into permission (table_model, permission) values ('user', 'create');
insert into permission (table_model, permission) values ('user', 'update');
insert into permission (table_model, permission) values ('user', 'delete');
-- Dump completed on 2024-03-10 23:11:59




