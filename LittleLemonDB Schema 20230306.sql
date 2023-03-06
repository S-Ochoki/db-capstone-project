-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `GuestID` int NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingTimeSlot` time NOT NULL,
  `TableNo` int NOT NULL,
  `StaffID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE KEY `BookingID_UNIQUE` (`BookingID`),
  KEY `customer_fk_idx` (`GuestID`),
  KEY `staff_fk_idx` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,5,'2023-01-10','19:00:00',10,7),(2,4,'2023-02-15','16:00:00',12,8),(3,2,'2023-02-15','18:00:00',9,5),(4,3,'2023-02-14','15:00:00',7,8),(5,1,'2023-02-17','15:00:00',4,7),(6,5,'2023-03-28','17:00:00',10,8),(7,1,'2023-04-10','20:00:00',9,5),(8,2,'2023-03-10','18:30:00',7,7),(9,4,'2023-03-02','14:00:00',1,7),(10,1,'2022-10-10','18:00:00',5,7),(11,3,'2022-11-12','18:00:00',3,7),(12,2,'2022-10-11','18:00:00',2,7),(13,1,'2022-10-13','18:00:00',2,7),(14,1,'2022-12-17','18:00:00',1,5),(23,1,'2022-12-17','18:00:00',5,5),(24,7,'2022-12-17','18:00:00',6,5),(25,7,'2022-12-18','18:00:00',7,5);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerFirstName` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CustomerLastName` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PhoneNo` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Winfred','Baketi','wbakzeti@gmail.com',727890123),(2,'George','Hallaji','hallhallag@yahoo.com',765123456),(3,'Tom','Mboya','moites67@outlook.com',789098745),(4,'Tenten','Hiroshima','1010Hiro@jps.com',767895634),(5,'Stella','Junjim','s_junjin@kml.com',745432167),(7,'Fname_7','Lname_7',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemID` int NOT NULL AUTO_INCREMENT,
  `MenuID` int NOT NULL,
  `ItemName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CourseType` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`MenuItemID`),
  KEY `fk_MenuItem_Menu_idx` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,1,'Olives','Starters',5),(2,3,'Flatbread','Starters',5),(3,2,'Minestrone','Starters',8),(4,2,'Tomato bread','Starters',8),(5,3,'Falafel','Starters',7),(6,3,'Hummus','Starters',5),(7,1,'Greek salad','Main Courses',15),(8,1,'Bean soup','Main Courses',12),(9,2,'Pizza','Main Courses',15),(10,1,'Greek yoghurt','Desserts',7),(11,3,'Ice cream','Desserts',6),(12,2,'Cheesecake','Desserts',4),(13,1,'Athens White wine','Drinks',25),(14,1,'Corfu Red Wine','Drinks',30),(15,2,'Turkish Coffee','Drinks',10),(16,3,'Turkish Coffee','Drinks',10),(17,3,'Kabasa','Main Courses',17),(18,4,'Soda','Drinks',5);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(45) NOT NULL,
  `Cuisine` varchar(100) NOT NULL,
  PRIMARY KEY (`MenuID`),
  UNIQUE KEY `MenuID_UNIQUE` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Taste of Greece','Greek'),(2,'Menu Italia','Italian'),(3,'Turkish Delight','Turkish'),(4,'General','All');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `MenuItemID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  UNIQUE KEY `OrderItemID_UNIQUE` (`OrderItemID`),
  KEY `order_fk_idx` (`OrderID`),
  KEY `fk_OrderItem_MenuItem_idx` (`MenuItemID`),
  CONSTRAINT `fk_OrderItem_Order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,18,5),(2,1,2,3),(3,1,4,3),(4,1,6,2),(5,1,7,1),(6,1,8,2),(7,1,9,2),(8,1,11,3),(9,1,12,2),(10,1,14,3),(11,1,15,1),(12,2,9,1),(13,2,18,1),(14,3,1,2),(15,3,7,2),(16,3,10,1),(17,3,12,1),(18,4,16,1),(19,5,5,1),(20,5,6,1),(21,5,9,1),(22,5,7,1),(23,5,13,1),(24,6,18,1),(25,6,4,2),(26,6,8,1);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int DEFAULT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` int NOT NULL DEFAULT '0',
  `TotalCost` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  KEY `booking_fk_idx` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2023-01-10',25,269),(2,4,'2023-02-14',2,20),(3,2,'2023-02-15',6,51),(4,3,'2023-02-15',1,10),(5,5,'2023-02-17',5,67),(6,8,'2023-03-10',4,33);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `OrderStatusID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `DeliveryDate` datetime DEFAULT NULL,
  `OrderDeliveryStatus` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`OrderStatusID`),
  UNIQUE KEY `idOrderDeliveryStatusID_UNIQUE` (`OrderStatusID`),
  KEY `order_fk_idx` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Role` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ContactNumber` int DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Salary` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Mario Gollini','Manager','Mario.g@littlelemon.com',351258074,'724, Parsley Lane, Old Town, Chicago, IL','$70,000'),(2,'Adrian Gollini','Assistant Manager','Adrian.g@littlelemon.com',351474048,'334, Dill Square, Lincoln Park, Chicago, IL','$65,000'),(3,'Giorgos Dioudis','Head Chef','Giorgos.d@littlelemon.com',351970582,'879 Sage Street, West Loop, Chicago, IL','$50,000'),(4,'Fatma Kaya','Assistant Chef','Fatma.k@littlelemon.com',351963569,'132  Bay Lane, Chicago, IL','$45,000'),(5,'Elena Salvai','Head Waiter','Elena.s@littlelemon.com',351074198,'989 Thyme Square, EdgeWater, Chicago, IL','$40,000'),(6,'John Millar','Receptionist','John.m@littlelemon.com',351584508,'245 Dill Square, Lincoln Park, Chicago, IL','$35,000'),(7,'Poetus Mollini','Waiter','Poetus.m@littlelemon.com',351906789,'989 Thyme Square, EdgeWater, Chicago, IL','$20,000'),(8,'Shirley Kade','Waiter','Shirley.k@littlelemon.com',351345641,'989 Thyme Square, EdgeWater, Chicago, IL','$20,000');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`meta`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,sum(`orderitems`.`Quantity`) AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from (`orders` join `orderitems` on((`orders`.`OrderID` = `orderitems`.`OrderID`))) group by `orders`.`OrderID` having (`Quantity` > 2) */;
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

-- Dump completed on 2023-03-06 13:22:18
