-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- ------------------------------------------------------
-- Server version	5.6.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `PracticeDB`
--

CREATE DATABASE `PracticeDB`; 

USE `PracticeDB`;

--
-- Table structure for table `po_line`
--

DROP TABLE IF EXISTS `po_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po_line` (
  `ponr` char(7) NOT NULL,
  `prodnr` char(6) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`ponr`,`prodnr`),
  KEY `prodnr` (`prodnr`),
  CONSTRAINT `po_line_ibfk_1` FOREIGN KEY (`ponr`) REFERENCES `purchase_order` (`ponr`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `po_line_ibfk_2` FOREIGN KEY (`prodnr`) REFERENCES `product` (`prodnr`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_line`
--

LOCK TABLES `po_line` WRITE;
/*!40000 ALTER TABLE `po_line` DISABLE KEYS */;
INSERT INTO `po_line` VALUES ('1511','0212',2),('1511','0345',4),('1511','0783',1),('1511','0856',9),('1512','0178',3),('1512','0639',13),('1512','0885',3),('1512','0977',10),('1513','0295',9),('1513','0668',7),('1514','0185',2),('1514','0306',9),('1514','0847',9),('1514','0900',2),('1523','0347',1),('1523','0783',2),('1523','0900',3),('1523','0915',13),('1523','0977',1),('1537','0386',8),('1537','0632',2),('1537','0657',7),('1537','0766',2),('1538','0178',6),('1538','0212',15),('1560','0766',1),('1560','0795',3),('1560','0900',9),('1577','0212',6),('1577','0668',9),('1594','0306',2);
/*!40000 ALTER TABLE `po_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `prodnr` char(6) NOT NULL,
  `prodname` varchar(60) NOT NULL,
  `prodtype` varchar(10) DEFAULT NULL,
  `available_quiantity` int(11) DEFAULT NULL,
  `prodimage` blob,
  PRIMARY KEY (`prodnr`),
  UNIQUE KEY `UC1` (`prodname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('0119','Chateau Miraval, Cotes de Provence Rose, 2015','rose',126,NULL),('0154','Chateau Haut Brion, 2008','red',111,NULL),('0178','Meerdael, Methode Traditionnelle Chardonnay, 2014','sparkling',136,NULL),('0185','Chateau Petrus, 1975','red',5,NULL),('0199','Jacques Selosse, Brut Initial, 2012','sparkling',96,NULL),('0212','Billecart-Salmon, Brut Réserve, 2014','sparkling',141,NULL),('0219','Marques de Caceres, Rioja Crianza, 2010','red',0,NULL),('0238','Cos d\'Estournel, Saint - Estephe, 2006','red',50,NULL),('0265','Chateau Sociando-Mallet, Haut-Medoc, 1998','red',17,NULL),('0289','Chateau Saint Estève de Neri, 2015','rose',126,NULL),('0295','Chateau Pape Clement, Pessac-Léognan, 2001','red',75,NULL),('0300','Chateau des Rontets, Chardonnay, Birbettes','white',64,NULL),('0306','Chateau Coupe Roses, Granaxa, 2011','red',57,NULL),('0327','Chateau La Croix Saint-Michel, 2011','red',87,NULL),('0331','Chateau La Commanderie, Lalande-de-Pomerol, 1998','red',3,NULL),('0345','Vascosassetti, Brunello di Montalcino, 2004','red',64,NULL),('0347','Chateau Corbin-Despagne, Saint-Emilion, 2005','red',145,NULL),('0384','Dominio de Pingus, Ribera del Duero, Tempranillo, 2006','red',38,NULL),('0386','Chateau Haut-Bailly, Pessac-Leognan, Grand Cru Classe, 1968','red',118,NULL),('0404','Chateau Haut-Cadet, Saint-Emilion, 1997','red',115,NULL),('0468','Domaine Trapet Père & Fils, Gevrey-Chambertin, 2008','red',43,NULL),('0474','Chateau De La Tour, Clos-Vougeot, Grand cru, 2008','red',147,NULL),('0494','Veuve-Cliquot, Brut, 2012','sparkling',1,NULL),('0523','Chateau Andron Blanquet, Saint Estephe, 1979','red',13,NULL),('0632','Meneghetti, Chardonnay, 2010','white',83,NULL),('0637','Moët & Chandon, Rosé, Imperial, 2014','sparkling',121,NULL),('0639','Chateau Mouton-Rotshild, Pauillac, 2007','red',35,NULL),('0657','Le Brun Servenay, Brut, 2008','sparkling',34,NULL),('0668','Gallo Family Vineyards, Grenache, 2014','rose',95,NULL),('0760','Chateau Talbot, Saint-Julien, Grand Cru Classe, 2002','red',92,NULL),('0766','GH Mum, Brut, 2012','sparkling',68,NULL),('0783','Clos D\'Opleeuw, Chardonnay, 2012','white',8,NULL),('0795','Casa Silva, Los Lingues, Carmenere, 2012','red',105,NULL),('0832','Conde de Hervías, Rioja, 2004','red',121,NULL),('0838','Piper Heidseck, Brut, 2014','sparkling',108,NULL),('0847','Seresin, Merlot, 1999','red',41,NULL),('0856','Domaine Chandon de Briailles, Savigny-Les-Beaune, 2006','red',93,NULL),('0885','Chateau Margaux, Grand Cru Classé, 1956','red',147,NULL),('0899','Trimbach, Riesling, 1989','white',142,NULL),('0900','Chateau Cheval Blanc, Saint Emilion, Grand Cru Classé, 1972','red',45,NULL),('0915','Champagne Boizel, Brut, Réserve, 2010','sparkling',76,NULL),('0977','Chateau Batailley, Grand Cru Classé, 1975','red',21,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `ponr` char(7) NOT NULL,
  `podate` date DEFAULT NULL,
  `supnr` char(4) NOT NULL,
  PRIMARY KEY (`ponr`),
  KEY `supnr` (`supnr`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`supnr`) REFERENCES `supplier` (`supnr`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES ('1511','2015-03-24','37'),('1512','2015-04-10','94'),('1513','2015-04-11','37'),('1514','2015-04-12','32'),('1523','2015-04-19','37'),('1537','2015-04-27','69'),('1538','2015-05-01','68'),('1560','2015-05-05','32'),('1577','2015-05-10','37'),('1594','2015-05-13','37');
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supnr` char(4) NOT NULL,
  `supname` varchar(40) NOT NULL,
  `supadress` varchar(50) DEFAULT NULL,
  `supcity` varchar(20) DEFAULT NULL,
  `supstatus` smallint(6) DEFAULT '10',
  PRIMARY KEY (`supnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('21','Deliwines','240, Avenue of the Americas','New York',20),('32','Best Wines','660, Market Street','San Francisco',90),('37','Ad Fundum','82, Wacker Drive','Chicago',95),('52','Spirits & co.','928, Strip','Las Vegas',NULL),('68','The Wine Depot','132, Montgomery Street','San Francisco',10),('69','Vinos del Mundo','4, Collins Avenue','Miami',92),('84','Wine Trade Logistics','1002, Rhode Island Avenue','Washington',92),('94','The Wine Crate','330, McKinney Avenue','Dallas',75);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `supnr` char(4) NOT NULL,
  `prodnr` char(6) NOT NULL,
  `purchase_price` double(8,2) DEFAULT NULL COMMENT 'purchase price in euros',
  `deliv_period` int(11) DEFAULT NULL COMMENT 'delivery period in days',
  PRIMARY KEY (`supnr`,`prodnr`),
  KEY `prodnr` (`prodnr`),
  CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`supnr`) REFERENCES `supplier` (`supnr`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`prodnr`) REFERENCES `product` (`prodnr`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES ('21','0119',15.99,1),('21','0178',0.00,0),('21','0289',17.99,1),('21','0327',56.00,6),('21','0347',16.00,2),('21','0384',55.00,2),('21','0386',58.99,2),('21','0468',14.99,5),('21','0668',6.00,1),('32','0154',21.00,4),('32','0474',40.00,1),('32','0494',15.00,2),('32','0657',44.99,4),('32','0760',52.00,3),('32','0832',20.00,2),('37','0178',16.99,4),('37','0185',32.99,3),('37','0468',14.00,1),('37','0795',20.99,3),('68','0178',17.99,5),('68','0212',27.99,6),('68','0300',19.00,1),('68','0327',56.99,4),('68','0468',15.99,4),('68','0637',81.00,2),('68','0639',5.00,5),('68','0668',6.99,3),('68','0760',52.99,2),('69','0178',16.99,0),('69','0199',32.00,4),('69','0347',18.00,4),('69','0783',7.00,3),('69','0795',20.99,1),('69','0832',21.00,4),('69','0977',34.99,1),('84','0185',33.00,5),('84','0300',21.00,2),('84','0306',25.00,2),('84','0347',18.00,4),('84','0468',15.00,2),('84','0494',15.99,2),('84','0832',20.99,6),('84','0915',84.00,3),('94','0154',22.00,2),('94','0178',18.00,6),('94','0185',32.99,1),('94','0199',30.99,1),('94','0474',39.99,2),('94','0523',20.99,3),('94','0632',15.99,2),('94','0899',15.00,1);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-25 14:28:11
