/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 10.6.16-MariaDB-cll-lve : Database - HRMGaloProd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`HRMGaloProd` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `HRMGaloProd`;

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
  KEY `fk_ApprovalSolarDetailID` (`SolarDetailID`),
  KEY `fk_ApprovalCreated` (`CreatedBy`),
  CONSTRAINT `fk_ApprovalCreated` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`),
  CONSTRAINT `fk_ApprovalSolarDetailID` FOREIGN KEY (`SolarDetailID`) REFERENCES `IQCSolarDetails` (`SolarDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ApprovalStatus` */

insert  into `ApprovalStatus`(`SolarDetailID`,`ApprovalStatusID`,`Status`,`Reason`,`CreatedBy`,`CreatedOn`,`UpdatedOn`) values 
('0470b2a1-035e-43fe-957e-209a406ab14c','121e15fb-1b94-4f83-8beb-c1d994d1c61a','Approved','','60e38fbd-0b78-11ef-8005-52549f6cc694','09-05-2024 06:05:37',NULL),
('ff68e09f-9b03-4043-88b6-3932d5f00da3','49193f26-512d-41ce-aa95-18c9c64ff8bd','Approved','','60e38fbd-0b78-11ef-8005-52549f6cc694','10-05-2024 05:47:44',NULL),
('1196c3bc-8617-49a9-a658-658ab78827f7','8cd711b9-9ca6-409e-8676-dd674adc1792','Approved','','60e38fbd-0b78-11ef-8005-52549f6cc694','09-05-2024 06:06:38',NULL),
('1ab345fc-da84-4dac-b488-551a05201ecd','9d9b9a1f-80f0-4c0d-be81-414c8caf1f5c','Approved','','60e38fbd-0b78-11ef-8005-52549f6cc694','07-05-2024 10:05:02',NULL),
('5bb9778a-5872-4033-ae98-32d986dacfcd','e5c68ab0-00f9-420f-9817-9440390a2ae5','Approved','','60e38fbd-0b78-11ef-8005-52549f6cc694','10-05-2024 05:46:31',NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `BOM` */

insert  into `BOM`(`BOMId`,`BOMDetailId`,`BOMItem`,`Supplier`,`ModelNo`,`BatchNo`,`Remarks`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`) values 
('02c9b4e6-5e5d-46fc-b9ad-4c87eac087c0','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Frame Adhesive sealant','Adsil ','0000004051','0000004051','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('043dc4e0-2bc9-4516-b0eb-03dea5f9c9ed','7c79fa5b-1f21-4393-9db8-df24d333a308','RFID','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('0660aded-9405-4ccd-a6b9-2b22463db647','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Frame','silicon Aluminium ','00','00','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('0804df20-aa2a-4855-8bfa-6ed544aa811a','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Glass','borosil ','HXB00144B3','0000007645','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('1aa802c6-c9d0-439f-a330-c2dcb17922c0','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','SolarCell','jiangxi RS solar ','KSGS 540D08ED00211774','Gu0240316001-113','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('20555161-0071-462b-b6dc-d054c3be7e51','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Frame','silicon Aluminium ','','','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('29320e7b-2911-4ff6-b13d-744c2607cf96','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Eva Glass side(frontEVA)','kanack ','0004419911','101276','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('30c4f691-1579-4201-a86f-dbecaddc8b71','ff51106d-be88-4ad5-97ae-075d90dc0dfc','RFID','perfect id India pvt Ltd ','','','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('30d01496-bec9-4d26-9176-96ce60a98701','7c79fa5b-1f21-4393-9db8-df24d333a308','Eva Glass Side(rear EVA)','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('3848367b-4132-4fb6-a3dc-17781d778830','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Potting JB Sealant(A:B)','5299W-S','24022101-Z-33D','24022101-Z-33D','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('3cc1e559-dfaf-40f9-9416-c54125a58bf3','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Junction Box','Drishan ','DSJB12Y 25A-0.5m','0000004050','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('42adc09b-312b-4bcd-9d3a-2bce363d9f6a','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Frame Adhesive sealant','adsil ','0000001449','0000001449','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('44188728-a8be-4a64-831a-2ef34512cbf2','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Ribbon','Taicang juren ','BDA2611518037113','','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('44e84f61-b09c-4b54-b07e-cf46bc73ad58','7c79fa5b-1f21-4393-9db8-df24d333a308','Glass','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('4e100684-27dc-41ff-9a7b-89ab3b48efd8','7c79fa5b-1f21-4393-9db8-df24d333a308','Frame Adhesive sealant','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('58321f0d-78ad-4d2a-9fb6-856589f4661b','7c79fa5b-1f21-4393-9db8-df24d333a308','Flux','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('595acc6c-10d6-44b6-a49e-fc0dba5d4868','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Back Sheet','fufeng ','20240316001-113','24f007','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('5dc0b631-17b8-449f-8ea8-6dc74c77517d','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Interconnector/Bus-bar','Taicang juren ','BDA1910943005114','BDA1910943005114','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('5f70ea69-3c66-4f7e-93a9-6d0199c520d9','7c79fa5b-1f21-4393-9db8-df24d333a308','Interconnector/Bus-bar','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('6a28d329-6208-4dc5-8456-96729c780f2c','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Flux','RC/PV 44M','0000003309','0000003309','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('6d83d8e7-ddc5-41db-83d1-7ad805d04816','7c79fa5b-1f21-4393-9db8-df24d333a308','Frame','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('762878c6-01d2-4239-a186-c532caff057d','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Eva Glass side(frontEVA)','kanack ','0004419911','101276','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('773df561-4e30-414a-aa2f-8cf3b83f85c9','7c79fa5b-1f21-4393-9db8-df24d333a308','Eva Glass side(frontEVA)','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('7a2e4f4f-9bf0-4e81-862a-c4dfa587069c','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Junction Box','Dhash ','0000005823','0000005823','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('7f224af6-fca1-4799-b8df-90d204700179','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Potting JB Sealant(A:B)','5299w-s','24022101-z-33dw','24022101-z-33dw','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('82b6e72c-ce21-4cea-a619-acb7c46f4c0a','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Interconnector/Bus-bar','Taicang juren ','BDA1910943005108','','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('846760ea-9a2b-46af-80ff-5a21162be5ab','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Glass','Borosil ','HXB00144B3','0000007645','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('88e63bef-e31c-498e-9ef9-31cb67b2b1e0','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Eva Glass Side(rear EVA)','kanack ','','101276','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('8ca2ffd5-1b7f-403a-8119-ed167d7aacda','ff51106d-be88-4ad5-97ae-075d90dc0dfc','Back Sheet','fufeng material ','20240316001-0002','24f-007','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('9487dfc7-255f-4269-b094-fdfb237835c9','7c79fa5b-1f21-4393-9db8-df24d333a308','SolarCell','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('969a6f8c-4597-4c4b-9414-8518bd8cec07','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Flux','RC/PV 44M ','0000003307','0000003307','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('986d9b83-51de-489f-9b7e-322e3a20c450','7c79fa5b-1f21-4393-9db8-df24d333a308','Junction Box','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('9ff7e3ac-f3bd-46fa-b5cc-822037d34ce3','7c79fa5b-1f21-4393-9db8-df24d333a308','Ribbon','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('aeef6a4b-ea7e-4711-9554-ea279f821889','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Ribbon','Taicang juren ','BDA2611518037112','BDA2611518037112','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('bbabae9d-1828-467f-89a0-18f633e5e290','ff51106d-be88-4ad5-97ae-075d90dc0dfc','SolarCell','jiangxi Rs solar ','Pic 20240418-01-3','Gu0241175111-0002','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:58:45',NULL),
('de0fe081-4433-47c2-be63-629d5ceecee7','7c79fa5b-1f21-4393-9db8-df24d333a308','Potting JB Sealant(A:B)','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL),
('e0a6ac4f-5848-49ec-b502-d05aeb25ceba','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','RFID','perfect ','Pid-040-AL-H19-W','0000','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('e81ce441-5df0-4523-b20e-e25d2edb0b04','3d213a14-1692-4bbb-8afa-168d5dc7f1bc','Eva Glass Side(rear EVA)','kanack ','0004313979','101276','ok','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:09:15',NULL),
('f13735e6-0aad-4ff7-91d9-01cf8340c0dc','7c79fa5b-1f21-4393-9db8-df24d333a308','Back Sheet','','','','','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `BOMVerificationDetails` */

insert  into `BOMVerificationDetails`(`BOMDetailId`,`Type`,`RevNo`,`Date`,`Shift`,`Line`,`PONo`,`Status`,`CheckedBy`,`ReviewedBy`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`ReferencePdf`,`DocNo`) values 
('3d213a14-1692-4bbb-8afa-168d5dc7f1bc','BOM Verification','1.0 & 12.08.2023','2024-05-09','A','10BB ','0000007645','Pending','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:34:56',NULL,'http://srv515471.hstgr.cloud:9090/IPQC/Pdf/3d213a14-1692-4bbb-8afa-168d5dc7f1bc.pdf','GSPL/IPQC/BM/002'),
('7c79fa5b-1f21-4393-9db8-df24d333a308','BOM Verification','1.0 & 12.08.2023','','','','','Inprogress','08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,'06-05-2024 16:29:29',NULL,NULL,'GSPL/IPQC/BM/002'),
('ff51106d-be88-4ad5-97ae-075d90dc0dfc','BOM Verification','1.0 & 12.08.2023','2024-05-09','A','10BB ','000007615','Inprogress','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 14:16:51',NULL,NULL,'GSPL/IPQC/BM/002');

/*Table structure for table `Department` */

DROP TABLE IF EXISTS `Department`;

CREATE TABLE `Department` (
  `DepartmentID` varchar(255) NOT NULL,
  `Department` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `Result` varchar(255) DEFAULT NULL,
  `CheckTypes` longtext DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `Product` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `ApprovalStatusReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FQCDetailId`),
  KEY `CreatedBy` (`CreatedBy`),
  CONSTRAINT `FQCDetails_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `FQCDetails` */

insert  into `FQCDetails`(`FQCDetailId`,`ProductSpecs`,`ProductBatchNo`,`PartyName`,`PackingDate`,`ReportNumber`,`DateOfQualityCheck`,`DocumentNo`,`RevNo`,`Status`,`Pdf`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`Result`,`CheckTypes`,`Reason`,`Product`,`Type`,`ApprovalStatusReason`) values 
('712bcf04-fa61-4578-bc4a-33f40a9aca64','GS03540M127','M127','IT Solar','2024-05-09','1','2024-05-09','GSPL/FQC/PDI/002','Ver1.0/12-08-2023','Inprogress',NULL,'242eb8c2-0b9c-11ef-8005-52549f6cc694',NULL,'09-05-2024 02:38:45',NULL,'Fail','[{\"S1\":false},{\"S2\":false},{\"S3\":false}]','','PV Module','FQC',NULL),
('7964888a-9d08-4c47-bc29-c9a32d054145','1','24','Gautam solar','2024-05-09','124','2024-05-09','GSPL/FQC/PDI/002','Ver1.0/12-08-2023','Inprogress',NULL,'242eb8c2-0b9c-11ef-8005-52549f6cc694',NULL,'09-05-2024 01:30:38',NULL,'Fail','[{\"S1\":false},{\"S2\":false},{\"S3\":false}]','','PV Module','FQC',NULL),
('7fb35d2f-efe3-4bd1-bcd2-4c1cee613b8c','GS03703M125','M125','Gautam Solar','2024-05-07','1','2024-05-07','GSPL/FQC/PDI/002','Ver1.0/12-08-2023','Inprogress',NULL,'242eb8c2-0b9c-11ef-8005-52549f6cc694',NULL,'07-05-2024 18:36:40',NULL,'Fail','[{\"S1\":false},{\"S2\":false},{\"S3\":false}]','','PV Module','FQC',NULL),
('845fbe59-e748-401d-bfd1-9e381f6ebcaa','GS03702M125','M125','Gautam Solar','2024-05-07','1','2024-05-07','GSPL/FQC/PDI/002','Ver1.0/12-08-2023','Inprogress',NULL,'242eb8c2-0b9c-11ef-8005-52549f6cc694',NULL,'07-05-2024 18:14:09',NULL,'Fail','[{\"S1\":false},{\"S2\":false},{\"S3\":false}]','','PV Module','FQC',NULL),
('f4947eae-5cef-4a55-be32-48e3b1172ba9','GS03702M125','M125','Gautam Solar','2024-05-07','1','2024-05-07','GSPL/FQC/PDI/002','Ver1.0/12-08-2023','Inprogress',NULL,'242eb8c2-0b9c-11ef-8005-52549f6cc694',NULL,'07-05-2024 18:16:29',NULL,'Fail','[{\"S1\":false},{\"S2\":false},{\"S3\":false}]','','PV Module','FQC',NULL);

/*Table structure for table `FQCTest` */

DROP TABLE IF EXISTS `FQCTest`;

CREATE TABLE `FQCTest` (
  `FQCId` varchar(255) DEFAULT NULL,
  `FQCDetailId` varchar(255) DEFAULT NULL,
  `Sample1` longtext DEFAULT NULL,
  `Sample2` longtext DEFAULT NULL,
  `Sample3` longtext DEFAULT NULL,
  UNIQUE KEY `FQCId` (`FQCId`),
  KEY `FQCDetailId` (`FQCDetailId`),
  CONSTRAINT `FQCTest_ibfk_1` FOREIGN KEY (`FQCDetailId`) REFERENCES `FQCDetails` (`FQCDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `FQCTest` */

insert  into `FQCTest`(`FQCId`,`FQCDetailId`,`Sample1`,`Sample2`,`Sample3`) values 
('01f380b7-b3ff-49fc-815e-41368b2855e7','845fbe59-e748-401d-bfd1-9e381f6ebcaa','{\"visualParametersController930\":\"Visual Parameters\",\"visualParameterCrietrion1Controller930\":\"Should be neat and clean\",\"visualParameterS1Controller930\":\"\",\"visualParameterS1TestValue930\":false,\"visualParameterS1RemarksControllers930\":\"\",\"visualParameterCrietrion2Controller930\":\"No breakage allowed\",\"visualParameterS2Controller930\":\"\",\"visualParameterS2TestValue930\":false,\"visualParameterS2RemarksControllers930\":\"\",\"visualParameterCrietrion3Controller930\":\"Packing Condition\",\"visualParameterS3Controller930\":\"\",\"visualParameterS3TestValue930\":false,\"visualParameterS3RemarksControllers930\":\"\",\"visualParameterCrietrion4Controller930\":\"Framing Condition\",\"visualParameterS4Controller930\":\"\",\"visualParameterS4TestValue930\":false,\"visualParameterS4RemarksControllers930\":\"\",\"moduleRatingParameters1Controller930\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller930\":\"\",\"moduleRatingParameterS1TestValue930\":false,\"moduleRatingParameterS1RemarksControllers930\":\"\",\"moduleRatingParameters2Controller930\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller930\":\"\",\"moduleRatingParameterS2TestValue930\":false,\"moduleRatingParameterS2RemarksControllers930\":\"\",\"otherParameters1Controller930\":\"QC Sticker\",\"otherParameterCrietrion1Controller930\":\"Should be oasted\",\"otherParameterS1Controller930\":\"\",\"otherParameterS1TestValue930\":false,\"otherParameterS1RemarksControllers930\":\"\",\"otherParameters2Controller930\":\"Module info Label\",\"otherParameterCrietrion2Controller930\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller930\":\"\",\"otherParameterS2TestValue930\":false,\"otherParameterS2RemarksControllers930\":\"\",\"otherParameters3Controller930\":\"RFID\",\"otherParameterCrietrion3Controller930\":\"Should be oasted\",\"otherParameterS3Controller930\":\"\",\"otherParameterS3TestValue930\":false,\"otherParameterS3RemarksControllers930\":\"\",\"otherParameters4Controller930\":\"Company Logo\",\"otherParameterCrietrion4Controller930\":\"Should be Pasted\",\"otherParameterS4Controller930\":\"\",\"otherParameterS4TestValue930\":false,\"otherParameterS4RemarksControllers930\":\"\",\"otherParameters5Controller930\":\"Junction Box\",\"otherParameterCrietrion5Controller930\":\"Should be Pasted\",\"otherParameterS5Controller930\":\"\",\"otherParameterS5TestValue930\":false,\"otherParameterS5RemarksControllers930\":\"\",\"otherParameters6Controller930\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller930\":\"Should be provided with JB\",\"otherParameterS6Controller930\":\"\",\"otherParameterS6TestValue930\":false,\"otherParameterS6RemarksControllers930\":\"\",\"otherParameters7Controller930\":\"Module Serial Number\",\"otherParameterCrietrion7Controller930\":\"Serial no should be provided\",\"otherParameterS7Controller930\":\"\",\"otherParameterS7TestValue930\":false,\"otherParameterS7RemarksControllers930\":\"\",\"otherParameters8Controller930\":\"Framing Condition\",\"otherParameterCrietrion8Controller930\":\"N/A\",\"otherParameterS8Controller930\":\"\",\"otherParameterS8TestValue930\":false,\"otherParameterS8RemarksControllers930\":\"\",\"otherParameters9Controller930\":\"HIPOT\",\"otherParameterCrietrion9Controller930\":\"N/A\",\"otherParameterS9Controller930\":\"\",\"otherParameterS9TestValue930\":false,\"otherParameterS9RemarksControllers930\":\"\"}','{\"visualParametersController230\":\"Visual Parameters\",\"visualParameterCrietrion1Controller230\":\"Should be neat and clean\",\"visualParameterS1Controller230\":\"\",\"visualParameterS1TestValue230\":false,\"visualParameterS1RemarksControllers230\":\"\",\"visualParameterCrietrion2Controller230\":\"No breakage allowed\",\"visualParameterS2Controller230\":\"\",\"visualParameterS2TestValue230\":false,\"visualParameterS2RemarksControllers230\":\"\",\"visualParameterCrietrion3Controller230\":\"Packing Condition\",\"visualParameterS3Controller230\":\"\",\"visualParameterS3TestValue230\":false,\"visualParameterS3RemarksControllers230\":\"\",\"visualParameterCrietrion4Controller230\":\"Framing Condition\",\"visualParameterS4Controller230\":\"\",\"visualParameterS4TestValue230\":false,\"visualParameterS4RemarksControllers230\":\"\",\"moduleRatingParameters1Controller230\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller230\":\"\",\"moduleRatingParameterS1TestValue230\":false,\"moduleRatingParameterS1RemarksControllers230\":\"\",\"moduleRatingParameters2Controller230\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller230\":\"\",\"moduleRatingParameterS2TestValue230\":false,\"moduleRatingParameterS2RemarksControllers230\":\"\",\"otherParameters1Controller230\":\"QC Sticker\",\"otherParameterCrietrion1Controller230\":\"Should be oasted\",\"otherParameterS1Controller230\":\"\",\"otherParameterS1TestValue230\":false,\"otherParameterS1RemarksControllers230\":\"\",\"otherParameters2Controller230\":\"Module info Label\",\"otherParameterCrietrion2Controller230\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller230\":\"\",\"otherParameterS2TestValue230\":false,\"otherParameterS2RemarksControllers230\":\"\",\"otherParameters3Controller230\":\"RFID\",\"otherParameterCrietrion3Controller230\":\"Should be oasted\",\"otherParameterS3Controller230\":\"\",\"otherParameterS3TestValue230\":false,\"otherParameterS3RemarksControllers230\":\"\",\"otherParameters4Controller230\":\"Company Logo\",\"otherParameterCrietrion4Controller230\":\"Should be Pasted\",\"otherParameterS4Controller230\":\"\",\"otherParameterS4TestValue230\":false,\"otherParameterS4RemarksControllers230\":\"\",\"otherParameters5Controller230\":\"Junction Box\",\"otherParameterCrietrion5Controller230\":\"Should be Pasted\",\"otherParameterS5Controller230\":\"\",\"otherParameterS5TestValue230\":false,\"otherParameterS5RemarksControllers230\":\"\",\"otherParameters6Controller230\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller230\":\"Should be provided with JB\",\"otherParameterS6Controller230\":\"\",\"otherParameterS6TestValue230\":false,\"otherParameterS6RemarksControllers230\":\"\",\"otherParameters7Controller230\":\"Module Serial Number\",\"otherParameterCrietrion7Controller230\":\"Serial no should be provided\",\"otherParameterS7Controller230\":\"\",\"otherParameterS7TestValue230\":false,\"otherParameterS7RemarksControllers230\":\"\",\"otherParameters8Controller230\":\"Framing Condition\",\"otherParameterCrietrion8Controller230\":\"N/A\",\"otherParameterS8Controller230\":\"\",\"otherParameterS8TestValue230\":false,\"otherParameterS8RemarksControllers230\":\"\",\"otherParameters9Controller230\":\"HIPOT\",\"otherParameterCrietrion9Controller230\":\"N/A\",\"otherParameterS9Controller230\":\"\",\"otherParameterS9TestValue230\":false,\"otherParameterS9RemarksControllers230\":\"\"}','{\"visualParametersController645\":\"Visual Parameters\",\"visualParameterCrietrion1Controller645\":\"Should be neat and clean\",\"visualParameterS1Controller645\":\"\",\"visualParameterS1TestValue645\":false,\"visualParameterS1RemarksControllers645\":\"\",\"visualParameterCrietrion2Controller645\":\"No breakage allowed\",\"visualParameterS2Controller645\":\"\",\"visualParameterS2TestValue645\":false,\"visualParameterS2RemarksControllers645\":\"\",\"visualParameterCrietrion3Controller645\":\"Packing Condition\",\"visualParameterS3Controller645\":\"\",\"visualParameterS3TestValue645\":false,\"visualParameterS3RemarksControllers645\":\"\",\"visualParameterCrietrion4Controller645\":\"Framing Condition\",\"visualParameterS4Controller645\":\"\",\"visualParameterS4TestValue645\":false,\"visualParameterS4RemarksControllers645\":\"\",\"moduleRatingParameters1Controller645\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller645\":\"\",\"moduleRatingParameterS1TestValue645\":false,\"moduleRatingParameterS1RemarksControllers645\":\"\",\"moduleRatingParameters2Controller645\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller645\":\"\",\"moduleRatingParameterS2TestValue645\":false,\"moduleRatingParameterS2RemarksControllers645\":\"\",\"otherParameters1Controller645\":\"QC Sticker\",\"otherParameterCrietrion1Controller645\":\"Should be oasted\",\"otherParameterS1Controller645\":\"\",\"otherParameterS1TestValue645\":false,\"otherParameterS1RemarksControllers645\":\"\",\"otherParameters2Controller645\":\"Module info Label\",\"otherParameterCrietrion2Controller645\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller645\":\"\",\"otherParameterS2TestValue645\":false,\"otherParameterS2RemarksControllers645\":\"\",\"otherParameters3Controller645\":\"RFID\",\"otherParameterCrietrion3Controller645\":\"Should be oasted\",\"otherParameterS3Controller645\":\"\",\"otherParameterS3TestValue645\":false,\"otherParameterS3RemarksControllers645\":\"\",\"otherParameters4Controller645\":\"Company Logo\",\"otherParameterCrietrion4Controller645\":\"Should be Pasted\",\"otherParameterS4Controller645\":\"\",\"otherParameterS4TestValue645\":false,\"otherParameterS4RemarksControllers645\":\"\",\"otherParameters5Controller645\":\"Junction Box\",\"otherParameterCrietrion5Controller645\":\"Should be Pasted\",\"otherParameterS5Controller645\":\"\",\"otherParameterS5TestValue645\":false,\"otherParameterS5RemarksControllers645\":\"\",\"otherParameters6Controller645\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller645\":\"Should be provided with JB\",\"otherParameterS6Controller645\":\"\",\"otherParameterS6TestValue645\":false,\"otherParameterS6RemarksControllers645\":\"\",\"otherParameters7Controller645\":\"Module Serial Number\",\"otherParameterCrietrion7Controller645\":\"Serial no should be provided\",\"otherParameterS7Controller645\":\"\",\"otherParameterS7TestValue645\":false,\"otherParameterS7RemarksControllers645\":\"\",\"otherParameters8Controller645\":\"Framing Condition\",\"otherParameterCrietrion8Controller645\":\"N/A\",\"otherParameterS8Controller645\":\"\",\"otherParameterS8TestValue645\":false,\"otherParameterS8RemarksControllers645\":\"\",\"otherParameters9Controller645\":\"HIPOT\",\"otherParameterCrietrion9Controller645\":\"N/A\",\"otherParameterS9Controller645\":\"\",\"otherParameterS9TestValue645\":false,\"otherParameterS9RemarksControllers645\":\"\"}'),
('9e6d583e-094e-41a3-9c76-d09193fa3827','f4947eae-5cef-4a55-be32-48e3b1172ba9','{\"visualParametersController930\":\"Visual Parameters\",\"visualParameterCrietrion1Controller930\":\"Should be neat and clean\",\"visualParameterS1Controller930\":\"\",\"visualParameterS1TestValue930\":false,\"visualParameterS1RemarksControllers930\":\"\",\"visualParameterCrietrion2Controller930\":\"No breakage allowed\",\"visualParameterS2Controller930\":\"\",\"visualParameterS2TestValue930\":false,\"visualParameterS2RemarksControllers930\":\"\",\"visualParameterCrietrion3Controller930\":\"Packing Condition\",\"visualParameterS3Controller930\":\"\",\"visualParameterS3TestValue930\":false,\"visualParameterS3RemarksControllers930\":\"\",\"visualParameterCrietrion4Controller930\":\"Framing Condition\",\"visualParameterS4Controller930\":\"\",\"visualParameterS4TestValue930\":false,\"visualParameterS4RemarksControllers930\":\"\",\"moduleRatingParameters1Controller930\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller930\":\"\",\"moduleRatingParameterS1TestValue930\":false,\"moduleRatingParameterS1RemarksControllers930\":\"\",\"moduleRatingParameters2Controller930\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller930\":\"\",\"moduleRatingParameterS2TestValue930\":false,\"moduleRatingParameterS2RemarksControllers930\":\"\",\"otherParameters1Controller930\":\"QC Sticker\",\"otherParameterCrietrion1Controller930\":\"Should be oasted\",\"otherParameterS1Controller930\":\"\",\"otherParameterS1TestValue930\":false,\"otherParameterS1RemarksControllers930\":\"\",\"otherParameters2Controller930\":\"Module info Label\",\"otherParameterCrietrion2Controller930\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller930\":\"\",\"otherParameterS2TestValue930\":false,\"otherParameterS2RemarksControllers930\":\"\",\"otherParameters3Controller930\":\"RFID\",\"otherParameterCrietrion3Controller930\":\"Should be oasted\",\"otherParameterS3Controller930\":\"\",\"otherParameterS3TestValue930\":false,\"otherParameterS3RemarksControllers930\":\"\",\"otherParameters4Controller930\":\"Company Logo\",\"otherParameterCrietrion4Controller930\":\"Should be Pasted\",\"otherParameterS4Controller930\":\"\",\"otherParameterS4TestValue930\":false,\"otherParameterS4RemarksControllers930\":\"\",\"otherParameters5Controller930\":\"Junction Box\",\"otherParameterCrietrion5Controller930\":\"Should be Pasted\",\"otherParameterS5Controller930\":\"\",\"otherParameterS5TestValue930\":false,\"otherParameterS5RemarksControllers930\":\"\",\"otherParameters6Controller930\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller930\":\"Should be provided with JB\",\"otherParameterS6Controller930\":\"\",\"otherParameterS6TestValue930\":false,\"otherParameterS6RemarksControllers930\":\"\",\"otherParameters7Controller930\":\"Module Serial Number\",\"otherParameterCrietrion7Controller930\":\"Serial no should be provided\",\"otherParameterS7Controller930\":\"\",\"otherParameterS7TestValue930\":false,\"otherParameterS7RemarksControllers930\":\"\",\"otherParameters8Controller930\":\"Framing Condition\",\"otherParameterCrietrion8Controller930\":\"N/A\",\"otherParameterS8Controller930\":\"\",\"otherParameterS8TestValue930\":false,\"otherParameterS8RemarksControllers930\":\"\",\"otherParameters9Controller930\":\"HIPOT\",\"otherParameterCrietrion9Controller930\":\"N/A\",\"otherParameterS9Controller930\":\"\",\"otherParameterS9TestValue930\":false,\"otherParameterS9RemarksControllers930\":\"\"}','{\"visualParametersController230\":\"Visual Parameters\",\"visualParameterCrietrion1Controller230\":\"Should be neat and clean\",\"visualParameterS1Controller230\":\"\",\"visualParameterS1TestValue230\":false,\"visualParameterS1RemarksControllers230\":\"\",\"visualParameterCrietrion2Controller230\":\"No breakage allowed\",\"visualParameterS2Controller230\":\"\",\"visualParameterS2TestValue230\":false,\"visualParameterS2RemarksControllers230\":\"\",\"visualParameterCrietrion3Controller230\":\"Packing Condition\",\"visualParameterS3Controller230\":\"\",\"visualParameterS3TestValue230\":false,\"visualParameterS3RemarksControllers230\":\"\",\"visualParameterCrietrion4Controller230\":\"Framing Condition\",\"visualParameterS4Controller230\":\"\",\"visualParameterS4TestValue230\":false,\"visualParameterS4RemarksControllers230\":\"\",\"moduleRatingParameters1Controller230\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller230\":\"\",\"moduleRatingParameterS1TestValue230\":false,\"moduleRatingParameterS1RemarksControllers230\":\"\",\"moduleRatingParameters2Controller230\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller230\":\"\",\"moduleRatingParameterS2TestValue230\":false,\"moduleRatingParameterS2RemarksControllers230\":\"\",\"otherParameters1Controller230\":\"QC Sticker\",\"otherParameterCrietrion1Controller230\":\"Should be oasted\",\"otherParameterS1Controller230\":\"\",\"otherParameterS1TestValue230\":false,\"otherParameterS1RemarksControllers230\":\"\",\"otherParameters2Controller230\":\"Module info Label\",\"otherParameterCrietrion2Controller230\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller230\":\"\",\"otherParameterS2TestValue230\":false,\"otherParameterS2RemarksControllers230\":\"\",\"otherParameters3Controller230\":\"RFID\",\"otherParameterCrietrion3Controller230\":\"Should be oasted\",\"otherParameterS3Controller230\":\"\",\"otherParameterS3TestValue230\":false,\"otherParameterS3RemarksControllers230\":\"\",\"otherParameters4Controller230\":\"Company Logo\",\"otherParameterCrietrion4Controller230\":\"Should be Pasted\",\"otherParameterS4Controller230\":\"\",\"otherParameterS4TestValue230\":false,\"otherParameterS4RemarksControllers230\":\"\",\"otherParameters5Controller230\":\"Junction Box\",\"otherParameterCrietrion5Controller230\":\"Should be Pasted\",\"otherParameterS5Controller230\":\"\",\"otherParameterS5TestValue230\":false,\"otherParameterS5RemarksControllers230\":\"\",\"otherParameters6Controller230\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller230\":\"Should be provided with JB\",\"otherParameterS6Controller230\":\"\",\"otherParameterS6TestValue230\":false,\"otherParameterS6RemarksControllers230\":\"\",\"otherParameters7Controller230\":\"Module Serial Number\",\"otherParameterCrietrion7Controller230\":\"Serial no should be provided\",\"otherParameterS7Controller230\":\"\",\"otherParameterS7TestValue230\":false,\"otherParameterS7RemarksControllers230\":\"\",\"otherParameters8Controller230\":\"Framing Condition\",\"otherParameterCrietrion8Controller230\":\"N/A\",\"otherParameterS8Controller230\":\"\",\"otherParameterS8TestValue230\":false,\"otherParameterS8RemarksControllers230\":\"\",\"otherParameters9Controller230\":\"HIPOT\",\"otherParameterCrietrion9Controller230\":\"N/A\",\"otherParameterS9Controller230\":\"\",\"otherParameterS9TestValue230\":false,\"otherParameterS9RemarksControllers230\":\"\"}','{\"visualParametersController645\":\"Visual Parameters\",\"visualParameterCrietrion1Controller645\":\"Should be neat and clean\",\"visualParameterS1Controller645\":\"\",\"visualParameterS1TestValue645\":false,\"visualParameterS1RemarksControllers645\":\"\",\"visualParameterCrietrion2Controller645\":\"No breakage allowed\",\"visualParameterS2Controller645\":\"\",\"visualParameterS2TestValue645\":false,\"visualParameterS2RemarksControllers645\":\"\",\"visualParameterCrietrion3Controller645\":\"Packing Condition\",\"visualParameterS3Controller645\":\"\",\"visualParameterS3TestValue645\":false,\"visualParameterS3RemarksControllers645\":\"\",\"visualParameterCrietrion4Controller645\":\"Framing Condition\",\"visualParameterS4Controller645\":\"\",\"visualParameterS4TestValue645\":false,\"visualParameterS4RemarksControllers645\":\"\",\"moduleRatingParameters1Controller645\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller645\":\"\",\"moduleRatingParameterS1TestValue645\":false,\"moduleRatingParameterS1RemarksControllers645\":\"\",\"moduleRatingParameters2Controller645\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller645\":\"\",\"moduleRatingParameterS2TestValue645\":false,\"moduleRatingParameterS2RemarksControllers645\":\"\",\"otherParameters1Controller645\":\"QC Sticker\",\"otherParameterCrietrion1Controller645\":\"Should be oasted\",\"otherParameterS1Controller645\":\"\",\"otherParameterS1TestValue645\":false,\"otherParameterS1RemarksControllers645\":\"\",\"otherParameters2Controller645\":\"Module info Label\",\"otherParameterCrietrion2Controller645\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller645\":\"\",\"otherParameterS2TestValue645\":false,\"otherParameterS2RemarksControllers645\":\"\",\"otherParameters3Controller645\":\"RFID\",\"otherParameterCrietrion3Controller645\":\"Should be oasted\",\"otherParameterS3Controller645\":\"\",\"otherParameterS3TestValue645\":false,\"otherParameterS3RemarksControllers645\":\"\",\"otherParameters4Controller645\":\"Company Logo\",\"otherParameterCrietrion4Controller645\":\"Should be Pasted\",\"otherParameterS4Controller645\":\"\",\"otherParameterS4TestValue645\":false,\"otherParameterS4RemarksControllers645\":\"\",\"otherParameters5Controller645\":\"Junction Box\",\"otherParameterCrietrion5Controller645\":\"Should be Pasted\",\"otherParameterS5Controller645\":\"\",\"otherParameterS5TestValue645\":false,\"otherParameterS5RemarksControllers645\":\"\",\"otherParameters6Controller645\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller645\":\"Should be provided with JB\",\"otherParameterS6Controller645\":\"\",\"otherParameterS6TestValue645\":false,\"otherParameterS6RemarksControllers645\":\"\",\"otherParameters7Controller645\":\"Module Serial Number\",\"otherParameterCrietrion7Controller645\":\"Serial no should be provided\",\"otherParameterS7Controller645\":\"\",\"otherParameterS7TestValue645\":false,\"otherParameterS7RemarksControllers645\":\"\",\"otherParameters8Controller645\":\"Framing Condition\",\"otherParameterCrietrion8Controller645\":\"N/A\",\"otherParameterS8Controller645\":\"\",\"otherParameterS8TestValue645\":false,\"otherParameterS8RemarksControllers645\":\"\",\"otherParameters9Controller645\":\"HIPOT\",\"otherParameterCrietrion9Controller645\":\"N/A\",\"otherParameterS9Controller645\":\"\",\"otherParameterS9TestValue645\":false,\"otherParameterS9RemarksControllers645\":\"\"}'),
('107b2292-1808-4004-b966-90324721e111','7fb35d2f-efe3-4bd1-bcd2-4c1cee613b8c','{\"visualParametersController930\":\"Visual Parameters\",\"visualParameterCrietrion1Controller930\":\"Should be neat and clean\",\"visualParameterS1Controller930\":\"\",\"visualParameterS1TestValue930\":false,\"visualParameterS1RemarksControllers930\":\"\",\"visualParameterCrietrion2Controller930\":\"No breakage allowed\",\"visualParameterS2Controller930\":\"\",\"visualParameterS2TestValue930\":false,\"visualParameterS2RemarksControllers930\":\"\",\"visualParameterCrietrion3Controller930\":\"Packing Condition\",\"visualParameterS3Controller930\":\"\",\"visualParameterS3TestValue930\":false,\"visualParameterS3RemarksControllers930\":\"\",\"visualParameterCrietrion4Controller930\":\"Framing Condition\",\"visualParameterS4Controller930\":\"\",\"visualParameterS4TestValue930\":false,\"visualParameterS4RemarksControllers930\":\"\",\"moduleRatingParameters1Controller930\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller930\":\"\",\"moduleRatingParameterS1TestValue930\":false,\"moduleRatingParameterS1RemarksControllers930\":\"\",\"moduleRatingParameters2Controller930\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller930\":\"\",\"moduleRatingParameterS2TestValue930\":false,\"moduleRatingParameterS2RemarksControllers930\":\"\",\"otherParameters1Controller930\":\"QC Sticker\",\"otherParameterCrietrion1Controller930\":\"Should be oasted\",\"otherParameterS1Controller930\":\"\",\"otherParameterS1TestValue930\":false,\"otherParameterS1RemarksControllers930\":\"\",\"otherParameters2Controller930\":\"Module info Label\",\"otherParameterCrietrion2Controller930\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller930\":\"\",\"otherParameterS2TestValue930\":false,\"otherParameterS2RemarksControllers930\":\"\",\"otherParameters3Controller930\":\"RFID\",\"otherParameterCrietrion3Controller930\":\"Should be oasted\",\"otherParameterS3Controller930\":\"\",\"otherParameterS3TestValue930\":false,\"otherParameterS3RemarksControllers930\":\"\",\"otherParameters4Controller930\":\"Company Logo\",\"otherParameterCrietrion4Controller930\":\"Should be Pasted\",\"otherParameterS4Controller930\":\"\",\"otherParameterS4TestValue930\":false,\"otherParameterS4RemarksControllers930\":\"\",\"otherParameters5Controller930\":\"Junction Box\",\"otherParameterCrietrion5Controller930\":\"Should be Pasted\",\"otherParameterS5Controller930\":\"\",\"otherParameterS5TestValue930\":false,\"otherParameterS5RemarksControllers930\":\"\",\"otherParameters6Controller930\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller930\":\"Should be provided with JB\",\"otherParameterS6Controller930\":\"\",\"otherParameterS6TestValue930\":false,\"otherParameterS6RemarksControllers930\":\"\",\"otherParameters7Controller930\":\"Module Serial Number\",\"otherParameterCrietrion7Controller930\":\"Serial no should be provided\",\"otherParameterS7Controller930\":\"\",\"otherParameterS7TestValue930\":false,\"otherParameterS7RemarksControllers930\":\"\",\"otherParameters8Controller930\":\"Framing Condition\",\"otherParameterCrietrion8Controller930\":\"N/A\",\"otherParameterS8Controller930\":\"\",\"otherParameterS8TestValue930\":false,\"otherParameterS8RemarksControllers930\":\"\",\"otherParameters9Controller930\":\"HIPOT\",\"otherParameterCrietrion9Controller930\":\"N/A\",\"otherParameterS9Controller930\":\"\",\"otherParameterS9TestValue930\":false,\"otherParameterS9RemarksControllers930\":\"\"}','{\"visualParametersController230\":\"Visual Parameters\",\"visualParameterCrietrion1Controller230\":\"Should be neat and clean\",\"visualParameterS1Controller230\":\"\",\"visualParameterS1TestValue230\":false,\"visualParameterS1RemarksControllers230\":\"\",\"visualParameterCrietrion2Controller230\":\"No breakage allowed\",\"visualParameterS2Controller230\":\"\",\"visualParameterS2TestValue230\":false,\"visualParameterS2RemarksControllers230\":\"\",\"visualParameterCrietrion3Controller230\":\"Packing Condition\",\"visualParameterS3Controller230\":\"\",\"visualParameterS3TestValue230\":false,\"visualParameterS3RemarksControllers230\":\"\",\"visualParameterCrietrion4Controller230\":\"Framing Condition\",\"visualParameterS4Controller230\":\"\",\"visualParameterS4TestValue230\":false,\"visualParameterS4RemarksControllers230\":\"\",\"moduleRatingParameters1Controller230\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller230\":\"\",\"moduleRatingParameterS1TestValue230\":false,\"moduleRatingParameterS1RemarksControllers230\":\"\",\"moduleRatingParameters2Controller230\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller230\":\"\",\"moduleRatingParameterS2TestValue230\":false,\"moduleRatingParameterS2RemarksControllers230\":\"\",\"otherParameters1Controller230\":\"QC Sticker\",\"otherParameterCrietrion1Controller230\":\"Should be oasted\",\"otherParameterS1Controller230\":\"\",\"otherParameterS1TestValue230\":false,\"otherParameterS1RemarksControllers230\":\"\",\"otherParameters2Controller230\":\"Module info Label\",\"otherParameterCrietrion2Controller230\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller230\":\"\",\"otherParameterS2TestValue230\":false,\"otherParameterS2RemarksControllers230\":\"\",\"otherParameters3Controller230\":\"RFID\",\"otherParameterCrietrion3Controller230\":\"Should be oasted\",\"otherParameterS3Controller230\":\"\",\"otherParameterS3TestValue230\":false,\"otherParameterS3RemarksControllers230\":\"\",\"otherParameters4Controller230\":\"Company Logo\",\"otherParameterCrietrion4Controller230\":\"Should be Pasted\",\"otherParameterS4Controller230\":\"\",\"otherParameterS4TestValue230\":false,\"otherParameterS4RemarksControllers230\":\"\",\"otherParameters5Controller230\":\"Junction Box\",\"otherParameterCrietrion5Controller230\":\"Should be Pasted\",\"otherParameterS5Controller230\":\"\",\"otherParameterS5TestValue230\":false,\"otherParameterS5RemarksControllers230\":\"\",\"otherParameters6Controller230\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller230\":\"Should be provided with JB\",\"otherParameterS6Controller230\":\"\",\"otherParameterS6TestValue230\":false,\"otherParameterS6RemarksControllers230\":\"\",\"otherParameters7Controller230\":\"Module Serial Number\",\"otherParameterCrietrion7Controller230\":\"Serial no should be provided\",\"otherParameterS7Controller230\":\"\",\"otherParameterS7TestValue230\":false,\"otherParameterS7RemarksControllers230\":\"\",\"otherParameters8Controller230\":\"Framing Condition\",\"otherParameterCrietrion8Controller230\":\"N/A\",\"otherParameterS8Controller230\":\"\",\"otherParameterS8TestValue230\":false,\"otherParameterS8RemarksControllers230\":\"\",\"otherParameters9Controller230\":\"HIPOT\",\"otherParameterCrietrion9Controller230\":\"N/A\",\"otherParameterS9Controller230\":\"\",\"otherParameterS9TestValue230\":false,\"otherParameterS9RemarksControllers230\":\"\"}','{\"visualParametersController645\":\"Visual Parameters\",\"visualParameterCrietrion1Controller645\":\"Should be neat and clean\",\"visualParameterS1Controller645\":\"\",\"visualParameterS1TestValue645\":false,\"visualParameterS1RemarksControllers645\":\"\",\"visualParameterCrietrion2Controller645\":\"No breakage allowed\",\"visualParameterS2Controller645\":\"\",\"visualParameterS2TestValue645\":false,\"visualParameterS2RemarksControllers645\":\"\",\"visualParameterCrietrion3Controller645\":\"Packing Condition\",\"visualParameterS3Controller645\":\"\",\"visualParameterS3TestValue645\":false,\"visualParameterS3RemarksControllers645\":\"\",\"visualParameterCrietrion4Controller645\":\"Framing Condition\",\"visualParameterS4Controller645\":\"\",\"visualParameterS4TestValue645\":false,\"visualParameterS4RemarksControllers645\":\"\",\"moduleRatingParameters1Controller645\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller645\":\"\",\"moduleRatingParameterS1TestValue645\":false,\"moduleRatingParameterS1RemarksControllers645\":\"\",\"moduleRatingParameters2Controller645\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller645\":\"\",\"moduleRatingParameterS2TestValue645\":false,\"moduleRatingParameterS2RemarksControllers645\":\"\",\"otherParameters1Controller645\":\"QC Sticker\",\"otherParameterCrietrion1Controller645\":\"Should be oasted\",\"otherParameterS1Controller645\":\"\",\"otherParameterS1TestValue645\":false,\"otherParameterS1RemarksControllers645\":\"\",\"otherParameters2Controller645\":\"Module info Label\",\"otherParameterCrietrion2Controller645\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller645\":\"\",\"otherParameterS2TestValue645\":false,\"otherParameterS2RemarksControllers645\":\"\",\"otherParameters3Controller645\":\"RFID\",\"otherParameterCrietrion3Controller645\":\"Should be oasted\",\"otherParameterS3Controller645\":\"\",\"otherParameterS3TestValue645\":false,\"otherParameterS3RemarksControllers645\":\"\",\"otherParameters4Controller645\":\"Company Logo\",\"otherParameterCrietrion4Controller645\":\"Should be Pasted\",\"otherParameterS4Controller645\":\"\",\"otherParameterS4TestValue645\":false,\"otherParameterS4RemarksControllers645\":\"\",\"otherParameters5Controller645\":\"Junction Box\",\"otherParameterCrietrion5Controller645\":\"Should be Pasted\",\"otherParameterS5Controller645\":\"\",\"otherParameterS5TestValue645\":false,\"otherParameterS5RemarksControllers645\":\"\",\"otherParameters6Controller645\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller645\":\"Should be provided with JB\",\"otherParameterS6Controller645\":\"\",\"otherParameterS6TestValue645\":false,\"otherParameterS6RemarksControllers645\":\"\",\"otherParameters7Controller645\":\"Module Serial Number\",\"otherParameterCrietrion7Controller645\":\"Serial no should be provided\",\"otherParameterS7Controller645\":\"\",\"otherParameterS7TestValue645\":false,\"otherParameterS7RemarksControllers645\":\"\",\"otherParameters8Controller645\":\"Framing Condition\",\"otherParameterCrietrion8Controller645\":\"N/A\",\"otherParameterS8Controller645\":\"\",\"otherParameterS8TestValue645\":false,\"otherParameterS8RemarksControllers645\":\"\",\"otherParameters9Controller645\":\"HIPOT\",\"otherParameterCrietrion9Controller645\":\"N/A\",\"otherParameterS9Controller645\":\"\",\"otherParameterS9TestValue645\":false,\"otherParameterS9RemarksControllers645\":\"\"}'),
('07be0d74-2501-4d7d-ada5-1452a84d98a6','7964888a-9d08-4c47-bc29-c9a32d054145','{\"visualParametersController930\":\"Visual Parameters\",\"visualParameterCrietrion1Controller930\":\"Should be neat and clean\",\"visualParameterS1Controller930\":\"\",\"visualParameterS1TestValue930\":false,\"visualParameterS1RemarksControllers930\":\"\",\"visualParameterCrietrion2Controller930\":\"No breakage allowed\",\"visualParameterS2Controller930\":\"\",\"visualParameterS2TestValue930\":false,\"visualParameterS2RemarksControllers930\":\"\",\"visualParameterCrietrion3Controller930\":\"Packing Condition\",\"visualParameterS3Controller930\":\"\",\"visualParameterS3TestValue930\":false,\"visualParameterS3RemarksControllers930\":\"\",\"visualParameterCrietrion4Controller930\":\"Framing Condition\",\"visualParameterS4Controller930\":\"\",\"visualParameterS4TestValue930\":false,\"visualParameterS4RemarksControllers930\":\"\",\"moduleRatingParameters1Controller930\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller930\":\"\",\"moduleRatingParameterS1TestValue930\":false,\"moduleRatingParameterS1RemarksControllers930\":\"\",\"moduleRatingParameters2Controller930\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller930\":\"\",\"moduleRatingParameterS2TestValue930\":false,\"moduleRatingParameterS2RemarksControllers930\":\"\",\"otherParameters1Controller930\":\"QC Sticker\",\"otherParameterCrietrion1Controller930\":\"Should be oasted\",\"otherParameterS1Controller930\":\"\",\"otherParameterS1TestValue930\":false,\"otherParameterS1RemarksControllers930\":\"\",\"otherParameters2Controller930\":\"Module info Label\",\"otherParameterCrietrion2Controller930\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller930\":\"\",\"otherParameterS2TestValue930\":false,\"otherParameterS2RemarksControllers930\":\"\",\"otherParameters3Controller930\":\"RFID\",\"otherParameterCrietrion3Controller930\":\"Should be oasted\",\"otherParameterS3Controller930\":\"\",\"otherParameterS3TestValue930\":false,\"otherParameterS3RemarksControllers930\":\"\",\"otherParameters4Controller930\":\"Company Logo\",\"otherParameterCrietrion4Controller930\":\"Should be Pasted\",\"otherParameterS4Controller930\":\"\",\"otherParameterS4TestValue930\":false,\"otherParameterS4RemarksControllers930\":\"\",\"otherParameters5Controller930\":\"Junction Box\",\"otherParameterCrietrion5Controller930\":\"Should be Pasted\",\"otherParameterS5Controller930\":\"\",\"otherParameterS5TestValue930\":false,\"otherParameterS5RemarksControllers930\":\"\",\"otherParameters6Controller930\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller930\":\"Should be provided with JB\",\"otherParameterS6Controller930\":\"\",\"otherParameterS6TestValue930\":false,\"otherParameterS6RemarksControllers930\":\"\",\"otherParameters7Controller930\":\"Module Serial Number\",\"otherParameterCrietrion7Controller930\":\"Serial no should be provided\",\"otherParameterS7Controller930\":\"\",\"otherParameterS7TestValue930\":false,\"otherParameterS7RemarksControllers930\":\"\",\"otherParameters8Controller930\":\"Framing Condition\",\"otherParameterCrietrion8Controller930\":\"N/A\",\"otherParameterS8Controller930\":\"\",\"otherParameterS8TestValue930\":false,\"otherParameterS8RemarksControllers930\":\"\",\"otherParameters9Controller930\":\"HIPOT\",\"otherParameterCrietrion9Controller930\":\"N/A\",\"otherParameterS9Controller930\":\"\",\"otherParameterS9TestValue930\":false,\"otherParameterS9RemarksControllers930\":\"\"}','{\"visualParametersController230\":\"Visual Parameters\",\"visualParameterCrietrion1Controller230\":\"Should be neat and clean\",\"visualParameterS1Controller230\":\"\",\"visualParameterS1TestValue230\":false,\"visualParameterS1RemarksControllers230\":\"\",\"visualParameterCrietrion2Controller230\":\"No breakage allowed\",\"visualParameterS2Controller230\":\"\",\"visualParameterS2TestValue230\":false,\"visualParameterS2RemarksControllers230\":\"\",\"visualParameterCrietrion3Controller230\":\"Packing Condition\",\"visualParameterS3Controller230\":\"\",\"visualParameterS3TestValue230\":false,\"visualParameterS3RemarksControllers230\":\"\",\"visualParameterCrietrion4Controller230\":\"Framing Condition\",\"visualParameterS4Controller230\":\"\",\"visualParameterS4TestValue230\":false,\"visualParameterS4RemarksControllers230\":\"\",\"moduleRatingParameters1Controller230\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller230\":\"\",\"moduleRatingParameterS1TestValue230\":false,\"moduleRatingParameterS1RemarksControllers230\":\"\",\"moduleRatingParameters2Controller230\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller230\":\"\",\"moduleRatingParameterS2TestValue230\":false,\"moduleRatingParameterS2RemarksControllers230\":\"\",\"otherParameters1Controller230\":\"QC Sticker\",\"otherParameterCrietrion1Controller230\":\"Should be oasted\",\"otherParameterS1Controller230\":\"\",\"otherParameterS1TestValue230\":false,\"otherParameterS1RemarksControllers230\":\"\",\"otherParameters2Controller230\":\"Module info Label\",\"otherParameterCrietrion2Controller230\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller230\":\"\",\"otherParameterS2TestValue230\":false,\"otherParameterS2RemarksControllers230\":\"\",\"otherParameters3Controller230\":\"RFID\",\"otherParameterCrietrion3Controller230\":\"Should be oasted\",\"otherParameterS3Controller230\":\"\",\"otherParameterS3TestValue230\":false,\"otherParameterS3RemarksControllers230\":\"\",\"otherParameters4Controller230\":\"Company Logo\",\"otherParameterCrietrion4Controller230\":\"Should be Pasted\",\"otherParameterS4Controller230\":\"\",\"otherParameterS4TestValue230\":false,\"otherParameterS4RemarksControllers230\":\"\",\"otherParameters5Controller230\":\"Junction Box\",\"otherParameterCrietrion5Controller230\":\"Should be Pasted\",\"otherParameterS5Controller230\":\"\",\"otherParameterS5TestValue230\":false,\"otherParameterS5RemarksControllers230\":\"\",\"otherParameters6Controller230\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller230\":\"Should be provided with JB\",\"otherParameterS6Controller230\":\"\",\"otherParameterS6TestValue230\":false,\"otherParameterS6RemarksControllers230\":\"\",\"otherParameters7Controller230\":\"Module Serial Number\",\"otherParameterCrietrion7Controller230\":\"Serial no should be provided\",\"otherParameterS7Controller230\":\"\",\"otherParameterS7TestValue230\":false,\"otherParameterS7RemarksControllers230\":\"\",\"otherParameters8Controller230\":\"Framing Condition\",\"otherParameterCrietrion8Controller230\":\"N/A\",\"otherParameterS8Controller230\":\"\",\"otherParameterS8TestValue230\":false,\"otherParameterS8RemarksControllers230\":\"\",\"otherParameters9Controller230\":\"HIPOT\",\"otherParameterCrietrion9Controller230\":\"N/A\",\"otherParameterS9Controller230\":\"\",\"otherParameterS9TestValue230\":false,\"otherParameterS9RemarksControllers230\":\"\"}','{\"visualParametersController645\":\"Visual Parameters\",\"visualParameterCrietrion1Controller645\":\"Should be neat and clean\",\"visualParameterS1Controller645\":\"\",\"visualParameterS1TestValue645\":false,\"visualParameterS1RemarksControllers645\":\"\",\"visualParameterCrietrion2Controller645\":\"No breakage allowed\",\"visualParameterS2Controller645\":\"\",\"visualParameterS2TestValue645\":false,\"visualParameterS2RemarksControllers645\":\"\",\"visualParameterCrietrion3Controller645\":\"Packing Condition\",\"visualParameterS3Controller645\":\"\",\"visualParameterS3TestValue645\":false,\"visualParameterS3RemarksControllers645\":\"\",\"visualParameterCrietrion4Controller645\":\"Framing Condition\",\"visualParameterS4Controller645\":\"\",\"visualParameterS4TestValue645\":false,\"visualParameterS4RemarksControllers645\":\"\",\"moduleRatingParameters1Controller645\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller645\":\"\",\"moduleRatingParameterS1TestValue645\":false,\"moduleRatingParameterS1RemarksControllers645\":\"\",\"moduleRatingParameters2Controller645\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller645\":\"\",\"moduleRatingParameterS2TestValue645\":false,\"moduleRatingParameterS2RemarksControllers645\":\"\",\"otherParameters1Controller645\":\"QC Sticker\",\"otherParameterCrietrion1Controller645\":\"Should be oasted\",\"otherParameterS1Controller645\":\"\",\"otherParameterS1TestValue645\":false,\"otherParameterS1RemarksControllers645\":\"\",\"otherParameters2Controller645\":\"Module info Label\",\"otherParameterCrietrion2Controller645\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller645\":\"\",\"otherParameterS2TestValue645\":false,\"otherParameterS2RemarksControllers645\":\"\",\"otherParameters3Controller645\":\"RFID\",\"otherParameterCrietrion3Controller645\":\"Should be oasted\",\"otherParameterS3Controller645\":\"\",\"otherParameterS3TestValue645\":false,\"otherParameterS3RemarksControllers645\":\"\",\"otherParameters4Controller645\":\"Company Logo\",\"otherParameterCrietrion4Controller645\":\"Should be Pasted\",\"otherParameterS4Controller645\":\"\",\"otherParameterS4TestValue645\":false,\"otherParameterS4RemarksControllers645\":\"\",\"otherParameters5Controller645\":\"Junction Box\",\"otherParameterCrietrion5Controller645\":\"Should be Pasted\",\"otherParameterS5Controller645\":\"\",\"otherParameterS5TestValue645\":false,\"otherParameterS5RemarksControllers645\":\"\",\"otherParameters6Controller645\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller645\":\"Should be provided with JB\",\"otherParameterS6Controller645\":\"\",\"otherParameterS6TestValue645\":false,\"otherParameterS6RemarksControllers645\":\"\",\"otherParameters7Controller645\":\"Module Serial Number\",\"otherParameterCrietrion7Controller645\":\"Serial no should be provided\",\"otherParameterS7Controller645\":\"\",\"otherParameterS7TestValue645\":false,\"otherParameterS7RemarksControllers645\":\"\",\"otherParameters8Controller645\":\"Framing Condition\",\"otherParameterCrietrion8Controller645\":\"N/A\",\"otherParameterS8Controller645\":\"\",\"otherParameterS8TestValue645\":false,\"otherParameterS8RemarksControllers645\":\"\",\"otherParameters9Controller645\":\"HIPOT\",\"otherParameterCrietrion9Controller645\":\"N/A\",\"otherParameterS9Controller645\":\"\",\"otherParameterS9TestValue645\":false,\"otherParameterS9RemarksControllers645\":\"\"}'),
('f09b3f16-c5fa-42df-b090-0cbf8f4d404b','712bcf04-fa61-4578-bc4a-33f40a9aca64','{\"visualParametersController930\":\"Visual Parameters\",\"visualParameterCrietrion1Controller930\":\"Should be neat and clean\",\"visualParameterS1Controller930\":\"Gs03540M12724007264,6999,7245,7034,7032\",\"visualParameterS1TestValue930\":true,\"visualParameterS1RemarksControllers930\":\"\",\"visualParameterCrietrion2Controller930\":\"No breakage allowed\",\"visualParameterS2Controller930\":\"Gs03540M12724007264,6999,7245,7034,7032\",\"visualParameterS2TestValue930\":true,\"visualParameterS2RemarksControllers930\":\"\",\"visualParameterCrietrion3Controller930\":\"Packing Condition\",\"visualParameterS3Controller930\":\"Gs03540M12724007264,6999,7245,7034,7032\",\"visualParameterS3TestValue930\":true,\"visualParameterS3RemarksControllers930\":\"\",\"visualParameterCrietrion4Controller930\":\"Framing Condition\",\"visualParameterS4Controller930\":\"Gs03540M12724007264,6999,7245,7034,7032\",\"visualParameterS4TestValue930\":true,\"visualParameterS4RemarksControllers930\":\"\",\"moduleRatingParameters1Controller930\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller930\":\"540w,\",\"moduleRatingParameterS1TestValue930\":true,\"moduleRatingParameterS1RemarksControllers930\":\"\",\"moduleRatingParameters2Controller930\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller930\":\"24v\",\"moduleRatingParameterS2TestValue930\":true,\"moduleRatingParameterS2RemarksControllers930\":\"\",\"otherParameters1Controller930\":\"QC Sticker\",\"otherParameterCrietrion1Controller930\":\"Should be oasted\",\"otherParameterS1Controller930\":\"Gs03540M12724007264,6999,7245,7034,7032\",\"otherParameterS1TestValue930\":true,\"otherParameterS1RemarksControllers930\":\"\",\"otherParameters2Controller930\":\"Module info Label\",\"otherParameterCrietrion2Controller930\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller930\":\"24V,540W\",\"otherParameterS2TestValue930\":true,\"otherParameterS2RemarksControllers930\":\"\",\"otherParameters3Controller930\":\"RFID\",\"otherParameterCrietrion3Controller930\":\"Should be oasted\",\"otherParameterS3Controller930\":\"Gs03540M12724007264,6999,7245,7034,7032\",\"otherParameterS3TestValue930\":true,\"otherParameterS3RemarksControllers930\":\"\",\"otherParameters4Controller930\":\"Company Logo\",\"otherParameterCrietrion4Controller930\":\"Should be Pasted\",\"otherParameterS4Controller930\":\"GS03540M12724007287,7042,7297,7230,7018\",\"otherParameterS4TestValue930\":true,\"otherParameterS4RemarksControllers930\":\"\",\"otherParameters5Controller930\":\"Junction Box\",\"otherParameterCrietrion5Controller930\":\"Should be Pasted\",\"otherParameterS5Controller930\":\"GS03540M12724007287,7042,7297,7230,7018\",\"otherParameterS5TestValue930\":true,\"otherParameterS5RemarksControllers930\":\"\",\"otherParameters6Controller930\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller930\":\"Should be provided with JB\",\"otherParameterS6Controller930\":\"GS03540M12724007287,7042,7297,7230,7018\",\"otherParameterS6TestValue930\":true,\"otherParameterS6RemarksControllers930\":\"\",\"otherParameters7Controller930\":\"Module Serial Number\",\"otherParameterCrietrion7Controller930\":\"Serial no should be provided\",\"otherParameterS7Controller930\":\"GS03540M12724007287,7042,7297,7230,7018\",\"otherParameterS7TestValue930\":true,\"otherParameterS7RemarksControllers930\":\"\",\"otherParameters8Controller930\":\"Framing Condition\",\"otherParameterCrietrion8Controller930\":\"N/A\",\"otherParameterS8Controller930\":\"GS03540M12724007287,7042,7297,7230,7018\",\"otherParameterS8TestValue930\":true,\"otherParameterS8RemarksControllers930\":\"\",\"otherParameters9Controller930\":\"HIPOT\",\"otherParameterCrietrion9Controller930\":\"N/A\",\"otherParameterS9Controller930\":\"GS03540M12724007287,7042,7297,7230,7018\",\"otherParameterS9TestValue930\":true,\"otherParameterS9RemarksControllers930\":\"\"}','{\"visualParametersController230\":\"Visual Parameters\",\"visualParameterCrietrion1Controller230\":\"Should be neat and clean\",\"visualParameterS1Controller230\":\"GS03540M12724007287,7042,7297,7230,7018\",\"visualParameterS1TestValue230\":true,\"visualParameterS1RemarksControllers230\":\"\",\"visualParameterCrietrion2Controller230\":\"No breakage allowed\",\"visualParameterS2Controller230\":\"GS03540M12724007287,7042,7297,7230,7018\",\"visualParameterS2TestValue230\":true,\"visualParameterS2RemarksControllers230\":\"\",\"visualParameterCrietrion3Controller230\":\"Packing Condition\",\"visualParameterS3Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"visualParameterS3TestValue230\":true,\"visualParameterS3RemarksControllers230\":\"\",\"visualParameterCrietrion4Controller230\":\"Framing Condition\",\"visualParameterS4Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"visualParameterS4TestValue230\":true,\"visualParameterS4RemarksControllers230\":\"\",\"moduleRatingParameters1Controller230\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller230\":\"540W,24v\",\"moduleRatingParameterS1TestValue230\":true,\"moduleRatingParameterS1RemarksControllers230\":\"\",\"moduleRatingParameters2Controller230\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller230\":\"24V\",\"moduleRatingParameterS2TestValue230\":true,\"moduleRatingParameterS2RemarksControllers230\":\"\",\"otherParameters1Controller230\":\"QC Sticker\",\"otherParameterCrietrion1Controller230\":\"Should be oasted\",\"otherParameterS1Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS1TestValue230\":true,\"otherParameterS1RemarksControllers230\":\"\",\"otherParameters2Controller230\":\"Module info Label\",\"otherParameterCrietrion2Controller230\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller230\":\"540W\",\"otherParameterS2TestValue230\":true,\"otherParameterS2RemarksControllers230\":\"\",\"otherParameters3Controller230\":\"RFID\",\"otherParameterCrietrion3Controller230\":\"Should be oasted\",\"otherParameterS3Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS3TestValue230\":true,\"otherParameterS3RemarksControllers230\":\"\",\"otherParameters4Controller230\":\"Company Logo\",\"otherParameterCrietrion4Controller230\":\"Should be Pasted\",\"otherParameterS4Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS4TestValue230\":true,\"otherParameterS4RemarksControllers230\":\"\",\"otherParameters5Controller230\":\"Junction Box\",\"otherParameterCrietrion5Controller230\":\"Should be Pasted\",\"otherParameterS5Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS5TestValue230\":true,\"otherParameterS5RemarksControllers230\":\"\",\"otherParameters6Controller230\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller230\":\"Should be provided with JB\",\"otherParameterS6Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS6TestValue230\":true,\"otherParameterS6RemarksControllers230\":\"\",\"otherParameters7Controller230\":\"Module Serial Number\",\"otherParameterCrietrion7Controller230\":\"Serial no should be provided\",\"otherParameterS7Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS7TestValue230\":true,\"otherParameterS7RemarksControllers230\":\"\",\"otherParameters8Controller230\":\"Framing Condition\",\"otherParameterCrietrion8Controller230\":\"N/A\",\"otherParameterS8Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS8TestValue230\":true,\"otherParameterS8RemarksControllers230\":\"\",\"otherParameters9Controller230\":\"HIPOT\",\"otherParameterCrietrion9Controller230\":\"N/A\",\"otherParameterS9Controller230\":\"Gs03540M12724007287,7042,7297,7039,7290\",\"otherParameterS9TestValue230\":true,\"otherParameterS9RemarksControllers230\":\"\"}','{\"visualParametersController645\":\"Visual Parameters\",\"visualParameterCrietrion1Controller645\":\"Should be neat and clean\",\"visualParameterS1Controller645\":\"\",\"visualParameterS1TestValue645\":false,\"visualParameterS1RemarksControllers645\":\"\",\"visualParameterCrietrion2Controller645\":\"No breakage allowed\",\"visualParameterS2Controller645\":\"\",\"visualParameterS2TestValue645\":false,\"visualParameterS2RemarksControllers645\":\"\",\"visualParameterCrietrion3Controller645\":\"Packing Condition\",\"visualParameterS3Controller645\":\"\",\"visualParameterS3TestValue645\":false,\"visualParameterS3RemarksControllers645\":\"\",\"visualParameterCrietrion4Controller645\":\"Framing Condition\",\"visualParameterS4Controller645\":\"\",\"visualParameterS4TestValue645\":false,\"visualParameterS4RemarksControllers645\":\"\",\"moduleRatingParameters1Controller645\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller645\":\"\",\"moduleRatingParameterS1TestValue645\":false,\"moduleRatingParameterS1RemarksControllers645\":\"\",\"moduleRatingParameters2Controller645\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller645\":\"\",\"moduleRatingParameterS2TestValue645\":false,\"moduleRatingParameterS2RemarksControllers645\":\"\",\"otherParameters1Controller645\":\"QC Sticker\",\"otherParameterCrietrion1Controller645\":\"Should be oasted\",\"otherParameterS1Controller645\":\"\",\"otherParameterS1TestValue645\":false,\"otherParameterS1RemarksControllers645\":\"\",\"otherParameters2Controller645\":\"Module info Label\",\"otherParameterCrietrion2Controller645\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller645\":\"\",\"otherParameterS2TestValue645\":false,\"otherParameterS2RemarksControllers645\":\"\",\"otherParameters3Controller645\":\"RFID\",\"otherParameterCrietrion3Controller645\":\"Should be oasted\",\"otherParameterS3Controller645\":\"\",\"otherParameterS3TestValue645\":false,\"otherParameterS3RemarksControllers645\":\"\",\"otherParameters4Controller645\":\"Company Logo\",\"otherParameterCrietrion4Controller645\":\"Should be Pasted\",\"otherParameterS4Controller645\":\"\",\"otherParameterS4TestValue645\":false,\"otherParameterS4RemarksControllers645\":\"\",\"otherParameters5Controller645\":\"Junction Box\",\"otherParameterCrietrion5Controller645\":\"Should be Pasted\",\"otherParameterS5Controller645\":\"\",\"otherParameterS5TestValue645\":false,\"otherParameterS5RemarksControllers645\":\"\",\"otherParameters6Controller645\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller645\":\"Should be provided with JB\",\"otherParameterS6Controller645\":\"\",\"otherParameterS6TestValue645\":false,\"otherParameterS6RemarksControllers645\":\"\",\"otherParameters7Controller645\":\"Module Serial Number\",\"otherParameterCrietrion7Controller645\":\"Serial no should be provided\",\"otherParameterS7Controller645\":\"\",\"otherParameterS7TestValue645\":false,\"otherParameterS7RemarksControllers645\":\"\",\"otherParameters8Controller645\":\"Framing Condition\",\"otherParameterCrietrion8Controller645\":\"N/A\",\"otherParameterS8Controller645\":\"\",\"otherParameterS8TestValue645\":false,\"otherParameterS8RemarksControllers645\":\"\",\"otherParameters9Controller645\":\"HIPOT\",\"otherParameterCrietrion9Controller645\":\"N/A\",\"otherParameterS9Controller645\":\"\",\"otherParameterS9TestValue645\":false,\"otherParameterS9RemarksControllers645\":\"\"}');

/*Table structure for table `Framing` */

DROP TABLE IF EXISTS `Framing`;

CREATE TABLE `Framing` (
  `FramingId` varchar(255) DEFAULT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `Sample` varchar(55) DEFAULT NULL,
  `FramingObservation` longtext DEFAULT NULL,
  `FramingDimension` longtext DEFAULT NULL,
  `Stage` varchar(55) DEFAULT NULL,
  UNIQUE KEY `FramingId` (`FramingId`),
  KEY `PreLamDetailId` (`PreLamDetailId`),
  CONSTRAINT `Framing_ibfk_1` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `Framing` */

insert  into `Framing`(`FramingId`,`PreLamDetailId`,`Sample`,`FramingObservation`,`FramingDimension`,`Stage`) values 
('a9ed55b4-2a08-47d4-a444-cc9bb28c4996','279c6a7f-5f74-4905-afac-7560fab558dc','GS03540M12724004170,4172,4175,4169,4180','Uniform Gluing','{\"x1\":\"1086 mm\",\"x2\":\"1099 mm\",\"y1\":\"1000 mm\",\"y2\":\"1640 mm\",\"l1\":\"2278 mm\",\"l2\":\"2278 mm\",\"w1\":\"1134 mm\",\"w2\":\"1134 mm\"}','1'),
('27ed5dd4-9181-4735-bc1f-00c2929b529d','279c6a7f-5f74-4905-afac-7560fab558dc','GS03540M12724004305','uniform','{\"x1\":\"1086 mm\",\"x2\":\" 1098 mm\",\"y1\":\"1000 mm\",\"y2\":\"1640 mm\",\"l1\":\"2278 mm\",\"l2\":\"2277 mm\",\"w1\":\"1134 mm\",\"w2\":\"1134 mm\"}','4'),
('1afebf56-eecf-43f0-93eb-5f74d0431e2e','279c6a7f-5f74-4905-afac-7560fab558dc','','GS03540M12724004303,4305,4310','{\"x1\":\"1085mm\",\"x2\":\"1098 mm\",\"y1\":\"1000 mm\",\"y2\":\"1640 mm\",\"l1\":\"2278 mm\",\"l2\":\"2278 mm\",\"w1\":\"1134 mm\",\"w2\":\"1134 mm\"}','3'),
('ce2e460f-5069-4995-a6f7-3e7a81d96834','279c6a7f-5f74-4905-afac-7560fab558dc','GS03540M12724004168,4203','uniform Gluing','{\"x1\":\"1086 mm\",\"x2\":\"1099 mm\",\"y1\":\" 1000 mm\",\"y2\":\"1640 mm\",\"l1\":\"2278 mm\",\"l2\":\"2278 mm\",\"w1\":\"1134 mm\",\"w2\":\"1134 mm\"}','2'),
('62da83ce-4bf9-4293-972c-a722dc74fe3e','279c6a7f-5f74-4905-afac-7560fab558dc','GS03540M12724004505','uniform','{\"x1\":\"1085 mm\",\"x2\":\"1099 mm\",\"y1\":\"1000 mm\",\"y2\":\"1640 mm\",\"l1\":\"2278 mm\",\"l2\":\"2277 mm\",\"w1\":\"1134 mm\",\"w2\":\"1134 mm\"}','5');

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
  `Samples` longtext DEFAULT NULL,
  `CreatedDate` varchar(255) DEFAULT NULL,
  `UpdatedDate` varchar(255) DEFAULT NULL,
  KEY `nk_SolarDetailID` (`SolarDetailID`),
  CONSTRAINT `nk_SolarDetailID` FOREIGN KEY (`SolarDetailID`) REFERENCES `IQCSolarDetails` (`SolarDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `IQCSolar` */

insert  into `IQCSolar`(`IQCSolarID`,`SolarDetailID`,`CheckType`,`Characterstics`,`MeasuringMethod`,`Sampling`,`Reference`,`AcceptanceCriteria`,`SampleSize`,`Samples`,`CreatedDate`,`UpdatedDate`) values 
('b94dab9a-293a-46d2-91e7-c0ea550f14e0','1ab345fc-da84-4dac-b488-551a05201ecd','Packaging','Packing (Make Type)','N/A','Whole Lot','As Per PO/Invoice(Approved Drawing)','No Physical Damage','1','[{\"SampleBarcode\":\"raw-0000006522\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 09:11:33',''),
('caa754b5-82ec-430c-9d78-9f3067c6f322','1ab345fc-da84-4dac-b488-551a05201ecd','Visual','Dent, Anodizing Marks, Scratches, Bend De Marks, Patches, Delemination Transpotation Damage','N/A','SIL S1 AQL 2.5','As Per PO/Invoice(Approved Drawing)','COC','8','[{\"SampleBarcode\":\"raw-0000006522\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006523\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006520\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006521\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006524\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006553\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006517\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006516\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 09:11:33',''),
('118f40f2-34c2-4a3d-a84f-c72b91ac2fbc','1ab345fc-da84-4dac-b488-551a05201ecd','Physical','Weight Per Meter, Composition','Measuring Tape, Weighing Scale','SIL S1 AQL 2.5','As Per PO/Invoice(Approved Drawing)','COC','8','[{\"SampleBarcode\":\"raw-0000006522\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006523\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006520\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006521\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006524\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006553\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006516\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006517\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 09:11:33',''),
('55704248-32f8-4635-9a30-1e2f6c16f183','1ab345fc-da84-4dac-b488-551a05201ecd','FrontBus','Physical Dimensions L X W Mounting Hole x Pitch Mounting Hole Y Pitch','Verner Calliper/Measuring Scale','SIL S1 AQL 2.5','As Per Approved Drawing','COC','8','[{\"SampleBarcode\":\"raw-0000006522\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006523\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006521\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006520\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006524\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006553\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006516\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006517\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 09:11:33',''),
('679c6e3f-8804-4663-8802-5d1c9e73445d','1ab345fc-da84-4dac-b488-551a05201ecd','Verification','Anodizing Thickness','Anodizing Meter','SIL S1 AQL 2.5','Supplier Material Data Sheet','Anodizing Thickness >/ 15 microns','8','[{\"SampleBarcode\":\"raw-0000006516\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006517\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006553\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006524\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006520\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006521\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006523\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006522\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 09:11:33',''),
('01ed3d09-f89a-4581-ab86-2353060e5c36','1ab345fc-da84-4dac-b488-551a05201ecd','Electrical','Frame Material','N/A','N/A','Supplier COC','GSPL Specification/COC','1','[{\"SampleBarcode\":\"raw-0000006522\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 09:11:33',''),
('6993258a-362b-47d3-9fff-66fb8f3cb24b','8dde278e-2738-471f-a4bd-af440b84cf91','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"raw-0000006499\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:11:17',''),
('57b6113c-d5fb-4481-b51a-3fd84bb90786','8dde278e-2738-471f-a4bd-af440b84cf91','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"SampleBarcode\":\"raw-0000006498\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006499\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006500\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006501\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006491\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:11:17',''),
('8b081728-a646-4425-8977-9302e1d2836a','8dde278e-2738-471f-a4bd-af440b84cf91','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"SampleBarcode\":\"7258211079411\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006499\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006500\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006501\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006491\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:11:17',''),
('9eb179c8-4127-4012-a5b0-94649036900e','8dde278e-2738-471f-a4bd-af440b84cf91','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"SampleBarcode\":\"raw-0000006499\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:11:17',''),
('3e916b22-f60f-4b32-ae45-22e4ebc3228f','8dde278e-2738-471f-a4bd-af440b84cf91','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','5','[{\"SampleBarcode\":\"raw-0000006498\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006499\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006500\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006501\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006491\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:11:17',''),
('efefeca6-8910-448c-a885-49847f84063d','8dde278e-2738-471f-a4bd-af440b84cf91','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"SampleBarcode\":\"raw-0000006499\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:11:17',''),
('3a7920f6-dc61-4980-ba2e-5e78126e3628','1196c3bc-8617-49a9-a658-658ab78827f7','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"raw-0000007420\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 05:50:45',''),
('4a656c93-cd66-4bb6-9afd-439612f0c7ee','1196c3bc-8617-49a9-a658-658ab78827f7','Visual','Width X Thickness','Verner Calliper/Measuring Scale','SIL S3 AQL 4.0','COC','Data sheet/IQC Ribbon','8','[{\"SampleBarcode\":\"raw-0000006652\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006653\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006651\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006593\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006592\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006588\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006594\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006590\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 05:50:45',''),
('e920fba4-4f90-47c8-8cb9-869676c5cbf9','1196c3bc-8617-49a9-a658-658ab78827f7','Physical','Coating Thickness','N/A','As Per Material Data sheet','COC','Coating Thickness > 20-25 Microns','1','[{\"SampleBarcode\":\"raw-0000006588\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 05:50:45',''),
('12c62487-d375-4ed6-ae1b-7af7c704da5e','1196c3bc-8617-49a9-a658-658ab78827f7','FrontBus','Soldering Peel Test','Digital Force Gauge','One Sample Per Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 3N Cell Back Side','1','[{\"SampleBarcode\":\"raw-0000006590\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 05:50:45',''),
('81adeb46-93bb-4ebf-a2d6-0b94e99b92a7','1196c3bc-8617-49a9-a658-658ab78827f7','Verification','Tensile Strength','N/A','N/A','As Per COC','GSPL Technical Specification/COC','1','[{\"SampleBarcode\":\"raw-0000006588\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 05:50:45',''),
('e405ea9f-6f70-4326-89ca-1c2c112463ff','1196c3bc-8617-49a9-a658-658ab78827f7','Electrical','Yield Strength','N/A','N/A','As Per COC','GSPL Technical Specification/COC','1','[{\"SampleBarcode\":\"raw-0000006590\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 05:50:45',''),
('ce1afd6b-0853-4c8e-b382-543bfac45ba6','1196c3bc-8617-49a9-a658-658ab78827f7','Performance','Resistivity','N/A','N/A','As Per COC','GSPL Technical Specification/COC','1','[{\"SampleBarcode\":\"raw-0000006588\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 05:50:46',''),
('13783fdb-4591-4826-a995-07f8e3a6a711','07c944d3-e5d4-4d33-9291-e320001315b6','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"IXA01920\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:29:58',''),
('9b91236e-9c34-478b-8dd1-c559b7de9a39','07c944d3-e5d4-4d33-9291-e320001315b6','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"SampleBarcode\":\"IXA01920\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"6XA00988\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"5XA00333\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"6XA01009\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"6XA01006\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:29:58',''),
('f25e74eb-b67f-4e87-96e3-f367a1bd2b05','07c944d3-e5d4-4d33-9291-e320001315b6','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"SampleBarcode\":\"IXA01920\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"6XA00988\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"5XA00333\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"6XA01009\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"6XA01006\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:29:58',''),
('9a97e946-6789-4d49-a209-d05aa4215cd8','07c944d3-e5d4-4d33-9291-e320001315b6','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"SampleBarcode\":\"IXA01920\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:29:58',''),
('84e5ef86-34e2-4acb-8fc5-89853e0d8fd0','07c944d3-e5d4-4d33-9291-e320001315b6','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','1','[{\"SampleBarcode\":\"IXA01920\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:29:58',''),
('79f659a5-4dfe-4fa5-b72d-b9fa0cbe5c83','07c944d3-e5d4-4d33-9291-e320001315b6','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"SampleBarcode\":\"IXA01920\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 12:29:58',''),
('f168d1e9-b87e-4357-a85f-4a98f5b70db8','a386a6c9-d2e6-40c0-8dee-978a47b342af','Packaging','Packing (Make Type Expiry date)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice Before expiry Date','1','[{\"SampleBarcode\":\"raw-0000006463\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 13:23:17',''),
('94d08b9a-b13b-457c-a98e-09bd5f15cbb9','a386a6c9-d2e6-40c0-8dee-978a47b342af','Visual','Dimension(W X T)/Cut/Crease/Spots/Color','Verner Calliper/Measuring Scale','SIL S1 AQL 4.0','As Per Data Sheet/COC','Within tolerance of + 5 mm','8','[{\"SampleBarcode\":\"raw-0000006463\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006461\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006444\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006131\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006075\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006544\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006072\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"raw-0000006074\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 13:23:17',''),
('c4a79f4d-9b05-4e72-a428-a9672c1762ab','a386a6c9-d2e6-40c0-8dee-978a47b342af','Physical','Adhesion to EVA','Peel Tester','One Sample Per Lot','GSPL Technical Specification','EVA/BS 70 N/10 mm','1','[{\"SampleBarcode\":\"4547567775522\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 13:23:17',''),
('03cab322-7d08-4e27-bbff-d08cd84df48a','a386a6c9-d2e6-40c0-8dee-978a47b342af','FrontBus','Breakdown Voltage','N/A','N/A','Supplier COC/CDF/Test Report','As Per COC / GSPL Technical Specification','1','[{\"SampleBarcode\":\"raw-0000006074\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 13:23:17',''),
('65244958-9853-4ce4-afdf-f07029c7c672','a386a6c9-d2e6-40c0-8dee-978a47b342af','Verification','Partial Discharge','N/A','N/A','Supplier COC/CDF/Test Report','>/ 1500VDC','1','[{\"SampleBarcode\":\"raw-0000006075\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','07-05-2024 13:23:17',''),
('37d6e0ca-1aa2-4f8e-9e49-473367274f1e','ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"HXB00151\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 06:45:22',''),
('f15ccb3e-6849-4a4b-aaed-c721592af360','ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"SampleBarcode\":\"HXB00151\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"https://drive.google.com/file/d/1e5cIKV84pV3rcEXNgECWWbyKqsq_wJDC/view?usp=sha\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00154\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00135\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00114\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 06:45:22',''),
('d1335575-6ca9-43b8-9b75-fd78ae1c56bb','ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"SampleBarcode\":\"https://drive.google.com/file/d/1e5cIKV84pV3rcEXNgECWWbyKqsq_wJDC/view?usp=sha\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"https://drive.google.com/file/d/1e5cIKV84pV3rcEXNgECWWbyKqsq_wJDC/view?usp=sha\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00154\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00135\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00114\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 06:45:22',''),
('50a8d480-f945-439a-acb2-e2c2f9dc4f5b','ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"SampleBarcode\":\"https://drive.google.com/file/d/1e5cIKV84pV3rcEXNgECWWbyKqsq_wJDC/view?usp=sha\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 06:45:22',''),
('ed3ddce2-1508-41de-9341-8fa55372e514','ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','1','[{\"SampleBarcode\":\"https://drive.google.com/file/d/1e5cIKV84pV3rcEXNgECWWbyKqsq_wJDC/view?usp=sha\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 06:45:22',''),
('9e481246-c024-491c-bafc-0eac94196798','ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"SampleBarcode\":\"HXB00151\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 06:45:22',''),
('e5d869e2-6d1c-4eca-8fe3-61c5b2e8a8d6','86bbf229-92c7-4476-b18a-c10732beb8e8','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"HXB00111\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 07:09:43',''),
('12f83167-0de2-417e-a325-e7847bc20fcd','86bbf229-92c7-4476-b18a-c10732beb8e8','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"SampleBarcode\":\"HXB00111\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"04021726\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"07975578\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00044\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00047\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 07:09:43',''),
('90449297-3624-4d2e-891a-a93e496dacb6','86bbf229-92c7-4476-b18a-c10732beb8e8','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"SampleBarcode\":\"HXB00111\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"11281771\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"07975578\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00044\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00047\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 07:09:43',''),
('46a8b476-41d3-4e49-8a50-27dc12d6261c','86bbf229-92c7-4476-b18a-c10732beb8e8','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"SampleBarcode\":\"HXB00047\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 07:09:44',''),
('91c487fa-137b-40d0-bb31-ad43bdd354c7','86bbf229-92c7-4476-b18a-c10732beb8e8','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','1','[{\"SampleBarcode\":\"HXB00047\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 07:09:44',''),
('9600de20-36da-4784-a3e8-bdbfdbb99d8a','86bbf229-92c7-4476-b18a-c10732beb8e8','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"SampleBarcode\":\"HXB00047\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 07:09:44',''),
('b242c580-2af7-4fd0-abf1-4882500d6a00','ff68e09f-9b03-4043-88b6-3932d5f00da3','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"HXB00133\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 09:59:02',''),
('9e3d82a7-3fa3-4582-8bea-5163664f85dc','ff68e09f-9b03-4043-88b6-3932d5f00da3','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"SampleBarcode\":\"HXB00133\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00134\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00148\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00132\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00129\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 09:59:02',''),
('a3a6f56e-3608-4ec8-9fcb-eb1232e0c496','ff68e09f-9b03-4043-88b6-3932d5f00da3','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"SampleBarcode\":\"HXB00133\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00134\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00132\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00148\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00129\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 09:59:02',''),
('80dc5127-3de5-4ffb-8844-d3c631a569a1','ff68e09f-9b03-4043-88b6-3932d5f00da3','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"SampleBarcode\":\"HXB00129\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 09:59:02',''),
('3834a3b1-369b-4a75-a701-a3eadb91bbae','ff68e09f-9b03-4043-88b6-3932d5f00da3','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','1','[{\"SampleBarcode\":\"HXB00129\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 09:59:02',''),
('768f2619-1033-4f2b-9d3c-81aa37394455','ff68e09f-9b03-4043-88b6-3932d5f00da3','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"SampleBarcode\":\"HXB00148\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 09:59:02',''),
('e53667e4-2bce-46a2-bb18-34ffae477076','0470b2a1-035e-43fe-957e-209a406ab14c','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"X20240321H1D000E00163\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 14:03:06',''),
('88df369e-71cc-4d1e-8ab7-6ed71cde8b58','0470b2a1-035e-43fe-957e-209a406ab14c','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','8','[{\"SampleBarcode\":\"X20240326H1D03AF00266\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00163\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240326H1D01AF00132\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240328H1D06AF00106\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00230\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00170\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00161\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 14:03:06',''),
('f61ab7bc-921c-4cbb-bbd8-61ad6ed630d2','0470b2a1-035e-43fe-957e-209a406ab14c','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','8','[{\"SampleBarcode\":\"X20240328H1D06AF00106\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240328H1D06AF00106\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00230\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00163\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00161\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00170\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240326H1D01AF00132\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 14:03:07',''),
('98abf070-de4d-4d36-8142-abe25f4ea1cc','0470b2a1-035e-43fe-957e-209a406ab14c','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"SampleBarcode\":\"X20240328H1D06AF00106\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00230\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"04249717\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00161\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 14:03:07',''),
('91931163-e743-460b-a94a-28382b058700','0470b2a1-035e-43fe-957e-209a406ab14c','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','8','[{\"SampleBarcode\":\"X20240321H1D000E00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240326H1D01AF00132\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00163\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240326H1D03AF00266\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240328H1D06AF00106\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"00141178\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00170\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00161\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 14:03:07',''),
('3a5b67ca-09dd-410d-8c73-5eacc8307e58','0470b2a1-035e-43fe-957e-209a406ab14c','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"SampleBarcode\":\"X20240321H1D000E00163\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 14:03:07',''),
('3519db4e-2058-4faf-9a47-c638b7fb0381','0470b2a1-035e-43fe-957e-209a406ab14c','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"SampleBarcode\":\"X20240326H1D03AF00266\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00163\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240326H1D01AF00132\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"X20240321H1D000E00170\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','08-05-2024 14:03:07',''),
('ac14989d-4ae4-487f-add5-c06b1ece17fe','fff10e7b-cd5e-4b3e-9871-767624a35eb6','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"05434483\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 05:18:45',''),
('e383e25a-b2ba-46aa-9cf4-85975aafeb4b','fff10e7b-cd5e-4b3e-9871-767624a35eb6','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"SampleBarcode\":\"05434483\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05434584\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05434564\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05434502\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05439508\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 05:18:45',''),
('d9a7f560-3f2a-40b1-9feb-645c3a75328b','fff10e7b-cd5e-4b3e-9871-767624a35eb6','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"SampleBarcode\":\"05434483\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05434584\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05434564\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05434502\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"05439508\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 05:18:45',''),
('85fab8f0-b31f-4198-b4ee-1799e71a3a5a','fff10e7b-cd5e-4b3e-9871-767624a35eb6','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"SampleBarcode\":\"05439508\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 05:18:45',''),
('5b73ad9b-c7ec-4891-ac0b-db10ae0384d8','fff10e7b-cd5e-4b3e-9871-767624a35eb6','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','1','[{\"SampleBarcode\":\"05439508\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 05:18:45',''),
('13e00386-0a71-4e0d-afd0-40f049343f1f','fff10e7b-cd5e-4b3e-9871-767624a35eb6','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"SampleBarcode\":\"05439508\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 05:18:45',''),
('228f1079-5338-4b3d-91dc-d37b6e6fb565','5bb9778a-5872-4033-ae98-32d986dacfcd','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"HXB00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 09:45:24',''),
('f1dfb66b-4568-4b16-8209-35c45d48326b','5bb9778a-5872-4033-ae98-32d986dacfcd','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','5','[{\"SampleBarcode\":\"HXB00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00195\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00186\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00183\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00193\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 09:45:24',''),
('ffe40fb2-cd0f-42a4-8bec-69525ef6528e','5bb9778a-5872-4033-ae98-32d986dacfcd','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','5','[{\"SampleBarcode\":\"HXB00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00195\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00186\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00183\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00193\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 09:45:24',''),
('edda4575-0192-4d49-babe-85cafb1df3f1','5bb9778a-5872-4033-ae98-32d986dacfcd','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"SampleBarcode\":\"HXB00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 09:45:24',''),
('97ee4530-bbfe-4a91-b78e-9a43526e47c0','5bb9778a-5872-4033-ae98-32d986dacfcd','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','5','[{\"SampleBarcode\":\"HXB00173\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00195\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00186\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00183\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"HXB00193\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 09:45:24',''),
('4fbbe451-8def-4c46-8046-7d0895cd3b0b','5bb9778a-5872-4033-ae98-32d986dacfcd','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"SampleBarcode\":\"HXB00193\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 09:45:24',''),
('655a2b1f-fa0a-4cd7-8d77-799f5ef55134','76743097-9f62-4bf0-a35d-d924e2e1d126','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"SampleBarcode\":\"A914131322404280298\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 12:22:30',''),
('760e3137-c24c-47f0-b9b5-1c168aa688d0','76743097-9f62-4bf0-a35d-d924e2e1d126','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','8','[{\"SampleBarcode\":\"C914131322404280266\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280298\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"1148133678778\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280333\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"B914131322404280341\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"C914131322404290320\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290338\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290369\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 12:22:31',''),
('480e7d42-a822-4d6a-808a-eb48b1f9a8e2','76743097-9f62-4bf0-a35d-d924e2e1d126','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','8','[{\"SampleBarcode\":\"9502150437787\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"C914131322404280266\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280298\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280333\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290369\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"B914131322404280341\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"C914131322404290320\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290338\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 12:22:31',''),
('b6a5b986-7ad5-4c6b-9348-57e84e20c3ad','76743097-9f62-4bf0-a35d-d924e2e1d126','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"SampleBarcode\":\"B914131322404280341\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290369\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280333\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280298\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"C914131322404280266\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 12:22:31',''),
('89eecfe5-c2d2-406e-b8cf-75620d8c4f68','76743097-9f62-4bf0-a35d-d924e2e1d126','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','8','[{\"SampleBarcode\":\"C91:2903=0\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290338\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"B914131322404280099\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"C914131322404280266\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280298\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280333\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290369\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"B914131322404280341\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 12:22:31',''),
('61c0c415-a88a-4a98-82ab-b6ab57d7a5ea','76743097-9f62-4bf0-a35d-d924e2e1d126','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"SampleBarcode\":\"A914131322404280298\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 12:22:31',''),
('0edd0319-6399-42d5-b2ff-188000ea4d07','76743097-9f62-4bf0-a35d-d924e2e1d126','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"SampleBarcode\":\"C914131322404280266\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"B914131322404280099\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404290338\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"C914131322404290320\",\"SampleTest\":true,\"SampleRemarks\":\"\"},{\"SampleBarcode\":\"A914131322404280298\",\"SampleTest\":true,\"SampleRemarks\":\"\"}]','09-05-2024 12:22:31','');

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
  `ExcelURL` longtext DEFAULT NULL,
  PRIMARY KEY (`SolarDetailID`),
  KEY `fk_ApprovedBy` (`UpdatedBy`),
  KEY `fk_CheckedBy` (`CheckedBy`),
  CONSTRAINT `fk_CheckedBy` FOREIGN KEY (`CheckedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `IQCSolarDetails` */

insert  into `IQCSolarDetails`(`SolarDetailID`,`LotSize`,`MaterialName`,`SupplierName`,`QuantityRecd`,`InvoiceDate`,`SupplierRMBatchNo`,`RawMaterialSpecs`,`QualityCheckDate`,`SampleQuantityCheck`,`InvoiceNo`,`ReceiptDate`,`DocumentNo`,`RevisionNo`,`CheckedBy`,`Status`,`COCPdf`,`InvoicePdf`,`UpdatedBy`,`CreatedDate`,`UpdatedDate`,`ExcelURL`) values 
('0470b2a1-035e-43fe-957e-209a406ab14c','315440','Solar Cell','Giangxi Rs solar energy ','','2024-05-02','0','Solar cell,22.8%&22.9%','2024-05-08','','PIC 20240427-01','2024-05-07','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Approved','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/0470b2a1-035e-43fe-957e-209a406ab14c_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/0470b2a1-035e-43fe-957e-209a406ab14c_Invoice.pdf','60e38fbd-0b78-11ef-8005-52549f6cc694','08-05-2024 14:03:06','09-05-2024 06:05:37','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Excel/0470b2a1-035e-43fe-957e-209a406ab14c.xlsx'),
('07c944d3-e5d4-4d33-9291-e320001315b6','2000','Solar Glass','Borosil Renewable ','','2024-04-30','01965,01940,01928,01964,01920','solar glass 2272X1128X3.2mm','2024-05-06','','9000007643','2024-05-06','GSPL/SG(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Pending','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/07c944d3-e5d4-4d33-9291-e320001315b6_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/07c944d3-e5d4-4d33-9291-e320001315b6_Invoice.pdf','','07-05-2024 12:29:58','',NULL),
('1196c3bc-8617-49a9-a658-658ab78827f7','18000','PV Ribbon','Taicang juren international Co.','','2024-04-03','0','Ribbon 3.30&0.4*6','2024-05-07','','JRIT20240403003','2024-05-06','GSPL/PVR(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Approved','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/1196c3bc-8617-49a9-a658-658ab78827f7_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/1196c3bc-8617-49a9-a658-658ab78827f7_Invoice.pdf','60e38fbd-0b78-11ef-8005-52549f6cc694','08-05-2024 05:50:45','09-05-2024 06:06:38','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Excel/1196c3bc-8617-49a9-a658-658ab78827f7.xlsx'),
('1ab345fc-da84-4dac-b488-551a05201ecd','38400','Aluminium Frame','Jiangsu sulv new material technology ','','2024-04-01','0','Aluminum frame-2278*1134mm','2024-05-06','','SL-Gautam-2024-4','2024-05-06','GSPL/AF(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Approved','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/1ab345fc-da84-4dac-b488-551a05201ecd_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/1ab345fc-da84-4dac-b488-551a05201ecd_Invoice.pdf','60e38fbd-0b78-11ef-8005-52549f6cc694','07-05-2024 09:11:32','07-05-2024 10:05:02','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Excel/1ab345fc-da84-4dac-b488-551a05201ecd.xlsx'),
('5bb9778a-5872-4033-ae98-32d986dacfcd','2000','Solar Glass','Borosil Renewable ','','2024-05-05','00173.00195.00186.00183.00193','solar glass 2272X1128mm','2024-05-09','','9000007697','2024-05-08','GSPL/SG(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Approved','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/5bb9778a-5872-4033-ae98-32d986dacfcd_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/5bb9778a-5872-4033-ae98-32d986dacfcd_Invoice.pdf','60e38fbd-0b78-11ef-8005-52549f6cc694','09-05-2024 09:45:24','10-05-2024 05:46:31','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Excel/5bb9778a-5872-4033-ae98-32d986dacfcd.xlsx'),
('76743097-9f62-4bf0-a35d-d924e2e1d126','141120','Solar Cell','WEBSOL Energy system Limited new-Alipore','','2024-04-30','0','solar cell-182*182mm','2024-05-09','','WEB/HO/023/24-25','2024-05-09','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','09-05-2024 12:22:30','',NULL),
('86bbf229-92c7-4476-b18a-c10732beb8e8','1200','Solar Glass','Borosil Renewable ','','2024-05-04','00111.00046.00049.00044.00047','solar glass 2272X1128mm','2024-05-08','','9000007686','2024-05-07','GSPL/SG(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Pending','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/86bbf229-92c7-4476-b18a-c10732beb8e8_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/86bbf229-92c7-4476-b18a-c10732beb8e8_Invoice.pdf','','08-05-2024 07:09:43','',NULL),
('8dde278e-2738-471f-a4bd-af440b84cf91','2000','Solar Glass','Triveni Renewable ','','2024-04-27','1655,1656,1653,1654,1657','solar glass 2272X1128X3.2mm','2024-05-05','','136','2024-05-03','GSPL/SG(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Pending','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/8dde278e-2738-471f-a4bd-af440b84cf91_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/8dde278e-2738-471f-a4bd-af440b84cf91_Invoice.pdf','','07-05-2024 12:11:16','',NULL),
('a386a6c9-d2e6-40c0-8dee-978a47b342af','58308','Backsheet','Changzhou fufeng material ','','2024-03-25','0','Backsheet','2024-05-04','','24f-007','2024-05-03','GSPL/BS(IQC)/001','Ver2.0/13-03-2024','fd19940a-f26b-11ee-b439-0ac93defbbf1','Pending','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/a386a6c9-d2e6-40c0-8dee-978a47b342af_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/a386a6c9-d2e6-40c0-8dee-978a47b342af_Invoice.pdf','','07-05-2024 13:23:16','',NULL),
('ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','800','Solar Glass','Borosil Renewable ','','2024-05-04','00149.00151.00154.00135.00130','Solar glass 2272X1128mm','2024-05-08','','9000007685','2024-05-07','GSPL/SG(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Pending','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/ef9d69ea-f796-49f9-9333-ad3dc3dabcd5_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/ef9d69ea-f796-49f9-9333-ad3dc3dabcd5_Invoice.pdf','','08-05-2024 06:45:21','',NULL),
('ff68e09f-9b03-4043-88b6-3932d5f00da3','1200','Solar Glass','Borosil Renewable ','','2024-05-04','00133.00134.00129.00132.00148','solar glass 2272X1128mm ','2024-05-08','','9000007690','2024-05-07','GSPL/SG(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Approved','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/ff68e09f-9b03-4043-88b6-3932d5f00da3_COC.pdf','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Pdf/ff68e09f-9b03-4043-88b6-3932d5f00da3_Invoice.pdf','60e38fbd-0b78-11ef-8005-52549f6cc694','08-05-2024 09:59:01','10-05-2024 05:47:44','http://srv515471.hstgr.cloud:9090/IQCSolarCell/Excel/ff68e09f-9b03-4043-88b6-3932d5f00da3.xlsx'),
('fff10e7b-cd5e-4b3e-9871-767624a35eb6','1600','Solar Glass','Gold plus float glass ','','2024-05-04','05434483.05439508.054345502.0543564.05434584','solar glass 2272X1128mm ','2024-05-09','','24252000032','2024-05-07','GSPL/SG(IQC)/001','Ver2.0/13-03-2024','4492b8ad-f26c-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','09-05-2024 05:18:45','',NULL);

/*Table structure for table `IssuesType` */

DROP TABLE IF EXISTS `IssuesType`;

CREATE TABLE `IssuesType` (
  `IssueId` varchar(255) DEFAULT NULL,
  `Issue` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  UNIQUE KEY `fsdw4r33dff` (`IssueId`),
  KEY `IT_foreignKey_IssuesType23` (`CreatedBy`),
  CONSTRAINT `IT_foreignKey_IssuesType23` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `IssuesType` */

insert  into `IssuesType`(`IssueId`,`Issue`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`) values 
('4b251248-0844-11ef-8005-52549f6cc694','Cell Shift','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:24:48',NULL),
('34407969-0845-11ef-8005-52549f6cc694','Cell Break','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407cc2-0845-11ef-8005-52549f6cc694','Misalignment','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407d17-0845-11ef-8005-52549f6cc694','Matrix Shift','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407d52-0845-11ef-8005-52549f6cc694','Cell Dust','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407d8c-0845-11ef-8005-52549f6cc694','Cell Chip','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407dc4-0845-11ef-8005-52549f6cc694','Sticker Attached','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407df9-0845-11ef-8005-52549f6cc694','Flux Spot','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407e30-0845-11ef-8005-52549f6cc694','Bubble','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407e63-0845-11ef-8005-52549f6cc694','Cleaning Issue','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407e95-0845-11ef-8005-52549f6cc694','Ribbon Bend','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407ec7-0845-11ef-8005-52549f6cc694','Jb Tilted','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407ef9-0845-11ef-8005-52549f6cc694','Eva Short','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407fa1-0845-11ef-8005-52549f6cc694','Frame Hole','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34407fd7-0845-11ef-8005-52549f6cc694','Box Condition','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('3440800b-0845-11ef-8005-52549f6cc694','Wrapping Condition','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('3440803f-0845-11ef-8005-52549f6cc694','Pallet Size','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('34408072-0845-11ef-8005-52549f6cc694','Printing Issue','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('344080a4-0845-11ef-8005-52549f6cc694','Dry Soldering','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-01 22:31:19',NULL),
('9f00c67d-0b99-11ef-8005-52549f6cc694','Other','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-06 04:13:09',NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `JobCard` */

insert  into `JobCard`(`JobCardID`,`JobCardDetailID`,`Process`,`EmployeeId`,`Description`,`Comments`,`CreatedOn`,`UpdatedOn`) values 
('8a451e14-e91e-48dc-8ef2-0789d5fa0436','dfa50687-506f-4ba7-9805-9caaf60152a8','J/B Assembly','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','06-05-2024 16:30:02',''),
('db66442f-ee22-499b-a9c7-1febf05a38bc','dfa50687-506f-4ba7-9805-9caaf60152a8','Sun Simulator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Pmax\":\"\"}','','06-05-2024 16:30:02',''),
('baf17a3e-962f-42f0-a617-474b0839de24','dfa50687-506f-4ba7-9805-9caaf60152a8','Tabbing & Stringing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','06-05-2024 16:30:02',''),
('c626111c-2199-465d-bd0a-81af67240c83','dfa50687-506f-4ba7-9805-9caaf60152a8','Glass Washing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Lot_No\":\"\",\"size\":\"\"}','','06-05-2024 16:30:02',''),
('aadbb6f4-56b5-4443-8081-8ff610a8222a','dfa50687-506f-4ba7-9805-9caaf60152a8','Visual Inspection & Laminator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','06-05-2024 16:30:02',''),
('c37bbf57-d70d-4ad4-9e93-799fe787cf96','dfa50687-506f-4ba7-9805-9caaf60152a8','Foil cutterr','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','06-05-2024 16:30:02',''),
('6e07535d-6510-46ea-9788-7e9f7b1bfd80','dfa50687-506f-4ba7-9805-9caaf60152a8','Bussing/InterConnection','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','06-05-2024 16:30:02',''),
('19c50549-e394-4d89-8927-f7f4a4da3e47','dfa50687-506f-4ba7-9805-9caaf60152a8','Edge Triming','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":false}','','06-05-2024 16:30:02',''),
('c2ae4e2b-3004-4ab3-8378-8cd4c7db5b31','dfa50687-506f-4ba7-9805-9caaf60152a8','Framing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','06-05-2024 16:30:02',''),
('4cf65202-4775-45e9-839c-1d19ec2e8ca5','4551d828-f66a-45d0-a657-c321a7d1cc80','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"\",\"size\":\"\"}','','07-05-2024 04:42:09',''),
('7733980c-36eb-483e-8313-ff71b919a22d','4551d828-f66a-45d0-a657-c321a7d1cc80','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','07-05-2024 04:42:09',''),
('22dd68e9-9d66-470b-8e2f-a9a1123d9bbf','4551d828-f66a-45d0-a657-c321a7d1cc80','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','07-05-2024 04:42:09',''),
('20a9aa4f-9349-4a1d-b84b-35c5fa207172','4551d828-f66a-45d0-a657-c321a7d1cc80','Bussing/InterConnection','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','07-05-2024 04:42:09',''),
('ebea4582-3f7d-43b2-9cf7-fe6d580910cb','4551d828-f66a-45d0-a657-c321a7d1cc80','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','07-05-2024 04:42:09',''),
('dced4013-1d89-4384-aa33-b45c650f66ed','4551d828-f66a-45d0-a657-c321a7d1cc80','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"\"}','','07-05-2024 04:42:09',''),
('5097cf5b-ca18-4b74-ba6c-e668bfe24c55','4551d828-f66a-45d0-a657-c321a7d1cc80','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','07-05-2024 04:42:09',''),
('84507176-c0e7-41de-b35f-8bd12f546298','4551d828-f66a-45d0-a657-c321a7d1cc80','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":false}','','07-05-2024 04:42:09',''),
('2c844cf8-bdb5-4ffa-937e-928f90587bdc','4551d828-f66a-45d0-a657-c321a7d1cc80','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','07-05-2024 04:42:09',''),
('785b3abc-0e57-4025-a8ca-0273fd5c704d','578b6d2c-5dc9-4728-b19d-f9f234640e08','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"IXA01877C2\",\"size\":\"2272×1128×3.2mm\"}','ok','07-05-2024 13:00:17',''),
('3b76ad06-b1c2-4cb1-a9a2-3c788e59fdf6','578b6d2c-5dc9-4728-b19d-f9f234640e08','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"554.29W\"}','Good ','07-05-2024 13:00:17',''),
('8e20e9eb-9afd-4ef5-a18d-394aae8b5106','578b6d2c-5dc9-4728-b19d-f9f234640e08','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004418773\",\"EVA_Size\":\"1125×0.659mm\",\"Backsheet_Lot\":\"20240316001-102\",\"Backsheet_size\":\"1130×0.3mm\"}','ok','07-05-2024 13:00:17',''),
('ee273d0f-a6f5-4eda-aefb-5c2a2c99b8bb','578b6d2c-5dc9-4728-b19d-f9f234640e08','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','ok','07-05-2024 13:00:17',''),
('c2bf165d-35f5-48ba-9d61-704628babef7','578b6d2c-5dc9-4728-b19d-f9f234640e08','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"32.8\",\"Cycle_Time\":\"8 minutes \",\"Laminate_Quality\":true}','okok','07-05-2024 13:00:17',''),
('76014733-cf4f-4d49-80c4-6da23b468c8f','578b6d2c-5dc9-4728-b19d-f9f234640e08','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"0000004048\",\"JB_Type\":\"Dsjb12y 25A-0.3m\",\"Silicon_Glue_Lot_No\":\"24022102-Z-42DW\"}','good ','07-05-2024 13:00:17',''),
('7aaed57d-4368-4895-b3aa-cbd907494f34','578b6d2c-5dc9-4728-b19d-f9f234640e08','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"Gu0241175111-001\",\"Cell_Type\":\"Anhui yongfa desheng\",\"Cell_Size\":\"182*91mm\",\"Cell_Eff\":\"22.90%(7.56w)\",\"Interconnect_Ribbon_Size\":\"0.32mm\",\"Busbar_Size\":\"0.4*6.0mm\",\"Flux\":\"Rc,pv 44M\"}','ok','07-05-2024 13:00:17',''),
('51abf88a-7dab-4407-a830-ff559dc4b704','578b6d2c-5dc9-4728-b19d-f9f234640e08','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"Jiangsu sulv \",\"Frame_Size\":\"2278*1134*35mm\",\"Silicon_Glue_Lot_No\":\"24022102-Z-42DW\"}','ok','07-05-2024 13:00:17',''),
('101f800f-463e-4d4a-afb6-72d80de8f23c','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Glass Washing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Lot_No\":\"0054\",\"size\":\"2272*1128*3.2\"}','OK','07-05-2024 17:28:13',''),
('737aa1db-2771-4528-8dba-29a82e6d2222','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','J/B Assembly','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"DSJB12y25A-0.3m \",\"JB_Type\":\"DHASH TRIO JB\",\"Silicon_Glue_Lot_No\":\"24022102-Z-DW\"}','ok','07-05-2024 17:28:13',''),
('74a9edc6-1c1d-4948-92e0-cc3d6b0f0c18','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Tabbing & Stringing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"A-020420240124-01\",\"Cell_Type\":\"Mono\",\"Cell_Size\":\"182*182 mm\",\"Cell_Eff\":\"22.80/7.53\",\"Interconnect_Ribbon_Size\":\"6*0.40\",\"Busbar_Size\":\"0.32 mm\",\"Flux\":\"Reality Chemicals\"}','Ok','07-05-2024 17:28:13',''),
('4bbe2c45-5493-4672-8ba9-1c48e496df78','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Framing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Frame_Type\":\"jiangsu\",\"Frame_Size\":\"2278*1134 mm\",\"Silicon_Glue_Lot_No\":\"24022809-Z-115-SGZ\"}','ok','07-05-2024 17:28:13',''),
('6af8aca7-e8d4-479b-a278-3987af7690b2','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Bussing/InterConnection','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.42 mm\",\"String_To_String_Gap\":\"2.04 mm\",\"Soldering_Temp\":\"410 Celsius\"}','ok','07-05-2024 17:28:13',''),
('723eb3ba-9b27-4344-ba00-61a4d82efcd6','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Foil cutterr','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004418517\",\"EVA_Size\":\"1125\",\"Backsheet_Lot\":\"20240317001-129\",\"Backsheet_size\":\"1130\"}','ok','07-05-2024 17:28:13',''),
('56a571b9-ef86-45e0-8bf7-d37288fc25fa','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Sun Simulator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Pmax\":\"550 W\"}','ok','07-05-2024 17:28:13',''),
('da639580-812e-47fd-a214-3b221128ad51','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Visual Inspection & Laminator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Temperature\":\"135\",\"Cycle_Time\":\"16 minute\",\"Laminate_Quality\":true}','ok','07-05-2024 17:28:13',''),
('9d44fac8-edaa-4c49-9649-376c5cf77894','f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','Edge Triming','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":false}','ok','07-05-2024 17:28:13',''),
('ca4e3aa3-8b2a-4880-a894-9925e67f61d9','f20336c6-f668-48c5-af13-126e4e75eca6','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"0/136\",\"size\":\"2272,×1128×3.2mm\"}','Good ','08-05-2024 13:54:50',''),
('f91a0b04-0fa3-49b8-a2b5-bf04b9b45571','f20336c6-f668-48c5-af13-126e4e75eca6','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"pic2024-47040\",\"Cell_Type\":\"jiangxi Rs solar \",\"Cell_Size\":\"183×91mm\",\"Cell_Eff\":\"22.90%(7.56)\",\"Interconnect_Ribbon_Size\":\"0.33mm\",\"Busbar_Size\":\"0.40×6.0mm\",\"Flux\":\"Rc/pv 44m\"}','Good ','08-05-2024 13:54:50',''),
('d6febe14-4982-4300-8363-97048d667af3','f20336c6-f668-48c5-af13-126e4e75eca6','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','Good ','08-05-2024 13:54:50',''),
('379c256e-16f9-44c9-a698-d587c4171f06','f20336c6-f668-48c5-af13-126e4e75eca6','Bussing/InterConnection','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.5mm\",\"String_To_String_Gap\":\"1.56mm\",\"Soldering_Temp\":\"250°c\"}','Good ','08-05-2024 13:54:50',''),
('aee69971-9b58-4cbe-bf84-eebf481699bd','f20336c6-f668-48c5-af13-126e4e75eca6','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"Jiangsu sulv \",\"Frame_Size\":\"2278×1134×35mm\",\"Silicon_Glue_Lot_No\":\"24022102-Z-42DW\"}','Good ','08-05-2024 13:54:50',''),
('2ef1b251-c3c6-48e4-9988-cb6b1ad1cea8','f20336c6-f668-48c5-af13-126e4e75eca6','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"555.31\"}','Good ','08-05-2024 13:54:50',''),
('fc62b154-40cc-4609-acd9-7dec1f6cd5bd','f20336c6-f668-48c5-af13-126e4e75eca6','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"0000005822\",\"JB_Type\":\"DSJB12y 25A- 0.3m\",\"Silicon_Glue_Lot_No\":\"24022102-Z-43DW\"}','Good ','08-05-2024 13:54:50',''),
('2c92aaf6-1087-4edc-9fd2-2095687aa63c','f20336c6-f668-48c5-af13-126e4e75eca6','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"135°C\",\"Cycle_Time\":\"10 minutes \",\"Laminate_Quality\":true}','Good ','08-05-2024 13:54:50',''),
('94ccd9e1-5bc3-4c1c-b79f-046749ab74d7','f20336c6-f668-48c5-af13-126e4e75eca6','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004418571\",\"EVA_Size\":\"1125×0.650mm\",\"Backsheet_Lot\":\"20240315001-105\",\"Backsheet_size\":\"1130×0.3mm\"}','Good ','08-05-2024 13:54:50',''),
('5e67c088-0140-476b-813f-eed67ffdf4fb','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Glass Washing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Lot_No\":\"0000006473\",\"size\":\"2272*1128\"}','ok','09-05-2024 02:15:10',''),
('2dff49f9-7834-4927-8c9c-7722e9c3b421','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Tabbing & Stringing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"PJ310BF47B-2\",\"Cell_Type\":\"Mono \",\"Cell_Size\":\"(182*182)mm\",\"Cell_Eff\":\"22.80/7.53\",\"Interconnect_Ribbon_Size\":\"6*0.40 mm\",\"Busbar_Size\":\"0.32 mm\",\"Flux\":\"Rcpv-44m\"}','Ok','09-05-2024 02:15:10',''),
('f39d2758-a0c4-4796-9625-69075a9e013e','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Visual Inspection & Laminator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Temperature\":\"136.7°C\",\"Cycle_Time\":\"16 Minutes\",\"Laminate_Quality\":true}','Ok','09-05-2024 02:15:10',''),
('fd6f0ac0-ba6c-4eae-b85f-9d591c4ba912','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Sun Simulator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Pmax\":\"540w\"}','Ok','09-05-2024 02:15:10',''),
('970c5344-59c3-4b49-9bc7-1e598a7fed61','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Framing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Frame_Type\":\"Jiangsu Kuna\",\"Frame_Size\":\"2278*1134 mm\",\"Silicon_Glue_Lot_No\":\"24022809-Z-115-SGZ\"}','Ok','09-05-2024 02:15:10',''),
('55240f88-f8d0-4fb9-899f-d5545753ce91','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Edge Triming','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','Ok','09-05-2024 02:15:10',''),
('db96d4cf-ca83-4136-8726-e9f46b67a52e','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Bussing/InterConnection','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.40\",\"String_To_String_Gap\":\"2.03\",\"Soldering_Temp\":\"410°C\"}','Ok','09-05-2024 02:15:10',''),
('0d46a70a-0726-450b-a47b-049b03cf3bf5','f3ad28ad-1937-4f51-a17e-a406124dcc1d','J/B Assembly','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"DSJB12Y25A-0.5 meter\",\"JB_Type\":\"Dhash Trio JB with 0.5 m\",\"Silicon_Glue_Lot_No\":\"24022809-Z-115-SGZ\"}','Ok','09-05-2024 02:15:10',''),
('e4c5a7b8-1e44-4b5d-9d19-ee1905210072','f3ad28ad-1937-4f51-a17e-a406124dcc1d','Foil cutterr','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004418697\",\"EVA_Size\":\"(1125*0.65)mm\",\"Backsheet_Lot\":\"20240315001-027\",\"Backsheet_size\":\"(0.3*1130)mm\"}','Ok','09-05-2024 02:15:10',''),
('00352bf9-41bc-4b54-853e-fcb89035d78f','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"\",\"size\":\"\"}','','09-05-2024 10:54:18',''),
('eea7ba93-7bef-4878-af1f-91b7432dbada','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Bussing/InterConnection','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','09-05-2024 10:54:18',''),
('135b4ad8-9829-4931-9967-4fd720496df4','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"\"}','','09-05-2024 10:54:18',''),
('8d7ecf3f-0b2c-467d-9b26-13ac6c2cf5c1','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','09-05-2024 10:54:18',''),
('a2b1fb2a-5011-4626-b238-4cc39b88551c','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":false}','','09-05-2024 10:54:18',''),
('4ca738a4-3d26-4d0c-bcbf-1e6ec5d3f81a','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','09-05-2024 10:54:18',''),
('b3d714be-d0ec-4163-9022-6b2010ffdabd','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','09-05-2024 10:54:18',''),
('5c72d3e1-35be-4aa1-8940-4e854b381cf5','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','09-05-2024 10:54:18',''),
('da030a4b-fb0b-464a-b423-38ff09bd80a6','a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','09-05-2024 10:54:18',''),
('c6b5afe1-17d2-48ee-8b81-62a262523138','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"HXB00144B3\",\"size\":\"2272×1128×3.2mm\"}','Good ','09-05-2024 12:01:37',''),
('eaa3431d-47a7-4b50-9e19-3e765b16c916','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"silicon/Aluminium \",\"Frame_Size\":\"2278×1134×35mm\",\"Silicon_Glue_Lot_No\":\"\"}','Good ','09-05-2024 12:01:37',''),
('e8d18911-9a98-4f86-afec-91fc1708e4dc','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"Gu0241175111-0002\",\"Cell_Type\":\"Jiangxi RS solar \",\"Cell_Size\":\"182×91mm\",\"Cell_Eff\":\"22.70\",\"Interconnect_Ribbon_Size\":\"0.40×6mm\",\"Busbar_Size\":\"0.32\",\"Flux\":\"Reality \"}','Good ','09-05-2024 12:01:37',''),
('4abb388f-f7ae-4755-8e2c-29e34546f073','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','Good ','09-05-2024 12:01:37',''),
('3231c72a-5e9f-41a5-9fea-bb0f68bccd44','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004419911\",\"EVA_Size\":\"1125×0.650mm\",\"Backsheet_Lot\":\"20240316001-113\",\"Backsheet_size\":\"1130×0.3mm\"}','Good ','09-05-2024 12:01:37',''),
('8e4e0b81-99d3-4cf7-b339-dfb40c97ca3f','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"\"}','Good ','09-05-2024 12:01:37',''),
('ad8ef9d9-c918-418d-9097-435c5e0a20cb','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"136°C\",\"Cycle_Time\":\"8 minutes \",\"Laminate_Quality\":true}','Good ','09-05-2024 12:01:37',''),
('69bc7986-5f66-473f-b73d-47f69854e300','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','Bussing/InterConnection','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.5mm\",\"String_To_String_Gap\":\"1.85\",\"Soldering_Temp\":\"240°C\"}','Good ','09-05-2024 12:01:37',''),
('8a8fc981-e83f-4c65-b6f8-51f69cbbf225','2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"DSJB12Y 25A-0.5mm\",\"JB_Type\":\"500mm\",\"Silicon_Glue_Lot_No\":\"\"}','Good ','09-05-2024 12:01:37',''),
('c009367f-51a8-4a7c-a6db-96376e5d268d','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"HXB00144B3\",\"size\":\"2272×1128×3.2mm\"}','Good ','09-05-2024 12:27:00',''),
('d96dd859-b0d0-49c6-8870-f587ffac5522','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Bussing/InterConnection','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.5 mm\",\"String_To_String_Gap\":\"1.85 mm\",\"Soldering_Temp\":\"240°C\"}','Good ','09-05-2024 12:27:00',''),
('f7d46e68-8f9d-4e4f-8ba1-aeb444e7e200','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','Good ','09-05-2024 12:27:00',''),
('be9011da-d3c5-4337-9471-a0f77a8dbb08','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"546.37\"}','Good ','09-05-2024 12:27:00',''),
('340f85a3-708f-4882-8f4d-7de2f9c8a3cc','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"Silicon Aluminium \",\"Frame_Size\":\"2278×1134×35mm\",\"Silicon_Glue_Lot_No\":\"24022101-Z 33DW\"}','Good ','09-05-2024 12:27:00',''),
('f4dbd4b1-7376-4ce1-bcf6-3179f951abd6','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"GU0241175111-0002\",\"Cell_Type\":\"Jiangxi RS solar \",\"Cell_Size\":\"182×91mm\",\"Cell_Eff\":\"22.70.(7.56)\",\"Interconnect_Ribbon_Size\":\"0.40×0.6mm\",\"Busbar_Size\":\"0.32mm\",\"Flux\":\"Reality \"}','Good ','09-05-2024 12:27:00',''),
('e72e2182-15f6-428b-8b0b-3ebd249cd996','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"136°C\",\"Cycle_Time\":\"8 minutes \",\"Laminate_Quality\":true}','','09-05-2024 12:27:00',''),
('c74adfaa-140c-4818-ac84-d6ac4116a83d','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004419911\",\"EVA_Size\":\"1125×0.650mm\",\"Backsheet_Lot\":\"20240316001-113\",\"Backsheet_size\":\"1130×0.3mm\"}','Good ','09-05-2024 12:27:00',''),
('ffa9df46-e7a4-4cf4-b3ed-a1101d5a30b3','aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"DSJB12Y 25A_ 0.5m\",\"JB_Type\":\"500mm\",\"Silicon_Glue_Lot_No\":\"24022101-Z-33DW\"}','Good ','09-05-2024 12:27:00',''),
('f36a91a5-1fde-475e-9a91-3804ac0926d8','cdd11662-43e0-43b4-8587-b250067387f4','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"HXB00144B3\",\"size\":\"2272×1128×3.2mm\"}','Good ','09-05-2024 12:29:10',''),
('09118287-3dbc-434d-8f59-952792a856c2','cdd11662-43e0-43b4-8587-b250067387f4','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"silicon Aluminium \",\"Frame_Size\":\"2278×1134×35mm\",\"Silicon_Glue_Lot_No\":\"24022101-Z-33DW\"}','Good ','09-05-2024 12:29:10',''),
('173139be-583b-47e3-afbb-f651a9803171','cdd11662-43e0-43b4-8587-b250067387f4','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"546.37\"}','Good ','09-05-2024 12:29:10',''),
('1ee8ad54-eb08-49e4-9126-7059f6641f51','cdd11662-43e0-43b4-8587-b250067387f4','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"136°C\",\"Cycle_Time\":\"8 minutes \",\"Laminate_Quality\":true}','Good ','09-05-2024 12:29:10',''),
('145d3526-94c2-4b3f-9dd9-0e528fee4814','cdd11662-43e0-43b4-8587-b250067387f4','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"GU0241175111-0002\",\"Cell_Type\":\"Jiangxi RS solar \",\"Cell_Size\":\"182×91mm\",\"Cell_Eff\":\"22.70(7.53)\",\"Interconnect_Ribbon_Size\":\"0.4×6mm\",\"Busbar_Size\":\"0.32mm\",\"Flux\":\"Reality \"}','Good ','09-05-2024 12:29:10',''),
('0efee484-4df7-49ea-9ac5-10da26a9ca8a','cdd11662-43e0-43b4-8587-b250067387f4','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004419911\",\"EVA_Size\":\"1125×0.650mm\",\"Backsheet_Lot\":\"20240316001-113\",\"Backsheet_size\":\"1130×0.3mm\"}','Good ','09-05-2024 12:29:10',''),
('aae1f0d2-b535-46a3-9288-e12471e37fe5','cdd11662-43e0-43b4-8587-b250067387f4','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','Good ','09-05-2024 12:29:10',''),
('5d15eab6-591e-4a3d-8a6d-4f90fee5f271','cdd11662-43e0-43b4-8587-b250067387f4','Bussing/InterConnection','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.5mm\",\"String_To_String_Gap\":\"1.85mm\",\"Soldering_Temp\":\"240°C\"}','Good ','09-05-2024 12:29:10',''),
('1b4bda3a-9c19-47a9-a72f-fdba55874bd7','cdd11662-43e0-43b4-8587-b250067387f4','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"Dsjb12y 25A-0.5m\",\"JB_Type\":\"500mm\",\"Silicon_Glue_Lot_No\":\"24022101-z-33Dw\"}','Good ','09-05-2024 12:29:10',''),
('61b2878f-0e50-487e-93e6-55375642b699','49165df8-a116-4113-8e00-1e39aea730b4','Glass Washing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Lot_No\":\"IXA01957d2\",\"size\":\"2272×1228×3.2mm\"}','good ','10-05-2024 09:01:47',''),
('fa8b9314-67b3-4f49-aedc-16da001daf55','49165df8-a116-4113-8e00-1e39aea730b4','Sun Simulator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Pmax\":\"546.46\"}','good ','10-05-2024 09:01:47',''),
('192010bd-3693-4efa-8317-698572d785a4','49165df8-a116-4113-8e00-1e39aea730b4','Framing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Frame_Type\":\"silicon/Aluminium \",\"Frame_Size\":\"2272×1134×35mm\",\"Silicon_Glue_Lot_No\":\"24022102-Z-42DW\"}','good ','10-05-2024 09:01:47',''),
('7154ef7f-8d91-4a05-9588-b53bf0c26353','49165df8-a116-4113-8e00-1e39aea730b4','Edge Triming','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','good ','10-05-2024 09:01:47',''),
('e2c0c1cf-d097-4012-9368-6e81e4421435','49165df8-a116-4113-8e00-1e39aea730b4','Bussing/InterConnection','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.5mm\",\"String_To_String_Gap\":\"1.88mm\",\"Soldering_Temp\":\"242°C\"}','good ','10-05-2024 09:01:47',''),
('27bb41e6-3158-4d63-927f-0ebc2a5f666d','49165df8-a116-4113-8e00-1e39aea730b4','Visual Inspection & Laminator','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Temperature\":\"138°C\",\"Cycle_Time\":\"7.5 minutes \",\"Laminate_Quality\":true}','good ','10-05-2024 09:01:47',''),
('6a1a32e7-f645-4285-8060-4cd51e7730cd','49165df8-a116-4113-8e00-1e39aea730b4','Foil cutterr','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004417890\",\"EVA_Size\":\"1125×0.650\",\"Backsheet_Lot\":\"20240316001-023\",\"Backsheet_size\":\"1130×0.3mm\"}','ok','10-05-2024 09:01:47',''),
('e6ea838e-aed7-4ff2-8833-6eb3bce44698','49165df8-a116-4113-8e00-1e39aea730b4','Tabbing & Stringing','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"x24022800H1NN\",\"Cell_Type\":\"jiangxi RS solar \",\"Cell_Size\":\"182×91mm\",\"Cell_Eff\":\"22.90%(7.53)\",\"Interconnect_Ribbon_Size\":\"0.4×6mm\",\"Busbar_Size\":\"0.32mm\",\"Flux\":\"reality \"}','ok','10-05-2024 09:01:47',''),
('8bb383e3-ccb6-434c-9250-4317f9049134','49165df8-a116-4113-8e00-1e39aea730b4','J/B Assembly','af305f2c-0b9b-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"dsjb12y 25A-0.5M\",\"JB_Type\":\"500mm\",\"Silicon_Glue_Lot_No\":\"24022102-z-42DW\"}','good ','10-05-2024 09:01:47',''),
('0cf0bf95-18fd-4529-ac8e-9751d76b050c','3b2b930c-01bf-4128-8c80-b59fc651f0df','Bussing/InterConnection','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','10-05-2024 11:05:23',''),
('19c0fd21-9114-45b0-9768-792c6dc884f1','3b2b930c-01bf-4128-8c80-b59fc651f0df','Edge Triming','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":false}','','10-05-2024 11:05:23',''),
('fd743d7b-8ad3-449d-ad19-de423261e38b','3b2b930c-01bf-4128-8c80-b59fc651f0df','Visual Inspection & Laminator','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','10-05-2024 11:05:23',''),
('b6dc5217-75a5-4a9c-95e7-c3833cec7cf3','3b2b930c-01bf-4128-8c80-b59fc651f0df','Sun Simulator','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"Pmax\":\"\"}','','10-05-2024 11:05:23',''),
('1ea18a4c-d089-4e0a-b69c-2c5e54229f11','3b2b930c-01bf-4128-8c80-b59fc651f0df','J/B Assembly','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','10-05-2024 11:05:23',''),
('78bf6d56-878d-4c8e-9756-7844b3664078','3b2b930c-01bf-4128-8c80-b59fc651f0df','Framing','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','10-05-2024 11:05:23',''),
('ecc51105-8c48-4249-a9e9-ff016b32850e','3b2b930c-01bf-4128-8c80-b59fc651f0df','Foil cutterr','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','10-05-2024 11:05:23',''),
('54580dd9-7215-47c4-aed3-c0c75ce366ed','3b2b930c-01bf-4128-8c80-b59fc651f0df','Glass Washing','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"Lot_No\":\"\",\"size\":\"\"}','','10-05-2024 11:05:23',''),
('dbcdb4cd-48c3-4cbe-9c99-7783392d0814','3b2b930c-01bf-4128-8c80-b59fc651f0df','Tabbing & Stringing','ada6d45d-0b78-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','10-05-2024 11:05:23',''),
('4b2be124-eb26-409a-8cf1-73991c0640a5','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Glass Washing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Lot_No\":\"HXB00124B2\",\"size\":\"2272*1128\"}','Ok','11-05-2024 02:02:01',''),
('6964cead-b83b-462e-b740-3ead52bf4729','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Sun Simulator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Pmax\":\"542 W\"}','Ok','11-05-2024 02:02:01',''),
('441b2329-4c26-453f-84ec-f9af45040acb','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','J/B Assembly','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"JB_Lot_No\":\"DSJB12Y25A-0.5m\",\"JB_Type\":\"Dhash Trio JB with 0.5m\",\"Silicon_Glue_Lot_No\":\"24022807-Z-115-SGZ\"}','Ok','11-05-2024 02:02:01',''),
('d4c8d48a-7b2b-4ecc-b3c4-464161a4a136','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Framing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Frame_Type\":\"Silicon Aluminium \",\"Frame_Size\":\"2278*1134 mm\",\"Silicon_Glue_Lot_No\":\"24022807-Z-115-SGZ\"}','Ok','11-05-2024 02:02:01',''),
('546a395c-9028-4926-be57-298da005696b','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Visual Inspection & Laminator','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Temperature\":\"135°C\",\"Cycle_Time\":\"17 minute \",\"Laminate_Quality\":true}','Ok','11-05-2024 02:02:01',''),
('a61ee914-0300-4b5c-aeed-64645159f3db','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Edge Triming','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"BackSheet_Cutting\":true}','GS03540M12724004165,4170,4173,4172,4179','11-05-2024 02:02:01',''),
('11439abb-5e83-45dc-8f8d-7403a7fb0b01','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Tabbing & Stringing','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_Lot_No\":\"182M247MBBSAJ-BCPU\",\"Cell_Type\":\"Mono\",\"Cell_Size\":\"182*182 mm\",\"Cell_Eff\":\"22.90/7.56\",\"Interconnect_Ribbon_Size\":\"6*0.40\",\"Busbar_Size\":\"0.32 mm\",\"Flux\":\"RCPV-44M\"}','ok','11-05-2024 02:02:01',''),
('dbcd4138-b3ee-4f37-89fb-4195c262075b','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Foil cutterr','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"EVA_Lot_No\":\"0004415827\",\"EVA_Size\":\"1125*0.65\",\"Backsheet_Lot\":\"20240316001098\",\"Backsheet_size\":\"0.3*1130 mm\"}','Ok','11-05-2024 02:02:01',''),
('0299ae54-0f97-4161-813a-0250390b86a8','f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','Bussing/InterConnection','08d5d779-0b9c-11ef-8005-52549f6cc694','{\"Cell_To_Cell_Gap\":\"1.40\",\"String_To_String_Gap\":\"2.03\",\"Soldering_Temp\":\"395\"}','Ok','11-05-2024 02:02:01','');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `JobCardDetails` */

insert  into `JobCardDetails`(`JobCardDetailID`,`DocNo`,`RevisionNo`,`RevisonDate`,`ModuleType`,`ModuleNo`,`Date`,`MatrixSize`,`ReferencePdf`,`Status`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`Type`) values 
('2c96f43a-74b7-4b43-8dde-e2f8344cdfe0','GSPL/IPQC/BM/024','1.0','12.08.2023','KSGS540','KSGS540D08ED0021774','2024-05-09','2232×1100',NULL,'Inprogress','af305f2c-0b9b-11ef-8005-52549f6cc694','','09-05-2024 12:01:37','','Job Card'),
('3b2b930c-01bf-4128-8c80-b59fc651f0df','GSPL/IPQC/BM/024','1.0','12.08.2023','','','','',NULL,'Inprogress','ada6d45d-0b78-11ef-8005-52549f6cc694','','10-05-2024 11:05:23','','Job Card'),
('4551d828-f66a-45d0-a657-c321a7d1cc80','GSPL/IPQC/BM/024','1.0','12.08.2023','','','','',NULL,'Inprogress','af305f2c-0b9b-11ef-8005-52549f6cc694','','07-05-2024 04:42:14','','Job Card'),
('49165df8-a116-4113-8e00-1e39aea730b4','GSPL/IPQC/BM/024','1.0','12.08.2023','Gs 540','Gs03540M12724005772','2024-05-10','2232×1100','http://srv515471.hstgr.cloud:9090/IPQC/Pdf/49165df8-a116-4113-8e00-1e39aea730b4.pdf','Pending','af305f2c-0b9b-11ef-8005-52549f6cc694','','10-05-2024 09:04:31','','Job Card'),
('578b6d2c-5dc9-4728-b19d-f9f234640e08','GSPL/IPQC/BM/024','1.0','12.08.2023','GS 550','Gs03550M127224000903','2024-05-07','2232×1100mm',NULL,'Inprogress','af305f2c-0b9b-11ef-8005-52549f6cc694','','07-05-2024 13:11:31','','Job Card'),
('a5b4be2f-7eac-4d50-8fd0-a2a59eac596a','GSPL/IPQC/BM/024','1.0','12.08.2023','kir','','2024-05-09','',NULL,'Inprogress','af305f2c-0b9b-11ef-8005-52549f6cc694','','09-05-2024 10:54:18','','Job Card'),
('aebe37bb-7a72-4fd7-8cf1-e6121cb11ced','GSPL/IPQC/BM/024','1.0','12.08.2023','KSGS 540','KSGS 540D08ED0021774','2024-05-09','2230×1100',NULL,'Inprogress','af305f2c-0b9b-11ef-8005-52549f6cc694','','09-05-2024 12:26:59','','Job Card'),
('cdd11662-43e0-43b4-8587-b250067387f4','GSPL/IPQC/BM/024','1.0','12.08.2023','KGGS 540','KSGS 540D08ED0021774','2024-05-09','2230×1100','http://srv515471.hstgr.cloud:9090/IPQC/Pdf/cdd11662-43e0-43b4-8587-b250067387f4.pdf','Pending','af305f2c-0b9b-11ef-8005-52549f6cc694','','09-05-2024 13:19:36','','Job Card'),
('dfa50687-506f-4ba7-9805-9caaf60152a8','GSPL/IPQC/BM/024','1.0','12.08.2023','','','','',NULL,'Inprogress','08d5d779-0b9c-11ef-8005-52549f6cc694','','06-05-2024 16:30:02','','Job Card'),
('f20336c6-f668-48c5-af13-126e4e75eca6','GSPL/IPQC/BM/024','1.0','12.08.2023','Gs 540','Gs03540m12724002157','2024-05-08','2232×1100',NULL,'Approved','af305f2c-0b9b-11ef-8005-52549f6cc694','ada6d45d-0b78-11ef-8005-52549f6cc694','08-05-2024 14:00:35','09-05-2024 05:15:59','Job Card'),
('f3ad28ad-1937-4f51-a17e-a406124dcc1d','GSPL/IPQC/BM/024','1.0','12.08.2023','Bifacial','GS03540M127','2024-05-09','12*6','http://srv515471.hstgr.cloud:9090/IPQC/Pdf/f3ad28ad-1937-4f51-a17e-a406124dcc1d.pdf','Approved','08d5d779-0b9c-11ef-8005-52549f6cc694','ada6d45d-0b78-11ef-8005-52549f6cc694','09-05-2024 02:15:10','09-05-2024 05:16:45','Job Card'),
('f4b2eeaf-0943-41f9-bfb9-3f1a75e07094','GSPL/IPQC/BM/024','1.0','12.08.2023','540','GS03550M127','2024-05-07','12*6','http://srv515471.hstgr.cloud:9090/IPQC/Pdf/f4b2eeaf-0943-41f9-bfb9-3f1a75e07094.pdf','Approved','08d5d779-0b9c-11ef-8005-52549f6cc694','ada6d45d-0b78-11ef-8005-52549f6cc694','07-05-2024 17:28:41','09-05-2024 05:31:23','Job Card'),
('f4e9039d-7444-4ecd-a7d9-51f1c433ae3d','GSPL/IPQC/BM/024','1.0','12.08.2023','GS03540','Gs03540M127','2024-05-11','12*6','http://srv515471.hstgr.cloud:9090/IPQC/Pdf/f4e9039d-7444-4ecd-a7d9-51f1c433ae3d.pdf','Pending','08d5d779-0b9c-11ef-8005-52549f6cc694','','11-05-2024 02:02:04','','Job Card');

/*Table structure for table `Laminator` */

DROP TABLE IF EXISTS `Laminator`;

CREATE TABLE `Laminator` (
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `LaminatorId` varchar(255) DEFAULT NULL,
  `Parameter` varchar(255) DEFAULT NULL,
  `Specification` varchar(255) DEFAULT NULL,
  `ObservedValueA` varchar(255) DEFAULT NULL,
  `ObservedValueB` varchar(255) DEFAULT NULL,
  UNIQUE KEY `999uuu99` (`LaminatorId`) COMMENT 'ok',
  KEY `spt_foreignKey_LaminatorPrelam123` (`PreLamDetailId`),
  CONSTRAINT `spt_foreignKey_LaminatorPrelam1003` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `Laminator` */

insert  into `Laminator`(`PreLamDetailId`,`LaminatorId`,`Parameter`,`Specification`,`ObservedValueA`,`ObservedValueB`) values 
('22c41e4e-a77e-4299-a365-85d7ad505457','5fa05c31-e0b1-410a-a916-b8052f2d3d4a','EVA Make','Specification | Tolerance | None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','a3241eb0-19cd-45c2-9f6b-2f3b6fcc1de5','Upper Vent-2(kpa)','Specification(-40 to 0)|Tolerance None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','37cb9a4c-9f3c-4caa-9d69-3534e1372b05','Laminator-3(sec)','Specification 100| Tolerance +50,0','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','cb74fe36-f264-4984-85ba-14981dd74cf0','Default Low Vaccum Time(sec)','Specification 9999| Tolerance 0','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','d2c39d96-17b0-4cc0-96c2-0ac8c9958c15','Laminator-1(sec)','Specification (0-10)| Tolerance None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','6f402777-4914-4f7a-8e5e-cfd7cb2d0acb','Upper Vent-1(kpa)','Specification(-60 to 0)|Tolerance -None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','0b31fccc-97de-474d-8f90-6fc9ba6cbcef','Total Vaccum','Specification 300 | Tolerance (+40,-20)','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','8a345554-4a7b-4e0a-ad8f-6960dcbec1d1','Upper Vaccum Delay(sec)','Specification  0-10| Tolerance -None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','e8b7093f-d21a-4793-96dd-6b98a0496634','Laminator-2(sec)','Specification (0-10)| Tolerance None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','b6e5f9eb-8bda-4192-afc9-db2c121d0eb9','Upper Vent-3(kpa)','Specification(-20 to 0)|Tolerance None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','77a80dec-57a3-45dd-bd84-fff0f7ae6f4d','EVA Model','Specification | Tolerance | None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','cbf92b1f-ae32-4098-a02c-f295916de92f','vent Time(sec)','Specification 20| Tolerance 0+-5','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','81c99efe-3f97-479d-8eaf-471c99622aae','Temp Upper limit(0c)','Specification 160| Tolerance None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','2f0d6f09-1a56-421e-8e84-4494dcdc98f2','Temp Lower limit (0c)','Specification 140| Tolerance None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','1d199f32-ba3c-4630-a7c3-e7be30b7acc2','Temp Setting(0c)','Specification 150| Tolerance None','',''),
('22c41e4e-a77e-4299-a365-85d7ad505457','9a6f0895-92ab-4328-bcff-8349dc5fb560','Lam Count(Membrane cycle)','Specification (max 15000-20000)| Tolerance None','','');

/*Table structure for table `ModelTypes` */

DROP TABLE IF EXISTS `ModelTypes`;

CREATE TABLE `ModelTypes` (
  `ModelId` varchar(255) DEFAULT NULL,
  `ModelName` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  UNIQUE KEY `dfger34534gfg` (`ModelId`),
  KEY `spt_foreignKey_ModelTypes34` (`CreatedBy`),
  CONSTRAINT `spt_foreignKey_ModelTypes34` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ModelTypes` */

insert  into `ModelTypes`(`ModelId`,`ModelName`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`) values 
('bd5f51b0-0879-11ef-8005-52549f6cc694','G2×530-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f5701-0879-11ef-8005-52549f6cc694','G2×535-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f5771-0879-11ef-8005-52549f6cc694','G2×540-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f57b8-0879-11ef-8005-52549f6cc694','G2×545-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f57f7-0879-11ef-8005-52549f6cc694','G2×550-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f5838-0879-11ef-8005-52549f6cc694','G2×520-HAB','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f5871-0879-11ef-8005-52549f6cc694','G2×Bifacial 1689-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f58b6-0879-11ef-8005-52549f6cc694','G2×Bifacial 1695-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f58f5-0879-11ef-8005-52549f6cc694','G2×Bifacial 1702-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f592b-0879-11ef-8005-52549f6cc694','G2×Bifacial 1708-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f5960-0879-11ef-8005-52549f6cc694','G2×Bifacial 1715-HAD','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f5997-0879-11ef-8005-52549f6cc694','G2×450-HAA','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('bd5f59cd-0879-11ef-8005-52549f6cc694','G2×Bifacial 1585-HAA','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 04:47:23',NULL),
('f32e8438-087f-11ef-8005-52549f6cc694','UTL 540-144M','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('f32e8866-087f-11ef-8005-52549f6cc694','KS144BHCMP550','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('f32e88cf-087f-11ef-8005-52549f6cc694','KS144BHCMP545','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('f32e89a8-087f-11ef-8005-52549f6cc694','KS144MP540','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('f32e89e4-087f-11ef-8005-52549f6cc694','KS144MP545','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('f32e8a1b-087f-11ef-8005-52549f6cc694','ENP24550MH','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('f32e8a52-087f-11ef-8005-52549f6cc694','ENPL2B550MHB','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('f32e8a8a-087f-11ef-8005-52549f6cc694','MAS-144M545','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-02 05:31:50',NULL),
('8634275c-0b99-11ef-8005-52549f6cc694','Other','b570e501-f8c7-11ee-b439-0ac93defbbf1',NULL,'2024-05-06 04:12:28',NULL);

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
  KEY `fk_Department` (`Department`),
  KEY `fk_Designation` (`Desgination`),
  KEY `fk_WorkLocation` (`WorkLocation`),
  CONSTRAINT `fk_Department` FOREIGN KEY (`Department`) REFERENCES `Department` (`DepartmentID`),
  CONSTRAINT `fk_Designation` FOREIGN KEY (`Desgination`) REFERENCES `Designation` (`DesignationID`),
  CONSTRAINT `fk_WorkLocation` FOREIGN KEY (`WorkLocation`) REFERENCES `WorkLocation` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `Person` */

insert  into `Person`(`PersonID`,`EmployeeID`,`Name`,`LoginID`,`Password`,`WorkLocation`,`Email`,`Department`,`ProfileImg`,`Desgination`,`Status`,`UpdatedBy`,`UpdatedOn`,`CreatedBy`,`CreatedOn`) values 
('05efa47f-0b78-11ef-8005-52549f6cc694','002','gepl office admin','admin iqcp','gepl@9566','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/05efa47f-0b78-11ef-8005-52549f6cc694gepl office admin1714979562623967.jpg','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Inactive',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 07:12:39'),
('08d5d779-0b9c-11ef-8005-52549f6cc694','929','danish ali','danish1','danish@9761','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/08d5d779-0b9c-11ef-8005-52549f6cc694danish ali1714995028721487.jpg','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 11:30:26'),
('18743950-0b79-11ef-8005-52549f6cc694','03','admin fqc','fqc admin','admin@5149','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849684af-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/18743950-0b79-11ef-8005-52549f6cc694admin fqc1714980022435303.jpg','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 07:20:19'),
('19a473b5-0b91-11ef-8005-52549f6cc694','757','shivam rai','shivam1','shivam@8393','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/19a473b5-0b91-11ef-8005-52549f6cc6941714990333442449.jpg','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 10:12:09'),
('242eb8c2-0b9c-11ef-8005-52549f6cc694','930','danish ali','danish2','danish@4738','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849684af-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/242eb8c2-0b9c-11ef-8005-52549f6cc694danish ali1714995074755747.jpg','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 11:31:12'),
('3940cbd3-0b91-11ef-8005-52549f6cc694','758','shivam rai','shivam2','shivam@5910','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849684af-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/3940cbd3-0b91-11ef-8005-52549f6cc694shivam rai1714990385777787.jpg','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 10:13:02'),
('4492b8ad-f26c-11ee-b439-0ac93defbbf1','10328','Johny Kumar','IQC2','Johny@2564','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/4492b8ad-f26c-11ee-b439-0ac93defbbf1Johny Kumar1714819120708575.jpg','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active','b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 05:50:13',NULL,NULL),
('60e38fbd-0b78-11ef-8005-52549f6cc694','01','admin iqcp','iqcp admin','admin@7809','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/60e38fbd-0b78-11ef-8005-52549f6cc694admin iqcp1714979714404911.jpg','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 07:15:12'),
('ada6d45d-0b78-11ef-8005-52549f6cc694','02','admin ipqc','ipqc admin','admin@3476','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/ada6d45d-0b78-11ef-8005-52549f6cc694admin ipqc1714979843622450.jpg','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 07:17:20'),
('af305f2c-0b9b-11ef-8005-52549f6cc694','10462','gaurav','gaurav','gaurav@4126','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/af305f2c-0b9b-11ef-8005-52549f6cc694gaurav1714994879458274.jpg','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 11:27:55'),
('b570e501-f8c7-11ee-b439-0ac93defbbf1','Emp001','Quality Manager','QCM','SuperAdmin@1111','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/b570e501-f8c7-11ee-b439-0ac93defbbf1Quality Manager1714815612107066.jpg','d66db440-e2ab-11ee-974e-12d6db81f661','Active','b570e501-f8c7-11ee-b439-0ac93defbbf1','04-05-2024 09:40:12',NULL,NULL),
('ee86a451-0ba1-11ef-8005-52549f6cc694','10452','sanjay','sanjay','sanjay@7123','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','http://srv515471.hstgr.cloud:9090/Employee/Profile/ee86a451-0ba1-11ef-8005-52549f6cc694sanjay1714997562046629.jpg','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,'b570e501-f8c7-11ee-b439-0ac93defbbf1','06-05-2024 12:12:39'),
('fd19940a-f26b-11ee-b439-0ac93defbbf1','2646','Sangraam Kushwaha','IQC1','Sangraam@4773','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/fd19940a-f26b-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,NULL,NULL);

/*Table structure for table `PreLam` */

DROP TABLE IF EXISTS `PreLam`;

CREATE TABLE `PreLam` (
  `PreLamId` varchar(255) NOT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `Stage` varchar(255) DEFAULT NULL,
  `CheckPoint` longtext DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `Frequency` longtext DEFAULT NULL,
  `AcceptanceCriteria` longtext DEFAULT NULL,
  PRIMARY KEY (`PreLamId`),
  KEY `fk_PreLam_PreLamDetailId` (`PreLamDetailId`),
  CONSTRAINT `fk_PreLam_PreLamDetailId` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `PreLam` */

insert  into `PreLam`(`PreLamId`,`PreLamDetailId`,`Stage`,`CheckPoint`,`Remark`,`Frequency`,`AcceptanceCriteria`) values 
('04171b97-b8c0-4cfb-9f91-1f52ab4ae20d','f73037c9-5433-49ea-98ad-74ed934d2cf7','Post Lam Visual Inspection','{\"Avaibility of WI & criteria\":\"presented\",\"Visual Defects\":{\"Observation 1\":\"gs2280\",\"Observation 2\":\"gs4411\",\"Observation 3\":\"gs4239\",\"Observation 4\":\"gs4290\",\"Observation 5\":\"gs03540m12724004181\"}}','','{\"Avaibility of WI & criteria\":\"Once a Shift\",\"Visual Defects\":\"5 Piece per Shift\"}','{\"Avaibility of WI & criteria\":\"Must be Present\",\"Visual Defects\":\"As per Visual inspection criteria : GSPl/IPQC/VI/021\"}'),
('0ad87c3c-6dcd-4d77-a4ab-6324d62cf327','f73037c9-5433-49ea-98ad-74ed934d2cf7','RFID Reading & writing','{\"Avaibillity of WI\":\"presented\",\"Fixing position\":{\"Observation 1\":\"gs2115\",\"Observation 2\":\"gs3767\",\"Observation 3\":\"gs3800\",\"Observation 4\":\"gs3822\",\"Observation 5\":\"gs03540m12724004122\"},\"Tag read & write\":\"continuous \",\"Certification Date Verification\":\"07/05/2019\",\"Cell Make & Manufacturing Month Verification\":\"feb,24\",\"Module Manufacturing Month Verification\":\"may,24\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Fixing position\":\"5 Piece per Shift\",\"Tag read & write\":\"Continuous\",\"Certification Date Verification\":\"Once a Shift\",\"Cell Make & Manufacturing Month Verification\":\"Once a Shift\",\"Module Manufacturing Month Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Fixing position\":\"As per process Card\",\"Tag read & write\":\"A Tag should be read & write Content should comply MNRE guidline\",\"Certification Date Verification\":\"As per IEC/UL REPORT(As applicable)\",\"Cell Make & Manufacturing Month Verification\":\"As per BOM\",\"Module Manufacturing Month Verification\":\"As per process Card\"}'),
('0bfe258e-2055-4e5b-a8c4-7ed431abadd7','6ade4093-205c-4a81-bec1-e85f967dc26b','Post Lam Visual Inspection','{\"Avaibility of WI & criteria\":\"\",\"Visual Defects\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibility of WI & criteria\":\"Once a Shift\",\"Visual Defects\":\"5 Piece per Shift\"}','{\"Avaibility of WI & criteria\":\"Must be Present\",\"Visual Defects\":\"As per Visual inspection criteria : GSPl/IPQC/VI/021\"}'),
('0f4ebe30-3efc-4347-b5aa-64acac25ff74','2f84840b-137b-495a-800e-d70b99972cc3','String Rework station','{\"Avaibility of work instruvtion(WI)\":\"\",\"Cleaning of Rework station/soldering iron sponge\":\"\"}','','{\"Avaibility of work instruvtion(WI)\":\"Once per Shift\",\"Cleaning of Rework station/soldering iron sponge\":\"Once per Shift\"}','{\"Avaibility of work instruvtion(WI)\":\"WI Should be available at station and operator should be aware of WI\",\"Cleaning of Rework station/soldering iron sponge\":\"Rework Station should be Clean\"}'),
('104139da-72a5-44ab-be35-d604786d9e2f','2f84840b-137b-495a-800e-d70b99972cc3','Auto Bussing & Tapping','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\"\",\"Terminal busbar to edge of cell\":\"\",\"soldering quality of Ribbon to busbar\":\"\",\"Clearance between RFID&Logo patch to cell in module\":\"\",\"Position verification of RFID& Logo Patch on Module\":\"\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"\",\"quality of auto taping\":\"\",\"Avaibility of specification & WI\":\"\"}','','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\"Once per Shift\",\"Terminal busbar to edge of cell\":\"Once per Shift\",\"soldering quality of Ribbon to busbar\":\"Once per Shift\",\"Clearance between RFID&Logo patch to cell in module\":\"Thrice per Shift\",\"Position verification of RFID& Logo Patch on Module\":\"Thrice per Shift\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"Thrice per Shift\",\"quality of auto taping\":\"Once per Shift\",\"Avaibility of specification & WI\":\"Once per Shift\"}','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\">=4N | Refer\",\"Terminal busbar to edge of cell\":\"As per respective Layup Drawing\",\"soldering quality of Ribbon to busbar\":\"No Dry Soldering\",\"Clearance between RFID&Logo patch to cell in module\":\"Should not be 2mm-4mm gapfrom the cell to the patch\",\"Position verification of RFID& Logo Patch on Module\":\"Shiould not be tilt,Busbar should not visible\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"creepage distance should be 16+-1mm\",\"quality of auto taping\":\"No poor taping,cell shifting,cell breakage\",\"Avaibility of specification & WI\":\"Avaibility of specification & WI & operator should be aware of specification \"}'),
('10f23fde-27bf-469f-8e5d-250445922cc0','6ade4093-205c-4a81-bec1-e85f967dc26b','Back Label','{\"Data Verification\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Air Bubbles,Tilt & Misprint\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Data Verification\":\"5 Piece per  Shift\",\"Air Bubbles,Tilt & Misprint\":\"5 Piece per Shift\"}','{\"Data Verification\":\"As per Datasheet/process card\",\"Air Bubbles,Tilt & Misprint\":\"Not Acceptable\"}'),
('1209cac5-6a88-4ed1-ac4b-7e7e353f8e67','6ade4093-205c-4a81-bec1-e85f967dc26b','RFID Reading & writing','{\"Avaibillity of WI\":\"\",\"Fixing position\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Tag read & write\":\"\",\"Certification Date Verification\":\"\",\"Cell Make & Manufacturing Month Verification\":\"\",\"Module Manufacturing Month Verification\":\"\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Fixing position\":\"5 Piece per Shift\",\"Tag read & write\":\"Continuous\",\"Certification Date Verification\":\"Once a Shift\",\"Cell Make & Manufacturing Month Verification\":\"Once a Shift\",\"Module Manufacturing Month Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Fixing position\":\"As per process Card\",\"Tag read & write\":\"A Tag should be read & write Content should comply MNRE guidline\",\"Certification Date Verification\":\"As per IEC/UL REPORT(As applicable)\",\"Cell Make & Manufacturing Month Verification\":\"As per BOM\",\"Module Manufacturing Month Verification\":\"As per process Card\"}'),
('13db1c3c-95e3-4b92-a0f1-3800e3a040f0','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Cleaning','{\"Avaibillity of WI\":\"\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"As per visual inspection criteria Annexure-A8\"}'),
('155bff98-a8c6-46ce-ba86-9ed5c3f1253e','f73037c9-5433-49ea-98ad-74ed934d2cf7','Final EL TEST','{\"Avaibillity of WI\":\"presented\",\"Voltage & Current Verification in DC power supply\":\"\",\"EL Defect\":{\"Observation 1\":\"gs(540)-5822\",\"Observation 2\":\"00\",\"Observation 3\":\"00\",\"Observation 4\":\"00\",\"Observation 5\":\"00\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Voltage & Current Verification in DC power supply\":\"Once a Shift\",\"EL Defect\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Voltage & Current Verification in DC power supply\":\"As per Voc & Isc\",\"EL Defect\":\"As per GSPL/IPQC/EL/020\"}'),
('18a24b07-8f91-4998-b524-652aae13c402','48167cab-d2e1-402f-a4f0-0b54198d25fd','Pre lamination EL &Visual','{\"EI Inspection after stringer Number of Stringer\":\"\",\"EI Inspection after stringer Number of Created Input text \":[],\"Visual inspection of string  Number of Stringer \":\"\",\"Visual inspection of string  Number of Created Input text \":[],\"Avaibility of acceptance criteria & WI\":\"\"}','','{\"EI Inspection after stringer\":\"5 Pieces Per Shift \",\"Visual inspection of string\":\"5 Pieces Per Shift \",\"Avaibility of acceptance criteria & WI\":\"Once per Shift\"}','{\"EI Inspection\":\"EI image should fulfil the EL Acceptance Critoria \",\"Visual inspection\":\"Visual image should fulfil the Visual Acceptance Critoria as per GSPL/IPQC/EL/020\",\"Avaibility of acceptance criteria & WI\":\"Avaibility of Acceptance Criteria and operator should be aware of Criteria\"}'),
('1ad61ade-4b80-492a-88c8-75f1dc6947be','6ade4093-205c-4a81-bec1-e85f967dc26b','Packaging','{\"Barcode Defects(unclear/duplication) \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Packing Label & Contents\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Box Condition\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Stretch wrapping\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Barcode Defects(unclear/duplication)\":\"5 Piece per  Shift\",\"Packing Label & Contents\":\"5 box per Shift\",\"Box Condition\":\"5 Box per Shift\",\"Stretch wrapping\":\"5 Box per Shift\"}','{\"Barcode Defects(unclear/duplication)\":\"As per GSPL/FQC/PV/001\",\"Packing Label & Contents\":\"As per GSPL/FQC/PV/001\",\"Box Condition\":\"No Damage/Dull printing\",\"Stretch wrapping\":\"Should be all around\"}'),
('1ca755f5-5b9b-4683-b974-b3dc1a4cf286','a872f642-3cf0-421a-9d91-2879c70d041b','Back Label','{\"Data Verification\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Air Bubbles,Tilt & Misprint\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Data Verification\":\"5 Piece per  Shift\",\"Air Bubbles,Tilt & Misprint\":\"5 Piece per Shift\"}','{\"Data Verification\":\"As per Datasheet/process card\",\"Air Bubbles,Tilt & Misprint\":\"Not Acceptable\"}'),
('1ff3dbc8-43fa-4fc7-8365-7cfdef9509f7','6ade4093-205c-4a81-bec1-e85f967dc26b','Final EL TEST','{\"Avaibillity of WI\":\"\",\"Voltage & Current Verification in DC power supply\":\"\",\"EL Defect\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Voltage & Current Verification in DC power supply\":\"Once a Shift\",\"EL Defect\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Voltage & Current Verification in DC power supply\":\"As per Voc & Isc\",\"EL Defect\":\"As per GSPL/IPQC/EL/020\"}'),
('254988b0-3f68-40ab-86ec-87da07e72751','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Buffing','{\"Avaibillity of WI\":\"\",\"Edge of corner, Buffing belt condition\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Edge of corner, Buffing belt condition\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Edge of corner, Buffing belt condition\":\"should not be sharp & Buffing belt should be properly working\"}'),
('25f9e16b-142e-47be-b171-f43814c0ee1b','9203000b-b8eb-4c14-b282-edfabbb3ac79','Auto String Layup','{\"Cell to cell gap\":\"\",\"String to string gap\":\"\",\"cell edge to glass edge(Top,bottom & sides)\":\"\"}','','{\"Cell to cell gap\":\"Once per Shift\",\"String to string gap\":\"Once per Shift\",\"cell edge to glass edge(Top,bottom & sides)\":\"Once per Shift\"}','{\"Cell to cell gap\":\"None\",\"String to string gap\":\"None\",\"cell edge to glass edge(Top,bottom & sides)\":\"None\"}'),
('26fc533e-f962-4b3b-9aa2-c6ce0b882b8b','f73037c9-5433-49ea-98ad-74ed934d2cf7','Cleaning','{\"Avaibillity of WI\":\"presented\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":{\"Observation 1\":\"zep0214\",\"Observation 2\":\"zep0052\",\"Observation 3\":\"zep0223\",\"Observation 4\":\"gs04008\",\"Observation 5\":\"gs03540m12724004253\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"As per visual inspection criteria Annexure-A8\"}'),
('286ed106-7629-4f20-91e8-269e6ec11653','a872f642-3cf0-421a-9d91-2879c70d041b','Buffing','{\"Avaibillity of WI\":\"\",\"Edge of corner, Buffing belt condition\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Edge of corner, Buffing belt condition\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Edge of corner, Buffing belt condition\":\"should not be sharp & Buffing belt should be properly working\"}'),
('29a17f02-984d-4211-9b8f-2abb17a5cac4','48167cab-d2e1-402f-a4f0-0b54198d25fd','Laminator','{\"Monitoring of Laminator Process parameter\":\"\",\"Adhesive on backsheet of the module\":\"\",\"Peel Adhesive Test\":\"\",\"Gel Content Test\":\"\"}','','{\"Monitoring of Laminator Process parameter\":\"Once per Shift\",\"Adhesive on backsheet of the module\":\"Once per Shift\",\"Peel Adhesive Test\":\"All Position | All Laminator Once a Week\",\"Gel Content Test\":\" All Position | All Laminator once a week \"}','{\"Monitoring of Laminator Process parameter\":\"Laminator specification GSPL/IPQC/LM/008 |  GSPL/IPQC/LM/009 |  GSPL/IPQC/LM/010\",\"Adhesive on backsheet of the module\":\"Teflon should be clean, No EVA residue is allowed \",\"Peel Adhesive Test\":\"Eva to Glass = 70N/cm EVA to Backsheet >= 80N/cm\",\"Gel Content Test\":\"75 to 95% \"}'),
('2a7e0014-ab76-41db-9411-e7bbdc151adc','48167cab-d2e1-402f-a4f0-0b54198d25fd','Glass side EVA cutting machine','{\"EVA dimension{LengthxWidthxThickness}\":\"1125×0.650mm\",\"Cutting Edge EVA \":\"2276×1125×0.650mm\",\"Position of front EVA\":\"good \",\"Avability of Specification & WI\":\"Available \"}','ok','{\"EVA dimension{LengthxWidthxThickness}\":\"Once a Shift\",\"Cutting Edge EVA \":\"Once a Shift\",\"Position of front EVA\":\"Once a Shift\",\"Avability of Specification & WI\":\"Once a Shift\"}','{\"EVA dimension{LengthxWidthxThickness}\":\"Refer Production order & Module Drawing\",\"Cutting Edge EVA \":\"Should not be uneven\",\"Position of front EVA\":\"Shifting of EVA on Glass not allowed\",\"Avability of Specification & WI\":\"Avability of Specification and WI & operator should be aware with specification\"}'),
('329537b3-d432-46e8-9626-ce5a40c2ffef','48167cab-d2e1-402f-a4f0-0b54198d25fd','Temperature & Relative humidity(%RH)monitoring','{\"shop floor Temperature condition\":\"17°c\",\"Relative humidity(%RH)in shop floor\":\"28°c\"}','ok','{\"shop floor Temperature condition\":\"Once a Shift\",\"Relative humidity(%RH)in shop floor\":\"Once per Shift\"}','{\"shop floor Temperature condition\":\"Temperature: 25+/- °C\",\"Relative humidity(%RH)in shop floor\":\"Humidity(%RH)<= 60%\"}'),
('349ceb7e-b235-4dee-935d-c0e6b7a6033f','f73037c9-5433-49ea-98ad-74ed934d2cf7','Final Visual Inspection','{\"Visual inspection \":{\"Observation 1\":\"zep0528\",\"Observation 2\":\"zep0323\",\"Observation 3\":\"zep0329\",\"Observation 4\":\"gs3822\",\"Observation 5\":\"gs4004\"},\"Fitment of JB cover\":{\"Observation 1\":\"gs3822\",\"Observation 2\":\"zep0339\",\"Observation 3\":\"gs4295\",\"Observation 4\":\"gs3822\",\"Observation 5\":\"gs03540m12724002463\"},\"Availability of acceptance Criteri & WI\":\"presented\"}','','{\"Visual inspection\":\"5 Piece per  Shift\",\"Fitment of JB cover\":\"5 Piece per Shift\",\"Availability of acceptance Criteri & WI\":\"Once per Shift\"}','{\"Visual inspection\":\"As per Visual Inspection criteria GSPl/IPQC/VI/021\",\"Fitment of JB cover\":\"Partial fitment of JB cover not allowed\",\"Availability of acceptance Criteri & WI\":\"Must be present\"}'),
('3bb681de-9bf1-407b-8ee9-5edd74bef43f','9203000b-b8eb-4c14-b282-edfabbb3ac79','Auto Bussing & Tapping','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\"\",\"Terminal busbar to edge of cell\":\"\",\"soldering quality of Ribbon to busbar\":\"\",\"Clearance between RFID&Logo patch to cell in module\":\"\",\"Position verification of RFID& Logo Patch on Module\":\"\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"\",\"quality of auto taping\":\"\",\"Avaibility of specification & WI\":\"\"}','','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\"Once per Shift\",\"Terminal busbar to edge of cell\":\"Once per Shift\",\"soldering quality of Ribbon to busbar\":\"Once per Shift\",\"Clearance between RFID&Logo patch to cell in module\":\"Thrice per Shift\",\"Position verification of RFID& Logo Patch on Module\":\"Thrice per Shift\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"Thrice per Shift\",\"quality of auto taping\":\"Once per Shift\",\"Avaibility of specification & WI\":\"Once per Shift\"}','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\">=4N | Refer\",\"Terminal busbar to edge of cell\":\"As per respective Layup Drawing\",\"soldering quality of Ribbon to busbar\":\"No Dry Soldering\",\"Clearance between RFID&Logo patch to cell in module\":\"Should not be 2mm-4mm gapfrom the cell to the patch\",\"Position verification of RFID& Logo Patch on Module\":\"Shiould not be tilt,Busbar should not visible\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"creepage distance should be 16+-1mm\",\"quality of auto taping\":\"No poor taping,cell shifting,cell breakage\",\"Avaibility of specification & WI\":\"Avaibility of specification & WI & operator should be aware of specification \"}'),
('4043c3d6-8d19-4637-a142-dd280c037314','a872f642-3cf0-421a-9d91-2879c70d041b','Sun Simulator Calibration','{\"Avaibillity of WI\":\"\",\"Temperature\":\"\",\"Irradiance\":\"\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":{\"Inspection First\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Second\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Third\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"}},\"Last Validation or calibration date and time\":{\"First Inspection\":\"\",\"Second Inspection\":\"\",\"Third Inspection\":\"\"},\"Expiry Date of Silver Module Verification\":\"\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Temperature\":\"Once a Shift\",\"Irradiance\":\"Once a Shift\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\"Every Four Hour\",\"Last Validation or calibration date and time\":\"Every Four Hour\",\"Expiry Date of Silver Module Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Temperature\":\"25+-2°C\",\"Irradiance\":\"1000W/m²\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\" Calibration performed at 25+-2°C room temperature\",\"Last Validation or calibration date and time\":\" verify also its result\",\"Expiry Date of Silver Module Verification\":\"3 Months\"}'),
('41ec853a-3e7c-4dd3-999e-9918b384810e','9203000b-b8eb-4c14-b282-edfabbb3ac79','Cell cutting machine','{\"cell Size\":\"182×91mm\",\"Cell manufacture & Eff.\":\"22.90%(7.53)\",\"cell color \":\"H4\",\"Avability of Specification & WI.\":\"available \"}','ok','{\"cell Size\":\"Thrice per shift\",\"Cell manufacture & Eff.\":\"Thrice per Shift\",\"cell color \":\"Thrice per Shift\",\"Avability of Specification & WI.\":\"Once a Shift\"}','{\"cell Size\":\"Refere Production Order\",\"Cell manufacture & Eff.\":\"Refer Production Order\",\"cell color \":\"Proper Segregation should be done as per color mixing not allowed\",\"Avability of Specification & WI.\":\"Avability of WI & Operator should be aware with WI\"}'),
('4a70af18-6e17-44c8-88a5-6d7505b7b9f1','a872f642-3cf0-421a-9d91-2879c70d041b','Framing','{\"Avaibility of WI & Sealant weight Specification\":\"\",\"Glue uniformity & continuity in frame groove\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Glue Weight\":\"\",\"Corner Gap\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Top & Buttom cut Length side cut length\":\"\",\"Mounting hole x,y pitch\":\"\",\"Anodizing thicknes\":\"\"}','','{\"Avaibility of WI & Sealant weight Specification\":\"Once a Shift\",\"Glue uniformity & continuity in frame groove\":\"5 Piece per Shift\",\"Glue Weight\":\"Once a Shift\",\"Corner Gap\":\"5 Piece per Shift\",\"Top & Buttom cut Length side cut length\":\"As per PO or process card\",\"Mounting hole x,y pitch\":\"once a Shift\",\"Anodizing thicknes\":\">=15micron \"}','{\"Avaibility of WI & Sealant weight Specification\":\"Must be Present\",\"Glue uniformity & continuity in frame groove\":\"should be continious & uniform,no gap between frame and backsheet\",\"Glue Weight\":\"As per GSPL/IPQC/FG/013\",\"Corner Gap\":\"No Corner Gap,No overlapping\",\"Top & Buttom cut Length side cut length\":\"+-1mm \",\"Mounting hole x,y pitch\":\"\",\"Anodizing thicknes\":\"\"}'),
('4a828014-e4e4-4b89-91e3-a50adaff3924','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Hipot','{\"Avaibillity of WI\":\"\",\"parameter\":\"\",\"DCW-4.0KV \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"IR-2.5KV\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Ground Continuity-62.5A \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"parameter\":\"Once a Shift\",\"DCW-4.0KV\":\"5 Piece per Shift\",\"IR-1.5 KV\":\"5 Piece per Shift\",\"Ground Continuity-62.5A.\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"parameter\":\"As per UL/As per IEC\",\"DCW-4.0KV\":\"As per GSPL technical Specification\",\"IR-1.5 KV\":\"As per GSPL technical Specification\",\"Ground Continuity-62.5A.\":\"As per GSPL technical Specification\"}'),
('4affc50b-7fbe-466e-b334-40d297884e41','9203000b-b8eb-4c14-b282-edfabbb3ac79','Pre lamination EL &Visual','{\"EI Inspection after stringer Number of Stringer\":\"\",\"EI Inspection after stringer Number of Created Input text \":[],\"Visual inspection of string  Number of Stringer \":\"\",\"Visual inspection of string  Number of Created Input text \":[],\"Avaibility of acceptance criteria & WI\":\"\"}','','{\"EI Inspection after stringer\":\"5 Pieces Per Shift \",\"Visual inspection of string\":\"5 Pieces Per Shift \",\"Avaibility of acceptance criteria & WI\":\"Once per Shift\"}','{\"EI Inspection\":\"EI image should fulfil the EL Acceptance Critoria \",\"Visual inspection\":\"Visual image should fulfil the Visual Acceptance Critoria as per GSPL/IPQC/EL/020\",\"Avaibility of acceptance criteria & WI\":\"Avaibility of Acceptance Criteria and operator should be aware of Criteria\"}'),
('4b9bea03-a63a-4a3f-a1bd-34e4efd9bdb2','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Trimming','{\"Avaibility of WI\":\"\",\"Physical verification of Union trimming & Blade replacing frequency\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibility of WI\":\"Once a Shift\",\"Physical verification of Union trimming & Blade replacing frequency\":\"5 Piece per Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Physical verification of Union trimming & Blade replacing frequency\":\"Uniniform trimming without any burr & residue\"}'),
('55eccfca-99c6-4eb9-97eb-7128b1f20528','2f84840b-137b-495a-800e-d70b99972cc3','Tabber & Stringer','{\"Avaibility os Specification & WI\":\"\"}','','{\"Visual Check after stringer\":\"5 string/stringer/shift \",\"Visual Check after stringer Number of Stringer\":\"\",\"Visual Check after stringer Number of Created Input text \":[],\"EI image of string\":\"5 string/stringer/shift \",\"EI image of string  Number of Stringer \":\"\",\"EI image of string  Number of Created Input text \":[],\"Verification of sildering peel strength\":\"2 string/stringer/shift \",\"Verification of sildering peel strength  Number of Stringer \":\"\",\"Verification of sildering peel strength Created Inputtext\":[],\"Avaibility os Specification & WI\":\"Once per Shift\"}','{\"Visual Check after stringer\":\"As per pre Lam Visual Criteria\",\"EI image of string\":\"As per pre Lam EI Criteria \",\"Verification of sildering peel strength\":\">=0.5N  |  Refer:GSPL/IPQC/GP/001\",\"Avaibility os Specification & WI\":\"Avaibility of specification and wi & operator should be aware with specification\"}'),
('5a35e4cb-1256-4716-ba61-b8e3e8c88769','f73037c9-5433-49ea-98ad-74ed934d2cf7','Sun Simulator Calibration','{\"Avaibillity of WI\":\"presented\",\"Temperature\":\"27 degree centrigade\",\"Irradiance\":\"1000.4w/m2\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":{\"Inspection First\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Second\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Third\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"}},\"Last Validation or calibration date and time\":{\"First Inspection\":\"\",\"Second Inspection\":\"\",\"Third Inspection\":\"\"},\"Expiry Date of Silver Module Verification\":\"\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Temperature\":\"Once a Shift\",\"Irradiance\":\"Once a Shift\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\"Every Four Hour\",\"Last Validation or calibration date and time\":\"Every Four Hour\",\"Expiry Date of Silver Module Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Temperature\":\"25+-2°C\",\"Irradiance\":\"1000W/m²\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\" Calibration performed at 25+-2°C room temperature\",\"Last Validation or calibration date and time\":\" verify also its result\",\"Expiry Date of Silver Module Verification\":\"3 Months\"}'),
('5ac2a2e2-d6d7-4ded-95d1-b5b45be73725','6ade4093-205c-4a81-bec1-e85f967dc26b','Final Visual Inspection','{\"Visual inspection \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Fitment of JB cover\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Availability of acceptance Criteri & WI\":\"\"}','','{\"Visual inspection\":\"5 Piece per  Shift\",\"Fitment of JB cover\":\"5 Piece per Shift\",\"Availability of acceptance Criteri & WI\":\"Once per Shift\"}','{\"Visual inspection\":\"As per Visual Inspection criteria GSPl/IPQC/VI/021\",\"Fitment of JB cover\":\"Partial fitment of JB cover not allowed\",\"Availability of acceptance Criteri & WI\":\"Must be present\"}'),
('5d28f438-f15c-4b09-80f1-1d12dbf8c79c','9203000b-b8eb-4c14-b282-edfabbb3ac79','Laminator','{\"Monitoring of Laminator Process parameter\":\"\",\"Adhesive on backsheet of the module\":\"\",\"Peel Adhesive Test\":\"\",\"Gel Content Test\":\"\"}','','{\"Monitoring of Laminator Process parameter\":\"Once per Shift\",\"Adhesive on backsheet of the module\":\"Once per Shift\",\"Peel Adhesive Test\":\"All Position | All Laminator Once a Week\",\"Gel Content Test\":\" All Position | All Laminator once a week \"}','{\"Monitoring of Laminator Process parameter\":\"Laminator specification GSPL/IPQC/LM/008 |  GSPL/IPQC/LM/009 |  GSPL/IPQC/LM/010\",\"Adhesive on backsheet of the module\":\"Teflon should be clean, No EVA residue is allowed \",\"Peel Adhesive Test\":\"Eva to Glass = 70N/cm EVA to Backsheet >= 80N/cm\",\"Gel Content Test\":\"75 to 95% \"}'),
('5e5e12a7-10ed-4019-9768-887958a0ad73','6ade4093-205c-4a81-bec1-e85f967dc26b','Trimming','{\"Avaibility of WI\":\"presented\",\"Physical verification of Union trimming & Blade replacing frequency\":{\"Observation 1\":\"Gs03540M12724004278\",\"Observation 2\":\"gs03540M12724004247\",\"Observation 3\":\"gs03540M12724004280\",\"Observation 4\":\"gs03540M12724004391\",\"Observation 5\":\"gs03540m12724004388\"}}','','{\"Avaibility of WI\":\"Once a Shift\",\"Physical verification of Union trimming & Blade replacing frequency\":\"5 Piece per Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Physical verification of Union trimming & Blade replacing frequency\":\"Uniniform trimming without any burr & residue\"}'),
('5ebf3dc4-7220-4510-b6ea-437d51303cae','f73037c9-5433-49ea-98ad-74ed934d2cf7','Buffing','{\"Avaibillity of WI\":\"presented\",\"Edge of corner, Buffing belt condition\":{\"Observation 1\":\"gs4139\",\"Observation 2\":\"gs4004\",\"Observation 3\":\"gs4295\",\"Observation 4\":\"gs3822\",\"Observation 5\":\"gs03540m12724004151\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Edge of corner, Buffing belt condition\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Edge of corner, Buffing belt condition\":\"should not be sharp & Buffing belt should be properly working\"}'),
('60cbe6ba-3960-441e-bfaa-d8df7f7a6ff5','9203000b-b8eb-4c14-b282-edfabbb3ac79','EVA/Backsheet cutting','{\"Rear EVA dimension & sift cutting width(mm)\":\"\",\"Back-sheet dimension& slit cutting diameter\":\"\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"\",\"Position of Back EVA & Backsheet on Glass\":\"\",\"Avaibility of specification&wI.\":\"\"}','','{\"Rear EVA dimension & sift cutting width(mm)\":\"Once per Shift\",\"Back-sheet dimension& slit cutting diameter\":\"Once per Shift\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"Once per Shift\",\"Position of Back EVA & Backsheet on Glass\":\"Once per Shift\",\"Avaibility of acceptance criteria & WI\":\"Once per Shift\"}','{\"Rear EVA dimension & sift cutting width(mm)\":\"As per Specification GSPL/EVA(IQC)/001 & production order\",\"Back-sheet dimension& slit cutting diameter\":\"As per Specification GSPL/BS(IQC)/001 & production order\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"Should not be uneven\",\"Position of Back EVA & Backsheet on Glass\":\"Shifting of EVA on Glass not allowed\",\"Avaibility of specification&wI.\":\"\"}'),
('628c5474-e21e-4ec5-b4c4-333031ce1e2d','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Sun Simulator Calibration','{\"Avaibillity of WI\":\"\",\"Temperature\":\"\",\"Irradiance\":\"\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":{\"Inspection First\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Second\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Third\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"}},\"Last Validation or calibration date and time\":{\"First Inspection\":\"\",\"Second Inspection\":\"\",\"Third Inspection\":\"\"},\"Expiry Date of Silver Module Verification\":\"\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Temperature\":\"Once a Shift\",\"Irradiance\":\"Once a Shift\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\"Every Four Hour\",\"Last Validation or calibration date and time\":\"Every Four Hour\",\"Expiry Date of Silver Module Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Temperature\":\"25+-2°C\",\"Irradiance\":\"1000W/m²\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\" Calibration performed at 25+-2°C room temperature\",\"Last Validation or calibration date and time\":\" verify also its result\",\"Expiry Date of Silver Module Verification\":\"3 Months\"}'),
('635617a1-3789-4b7c-a107-eceec88c0eea','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Curing','{\"Avaibility of WI\":\"\",\"Curing Time\":\"\",\"Temperature & Humidity\":\"\"}','','{\"Avaibility of WI\":\"Once a Shift\",\"Curing Time\":\"Continuos\",\"Temperature & Humidity\":\"Once a Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Curing Time\":\">=4Hr\",\"Temperature & Humidity\":\"25+-5oc &>=50%RH\"}'),
('63c1d89c-9e68-4e4c-ba3f-f0a61a9414f7','a872f642-3cf0-421a-9d91-2879c70d041b','Cleaning','{\"Avaibillity of WI\":\"\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"As per visual inspection criteria Annexure-A8\"}'),
('67d91824-13bb-41cb-96de-0266f11bf14e','f73037c9-5433-49ea-98ad-74ed934d2cf7','Junction Box Assembly','{\"Avaibility of WI & sealant weight specification\":\"presented\",\"Glue around jB\":{\"Observation 1\":\"gs4275\",\"Observation 2\":\"gs4283\",\"Observation 3\":\"gs4247\",\"Observation 4\":\"gs4383\",\"Observation 5\":\"gs03540m12724004295\"},\"JB tilt\":{\"Observation 1\":\"gs4275\",\"Observation 2\":\"gs4283\",\"Observation 3\":\"gs4247\",\"Observation 4\":\"gs4382\",\"Observation 5\":\"gs03540m12724002594\"},\"Glue Weight\":\"21.65\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"6.0:1\"}','','{\"Avaibility of WI & sealant weight specification\":\"Once a Shift\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"5 piece per Shift\",\"Glue Weight\":\"Once a  Shift\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"Once a  Shift\"}','{\"Avaibility of WI & sealant weight specification\":\"Must be Present\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"No Tilting\",\"Glue Weight\":\"As per GSPL/IPQC/JB/014\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"As per GSPL/IPQC/JB/015\"}'),
('685ca7b8-b348-49d5-abc2-b99c38346602','a872f642-3cf0-421a-9d91-2879c70d041b','Junction Box Assembly','{\"Avaibility of WI & sealant weight specification\":\"\",\"Glue around jB\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"JB tilt\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Glue Weight\":\"\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"\"}','','{\"Avaibility of WI & sealant weight specification\":\"Once a Shift\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"5 piece per Shift\",\"Glue Weight\":\"Once a  Shift\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"Once a  Shift\"}','{\"Avaibility of WI & sealant weight specification\":\"Must be Present\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"No Tilting\",\"Glue Weight\":\"As per GSPL/IPQC/JB/014\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"As per GSPL/IPQC/JB/015\"}'),
('6c681c56-7a02-4230-894b-e1cfb5b5738a','48167cab-d2e1-402f-a4f0-0b54198d25fd','Auto String Layup','{\"Cell to cell gap\":\"\",\"String to string gap\":\"\",\"cell edge to glass edge(Top,bottom & sides)\":\"18to 20 mm\"}','ok','{\"Cell to cell gap\":\"Once per Shift\",\"String to string gap\":\"Once per Shift\",\"cell edge to glass edge(Top,bottom & sides)\":\"Once per Shift\"}','{\"Cell to cell gap\":\"None\",\"String to string gap\":\"None\",\"cell edge to glass edge(Top,bottom & sides)\":\"None\"}'),
('6e200f53-0385-454f-b511-095bf8768fda','2f84840b-137b-495a-800e-d70b99972cc3','Pre lamination EL &Visual','{\"EI Inspection after stringer Number of Stringer\":\"\",\"EI Inspection after stringer Number of Created Input text \":[],\"Visual inspection of string  Number of Stringer \":\"\",\"Visual inspection of string  Number of Created Input text \":[],\"Avaibility of acceptance criteria & WI\":\"\"}','','{\"EI Inspection after stringer\":\"5 Pieces Per Shift \",\"Visual inspection of string\":\"5 Pieces Per Shift \",\"Avaibility of acceptance criteria & WI\":\"Once per Shift\"}','{\"EI Inspection\":\"EI image should fulfil the EL Acceptance Critoria \",\"Visual inspection\":\"Visual image should fulfil the Visual Acceptance Critoria as per GSPL/IPQC/EL/020\",\"Avaibility of acceptance criteria & WI\":\"Avaibility of Acceptance Criteria and operator should be aware of Criteria\"}'),
('70a6115e-1947-4098-9b5c-503070f00873','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Framing','{\"Avaibility of WI & Sealant weight Specification\":\"\",\"Glue uniformity & continuity in frame groove\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Glue Weight\":\"\",\"Corner Gap\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Top & Buttom cut Length side cut length\":\"\",\"Mounting hole x,y pitch\":\"\",\"Anodizing thicknes\":\"\"}','','{\"Avaibility of WI & Sealant weight Specification\":\"Once a Shift\",\"Glue uniformity & continuity in frame groove\":\"5 Piece per Shift\",\"Glue Weight\":\"Once a Shift\",\"Corner Gap\":\"5 Piece per Shift\",\"Top & Buttom cut Length side cut length\":\"As per PO or process card\",\"Mounting hole x,y pitch\":\"once a Shift\",\"Anodizing thicknes\":\">=15micron \"}','{\"Avaibility of WI & Sealant weight Specification\":\"Must be Present\",\"Glue uniformity & continuity in frame groove\":\"should be continious & uniform,no gap between frame and backsheet\",\"Glue Weight\":\"As per GSPL/IPQC/FG/013\",\"Corner Gap\":\"No Corner Gap,No overlapping\",\"Top & Buttom cut Length side cut length\":\"+-1mm \",\"Mounting hole x,y pitch\":\"\",\"Anodizing thicknes\":\"\"}'),
('72893c8f-8316-409c-9306-cab0f56e8594','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Post Lam Visual Inspection','{\"Avaibility of WI & criteria\":\"\",\"Visual Defects\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibility of WI & criteria\":\"Once a Shift\",\"Visual Defects\":\"5 Piece per Shift\"}','{\"Avaibility of WI & criteria\":\"Must be Present\",\"Visual Defects\":\"As per Visual inspection criteria : GSPl/IPQC/VI/021\"}'),
('770f831b-70fa-4918-99f0-ec939772a1a5','2f84840b-137b-495a-800e-d70b99972cc3','Auto String Layup','{\"Cell to cell gap\":\"\",\"String to string gap\":\"\",\"cell edge to glass edge(Top,bottom & sides)\":\"\"}','','{\"Cell to cell gap\":\"Once per Shift\",\"String to string gap\":\"Once per Shift\",\"cell edge to glass edge(Top,bottom & sides)\":\"Once per Shift\"}','{\"Cell to cell gap\":\"None\",\"String to string gap\":\"None\",\"cell edge to glass edge(Top,bottom & sides)\":\"None\"}'),
('770fd177-f7e8-4f76-afc9-66c57f354e1b','6ade4093-205c-4a81-bec1-e85f967dc26b','Junction Box Assembly','{\"Avaibility of WI & sealant weight specification\":\"\",\"Glue around jB\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"JB tilt\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Glue Weight\":\"\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"\"}','','{\"Avaibility of WI & sealant weight specification\":\"Once a Shift\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"5 piece per Shift\",\"Glue Weight\":\"Once a  Shift\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"Once a  Shift\"}','{\"Avaibility of WI & sealant weight specification\":\"Must be Present\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"No Tilting\",\"Glue Weight\":\"As per GSPL/IPQC/JB/014\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"As per GSPL/IPQC/JB/015\"}'),
('78574430-b609-44bc-b880-7f0d87e5fea7','9203000b-b8eb-4c14-b282-edfabbb3ac79','Cell Loading','{\"cellcolor\":\"\",\"cleanlines of cell Loading Area \":\"\",\"Cell loading as per WI\":\"\",\"Avability of WI \":\"\",\"Verification of process parameter\":\"\"}','','{\"cell color\":\"Thrice per Shift\",\"cleanlines of cell Loading Area \":\"Once per Shift\",\"Cell loading as per WI\":\"Once Per Shift\",\"Avability of WI \":\"Once per Shift \",\"Verification of process parameter\":\"Once per Shift\",\"string length & cell to cell gap\":\"5 string/stringer/shift \",\"string length Number of String\":\"\",\"string length Number of String Number of Created Input text\":[]}','{\"cell color\":\"Different Color of cell loading at a time not allowed\",\"cleanlines of cell Loading Area \":\"no unwanted or waste material should be near cell Loading Area\",\"Cell loading as per WI\":\"As per WI\",\"Avability of WI \":\"\",\"Verification of process parameter\":\"As pe Machine per Specification \",\"string length & cell to cell gap\":\"Refer Production Order 7 Module Drawing\"}'),
('797ac88a-5fd6-4a80-9967-f6cabbd98109','2f84840b-137b-495a-800e-d70b99972cc3','Cell Loading','{\"cellcolor\":\"\",\"cleanlines of cell Loading Area \":\"\",\"Cell loading as per WI\":\"\",\"Avability of WI \":\"\",\"Verification of process parameter\":\"\"}','','{\"cell color\":\"Thrice per Shift\",\"cleanlines of cell Loading Area \":\"Once per Shift\",\"Cell loading as per WI\":\"Once Per Shift\",\"Avability of WI \":\"Once per Shift \",\"Verification of process parameter\":\"Once per Shift\",\"string length & cell to cell gap\":\"5 string/stringer/shift \",\"string length Number of String\":\"\",\"string length Number of String Number of Created Input text\":[]}','{\"cell color\":\"Different Color of cell loading at a time not allowed\",\"cleanlines of cell Loading Area \":\"no unwanted or waste material should be near cell Loading Area\",\"Cell loading as per WI\":\"As per WI\",\"Avability of WI \":\"\",\"Verification of process parameter\":\"As pe Machine per Specification \",\"string length & cell to cell gap\":\"Refer Production Order 7 Module Drawing\"}'),
('7ad1f1d0-3188-4c14-b0b7-1833c3633e96','9203000b-b8eb-4c14-b282-edfabbb3ac79','Module Rework Station','{\"Avaibility of work instruvtion(WI)\":\"\",\"Method of Rework\":\"\",\"Handling of Modules\":\"\",\"Cleaning of Rework station/soldering iron sponge\":\"\"}','','{\"Avaibility of work instruvtion(WI)\":\"Once per Shift\",\"Method of Rework\":\"Once per Shift\",\"Handling of Modules\":\"Once per Shift\",\"Cleaning of Rework station/soldering iron sponge\":\"Once per Shift\"}','{\"Avaibility of work instruvtion(WI)\":\"WI Should be available at station and operator should be aware of WI\",\"Method of Rework\":\"As per WI\",\"Handling of Modules\":\"Operator Should handle the rework module with both the Hands\",\"Cleaning of Rework station/soldering iron sponge\":\"Rework station should be clean\"}'),
('7c15e28a-5df7-4b0d-9966-90ae0c07f62a','a872f642-3cf0-421a-9d91-2879c70d041b','Trimming','{\"Avaibility of WI\":\"\",\"Physical verification of Union trimming & Blade replacing frequency\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibility of WI\":\"Once a Shift\",\"Physical verification of Union trimming & Blade replacing frequency\":\"5 Piece per Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Physical verification of Union trimming & Blade replacing frequency\":\"Uniniform trimming without any burr & residue\"}'),
('7d9a8d32-55df-4331-b368-db3df30ae22d','6ade4093-205c-4a81-bec1-e85f967dc26b','Hipot','{\"Avaibillity of WI\":\"\",\"parameter\":\"\",\"DCW-4.0KV \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"IR-2.5KV\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Ground Continuity-62.5A \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"parameter\":\"Once a Shift\",\"DCW-4.0KV\":\"5 Piece per Shift\",\"IR-1.5 KV\":\"5 Piece per Shift\",\"Ground Continuity-62.5A.\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"parameter\":\"As per UL/As per IEC\",\"DCW-4.0KV\":\"As per GSPL technical Specification\",\"IR-1.5 KV\":\"As per GSPL technical Specification\",\"Ground Continuity-62.5A.\":\"As per GSPL technical Specification\"}'),
('81c3201d-150a-43d3-9284-2713eccc3ef4','a872f642-3cf0-421a-9d91-2879c70d041b','Packaging','{\"Barcode Defects(unclear/duplication) \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Packing Label & Contents\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Box Condition\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Stretch wrapping\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Barcode Defects(unclear/duplication)\":\"5 Piece per  Shift\",\"Packing Label & Contents\":\"5 box per Shift\",\"Box Condition\":\"5 Box per Shift\",\"Stretch wrapping\":\"5 Box per Shift\"}','{\"Barcode Defects(unclear/duplication)\":\"As per GSPL/FQC/PV/001\",\"Packing Label & Contents\":\"As per GSPL/FQC/PV/001\",\"Box Condition\":\"No Damage/Dull printing\",\"Stretch wrapping\":\"Should be all around\"}'),
('856cf06a-e378-4e90-b0da-98ec991e48ac','48167cab-d2e1-402f-a4f0-0b54198d25fd','Module Rework Station','{\"Avaibility of work instruvtion(WI)\":\"\",\"Method of Rework\":\"\",\"Handling of Modules\":\"\",\"Cleaning of Rework station/soldering iron sponge\":\"\"}','','{\"Avaibility of work instruvtion(WI)\":\"Once per Shift\",\"Method of Rework\":\"Once per Shift\",\"Handling of Modules\":\"Once per Shift\",\"Cleaning of Rework station/soldering iron sponge\":\"Once per Shift\"}','{\"Avaibility of work instruvtion(WI)\":\"WI Should be available at station and operator should be aware of WI\",\"Method of Rework\":\"As per WI\",\"Handling of Modules\":\"Operator Should handle the rework module with both the Hands\",\"Cleaning of Rework station/soldering iron sponge\":\"Rework station should be clean\"}'),
('86a26229-5b69-4339-8ecc-61db3b11626f','a872f642-3cf0-421a-9d91-2879c70d041b','Post Lam Visual Inspection','{\"Avaibility of WI & criteria\":\"\",\"Visual Defects\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibility of WI & criteria\":\"Once a Shift\",\"Visual Defects\":\"5 Piece per Shift\"}','{\"Avaibility of WI & criteria\":\"Must be Present\",\"Visual Defects\":\"As per Visual inspection criteria : GSPl/IPQC/VI/021\"}'),
('8778287a-c369-426b-8333-f16aa447b931','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Junction Box Assembly','{\"Avaibility of WI & sealant weight specification\":\"\",\"Glue around jB\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"JB tilt\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Glue Weight\":\"\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"\"}','','{\"Avaibility of WI & sealant weight specification\":\"Once a Shift\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"5 piece per Shift\",\"Glue Weight\":\"Once a  Shift\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"Once a  Shift\"}','{\"Avaibility of WI & sealant weight specification\":\"Must be Present\",\"Glue around jB\":\"5 Piece per Shift\",\"JB tilt\":\"No Tilting\",\"Glue Weight\":\"As per GSPL/IPQC/JB/014\",\"Glue(Base+Catalyst)potting Ratio & Weight\":\"As per GSPL/IPQC/JB/015\"}'),
('882ba5c1-8a08-466c-84a2-e262ea0731e6','6ade4093-205c-4a81-bec1-e85f967dc26b','Sun Simulator Calibration','{\"Avaibillity of WI\":\"\",\"Temperature\":\"\",\"Irradiance\":\"\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":{\"Inspection First\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Second\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"},\"Inspection Third\":{\"Time\":\"\",\"Room Temp\":\"\",\"Module Temp\":\"\",\"Module Id\":\"\"}},\"Last Validation or calibration date and time\":{\"First Inspection\":\"\",\"Second Inspection\":\"\",\"Third Inspection\":\"\"},\"Expiry Date of Silver Module Verification\":\"\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Temperature\":\"Once a Shift\",\"Irradiance\":\"Once a Shift\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\"Every Four Hour\",\"Last Validation or calibration date and time\":\"Every Four Hour\",\"Expiry Date of Silver Module Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Temperature\":\"25+-2°C\",\"Irradiance\":\"1000W/m²\",\"Each sun simulator validated after every four hours using valid silver reference PV module\":\" Calibration performed at 25+-2°C room temperature\",\"Last Validation or calibration date and time\":\" verify also its result\",\"Expiry Date of Silver Module Verification\":\"3 Months\"}'),
('88c50e16-e788-4357-83d6-2013a7be853f','2f84840b-137b-495a-800e-d70b99972cc3','Module Rework Station','{\"Avaibility of work instruvtion(WI)\":\"\",\"Method of Rework\":\"\",\"Handling of Modules\":\"\",\"Cleaning of Rework station/soldering iron sponge\":\"\"}','','{\"Avaibility of work instruvtion(WI)\":\"Once per Shift\",\"Method of Rework\":\"Once per Shift\",\"Handling of Modules\":\"Once per Shift\",\"Cleaning of Rework station/soldering iron sponge\":\"Once per Shift\"}','{\"Avaibility of work instruvtion(WI)\":\"WI Should be available at station and operator should be aware of WI\",\"Method of Rework\":\"As per WI\",\"Handling of Modules\":\"Operator Should handle the rework module with both the Hands\",\"Cleaning of Rework station/soldering iron sponge\":\"Rework station should be clean\"}'),
('91a0b244-b864-4528-9a19-4f3a94d8cbdd','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','RFID Reading & writing','{\"Avaibillity of WI\":\"\",\"Fixing position\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Tag read & write\":\"\",\"Certification Date Verification\":\"\",\"Cell Make & Manufacturing Month Verification\":\"\",\"Module Manufacturing Month Verification\":\"\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Fixing position\":\"5 Piece per Shift\",\"Tag read & write\":\"Continuous\",\"Certification Date Verification\":\"Once a Shift\",\"Cell Make & Manufacturing Month Verification\":\"Once a Shift\",\"Module Manufacturing Month Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Fixing position\":\"As per process Card\",\"Tag read & write\":\"A Tag should be read & write Content should comply MNRE guidline\",\"Certification Date Verification\":\"As per IEC/UL REPORT(As applicable)\",\"Cell Make & Manufacturing Month Verification\":\"As per BOM\",\"Module Manufacturing Month Verification\":\"As per process Card\"}'),
('92e7c957-e157-47e0-ac37-d540bb0c989d','9203000b-b8eb-4c14-b282-edfabbb3ac79','Tabber & Stringer','{\"Avaibility os Specification & WI\":\"\"}','','{\"Visual Check after stringer\":\"5 string/stringer/shift \",\"Visual Check after stringer Number of Stringer\":\"\",\"Visual Check after stringer Number of Created Input text \":[],\"EI image of string\":\"5 string/stringer/shift \",\"EI image of string  Number of Stringer \":\"\",\"EI image of string  Number of Created Input text \":[],\"Verification of sildering peel strength\":\"2 string/stringer/shift \",\"Verification of sildering peel strength  Number of Stringer \":\"\",\"Verification of sildering peel strength Created Inputtext\":[],\"Avaibility os Specification & WI\":\"Once per Shift\"}','{\"Visual Check after stringer\":\"As per pre Lam Visual Criteria\",\"EI image of string\":\"As per pre Lam EI Criteria \",\"Verification of sildering peel strength\":\">=0.5N  |  Refer:GSPL/IPQC/GP/001\",\"Avaibility os Specification & WI\":\"Avaibility of specification and wi & operator should be aware with specification\"}'),
('941ee0f4-3c3f-4b67-8942-3eef51e671be','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Final Visual Inspection','{\"Visual inspection \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Fitment of JB cover\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Availability of acceptance Criteri & WI\":\"\"}','','{\"Visual inspection\":\"5 Piece per  Shift\",\"Fitment of JB cover\":\"5 Piece per Shift\",\"Availability of acceptance Criteri & WI\":\"Once per Shift\"}','{\"Visual inspection\":\"As per Visual Inspection criteria GSPl/IPQC/VI/021\",\"Fitment of JB cover\":\"Partial fitment of JB cover not allowed\",\"Availability of acceptance Criteri & WI\":\"Must be present\"}'),
('9887402a-3430-40bf-9d21-26a624699d31','f73037c9-5433-49ea-98ad-74ed934d2cf7','Back Label','{\"Data Verification\":{\"Observation 1\":\"zep0368\",\"Observation 2\":\"zep0329\",\"Observation 3\":\"zep0360\",\"Observation 4\":\"zep0339\",\"Observation 5\":\"zep160424m5450323\"},\"Air Bubbles,Tilt & Misprint\":{\"Observation 1\":\"zep0368\",\"Observation 2\":\"zep0329\",\"Observation 3\":\"zep0360\",\"Observation 4\":\"zep0339\",\"Observation 5\":\"zep160424m5450323\"}}','','{\"Data Verification\":\"5 Piece per  Shift\",\"Air Bubbles,Tilt & Misprint\":\"5 Piece per Shift\"}','{\"Data Verification\":\"As per Datasheet/process card\",\"Air Bubbles,Tilt & Misprint\":\"Not Acceptable\"}'),
('99859608-1b1e-4b4e-b35d-35a75c9f3aa1','a872f642-3cf0-421a-9d91-2879c70d041b','RFID Reading & writing','{\"Avaibillity of WI\":\"\",\"Fixing position\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Tag read & write\":\"\",\"Certification Date Verification\":\"\",\"Cell Make & Manufacturing Month Verification\":\"\",\"Module Manufacturing Month Verification\":\"\"}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Fixing position\":\"5 Piece per Shift\",\"Tag read & write\":\"Continuous\",\"Certification Date Verification\":\"Once a Shift\",\"Cell Make & Manufacturing Month Verification\":\"Once a Shift\",\"Module Manufacturing Month Verification\":\"Once a Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Fixing position\":\"As per process Card\",\"Tag read & write\":\"A Tag should be read & write Content should comply MNRE guidline\",\"Certification Date Verification\":\"As per IEC/UL REPORT(As applicable)\",\"Cell Make & Manufacturing Month Verification\":\"As per BOM\",\"Module Manufacturing Month Verification\":\"As per process Card\"}'),
('9a9ba154-2ab1-4c04-a699-7c69cd4e9080','48167cab-d2e1-402f-a4f0-0b54198d25fd','Glass Loader','{\"Glass dimension(LengthxWidthxThickness)\":\"borosil 2272×1128×3.2 mm\",\"Avaibility of WI\":\"Available \"}','ok','{\"Glass dimension(LengthxWidthxThickness)\":\"Once a Shift\",\"Avaibility of WI\":\"Once a Shift\"}','{\"Glass dimension(LengthxWidthxThickness)\":\"Refer Production Order & Module Drawing\",\"Avaibility of WI\":\"Avability of WI & Operator Should be aware with WI\"}'),
('9ea352bd-f721-4096-b978-4b497e365b07','6ade4093-205c-4a81-bec1-e85f967dc26b','Cleaning','{\"Avaibillity of WI\":\"\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr\":\"As per visual inspection criteria Annexure-A8\"}'),
('a24f47ca-82c5-45e0-822f-7728605632e0','9203000b-b8eb-4c14-b282-edfabbb3ac79','Glass side EVA cutting machine','{\"EVA dimension{LengthxWidthxThickness}\":\"\",\"Cutting Edge EVA \":\"\",\"Position of front EVA\":\"\",\"Avability of Specification & WI\":\"\"}','','{\"EVA dimension{LengthxWidthxThickness}\":\"Once a Shift\",\"Cutting Edge EVA \":\"Once a Shift\",\"Position of front EVA\":\"Once a Shift\",\"Avability of Specification & WI\":\"Once a Shift\"}','{\"EVA dimension{LengthxWidthxThickness}\":\"Refer Production order & Module Drawing\",\"Cutting Edge EVA \":\"Should not be uneven\",\"Position of front EVA\":\"Shifting of EVA on Glass not allowed\",\"Avability of Specification & WI\":\"Avability of Specification and WI & operator should be aware with specification\"}'),
('a3cc647c-f321-4600-87a2-cbd68942e6ba','a872f642-3cf0-421a-9d91-2879c70d041b','Curing','{\"Avaibility of WI\":\"\",\"Curing Time\":\"\",\"Temperature & Humidity\":\"\"}','','{\"Avaibility of WI\":\"Once a Shift\",\"Curing Time\":\"Continuos\",\"Temperature & Humidity\":\"Once a Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Curing Time\":\">=4Hr\",\"Temperature & Humidity\":\"25+-5oc &>=50%RH\"}'),
('a5ef5516-2ce5-4620-b47b-128400d1d49d','a872f642-3cf0-421a-9d91-2879c70d041b','Hipot','{\"Avaibillity of WI\":\"\",\"parameter\":\"\",\"DCW-4.0KV \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"IR-2.5KV\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Ground Continuity-62.5A \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"parameter\":\"Once a Shift\",\"DCW-4.0KV\":\"5 Piece per Shift\",\"IR-1.5 KV\":\"5 Piece per Shift\",\"Ground Continuity-62.5A.\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"parameter\":\"As per UL/As per IEC\",\"DCW-4.0KV\":\"As per GSPL technical Specification\",\"IR-1.5 KV\":\"As per GSPL technical Specification\",\"Ground Continuity-62.5A.\":\"As per GSPL technical Specification\"}'),
('a6b48736-70e5-4f83-ba5b-ad6c12252c0d','48167cab-d2e1-402f-a4f0-0b54198d25fd','Auto Bussing & Tapping','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\"\",\"Terminal busbar to edge of cell\":\"\",\"soldering quality of Ribbon to busbar\":\"\",\"Clearance between RFID&Logo patch to cell in module\":\"\",\"Position verification of RFID& Logo Patch on Module\":\"\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"\",\"quality of auto taping\":\"\",\"Avaibility of specification & WI\":\"\"}','','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\"Once per Shift\",\"Terminal busbar to edge of cell\":\"Once per Shift\",\"soldering quality of Ribbon to busbar\":\"Once per Shift\",\"Clearance between RFID&Logo patch to cell in module\":\"Thrice per Shift\",\"Position verification of RFID& Logo Patch on Module\":\"Thrice per Shift\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"Thrice per Shift\",\"quality of auto taping\":\"Once per Shift\",\"Avaibility of specification & WI\":\"Once per Shift\"}','{\"Soldering Peel strength between Ribbon to bushbar interconnector\":\">=4N | Refer\",\"Terminal busbar to edge of cell\":\"As per respective Layup Drawing\",\"soldering quality of Ribbon to busbar\":\"No Dry Soldering\",\"Clearance between RFID&Logo patch to cell in module\":\"Should not be 2mm-4mm gapfrom the cell to the patch\",\"Position verification of RFID& Logo Patch on Module\":\"Shiould not be tilt,Busbar should not visible\",\"Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass\":\"creepage distance should be 16+-1mm\",\"quality of auto taping\":\"No poor taping,cell shifting,cell breakage\",\"Avaibility of specification & WI\":\"Avaibility of specification & WI & operator should be aware of specification \"}'),
('a9e45bcb-e4a4-4b20-adff-fd343ac31080','2f84840b-137b-495a-800e-d70b99972cc3','EVA/Backsheet cutting','{\"Rear EVA dimension & sift cutting width(mm)\":\"\",\"Back-sheet dimension& slit cutting diameter\":\"\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"\",\"Position of Back EVA & Backsheet on Glass\":\"\",\"Avaibility of specification&wI.\":\"\"}','','{\"Rear EVA dimension & sift cutting width(mm)\":\"Once per Shift\",\"Back-sheet dimension& slit cutting diameter\":\"Once per Shift\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"Once per Shift\",\"Position of Back EVA & Backsheet on Glass\":\"Once per Shift\",\"Avaibility of acceptance criteria & WI\":\"Once per Shift\"}','{\"Rear EVA dimension & sift cutting width(mm)\":\"As per Specification GSPL/EVA(IQC)/001 & production order\",\"Back-sheet dimension& slit cutting diameter\":\"As per Specification GSPL/BS(IQC)/001 & production order\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"Should not be uneven\",\"Position of Back EVA & Backsheet on Glass\":\"Shifting of EVA on Glass not allowed\",\"Avaibility of specification&wI.\":\"\"}'),
('aadc22ef-b8ab-4202-9388-03e3d2b6d76a','f73037c9-5433-49ea-98ad-74ed934d2cf7','Curing','{\"Avaibility of WI\":\"presented\",\"Curing Time\":\"curing time >=4hr\",\"Temperature & Humidity\":\"32degree Centigrade /40%\"}','','{\"Avaibility of WI\":\"Once a Shift\",\"Curing Time\":\"Continuos\",\"Temperature & Humidity\":\"Once a Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Curing Time\":\">=4Hr\",\"Temperature & Humidity\":\"25+-5oc &>=50%RH\"}'),
('aaf60407-aff1-4e99-a50b-e57f828242a8','48167cab-d2e1-402f-a4f0-0b54198d25fd','Tabber & Stringer','{\"Avaibility os Specification & WI\":\"\"}','','{\"Visual Check after stringer\":\"5 string/stringer/shift \",\"Visual Check after stringer Number of Stringer\":\"\",\"Visual Check after stringer Number of Created Input text \":[],\"EI image of string\":\"5 string/stringer/shift \",\"EI image of string  Number of Stringer \":\"\",\"EI image of string  Number of Created Input text \":[],\"Verification of sildering peel strength\":\"2 string/stringer/shift \",\"Verification of sildering peel strength  Number of Stringer \":\"\",\"Verification of sildering peel strength Created Inputtext\":[],\"Avaibility os Specification & WI\":\"Once per Shift\"}','{\"Visual Check after stringer\":\"As per pre Lam Visual Criteria\",\"EI image of string\":\"As per pre Lam EI Criteria \",\"Verification of sildering peel strength\":\">=0.5N  |  Refer:GSPL/IPQC/GP/001\",\"Avaibility os Specification & WI\":\"Avaibility of specification and wi & operator should be aware with specification\"}'),
('b03bc1c2-4af0-4d53-89b1-495fe7fcece6','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Final EL TEST','{\"Avaibillity of WI\":\"\",\"Voltage & Current Verification in DC power supply\":\"\",\"EL Defect\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Voltage & Current Verification in DC power supply\":\"Once a Shift\",\"EL Defect\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Voltage & Current Verification in DC power supply\":\"As per Voc & Isc\",\"EL Defect\":\"As per GSPL/IPQC/EL/020\"}'),
('b8202ce0-1e85-4265-b655-e169dd7c1241','9203000b-b8eb-4c14-b282-edfabbb3ac79','Temperature & Relative humidity(%RH)monitoring','{\"shop floor Temperature condition\":\"20°C\",\"Relative humidity(%RH)in shop floor\":\"28°C\"}','ok','{\"shop floor Temperature condition\":\"Once a Shift\",\"Relative humidity(%RH)in shop floor\":\"Once per Shift\"}','{\"shop floor Temperature condition\":\"Temperature: 25+/- °C\",\"Relative humidity(%RH)in shop floor\":\"Humidity(%RH)<= 60%\"}'),
('bf687c2e-20ef-47fe-9c0b-23a397c4fc75','6ade4093-205c-4a81-bec1-e85f967dc26b','Buffing','{\"Avaibillity of WI\":\"\",\"Edge of corner, Buffing belt condition\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Edge of corner, Buffing belt condition\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Edge of corner, Buffing belt condition\":\"should not be sharp & Buffing belt should be properly working\"}'),
('c4d9296c-99eb-4dd1-9225-b63fe31feca4','2f84840b-137b-495a-800e-d70b99972cc3','Glass side EVA cutting machine','{\"EVA dimension{LengthxWidthxThickness}\":\"\",\"Cutting Edge EVA \":\"\",\"Position of front EVA\":\"\",\"Avability of Specification & WI\":\"\"}','','{\"EVA dimension{LengthxWidthxThickness}\":\"Once a Shift\",\"Cutting Edge EVA \":\"Once a Shift\",\"Position of front EVA\":\"Once a Shift\",\"Avability of Specification & WI\":\"Once a Shift\"}','{\"EVA dimension{LengthxWidthxThickness}\":\"Refer Production order & Module Drawing\",\"Cutting Edge EVA \":\"Should not be uneven\",\"Position of front EVA\":\"Shifting of EVA on Glass not allowed\",\"Avability of Specification & WI\":\"Avability of Specification and WI & operator should be aware with specification\"}'),
('c961b5a4-81ea-45eb-83e0-3e194e6b89dd','2f84840b-137b-495a-800e-d70b99972cc3','Cell cutting machine','{\"cell Size\":\"\",\"Cell manufacture & Eff.\":\"\",\"cell color \":\"\",\"Avability of Specification & WI.\":\"\"}','','{\"cell Size\":\"Thrice per shift\",\"Cell manufacture & Eff.\":\"Thrice per Shift\",\"cell color \":\"Thrice per Shift\",\"Avability of Specification & WI.\":\"Once a Shift\"}','{\"cell Size\":\"Refere Production Order\",\"Cell manufacture & Eff.\":\"Refer Production Order\",\"cell color \":\"Proper Segregation should be done as per color mixing not allowed\",\"Avability of Specification & WI.\":\"Avability of WI & Operator should be aware with WI\"}'),
('cc313381-200e-478a-8f95-ac172eba56a8','6ade4093-205c-4a81-bec1-e85f967dc26b','Framing','{\"Avaibility of WI & Sealant weight Specification\":\"\",\"Glue uniformity & continuity in frame groove\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Glue Weight\":\"\",\"Corner Gap\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Top & Buttom cut Length side cut length\":\"\",\"Mounting hole x,y pitch\":\"\",\"Anodizing thicknes\":\"\"}','','{\"Avaibility of WI & Sealant weight Specification\":\"Once a Shift\",\"Glue uniformity & continuity in frame groove\":\"5 Piece per Shift\",\"Glue Weight\":\"Once a Shift\",\"Corner Gap\":\"5 Piece per Shift\",\"Top & Buttom cut Length side cut length\":\"As per PO or process card\",\"Mounting hole x,y pitch\":\"once a Shift\",\"Anodizing thicknes\":\">=15micron \"}','{\"Avaibility of WI & Sealant weight Specification\":\"Must be Present\",\"Glue uniformity & continuity in frame groove\":\"should be continious & uniform,no gap between frame and backsheet\",\"Glue Weight\":\"As per GSPL/IPQC/FG/013\",\"Corner Gap\":\"No Corner Gap,No overlapping\",\"Top & Buttom cut Length side cut length\":\"+-1mm \",\"Mounting hole x,y pitch\":\"\",\"Anodizing thicknes\":\"\"}'),
('cde13f2b-ff58-4cc2-9187-8ed35f66f64b','2f84840b-137b-495a-800e-d70b99972cc3','Laminator','{\"Monitoring of Laminator Process parameter\":\"\",\"Adhesive on backsheet of the module\":\"\",\"Peel Adhesive Test\":\"\",\"Gel Content Test\":\"\"}','','{\"Monitoring of Laminator Process parameter\":\"Once per Shift\",\"Adhesive on backsheet of the module\":\"Once per Shift\",\"Peel Adhesive Test\":\"All Position | All Laminator Once a Week\",\"Gel Content Test\":\" All Position | All Laminator once a week \"}','{\"Monitoring of Laminator Process parameter\":\"Laminator specification GSPL/IPQC/LM/008 |  GSPL/IPQC/LM/009 |  GSPL/IPQC/LM/010\",\"Adhesive on backsheet of the module\":\"Teflon should be clean, No EVA residue is allowed \",\"Peel Adhesive Test\":\"Eva to Glass = 70N/cm EVA to Backsheet >= 80N/cm\",\"Gel Content Test\":\"75 to 95% \"}'),
('d06dd250-9baa-4231-a179-62c2b75dce20','48167cab-d2e1-402f-a4f0-0b54198d25fd','Cell cutting machine','{\"cell Size\":\"182×91mm\",\"Cell manufacture & Eff.\":\"jiangxi RS solar 22.70(7.53)\",\"cell color \":\"dark blue \",\"Avability of Specification & WI.\":\"Available \"}','ok','{\"cell Size\":\"Thrice per shift\",\"Cell manufacture & Eff.\":\"Thrice per Shift\",\"cell color \":\"Thrice per Shift\",\"Avability of Specification & WI.\":\"Once a Shift\"}','{\"cell Size\":\"Refere Production Order\",\"Cell manufacture & Eff.\":\"Refer Production Order\",\"cell color \":\"Proper Segregation should be done as per color mixing not allowed\",\"Avability of Specification & WI.\":\"Avability of WI & Operator should be aware with WI\"}'),
('d27ae637-3a90-4dd1-b894-70877a698d45','48167cab-d2e1-402f-a4f0-0b54198d25fd','Cell Loading','{\"cellcolor\":\"same colour \",\"cleanlines of cell Loading Area \":\"clean \",\"Cell loading as per WI\":\"available \",\"Avability of WI \":\"available \",\"Verification of process parameter\":\"\"}','','{\"cell color\":\"Thrice per Shift\",\"cleanlines of cell Loading Area \":\"Once per Shift\",\"Cell loading as per WI\":\"Once Per Shift\",\"Avability of WI \":\"Once per Shift \",\"Verification of process parameter\":\"Once per Shift\",\"string length & cell to cell gap\":\"5 string/stringer/shift \",\"string length Number of String\":\"1\",\"string length Number of String Number of Created Input text\":[{\"cellLoaderVerificationControllers1\":\"\"},{\"cellLoaderVerificationControllers2\":\"\"},{\"cellLoaderVerificationControllers3\":\"\"},{\"cellLoaderVerificationControllers4\":\"\"},{\"cellLoaderVerificationControllers5\":\"\"}]}','{\"cell color\":\"Different Color of cell loading at a time not allowed\",\"cleanlines of cell Loading Area \":\"no unwanted or waste material should be near cell Loading Area\",\"Cell loading as per WI\":\"As per WI\",\"Avability of WI \":\"\",\"Verification of process parameter\":\"As pe Machine per Specification \",\"string length & cell to cell gap\":\"Refer Production Order 7 Module Drawing\"}'),
('d2a547ba-b746-48c5-aa21-2e81e5d1d6cf','a872f642-3cf0-421a-9d91-2879c70d041b','Final Visual Inspection','{\"Visual inspection \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Fitment of JB cover\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Availability of acceptance Criteri & WI\":\"\"}','','{\"Visual inspection\":\"5 Piece per  Shift\",\"Fitment of JB cover\":\"5 Piece per Shift\",\"Availability of acceptance Criteri & WI\":\"Once per Shift\"}','{\"Visual inspection\":\"As per Visual Inspection criteria GSPl/IPQC/VI/021\",\"Fitment of JB cover\":\"Partial fitment of JB cover not allowed\",\"Availability of acceptance Criteri & WI\":\"Must be present\"}'),
('d67b1f81-c850-4c01-b81d-d8086ab8afa0','f73037c9-5433-49ea-98ad-74ed934d2cf7','Hipot','{\"Avaibillity of WI\":\"presented \",\"parameter\":\"presented\",\"DCW-4.0KV \":{\"Observation 1\":\"gs3821\",\"Observation 2\":\"gs2115\",\"Observation 3\":\"zep0312\",\"Observation 4\":\"gs3935\",\"Observation 5\":\"gs03540m12724002463\"},\"IR-2.5KV\":{\"Observation 1\":\"gs3821\",\"Observation 2\":\"gs2115\",\"Observation 3\":\"zep0312\",\"Observation 4\":\"gs3935\",\"Observation 5\":\"gs03540m12724002335\"},\"Ground Continuity-62.5A \":{\"Observation 1\":\"gs3821\",\"Observation 2\":\"gs2115\",\"Observation 3\":\"gs0312\",\"Observation 4\":\"gs3935\",\"Observation 5\":\"gs03540m12724002448\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"parameter\":\"Once a Shift\",\"DCW-4.0KV\":\"5 Piece per Shift\",\"IR-1.5 KV\":\"5 Piece per Shift\",\"Ground Continuity-62.5A.\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"parameter\":\"As per UL/As per IEC\",\"DCW-4.0KV\":\"As per GSPL technical Specification\",\"IR-1.5 KV\":\"As per GSPL technical Specification\",\"Ground Continuity-62.5A.\":\"As per GSPL technical Specification\"}'),
('deb03b69-771c-4cd5-9026-ae735d470036','f73037c9-5433-49ea-98ad-74ed934d2cf7','Packaging','{\"Barcode Defects(unclear/duplication) \":{\"Observation 1\":\"zep160424m5450368\",\"Observation 2\":\"zep160424m5450329\",\"Observation 3\":\"zep160424m5450360\",\"Observation 4\":\"zep160424m5450339\",\"Observation 5\":\"zep160424m5450323\"},\"Packing Label & Contents\":{\"Observation 1\":\"zep0368\",\"Observation 2\":\"zep0329\",\"Observation 3\":\"zep0360\",\"Observation 4\":\"zep0360\",\"Observation 5\":\"zep0339\"},\"Box Condition\":{\"Observation 1\":\"zep0368\",\"Observation 2\":\"zep0329\",\"Observation 3\":\"zep0339\",\"Observation 4\":\"zep0360\",\"Observation 5\":\"zep160424m5450323\"},\"Stretch wrapping\":{\"Observation 1\":\"gs3821\",\"Observation 2\":\"gs2115\",\"Observation 3\":\"gs3935\",\"Observation 4\":\"zep0312\",\"Observation 5\":\"gs2448\"}}','','{\"Barcode Defects(unclear/duplication)\":\"5 Piece per  Shift\",\"Packing Label & Contents\":\"5 box per Shift\",\"Box Condition\":\"5 Box per Shift\",\"Stretch wrapping\":\"5 Box per Shift\"}','{\"Barcode Defects(unclear/duplication)\":\"As per GSPL/FQC/PV/001\",\"Packing Label & Contents\":\"As per GSPL/FQC/PV/001\",\"Box Condition\":\"No Damage/Dull printing\",\"Stretch wrapping\":\"Should be all around\"}'),
('e772a142-6529-495d-b845-d1d4dea4bd09','9203000b-b8eb-4c14-b282-edfabbb3ac79','String Rework station','{\"Avaibility of work instruvtion(WI)\":\"\",\"Cleaning of Rework station/soldering iron sponge\":\"\"}','','{\"Avaibility of work instruvtion(WI)\":\"Once per Shift\",\"Cleaning of Rework station/soldering iron sponge\":\"Once per Shift\"}','{\"Avaibility of work instruvtion(WI)\":\"WI Should be available at station and operator should be aware of WI\",\"Cleaning of Rework station/soldering iron sponge\":\"Rework Station should be Clean\"}'),
('e7f6a801-983a-4690-94de-eebc48756c2a','6ade4093-205c-4a81-bec1-e85f967dc26b','Curing','{\"Avaibility of WI\":\"\",\"Curing Time\":\"\",\"Temperature & Humidity\":\"\"}','','{\"Avaibility of WI\":\"Once a Shift\",\"Curing Time\":\"Continuos\",\"Temperature & Humidity\":\"Once a Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Curing Time\":\">=4Hr\",\"Temperature & Humidity\":\"25+-5oc &>=50%RH\"}'),
('e84509e8-55b1-4c33-8f20-e1330f0d7a90','48167cab-d2e1-402f-a4f0-0b54198d25fd','EVA/Backsheet cutting','{\"Rear EVA dimension & sift cutting width(mm)\":\"\",\"Back-sheet dimension& slit cutting diameter\":\"\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"\",\"Position of Back EVA & Backsheet on Glass\":\"\",\"Avaibility of specification&wI.\":\"\"}','','{\"Rear EVA dimension & sift cutting width(mm)\":\"Once per Shift\",\"Back-sheet dimension& slit cutting diameter\":\"Once per Shift\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"Once per Shift\",\"Position of Back EVA & Backsheet on Glass\":\"Once per Shift\",\"Avaibility of acceptance criteria & WI\":\"Once per Shift\"}','{\"Rear EVA dimension & sift cutting width(mm)\":\"As per Specification GSPL/EVA(IQC)/001 & production order\",\"Back-sheet dimension& slit cutting diameter\":\"As per Specification GSPL/BS(IQC)/001 & production order\",\"cutting Edge of Rear EVA & Backsheet on Glass\":\"Should not be uneven\",\"Position of Back EVA & Backsheet on Glass\":\"Shifting of EVA on Glass not allowed\",\"Avaibility of specification&wI.\":\"\"}'),
('e920b122-e70e-49e9-8beb-ef7a13e34b44','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Packaging','{\"Barcode Defects(unclear/duplication) \":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Packing Label & Contents\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Box Condition\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Stretch wrapping\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Barcode Defects(unclear/duplication)\":\"5 Piece per  Shift\",\"Packing Label & Contents\":\"5 box per Shift\",\"Box Condition\":\"5 Box per Shift\",\"Stretch wrapping\":\"5 Box per Shift\"}','{\"Barcode Defects(unclear/duplication)\":\"As per GSPL/FQC/PV/001\",\"Packing Label & Contents\":\"As per GSPL/FQC/PV/001\",\"Box Condition\":\"No Damage/Dull printing\",\"Stretch wrapping\":\"Should be all around\"}'),
('eb36d70b-a332-4b9a-ad34-3f03dabca923','f73037c9-5433-49ea-98ad-74ed934d2cf7','Trimming','{\"Avaibility of WI\":\"presented\",\"Physical verification of Union trimming & Blade replacing frequency\":{\"Observation 1\":\"gs4278\",\"Observation 2\":\"gs4247\",\"Observation 3\":\"gs4280\",\"Observation 4\":\"gs4391\",\"Observation 5\":\"gs03540m12724004388\"}}','','{\"Avaibility of WI\":\"Once a Shift\",\"Physical verification of Union trimming & Blade replacing frequency\":\"5 Piece per Shift\"}','{\"Avaibility of WI\":\"Must be Present\",\"Physical verification of Union trimming & Blade replacing frequency\":\"Uniniform trimming without any burr & residue\"}'),
('ed136afb-5263-4906-afe4-d2b78123e5ff','f73037c9-5433-49ea-98ad-74ed934d2cf7','Framing','{\"Avaibility of WI & Sealant weight Specification\":\"presented\",\"Glue uniformity & continuity in frame groove\":{\"Observation 1\":\"gs4273\",\"Observation 2\":\"gs4275\",\"Observation 3\":\"gs4283\",\"Observation 4\":\"gs4377\",\"Observation 5\":\"gs03540m12724004295\"},\"Glue Weight\":\"320g\",\"Corner Gap\":{\"Observation 1\":\"gs4273\",\"Observation 2\":\"gs4275\",\"Observation 3\":\"gs4283\",\"Observation 4\":\"gs4377\",\"Observation 5\":\"gs03540m12724004295\"},\"Top & Buttom cut Length side cut length\":\"320g\",\"Mounting hole x,y pitch\":\"1100mm,1640mm\",\"Anodizing thicknes\":\"15.2\"}','','{\"Avaibility of WI & Sealant weight Specification\":\"Once a Shift\",\"Glue uniformity & continuity in frame groove\":\"5 Piece per Shift\",\"Glue Weight\":\"Once a Shift\",\"Corner Gap\":\"5 Piece per Shift\",\"Top & Buttom cut Length side cut length\":\"As per PO or process card\",\"Mounting hole x,y pitch\":\"once a Shift\",\"Anodizing thicknes\":\">=15micron \"}','{\"Avaibility of WI & Sealant weight Specification\":\"Must be Present\",\"Glue uniformity & continuity in frame groove\":\"should be continious & uniform,no gap between frame and backsheet\",\"Glue Weight\":\"As per GSPL/IPQC/FG/013\",\"Corner Gap\":\"No Corner Gap,No overlapping\",\"Top & Buttom cut Length side cut length\":\"+-1mm \",\"Mounting hole x,y pitch\":\"\",\"Anodizing thicknes\":\"\"}'),
('f0c308ee-38f0-4364-9c69-d900235f1809','a872f642-3cf0-421a-9d91-2879c70d041b','Final EL TEST','{\"Avaibillity of WI\":\"\",\"Voltage & Current Verification in DC power supply\":\"\",\"EL Defect\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Avaibillity of WI\":\"Once a Shift\",\"Voltage & Current Verification in DC power supply\":\"Once a Shift\",\"EL Defect\":\"5 Piece per Shift\"}','{\"Avaibillity of WI\":\"Must be Present\",\"Voltage & Current Verification in DC power supply\":\"As per Voc & Isc\",\"EL Defect\":\"As per GSPL/IPQC/EL/020\"}'),
('f30eec9d-e51c-4439-9efb-a4e0efd44d1d','9203000b-b8eb-4c14-b282-edfabbb3ac79','Glass Loader','{\"Glass dimension(LengthxWidthxThickness)\":\"2272×1128×3.2mm\",\"Avaibility of WI\":\"Available \"}','ok','{\"Glass dimension(LengthxWidthxThickness)\":\"Once a Shift\",\"Avaibility of WI\":\"Once a Shift\"}','{\"Glass dimension(LengthxWidthxThickness)\":\"Refer Production Order & Module Drawing\",\"Avaibility of WI\":\"Avability of WI & Operator Should be aware with WI\"}'),
('f746567f-0ddc-4c47-86d1-a2891b36c18e','2f84840b-137b-495a-800e-d70b99972cc3','Temperature & Relative humidity(%RH)monitoring','{\"shop floor Temperature condition\":\"\",\"Relative humidity(%RH)in shop floor\":\"\"}','','{\"shop floor Temperature condition\":\"Once a Shift\",\"Relative humidity(%RH)in shop floor\":\"Once per Shift\"}','{\"shop floor Temperature condition\":\"Temperature: 25+/- °C\",\"Relative humidity(%RH)in shop floor\":\"Humidity(%RH)<= 60%\"}'),
('f7a4c7f5-1a02-43d5-a5f4-05bad8ddcb9f','2f84840b-137b-495a-800e-d70b99972cc3','Glass Loader','{\"Glass dimension(LengthxWidthxThickness)\":\"2272×1128×3.2mm\",\"Avaibility of WI\":\"Available \"}','ok','{\"Glass dimension(LengthxWidthxThickness)\":\"Once a Shift\",\"Avaibility of WI\":\"Once a Shift\"}','{\"Glass dimension(LengthxWidthxThickness)\":\"Refer Production Order & Module Drawing\",\"Avaibility of WI\":\"Avability of WI & Operator Should be aware with WI\"}'),
('f893668a-991d-407b-b1cf-2af7469166d3','c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','Back Label','{\"Data Verification\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"},\"Air Bubbles,Tilt & Misprint\":{\"Observation 1\":\"\",\"Observation 2\":\"\",\"Observation 3\":\"\",\"Observation 4\":\"\",\"Observation 5\":\"\"}}','','{\"Data Verification\":\"5 Piece per  Shift\",\"Air Bubbles,Tilt & Misprint\":\"5 Piece per Shift\"}','{\"Data Verification\":\"As per Datasheet/process card\",\"Air Bubbles,Tilt & Misprint\":\"Not Acceptable\"}'),
('fffa6a64-90f2-4967-9274-67b1cfabb078','48167cab-d2e1-402f-a4f0-0b54198d25fd','String Rework station','{\"Avaibility of work instruvtion(WI)\":\"\",\"Cleaning of Rework station/soldering iron sponge\":\"\"}','','{\"Avaibility of work instruvtion(WI)\":\"Once per Shift\",\"Cleaning of Rework station/soldering iron sponge\":\"Once per Shift\"}','{\"Avaibility of work instruvtion(WI)\":\"WI Should be available at station and operator should be aware of WI\",\"Cleaning of Rework station/soldering iron sponge\":\"Rework Station should be Clean\"}');

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
  `PreLamPdf` longtext DEFAULT NULL,
  `Location` longtext DEFAULT NULL,
  PRIMARY KEY (`PreLamDetailId`),
  KEY `PL_PreLamCreatedBy` (`CreatedBy`),
  KEY `PL_PreLamCheckedBy` (`CheckedBy`),
  CONSTRAINT `PL_PreLamCheckedBy` FOREIGN KEY (`CheckedBy`) REFERENCES `Person` (`PersonID`),
  CONSTRAINT `PL_PreLamCreatedBy` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `PreLamDetail` */

insert  into `PreLamDetail`(`PreLamDetailId`,`DocNo`,`RevNo`,`Date`,`Shift`,`Line`,`PONo`,`CheckedBy`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`Status`,`Type`,`PreLamPdf`,`Location`) values 
('22c41e4e-a77e-4299-a365-85d7ad505457','GSPL/IPQC/LM/008','1.0 dated 12.08.2023','','Day Shift',NULL,NULL,'ada6d45d-0b78-11ef-8005-52549f6cc694','ada6d45d-0b78-11ef-8005-52549f6cc694',NULL,'10-05-2024 11:05:00',NULL,'Inprogress','Laminator1',NULL,'[{\"Locationfield\":\"\"},{\"Locationfield\":\"\"},{\"Locationfield\":\"\"},{\"Locationfield\":\"\"},{\"Locationfield\":\"\"},{\"Locationfield\":\"\"}]'),
('276ae9aa-e856-40d3-9f19-5347048e3d32','GSPL/IPQC/ST/004','1.0 dated 12.08.2023','','Day Shift',NULL,NULL,'ada6d45d-0b78-11ef-8005-52549f6cc694','ada6d45d-0b78-11ef-8005-52549f6cc694',NULL,'10-05-2024 11:06:27',NULL,'Inprogress','Stringer1',NULL,NULL),
('279c6a7f-5f74-4905-afac-7560fab558dc','GSPL/IPQC/AF/011','1.0/12.08.2023','2024-05-11','Night Shift','GS03540M12724004170,4172,4175,4169,4180',NULL,'08d5d779-0b9c-11ef-8005-52549f6cc694',NULL,NULL,'11-05-2024 02:10:40',NULL,'Pending','Framing','http://srv515471.hstgr.cloud:9090/IPQC/Pdf/279c6a7f-5f74-4905-afac-7560fab558dc.pdf',NULL),
('2f84840b-137b-495a-800e-d70b99972cc3','GSPL/IPQC/IPC/003','1.0 dated 12.08.2023','2024-05-09','A','10BB','','af305f2c-0b9b-11ef-8005-52549f6cc694','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 13:23:58',NULL,'Inprogress','PreLam',NULL,NULL),
('48167cab-d2e1-402f-a4f0-0b54198d25fd','GSPL/IPQC/IPC/003','1.0 dated 12.08.2023','2024-05-09','A','10BB ','0000007645','af305f2c-0b9b-11ef-8005-52549f6cc694','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'09-05-2024 15:48:09',NULL,'Inprogress','PreLam',NULL,NULL),
('6ade4093-205c-4a81-bec1-e85f967dc26b','GSPL/IPQC/IPC/003','1.0 dated 12.08.2023','2024-05-11','B','post autoline','02','ee86a451-0ba1-11ef-8005-52549f6cc694','ee86a451-0ba1-11ef-8005-52549f6cc694',NULL,'11-05-2024 00:30:22',NULL,'Inprogress','PostLam',NULL,NULL),
('9203000b-b8eb-4c14-b282-edfabbb3ac79','GSPL/IPQC/IPC/003','1.0 dated 12.08.2023','2024-05-10','A','10 BB','X24022800H1NN','af305f2c-0b9b-11ef-8005-52549f6cc694','af305f2c-0b9b-11ef-8005-52549f6cc694',NULL,'10-05-2024 09:20:43',NULL,'Inprogress','PreLam',NULL,NULL),
('a872f642-3cf0-421a-9d91-2879c70d041b','GSPL/IPQC/IPC/003','1.0 dated 12.08.2023','','','','','ee86a451-0ba1-11ef-8005-52549f6cc694','ee86a451-0ba1-11ef-8005-52549f6cc694',NULL,'08-05-2024 14:27:14',NULL,'Inprogress','PostLam',NULL,NULL),
('c35134ad-14ed-41ec-9ffa-a1aaebe1e3d7','GSPL/IPQC/IPC/003','1.0 dated 12.08.2023','','','','','ee86a451-0ba1-11ef-8005-52549f6cc694','ee86a451-0ba1-11ef-8005-52549f6cc694',NULL,'11-05-2024 00:32:21',NULL,'Inprogress','PostLam',NULL,NULL),
('f73037c9-5433-49ea-98ad-74ed934d2cf7','GSPL/IPQC/IPC/003','1.0 dated 12.08.2023','2024-05-11','B','2-B','02','ee86a451-0ba1-11ef-8005-52549f6cc694','ee86a451-0ba1-11ef-8005-52549f6cc694',NULL,'11-05-2024 01:42:48',NULL,'Pending','PostLam','http://srv515471.hstgr.cloud:9090/IPQC/Pdf/f73037c9-5433-49ea-98ad-74ed934d2cf7.pdf',NULL);

/*Table structure for table `Quality` */

DROP TABLE IF EXISTS `Quality`;

CREATE TABLE `Quality` (
  `QualityId` varchar(255) DEFAULT NULL,
  `Shift` varchar(255) DEFAULT NULL,
  `ShiftInChargeName` varchar(255) DEFAULT NULL,
  `ShiftInChargePreLime` varchar(255) DEFAULT NULL,
  `ShiftInChargePostLim` varchar(255) DEFAULT NULL,
  `ProductBarCode` varchar(255) DEFAULT NULL,
  `Wattage` varchar(255) DEFAULT NULL,
  `ModelNumber` varchar(255) DEFAULT NULL,
  `IssueType` varchar(255) DEFAULT NULL,
  `Stage` varchar(255) DEFAULT NULL,
  `ResposiblePerson` varchar(255) DEFAULT NULL,
  `ReasonOfIssue` varchar(255) DEFAULT NULL,
  `IssueComeFrom` varchar(255) DEFAULT NULL,
  `ActionTaken` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `ModulePicture` longtext DEFAULT NULL,
  `OtherIssueType` varchar(255) DEFAULT NULL,
  `OtherModelNumber` varchar(255) DEFAULT NULL,
  UNIQUE KEY `dfsdfweewr` (`QualityId`) COMMENT 'sdfsdfsd',
  KEY `spt_foreignKey_Quality123` (`IssueType`),
  KEY `spt_foreignKey_Quality999` (`ModelNumber`),
  KEY `jj090909` (`CreatedBy`),
  CONSTRAINT `jj090909` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `Quality` */

/*Table structure for table `QualityReportExcel` */

DROP TABLE IF EXISTS `QualityReportExcel`;

CREATE TABLE `QualityReportExcel` (
  `ExcelId` varchar(255) DEFAULT NULL,
  `FromDate` varchar(55) DEFAULT NULL,
  `ToDate` varchar(55) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(55) DEFAULT NULL,
  `UpdatedOn` varchar(55) DEFAULT NULL,
  `ExcelURL` longtext DEFAULT NULL,
  UNIQUE KEY `kfdi943` (`ExcelId`) COMMENT 'sdfe3443524'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `QualityReportExcel` */

insert  into `QualityReportExcel`(`ExcelId`,`FromDate`,`ToDate`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`ExcelURL`) values 
('60761d21-a118-43cb-8e86-beba098c2e66','03-05-2024','08-05-2024','08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'10-05-2024 04:26:39',NULL,'http://srv515471.hstgr.cloud:9090/Quality/File/60761d21-a118-43cb-8e86-beba098c2e66.xlsx');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `Rejected` */

insert  into `Rejected`(`RejectedID`,`SolarDetailID`,`CheckTypes`,`Reason`,`Result`,`CreatedDate`,`UpdatedDate`) values 
('f7bbf04c-056e-40fc-8001-7a847e4d3f48','1ab345fc-da84-4dac-b488-551a05201ecd','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','07-05-2024 09:11:33',''),
('8c4e6d4c-6c94-4789-a92a-b712aba15c3c','8dde278e-2738-471f-a4bd-af440b84cf91','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','07-05-2024 12:11:17',''),
('1e531f78-ffdc-4e92-9a6b-5c0c4e6da637','1196c3bc-8617-49a9-a658-658ab78827f7','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','08-05-2024 05:50:46',''),
('960a6170-af22-4931-9558-9067eacc2565','07c944d3-e5d4-4d33-9291-e320001315b6','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','07-05-2024 12:29:59',''),
('8a9d5fd2-d708-4d59-942f-2e3d0860432f','a386a6c9-d2e6-40c0-8dee-978a47b342af','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false}]','','Pass','07-05-2024 13:23:17',''),
('68ad580d-f353-47f9-8fd0-1d3f16cee626','ef9d69ea-f796-49f9-9333-ad3dc3dabcd5','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','08-05-2024 06:45:22',''),
('3d670367-2510-41fa-a311-28279e4d134b','86bbf229-92c7-4476-b18a-c10732beb8e8','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','08-05-2024 07:09:44',''),
('1917fdfd-0ce4-4d41-ae1b-017848296631','ff68e09f-9b03-4043-88b6-3932d5f00da3','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','08-05-2024 09:59:02',''),
('31e305e2-84f7-4495-bd71-7e671517df2c','0470b2a1-035e-43fe-957e-209a406ab14c','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','08-05-2024 14:03:07',''),
('2066b426-2050-4f1c-a177-7f0036b88d19','fff10e7b-cd5e-4b3e-9871-767624a35eb6','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Fail','09-05-2024 05:18:45',''),
('302d265c-e371-4e8b-b764-4600ebc8fe46','5bb9778a-5872-4033-ae98-32d986dacfcd','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Pass','09-05-2024 09:45:25',''),
('46ba8985-14cb-4349-abab-4ee6623ae40f','76743097-9f62-4bf0-a35d-d924e2e1d126','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Fail','09-05-2024 12:22:31','');

/*Table structure for table `SealentWeight` */

DROP TABLE IF EXISTS `SealentWeight`;

CREATE TABLE `SealentWeight` (
  `PreLamDetailId` varchar(255) NOT NULL,
  `SealentWeightId` varchar(255) NOT NULL,
  `Stage` varchar(255) DEFAULT NULL,
  `WithoutSealant` varchar(555) DEFAULT NULL,
  `WithSealant` varchar(555) DEFAULT NULL,
  `DiffWeight` varchar(555) DEFAULT NULL,
  `BaseWeight` varchar(255) DEFAULT NULL,
  `CatalystWeight` varchar(255) DEFAULT NULL,
  `Ratio` varchar(255) DEFAULT NULL,
  UNIQUE KEY `unique_sealentWeightID` (`SealentWeightId`),
  KEY `sw_foreignKey` (`PreLamDetailId`),
  CONSTRAINT `sw_foreignKey` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `SealentWeight` */

/*Table structure for table `SolderingPeelTest` */

DROP TABLE IF EXISTS `SolderingPeelTest`;

CREATE TABLE `SolderingPeelTest` (
  `TestDetailId` varchar(255) DEFAULT NULL,
  `TestId` varchar(255) NOT NULL,
  `Track` varchar(55) DEFAULT NULL,
  `TrackData` longtext DEFAULT NULL,
  UNIQUE KEY `testid_unique_test` (`TestId`),
  KEY `spt_foreignKey_TestDetailId` (`TestDetailId`),
  CONSTRAINT `spt_foreignKey_TestDetailId` FOREIGN KEY (`TestDetailId`) REFERENCES `SolderingPeelTestDetail` (`TestDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `SolderingPeelTest` */

/*Table structure for table `SolderingPeelTestDetail` */

DROP TABLE IF EXISTS `SolderingPeelTestDetail`;

CREATE TABLE `SolderingPeelTestDetail` (
  `TestDetailId` varchar(255) NOT NULL,
  `DocNo` varchar(55) DEFAULT NULL,
  `RevNo` varchar(55) DEFAULT NULL,
  `RibbonMake` varchar(255) DEFAULT NULL,
  `CellSize` varchar(255) DEFAULT NULL,
  `RibbonSize` varchar(255) DEFAULT NULL,
  `Date` varchar(55) DEFAULT NULL,
  `Line` varchar(255) DEFAULT NULL,
  `Shift` varchar(255) DEFAULT NULL,
  `MachineNo` varchar(255) DEFAULT NULL,
  `OperatorName` varchar(255) DEFAULT NULL,
  `CellMake` varchar(255) DEFAULT NULL,
  `Status` varchar(55) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(55) DEFAULT NULL,
  `UpdatedOn` varchar(55) DEFAULT NULL,
  `BussingStage` varchar(255) DEFAULT NULL,
  `BusBarWidth` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `Type` varchar(55) DEFAULT NULL,
  `Pdf` varchar(555) DEFAULT NULL,
  PRIMARY KEY (`TestDetailId`),
  KEY `spt_foreignKey1` (`CreatedBy`),
  CONSTRAINT `spt_foreignKey1` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `SolderingPeelTestDetail` */

/*Table structure for table `StringerMachine` */

DROP TABLE IF EXISTS `StringerMachine`;

CREATE TABLE `StringerMachine` (
  `StringerMachineId` varchar(255) DEFAULT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `Parameter` varchar(255) DEFAULT NULL,
  `UOM` varchar(255) DEFAULT NULL,
  `Specification` varchar(255) DEFAULT NULL,
  `TrackA` varchar(255) DEFAULT NULL,
  `TrackB` varchar(255) DEFAULT NULL,
  UNIQUE KEY `wrwe423423` (`StringerMachineId`),
  KEY `StingerMachinePreLamDetailId_ak` (`PreLamDetailId`),
  CONSTRAINT `StingerMachinePreLamDetailId_ak` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `StringerMachine` */

insert  into `StringerMachine`(`StringerMachineId`,`PreLamDetailId`,`Parameter`,`UOM`,`Specification`,`TrackA`,`TrackB`) values 
('df9fe1ed-d729-4756-bce2-281187597af3','276ae9aa-e856-40d3-9f19-5347048e3d32','Set Temperature1 ','°C','230±30','',''),
('3b80771e-33f9-4e4f-9889-083240cdf456','276ae9aa-e856-40d3-9f19-5347048e3d32','Welding Time3','sec','1.7-2.5','',''),
('4a73fe95-44a2-488f-8384-7c16507e5e46','276ae9aa-e856-40d3-9f19-5347048e3d32','Welding Time2','sec','1.7-2.5','',''),
('6a4f9ecb-90f2-4291-889c-b6ffe840d751','276ae9aa-e856-40d3-9f19-5347048e3d32','Heating platform 3','°C','110+-30','',''),
('8dadef8f-20de-4233-9753-282ea2b46a14','276ae9aa-e856-40d3-9f19-5347048e3d32','Welding Time1','sec','1.7-2.5','',''),
('0e28ad8e-d8dd-45a1-97a1-2e0f0e6dadae','276ae9aa-e856-40d3-9f19-5347048e3d32','Welding Time5','sec','1.7-2.5','',''),
('ce135d66-1e84-4811-9dae-620c08f137eb','276ae9aa-e856-40d3-9f19-5347048e3d32','Set Temperature2','°C','230±30','',''),
('7e885115-7a61-4acc-99db-5e2dfc9b1bba','276ae9aa-e856-40d3-9f19-5347048e3d32','Welding Time6','sec','1.7-2.5','',''),
('0ef374cb-7fea-455b-aba5-957fcd9e737d','276ae9aa-e856-40d3-9f19-5347048e3d32','Welding Time4','sec','1.7-2.5','',''),
('4629d7f0-c475-4aeb-9005-4129d6202182','276ae9aa-e856-40d3-9f19-5347048e3d32','Heating platform 2','°C','90+-30','',''),
('6fa43f7a-25cb-4e06-8719-8b2194132a09','276ae9aa-e856-40d3-9f19-5347048e3d32','Heating platform 1','°C','80+-30','',''),
('8746f6d7-5d42-4757-a67f-49bcc476e373','276ae9aa-e856-40d3-9f19-5347048e3d32','Heating platform 4','°C','100+-30','',''),
('813014c2-683f-4311-9a8d-a31078c91931','276ae9aa-e856-40d3-9f19-5347048e3d32','Heating platform 5','°C','90+-30','',''),
('80ceac16-5fe3-472c-a921-e1164604ef48','276ae9aa-e856-40d3-9f19-5347048e3d32','Heating platform 6','°C','80+-30','',''),
('bae4d69f-77dc-4462-848c-e44cdf9a0792','276ae9aa-e856-40d3-9f19-5347048e3d32','Lowest Temp.setting','°C','30','',''),
('1a0a23ae-7289-4b97-8021-d6cef3b92942','276ae9aa-e856-40d3-9f19-5347048e3d32','Highest Temp. setting','°C','50','','');

/*Table structure for table `WorkLocation` */

DROP TABLE IF EXISTS `WorkLocation`;

CREATE TABLE `WorkLocation` (
  `LocationID` varchar(255) NOT NULL,
  `Location` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `WorkLocation` */

insert  into `WorkLocation`(`LocationID`,`Location`) values 
('fc9c8db9-e817-11ee-b439-0ac93defbbf1','Unit1'),
('fc9c906b-e817-11ee-b439-0ac93defbbf1','Unit2'),
('fc9c9178-e817-11ee-b439-0ac93defbbf1','Unit3');

/*Table structure for table `tdebug` */

DROP TABLE IF EXISTS `tdebug`;

CREATE TABLE `tdebug` (
  `tempDebugId` int(11) NOT NULL AUTO_INCREMENT,
  `Message` text DEFAULT NULL,
  `TS` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`tempDebugId`)
) ENGINE=InnoDB AUTO_INCREMENT=673 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci AVG_ROW_LENGTH=840 ROW_FORMAT=DYNAMIC;

/*Data for the table `tdebug` */

insert  into `tdebug`(`tempDebugId`,`Message`,`TS`) values 
(671,'pdata>>>>>>> - {\"personid\":\"\",\"empid\":\"G0001\",\"password\":\"$2b$08$/Kv9hGuSEsBSLCc2ujFkKOEh.87gO.S1ezuZwdnblqLKUsc1i1Dcm\",\"employeeid\":\"G001\",\"employeementtype\":\"Internal\",\"joblocation\":\"\",\"reportingmanager\":\"\",\"fullname\":\"Admin\",\"fathername\":\"Admin\",\"dob\":\"25 Jan 2001\",\"qualification\":\"Graduation\",\"gender\":\"Male\",\"maritalstatus\":\"Yes\",\"bloodgroup\":\"B+\",\"officialmobilenumber\":\"9718537367\",\"officialemailid\":\"krishukumar7827@gmail.com\",\"personalmobilenumber\":\"9718537367\",\"personalemailid\":\"krishukumar7827@gmail.com\",\"presentfulladdress\":\"OKHLA\",\"presentstate\":\"Delhi\",\"presentcity\":\"New Delhi\",\"presentpincode\":\"110020\",\"sameaspresentaddress\":\"True\",\"permanentfulladdress\":\"permanentcity\",\"permanentstate\":\"permanentstate\",\"permanentcity\":\"permanentcity\",\"permanentpincode\":\"permanentpincode\",\"dateofinterview\":\"16 feb 2001\",\"dateofjoining\":\"15 feb 2001\",\"department\":\"Admin\",\"designation\":\"Admin\",\"bankname\":\"HDFC\",\"accountnumber\":\"5464654546454\",\"ifsccode\":\"ifsccode\",\"pannumber\":\"pannumber\",\"branchaddress\":\"branchaddress\",\"familyname\":\"familyname\",\"familyrelation\":\"familyrelation\",\"familyaddress\":\"familyaddress\",\"familycontactnumber\":\"familycontactnumber\",}','2024-03-13 23:30:13'),
(672,'vfullname>>>>>>> - Admin','2024-03-13 23:30:13');

/* Function  structure for function  `json_extract_a` */

/*!50003 DROP FUNCTION IF EXISTS `json_extract_a` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` FUNCTION `json_extract_a`(`details` text, `required_field` varchar(255)) RETURNS text CHARSET latin1 COLLATE latin1_swedish_ci
BEGIN
  DECLARE search_term text;
  SET details = SUBSTRING_INDEX (details, "{", -1);
  SET details = SUBSTRING_INDEX (details, "}", 1);
  SET search_term = CONCAT('"', SUBSTRING_INDEX (required_field, '$.', -1), '"');
  IF INSTR(details, search_term) > 0 THEN
    RETURN TRIM(
    BOTH '"' FROM SUBSTRING_INDEX (
    SUBSTRING_INDEX (
    SUBSTRING_INDEX (
    details,
    search_term,
    -1
    ),
    ',"',
    1
    ),
    ':',
    -1
    )
    );
  ELSE
    RETURN NULL;
  END IF;
END */$$
DELIMITER ;

/* Function  structure for function  `json_extract_b` */

/*!50003 DROP FUNCTION IF EXISTS `json_extract_b` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` FUNCTION `json_extract_b`(`details` text, `required_field` varchar(255)) RETURNS text CHARSET latin1 COLLATE latin1_swedish_ci
BEGIN
  /*  Example Usage - 
      SELECT json_extract_b ('{"State":"Gujarat", "City":"Ahmedabad",}','State'); 
  */
  DECLARE isKeyExist bit(1);
  SET isKeyExist = 0;
  IF LOCATE(CONCAT('"', `required_field`, '":'), `details`) > 0 THEN
    SET isKeyExist = 1;
  END IF;
  IF isKeyExist = 1 THEN
    /* get key from function passed required field value */
    SET @JSON_key = SUBSTRING_INDEX (required_field, '$.', -1);
    /* get everything to the right of the 'key = <required_field>' */
    SET @JSON_entry = SUBSTRING_INDEX (details, CONCAT('"', @JSON_key, '"'), -1);

    /* get everything to the left of the trailing comma */
    SET @JSON_entry_no_trailing_comma = SUBSTRING_INDEX (@JSON_entry, ",", 1);
    /* get everything to the right of the leading colon after trimming trailing and leading whitespace */
    SET @JSON_entry_no_leading_colon = TRIM(LEADING ':' FROM TRIM(@JSON_entry_no_trailing_comma));
    /* trim off the leading and trailing double quotes after trimming trailing and leading whitespace*/
    SET @JSON_extracted_entry = TRIM(BOTH '"' FROM TRIM(@JSON_entry_no_leading_colon));

    RETURN @JSON_extracted_entry;
  ELSE
    RETURN '';
  END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `PersonRegister` */

/*!50003 DROP PROCEDURE IF EXISTS  `PersonRegister` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `PersonRegister`(IN pPersonid  VARCHAR(55),
pEmployeeId VARCHAR(55),
pName VARCHAR(55),
pLoginID VARCHAR(55),
pPassword VARCHAR(55),
pWorkLocation VARCHAR(55),
pEmail VARCHAR(55),
pDepartment VARCHAR(55),
pProfileImg VARCHAR(155),
pDesignation VARCHAR(55),
pCreatedOn VARCHAR(255),
pCreatedBy VARCHAR(255)
)
BEGIN
  DECLARE vPersonID VARCHAR(155);
  SET vPersonID = UUID();

  INSERT INTO Person (PersonID, EmployeeID, NAME, LoginID, PASSWORD, WorkLocation, Email, Department, ProfileImg, Desgination,STATUS,CreatedBy,CreatedOn)
    VALUES (vPersonID, pEmployeeId, pName, pLoginID, pPassword, pWorkLocation, pEmail, pDepartment, pProfileImg, pDesignation, 'Active',pCreatedBy,pCreatedOn);


  SELECT
    vPersonID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spAddEditemployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `spAddEditemployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spAddEditemployee`(IN pData longtext)
BEGIN

  DECLARE vpersonid,
          vempid,
          vpassword,
          vemployeementtype,
          vfullname,
          vfathername,
          vqualification,
          vgender,
          vmaritalstatus,
          vbloodgroup,
          vofficialmobilenumber,
          vofficialemailid,
          vpersonalmobilenumber,
          vpersonalemailid,
          vjoblocation,
          vreportingmanager,
          vpresentfulladdress,
          vpresentstate,
          vpresentcity,
          vpresentpincode,
          vsameaspresentaddress,
          vpermanentfulladdress,
          vpermanentstate,
          vpermanentcity,
          vpermanentpincode,
          vdepartment,
          vdesignation,
          vbankname,
          vaccountnumber,
          vifsccode,
          vpannumber,
          vbranchaddress,
          vfamilyname,
          vfamilyrelation,
          vfamilyaddress,
          vdepartmentname,
          vdesignationname,
          vfamilycontactnumber varchar(500);



  DECLARE vdob,
          vdateofinterview,
          vdateofjoining date;




  -- SET pdata = REPLACE(pdata, '}', '');

  SET pData = REPLACE(pData, '"}', '",}');

  CALL spLogL('pdata>>>>>>>', pData);

  SET vpersonid = json_extract_b(pData, 'personid');
  SET vempid = json_extract_b(pData, 'employeeid');
  SET vpassword = json_extract_b(pData, 'password');
  SET vemployeementtype = json_extract_b(pData, 'employeementtype');
  SET vfullname = json_extract_b(pData, 'fullname');
  SET vfathername = json_extract_b(pData, 'fathername');
  SET vqualification = json_extract_b(pData, 'qualification');
  SET vgender = json_extract_b(pData, 'gender');
  SET vmaritalstatus = json_extract_b(pData, 'maritalstatus');
  SET vbloodgroup = json_extract_b(pData, 'bloodgroup');
  SET vofficialmobilenumber = json_extract_b(pData, 'officialmobilenumber');
  SET vofficialemailid = json_extract_b(pData, 'officialemailid');
  SET vpersonalmobilenumber = json_extract_a(pData, 'personalmobilenumber');
  SET vpersonalemailid = json_extract_a(pData, 'personalemailid');
  SET vpresentfulladdress = json_extract_a(pData, 'presentfulladdress');
  SET vjoblocation = json_extract_b(pData, 'joblocation');
  SET vreportingmanager = json_extract_b(pData, 'reportingmanager');
  SET vpresentstate = json_extract_b(pData, 'presentstate');
  SET vpresentcity = json_extract_b(pData, 'presentcity');
  SET vpresentpincode = json_extract_b(pData, 'presentpincode');
  SET vsameaspresentaddress = json_extract_b(pData, 'sameaspresentaddress');
  SET vpermanentfulladdress = json_extract_b(pData, 'permanentfulladdress');
  SET vpermanentstate = json_extract_b(pData, 'permanentstate');
  SET vpermanentcity = json_extract_b(pData, 'permanentcity');
  SET vpermanentpincode = json_extract_b(pData, 'permanentpincode');
  SET vdepartment = json_extract_b(pData, 'department');
  SET vdesignation = json_extract_b(pData, 'designation');
  SET vbankname = json_extract_a(pData, 'bankname');
  SET vaccountnumber = json_extract_a(pData, 'accountnumber');
  SET vifsccode = json_extract_a(pData, 'ifsccode');
  SET vpannumber = json_extract_b(pData, 'pannumber');
  SET vbranchaddress = json_extract_b(pData, 'branchaddress');
  SET vfamilyname = json_extract_b(pData, 'familyname');
  SET vfamilyrelation = json_extract_b(pData, 'familyrelation');
  SET vfamilyaddress = json_extract_b(pData, 'familyaddress');
  SET vfamilycontactnumber = json_extract_b(pData, 'familycontactnumber');
  SET vdob = json_extract_b(pData, 'dob');
  SET vdateofinterview = json_extract_b(pData, 'dateofinterview');
  SET vdateofjoining = json_extract_b(pData, 'dateofjoining');


  CALL spLogL('vfullname>>>>>>>', vfullname);

  SELECT
    department INTO vdepartmentname
  FROM department d
  WHERE d.departmentid = vdepartment;

  SELECT
    designation INTO vdesignationname
  FROM designation d
  WHERE d.designationid = vdesignation;

  IF (vpersonid <> '') THEN

    --           UPDATE person p
    --           SET p.firstname = vFirstName,
    --               p.middlename = vMiddleName,
    --               p.lastname = vLastName,
    --               p.additionalsurname = vSurName,
    --               p.gender = vGender,
    --               p.aboutme = vAboutMe,
    --               p.dob = vDOB,
    --               p.marriageannivesary = vAnniversary,
    --               p.clubname = vClubName,
    --               p.bloodgroup = vbloodgroup,
    --               p.occupation = vOccupation,
    --               p.referralby = vReferralBy,
    --               p.referredbyname = vReferredbyname,
    --               p.updatedon = NOW(),
    --               p.updatedby = vCurrentuser
    --           WHERE p.personid = vPersonId
    --           AND (p.status = 'Active'
    --           OR p.status = 'Pending');

    --           UPDATE address a
    --           SET a.addressname = vBusinessName,
    --               a.addrline1 = vAddress1,
    --               a.addrline2 = vAddress2,
    --               a.nativevillage = vNativeVillage,
    --               a.city = vCity,
    --               a.state = vState,
    --               a.country = vCountry,
    --               a.area = vArea,
    --               a.postalcode = vPostalCode,
    --               a.latitude = vLatitude,
    --               a.longitude = vLongitude,
    --               a.facebooklink = vFacebooklink,
    --               a.instalink = vInstalink,
    --               a.linkdlnlink = vLinkedinLink,
    --               a.updatedon = NOW(),
    --               a.updatedby = vCurrentuser
    --           WHERE a.entityid = vPersonId
    --           AND a.status = 'Active'
    --           AND a.ispreferred = 1;


    SELECT
      vpersonid AS personid;



  ELSE



    SET vpersonid = UUID();

    INSERT INTO person (personid, empid, password, qualification, employeementtype, fullname, fathername, dob, gender, maritalstatus, bloodgroup, officialcontactno, personalcontactno, officialemail, personalemail, profilepic, joblocation, reportingmanager, status, createdon, createdby, updatedon, updatedby)
      VALUES (vpersonid, vempid, vpassword, vqualification, vemployeementtype, vfullname, vfathername, vdob, vgender, vmaritalstatus, vbloodgroup, vofficialmobilenumber, vpersonalmobilenumber, vofficialemailid, vpersonalemailid, '', vjoblocation, vreportingmanager, 'Active', NOW(), 'Admin', '', '');

    INSERT INTO address (addressid, entityid, presentfulladdress, presentstate, presentcity, presentpincode, issameaspresentaddress, permanentfulladdress, permanentstate, permanentcity, permanentpincode, status, createdon, createdby, updatedon, updatedby)
      VALUES (UUID(), vpersonid, vpresentfulladdress, vpresentstate, vpresentcity, vpresentpincode, vsameaspresentaddress, vpermanentfulladdress, vpermanentstate, vpermanentcity, vpermanentpincode, 'Active', NOW(), 'Admin', '', '');



    INSERT INTO joiningdetails (joiningdetailsid, entityid, doi, doj, department, designation, status, createdon, createdby, updatedon, updatedby)
      VALUES (UUID(), vpersonid, vdateofinterview, vdateofjoining, vdepartmentname, vdesignationname, 'Active', NOW(), 'Admin', '', '');

    INSERT INTO familycontactdetails (familycontactdetailsid, entityid, name, relation, address, contactnumber, joiningforms, status, createdon, createdby, updatedon, updatedby)
      VALUES (UUID(), vpersonid, vfamilyname, vfamilyrelation, vfamilyaddress, vfamilycontactnumber, '', 'Active', NOW(), 'Admin', '', '');

    INSERT INTO bankdetails (bankdetailsid, entityid, bankname, accountnumber, ifsccode, pannumber, branchaddress, status, createdon, createdby, updatedon, updatedby)
      VALUES (UUID(), vpersonid, vbankname, vaccountnumber, vifsccode, vpannumber, vbranchaddress, 'Active', NOW(), 'Admin', '', '');

    INSERT INTO remainingleavedays (empid, days)
      VALUES (vempid, 0);

    SELECT
      vpersonid,
      vempid;


  END IF;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spData` */

/*!50003 DROP PROCEDURE IF EXISTS  `spData` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spData`()
BEGIN


END */$$
DELIMITER ;

/* Procedure structure for procedure `spGetAllEmployeeList` */

/*!50003 DROP PROCEDURE IF EXISTS  `spGetAllEmployeeList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spGetAllEmployeeList`(ppersonid varchar(55))
BEGIN
  DECLARE vdesignation varchar(55);

  SELECT
    j.designation INTO vdesignation
  FROM person p
    JOIN joiningdetails j
      ON j.entityid = p.personid
  WHERE p.personid = ppersonid;

  IF vdesignation = 'Reporting Manager' THEN

    SELECT DISTINCT
      p.personid AS personid,
      p.empid AS employeeid,
      p.employeementtype AS employeementtype,
      p.fullname AS fullname,
      p.profilepic AS profilepic,
      p.qualification AS qualification,
      p.officialcontactno AS officialcontactno,
      p.officialemail AS officialemail,
      p.personalcontactno AS personalcontactno,
      p.personalemail AS personalemail,
      j.department AS department
    FROM person p
      INNER JOIN address a
        ON a.entityid = p.personid
      INNER JOIN joiningdetails j
        ON j.entityid = p.personid
      INNER JOIN bankdetails b
        ON b.entityid = p.personid
      INNER JOIN familycontactdetails f
        ON f.entityid = p.personid
    WHERE p.status = 'Active'
    AND p.reportingmanager = ppersonid
    ORDER BY a.createdon DESC;

  ELSE

    SELECT DISTINCT
      p.personid AS personid,
      p.empid AS employeeid,
      p.employeementtype AS employeementtype,
      p.fullname AS fullname,
      p.profilepic AS profilepic,
      p.qualification AS qualification,
      p.officialcontactno AS officialcontactno,
      p.officialemail AS officialemail,
      p.personalcontactno AS personalcontactno,
      p.personalemail AS personalemail,
      j.department AS department
    FROM person p
      INNER JOIN address a
        ON a.entityid = p.personid
      INNER JOIN joiningdetails j
        ON j.entityid = p.personid
      INNER JOIN bankdetails b
        ON b.entityid = p.personid
      INNER JOIN familycontactdetails f
        ON f.entityid = p.personid
    WHERE p.status = 'Active'
    ORDER BY a.createdon DESC;

  END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spGetDepartmentList` */

/*!50003 DROP PROCEDURE IF EXISTS  `spGetDepartmentList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spGetDepartmentList`()
BEGIN

  SELECT
    department,
    departmentid
  FROM department d
  ORDER BY department ASC;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spGetDesignation` */

/*!50003 DROP PROCEDURE IF EXISTS  `spGetDesignation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spGetDesignation`()
BEGIN
  SELECT
    p.personid,
    p.fullname,
    p.profilepic,
    j.designation
  FROM person p
    JOIN joiningdetails j
      ON j.entityid = p.personid
  WHERE j.designation = 'Reporting Manager';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spGetDesignationList` */

/*!50003 DROP PROCEDURE IF EXISTS  `spGetDesignationList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spGetDesignationList`(pDepartmentid varchar(55))
BEGIN
  SELECT
    designationid,
    designation
  FROM designation
  WHERE departmentid = pDepartmentid
  ORDER BY designation ASC;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spGetEmployeeListById` */

/*!50003 DROP PROCEDURE IF EXISTS  `spGetEmployeeListById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spGetEmployeeListById`(Ppersonid varchar(55))
BEGIN
  DECLARE vDepartment,
          VDesignation,
          vDepartmentId,
          VDesignationId varchar(55);

  SELECT
    j.department,
    j.designation INTO vDepartment, VDesignation
  FROM joiningdetails j
  WHERE j.entityid = Ppersonid
  AND j.status = 'Active';
  SELECT
    d.departmentid INTO vDepartmentId
  FROM department d
  WHERE d.department = vDepartment;
  SELECT
    d.designationid INTO VDesignationId
  FROM designation d
  WHERE d.departmentid = vDepartmentId
  AND d.designation = VDesignation;

  SELECT DISTINCT
    p.personid AS personid,
    p.empid AS employeeid,
    p.employeementtype AS employeementtype,
    p.fullname AS fullname,
    p.profilepic AS profilepic,
    p.officialcontactno AS officialcontactno,
    p.officialemail AS officialemail,
    p.personalcontactno AS personalcontactno,
    p.personalemail AS personalemail,
    p.fathername,
    p.dob,
    p.gender,
    p.maritalstatus,
    p.bloodgroup,
    p.joblocation,
    p.reportingmanager,
    p.qualification,
    j.doi,
    j.doj,
    VDesignationId AS designation,
    vDepartmentId AS department,
    a.presentfulladdress,
    a.presentstate,
    a.presentcity,
    a.presentpincode,
    a.issameaspresentaddress,
    a.permanentfulladdress,
    a.permanentstate,
    a.permanentcity,
    a.permanentpincode,
    b.bankname,
    b.accountnumber,
    b.ifsccode,
    b.pannumber,
    b.branchaddress,
    f.name AS familyname,
    f.relation AS familyrelation,
    f.address AS familyaddress,
    f.contactnumber AS familycontactnumber,
    f.joiningforms
  FROM person p
    INNER JOIN address a
      ON a.entityid = p.personid
    INNER JOIN joiningdetails j
      ON j.entityid = p.personid
    INNER JOIN bankdetails b
      ON b.entityid = p.personid
    INNER JOIN familycontactdetails f
      ON f.entityid = p.personid
  WHERE p.status = 'Active'
  AND p.personid = Ppersonid;



END */$$
DELIMITER ;

/* Procedure structure for procedure `spGetInOutList` */

/*!50003 DROP PROCEDURE IF EXISTS  `spGetInOutList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spGetInOutList`()
BEGIN

  SELECT
    a.employeeid,
    a.fullname,
    a.date,
    a.intime,
    a.outtime,
    a.totaltime,
    p.profilepic
  FROM attendance a
    INNER JOIN person p
      ON a.entityid = p.personid
  ORDER BY a.date DESC;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spGetReportingManager` */

/*!50003 DROP PROCEDURE IF EXISTS  `spGetReportingManager` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spGetReportingManager`(pEmpid varchar(55))
BEGIN
  SELECT
    p.empid,
    p.personid,
    p.profilepic,
    p.fullname,
    p.password,
    j.designation,
    j.department
  FROM person p
    JOIN joiningdetails j
      ON j.entityid = p.personid
  HAVING p.empid LIKE pEmpid;

END */$$
DELIMITER ;

/* Procedure structure for procedure `spLogL` */

/*!50003 DROP PROCEDURE IF EXISTS  `spLogL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spLogL`(`pLabel` text, `pMessage` text)
BEGIN
  INSERT INTO tdebug (Message)
    VALUES (CONCAT(pLabel, ' - ', IFNULL(pMessage, 'NULL')));
END */$$
DELIMITER ;

/* Procedure structure for procedure `spRemoveEmployeeById` */

/*!50003 DROP PROCEDURE IF EXISTS  `spRemoveEmployeeById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spRemoveEmployeeById`(Ppersonid varchar(55))
BEGIN
  UPDATE person p
  SET p.status = 'Inactive'
  WHERE p.personid = Ppersonid
  AND p.status = 'Active';
  UPDATE address a
  SET a.status = 'Inactive'
  WHERE a.entityid = Ppersonid
  AND a.status = 'Active';
  UPDATE joiningdetails j
  SET j.status = 'Inactive'
  WHERE j.entityid = Ppersonid
  AND j.status = 'Active';
  UPDATE bankdetails b
  SET b.status = 'Inactive'
  WHERE b.entityid = Ppersonid
  AND b.status = 'Active';
  UPDATE familycontactdetails f
  SET f.status = 'Inactive'
  WHERE f.entityid = Ppersonid
  AND f.status = 'Active';

END */$$
DELIMITER ;

/* Procedure structure for procedure `spSalaryCalculate` */

/*!50003 DROP PROCEDURE IF EXISTS  `spSalaryCalculate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spSalaryCalculate`(month varchar(55))
BEGIN
  DECLARE vWorkingDays,
          vPresentDays int;
  DECLARE vRemainingLeaves int;
  DECLARE vEmployeeName varchar(55);
  DECLARE vEmployeeID varchar(55);
  DECLARE vPercentage int;
  DECLARE vtaken_leave int;
  DECLARE vHalfDaysofMonth int;
  DECLARE vIsDataofMonth boolean;
  DECLARE done boolean DEFAULT FALSE;
  DECLARE cur CURSOR FOR
  SELECT
    a.employeeid,
    a.fullname,
    COUNT(a.employeeid) AS presentDay
  FROM attendance a
  WHERE MONTHNAME(a.date) = month
  GROUP BY a.employeeid;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  SET vIsDataofMonth = EXISTS (SELECT
      *
    FROM salarytable s
    WHERE s.month = month);



  IF vIsDataofMonth = FALSE THEN
    SELECT
      w.workingdays INTO vWorkingDays
    FROM workingdays w
    WHERE w.month = month;

    OPEN cur;

  read_loop:
    LOOP
      FETCH cur INTO vEmployeeId, vEmployeeName, vPresentDays;
      IF done THEN
        LEAVE read_loop;
      END IF;

      -- Do operations on vEmployeeId and vPresentDays here
      -- For example:
      SELECT
        days INTO vRemainingLeaves
      FROM remainingleavedays r
      WHERE r.empid = vEmployeeID;

      -- SELECT a.fullname INTO vEmployeeName FROM attendance a WHERE a.employeeid = vEmployeeID;

      SET vHalfDaysofMonth = FLOOR((50 / 100) * vWorkingDays);

      IF vWorkingDays = vPresentDays THEN
        SET vRemainingLeaves = vRemainingLeaves + 2;
        UPDATE remainingleavedays
        SET days = vRemainingLeaves
        WHERE empid = vEmployeeID;
      ELSEIF vWorkingDays > vPresentDays THEN
        SET vtaken_leave = vWorkingDays - vPresentDays;

        IF vtaken_leave > 2 THEN
          IF vPresentDays >= vHalfDaysofMonth THEN
            SET vPresentDays = vPresentDays + 2;
            SET vtaken_leave = vtaken_leave - 2;
          END IF;

          IF vtaken_leave > vRemainingLeaves THEN
            SET vPresentDays = vPresentDays + vRemainingLeaves;
            UPDATE remainingleavedays
            SET days = 0
            WHERE empid = vEmployeeID;
          ELSEIF vRemainingLeaves >= vtaken_leave THEN
            SET vPresentDays = vPresentDays + vtaken_leave;
            SET vRemainingLeaves = vRemainingLeaves - vtaken_leave;
            UPDATE remainingleavedays
            SET days = vRemainingLeaves
            WHERE empid = vEmployeeID;
          END IF;
        ELSEIF vtaken_leave <= 2
          AND vPresentDays >= vHalfDaysofMonth THEN
          SET vPresentDays = vPresentDays + vtaken_leave;
          SET vtaken_leave = 2 - vtaken_leave;
          SET vRemainingLeaves = vRemainingLeaves + vtaken_leave;
          UPDATE remainingleavedays
          SET days = vRemainingLeaves
          WHERE empid = vEmployeeID;
        END IF;
      ELSE
        SET vRemainingLeaves = vRemainingLeaves + 2;
        UPDATE remainingleavedays
        SET days = vRemainingLeaves
        WHERE empid = vEmployeeID;
      END IF;

      SET vPercentage = CEIL((vPresentDays / vWorkingDays) * 100);
      INSERT INTO salarytable (employee_id, employeename, month, presentdays, workingdays, percentageofdays)
        VALUES (vEmployeeId, vEmployeeName, month, vPresentDays, vWorkingDays, vPercentage);
    END LOOP;

    CLOSE cur;
    -- SELECT s.employee_id ,s.employeename , s.month , s.presentdays ,s.workingdays ,s.percentageofdays   FROM salarytable s;
    -- SELECT * FROM salarytable s WHERE s.month = month;
    CALL spSalaryCalculatehours(month);
  ELSE
    -- SELECT s.employee_id ,s.employeename , s.month , s.presentdays ,s.workingdays ,s.percentageofdays   FROM salarytable s;
    SELECT
      *
    FROM salarytable s
    WHERE s.month = month;
  END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spSalaryCalculatehours` */

/*!50003 DROP PROCEDURE IF EXISTS  `spSalaryCalculatehours` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spSalaryCalculatehours`(month varchar(55))
BEGIN
  DECLARE vWorkingHours,
          vPresentHours int;
  DECLARE vRemainingHours int;
  DECLARE vEmployeeID varchar(55);
  DECLARE vPercentage int;
  DECLARE vAbsentHours int;
  DECLARE vHalfHoursofMonth int;
  DECLARE vIsDataofMonth boolean;
  DECLARE done boolean DEFAULT FALSE;
  DECLARE cur CURSOR FOR
  SELECT
    a.employeeid,
    SUM(a.totaltime) AS presentHours
  FROM attendance a
  WHERE MONTHNAME(a.date) = month
  GROUP BY a.employeeid;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  SET vIsDataofMonth = EXISTS (SELECT
      1
    FROM salarytable s
    WHERE s.month = month
    AND s.percentageofhours IS NOT NULL);

  SELECT
    w.workinghours INTO vWorkingHours
  FROM workingdays w
  WHERE w.month = month;

  IF (vIsDataofMonth = FALSE) THEN
    OPEN cur;

  read_loop:
    LOOP
      FETCH cur INTO vEmployeeId, vPresentHours;
      IF done THEN
        LEAVE read_loop;
      END IF;

      -- Do operations on vEmployeeId and vPresentHours here
      -- For example:

      SELECT
        hours INTO vRemainingHours
      FROM remainingleavedays r
      WHERE r.empid = vEmployeeID;

      SET vHalfHoursofMonth = 50 * vWorkingHours / 100;

      IF (vWorkingHours = vPresentHours) THEN
        SET vRemainingHours = vRemainingHours + 2 * 9;
        UPDATE remainingleavedays
        SET hours = vRemainingHours
        WHERE empid = vEmployeeID;
      ELSEIF (vWorkingHours > vPresentHours) THEN
        SET vAbsentHours = vWorkingHours - vPresentHours;

        IF (vAbsentHours > 2 * 9) THEN
          IF (vPresentHours >= vHalfHoursofMonth) THEN
            SET vPresentHours = vPresentHours + 2 * 9;
            SET vAbsentHours = vAbsentHours - 2 * 9;
          END IF;

          IF (vAbsentHours > vRemainingHours) THEN
            SET vPresentHours = vPresentHours + vRemainingHours;
            UPDATE remainingleavedays
            SET hours = 0
            WHERE empid = vEmployeeID;
          ELSEIF (vRemainingHours >= vAbsentHours) THEN
            SET vPresentHours = vPresentHours + vAbsentHours;
            SET vRemainingHours = vRemainingHours - vAbsentHours;
            UPDATE remainingleavedays
            SET hours = vRemainingHours
            WHERE empid = vEmployeeID;
          END IF;
        ELSEIF (vAbsentHours <= 2 * 9
          AND vPresentHours >= vHalfHoursofMonth) THEN
          SET vPresentHours = vPresentHours + vAbsentHours;
          SET vAbsentHours = 2 * 9 - vAbsentHours;
          SET vRemainingHours = vRemainingHours + vAbsentHours;
          UPDATE remainingleavedays
          SET hours = vRemainingHours
          WHERE empid = vEmployeeID;
        END IF;
      ELSE
        SET vRemainingHours = vRemainingHours + 2 * 9;
        UPDATE remainingleavedays
        SET hours = vRemainingHours
        WHERE empid = vEmployeeID;
      END IF;

      SET vPercentage = CEIL(vPresentHours / vWorkingHours * 100);
      UPDATE salarytable s
      SET s.workinghours = vWorkingHours,
          s.presenthours = vPresentHours,
          s.percentageofhours = vPercentage
      WHERE s.employee_id = vEmployeeID
      AND s.month = month;

    END LOOP;

    CLOSE cur;
    SELECT
      *
    FROM salarytable s
    WHERE s.month = month;
  ELSE
    SELECT
      *
    FROM salarytable s
    WHERE s.month = month;
  END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spShowLog` */

/*!50003 DROP PROCEDURE IF EXISTS  `spShowLog` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`HRMGalo`@`%` PROCEDURE `spShowLog`()
BEGIN
  SELECT
    *
  FROM tdebug
  ORDER BY tempDebugId DESC;

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
