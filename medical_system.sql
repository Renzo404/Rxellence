-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: medical_system
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `account_requests`
--

DROP TABLE IF EXISTS `account_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) NOT NULL,
  `license_number` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `affiliated_id` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_requests`
--

LOCK TABLES `account_requests` WRITE;
/*!40000 ALTER TABLE `account_requests` DISABLE KEYS */;
INSERT INTO `account_requests` VALUES (1,'doctor','DOC1004','Dr. Lara Mendoza',1,'Pending'),(2,'pharmacist','PHARM2004','Mr. Leo Villanueva',2,'Approved'),(3,'patient',NULL,'Rica Santos',NULL,'Approved');
/*!40000 ALTER TABLE `account_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin123','Dr. Karen Mendoza'),(2,'securepass','Engr. Paolo Santos'),(3,'system2025','Ms. Angela Cruz');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliation_validations`
--

DROP TABLE IF EXISTS `affiliation_validations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliation_validations` (
  `validation_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_type` varchar(50) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  `validated_by` int(11) NOT NULL,
  `validated_at` datetime DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`validation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliation_validations`
--

LOCK TABLES `affiliation_validations` WRITE;
/*!40000 ALTER TABLE `affiliation_validations` DISABLE KEYS */;
INSERT INTO `affiliation_validations` VALUES (1,'Hospital',1,1,'2025-10-01 10:00:00','Approved'),(2,'Pharmacy',2,1,'2025-10-02 11:30:00','Pending'),(3,'Hospital',3,2,'2025-10-03 14:45:00','Approved');
/*!40000 ALTER TABLE `affiliation_validations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `details` text DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,1,'admin','Added new doctor account',1,'2025-10-29 04:59:38','Doctor DOC1001 registered'),(2,2,'doctor','Created prescription',1,'2025-10-29 04:59:38','Prescription #1 generated'),(3,3,'pharmacist','Updated stock record',1,'2025-10-29 04:59:38','Stock replenished'),(4,4,'patient','Viewed medical record',1,'2025-10-29 04:59:38','Patient accessed personal history');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnoses` (
  `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_name` varchar(255) NOT NULL,
  `date_diagnosed` date NOT NULL,
  PRIMARY KEY (`diagnosis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,'Hypertension','2025-01-15'),(2,'Type 2 Diabetes Mellitus','2025-02-10'),(3,'Bronchial Asthma','2025-03-05'),(4,'Migraine','2025-04-20'),(5,'Urinary Tract Infection','2025-05-12');
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_affiliations`
--

DROP TABLE IF EXISTS `doctor_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_affiliations` (
  `dr_license_number` varchar(50) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  PRIMARY KEY (`dr_license_number`,`hospital_id`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `doctor_affiliations_ibfk_1` FOREIGN KEY (`dr_license_number`) REFERENCES `doctors` (`dr_license_number`),
  CONSTRAINT `doctor_affiliations_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_affiliations`
--

LOCK TABLES `doctor_affiliations` WRITE;
/*!40000 ALTER TABLE `doctor_affiliations` DISABLE KEYS */;
INSERT INTO `doctor_affiliations` VALUES ('DOC1001',1),('DOC1002',2),('DOC1003',3);
/*!40000 ALTER TABLE `doctor_affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `dr_license_number` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `license_issue_date` date DEFAULT NULL,
  `license_expiration` date DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`dr_license_number`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('DOC1001','docpass1','Dr. Carlos Ramirez',1,'Cardiology','sig_carlos.png','2020-01-01','2030-01-01','doc_carlos.jpg','Expert in cardiovascular diseases'),('DOC1002','docpass2','Dr. Elisa Santos',2,'Endocrinology','sig_elisa.png','2019-06-15','2029-06-15','doc_elisa.jpg','Focus on diabetes management'),('DOC1003','docpass3','Dr. Miguel Tan',3,'Pulmonology','sig_miguel.png','2021-03-10','2031-03-10','doc_miguel.jpg','Specialist in respiratory care');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contacts`
--

DROP TABLE IF EXISTS `emergency_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contacts` (
  `emergency_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  PRIMARY KEY (`emergency_contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contacts`
--

LOCK TABLES `emergency_contacts` WRITE;
/*!40000 ALTER TABLE `emergency_contacts` DISABLE KEYS */;
INSERT INTO `emergency_contacts` VALUES (1,'Maria Dela Cruz','09171234567','Mother'),(2,'Jose Santos','09995551234','Father'),(3,'Anna Lopez','09183456789','Sister');
/*!40000 ALTER TABLE `emergency_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) NOT NULL,
  `hospital_affiliation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES (1,'St. Luke\'s Medical Center',101),(2,'Baguio General Hospital',102),(3,'Maryknoll Hospital',103);
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `med_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(100) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `form` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`med_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'Biogesic','500mg','Paracetamol','Analgesic','Tablet',3.50),(2,'Ventolin','2mg','Salbutamol','Bronchodilator','Syrup',85.00),(3,'Amoxicare','250mg','Amoxicillin','Antibiotic','Capsule',12.00),(4,'Metformin','500mg','Metformin','Antidiabetic','Tablet',5.00),(5,'Losartan','50mg','Losartan','Antihypertensive','Tablet',7.50);
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `dr_license_number` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`dr_license_number`,`patient_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`dr_license_number`) REFERENCES `doctors` (`dr_license_number`),
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES ('DOC1001',1,'Patient shows improvement after medication.'),('DOC1002',2,'Continue monitoring blood sugar daily.'),('DOC1003',3,'Schedule follow-up for lung function test.');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_records`
--

DROP TABLE IF EXISTS `patient_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_records` (
  `dr_license_number` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `diagnosis_id` int(11) NOT NULL,
  `med_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dr_license_number`,`patient_id`,`diagnosis_id`),
  KEY `diagnosis_id` (`diagnosis_id`),
  KEY `med_id` (`med_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_records_ibfk_1` FOREIGN KEY (`dr_license_number`) REFERENCES `doctors` (`dr_license_number`),
  CONSTRAINT `patient_records_ibfk_2` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnoses` (`diagnosis_id`),
  CONSTRAINT `patient_records_ibfk_3` FOREIGN KEY (`med_id`) REFERENCES `medicines` (`med_id`),
  CONSTRAINT `patient_records_ibfk_4` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_records`
--

LOCK TABLES `patient_records` WRITE;
/*!40000 ALTER TABLE `patient_records` DISABLE KEYS */;
INSERT INTO `patient_records` VALUES ('DOC1003',3,3,2),('DOC1002',2,2,4),('DOC1001',1,1,5);
/*!40000 ALTER TABLE `patient_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `blood_type` varchar(5) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `emergency_contact_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `emergency_contact_id` (`emergency_contact_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`emergency_contact_id`) REFERENCES `emergency_contacts` (`emergency_contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'pat123','Andrei','Dela Cruz','2002-05-14','M',170.20,65.00,'O+','09181234567','Baguio City',1),(2,'pat456','Nicole','Reyes','1999-09-10','F',160.50,54.00,'A+','09997654321','La Trinidad',2),(3,'pat789','Lance','Gutierrez','2000-02-20','M',175.00,70.00,'B-','09182345678','Tuba, Benguet',3);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacies`
--

DROP TABLE IF EXISTS `pharmacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacies` (
  `pharmacy_id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacy_name` varchar(255) NOT NULL,
  `pharmacy_affiliation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pharmacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacies`
--

LOCK TABLES `pharmacies` WRITE;
/*!40000 ALTER TABLE `pharmacies` DISABLE KEYS */;
INSERT INTO `pharmacies` VALUES (1,'Mercury Drug',201),(2,'Watsons Pharmacy',202),(3,'SouthCare Pharmacy',203);
/*!40000 ALTER TABLE `pharmacies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacists`
--

DROP TABLE IF EXISTS `pharmacists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacists` (
  `ph_license_number` varchar(50) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pharmacist_name` varchar(100) NOT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ph_license_number`),
  KEY `pharmacy_id` (`pharmacy_id`),
  CONSTRAINT `pharmacists_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`pharmacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacists`
--

LOCK TABLES `pharmacists` WRITE;
/*!40000 ALTER TABLE `pharmacists` DISABLE KEYS */;
INSERT INTO `pharmacists` VALUES ('PHARM2001',1,'pharm123','Ms. Julia Ramos','pharm_julia.jpg'),('PHARM2002',2,'pharm456','Mr. Ken Lopez','pharm_ken.jpg'),('PHARM2003',3,'pharm789','Ms. Bea Cruz','pharm_bea.jpg');
/*!40000 ALTER TABLE `pharmacists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescribed_medicines`
--

DROP TABLE IF EXISTS `prescribed_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescribed_medicines` (
  `presc_med_id` int(11) NOT NULL AUTO_INCREMENT,
  `presc_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `dosage_instructions` text DEFAULT NULL,
  `addtl_instructions` text DEFAULT NULL,
  PRIMARY KEY (`presc_med_id`),
  KEY `presc_id` (`presc_id`),
  KEY `med_id` (`med_id`),
  CONSTRAINT `prescribed_medicines_ibfk_1` FOREIGN KEY (`presc_id`) REFERENCES `prescriptions` (`presc_id`),
  CONSTRAINT `prescribed_medicines_ibfk_2` FOREIGN KEY (`med_id`) REFERENCES `medicines` (`med_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescribed_medicines`
--

LOCK TABLES `prescribed_medicines` WRITE;
/*!40000 ALTER TABLE `prescribed_medicines` DISABLE KEYS */;
INSERT INTO `prescribed_medicines` VALUES (1,1,1,10,'1 tablet','Take every 6 hours after meal','Stay hydrated'),(2,2,4,30,'1 tablet','Take every morning before meal','Monitor blood sugar'),(3,3,2,15,'10ml','Take every 8 hours','Use nebulizer if necessary');
/*!40000 ALTER TABLE `prescribed_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `presc_id` int(11) NOT NULL AUTO_INCREMENT,
  `dr_license_number` varchar(50) NOT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`presc_id`),
  KEY `dr_license_number` (`dr_license_number`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`dr_license_number`) REFERENCES `doctors` (`dr_license_number`),
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,'DOC1001',1),(2,'DOC1002',2),(3,'DOC1003',3);
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_items`
--

DROP TABLE IF EXISTS `sales_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_items` (
  `sales_rec_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`sales_rec_id`,`stock_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `sales_items_ibfk_1` FOREIGN KEY (`sales_rec_id`) REFERENCES `sales_records` (`sales_rec_id`),
  CONSTRAINT `sales_items_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_items`
--

LOCK TABLES `sales_items` WRITE;
/*!40000 ALTER TABLE `sales_items` DISABLE KEYS */;
INSERT INTO `sales_items` VALUES (1,1,50,3.50),(2,2,10,85.00),(3,3,50,12.00);
/*!40000 ALTER TABLE `sales_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_records`
--

DROP TABLE IF EXISTS `sales_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_records` (
  `sales_rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacy_id` int(11) NOT NULL,
  `pharmacist` varchar(50) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sales_rec_id`),
  KEY `pharmacy_id` (`pharmacy_id`),
  CONSTRAINT `sales_records_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`pharmacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_records`
--

LOCK TABLES `sales_records` WRITE;
/*!40000 ALTER TABLE `sales_records` DISABLE KEYS */;
INSERT INTO `sales_records` VALUES (1,1,'PHARM2001','2025-10-29 04:58:49',350.00),(2,2,'PHARM2002','2025-10-29 04:58:49',850.00),(3,3,'PHARM2003','2025-10-29 04:58:49',600.00);
/*!40000 ALTER TABLE `sales_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_batches`
--

DROP TABLE IF EXISTS `stock_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_batches` (
  `stock_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_batch_id`),
  KEY `stock_id` (`stock_id`),
  CONSTRAINT `stock_batches_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_batches`
--

LOCK TABLES `stock_batches` WRITE;
/*!40000 ALTER TABLE `stock_batches` DISABLE KEYS */;
INSERT INTO `stock_batches` VALUES (1,1,3.50,'2026-01-01',200),(2,2,85.00,'2025-12-31',100),(3,3,12.00,'2026-06-15',150);
/*!40000 ALTER TABLE `stock_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `med_id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `stock_name` varchar(100) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `med_id` (`med_id`),
  KEY `pharmacy_id` (`pharmacy_id`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`med_id`) REFERENCES `medicines` (`med_id`),
  CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`pharmacy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,1,1,'Paracetamol Stock A',3.50,100,500),(2,2,2,'Ventolin Stock B',85.00,50,200),(3,3,3,'Amoxicare Stock C',12.00,80,300);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin'),(2,'patient'),(3,'doctor'),(4,'pharmacist');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'medical_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-29 10:29:11
