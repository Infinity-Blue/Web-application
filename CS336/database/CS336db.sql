CREATE DATABASE  IF NOT EXISTS `CS336Schema` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `CS336Schema`;

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
-- Table structure for table `AdmStaffMember`
--

DROP TABLE IF EXISTS `AdmStaffMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdmStaffMember` (
  `username` varchar(30) DEFAULT NULL,
  `password` int(11) NOT NULL,
  PRIMARY KEY (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdminAccount`
--

DROP TABLE IF EXISTS `AdminAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminAccount` (
  `username` varchar(30) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alerts​`
--

DROP TABLE IF EXISTS `Alerts​`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alerts​` (
  `A_id` int(11) NOT NULL DEFAULT '0',
  `Item_idNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`A_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `At`
--

DROP TABLE IF EXISTS `At`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `At` (
  `bid_id` int(11) NOT NULL DEFAULT '0',
  `auction_id` int(11) NOT NULL DEFAULT '0',
  `item_idd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`auction_id`,`item_idd`,`bid_id`),
  KEY `At_ibfk_2` (`item_idd`),
  KEY `At_ibfk_3` (`bid_id`),
  CONSTRAINT `At_ibfk_1` FOREIGN KEY (`auction_id`) REFERENCES `Auctions_in` (`auction_id`),
  CONSTRAINT `At_ibfk_2` FOREIGN KEY (`item_idd`) REFERENCES `Auctions_in` (`item_id`),
  CONSTRAINT `At_ibfk_3` FOREIGN KEY (`bid_id`) REFERENCES `Bid` (`bidID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Auction_in`
--

DROP TABLE IF EXISTS `Auction_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auction_in` (
  `end_date_time` datetime DEFAULT NULL,
  `start_date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Items_id` int(11) NOT NULL DEFAULT '0',
  `auction_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`auction_id`,`start_date_time`,`Items_id`),
  KEY `Auction_in_ibfk_1` (`Items_id`),
  CONSTRAINT `Auction_in_ibfk_1` FOREIGN KEY (`Items_id`) REFERENCES `Item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Auto`
--

DROP TABLE IF EXISTS `Auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auto` (
  `price` int(11) DEFAULT NULL,
  `bidID` int(11) NOT NULL,
  PRIMARY KEY (`bidID`),
  CONSTRAINT `Auto_ibfk_1` FOREIGN KEY (`bidID`) REFERENCES `Bid` (`bidID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bid` (
  `bidID` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `bidType` varchar(45) DEFAULT NULL,
  `incrementVal` int(11) DEFAULT NULL,
  `maximumValue` int(11) DEFAULT NULL,
  PRIMARY KEY (`bidID`),
  KEY `item_id_idx` (`item_id`,`email`),
  KEY `email_idx` (`email`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `UserAccount` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Buyer`
--

DROP TABLE IF EXISTS `Buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Buyer` (
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `Buyer_ibfk_1` FOREIGN KEY (`email`) REFERENCES `UserAccount` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cat`
--

DROP TABLE IF EXISTS `Cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cat` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`),
  CONSTRAINT `Cat_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `Item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Characteristics`
--

DROP TABLE IF EXISTS `Characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Characteristics` (
  `colors` varchar(30) DEFAULT NULL,
  `names` varchar(20) NOT NULL DEFAULT '',
  `ages` int(11) DEFAULT NULL,
  `breeds` varchar(30) DEFAULT NULL,
  `itemsId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`names`,`itemsId`),
  KEY `Characteristics_ibfk_1` (`itemsId`),
  CONSTRAINT `Characteristics_ibfk_1` FOREIGN KEY (`itemsId`) REFERENCES `Item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Characteristics_has​`
--

DROP TABLE IF EXISTS `Characteristics_has​`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Characteristics_has​` (
  `color` varchar(30) DEFAULT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `age` int(11) DEFAULT NULL,
  `breed` varchar(30) DEFAULT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `Characteristics_has​_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `Item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dog`
--

DROP TABLE IF EXISTS `Dog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dog` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`),
  CONSTRAINT `Dog_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `Item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Email`
--

DROP TABLE IF EXISTS `Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Email` (
  `date_time` datetime DEFAULT NULL,
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) DEFAULT NULL,
  `fromUser` varchar(30) DEFAULT NULL,
  `goesTo` varchar(30) DEFAULT NULL,
  `emailSubject` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Has`
--

DROP TABLE IF EXISTS `Has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Has` (
  `email_address` varchar(30) DEFAULT NULL,
  `bid_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid_id`),
  KEY `Has_ibfk_1` (`email_address`),
  CONSTRAINT `Has_ibfk_1` FOREIGN KEY (`email_address`) REFERENCES `Buyer` (`email`),
  CONSTRAINT `Has_ibfk_2` FOREIGN KEY (`bid_id`) REFERENCES `Bid` (`bidID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `Initial_price` double DEFAULT NULL,
  `Min_price` double DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2013170038 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ItemProperties`
--

DROP TABLE IF EXISTS `ItemProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ItemProperties` (
  `item_id` int(11) NOT NULL,
  `color` varchar(45) DEFAULT NULL,
  `breed` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Manual​`
--

DROP TABLE IF EXISTS `Manual​`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manual​` (
  `bidIDs` int(11) NOT NULL DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`bidIDs`),
  CONSTRAINT `Manual​_ibfk_1` FOREIGN KEY (`bidIDs`) REFERENCES `Bid` (`bidID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `idQuestions` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(500) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Answer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idQuestions`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Rabbit​`
--

DROP TABLE IF EXISTS `Rabbit​`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rabbit​` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`),
  CONSTRAINT `Rabbit​_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `Item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Seller`
--

DROP TABLE IF EXISTS `Seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seller` (
  `email` varchar(30) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `creditCardNumber` int(11) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `Seller_ibfk_1` FOREIGN KEY (`email`) REFERENCES `UserAccount` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sells`
--

DROP TABLE IF EXISTS `Sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sells` (
  `item_ids` int(11) NOT NULL DEFAULT '0',
  `email_address` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_ids`,`email_address`),
  KEY `email_address` (`email_address`),
  CONSTRAINT `Sells_ibfk_1` FOREIGN KEY (`item_ids`) REFERENCES `Item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `Sells_ibfk_2` FOREIGN KEY (`email_address`) REFERENCES `Seller` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Set_alert​`
--

DROP TABLE IF EXISTS `Set_alert​`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Set_alert​` (
  `wish_id` int(11) NOT NULL DEFAULT '0',
  `a_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`a_id`,`wish_id`),
  KEY `wish_id` (`wish_id`),
  CONSTRAINT `Set_alert​_ibfk_1` FOREIGN KEY (`wish_id`) REFERENCES `WishList` (`Wish_id`),
  CONSTRAINT `Set_alert​_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `Alerts` (`A_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Starred​`
--

DROP TABLE IF EXISTS `Starred​`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Starred​` (
  `email_address` varchar(30) NOT NULL DEFAULT '',
  `wish_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`email_address`,`wish_id`),
  KEY `wish_id` (`wish_id`),
  CONSTRAINT `Starred​_ibfk_1` FOREIGN KEY (`email_address`) REFERENCES `Buyer` (`email`),
  CONSTRAINT `Starred​_ibfk_2` FOREIGN KEY (`wish_id`) REFERENCES `WishList` (`Wish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserAccount`
--

DROP TABLE IF EXISTS `UserAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAccount` (
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `creditCardNumber` varchar(16) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WishList​`
--

DROP TABLE IF EXISTS `WishList​`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WishList​` (
  `Wish_id` int(11) NOT NULL DEFAULT '0',
  `nbr_of_items` int(11) DEFAULT NULL,
  PRIMARY KEY (`Wish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `createsAccountFor`
--

DROP TABLE IF EXISTS `createsAccountFor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `createsAccountFor` (
  `SSN_adm` int(11) DEFAULT NULL,
  `SSN` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SSN`),
  KEY `SSN_adm` (`SSN_adm`),
  CONSTRAINT `createsAccountFor_ibfk_1` FOREIGN KEY (`SSN_adm`) REFERENCES `AdmStaffMember` (`password`),
  CONSTRAINT `createsAccountFor_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `CustomerRep` (`SSN_Rep`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customerRep`
--

DROP TABLE IF EXISTS `customerRep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerRep` (
  `SSN_Rep` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SSN_Rep`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
