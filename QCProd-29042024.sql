/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.35 : Database - QCProd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`QCProd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `QCProd`;

/*Table structure for table `ApprovalStatus` */

DROP TABLE IF EXISTS `ApprovalStatus`;

CREATE TABLE `ApprovalStatus` (
  `SolarDetailID` varchar(255) DEFAULT NULL,
  `ApprovalStatusID` varchar(255) NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ApprovalStatusID`),
  KEY `fk_ApprovalCreated` (`CreatedBy`),
  KEY `fk_ApprovalSolarDetailID` (`SolarDetailID`),
  CONSTRAINT `fk_ApprovalCreated` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`),
  CONSTRAINT `fk_ApprovalSolarDetailID` FOREIGN KEY (`SolarDetailID`) REFERENCES `IQCSolarDetails` (`SolarDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `ApprovalStatus` */

insert  into `ApprovalStatus`(`SolarDetailID`,`ApprovalStatusID`,`Status`,`Reason`,`CreatedBy`,`CreatedOn`,`UpdatedOn`) values 
('a426b3c5-95da-4339-9b57-7123376d4c04','196ce8ac-3459-42d0-8700-0ee242b67eb9','Approved','','b570e501-f8c7-11ee-b439-0ac93defbbf1','05-04-2024 07:25:42',NULL),
('f4a1b1fb-cb89-4e65-8191-cf37b70707d9','5c278eb9-a362-4a60-bef0-8e807b145b2c','Approved','','b570e501-f8c7-11ee-b439-0ac93defbbf1','04-04-2024 11:31:51',NULL),
('6f7a9344-6c73-4cb0-812f-d88512732728','8349613f-923e-4d3e-ad0c-f25bc035bfe9','Approved','','b570e501-f8c7-11ee-b439-0ac93defbbf1','06-04-2024 06:32:10',NULL),
('e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','dd0f755a-03ff-47bd-a80e-2f57ed8c5702','Approved','','b570e501-f8c7-11ee-b439-0ac93defbbf1','06-04-2024 06:27:45',NULL);

/*Table structure for table `BOM` */

DROP TABLE IF EXISTS `BOM`;

CREATE TABLE `BOM` (
  `BOMId` varchar(255) NOT NULL,
  `BOMDetailId` varchar(255) DEFAULT NULL,
  `BOMItem` varchar(255) DEFAULT NULL,
  `Supplier` varchar(255) DEFAULT NULL,
  `ModelNo` varchar(255) DEFAULT NULL,
  `BatchNo` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BOMId`),
  KEY `nk_BomDetailID` (`BOMDetailId`),
  CONSTRAINT `nk_BomDetailID` FOREIGN KEY (`BOMDetailId`) REFERENCES `BOMVerificationDetails` (`BOMDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `BOM` */

/*Table structure for table `BOMVerificationDetails` */

DROP TABLE IF EXISTS `BOMVerificationDetails`;

CREATE TABLE `BOMVerificationDetails` (
  `BOMDetailId` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `RevNo` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `Shift` varchar(255) DEFAULT NULL,
  `Line` varchar(255) DEFAULT NULL,
  `PONo` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `CheckedBy` varchar(255) DEFAULT NULL,
  `ReviewedBy` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `ReferencePdf` varchar(255) DEFAULT NULL,
  `DocNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BOMDetailId`),
  KEY `nk_BOMCheckedby` (`CheckedBy`),
  KEY `nk_BOMCreatedBy` (`CreatedBy`),
  CONSTRAINT `nk_BOMCheckedby` FOREIGN KEY (`CheckedBy`) REFERENCES `Person` (`PersonID`),
  CONSTRAINT `nk_BOMCreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `BOMVerificationDetails` */

/*Table structure for table `Department` */

DROP TABLE IF EXISTS `Department`;

CREATE TABLE `Department` (
  `DepartmentID` varchar(255) NOT NULL,
  `Department` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=5461 ROW_FORMAT=DYNAMIC;

/*Data for the table `Department` */

insert  into `Department`(`DepartmentID`,`Department`) values 
('84949eb1-e816-11ee-b439-0ac93defbbf1','IQCP'),
('849684af-e816-11ee-b439-0ac93defbbf1','FQC'),
('849b50dd-e816-11ee-b439-0ac93defbbf1','IPQC');

/*Table structure for table `Designation` */

DROP TABLE IF EXISTS `Designation`;

CREATE TABLE `Designation` (
  `DesignationID` varchar(255) NOT NULL,
  `Designation` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`DesignationID`),
  UNIQUE KEY `DesignationID` (`DesignationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC;

/*Data for the table `Designation` */

insert  into `Designation`(`DesignationID`,`Designation`) values 
('1af9d9f7-e817-11ee-b439-0ac93defbbf1','QC'),
('d66d6ab7-e2ab-11ee-974e-12d6db81f661','Admin'),
('d66db440-e2ab-11ee-974e-12d6db81f661','Super Admin');

/*Table structure for table `FQCDetails` */

DROP TABLE IF EXISTS `FQCDetails`;

CREATE TABLE `FQCDetails` (
  `FQCDetailId` varchar(255) NOT NULL,
  `ProductSpecs` varchar(255) DEFAULT NULL,
  `ProductBatchNo` varchar(255) DEFAULT NULL,
  `PartyName` varchar(255) DEFAULT NULL,
  `PackingDate` varchar(255) DEFAULT NULL,
  `ReportNumber` varchar(255) DEFAULT NULL,
  `DateOfQualityCheck` varchar(255) DEFAULT NULL,
  `DocumentNo` varchar(255) DEFAULT NULL,
  `RevNo` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Pdf` varchar(255) DEFAULT NULL,
  `Result` varchar(255) DEFAULT NULL,
  `CheckTypes` longtext,
  `Reason` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `Product` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FQCDetailId`),
  KEY `CreatedBy` (`CreatedBy`),
  CONSTRAINT `FQCDetails_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FQCDetails` */

/*Table structure for table `FQCTest` */

DROP TABLE IF EXISTS `FQCTest`;

CREATE TABLE `FQCTest` (
  `FQCId` varchar(255) DEFAULT NULL,
  `FQCDetailId` varchar(255) DEFAULT NULL,
  `Sample1` longtext,
  `Sample2` longtext,
  `Sample3` longtext,
  UNIQUE KEY `FQCId` (`FQCId`),
  KEY `FQCDetailId` (`FQCDetailId`),
  CONSTRAINT `FQCTest_ibfk_1` FOREIGN KEY (`FQCDetailId`) REFERENCES `FQCDetails` (`FQCDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FQCTest` */

/*Table structure for table `Framing` */

DROP TABLE IF EXISTS `Framing`;

CREATE TABLE `Framing` (
  `FramingId` varchar(255) DEFAULT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `Sample` varchar(55) DEFAULT NULL,
  `FramingObservation` longtext,
  `FramingDimension` longtext,
  UNIQUE KEY `FramingId` (`FramingId`),
  KEY `PreLamDetailId` (`PreLamDetailId`),
  CONSTRAINT `Framing_ibfk_1` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Framing` */

/*Table structure for table `IQCSolar` */

DROP TABLE IF EXISTS `IQCSolar`;

CREATE TABLE `IQCSolar` (
  `IQCSolarID` varchar(255) DEFAULT NULL,
  `SolarDetailID` varchar(155) DEFAULT NULL,
  `CheckType` varchar(155) DEFAULT NULL,
  `Characterstics` varchar(255) DEFAULT NULL,
  `MeasuringMethod` varchar(255) DEFAULT NULL,
  `Sampling` varchar(255) DEFAULT NULL,
  `Reference` varchar(155) DEFAULT NULL,
  `AcceptanceCriteria` varchar(255) DEFAULT NULL,
  `SampleSize` varchar(255) DEFAULT NULL,
  `Samples` longtext,
  `CreatedDate` varchar(255) DEFAULT NULL,
  `UpdatedDate` varchar(255) DEFAULT NULL,
  KEY `nk_SolarDetailID` (`SolarDetailID`),
  CONSTRAINT `nk_SolarDetailID` FOREIGN KEY (`SolarDetailID`) REFERENCES `IQCSolarDetails` (`SolarDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=910 ROW_FORMAT=DYNAMIC;

/*Data for the table `IQCSolar` */

insert  into `IQCSolar`(`IQCSolarID`,`SolarDetailID`,`CheckType`,`Characterstics`,`MeasuringMethod`,`Sampling`,`Reference`,`AcceptanceCriteria`,`SampleSize`,`Samples`,`CreatedDate`,`UpdatedDate`) values 
('da9d68c6-5d6e-4ae6-b4b7-67943295fe94','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"8904109402012\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','04-04-2024 11:15:55',''),
('525ce376-a742-42cc-b52c-2f0a9b3eedf3','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','8','[{\"VisualSampleBarcode1\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0521\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0485\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0567\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"},{\"VisualSampleBarcode4\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0527\",\"VisualSampleTest4\":true,\"VisualSampleRemarks4\":\"\"},{\"VisualSampleBarcode5\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0614\",\"VisualSampleTest5\":true,\"VisualSampleRemarks5\":\"\"},{\"VisualSampleBarcode6\":\"05/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0640\",\"VisualSampleTest6\":true,\"VisualSampleRemarks6\":\"\"},{\"VisualSampleBarcode7\":\"05/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0584\",\"VisualSampleTest7\":true,\"VisualSampleRemarks7\":\"\"},{\"VisualSampleBarcode8\":\"07/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0635\",\"VisualSampleTest8\":true,\"VisualSampleRemarks8\":\"\"}]','04-04-2024 11:15:55',''),
('4ace0710-da59-490f-a3ad-5f11cc4b0d23','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','8','[{\"PhysicalSampleBarcode1\":\"07/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0635\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"},{\"PhysicalSampleBarcode2\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0567\",\"PhysicalSampleTest2\":true,\"PhysicalSampleRemarks2\":\"\"},{\"PhysicalSampleBarcode3\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0485\",\"PhysicalSampleTest3\":true,\"PhysicalSampleRemarks3\":\"\"},{\"PhysicalSampleBarcode4\":\"05/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0640\",\"PhysicalSampleTest4\":true,\"PhysicalSampleRemarks4\":\"\"},{\"PhysicalSampleBarcode5\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0567\",\"PhysicalSampleTest5\":true,\"PhysicalSampleRemarks5\":\"\"},{\"PhysicalSampleBarcode6\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0614\",\"PhysicalSampleTest6\":true,\"PhysicalSampleRemarks6\":\"\"},{\"PhysicalSampleBarcode7\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0527\",\"PhysicalSampleTest7\":true,\"PhysicalSampleRemarks7\":\"\"},{\"PhysicalSampleBarcode8\":\"05/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0584\",\"PhysicalSampleTest8\":true,\"PhysicalSampleRemarks8\":\"\"}]','04-04-2024 11:15:55',''),
('49daea52-baf3-4708-a541-440af543e110','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"FrontbusSampleBarcode1\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0521\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"},{\"FrontbusSampleBarcode2\":\"07/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0635\",\"FrontbusSampleTest2\":true,\"FrontbusSampleRemarks2\":\"\"},{\"FrontbusSampleBarcode3\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0614\",\"FrontbusSampleTest3\":true,\"FrontbusSampleRemarks3\":\"\"},{\"FrontbusSampleBarcode4\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0527\",\"FrontbusSampleTest4\":true,\"FrontbusSampleRemarks4\":\"\"},{\"FrontbusSampleBarcode5\":\"05/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0584\",\"FrontbusSampleTest5\":true,\"FrontbusSampleRemarks5\":\"\"}]','04-04-2024 11:15:55',''),
('de609b9d-2300-4764-b40a-5d2e304386b5','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','1','[{\"VerificationSampleBarcode1\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0527\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"}]','04-04-2024 11:15:55',''),
('6fcd267b-187d-4a71-b44c-0a93ebf92535','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"ElectricalSampleBarcode1\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0527\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','04-04-2024 11:15:55',''),
('da64c280-751a-4ca9-a7e7-3af60e9bf4e4','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"PerformanceSampleBarcode1\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0614\",\"PerformanceSampleTest1\":true,\"PerformanceSampleRemarks1\":\"\"},{\"PerformanceSampleBarcode2\":\"06/120/22.70/MB/H/0.00/0/T4/240122/Y-B/A/PERC/M/182/10/0527\",\"PerformanceSampleTest2\":true,\"PerformanceSampleRemarks2\":\"\"},{\"PerformanceSampleBarcode3\":\"05/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0584\",\"PerformanceSampleTest3\":true,\"PerformanceSampleRemarks3\":\"\"},{\"PerformanceSampleBarcode4\":\"05/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0584\",\"PerformanceSampleTest4\":true,\"PerformanceSampleRemarks4\":\"\"},{\"PerformanceSampleBarcode5\":\"08/120/22.70/MB/H/0.00/0/T4/240122/Y-A/A/PERC/M/182/10/0521\",\"PerformanceSampleTest5\":true,\"PerformanceSampleRemarks5\":\"\"}]','04-04-2024 11:15:55',''),
('aab25956-0bfa-4dcc-b817-ceff2dfbd81f','a426b3c5-95da-4339-9b57-7123376d4c04','Packaging','Packing (Make Type)','','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"HXJ01717\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','04-04-2024 11:49:22',''),
('07ee6cc4-4b67-4a30-bddf-acadb1193844','a426b3c5-95da-4339-9b57-7123376d4c04','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"VisualSampleBarcode1\":\"6XK00461\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"HXJ01740\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"HXJ01734\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"},{\"VisualSampleBarcode4\":\"HXJ01743\",\"VisualSampleTest4\":true,\"VisualSampleRemarks4\":\"\"},{\"VisualSampleBarcode5\":\"HXJ01750\",\"VisualSampleTest5\":true,\"VisualSampleRemarks5\":\"\"}]','04-04-2024 11:49:22',''),
('45ed1a46-8fba-4737-b35b-2d00c5e5e664','a426b3c5-95da-4339-9b57-7123376d4c04','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"PhysicalSampleBarcode1\":\"HXJ01717\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"},{\"PhysicalSampleBarcode2\":\"HXJ01740\",\"PhysicalSampleTest2\":true,\"PhysicalSampleRemarks2\":\"\"},{\"PhysicalSampleBarcode3\":\"HXJ01734\",\"PhysicalSampleTest3\":true,\"PhysicalSampleRemarks3\":\"\"},{\"PhysicalSampleBarcode4\":\"HXJ01743\",\"PhysicalSampleTest4\":true,\"PhysicalSampleRemarks4\":\"\"},{\"PhysicalSampleBarcode5\":\"HXJ01750\",\"PhysicalSampleTest5\":true,\"PhysicalSampleRemarks5\":\"\"}]','04-04-2024 11:49:22',''),
('facb582d-b6c7-4d6e-b94b-0b2fe4f33da9','a426b3c5-95da-4339-9b57-7123376d4c04','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"FrontbusSampleBarcode1\":\"HXJ01717\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"}]','04-04-2024 11:49:22',''),
('28df095e-526f-441d-a32f-55cf29ff6351','a426b3c5-95da-4339-9b57-7123376d4c04','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','5','[{\"VerificationSampleBarcode1\":\"HXJ01717\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"HXJ01740\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"HXJ01734\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"},{\"VerificationSampleBarcode4\":\"HXJ01743\",\"VerificationSampleTest4\":true,\"VerificationSampleRemarks4\":\"\"},{\"VerificationSampleBarcode5\":\"HXJ01750\",\"VerificationSampleTest5\":true,\"VerificationSampleRemarks5\":\"\"}]','04-04-2024 11:49:22',''),
('d31979a1-6f86-449b-95d6-0ee04f4be00b','a426b3c5-95da-4339-9b57-7123376d4c04','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"ElectricalSampleBarcode1\":\"https://drive.google.com/file/d/1e5cIKV84pV3rcEXNgECWWbyKqsq_wJDC/view?usp=sha\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','04-04-2024 11:49:22',''),
('1b7b6455-5eb2-4309-a4f1-84ead01b69f3','38a75356-e6c6-4f09-a0a4-bd2409edd08b','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[]','05-04-2024 09:34:12',''),
('a7f3dccd-f634-4114-8329-284bb5536dbd','38a75356-e6c6-4f09-a0a4-bd2409edd08b','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','','[]','05-04-2024 09:34:12',''),
('8bf9113c-a291-4b69-89df-79be917d506d','38a75356-e6c6-4f09-a0a4-bd2409edd08b','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','','[]','05-04-2024 09:34:12',''),
('be6933b5-bd34-4d1c-9493-227834cb2063','38a75356-e6c6-4f09-a0a4-bd2409edd08b','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[]','05-04-2024 09:34:12',''),
('5f0d3b3a-ffc6-4c05-8454-047ac4fe0565','38a75356-e6c6-4f09-a0a4-bd2409edd08b','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','','[]','05-04-2024 09:34:12',''),
('bd90dcc8-b60e-411d-bff9-8794977e8ecd','38a75356-e6c6-4f09-a0a4-bd2409edd08b','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[]','05-04-2024 09:34:12',''),
('7fc9af61-4f25-4f36-8ff1-35e3115f7a0f','38a75356-e6c6-4f09-a0a4-bd2409edd08b','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[]','05-04-2024 09:34:12',''),
('30ab75a2-195a-4ec1-9586-485a924481e8','6f7a9344-6c73-4cb0-812f-d88512732728','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"CM2403136C26L28DAWD0001\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','05-04-2024 10:01:50',''),
('cbe95b8d-05a1-4a64-a7c7-aeb96b8b042c','6f7a9344-6c73-4cb0-812f-d88512732728','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','8','[{\"VisualSampleBarcode1\":\"CM2403136C26L28DAWD0001\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"CM2403136C19L28DAWD0001\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"CM2403126B24L28DAWD0015\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"},{\"VisualSampleBarcode4\":\"CM2403126B24L28DAWD0015\",\"VisualSampleTest4\":true,\"VisualSampleRemarks4\":\"\"},{\"VisualSampleBarcode5\":\"CM2403126B23L28DAWD0006\",\"VisualSampleTest5\":true,\"VisualSampleRemarks5\":\"\"},{\"VisualSampleBarcode6\":\"CM2403136C24L28DAWD0003\",\"VisualSampleTest6\":true,\"VisualSampleRemarks6\":\"\"},{\"VisualSampleBarcode7\":\"CM2403126B21L28DAWD0004\",\"VisualSampleTest7\":true,\"VisualSampleRemarks7\":\"\"},{\"VisualSampleBarcode8\":\"CM2403136C23L28DAWD0001\",\"VisualSampleTest8\":true,\"VisualSampleRemarks8\":\"\"}]','05-04-2024 10:01:50',''),
('0dd06df5-fa8e-4b5f-9bab-95b0dc1c2907','6f7a9344-6c73-4cb0-812f-d88512732728','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','8','[{\"PhysicalSampleBarcode1\":\"CM2403136C26L28DAWD0001\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"},{\"PhysicalSampleBarcode2\":\"CM2403136C19L28DAWD0001\",\"PhysicalSampleTest2\":true,\"PhysicalSampleRemarks2\":\"\"},{\"PhysicalSampleBarcode3\":\"CM2403126B24L28DAWD0015\",\"PhysicalSampleTest3\":true,\"PhysicalSampleRemarks3\":\"\"},{\"PhysicalSampleBarcode4\":\"CM2403126B23L28DAWD0006\",\"PhysicalSampleTest4\":true,\"PhysicalSampleRemarks4\":\"\"},{\"PhysicalSampleBarcode5\":\"CM2403136C24L28DAWD0003\",\"PhysicalSampleTest5\":true,\"PhysicalSampleRemarks5\":\"\"},{\"PhysicalSampleBarcode6\":\"CM2403126B21L28DAWD0004\",\"PhysicalSampleTest6\":true,\"PhysicalSampleRemarks6\":\"\"},{\"PhysicalSampleBarcode7\":\"CM2403136C23L28DAWD0001\",\"PhysicalSampleTest7\":true,\"PhysicalSampleRemarks7\":\"\"},{\"PhysicalSampleBarcode8\":\"CM2403126B24L28DAWD0012\",\"PhysicalSampleTest8\":true,\"PhysicalSampleRemarks8\":\"\"}]','05-04-2024 10:01:50',''),
('2b64be10-c45b-475e-a3c0-8b9d5e1a3d95','6f7a9344-6c73-4cb0-812f-d88512732728','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"FrontbusSampleBarcode1\":\"CM2403126B24L28DAWD0012\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"},{\"FrontbusSampleBarcode2\":\"CM2403136C23L28DAWD0001\",\"FrontbusSampleTest2\":true,\"FrontbusSampleRemarks2\":\"\"},{\"FrontbusSampleBarcode3\":\"CM2403126B21L28DAWD0004\",\"FrontbusSampleTest3\":true,\"FrontbusSampleRemarks3\":\"\"},{\"FrontbusSampleBarcode4\":\"CM2403136C24L28DAWD0003\",\"FrontbusSampleTest4\":true,\"FrontbusSampleRemarks4\":\"\"},{\"FrontbusSampleBarcode5\":\"CM2403126B23L28DAWD0006\",\"FrontbusSampleTest5\":true,\"FrontbusSampleRemarks5\":\"\"}]','05-04-2024 10:01:50',''),
('709cbd39-3ac3-4701-a24d-7a865036dc1c','6f7a9344-6c73-4cb0-812f-d88512732728','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','8','[{\"VerificationSampleBarcode1\":\"CM2403126B24L28DAWD0012\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"CM2403136C23L28DAWD0001\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"CM2403126B21L28DAWD0004\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"},{\"VerificationSampleBarcode4\":\"CM2403136C24L28DAWD0003\",\"VerificationSampleTest4\":true,\"VerificationSampleRemarks4\":\"\"},{\"VerificationSampleBarcode5\":\"CM2403126B23L28DAWD0006\",\"VerificationSampleTest5\":true,\"VerificationSampleRemarks5\":\"\"},{\"VerificationSampleBarcode6\":\"CM2403126B24L28DAWD0015\",\"VerificationSampleTest6\":true,\"VerificationSampleRemarks6\":\"\"},{\"VerificationSampleBarcode7\":\"CM2403136C19L28DAWD0001\",\"VerificationSampleTest7\":true,\"VerificationSampleRemarks7\":\"\"},{\"VerificationSampleBarcode8\":\"CM2403136C26L28DAWD0001\",\"VerificationSampleTest8\":true,\"VerificationSampleRemarks8\":\"\"}]','05-04-2024 10:01:50',''),
('f497c323-2cd1-46a4-b1ed-6bcd3b25ad61','6f7a9344-6c73-4cb0-812f-d88512732728','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"ElectricalSampleBarcode1\":\"GS03550M03324002622\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','05-04-2024 10:01:50',''),
('924c064f-e560-45f2-995a-24e3fd94978c','6f7a9344-6c73-4cb0-812f-d88512732728','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"PerformanceSampleBarcode1\":\"CM2403126B24L28DAWD0012\",\"PerformanceSampleTest1\":true,\"PerformanceSampleRemarks1\":\"\"},{\"PerformanceSampleBarcode2\":\"CM2403136C23L28DAWD0001\",\"PerformanceSampleTest2\":true,\"PerformanceSampleRemarks2\":\"\"},{\"PerformanceSampleBarcode3\":\"CM2403126B21L28DAWD0004\",\"PerformanceSampleTest3\":true,\"PerformanceSampleRemarks3\":\"\"},{\"PerformanceSampleBarcode4\":\"CM2403136C24L28DAWD0003\",\"PerformanceSampleTest4\":true,\"PerformanceSampleRemarks4\":\"\"},{\"PerformanceSampleBarcode5\":\"CM2403126B23L28DAWD0006\",\"PerformanceSampleTest5\":true,\"PerformanceSampleRemarks5\":\"\"}]','05-04-2024 10:01:50',''),
('96ff859d-4d1f-486a-b6be-abdae6b8e9eb','ebe90854-e71b-4eaf-a946-0638c26efad9','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[]','05-04-2024 10:06:03',''),
('5d22b850-3dd5-497e-9e97-8651716fba88','ebe90854-e71b-4eaf-a946-0638c26efad9','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','','[]','05-04-2024 10:06:03',''),
('3be2b61f-4c1d-40c7-bfd8-acddf3dc7e19','ebe90854-e71b-4eaf-a946-0638c26efad9','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','','[]','05-04-2024 10:06:03',''),
('a7f1438b-326c-4ab0-a372-88eab27dc121','ebe90854-e71b-4eaf-a946-0638c26efad9','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[]','05-04-2024 10:06:03',''),
('a0342f5f-a894-49ab-8f19-e295a2f71399','ebe90854-e71b-4eaf-a946-0638c26efad9','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','','[]','05-04-2024 10:06:03',''),
('493ba610-9a57-4b06-8a0e-72be9206e863','ebe90854-e71b-4eaf-a946-0638c26efad9','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[]','05-04-2024 10:06:03',''),
('5920d8ac-cd21-44b5-9771-210ffb750493','ebe90854-e71b-4eaf-a946-0638c26efad9','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[]','05-04-2024 10:06:03',''),
('976cccf3-64af-427f-ad81-783c437da476','e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','Packaging','Packing (Make Type)','','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"HXJ01753\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','05-04-2024 10:14:36',''),
('7c4ffbd8-31d2-4531-b5cf-7535e0699897','e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"VisualSampleBarcode1\":\"HXJ01747\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"HXJ01754\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"HXJ01748\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"},{\"VisualSampleBarcode4\":\"HXJ01746\",\"VisualSampleTest4\":true,\"VisualSampleRemarks4\":\"\"},{\"VisualSampleBarcode5\":\"HXJ01745\",\"VisualSampleTest5\":true,\"VisualSampleRemarks5\":\"\"}]','05-04-2024 10:14:36',''),
('891c4ab6-c7f3-4f58-8b85-0918b40c1b97','e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','1','[{\"PhysicalSampleBarcode1\":\"HXJ01746\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"}]','05-04-2024 10:14:36',''),
('5614adad-498b-4652-97b1-f03302cafb4c','e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"FrontbusSampleBarcode1\":\"HXJ01746\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"}]','05-04-2024 10:14:36',''),
('a67f8f7d-c3d9-4896-a01d-46c3f745cd1e','e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','5','[{\"VerificationSampleBarcode1\":\"HXJ01736\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"HXJ01753\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"HXJ01747\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"},{\"VerificationSampleBarcode4\":\"HXJ01749\",\"VerificationSampleTest4\":true,\"VerificationSampleRemarks4\":\"\"},{\"VerificationSampleBarcode5\":\"HXJ01748\",\"VerificationSampleTest5\":true,\"VerificationSampleRemarks5\":\"\"}]','05-04-2024 10:14:36',''),
('8c391200-8c69-45f1-9e85-e81b8dd81a65','e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"ElectricalSampleBarcode1\":\"HXJ01753\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','05-04-2024 10:14:36',''),
('daa6777a-01f7-4881-be05-bc4d074642ec','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[]','05-04-2024 10:38:48',''),
('b53782f4-81b3-4b8a-8e9e-fad398e1cdd8','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','','[]','05-04-2024 10:38:48',''),
('a22db8d2-a80d-4acd-b185-278f7b00c49a','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','','[]','05-04-2024 10:38:48',''),
('d71ccc24-d376-4b85-9c02-76e85fc626af','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[]','05-04-2024 10:38:48',''),
('89b7262f-558b-4c22-91d5-ed07675dcf7c','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','','[]','05-04-2024 10:38:48',''),
('264ba8e9-6b79-4f0a-b45f-9b00a8d69315','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[]','05-04-2024 10:38:48',''),
('f5343857-06a2-4ecd-a6c4-be635fce9a70','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[]','05-04-2024 10:38:48',''),
('02a3377d-7f24-482c-8706-d6af0acd1279','ba718e76-e589-4d0d-a5c9-84bac0c411cb','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"22.8-7.53W  HRM1-1.53A120H72023/11/17\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','12-04-2024 03:35:41',''),
('7c7fd2b6-2825-4622-a043-2306afcf2168','ba718e76-e589-4d0d-a5c9-84bac0c411cb','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','8','[{\"VisualSampleBarcode1\":\"22.8-7.53W  HRM1-1.53A120H72023/11/17\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"22.8-7.53W  HRM1-1.53A120H62023/11/17\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"22.8-7.53W  HRM1-1.53A120H32023/11/17\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"},{\"VisualSampleBarcode4\":\"22.8-7.53W  HRM1-1.53A120H32023/11/17\",\"VisualSampleTest4\":true,\"VisualSampleRemarks4\":\"\"},{\"VisualSampleBarcode5\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"VisualSampleTest5\":true,\"VisualSampleRemarks5\":\"\"},{\"VisualSampleBarcode6\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"VisualSampleTest6\":true,\"VisualSampleRemarks6\":\"\"},{\"VisualSampleBarcode7\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"VisualSampleTest7\":true,\"VisualSampleRemarks7\":\"\"},{\"VisualSampleBarcode8\":\"22.8-7.53W  HRM1-1.53A120H92023/11/17\",\"VisualSampleTest8\":true,\"VisualSampleRemarks8\":\"\"}]','12-04-2024 03:35:41',''),
('3aedbf4e-6e4c-440e-95b7-76123ef03402','ba718e76-e589-4d0d-a5c9-84bac0c411cb','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','8','[{\"PhysicalSampleBarcode1\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"},{\"PhysicalSampleBarcode2\":\"22.8-7.53W  HRM1-1.53A120H62023/11/17\",\"PhysicalSampleTest2\":true,\"PhysicalSampleRemarks2\":\"\"},{\"PhysicalSampleBarcode3\":\"22.8-7.53W  HRM1-1.53A120H72023/11/17\",\"PhysicalSampleTest3\":true,\"PhysicalSampleRemarks3\":\"\"},{\"PhysicalSampleBarcode4\":\"22.8-7.53W  HRM1-1.53A120H22023/11/17\",\"PhysicalSampleTest4\":true,\"PhysicalSampleRemarks4\":\"\"},{\"PhysicalSampleBarcode5\":\"22.8-7.53W  HRM1-1.53A120H32023/11/17\",\"PhysicalSampleTest5\":true,\"PhysicalSampleRemarks5\":\"\"},{\"PhysicalSampleBarcode6\":\"22.8-7.53W  HRM1-1.53A120H22023/11/17\",\"PhysicalSampleTest6\":true,\"PhysicalSampleRemarks6\":\"\"},{\"PhysicalSampleBarcode7\":\"22.8-7.53W  HRM1-1.53A120H92023/11/17\",\"PhysicalSampleTest7\":true,\"PhysicalSampleRemarks7\":\"\"},{\"PhysicalSampleBarcode8\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"PhysicalSampleTest8\":true,\"PhysicalSampleRemarks8\":\"\"}]','12-04-2024 03:35:41',''),
('168a7d3b-bec2-4bfb-ae97-bfc42761a450','ba718e76-e589-4d0d-a5c9-84bac0c411cb','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"FrontbusSampleBarcode1\":\"22.8-7.53W  HRM1-1.53A120H92023/11/17\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"},{\"FrontbusSampleBarcode2\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"FrontbusSampleTest2\":true,\"FrontbusSampleRemarks2\":\"\"},{\"FrontbusSampleBarcode3\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"FrontbusSampleTest3\":true,\"FrontbusSampleRemarks3\":\"\"},{\"FrontbusSampleBarcode4\":\"22.8-7.53W  HRM1-1.53A120H62023/11/17\",\"FrontbusSampleTest4\":true,\"FrontbusSampleRemarks4\":\"\"},{\"FrontbusSampleBarcode5\":\"22.8-7.53W  HRM1-1.53A120H72023/11/17\",\"FrontbusSampleTest5\":true,\"FrontbusSampleRemarks5\":\"\"}]','12-04-2024 03:35:41',''),
('f8a1ed87-b4b2-4689-acac-1f5e1b195a08','ba718e76-e589-4d0d-a5c9-84bac0c411cb','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','8','[{\"VerificationSampleBarcode1\":\"22.8-7.53W  HRM1-1.53A120H92023/11/17\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"22.8-7.53W  HRM1-1.53A120H92023/11/17\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"},{\"VerificationSampleBarcode4\":\"22.8-7.53W  HRM1-1.53A120H62023/11/17\",\"VerificationSampleTest4\":true,\"VerificationSampleRemarks4\":\"\"},{\"VerificationSampleBarcode5\":\"22.8-7.53W  HRM1-1.53A120H72023/11/17\",\"VerificationSampleTest5\":true,\"VerificationSampleRemarks5\":\"\"},{\"VerificationSampleBarcode6\":\"22.8-7.53W  HRM1-1.53A120H22023/11/17\",\"VerificationSampleTest6\":true,\"VerificationSampleRemarks6\":\"\"},{\"VerificationSampleBarcode7\":\"22.8-7.53W  HRM1-1.53A120H32023/11/17\",\"VerificationSampleTest7\":true,\"VerificationSampleRemarks7\":\"\"},{\"VerificationSampleBarcode8\":\"22.8-7.53W  HRM1-1.53A120H22023/11/17\",\"VerificationSampleTest8\":true,\"VerificationSampleRemarks8\":\"\"}]','12-04-2024 03:35:41',''),
('ce687f4c-67c4-4828-9225-e1cc76e45937','ba718e76-e589-4d0d-a5c9-84bac0c411cb','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"ElectricalSampleBarcode1\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','12-04-2024 03:35:41',''),
('bd315243-4a5b-4cda-9aff-8fe447c7fb08','ba718e76-e589-4d0d-a5c9-84bac0c411cb','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"PerformanceSampleBarcode1\":\"22.8-7.53W  HRM1-1.53A120H22023/11/17\",\"PerformanceSampleTest1\":true,\"PerformanceSampleRemarks1\":\"\"},{\"PerformanceSampleBarcode2\":\"22.8-7.53W  HRM1-1.53A120H32023/11/17\",\"PerformanceSampleTest2\":true,\"PerformanceSampleRemarks2\":\"\"},{\"PerformanceSampleBarcode3\":\"22.8-7.53W  HRM1-1.53A120H22023/11/17\",\"PerformanceSampleTest3\":true,\"PerformanceSampleRemarks3\":\"\"},{\"PerformanceSampleBarcode4\":\"22.8-7.53W  HRM1-1.53A120H52023/11/17\",\"PerformanceSampleTest4\":true,\"PerformanceSampleRemarks4\":\"\"},{\"PerformanceSampleBarcode5\":\"22.8-7.53W  HRM1-1.53A120H62023/11/17\",\"PerformanceSampleTest5\":true,\"PerformanceSampleRemarks5\":\"\"}]','12-04-2024 03:35:41',''),
('ae44d6c2-a9ff-40e7-8114-635275f9d754','a1f89a88-ffa9-4b0a-a454-32609133b586','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"101061323113241L1140A240401BL4000\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','15-04-2024 04:13:00',''),
('aab2bf2d-451d-4493-86cd-e65fddb25e63','a1f89a88-ffa9-4b0a-a454-32609133b586','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','8','[{\"VisualSampleBarcode1\":\"101061323113241L1140A240401BL4000\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"101061323113241L1140A240329BL4007\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"101061323113241L1140A240330B04004\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"},{\"VisualSampleBarcode4\":\"101061323113241L1140A240330BL1016\",\"VisualSampleTest4\":true,\"VisualSampleRemarks4\":\"\"},{\"VisualSampleBarcode5\":\"101061323113241L1140A240330BL1015\",\"VisualSampleTest5\":true,\"VisualSampleRemarks5\":\"\"},{\"VisualSampleBarcode6\":\"101061323113241L1140A240330BL1018\",\"VisualSampleTest6\":true,\"VisualSampleRemarks6\":\"\"},{\"VisualSampleBarcode7\":\"101061323113241L1140A240331BL1002\",\"VisualSampleTest7\":true,\"VisualSampleRemarks7\":\"\"},{\"VisualSampleBarcode8\":\"101061323113241L1140A240330BL2006\",\"VisualSampleTest8\":true,\"VisualSampleRemarks8\":\"\"}]','15-04-2024 04:13:00',''),
('7f0acbfc-e677-4609-b753-bb76604b8188','a1f89a88-ffa9-4b0a-a454-32609133b586','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','8','[{\"PhysicalSampleBarcode1\":\"101061323113241L1140A240331BL1002\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"},{\"PhysicalSampleBarcode2\":\"101061323113241L1140A240330BL1015\",\"PhysicalSampleTest2\":true,\"PhysicalSampleRemarks2\":\"\"},{\"PhysicalSampleBarcode3\":\"101061323113241L1140A240330B04004\",\"PhysicalSampleTest3\":true,\"PhysicalSampleRemarks3\":\"\"},{\"PhysicalSampleBarcode4\":\"101061323113241L1140A240329BL4007\",\"PhysicalSampleTest4\":true,\"PhysicalSampleRemarks4\":\"\"},{\"PhysicalSampleBarcode5\":\"101061323113241L1140A240330BL2006\",\"PhysicalSampleTest5\":true,\"PhysicalSampleRemarks5\":\"\"},{\"PhysicalSampleBarcode6\":\"101061323113241L1140A240330BL1018\",\"PhysicalSampleTest6\":true,\"PhysicalSampleRemarks6\":\"\"},{\"PhysicalSampleBarcode7\":\"101061323113241L1140A240330BL1016\",\"PhysicalSampleTest7\":true,\"PhysicalSampleRemarks7\":\"\"},{\"PhysicalSampleBarcode8\":\"101061323113241L1140A240401BL4000\",\"PhysicalSampleTest8\":true,\"PhysicalSampleRemarks8\":\"\"}]','15-04-2024 04:13:00',''),
('620ad233-401a-4620-80d2-81bfa2cecd86','a1f89a88-ffa9-4b0a-a454-32609133b586','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"FrontbusSampleBarcode1\":\"3928271188111\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"},{\"FrontbusSampleBarcode2\":\"101061323113241L1140A240330BL1015\",\"FrontbusSampleTest2\":true,\"FrontbusSampleRemarks2\":\"\"},{\"FrontbusSampleBarcode3\":\"101061323113241L1140A240330B04004\",\"FrontbusSampleTest3\":true,\"FrontbusSampleRemarks3\":\"\"},{\"FrontbusSampleBarcode4\":\"101061323113241L1140A240329BL4007\",\"FrontbusSampleTest4\":true,\"FrontbusSampleRemarks4\":\"\"},{\"FrontbusSampleBarcode5\":\"101061323113241L1140A240330BL2006\",\"FrontbusSampleTest5\":true,\"FrontbusSampleRemarks5\":\"\"}]','15-04-2024 04:13:00',''),
('113e90d2-3ecb-441d-ad98-e9d6cc51559b','a1f89a88-ffa9-4b0a-a454-32609133b586','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','8','[{\"VerificationSampleBarcode1\":\"101061323113241L1140A240330BL2006\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"101061323113241L1140A240330BL1018\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"101061323113241L1140A240330BL1016\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"},{\"VerificationSampleBarcode4\":\"101061323113241L1140A240401BL4000\",\"VerificationSampleTest4\":true,\"VerificationSampleRemarks4\":\"\"},{\"VerificationSampleBarcode5\":\"101061323113241L1140A240331BL1002\",\"VerificationSampleTest5\":true,\"VerificationSampleRemarks5\":\"\"},{\"VerificationSampleBarcode6\":\"101061323113241L1140A240330BL1015\",\"VerificationSampleTest6\":true,\"VerificationSampleRemarks6\":\"\"},{\"VerificationSampleBarcode7\":\"101061323113241L1140A240330BL1015\",\"VerificationSampleTest7\":true,\"VerificationSampleRemarks7\":\"\"},{\"VerificationSampleBarcode8\":\"101061323113241L1140A240329BL4007\",\"VerificationSampleTest8\":true,\"VerificationSampleRemarks8\":\"\"}]','15-04-2024 04:13:00',''),
('ff5be73b-23e0-4211-961e-aae5ca22806f','a1f89a88-ffa9-4b0a-a454-32609133b586','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"ElectricalSampleBarcode1\":\"UTL0424GS5400003514\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','15-04-2024 04:13:00',''),
('d25668c1-7dd8-4e23-acad-58d36fd74f19','a1f89a88-ffa9-4b0a-a454-32609133b586','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"PerformanceSampleBarcode1\":\"101061323113241L1140A240330BL2006\",\"PerformanceSampleTest1\":true,\"PerformanceSampleRemarks1\":\"\"},{\"PerformanceSampleBarcode2\":\"101061323113241L1140A240330BL1018\",\"PerformanceSampleTest2\":true,\"PerformanceSampleRemarks2\":\"\"},{\"PerformanceSampleBarcode3\":\"101061323113241L1140A240330BL1016\",\"PerformanceSampleTest3\":true,\"PerformanceSampleRemarks3\":\"\"},{\"PerformanceSampleBarcode4\":\"101061323113241L1140A240401BL4000\",\"PerformanceSampleTest4\":true,\"PerformanceSampleRemarks4\":\"\"},{\"PerformanceSampleBarcode5\":\"101061323113241L1140A240331BL1002\",\"PerformanceSampleTest5\":true,\"PerformanceSampleRemarks5\":\"\"}]','15-04-2024 04:13:00',''),
('a03ad98f-597b-4eea-bfe5-756b1b478d46','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"JM2401273C11S28DAWD3002\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','17-04-2024 05:54:24',''),
('98492161-d80b-4f83-ab98-b4a20cd364ef','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','8','[{\"VisualSampleBarcode1\":\"JM2401273A08S28DAWD3002\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"JM2401273C09S28DAWD3001\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"JM2401273C37S28DAWD3003\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"},{\"VisualSampleBarcode4\":\"JM2401273C37S28DAWD3003\",\"VisualSampleTest4\":true,\"VisualSampleRemarks4\":\"\"},{\"VisualSampleBarcode5\":\"JM2401273C11S28DAWD3002\",\"VisualSampleTest5\":true,\"VisualSampleRemarks5\":\"\"},{\"VisualSampleBarcode6\":\"JM2401273C06S28DAWD3001\",\"VisualSampleTest6\":true,\"VisualSampleRemarks6\":\"\"},{\"VisualSampleBarcode7\":\"JM2401273C06S28DAWD3001\",\"VisualSampleTest7\":true,\"VisualSampleRemarks7\":\"\"},{\"VisualSampleBarcode8\":\"JM2401273A37S28DAWD3001\",\"VisualSampleTest8\":true,\"VisualSampleRemarks8\":\"\"}]','17-04-2024 05:54:24',''),
('0b4f7b83-a730-40ec-bc03-068ef3f547cc','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','8','[{\"PhysicalSampleBarcode1\":\"JM2401273C06S28DAWD3001\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"},{\"PhysicalSampleBarcode2\":\"JM2401273C06S28DAWD3001\",\"PhysicalSampleTest2\":true,\"PhysicalSampleRemarks2\":\"\"},{\"PhysicalSampleBarcode3\":\"JM2401273A01S28DAWD3002\",\"PhysicalSampleTest3\":true,\"PhysicalSampleRemarks3\":\"\"},{\"PhysicalSampleBarcode4\":\"JM2401273A08S28DAWD3002\",\"PhysicalSampleTest4\":true,\"PhysicalSampleRemarks4\":\"\"},{\"PhysicalSampleBarcode5\":\"JM2401273C09S28DAWD3001\",\"PhysicalSampleTest5\":true,\"PhysicalSampleRemarks5\":\"\"},{\"PhysicalSampleBarcode6\":\"JM2401273C09S28DAWD3001\",\"PhysicalSampleTest6\":true,\"PhysicalSampleRemarks6\":\"\"},{\"PhysicalSampleBarcode7\":\"JM2401273C12S28DAWD3004\",\"PhysicalSampleTest7\":true,\"PhysicalSampleRemarks7\":\"\"},{\"PhysicalSampleBarcode8\":\"JM2401273C11S28DAWD3002\",\"PhysicalSampleTest8\":true,\"PhysicalSampleRemarks8\":\"\"}]','17-04-2024 05:54:24',''),
('92e42f0d-bb36-4813-a301-e507540b12e5','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"FrontbusSampleBarcode1\":\"JM2401273C09S28DAWD3001\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"},{\"FrontbusSampleBarcode2\":\"JM2401273C37S28DAWD3003\",\"FrontbusSampleTest2\":true,\"FrontbusSampleRemarks2\":\"\"},{\"FrontbusSampleBarcode3\":\"JM2401273A37S28DAWD3001\",\"FrontbusSampleTest3\":true,\"FrontbusSampleRemarks3\":\"\"},{\"FrontbusSampleBarcode4\":\"JM2401273A01S28DAWD3002\",\"FrontbusSampleTest4\":true,\"FrontbusSampleRemarks4\":\"\"},{\"FrontbusSampleBarcode5\":\"JM2401273A37S28DAWD3001\",\"FrontbusSampleTest5\":true,\"FrontbusSampleRemarks5\":\"\"}]','17-04-2024 05:54:24',''),
('87cc6840-2521-4a28-8b91-e3605b926a1f','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','8','[{\"VerificationSampleBarcode1\":\"JM2401273A37S28DAWD3001\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"JM2401273A01S28DAWD3002\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"JM2401273C06S28DAWD3001\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"},{\"VerificationSampleBarcode4\":\"JM2401273C09S28DAWD3001\",\"VerificationSampleTest4\":true,\"VerificationSampleRemarks4\":\"\"},{\"VerificationSampleBarcode5\":\"JM2401273C37S28DAWD3003\",\"VerificationSampleTest5\":true,\"VerificationSampleRemarks5\":\"\"},{\"VerificationSampleBarcode6\":\"JM2401273C12S28DAWD3004\",\"VerificationSampleTest6\":true,\"VerificationSampleRemarks6\":\"\"},{\"VerificationSampleBarcode7\":\"JM2401273C11S28DAWD3002\",\"VerificationSampleTest7\":true,\"VerificationSampleRemarks7\":\"\"},{\"VerificationSampleBarcode8\":\"JM2401273C12S28DAWD3004\",\"VerificationSampleTest8\":true,\"VerificationSampleRemarks8\":\"\"}]','17-04-2024 05:54:24',''),
('9e3b08ee-81e5-4647-8a6e-dad2d971876a','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"ElectricalSampleBarcode1\":\"ZEP160424M5450198\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','17-04-2024 05:54:24',''),
('ffb22f77-3d58-43a6-b17a-26a101c9dfd3','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"PerformanceSampleBarcode1\":\"JM2401273C12S28DAWD3004\",\"PerformanceSampleTest1\":true,\"PerformanceSampleRemarks1\":\"\"},{\"PerformanceSampleBarcode2\":\"JM2401273C11S28DAWD3002\",\"PerformanceSampleTest2\":true,\"PerformanceSampleRemarks2\":\"\"},{\"PerformanceSampleBarcode3\":\"JM2401273C37S28DAWD3003\",\"PerformanceSampleTest3\":true,\"PerformanceSampleRemarks3\":\"\"},{\"PerformanceSampleBarcode4\":\"JM2401273C09S28DAWD3001\",\"PerformanceSampleTest4\":true,\"PerformanceSampleRemarks4\":\"\"},{\"PerformanceSampleBarcode5\":\"JM2401273C06S28DAWD3001\",\"PerformanceSampleTest5\":true,\"PerformanceSampleRemarks5\":\"\"}]','17-04-2024 05:54:24','');

/*Table structure for table `IQCSolarDetails` */

DROP TABLE IF EXISTS `IQCSolarDetails`;

CREATE TABLE `IQCSolarDetails` (
  `SolarDetailID` varchar(255) NOT NULL,
  `LotSize` varchar(255) DEFAULT NULL,
  `MaterialName` varchar(255) DEFAULT NULL,
  `SupplierName` varchar(55) DEFAULT NULL,
  `QuantityRecd` varchar(55) DEFAULT NULL,
  `InvoiceDate` varchar(55) DEFAULT NULL,
  `SupplierRMBatchNo` varchar(255) DEFAULT NULL,
  `RawMaterialSpecs` varchar(255) DEFAULT NULL,
  `QualityCheckDate` varchar(55) DEFAULT NULL,
  `SampleQuantityCheck` varchar(55) DEFAULT NULL,
  `InvoiceNo` varchar(55) DEFAULT NULL,
  `ReceiptDate` varchar(55) DEFAULT NULL,
  `DocumentNo` varchar(155) DEFAULT NULL,
  `RevisionNo` varchar(155) DEFAULT NULL,
  `CheckedBy` varchar(255) DEFAULT NULL,
  `Status` varchar(155) NOT NULL,
  `COCPdf` varchar(255) DEFAULT NULL,
  `InvoicePdf` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedDate` varchar(155) DEFAULT NULL,
  `UpdatedDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SolarDetailID`),
  KEY `fk_ApprovedBy` (`UpdatedBy`),
  KEY `fk_CheckedBy` (`CheckedBy`),
  CONSTRAINT `fk_CheckedBy` FOREIGN KEY (`CheckedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=4096 ROW_FORMAT=DYNAMIC;

/*Data for the table `IQCSolarDetails` */

insert  into `IQCSolarDetails`(`SolarDetailID`,`LotSize`,`MaterialName`,`SupplierName`,`QuantityRecd`,`InvoiceDate`,`SupplierRMBatchNo`,`RawMaterialSpecs`,`QualityCheckDate`,`SampleQuantityCheck`,`InvoiceNo`,`ReceiptDate`,`DocumentNo`,`RevisionNo`,`CheckedBy`,`Status`,`COCPdf`,`InvoicePdf`,`UpdatedBy`,`CreatedDate`,`UpdatedDate`) values 
('38a75356-e6c6-4f09-a0a4-bd2409edd08b','258063','Solar Cell','Wuxi Amphenol solar energy ','','2024-04-05','0','182×182mm,22.8%','2024-04-05','','AfNCI20240321','2024-04-05','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','05-04-2024 09:34:12',''),
('6f7a9344-6c73-4cb0-812f-d88512732728','258063','Solar Cell','Wuxi Amphenol solar energy ','','2024-04-05','0','182×182mm, 22.8%','2024-04-05','','AFNCI20240321','2024-04-05','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/6f7a9344-6c73-4cb0-812f-d88512732728_null-10.pdf1712311311888369.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/6f7a9344-6c73-4cb0-812f-d88512732728_null-9.pdf1712311311888369.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','05-04-2024 10:01:50','06-04-2024 06:32:10'),
('a1f89a88-ffa9-4b0a-a454-32609133b586','611520','Solar Cell','Wuxi Amphenol energy technology ','','2024-04-03','0','182x182mm','2024-04-15','','AFNCI20240403','2024-04-13','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Pending','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/a1f89a88-ffa9-4b0a-a454-32609133b586_IMG_20240415_094235.jpg1713154380459185.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/a1f89a88-ffa9-4b0a-a454-32609133b586_IMG_20240413_102455.jpg1713154380459185.pdf','','15-04-2024 04:13:00',''),
('a426b3c5-95da-4339-9b57-7123376d4c04','1500','Solar Glass','Borosil Renewables ','','2024-04-04','0','2272X1128X3.2mm','2024-04-04','','9000006208','2024-04-04','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/a426b3c5-95da-4339-9b57-7123376d4c04_DocScanner%20Apr%204%2C%202024%2017-16.pdf1712231362475369.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/a426b3c5-95da-4339-9b57-7123376d4c04_DocScanner%20Apr%204%2C%202024%2017-16.pdf1712231362475369.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','04-04-2024 11:49:22','05-04-2024 07:25:42'),
('ba718e76-e589-4d0d-a5c9-84bac0c411cb','146760','Solar Cell','Jiangxi RS solar energy co Ltd ','','2024-04-05','0','182x182mm','2024-04-12','','PIC20240402-01','2024-04-11','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Pending','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/ba718e76-e589-4d0d-a5c9-84bac0c411cb_DocScanner%20Apr%2012%2C%202024%2009-04.pdf1712892939761349.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/ba718e76-e589-4d0d-a5c9-84bac0c411cb_IMG-20240412-WA0021.jpg1712892939761349.pdf','','12-04-2024 03:35:41',''),
('dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','156348','Solar Cell','wuxi','','2024-04-05','0','182x182mm','2024-04-05','','20240321','2024-04-05','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','05-04-2024 10:38:48',''),
('e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','1500','Solar Glass','Borosil Renewables ','','2024-04-05','01736','2272X1128X3.2mm ','2024-04-05','','9000006314','2024-04-05','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0_DocScanner%20Apr%205%2C%202024%2015-32.pdf1712312076899970.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0_IMG-20240405-WA0049.jpg1712312076899970.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','05-04-2024 10:14:36','06-04-2024 06:27:45'),
('ebe90854-e71b-4eaf-a946-0638c26efad9','191640','Solar Cell','Wuxi Amphenol ','','2024-04-05','0','182x182mm, 22.8%','2024-04-05','','AFNCI20240314-2','2024-04-05','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','05-04-2024 10:06:03',''),
('f4a1b1fb-cb89-4e65-8191-cf37b70707d9','198846','Solar Cell','Solar N Plus New energy','','2024-03-21','0','182×182-22.6%','2024-04-04','','SNP20240315-2','2024-04-04','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/f4a1b1fb-cb89-4e65-8191-cf37b70707d9_IN2436050647.pdf1712229355948240.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/f4a1b1fb-cb89-4e65-8191-cf37b70707d9_Rejection%20Form.pdf1712229355948240.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','04-04-2024 11:15:55','04-04-2024 11:31:51'),
('fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','282240','Solar Cell','Jiangxi RS solar energy tech ','','2024-04-08','0','182X182','2024-04-16','','PIC20240404-01','2024-04-16','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Pending','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9_IMG_20240417_111556.jpg1713333264404916.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IQC/fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9_IMG_20240416_122402.jpg1713333264404916.pdf','','17-04-2024 05:54:24','');

/*Table structure for table `JobCard` */

DROP TABLE IF EXISTS `JobCard`;

CREATE TABLE `JobCard` (
  `JobCardID` varchar(155) DEFAULT NULL,
  `JobCardDetailID` varchar(255) DEFAULT NULL,
  `Process` varchar(255) DEFAULT NULL,
  `EmployeeId` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  KEY `nk_JobCardDetail` (`JobCardDetailID`),
  CONSTRAINT `nk_JobCardDetail` FOREIGN KEY (`JobCardDetailID`) REFERENCES `JobCardDetails` (`JobCardDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=910 ROW_FORMAT=DYNAMIC;

/*Data for the table `JobCard` */

/*Table structure for table `JobCardDetails` */

DROP TABLE IF EXISTS `JobCardDetails`;

CREATE TABLE `JobCardDetails` (
  `JobCardDetailID` varchar(255) NOT NULL,
  `DocNo` varchar(155) DEFAULT NULL,
  `RevisionNo` varchar(155) DEFAULT NULL,
  `RevisonDate` varchar(155) DEFAULT NULL,
  `ModuleType` varchar(155) DEFAULT NULL,
  `ModuleNo` varchar(155) DEFAULT NULL,
  `Date` varchar(155) DEFAULT NULL,
  `MatrixSize` varchar(155) DEFAULT NULL,
  `ReferencePdf` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `Type` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`JobCardDetailID`),
  KEY `JD_PersonId` (`CreatedBy`),
  CONSTRAINT `JD_PersonId` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC;

/*Data for the table `JobCardDetails` */

/*Table structure for table `Person` */

DROP TABLE IF EXISTS `Person`;

CREATE TABLE `Person` (
  `PersonID` varchar(255) NOT NULL,
  `EmployeeID` varchar(255) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `LoginID` varchar(55) DEFAULT NULL,
  `Password` varchar(155) DEFAULT NULL,
  `WorkLocation` varchar(55) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Department` varchar(55) DEFAULT NULL,
  `ProfileImg` varchar(255) DEFAULT NULL,
  `Desgination` varchar(55) DEFAULT NULL,
  `Status` varchar(55) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  UNIQUE KEY `EmployeeID` (`EmployeeID`),
  UNIQUE KEY `LoginID` (`LoginID`),
  KEY `fk_Department` (`Department`),
  KEY `fk_Designation` (`Desgination`),
  KEY `fk_WorkLocation` (`WorkLocation`),
  CONSTRAINT `fk_Department` FOREIGN KEY (`Department`) REFERENCES `Department` (`DepartmentID`),
  CONSTRAINT `fk_Designation` FOREIGN KEY (`Desgination`) REFERENCES `Designation` (`DesignationID`),
  CONSTRAINT `fk_WorkLocation` FOREIGN KEY (`WorkLocation`) REFERENCES `WorkLocation` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 ROW_FORMAT=DYNAMIC;

/*Data for the table `Person` */

insert  into `Person`(`PersonID`,`EmployeeID`,`Name`,`LoginID`,`Password`,`WorkLocation`,`Email`,`Department`,`ProfileImg`,`Desgination`,`Status`,`UpdatedBy`,`UpdatedOn`,`CreatedBy`,`CreatedOn`) values 
('4492b8ad-f26c-11ee-b439-0ac93defbbf1','10328','Johny Kumar','IQC2','Johny@2564','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/4492b8ad-f26c-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,NULL,NULL),
('69fc783b-f732-11ee-b439-0ac93defbbf1','241','Kulbhushan Singh ','IPQC','Kulbhushan@9874','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/69fc783b-f732-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Inactive','08326670-ed04-11ee-b439-0ac93defbbf1','11-04-2024 12:02:25','08326670-ed04-11ee-b439-0ac93defbbf1','10-04-2024 12:03:59'),
('a02cc5c1-f27f-11ee-b439-0ac93defbbf1','462','Ganrav Verma','IPQC1','Ganrav@3657','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/a02cc5c1-f27f-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Inactive',NULL,NULL,NULL,NULL),
('b570e501-f8c7-11ee-b439-0ac93defbbf1','Emp001','Quality Manager','QCM','SuperAdmin@1111','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/b570e501-f8c7-11ee-b439-0ac93defbbf1','d66db440-e2ab-11ee-974e-12d6db81f661','Active','b570e501-f8c7-11ee-b439-0ac93defbbf1','23-04-2024 08:25:44',NULL,NULL),
('f2c75110-f255-11ee-b439-0ac93defbbf1','Emp002','QCM1','QCM1','QCM1@9588','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/f2c75110-f255-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Inactive',NULL,NULL,NULL,NULL),
('fd19940a-f26b-11ee-b439-0ac93defbbf1','2646','Sangraam Kushwaha','IQC1','Sangraam@4773','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/fd19940a-f26b-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,NULL,NULL);

/*Table structure for table `PreLam` */

DROP TABLE IF EXISTS `PreLam`;

CREATE TABLE `PreLam` (
  `PreLamId` varchar(255) NOT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `Stage` varchar(255) DEFAULT NULL,
  `CheckPoint` longtext,
  `Remark` varchar(255) DEFAULT NULL,
  `Frequency` longtext,
  `AcceptanceCriteria` longtext,
  PRIMARY KEY (`PreLamId`),
  KEY `fk_PreLam_PreLamDetailId` (`PreLamDetailId`),
  CONSTRAINT `fk_PreLam_PreLamDetailId` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `PreLam` */

/*Table structure for table `PreLamDetail` */

DROP TABLE IF EXISTS `PreLamDetail`;

CREATE TABLE `PreLamDetail` (
  `PreLamDetailId` varchar(255) NOT NULL,
  `DocNo` varchar(255) DEFAULT NULL,
  `RevNo` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `Shift` varchar(255) DEFAULT NULL,
  `Line` varchar(255) DEFAULT NULL,
  `PONo` varchar(255) DEFAULT NULL,
  `CheckedBy` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(55) DEFAULT NULL,
  `UpdatedOn` varchar(55) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `PreLamPdf` longtext,
  PRIMARY KEY (`PreLamDetailId`),
  KEY `PL_PreLamCreatedBy` (`CreatedBy`),
  KEY `PL_PreLamCheckedBy` (`CheckedBy`),
  CONSTRAINT `PL_PreLamCheckedBy` FOREIGN KEY (`CheckedBy`) REFERENCES `Person` (`PersonID`),
  CONSTRAINT `PL_PreLamCreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `PreLamDetail` */

/*Table structure for table `Rejected` */

DROP TABLE IF EXISTS `Rejected`;

CREATE TABLE `Rejected` (
  `RejectedID` varchar(255) DEFAULT NULL,
  `SolarDetailID` varchar(255) DEFAULT NULL,
  `CheckTypes` varchar(555) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `Result` varchar(55) DEFAULT NULL,
  `CreatedDate` varchar(255) DEFAULT NULL,
  `UpdatedDate` varchar(255) DEFAULT NULL,
  UNIQUE KEY `ReasonID` (`RejectedID`),
  UNIQUE KEY `ReasonID_2` (`RejectedID`),
  KEY `fk_SolarDetailID` (`SolarDetailID`),
  CONSTRAINT `fk_SolarDetailID` FOREIGN KEY (`SolarDetailID`) REFERENCES `IQCSolarDetails` (`SolarDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=5461 ROW_FORMAT=DYNAMIC;

/*Data for the table `Rejected` */

insert  into `Rejected`(`RejectedID`,`SolarDetailID`,`CheckTypes`,`Reason`,`Result`,`CreatedDate`,`UpdatedDate`) values 
('d256e4cb-f616-43b7-aeb2-f93ea6a194e3','f4a1b1fb-cb89-4e65-8191-cf37b70707d9','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','04-04-2024 11:15:55',''),
('62860319-3a69-4464-a8fa-115b98c77f5a','a426b3c5-95da-4339-9b57-7123376d4c04','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','04-04-2024 11:49:22',''),
('07c14d21-8f2e-4d7c-a105-c9e33a713247','38a75356-e6c6-4f09-a0a4-bd2409edd08b','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Fail','05-04-2024 09:34:12',''),
('e40cdd3e-5099-4ecd-adf9-5894ea5d36b4','6f7a9344-6c73-4cb0-812f-d88512732728','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','05-04-2024 10:01:50',''),
('47f6b0ce-6566-4a6a-8370-22a59ad50211','ebe90854-e71b-4eaf-a946-0638c26efad9','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Fail','05-04-2024 10:06:03',''),
('0ddd4182-546e-4b2d-844d-b682cbc2b8c8','e4bc1f9c-c4c1-4121-a5ef-e7ee286142a0','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','05-04-2024 10:14:36',''),
('be14a57f-28ae-47b6-9ab4-150a8a85867f','dd631aaa-89e4-49d1-a8d2-57c4df2e53b7','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Fail','05-04-2024 10:38:48',''),
('40578d7d-c6c0-4dcd-af69-b314f91e3a31','ba718e76-e589-4d0d-a5c9-84bac0c411cb','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','12-04-2024 03:35:41',''),
('c43e5a0d-600f-4208-a607-fbbd3a90de22','a1f89a88-ffa9-4b0a-a454-32609133b586','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','15-04-2024 04:13:00',''),
('0837a1ae-f760-40f8-8f84-4c6d54615e55','fa5c2c75-e4dd-4a25-a1b8-e9413a7862f9','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','17-04-2024 05:54:24','');

/*Table structure for table `WorkLocation` */

DROP TABLE IF EXISTS `WorkLocation`;

CREATE TABLE `WorkLocation` (
  `LocationID` varchar(255) NOT NULL,
  `Location` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=5461 ROW_FORMAT=DYNAMIC;

/*Data for the table `WorkLocation` */

insert  into `WorkLocation`(`LocationID`,`Location`) values 
('fc9c8db9-e817-11ee-b439-0ac93defbbf1','Unit1'),
('fc9c906b-e817-11ee-b439-0ac93defbbf1','Unit2'),
('fc9c9178-e817-11ee-b439-0ac93defbbf1','Unit3');

/* Procedure structure for procedure `spAddSolarCell` */

/*!50003 DROP PROCEDURE IF EXISTS  `spAddSolarCell` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `spAddSolarCell`(pLotSize int, pSupplierName varchar(55), pQuantityRecd varchar(155), pInvoiceDate varchar(55), pRMDetails varchar(255),
pQualityCheckDate varchar(55), pSampleQuantityCheck varchar(55), pInvoiceNo varchar(55), pRecieptDate varchar(55),
pDocumentNo varchar(55), pRevisionNo varchar(155), pCheckedBy varchar(155), pCheckType varchar(255),
pCharterstics varchar(255), pMeasuringMethod varchar(255), pSampling varchar(255), pReference varchar(155),
pAcceptanceCriteria varchar(255), pSamples varchar(255), pRejectionReason varchar(255))
BEGIN
  DECLARE vSolarDetailID varchar(155);
  DECLARE vDate date;
  DECLARE vRejectionReason varchar(255);

  SET vSolarDetailID = UUID();
  SET vDate = CURDATE();
  SET vRejectionReason = pRejectionReason;

  -- inserting Values into IQCSolarDetails Table
  INSERT INTO IQCSolarDetails (SolarDetailID, LotSize, SupplierName, QuantityRecd, InvoiceDate, RMDetails, QualityCheckDate, SampleQuantityCheck, InvoiceNo, ReceiptDate, DocumentNo, RevisionNo, CheckedBy, CreatedDate)
    VALUES (vSolarDetailID, pLotSize, pSupplierName, pQuantityRecd, pInvoiceDate, pRMDetails, pQualityCheckDate, pSampleQuantityCheck, pInvoiceNo, pRecieptDate, pDocumentNo, pRevisionNo, pCheckedBy, vDate);

  -- inserting Values into IQCSolar Table
  INSERT INTO IQCSolar (IQCSolarID, SolarDetailID, CheckType, Characterstics, MeasuringMethod, Sampling, Reference, AcceptanceCriteria, Samples, CreatedDate)
    VALUES (UUID(), vSolarDetailID, pCheckType, pCharterstics, pMeasuringMethod, pSampling, pReference, pAcceptanceCriteria, pSamples, vDate);

  -- inserting Values into Rejected Table
  INSERT INTO Rejected (RejectedID, SolarDetailID, RejectionReason, CreatedDate)
    VALUES (UUID(), vSolarDetailID, vRejectionReason, vDate);

END */$$
DELIMITER ;

/* Procedure structure for procedure `PersonRegister` */

/*!50003 DROP PROCEDURE IF EXISTS  `PersonRegister` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `PersonRegister`(pPersonid varchar(155),
pEmployeeId varchar(55),
pName varchar(55),
pLoginID varchar(55),
pPassword varchar(55),
pWorkLocation varchar(55),
pEmail varchar(55),
pDepartment varchar(55),
pProfileImg varchar(155),
pDesignation varchar(55),
pCreatedOn varchar(255),
pCreatedBy varchar(255)
)
BEGIN
  DECLARE vPersonID varchar(155);
  SET vPersonID = UUID();

  INSERT INTO Person (PersonID, EmployeeID, Name, LoginID, Password, WorkLocation, Email, Department, ProfileImg, Desgination,Status,CreatedBy,CreatedOn)
    VALUES (vPersonID, pEmployeeId, pName, pLoginID, pPassword, pWorkLocation, pEmail, pDepartment, pProfileImg, pDesignation, 'Active',pCreatedBy,pCreatedOn);


  SELECT
    vPersonID;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
