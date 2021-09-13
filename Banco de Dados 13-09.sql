CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `market`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: market
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sobrenome` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cpf` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `rg` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `endereco` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cep` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `celular` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `rg_UNIQUE` (`rg`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'André','Cabral','09353145473','469475493','andrecabral@gmail.com','Rua Silvino Macêdo','55036200','8139709996'),(2,'Debora','Sampaio','99863461423','157603763','deborasampaio@gmail.com','Rua Ibiapaba','55153080','8129304397'),(3,'Everton','Silva','61679114441','348662841','evertonsilva@gmail.com','Rua Juscelino Kubtschek','56328155','8127169504'),(4,'Maria','Penha','18853489405','487957106','mariapenha@outlook.com','Rua Sete de Setembro','54280630','81989592727'),(5,'Mikaelly','Fernandes','19919276499','127482295','mikaelyfernandes@outlook.com','Rua Doutor Paulo Correia','55292240','87989173800'),(6,'Milena','Oliveira','56427033409','117596243','milenaoliveira@hotmail.com','Rua Francisco José Rodrigues','54360070','87988445555'),(7,'Osvaldo','Cruz','87756123484','241199815','osvaldocruz@gmail.com','Rua José Balarmino Bezerra','56302320','81984342689'),(8,'Pedro','Gomes','43145224450','430447395','pedrogomes@outlook.com','Rua Cento e Vinte Três','52061440','81989827093'),(9,'Vitoria','Emanuelle','96097769490','300437146','vitoriaemanuelle@gmail.com','Rua Qurenta e Cinco','53530498','81991199555'),(10,'Aline','Costa','48339650436','434148893','alinecosta@gmail.com','Rua São José dos Campos','52540981','81987451314');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantidade_atual` int DEFAULT NULL,
  `quantidade_min` int DEFAULT NULL,
  `quantidade_max` int DEFAULT NULL,
  `fk_produto_id_estoque` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_produto_id_estoque_UNIQUE` (`fk_produto_id_estoque`),
  CONSTRAINT `fk_produto_id_estoque` FOREIGN KEY (`fk_produto_id_estoque`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,20,40,100,1),(2,0,80,200,2),(3,350,200,500,3),(4,400,200,500,4),(5,300,200,500,5),(6,70,60,150,6),(7,150,100,250,7),(8,0,120,300,8),(9,250,160,400,9),(10,30,20,50,10);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empresa` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cnpj` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `endereco` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cep` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `categoriaA` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `categoriaB` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Coca-Cola','44678910241902','cocacola@hotmail.com','Rua São Cristovão','55522002','8133967468','Bebidas',NULL),(2,'Friboi','95671230834618','friboi@hotmail.com','Rua Nova Canaã','55553406','8133567289','Frios',''),(3,'Hainiken','54793210956372','hainiken@hotmail.com','Rua do Sol','55530723','8133048298','Bebidas',NULL),(4,'Kicaldo','21983466899012','kicaldo@hotmail.com','Avenida Boa Viagem','55592784','8133578392','Grãos',NULL),(5,'Nestle','70193426782910','nestle@hotmail.com','Avenida de Desessete de agosto','55584563','8133912374','Chocolate','Cereais'),(6,'Perdigão','18374899106458','perdigao@hotmail.com','Avenida Maria Irene','55531526','8133456828','Frios',NULL),(7,'Sadia','67390193743819','sadia@hotmail.com','Recife antigo','55586471','8133829193','Frios','Orgânicos'),(8,'Vigor','53718389013668','vigor@hotmail.com','Tancredo Neves','55505637','8133984738','Bebidas',NULL),(9,'Camil','23456789101211','camil@hotmail.com','Rua da Moeda','55510000','8133456719','Alimentos',''),(10,'Vitarela','42167827651092','vitarela@hotmail.com','Rua Dom Pedro','55672899','8133546798','alimentos',NULL);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sobrenome` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cpf` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `rg` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `celular` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `rg_UNIQUE` (`rg`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `celular_UNIQUE` (`celular`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'	Anderson ','Augusto','90142323179','247980894','Andre@gmail.com','81120041204'),(2,'Adriano','Silva','54356742143','396480834','Adrianosilva@hotmail.com','81756494068'),(3,'Andre ','Lucas','12359849365164','259270167','andrelucas@outlook.com','81241846862'),(4,'Cabral','Neto','35464512513','159495659','cabralneto@gmail.com','81133630724'),(5,'Enzo ','Silva','14543143212','380253252','enzosilva@hotmail.com','81443032345'),(6,'Jailson ','Mendes','43212354315','178702869','jailsonmendes@gmail.com','81517234934'),(7,'Michel','Alencar','66612154624','450071352','michelalencar@outlook.com','81508332452'),(8,'Mikaely ','Vitoria ','35664315443','330147638','Mikaely@hotmail.com','81240453040'),(9,'Milena ','Vitoria','35454256376','152415051','milenavitoria@gmail.com','81514427957'),(10,'Paulo ','guina','21354366353','458752046','pauloguina@gmail.com','81326937760');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_pedido`
--

DROP TABLE IF EXISTS `lista_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `listaid` int DEFAULT NULL,
  `fk_cliente_id_lista` int DEFAULT NULL,
  `fk_produto_id_lista` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_lista_idx` (`fk_cliente_id_lista`),
  KEY `fk_produto_id_lista_idx` (`fk_produto_id_lista`),
  CONSTRAINT `fk_cliente_id_lista` FOREIGN KEY (`fk_cliente_id_lista`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_produto_id_lista` FOREIGN KEY (`fk_produto_id_lista`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_pedido`
--

LOCK TABLES `lista_pedido` WRITE;
/*!40000 ALTER TABLE `lista_pedido` DISABLE KEYS */;
INSERT INTO `lista_pedido` VALUES (1,'Compras Mensais Vovó',1,4,3,5),(2,'Compras Mensais Vovó',1,4,4,5),(3,'Compras Mensais Vovó',1,4,5,5),(4,'Compras Mensais Vovó',1,4,6,10),(5,'Compras Mensais Vovó',1,4,8,2),(6,'Compras Mensais Vovó',1,4,9,3),(7,'Compras Mensais Vovó',1,4,2,1),(8,'Compras Semanais Eu',2,4,10,3),(9,'Compras Semanais Eu',2,4,8,1),(10,'Compras Semanais Eu',2,4,7,1),(11,'Compras Semanais Eu',2,4,6,5),(12,'Compras Semanais Eu',2,4,2,2),(13,'Compras Semanais Eu',2,4,1,3),(14,'Minhas Cocas Semanais',3,5,2,5);
/*!40000 ALTER TABLE `lista_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordens`
--

DROP TABLE IF EXISTS `ordens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_funcionario_id_ordens` int DEFAULT NULL,
  `fk_cliente_id_ordens` int DEFAULT NULL,
  `fk_lista_id_ordens` int DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  `efetuado` tinyint DEFAULT NULL,
  `pronto` tinyint DEFAULT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `data_retirada` datetime DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_funcionario_id_ordens_idx` (`fk_funcionario_id_ordens`),
  KEY `fk_cliente_id_ordens_idx` (`fk_cliente_id_ordens`),
  KEY `fk_lista_id_ordens_idx` (`fk_lista_id_ordens`),
  CONSTRAINT `fk_cliente_id_ordens` FOREIGN KEY (`fk_cliente_id_ordens`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_funcionario_id_ordens` FOREIGN KEY (`fk_funcionario_id_ordens`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `fk_lista_id_ordens` FOREIGN KEY (`fk_lista_id_ordens`) REFERENCES `lista_pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens`
--

LOCK TABLES `ordens` WRITE;
/*!40000 ALTER TABLE `ordens` DISABLE KEYS */;
INSERT INTO `ordens` VALUES (1,2,5,3,2,1,1,'2021-08-01 00:00:00',NULL,'2021-08-01 00:00:00'),(2,2,3,2,1,1,1,'2021-08-03 00:00:00','2021-08-03 00:00:00',NULL),(3,1,5,3,2,1,1,'2021-08-07 00:00:00',NULL,'2021-08-07 00:00:00'),(4,3,5,3,2,1,1,'2021-08-14 00:00:00',NULL,'2021-08-14 00:00:00'),(5,4,3,2,1,1,1,'2021-08-10 00:00:00','2021-08-10 00:00:00',NULL),(6,5,2,2,1,1,1,'2021-08-17 00:00:00','2021-08-17 00:00:00',NULL),(7,3,5,3,2,1,1,'2021-08-21 00:00:00',NULL,'2021-08-21 00:00:00'),(8,2,5,1,1,1,1,'2021-08-22 00:00:00','2021-08-22 00:00:00',NULL),(9,1,1,2,1,1,1,'2021-08-24 00:00:00','2021-08-24 00:00:00',NULL),(10,9,5,3,2,1,1,'2021-08-28 00:00:00',NULL,'2021-08-28 00:00:00');
/*!40000 ALTER TABLE `ordens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_emissao` date DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `pag_feito` tinyint(1) DEFAULT NULL,
  `fk_fornecedor_id_pagamento` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fornecedor_id_idx` (`fk_fornecedor_id_pagamento`),
  CONSTRAINT `fk_fornecedor_id_pagamento` FOREIGN KEY (`fk_fornecedor_id_pagamento`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'2021-08-04','2021-08-15',2345.69,1,1),(2,'2021-08-09','2021-08-21',4687.64,1,6),(3,'2021-08-16','2021-08-30',4893.36,1,4),(4,'2021-08-21','2021-09-04',3010.56,1,3),(5,'2021-08-27','2021-09-10',49523.36,1,7),(6,'2021-08-31','2021-09-14',12305.99,1,9),(7,'2021-09-03','2021-09-19',29882.99,1,8),(8,'2021-09-05','2021-09-21',29109.63,1,10),(9,'2021-09-08','2021-09-27',15589.35,0,5),(10,'2021-09-14','2021-09-30',45903.15,0,2);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `categoria` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `descricao` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `source_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fk_fornecedor_id_produto` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fornecedor_id_idx` (`fk_fornecedor_id_produto`),
  CONSTRAINT `fk_fornecedor_id_produto` FOREIGN KEY (`fk_fornecedor_id_produto`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Heineken','bebidas','1L',7,NULL,1),(2,'Coca-cola','bebidas','2l',8,NULL,1),(3,'Arroz','alimentos','1kg',3.7,NULL,9),(4,'Feijão','alimentos','1kg',4,NULL,4),(5,'Macarrão','alimentos','500g',3,NULL,10),(6,'Biscoito','alimentos','300g',2.5,NULL,10),(7,'Salsicha','frios','1kg',13.99,NULL,6),(8,'Mortadela','frios','1kg',12.89,NULL,7),(9,'Carne ','frios','1kg',20,NULL,2),(10,'Leite condensado','laticínios','500g',3.5,NULL,5);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salario` double DEFAULT NULL,
  `dia_recebimento` date DEFAULT NULL,
  `efetuado` tinyint DEFAULT NULL,
  `fk_funcionario_id_salario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_funcionario_id_salario_idx` (`fk_funcionario_id_salario`),
  CONSTRAINT `fk_funcionario_id_salario` FOREIGN KEY (`fk_funcionario_id_salario`) REFERENCES `funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
INSERT INTO `salario` VALUES (1,1100,'2021-09-15',1,1),(2,1100,'2021-09-15',1,3),(3,1100,'2021-09-15',1,2),(4,1100,'2021-09-15',1,8),(5,1100,'2021-09-15',1,4),(6,1100,'2021-09-30',0,5),(7,3454,'2021-09-30',0,7),(8,1315,'2021-09-30',0,9),(9,1315,'2021-09-30',0,10),(10,2086,'2021-09-30',0,6);
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `fk_cliente_id_venda` int DEFAULT NULL,
  `fk_produto_id_venda` int DEFAULT NULL,
  `fk_funcionario_id_venda` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_venda_idx` (`fk_cliente_id_venda`),
  KEY `fk_produto_id_venda_idx` (`fk_produto_id_venda`),
  KEY `fk_funcionario_id_venda_idx` (`fk_funcionario_id_venda`),
  CONSTRAINT `fk_cliente_id_venda` FOREIGN KEY (`fk_cliente_id_venda`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_funcionario_id_venda` FOREIGN KEY (`fk_funcionario_id_venda`) REFERENCES `funcionario` (`id`),
  CONSTRAINT `fk_produto_id_venda` FOREIGN KEY (`fk_produto_id_venda`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,'2021-09-10 00:00:00',8,3,5,2,5),(2,'2021-09-11 00:00:00',12.89,1,1,8,8),(3,'2021-09-11 00:00:00',8,5,5,2,5),(4,'2021-09-11 00:00:00',2.5,5,8,6,7),(5,'2021-09-12 00:00:00',8,4,5,2,4),(6,'2021-09-12 00:00:00',4,2,4,4,6),(7,'2021-09-13 00:00:00',8,5,5,2,6),(8,'2021-09-13 00:00:00',8,3,5,2,2),(9,'2021-09-15 00:00:00',3.5,7,6,10,2),(10,'2021-09-16 00:00:00',12.89,1,4,8,4);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'market'
--

--
-- Dumping routines for database 'market'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-13 13:43:55
