/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 8.0.35 : Database - QCDev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`QCDev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `QCDev`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ApprovalStatus` */

insert  into `ApprovalStatus`(`SolarDetailID`,`ApprovalStatusID`,`Status`,`Reason`,`CreatedBy`,`CreatedOn`,`UpdatedOn`) values 
('12df2281-e7e6-4751-b230-fb427b5ffc1a','07641969-31b8-4777-b504-a7101910b5ed','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','09-04-2024 09:58:12',NULL),
('4603e44c-00f2-4b33-b208-5863eab326c8','10fab766-d5d9-468c-a177-70602a2f21e7','Approved','Solar was not clean','08326670-ed04-11ee-b439-0ac93defbbf1','16-04-2024 13:21:49',NULL),
('3293417d-70e1-4964-90b0-0882624e017d','18991b98-6f41-4a66-9bb8-ba18f1866aa8','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','11-04-2024 09:35:21',NULL),
('3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','19fa1404-a61f-4867-9365-755ad79d5cc9','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','15-04-2024 10:24:36',NULL),
('561fc21b-802a-41f9-b77c-314fe3e35789','866ef00c-9698-4a65-8c0c-512e006e4e56','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','12-04-2024 11:14:52',NULL),
('60597056-5cf4-4377-97bd-c0d62a138730','86b1de43-9288-432c-ab7b-57f15e53e2b5','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','13-04-2024 11:50:21',NULL),
('75e61f5a-95b1-4683-b340-c217bee8533a','b6f23220-8a2b-4caf-8db3-9764959cef95','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','05-04-2024 15:11:03',NULL),
('369a0e54-c4ec-44cd-8f7c-171496d49e37','c11117c1-6573-4965-b6a3-879111a83e14','Rejected','Not Good','08326670-ed04-11ee-b439-0ac93defbbf1','09-04-2024 12:38:16',NULL),
('e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','cc028c5a-e9bb-4940-b307-29d31846271a','Rejected','Material Name','08326670-ed04-11ee-b439-0ac93defbbf1','10-04-2024 10:03:55',NULL),
('238524c3-1a23-411f-8453-e8e5e1363ee1','da81cb6a-56fb-49ec-a613-144cbf9b0a45','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','16-04-2024 13:20:55',NULL),
('eed25293-708c-4db3-baa3-dfb701758ca5','f9827c89-8939-431b-9e3c-05a0af7839af','Approved','','08326670-ed04-11ee-b439-0ac93defbbf1','10-04-2024 09:53:58',NULL);

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

insert  into `BOM`(`BOMId`,`BOMDetailId`,`BOMItem`,`Supplier`,`ModelNo`,`BatchNo`,`Remarks`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`) values 
('0365ce8e-03d1-4133-892a-2c10b9bdad27','eae1eff1-cf3d-4521-9675-1d27d6181506','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('0656b3f9-2e34-4e3e-b85f-527b6d13ed8a','c4ec0b02-45e0-4991-a78b-934802119741','Eva Glass side(frontEVA)','bb','bb','bb','bb','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('09d0bff6-b127-470b-8be8-79401687e206','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('0da20fc1-b110-4589-8859-9f603f461b4a','47739687-cfaf-444b-a846-5f90417e40fb','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('0fdbe8c5-604d-43d0-b08f-d80c89c5d376','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('14551092-aef7-4c6c-ae34-80608ac2087c','697f4be3-1022-4955-b4cf-c1662d1765e8','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('16a48af9-c157-4c32-acc7-273a7659adbf','697f4be3-1022-4955-b4cf-c1662d1765e8','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('172fda87-625d-4d13-b679-aedada611ab0','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('178276bc-fca9-4c37-beb9-0e9d71bcff23','47739687-cfaf-444b-a846-5f90417e40fb','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('19070eea-f2ca-4e1c-8b4e-5430b43c43b5','fc953d91-de90-4441-9abe-6e1858e337bf','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('1981bbc6-7471-44d4-aaa3-d6e296c0c8fc','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('1a545bc1-a326-4754-a3d9-af57d355e956','28a1fe01-af1d-43ab-8ac4-75d64b53063f','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('1ac7fd1c-9b6b-431b-9529-64d2c9043a7d','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('1efc9730-7c41-4956-aa92-014ce8c8c250','47739687-cfaf-444b-a846-5f90417e40fb','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('1f194748-bc93-4a67-b339-dcac43664b6e','eae1eff1-cf3d-4521-9675-1d27d6181506','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('1f29c468-50d1-4a26-837c-57a481c6a639','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('203852da-a103-47e0-8960-ac5c55c2d102','47739687-cfaf-444b-a846-5f90417e40fb','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('24c10979-7930-4f0b-b248-5fb68c75f8ab','eae1eff1-cf3d-4521-9675-1d27d6181506','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('2645cfb1-f1bb-4725-aa7a-05b44e91d15a','47739687-cfaf-444b-a846-5f90417e40fb','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('272f8fb4-2aff-4798-9993-c5660dead82c','c4ec0b02-45e0-4991-a78b-934802119741','Glass','bb','bb','bb','nb','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('27ee0fd8-5e28-46b0-99d9-a84689d755c2','f3f47ebf-5452-4685-8fd3-b6166ae97215','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('28555e71-cc7c-40cd-8489-9c35bfbacaa9','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('2905d36a-8ee8-46dd-b791-ddc2688939b9','eae1eff1-cf3d-4521-9675-1d27d6181506','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('29ea738b-b17b-4058-9c13-199b24155368','f3f47ebf-5452-4685-8fd3-b6166ae97215','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('2e3aa0db-5f4e-4da3-b82b-507106223f63','697f4be3-1022-4955-b4cf-c1662d1765e8','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('317ad343-5165-4493-b9f7-24388475fe3b','fc953d91-de90-4441-9abe-6e1858e337bf','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('327d1c79-d48b-4961-b0db-a230b370d40a','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('33efb2fb-31dc-4e0f-9cc0-aca956d2ebf9','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('35b7f542-6d81-4b0a-9d78-6f87c0811266','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('36617ca2-7cde-42c8-aad6-af16d804a5b3','47739687-cfaf-444b-a846-5f90417e40fb','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('37298065-a7f1-4155-aad4-8b86212c207a','eae1eff1-cf3d-4521-9675-1d27d6181506','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('37559064-70b6-4ca0-88a4-5b6d2516096d','c4ec0b02-45e0-4991-a78b-934802119741','Frame','bb','bh','bb','b','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('3bd21770-d71a-45fc-90cb-f03d0dfdca8e','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('3bf6ad52-1c44-42d8-b7fc-e33ee00eb755','f3f47ebf-5452-4685-8fd3-b6166ae97215','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('3d77509a-f45d-4c3e-aa80-3ed931220282','697f4be3-1022-4955-b4cf-c1662d1765e8','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('4339faff-0962-4133-b726-a61aafa767d3','eae1eff1-cf3d-4521-9675-1d27d6181506','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('45343c90-9adf-4e80-921b-9b98fd2e3e7a','47739687-cfaf-444b-a846-5f90417e40fb','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('471f3d91-5d7d-4d46-8bb2-13a673a73735','c4ec0b02-45e0-4991-a78b-934802119741','SolarCell','yy','hh','gg','gg','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('4cc63ec5-5f69-452f-b6f2-30bf9f739c7a','0564ec73-d27d-4e34-9cae-43c6579109cb','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('4cf7a5eb-951a-42b0-bd16-e69f6e3b26e6','eae1eff1-cf3d-4521-9675-1d27d6181506','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('507c488b-fe36-4fb0-b415-b28e7b305a48','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('50dfcc7e-a3e7-45aa-ba7a-e68b32dbcaab','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('516dd2d4-b561-4e95-826a-d35c99003ffe','fc953d91-de90-4441-9abe-6e1858e337bf','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('51793007-351e-4124-b16e-c4534fba4e92','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('542ae833-66e3-47c6-80ab-cca4d55dad50','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('550062ba-b9de-4c94-99d9-40d9452f10d5','4731e3f4-cef3-4a48-8848-e30c9cae65b0','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('55adb764-ac01-41cf-bd2e-760baf120875','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('55e87f9b-996a-4604-93e0-19d55b135796','0564ec73-d27d-4e34-9cae-43c6579109cb','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('560ff721-c2b9-48e4-b3d8-b8ac9c43b0d3','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('5b77a738-ac30-44d8-b00d-dc815b30c366','697f4be3-1022-4955-b4cf-c1662d1765e8','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('5d52070d-7185-441a-8033-ffc942046e95','eae1eff1-cf3d-4521-9675-1d27d6181506','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('5d68bd2f-5450-4667-907a-5b8c9fb270d2','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('60021a23-3182-4318-99aa-5d95766d7f70','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('6604abf1-e698-46f0-856d-2c6201e25797','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('6664608a-4bae-4cf5-b7e8-b25c8d442f96','c4ec0b02-45e0-4991-a78b-934802119741','Potting JB Sealant(A:B)','n','n','b','n','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('66a45ffa-4a83-438f-a3d5-10f6d2a852e7','eae1eff1-cf3d-4521-9675-1d27d6181506','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('677a96a9-4911-4972-88a8-ffd0aca6202c','fc953d91-de90-4441-9abe-6e1858e337bf','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('6c494d29-359d-469b-89a6-0fe1e0a99f63','fc953d91-de90-4441-9abe-6e1858e337bf','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('6cde54a1-f260-4e96-a1ca-4ba8c6077e58','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('6d6f3724-466c-4d70-81e8-cd7241bc34ec','0564ec73-d27d-4e34-9cae-43c6579109cb','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('6e3c82bf-3e0a-4e62-aff1-382f7eafe07e','47739687-cfaf-444b-a846-5f90417e40fb','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('6f01a456-9c91-49dd-b0d8-02bd802fda05','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('71e08b3c-9a8b-4a30-830d-a0d632f61111','fc953d91-de90-4441-9abe-6e1858e337bf','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('741b3fe2-e238-4240-96a7-e68fd4ec3b49','eae1eff1-cf3d-4521-9675-1d27d6181506','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('74313fb1-4d5d-4da4-8ea1-99ef07d1f40e','fc953d91-de90-4441-9abe-6e1858e337bf','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('764ea92a-aaa3-4c3d-831f-8d899b171d7e','c4ec0b02-45e0-4991-a78b-934802119741','Eva Glass Side(rear EVA)','nn','nn','nn','bb','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('78c24829-b48a-4ccb-b053-c4459ec7a11a','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('79cb49b9-fd30-40b0-848f-4b5058f9a164','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('7a02232d-af3d-4ad6-b0e1-ea1d97b7df6f','0564ec73-d27d-4e34-9cae-43c6579109cb','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('7acbe7e0-8dd7-4b8e-a3e9-faddb7a61ce1','fc953d91-de90-4441-9abe-6e1858e337bf','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('7b4f2c34-ec69-4da3-9904-da249262d761','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('7d47a3f2-d053-4611-912a-0044af1a31f6','0564ec73-d27d-4e34-9cae-43c6579109cb','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('7d6edfb6-e301-44d0-bb97-a470b9851b0a','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('7de6b9fe-f2f6-4504-97f1-175038dbb8cb','f3f47ebf-5452-4685-8fd3-b6166ae97215','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('7fc8da8f-f19d-47f6-a62a-1c48542bc8b3','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('82157c69-6797-4faa-ad07-a9de1ab1097d','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('84e84cc4-11cf-48bf-b2d1-e9c4f2ddc45d','f3f47ebf-5452-4685-8fd3-b6166ae97215','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('858989ff-d3ad-4e45-85f3-dddc06ad1374','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('85db6cc6-aacb-4c44-8a59-e77462a92c45','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('86daf778-9013-4131-9ea3-39aec26e96b4','fc953d91-de90-4441-9abe-6e1858e337bf','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('8a25aa75-8fc8-46c4-a544-979e43bb3dc5','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('8a76fd97-aa53-4f57-aebd-7c4c8c2f4c3f','eae1eff1-cf3d-4521-9675-1d27d6181506','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('8dffacf7-1042-4d06-a7f1-8f3253c7370e','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('8f56cb74-3a33-46f2-b9b9-c61858c6a15a','f3f47ebf-5452-4685-8fd3-b6166ae97215','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('8f772e9d-6fd8-49ed-b7a0-d4d62ae687dc','f3f47ebf-5452-4685-8fd3-b6166ae97215','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('909a85b2-ea21-48b4-bbe0-9d7d695771b7','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('90d0fbf3-5dd8-452a-b5c4-206bc55d06b1','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('91317e11-38b8-461d-8b75-c13277469787','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('931e1b99-22ec-4488-b4bf-411b961b874a','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('95338398-4858-4bc0-a447-f51961b2c6fb','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('958bb6df-b455-465f-ba38-2d0b9665d2d3','c4ec0b02-45e0-4991-a78b-934802119741','Ribbon','hh','bb','hb','bb','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('98835e99-9946-4d6e-ac7d-d04cfd483d7e','fc953d91-de90-4441-9abe-6e1858e337bf','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('9a29a070-e1c2-4cf0-b5a5-bd30a545d8e5','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('9c095d77-9466-46bf-a6d7-113ef7885a22','0564ec73-d27d-4e34-9cae-43c6579109cb','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('9ce593e6-a1bf-4ee0-83f9-2387a7bd3e33','f3f47ebf-5452-4685-8fd3-b6166ae97215','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('9fe8312c-19be-491a-8cc9-1b50ed687f05','eae1eff1-cf3d-4521-9675-1d27d6181506','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('a1e17843-de0d-49fc-8aef-da05c920f9fa','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('a1e2fef1-f3b8-4d37-8357-299fe2b78281','697f4be3-1022-4955-b4cf-c1662d1765e8','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('a29e4289-234a-45b5-9359-3b1030ea7fd3','c4ec0b02-45e0-4991-a78b-934802119741','Interconnector/Bus-bar','bh','bb','bb','bh','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('a79564d2-44e3-492b-914d-e86766184935','c4ec0b02-45e0-4991-a78b-934802119741','Back Sheet','nn','bb','bn','bb','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('a8a7b663-2803-49c2-bcec-b4fcc3cf7a2a','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('a93ec118-544a-4cf6-b746-afee1c245106','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('aaba1b44-bc2f-4062-bd91-4b5d5c51e65a','f3f47ebf-5452-4685-8fd3-b6166ae97215','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('ab5e23e1-c395-4332-91c4-e33e378b6fbe','eae1eff1-cf3d-4521-9675-1d27d6181506','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL),
('ab6cb39b-5283-4edc-8e64-9120870c8f39','0564ec73-d27d-4e34-9cae-43c6579109cb','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('acd8e651-6e5e-443d-82d3-3fb3ce9ee0a9','f3f47ebf-5452-4685-8fd3-b6166ae97215','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('aebaa8c5-88b6-4e8a-9dc3-300161a20632','f3f47ebf-5452-4685-8fd3-b6166ae97215','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('af7b4d01-ac9d-4374-90cb-72fb612cacb9','fc953d91-de90-4441-9abe-6e1858e337bf','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('b3429db5-9876-4f87-9b07-874308759b8a','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('b3e7191e-4826-4d5d-b50a-b9e984bb235f','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('b4142d61-b315-4bab-a9e1-99250d744a79','697f4be3-1022-4955-b4cf-c1662d1765e8','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('b763d716-c622-48af-8e48-ae4d834a4f4b','c4ec0b02-45e0-4991-a78b-934802119741','RFID','n','b','n','n','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('b86b2399-5353-4515-9de7-a78586ff5950','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('b9b08bb1-641c-49d1-8e92-0432d204a143','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('bafae51a-85d1-4a39-9fb9-41ac9006a434','47739687-cfaf-444b-a846-5f90417e40fb','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('bb253d50-d312-42f7-9b25-0a54ddbca43b','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('bce5cdfe-8949-4c38-9452-dc14bbffb06c','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('c0060a7d-feb3-43a6-90d8-3a542613acef','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('c3602bfb-a97b-449e-822c-f957374dd99c','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('c3cd04d1-6ae5-4e80-83fd-3050681a5044','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('c64dec6a-78b6-4132-9cc7-40771a17a7bf','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('c7af4e69-4715-46b6-ba53-d8ab051b9206','47739687-cfaf-444b-a846-5f90417e40fb','RFID','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('c9026957-5c65-48b9-a087-a6cf3b6d7ef8','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('cbc5299d-3e82-4eaf-9263-125cb97255f0','47739687-cfaf-444b-a846-5f90417e40fb','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('ccedfb15-bddc-4b87-8cb3-b1cb763241b8','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('cd8db3a4-d313-4e80-a361-90846265ee06','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('cf5275aa-e539-46fc-861b-30d17c76c376','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('d01aac64-8b78-4780-9334-9d4aa20b419d','28a1fe01-af1d-43ab-8ac4-75d64b53063f','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('d40996ca-d154-46e8-93cf-e968b6bf2c1f','6f72e55e-c9ac-4603-86ab-bfc28c6e1255','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL),
('d42cb847-c3fc-4009-b29f-9db7a4b71f81','4731e3f4-cef3-4a48-8848-e30c9cae65b0','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('d5ae76b7-707d-4d70-8da4-a77e27ec66fd','47739687-cfaf-444b-a846-5f90417e40fb','Glass','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('db1dd06e-1822-404e-b2d8-442a21c1b4a4','0564ec73-d27d-4e34-9cae-43c6579109cb','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('dbcf4ccb-0a90-4935-8317-b69ee6a853bd','f3f47ebf-5452-4685-8fd3-b6166ae97215','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('dcb34547-1aee-4b5b-9fa9-71285d0069ec','c4ec0b02-45e0-4991-a78b-934802119741','Flux','ggg','ghh','hhh','hhh','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('e230a8c9-876b-4661-ac9f-9bae282aff9e','c4ec0b02-45e0-4991-a78b-934802119741','Junction Box','bb','b','b','b','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('e3976fb7-2fdb-42f2-86bb-149e8c905f87','697f4be3-1022-4955-b4cf-c1662d1765e8','Eva Glass side(frontEVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('e4b4135b-b07f-4946-a231-92a7a046b178','697f4be3-1022-4955-b4cf-c1662d1765e8','Ribbon','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('e93ff345-f903-468f-baf4-75186a94ecc2','c4ec0b02-45e0-4991-a78b-934802119741','Frame Adhesive sealant','b','n','b','n','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 11:01:42',NULL),
('eb414f15-cb56-4ed7-9efa-dec76269292e','0564ec73-d27d-4e34-9cae-43c6579109cb','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('eb7261bf-5988-4561-929c-e72a91a17f65','fc953d91-de90-4441-9abe-6e1858e337bf','Eva Glass Side(rear EVA)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('ef065470-2ddc-4d98-ad0a-780803ea29b2','47739687-cfaf-444b-a846-5f90417e40fb','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL),
('ef123519-b802-4080-964e-2f31172555e2','0564ec73-d27d-4e34-9cae-43c6579109cb','Frame Adhesive sealant','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('efd3abd6-3316-44fc-a2ea-18f3de0a5f7e','697f4be3-1022-4955-b4cf-c1662d1765e8','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('f0a0dcb2-fd1b-48d2-8cb4-6738089aa3d7','f3f47ebf-5452-4685-8fd3-b6166ae97215','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:54:44',NULL),
('f3efaae9-b41a-49ad-a9a8-24043db49d90','0564ec73-d27d-4e34-9cae-43c6579109cb','Potting JB Sealant(A:B)','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('f525779d-efd5-443b-a28d-4e9914364333','4731e3f4-cef3-4a48-8848-e30c9cae65b0','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL),
('f535fc5d-bd7e-4be4-adbc-034d98564012','28a1fe01-af1d-43ab-8ac4-75d64b53063f','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL),
('f55b351f-edfe-4793-870f-b7c4dd820ccd','697f4be3-1022-4955-b4cf-c1662d1765e8','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('f5a0006e-088c-4b47-b99d-82ca9547cb46','0564ec73-d27d-4e34-9cae-43c6579109cb','SolarCell','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL),
('f70fff7b-ff6a-4936-a087-a15a1018e920','697f4be3-1022-4955-b4cf-c1662d1765e8','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('f809f559-fee4-45ce-a735-d777e678c43a','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Junction Box','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('f8899bbc-1392-4477-a8be-1495f8ff25ca','697f4be3-1022-4955-b4cf-c1662d1765e8','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 15:55:43',NULL),
('f9315690-8c64-42e7-bb4f-2b324ad0e5b7','99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','Frame','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:25:33',NULL),
('fd1998b7-3a32-4310-bcd4-70bfe14c7761','fc953d91-de90-4441-9abe-6e1858e337bf','Interconnector/Bus-bar','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL),
('feb74fcc-6fb2-44a2-981d-20217e034a59','1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','Flux','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:48:33',NULL),
('ff4dc491-9c39-4962-9205-6bd8cd434262','0564ec73-d27d-4e34-9cae-43c6579109cb','Back Sheet','','','','','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL);

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

insert  into `BOMVerificationDetails`(`BOMDetailId`,`Type`,`RevNo`,`Date`,`Shift`,`Line`,`PONo`,`Status`,`CheckedBy`,`ReviewedBy`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`ReferencePdf`,`DocNo`) values 
('0564ec73-d27d-4e34-9cae-43c6579109cb','BOM Verification','1.0 & 12.08.2023','','','','5000','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:30:35',NULL,NULL,'GSPL/IPQC/BM/002'),
('1aa26136-1d20-4f6b-9d19-d6ccf1bb4616','BOM Verification','1.0 & 12.08.2023','2024-04-20','','','99','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:54:52',NULL,NULL,'GSPL/IPQC/BM/002'),
('28a1fe01-af1d-43ab-8ac4-75d64b53063f','BOM Verification','1.0 & 12.08.2023','','','','66','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:58:55',NULL,NULL,'GSPL/IPQC/BM/002'),
('4731e3f4-cef3-4a48-8848-e30c9cae65b0','BOM Verification','1.0 & 12.08.2023','','','','88','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:47',NULL,NULL,'GSPL/IPQC/BM/002'),
('47739687-cfaf-444b-a846-5f90417e40fb','BOM Verification','1.0 & 12.08.2023','','','','800','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:36:11',NULL,NULL,'GSPL/IPQC/BM/002'),
('697f4be3-1022-4955-b4cf-c1662d1765e8','BOM Verification','1.0 & 12.08.2023','2024-04-20','','','1000','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:26:55',NULL,NULL,'GSPL/IPQC/BM/002'),
('6f72e55e-c9ac-4603-86ab-bfc28c6e1255','BOM Verification','1.0 & 12.08.2023','','','','20005','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:34:16',NULL,NULL,'GSPL/IPQC/BM/002'),
('99ce5e3a-2c78-4b93-8fba-d05d57d8af6a','BOM Verification','1.0 & 12.08.2023','2024-04-20','gff','frg','99','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:26:00',NULL,NULL,'GSPL/IPQC/BM/002'),
('c4ec0b02-45e0-4991-a78b-934802119741','BOM Verification','1.0 & 12.08.2023','2024-04-20','hy','gg','009','Approved','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1','08326670-ed04-11ee-b439-0ac93defbbf1','20-04-2024 11:10:34','20-04-2024 11:36:23','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IPQC/c4ec0b02-45e0-4991-a78b-934802119741_100636f5-2f2f-4dbb-9073-ceba2e5694b4_a426b3c5-95da-4339-9b57-7123376d4c04_DocScanner%20Apr%204%2C%202024%2017-16.pdf1712231362475369.pdf1713515233801362.p','GSPL/IPQC/BM/002'),
('eae1eff1-cf3d-4521-9675-1d27d6181506','BOM Verification','1.0 & 12.08.2023','','','','99','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 09:52:55',NULL,NULL,'GSPL/IPQC/BM/002'),
('f3f47ebf-5452-4685-8fd3-b6166ae97215','BOM Verification','1.0 & 12.08.2023','2024-04-20','','99','','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:24:44',NULL,NULL,'GSPL/IPQC/BM/002'),
('fc953d91-de90-4441-9abe-6e1858e337bf','BOM Verification','1.0 & 12.08.2023','','','','','Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,'20-04-2024 10:42:13',NULL,NULL,'GSPL/IPQC/BM/002');

/*Table structure for table `Department` */

DROP TABLE IF EXISTS `Department`;

CREATE TABLE `Department` (
  `DepartmentID` varchar(255) NOT NULL,
  `Department` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Department` */

insert  into `Department`(`DepartmentID`,`Department`) values 
('84949eb1-e816-11ee-b439-0ac93defbbf1','IQCP'),
('849684af-e816-11ee-b439-0ac93defbbf1','FQCP'),
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
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `Result` varchar(255) DEFAULT NULL,
  `CheckTypes` longtext,
  `Reason` varchar(255) DEFAULT NULL,
  `Product` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `ApprovalStatusReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FQCDetailId`),
  KEY `CreatedBy` (`CreatedBy`),
  CONSTRAINT `FQCDetails_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `FQCDetails` */

insert  into `FQCDetails`(`FQCDetailId`,`ProductSpecs`,`ProductBatchNo`,`PartyName`,`PackingDate`,`ReportNumber`,`DateOfQualityCheck`,`DocumentNo`,`RevNo`,`Status`,`Pdf`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`Result`,`CheckTypes`,`Reason`,`Product`,`Type`,`ApprovalStatusReason`) values 
('743ae489-55f9-4430-a87f-bab6645ffd49','rr','tt','ff','2024-04-22','ff','2024-04-22','GSPL/FQC/PDI/002','Ver1.0/12-08-2023','Inprogress',NULL,'08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'23-04-2024 04:55:19',NULL,'Fail','[{\"S1\":false},{\"S2\":false},{\"S3\":false}]','','PV Module','FQC',NULL),
('ce196e2f-a453-4b3e-ac76-439d6be24599','vv','Ak','hh','2024-04-22','tt','2024-04-22','GSPL/FQC/PDI/002','Ver1.0/12-08-2023','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IQC/ce196e2f-a453-4b3e-ac76-439d6be24599_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1713848942654623.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','08326670-ed04-11ee-b439-0ac93defbbf1','23-04-2024 05:09:06','23-04-2024 12:30:44','Fail','[{\"S1\":true},{\"S2\":false},{\"S3\":true}]','gggg','PV Module','FQC','');

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

insert  into `FQCTest`(`FQCId`,`FQCDetailId`,`Sample1`,`Sample2`,`Sample3`) values 
('593f4f6d-89b9-49c6-8965-796344e39781','743ae489-55f9-4430-a87f-bab6645ffd49','{\"visualParametersController930\":\"Visual Parameters\",\"visualParameterCrietrion1Controller930\":\"Should be neat and clean\",\"visualParameterS1Controller930\":\"\",\"visualParameterS1TestValue930\":false,\"visualParameterS1RemarksControllers930\":\"\",\"visualParameterCrietrion2Controller930\":\"No breakage allowed\",\"visualParameterS2Controller930\":\"\",\"visualParameterS2TestValue930\":false,\"visualParameterS2RemarksControllers930\":\"\",\"visualParameterCrietrion3Controller930\":\"Packing Condition\",\"visualParameterS3Controller930\":\"\",\"visualParameterS3TestValue930\":false,\"visualParameterS3RemarksControllers930\":\"\",\"visualParameterCrietrion4Controller930\":\"Framing Condition\",\"visualParameterS4Controller930\":\"\",\"visualParameterS4TestValue930\":false,\"visualParameterS4RemarksControllers930\":\"\",\"moduleRatingParameters1Controller930\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller930\":\"\",\"moduleRatingParameterS1TestValue930\":false,\"moduleRatingParameterS1RemarksControllers930\":\"\",\"moduleRatingParameters2Controller930\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller930\":\"\",\"moduleRatingParameterS2TestValue930\":false,\"moduleRatingParameterS2RemarksControllers930\":\"\",\"otherParameters1Controller930\":\"QC Sticker\",\"otherParameterCrietrion1Controller930\":\"Should be oasted\",\"otherParameterS1Controller930\":\"\",\"otherParameterS1TestValue930\":false,\"otherParameterS1RemarksControllers930\":\"\",\"otherParameters2Controller930\":\"Module info Label\",\"otherParameterCrietrion2Controller930\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller930\":\"\",\"otherParameterS2TestValue930\":false,\"otherParameterS2RemarksControllers930\":\"\",\"otherParameters3Controller930\":\"RFID\",\"otherParameterCrietrion3Controller930\":\"Should be oasted\",\"otherParameterS3Controller930\":\"\",\"otherParameterS3TestValue930\":false,\"otherParameterS3RemarksControllers930\":\"\",\"otherParameters4Controller930\":\"Company Logo\",\"otherParameterCrietrion4Controller930\":\"Should be Pasted\",\"otherParameterS4Controller930\":\"\",\"otherParameterS4TestValue930\":false,\"otherParameterS4RemarksControllers930\":\"\",\"otherParameters5Controller930\":\"Junction Box\",\"otherParameterCrietrion5Controller930\":\"Should be Pasted\",\"otherParameterS5Controller930\":\"\",\"otherParameterS5TestValue930\":false,\"otherParameterS5RemarksControllers930\":\"\",\"otherParameters6Controller930\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller930\":\"Should be provided with JB\",\"otherParameterS6Controller930\":\"\",\"otherParameterS6TestValue930\":false,\"otherParameterS6RemarksControllers930\":\"\",\"otherParameters7Controller930\":\"Module Serial Number\",\"otherParameterCrietrion7Controller930\":\"Serial no should be provided\",\"otherParameterS7Controller930\":\"\",\"otherParameterS7TestValue930\":false,\"otherParameterS7RemarksControllers930\":\"\",\"otherParameters8Controller930\":\"Framing Condition\",\"otherParameterCrietrion8Controller930\":\"N/A\",\"otherParameterS8Controller930\":\"\",\"otherParameterS8TestValue930\":false,\"otherParameterS8RemarksControllers930\":\"\",\"otherParameters9Controller930\":\"HIPOT\",\"otherParameterCrietrion9Controller930\":\"N/A\",\"otherParameterS9Controller930\":\"\",\"otherParameterS9TestValue930\":false,\"otherParameterS9RemarksControllers930\":\"\"}','{\"visualParametersController230\":\"Visual Parameters\",\"visualParameterCrietrion1Controller230\":\"Should be neat and clean\",\"visualParameterS1Controller230\":\"\",\"visualParameterS1TestValue230\":false,\"visualParameterS1RemarksControllers230\":\"\",\"visualParameterCrietrion2Controller230\":\"No breakage allowed\",\"visualParameterS2Controller230\":\"\",\"visualParameterS2TestValue230\":false,\"visualParameterS2RemarksControllers230\":\"\",\"visualParameterCrietrion3Controller230\":\"Packing Condition\",\"visualParameterS3Controller230\":\"\",\"visualParameterS3TestValue230\":false,\"visualParameterS3RemarksControllers230\":\"\",\"visualParameterCrietrion4Controller230\":\"Framing Condition\",\"visualParameterS4Controller230\":\"\",\"visualParameterS4TestValue230\":false,\"visualParameterS4RemarksControllers230\":\"\",\"moduleRatingParameters1Controller230\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller230\":\"\",\"moduleRatingParameterS1TestValue230\":false,\"moduleRatingParameterS1RemarksControllers230\":\"\",\"moduleRatingParameters2Controller230\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller230\":\"\",\"moduleRatingParameterS2TestValue230\":false,\"moduleRatingParameterS2RemarksControllers230\":\"\",\"otherParameters1Controller230\":\"QC Sticker\",\"otherParameterCrietrion1Controller230\":\"Should be oasted\",\"otherParameterS1Controller230\":\"\",\"otherParameterS1TestValue230\":false,\"otherParameterS1RemarksControllers230\":\"\",\"otherParameters2Controller230\":\"Module info Label\",\"otherParameterCrietrion2Controller230\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller230\":\"\",\"otherParameterS2TestValue230\":false,\"otherParameterS2RemarksControllers230\":\"\",\"otherParameters3Controller230\":\"RFID\",\"otherParameterCrietrion3Controller230\":\"Should be oasted\",\"otherParameterS3Controller230\":\"\",\"otherParameterS3TestValue230\":false,\"otherParameterS3RemarksControllers230\":\"\",\"otherParameters4Controller230\":\"Company Logo\",\"otherParameterCrietrion4Controller230\":\"Should be Pasted\",\"otherParameterS4Controller230\":\"\",\"otherParameterS4TestValue230\":false,\"otherParameterS4RemarksControllers230\":\"\",\"otherParameters5Controller230\":\"Junction Box\",\"otherParameterCrietrion5Controller230\":\"Should be Pasted\",\"otherParameterS5Controller230\":\"\",\"otherParameterS5TestValue230\":false,\"otherParameterS5RemarksControllers230\":\"\",\"otherParameters6Controller230\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller230\":\"Should be provided with JB\",\"otherParameterS6Controller230\":\"\",\"otherParameterS6TestValue230\":false,\"otherParameterS6RemarksControllers230\":\"\",\"otherParameters7Controller230\":\"Module Serial Number\",\"otherParameterCrietrion7Controller230\":\"Serial no should be provided\",\"otherParameterS7Controller230\":\"\",\"otherParameterS7TestValue230\":false,\"otherParameterS7RemarksControllers230\":\"\",\"otherParameters8Controller230\":\"Framing Condition\",\"otherParameterCrietrion8Controller230\":\"N/A\",\"otherParameterS8Controller230\":\"\",\"otherParameterS8TestValue230\":false,\"otherParameterS8RemarksControllers230\":\"\",\"otherParameters9Controller230\":\"HIPOT\",\"otherParameterCrietrion9Controller230\":\"N/A\",\"otherParameterS9Controller230\":\"\",\"otherParameterS9TestValue230\":false,\"otherParameterS9RemarksControllers230\":\"\"}','{\"visualParametersController645\":\"Visual Parameters\",\"visualParameterCrietrion1Controller645\":\"Should be neat and clean\",\"visualParameterS1Controller645\":\"\",\"visualParameterS1TestValue645\":false,\"visualParameterS1RemarksControllers645\":\"\",\"visualParameterCrietrion2Controller645\":\"No breakage allowed\",\"visualParameterS2Controller645\":\"\",\"visualParameterS2TestValue645\":false,\"visualParameterS2RemarksControllers645\":\"\",\"visualParameterCrietrion3Controller645\":\"Packing Condition\",\"visualParameterS3Controller645\":\"\",\"visualParameterS3TestValue645\":false,\"visualParameterS3RemarksControllers645\":\"\",\"visualParameterCrietrion4Controller645\":\"Framing Condition\",\"visualParameterS4Controller645\":\"\",\"visualParameterS4TestValue645\":false,\"visualParameterS4RemarksControllers645\":\"\",\"moduleRatingParameters1Controller645\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller645\":\"\",\"moduleRatingParameterS1TestValue645\":false,\"moduleRatingParameterS1RemarksControllers645\":\"\",\"moduleRatingParameters2Controller645\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller645\":\"\",\"moduleRatingParameterS2TestValue645\":false,\"moduleRatingParameterS2RemarksControllers645\":\"\",\"otherParameters1Controller645\":\"QC Sticker\",\"otherParameterCrietrion1Controller645\":\"Should be oasted\",\"otherParameterS1Controller645\":\"\",\"otherParameterS1TestValue645\":false,\"otherParameterS1RemarksControllers645\":\"\",\"otherParameters2Controller645\":\"Module info Label\",\"otherParameterCrietrion2Controller645\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller645\":\"\",\"otherParameterS2TestValue645\":false,\"otherParameterS2RemarksControllers645\":\"\",\"otherParameters3Controller645\":\"RFID\",\"otherParameterCrietrion3Controller645\":\"Should be oasted\",\"otherParameterS3Controller645\":\"\",\"otherParameterS3TestValue645\":false,\"otherParameterS3RemarksControllers645\":\"\",\"otherParameters4Controller645\":\"Company Logo\",\"otherParameterCrietrion4Controller645\":\"Should be Pasted\",\"otherParameterS4Controller645\":\"\",\"otherParameterS4TestValue645\":false,\"otherParameterS4RemarksControllers645\":\"\",\"otherParameters5Controller645\":\"Junction Box\",\"otherParameterCrietrion5Controller645\":\"Should be Pasted\",\"otherParameterS5Controller645\":\"\",\"otherParameterS5TestValue645\":false,\"otherParameterS5RemarksControllers645\":\"\",\"otherParameters6Controller645\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller645\":\"Should be provided with JB\",\"otherParameterS6Controller645\":\"\",\"otherParameterS6TestValue645\":false,\"otherParameterS6RemarksControllers645\":\"\",\"otherParameters7Controller645\":\"Module Serial Number\",\"otherParameterCrietrion7Controller645\":\"Serial no should be provided\",\"otherParameterS7Controller645\":\"\",\"otherParameterS7TestValue645\":false,\"otherParameterS7RemarksControllers645\":\"\",\"otherParameters8Controller645\":\"Framing Condition\",\"otherParameterCrietrion8Controller645\":\"N/A\",\"otherParameterS8Controller645\":\"\",\"otherParameterS8TestValue645\":false,\"otherParameterS8RemarksControllers645\":\"\",\"otherParameters9Controller645\":\"HIPOT\",\"otherParameterCrietrion9Controller645\":\"N/A\",\"otherParameterS9Controller645\":\"\",\"otherParameterS9TestValue645\":false,\"otherParameterS9RemarksControllers645\":\"\"}'),
('4228d618-f967-4c55-a354-3d5bb7a3f5b3','ce196e2f-a453-4b3e-ac76-439d6be24599','{\"visualParametersController930\":\"Visual Parameters\",\"visualParameterCrietrion1Controller930\":\"Should be neat and clean\",\"visualParameterS1Controller930\":\"rr\",\"visualParameterS1TestValue930\":true,\"visualParameterS1RemarksControllers930\":\"\",\"visualParameterCrietrion2Controller930\":\"No breakage allowed\",\"visualParameterS2Controller930\":\"vvvv\",\"visualParameterS2TestValue930\":true,\"visualParameterS2RemarksControllers930\":\"\",\"visualParameterCrietrion3Controller930\":\"Packing Condition\",\"visualParameterS3Controller930\":\"fff\",\"visualParameterS3TestValue930\":true,\"visualParameterS3RemarksControllers930\":\"\",\"visualParameterCrietrion4Controller930\":\"Framing Condition\",\"visualParameterS4Controller930\":\"ggg\",\"visualParameterS4TestValue930\":false,\"visualParameterS4RemarksControllers930\":\"cccc\",\"moduleRatingParameters1Controller930\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller930\":\"nnnn\",\"moduleRatingParameterS1TestValue930\":false,\"moduleRatingParameterS1RemarksControllers930\":\"ffr\",\"moduleRatingParameters2Controller930\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller930\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller930\":\"vvvv\",\"moduleRatingParameterS2TestValue930\":false,\"moduleRatingParameterS2RemarksControllers930\":\"fff\",\"otherParameters1Controller930\":\"QC Sticker\",\"otherParameterCrietrion1Controller930\":\"Should be oasted\",\"otherParameterS1Controller930\":\"ggg\",\"otherParameterS1TestValue930\":false,\"otherParameterS1RemarksControllers930\":\"ggg\",\"otherParameters2Controller930\":\"Module info Label\",\"otherParameterCrietrion2Controller930\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller930\":\"ggg\",\"otherParameterS2TestValue930\":false,\"otherParameterS2RemarksControllers930\":\"ggg\",\"otherParameters3Controller930\":\"RFID\",\"otherParameterCrietrion3Controller930\":\"Should be oasted\",\"otherParameterS3Controller930\":\"fff\",\"otherParameterS3TestValue930\":false,\"otherParameterS3RemarksControllers930\":\"gggg\",\"otherParameters4Controller930\":\"Company Logo\",\"otherParameterCrietrion4Controller930\":\"Should be Pasted\",\"otherParameterS4Controller930\":\"yyy\",\"otherParameterS4TestValue930\":false,\"otherParameterS4RemarksControllers930\":\"rrrr\",\"otherParameters5Controller930\":\"Junction Box\",\"otherParameterCrietrion5Controller930\":\"Should be Pasted\",\"otherParameterS5Controller930\":\"ddd\",\"otherParameterS5TestValue930\":false,\"otherParameterS5RemarksControllers930\":\"jjjj\",\"otherParameters6Controller930\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller930\":\"Should be provided with JB\",\"otherParameterS6Controller930\":\"kkkyy\",\"otherParameterS6TestValue930\":false,\"otherParameterS6RemarksControllers930\":\"ggg\",\"otherParameters7Controller930\":\"Module Serial Number\",\"otherParameterCrietrion7Controller930\":\"Serial no should be provided\",\"otherParameterS7Controller930\":\"rrr\",\"otherParameterS7TestValue930\":false,\"otherParameterS7RemarksControllers930\":\"ccc\",\"otherParameters8Controller930\":\"Framing Condition\",\"otherParameterCrietrion8Controller930\":\"N/A\",\"otherParameterS8Controller930\":\"hello\",\"otherParameterS8TestValue930\":false,\"otherParameterS8RemarksControllers930\":\"hhh\",\"otherParameters9Controller930\":\"HIPOT\",\"otherParameterCrietrion9Controller930\":\"N/A\",\"otherParameterS9Controller930\":\"ccc\",\"otherParameterS9TestValue930\":false,\"otherParameterS9RemarksControllers930\":\"ggg\"}','{\"visualParametersController230\":\"Visual Parameters\",\"visualParameterCrietrion1Controller230\":\"Should be neat and clean\",\"visualParameterS1Controller230\":\"B\",\"visualParameterS1TestValue230\":true,\"visualParameterS1RemarksControllers230\":\"\",\"visualParameterCrietrion2Controller230\":\"No breakage allowed\",\"visualParameterS2Controller230\":\"B\",\"visualParameterS2TestValue230\":false,\"visualParameterS2RemarksControllers230\":\"B\",\"visualParameterCrietrion3Controller230\":\"Packing Condition\",\"visualParameterS3Controller230\":\"ggg\",\"visualParameterS3TestValue230\":false,\"visualParameterS3RemarksControllers230\":\"gg\",\"visualParameterCrietrion4Controller230\":\"Framing Condition\",\"visualParameterS4Controller230\":\"fff\",\"visualParameterS4TestValue230\":false,\"visualParameterS4RemarksControllers230\":\"hhh\",\"moduleRatingParameters1Controller230\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller230\":\"gggg\",\"moduleRatingParameterS1TestValue230\":false,\"moduleRatingParameterS1RemarksControllers230\":\"ggg\",\"moduleRatingParameters2Controller230\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller230\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller230\":\"ggg\",\"moduleRatingParameterS2TestValue230\":false,\"moduleRatingParameterS2RemarksControllers230\":\"gg\",\"otherParameters1Controller230\":\"QC Sticker\",\"otherParameterCrietrion1Controller230\":\"Should be oasted\",\"otherParameterS1Controller230\":\"gg\",\"otherParameterS1TestValue230\":false,\"otherParameterS1RemarksControllers230\":\"gggg\",\"otherParameters2Controller230\":\"Module info Label\",\"otherParameterCrietrion2Controller230\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller230\":\"ggg\",\"otherParameterS2TestValue230\":false,\"otherParameterS2RemarksControllers230\":\"tt\",\"otherParameters3Controller230\":\"RFID\",\"otherParameterCrietrion3Controller230\":\"Should be oasted\",\"otherParameterS3Controller230\":\"hhh\",\"otherParameterS3TestValue230\":false,\"otherParameterS3RemarksControllers230\":\"hhh\",\"otherParameters4Controller230\":\"Company Logo\",\"otherParameterCrietrion4Controller230\":\"Should be Pasted\",\"otherParameterS4Controller230\":\"ggg\",\"otherParameterS4TestValue230\":false,\"otherParameterS4RemarksControllers230\":\"tt\",\"otherParameters5Controller230\":\"Junction Box\",\"otherParameterCrietrion5Controller230\":\"Should be Pasted\",\"otherParameterS5Controller230\":\"ggg\",\"otherParameterS5TestValue230\":false,\"otherParameterS5RemarksControllers230\":\" vvvvvv\",\"otherParameters6Controller230\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller230\":\"Should be provided with JB\",\"otherParameterS6Controller230\":\"hhh\",\"otherParameterS6TestValue230\":false,\"otherParameterS6RemarksControllers230\":\"uuu\",\"otherParameters7Controller230\":\"Module Serial Number\",\"otherParameterCrietrion7Controller230\":\"Serial no should be provided\",\"otherParameterS7Controller230\":\"yyy\",\"otherParameterS7TestValue230\":false,\"otherParameterS7RemarksControllers230\":\"ttt\",\"otherParameters8Controller230\":\"Framing Condition\",\"otherParameterCrietrion8Controller230\":\"N/A\",\"otherParameterS8Controller230\":\"ggg\",\"otherParameterS8TestValue230\":false,\"otherParameterS8RemarksControllers230\":\"Suraj\",\"otherParameters9Controller230\":\"HIPOT\",\"otherParameterCrietrion9Controller230\":\"N/A\",\"otherParameterS9Controller230\":\"eeee\",\"otherParameterS9TestValue230\":true,\"otherParameterS9RemarksControllers230\":\"\"}','{\"visualParametersController645\":\"Visual Parameters\",\"visualParameterCrietrion1Controller645\":\"Should be neat and clean\",\"visualParameterS1Controller645\":\"xxx\",\"visualParameterS1TestValue645\":true,\"visualParameterS1RemarksControllers645\":\"\",\"visualParameterCrietrion2Controller645\":\"No breakage allowed\",\"visualParameterS2Controller645\":\"yyy\",\"visualParameterS2TestValue645\":true,\"visualParameterS2RemarksControllers645\":\"\",\"visualParameterCrietrion3Controller645\":\"Packing Condition\",\"visualParameterS3Controller645\":\"Kkl\",\"visualParameterS3TestValue645\":false,\"visualParameterS3RemarksControllers645\":\"yuy\",\"visualParameterCrietrion4Controller645\":\"Framing Condition\",\"visualParameterS4Controller645\":\"yyy\",\"visualParameterS4TestValue645\":false,\"visualParameterS4RemarksControllers645\":\"yyy\",\"moduleRatingParameters1Controller645\":\"Module Wattage\",\"moduleRatingParameterCrietrion1Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS1Controller645\":\"yu\",\"moduleRatingParameterS1TestValue645\":false,\"moduleRatingParameterS1RemarksControllers645\":\"yyy\",\"moduleRatingParameters2Controller645\":\"Rated Voltage\",\"moduleRatingParameterCrietrion2Controller645\":\"Should be as per job no / Client\",\"moduleRatingParameterS2Controller645\":\"yyy\",\"moduleRatingParameterS2TestValue645\":false,\"moduleRatingParameterS2RemarksControllers645\":\"ttt\",\"otherParameters1Controller645\":\"QC Sticker\",\"otherParameterCrietrion1Controller645\":\"Should be oasted\",\"otherParameterS1Controller645\":\"yyy\",\"otherParameterS1TestValue645\":false,\"otherParameterS1RemarksControllers645\":\"yyy\",\"otherParameters2Controller645\":\"Module info Label\",\"otherParameterCrietrion2Controller645\":\"Should be as per job no / Test Result\",\"otherParameterS2Controller645\":\"ggg\",\"otherParameterS2TestValue645\":false,\"otherParameterS2RemarksControllers645\":\"ggg\",\"otherParameters3Controller645\":\"RFID\",\"otherParameterCrietrion3Controller645\":\"Should be oasted\",\"otherParameterS3Controller645\":\"hhh\",\"otherParameterS3TestValue645\":false,\"otherParameterS3RemarksControllers645\":\"gggg\",\"otherParameters4Controller645\":\"Company Logo\",\"otherParameterCrietrion4Controller645\":\"Should be Pasted\",\"otherParameterS4Controller645\":\"hhh\",\"otherParameterS4TestValue645\":false,\"otherParameterS4RemarksControllers645\":\"jjj\",\"otherParameters5Controller645\":\"Junction Box\",\"otherParameterCrietrion5Controller645\":\"Should be Pasted\",\"otherParameterS5Controller645\":\"jjj\",\"otherParameterS5TestValue645\":false,\"otherParameterS5RemarksControllers645\":\"hhhh\",\"otherParameters6Controller645\":\"Cable and MC4 Connector\",\"otherParameterCrietrion6Controller645\":\"Should be provided with JB\",\"otherParameterS6Controller645\":\"bbb\",\"otherParameterS6TestValue645\":false,\"otherParameterS6RemarksControllers645\":\"bbbb\",\"otherParameters7Controller645\":\"Module Serial Number\",\"otherParameterCrietrion7Controller645\":\"Serial no should be provided\",\"otherParameterS7Controller645\":\"bhh\",\"otherParameterS7TestValue645\":false,\"otherParameterS7RemarksControllers645\":\"hhhh\",\"otherParameters8Controller645\":\"Framing Condition\",\"otherParameterCrietrion8Controller645\":\"N/A\",\"otherParameterS8Controller645\":\"rrr\",\"otherParameterS8TestValue645\":false,\"otherParameterS8RemarksControllers645\":\"tyt\",\"otherParameters9Controller645\":\"HIPOT\",\"otherParameterCrietrion9Controller645\":\"N/A\",\"otherParameterS9Controller645\":\"hhh\",\"otherParameterS9TestValue645\":false,\"otherParameterS9RemarksControllers645\":\"yyy\"}');

/*Table structure for table `Framing` */

DROP TABLE IF EXISTS `Framing`;

CREATE TABLE `Framing` (
  `FramingId` varchar(255) DEFAULT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `Sample` varchar(55) DEFAULT NULL,
  `FramingObservation` longtext,
  `FramingDimension` longtext,
  `Stage` varchar(55) DEFAULT NULL,
  UNIQUE KEY `FramingId` (`FramingId`),
  KEY `PreLamDetailId` (`PreLamDetailId`),
  CONSTRAINT `Framing_ibfk_1` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Framing` */

insert  into `Framing`(`FramingId`,`PreLamDetailId`,`Sample`,`FramingObservation`,`FramingDimension`,`Stage`) values 
('236fa562-bb03-45fa-8b45-dcd95c9a755b','03e83a82-3dde-461b-b6e9-08d8cab861bb','1','323','{\"x1\":\"4\",\"x2\":\"43\",\"y1\":\"54\",\"y2\":\"656\",\"l1\":\"5\",\"l2\":\"454\",\"w1\":\"3\",\"w2\":\"3\"}','1'),
('5f24a84d-0f9e-4cfd-953c-f962ba625e98','03e83a82-3dde-461b-b6e9-08d8cab861bb','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','4'),
('9d7cf837-16f0-47e0-bbba-3042838330af','03e83a82-3dde-461b-b6e9-08d8cab861bb','','we','{\"x1\":\"67\",\"x2\":\"sa\",\"y1\":\"56\",\"y2\":\"78\",\"l1\":\"98\",\"l2\":\"78\",\"w1\":\"65\",\"w2\":\"54\"}','2'),
('77be944d-bd67-4b11-a1db-411107647ddc','03e83a82-3dde-461b-b6e9-08d8cab861bb','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','3'),
('0a37dc8f-d6b8-4d99-9ba3-10a342c3d4f7','03e83a82-3dde-461b-b6e9-08d8cab861bb','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','5'),
('a1d0a153-6bcd-4445-a6d8-3b033ebf13c6','3da33151-7a81-4419-8222-a3ca60af509f','1','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','1'),
('aa9b6aa3-2f54-4127-8a71-cc2cce567bb1','3da33151-7a81-4419-8222-a3ca60af509f','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','3'),
('9e987f68-695b-454d-a546-512d708260c7','3da33151-7a81-4419-8222-a3ca60af509f','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','5'),
('0b4dc35a-327b-4803-905f-1ea6b828abb6','3da33151-7a81-4419-8222-a3ca60af509f','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','2'),
('2ecada65-8a13-4f3c-b745-58466cb9118b','3da33151-7a81-4419-8222-a3ca60af509f','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','4'),
('effc3d97-3ba5-475a-9ba4-a25434d4cad9','868752ac-f2a5-4b0f-94a6-257d86a9439e','33','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','1'),
('dddf430d-68ce-4e9a-b4a8-a9fa8d0773d9','868752ac-f2a5-4b0f-94a6-257d86a9439e','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','2'),
('35650656-abb1-49bd-85b8-5af57b067270','868752ac-f2a5-4b0f-94a6-257d86a9439e','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','4'),
('29e0fbee-e45f-4cff-a7fd-ea4272f65cdd','868752ac-f2a5-4b0f-94a6-257d86a9439e','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','3'),
('a585b591-cbd6-4bac-8eed-100324614a95','868752ac-f2a5-4b0f-94a6-257d86a9439e','','','{\"x1\":\"\",\"x2\":\"\",\"y1\":\"\",\"y2\":\"\",\"l1\":\"\",\"l2\":\"\",\"w1\":\"\",\"w2\":\"\"}','5');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `IQCSolar` */

insert  into `IQCSolar`(`IQCSolarID`,`SolarDetailID`,`CheckType`,`Characterstics`,`MeasuringMethod`,`Sampling`,`Reference`,`AcceptanceCriteria`,`SampleSize`,`Samples`,`CreatedDate`,`UpdatedDate`) values 
('e2f0694a-2b9b-4025-873a-a1f359a7c36e','4603e44c-00f2-4b33-b208-5863eab326c8','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','2','[{\"SampleBarcode\":\"56764321dd345\",\"SampleTest\":true,\"SampleRemarks\":\"broken\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"}]','03-04-2024 09:24:50',''),
('682400a8-fba5-4ac1-9a4b-0ce2ed33a3ce','4603e44c-00f2-4b33-b208-5863eab326c8','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','1','[{\"SampleBarcode\":\"56764321dd345\",\"SampleTest\":true,\"SampleRemarks\":\"broken\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"}]','03-04-2024 09:24:51',''),
('350d3e98-1ae1-4f66-ae8d-325edb65286f','4603e44c-00f2-4b33-b208-5863eab326c8','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','2','[{\"SampleBarcode\":\"56764321dd345\",\"SampleTest\":true,\"SampleRemarks\":\"broken\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"}]','03-04-2024 09:24:51',''),
('c47e1905-088d-4bc9-b39c-e9775268c6bc','4603e44c-00f2-4b33-b208-5863eab326c8','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[{\"SampleBarcode\":\"56764321dd345\",\"SampleTest\":true,\"SampleRemarks\":\"broken\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"}]','03-04-2024 09:24:51',''),
('6b145161-68f4-48ec-8962-f48f0237bf68','4603e44c-00f2-4b33-b208-5863eab326c8','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','1','[{\"SampleBarcode\":\"56764321dd345\",\"SampleTest\":true,\"SampleRemarks\":\"broken\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"}]','03-04-2024 09:24:51',''),
('de2b6d5e-295b-4b2c-a5d8-4c5dc67a6446','4603e44c-00f2-4b33-b208-5863eab326c8','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[{\"SampleBarcode\":\"56764321dd345\",\"SampleTest\":true,\"SampleRemarks\":\"broken\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"}]','03-04-2024 09:24:52',''),
('65e10de9-692c-40ce-be24-4684118454cf','4603e44c-00f2-4b33-b208-5863eab326c8','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[{\"SampleBarcode\":\"56764321dd345\",\"SampleTest\":true,\"SampleRemarks\":\"broken\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"},{\"SampleBarcode\":\"567643212345\",\"SampleTest\":false,\"SampleRemarks\":\"gggg\"}]','03-04-2024 09:24:52',''),
('4d2244b0-0cb4-4842-879c-7c85669f603a','75e61f5a-95b1-4683-b340-c217bee8533a','Packaging','Packing (Make Type)','','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"gg\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','03-04-2024 09:10:42',''),
('73b740e3-e31e-4758-95ad-2907f614cf7c','75e61f5a-95b1-4683-b340-c217bee8533a','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','3','[{\"VisualSampleBarcode1\":\"yy\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"ee\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"},{\"VisualSampleBarcode3\":\"ee\",\"VisualSampleTest3\":true,\"VisualSampleRemarks3\":\"\"}]','03-04-2024 09:10:43',''),
('ca04ef64-80e0-4a30-a034-72fd95cddbee','75e61f5a-95b1-4683-b340-c217bee8533a','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','1','[{\"PhysicalSampleBarcode1\":\"uu\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"}]','03-04-2024 09:10:43',''),
('b86340e5-f49f-4fcd-92ef-cce4155dadb9','75e61f5a-95b1-4683-b340-c217bee8533a','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','1','[{\"FrontbusSampleBarcode1\":\"ss\",\"FrontbusSampleTest1\":false,\"FrontbusSampleRemarks1\":\"jj\"}]','03-04-2024 09:10:43',''),
('9c4b8003-2629-4cf9-a1dc-375eedc9b32a','75e61f5a-95b1-4683-b340-c217bee8533a','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','1','[{\"VerificationSampleBarcode1\":\"uyh\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"}]','03-04-2024 09:10:43',''),
('6cf4211d-f999-4fd5-8a06-ca8eb395de48','75e61f5a-95b1-4683-b340-c217bee8533a','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','1','[{\"ElectricalSampleBarcode1\":\"rr\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','03-04-2024 09:10:44',''),
('a170b3f2-5cb3-4387-bbd8-1ea9c36cd4a3','94c65a75-caa7-4d7c-aea9-eec2bd471f27','Packaging','Packing (Make Type)','','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[]','03-04-2024 10:09:10',''),
('500204ab-1d2e-4e77-9aa3-8108aa77b8f9','94c65a75-caa7-4d7c-aea9-eec2bd471f27','Visual','Scratch, Bubble, Rainbow, Warpage, Edge, Chipping, Corner, Cutting, Bow.','Verner Calliper/Measuring Scale','SIL S1 AQL 10','As Per GSPL Specification','GSPL Technical Specification','0','[]','03-04-2024 10:09:11',''),
('f9a98a54-c4c9-4b09-9db2-f95659465b85','94c65a75-caa7-4d7c-aea9-eec2bd471f27','Physical','Dimension(L X W X T)','Measuring Tape','SIL S1 AQL 10','Data Sheet/GSPL Specification','As Per Data Sheet/COC','0','[]','03-04-2024 10:09:11',''),
('f4d359a6-67d7-405b-9bdc-f6bd7f7de6d9','94c65a75-caa7-4d7c-aea9-eec2bd471f27','FrontBus','Fragmentation Test','Fragmentation Tool','1 Glass Per Lot','Data sheet/GSPL Specification','>40 pcs per 25cm2 area','0','[]','03-04-2024 10:09:11',''),
('04f6c23e-31a1-4b2b-b322-06f679d83e80','94c65a75-caa7-4d7c-aea9-eec2bd471f27','Verification','Light Transmitance','As per Materal Data sheet','As per Materal Data sheet','As per COC','>91.5%','0','[]','03-04-2024 10:09:12',''),
('ce2224e8-c9f5-4742-bf42-47b950900b59','94c65a75-caa7-4d7c-aea9-eec2bd471f27','Electrical','Impact Resistance Test','227 gram steel ball from 1','1 Glass per lot','As per COC','GSPL Technical Specification/CO','0','[]','03-04-2024 10:09:12',''),
('6dd7cf37-2040-4116-b864-0a69545dcdbe','9238f0e2-d704-4732-b6bb-de1f6892c960','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[]','05-04-2024 12:29:39',''),
('f796cc6e-4e18-4275-a254-bb83551e5ceb','9238f0e2-d704-4732-b6bb-de1f6892c960','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','1','[]','05-04-2024 12:29:39',''),
('e306f592-278d-4453-92c6-82aaea7fa180','9238f0e2-d704-4732-b6bb-de1f6892c960','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','','[]','05-04-2024 12:29:39',''),
('c02c15aa-f4e3-4297-b55c-0f7de9925dc5','9238f0e2-d704-4732-b6bb-de1f6892c960','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[]','05-04-2024 12:29:39',''),
('324a871e-e068-47dc-a9a6-1977100ef88e','9238f0e2-d704-4732-b6bb-de1f6892c960','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','','[]','05-04-2024 12:29:39',''),
('648a290d-446f-4004-b013-818bf7f0a373','9238f0e2-d704-4732-b6bb-de1f6892c960','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[]','05-04-2024 12:29:40',''),
('6f01bcba-1028-444d-b565-0da472249ec7','9238f0e2-d704-4732-b6bb-de1f6892c960','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[]','05-04-2024 12:29:40',''),
('4dad085f-c981-4580-83d1-ec8650dc5bd3','12df2281-e7e6-4751-b230-fb427b5ffc1a','Packaging','Packing (Make Type Expiry date)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice Before expiry Date','2','[{\"PackageSampleBarcode1\":\"567643212345\",\"PackageSampleTest1\":false,\"PackageSampleRemarks1\":\"gggg\"},{\"PackageSampleBarcode2\":\"7777777777\",\"PackageSampleTest2\":true,\"PackageSampleRemarks2\":\"\"}]','09-04-2024 09:57:01',''),
('524aa766-00c5-45ff-af0f-fa11047e8379','12df2281-e7e6-4751-b230-fb427b5ffc1a','Visual','Dimension(W X T)/Cut/Crease/Spots/Color','Verner Calliper/Measuring Scale','SIL S1 AQL 1.5','As Per Data Sheet/COC','Within tolerance of + 5 mm','2','[{\"VisualSampleBarcode1\":\"seeee\",\"VisualSampleTest1\":false,\"VisualSampleRemarks1\":\"gkkk\"},{\"VisualSampleBarcode2\":\"57890876543211\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"}]','09-04-2024 09:57:01',''),
('8b66a558-0223-41ad-8760-84f65d5e5a27','12df2281-e7e6-4751-b230-fb427b5ffc1a','Physical','Get Content Test','Get Content Setup','One Sample Per Lot','GSPL Technical Specification','>75% to 95%','1','[{\"PhysicalSampleBarcode1\":\"eee\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"}]','09-04-2024 09:57:01',''),
('81fe0d8f-9ae0-4c1a-b156-23e84a621a83','12df2281-e7e6-4751-b230-fb427b5ffc1a','FrontBus','Adhesion to Glass Backsheet','Peel Tester','One Sample Per Lot','GSPL Technical Specification','EVA/GLASS: 70N/Cm, EVA/BS: 70N/Cm','1','[{\"FrontbusSampleBarcode1\":\"3345678\",\"FrontbusSampleTest1\":false,\"FrontbusSampleRemarks1\":\"hhh\"}]','09-04-2024 09:57:02',''),
('1b958912-0999-4c7b-86fc-e90cf7bb2093','12df2281-e7e6-4751-b230-fb427b5ffc1a','Verification','Volume Resistivity','N/A','N/A','As Per Data Sheet/COC','As per COC/GSPL Specification','2','[{\"VerificationSampleBarcode1\":\"66778888\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"0097866666666\",\"VerificationSampleTest2\":false,\"VerificationSampleRemarks2\":\"ggggggg\"}]','09-04-2024 09:57:02',''),
('8be3dd4a-f3c4-4eea-ad91-8eb01296144a','369a0e54-c4ec-44cd-8f7c-171496d49e37','Packaging','Packing (Make Type Expiry date)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice Before expiry Date','2','[{\"PackageSampleBarcode1\":\"erty\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"},{\"PackageSampleBarcode2\":\"012458957430\",\"PackageSampleTest2\":true,\"PackageSampleRemarks2\":\"\"}]','09-04-2024 12:37:01',''),
('1a7ca474-b16a-4106-b054-136af7e0760d','369a0e54-c4ec-44cd-8f7c-171496d49e37','Visual','Dimension(W X T)/Cut/Crease/Spots/Color','Verner Calliper/Measuring Scale','SIL S1 AQL 1.5','As Per Data Sheet/COC','Within tolerance of + 5 mm','1','[{\"VisualSampleBarcode1\":\"r\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"}]','09-04-2024 12:37:01',''),
('1b1450c6-6f82-4896-969f-2c191192e740','369a0e54-c4ec-44cd-8f7c-171496d49e37','Physical','Get Content Test','Get Content Setup','One Sample Per Lot','GSPL Technical Specification','>75% to 95%','1','[{\"PhysicalSampleBarcode1\":\"trut\",\"PhysicalSampleTest1\":false,\"PhysicalSampleRemarks1\":\"tr\"}]','09-04-2024 12:37:01',''),
('a94d4968-2738-4071-8d46-59aba36b8958','369a0e54-c4ec-44cd-8f7c-171496d49e37','FrontBus','Adhesion to Glass Backsheet','Peel Tester','One Sample Per Lot','GSPL Technical Specification','EVA/GLASS: 70N/Cm, EVA/BS: 70N/Cm','1','[{\"FrontbusSampleBarcode1\":\"gggg\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"}]','09-04-2024 12:37:01',''),
('5ff90dec-e49a-4b43-89b6-50aed81bda33','369a0e54-c4ec-44cd-8f7c-171496d49e37','Verification','Volume Resistivity','N/A','N/A','As Per Data Sheet/COC','As per COC/GSPL Specification','3','[{\"VerificationSampleBarcode1\":\"13246785\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"4337185143489\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"05012345678900\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"}]','09-04-2024 12:37:02',''),
('5298b263-1828-4f0f-9bca-400ac4d7a1d6','e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','Packaging','Packing (Make Type Expiry date)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice Before expiry Date','1','[{\"PackageSampleBarcode1\":\"y\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','10-04-2024 03:08:36',''),
('83523236-a864-44fc-84ac-a6909c9cb281','e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','Visual','Dimension(W X T)/Cut/Crease/Spots/Color','Verner Calliper/Measuring Scale','SIL S1 AQL 1.5','As Per Data Sheet/COC','Within tolerance of + 5 mm','1','[{\"VisualSampleBarcode1\":\"yu\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"}]','10-04-2024 03:08:36',''),
('cd041c2f-bf7a-4b57-b983-bee08ade4931','e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','Physical','Get Content Test','Get Content Setup','One Sample Per Lot','GSPL Technical Specification','>75% to 95%','1','[{\"PhysicalSampleBarcode1\":\"rd\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"}]','10-04-2024 03:08:36',''),
('2e566de2-0f7d-481c-b8b0-15768c070091','e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','FrontBus','Adhesion to Glass Backsheet','Peel Tester','One Sample Per Lot','GSPL Technical Specification','EVA/GLASS: 70N/Cm, EVA/BS: 70N/Cm','1','[{\"FrontbusSampleBarcode1\":\"bb\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"}]','10-04-2024 03:08:36',''),
('e3eeabc8-8c8f-4029-8020-fc048314fdb7','e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','Verification','Volume Resistivity','N/A','N/A','As Per Data Sheet/COC','As per COC/GSPL Specification','1','[{\"VerificationSampleBarcode1\":\"w\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"}]','10-04-2024 03:08:37',''),
('1f101b40-3ec2-4960-8fb0-a1b15fd20646','eed25293-708c-4db3-baa3-dfb701758ca5','Packaging','Packing (Make Type)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"yyuu\",\"PackageSampleTest1\":false,\"PackageSampleRemarks1\":\"op\"}]','10-04-2024 09:52:02',''),
('2824e4a9-4a76-4480-9cf3-d9b4588b60e9','eed25293-708c-4db3-baa3-dfb701758ca5','Visual','Width X Thickness','Verner Calliper/Measuring Scale','SIL S3 AQL 4.0','COC','Data sheet/IQC Ribbon','2','[{\"VisualSampleBarcode1\":\"rtyuiop\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"ggggggg\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"}]','10-04-2024 09:52:02',''),
('7148e728-6df7-4c4f-8fcd-8c80da5860bb','eed25293-708c-4db3-baa3-dfb701758ca5','Physical','Coating Thickness','N/A','As Per Material Data sheet','COC','Coating Thickness > 20-25 Microns','2','[{\"PhysicalSampleBarcode1\":\"tyy\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"},{\"PhysicalSampleBarcode2\":\"jkklllgfdsa\",\"PhysicalSampleTest2\":false,\"PhysicalSampleRemarks2\":\"gytrewq\"}]','10-04-2024 09:52:02',''),
('327c8811-2f0a-4c20-9d55-f968bcfcbc87','eed25293-708c-4db3-baa3-dfb701758ca5','FrontBus','Soldering Peel Test','Digital Force Gauge','One Sample Per Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 3N Cell Back Side','1','[{\"FrontbusSampleBarcode1\":\"vccxxzz\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"}]','10-04-2024 09:52:02',''),
('85f923d0-1082-4429-8ef9-250a1d619efa','eed25293-708c-4db3-baa3-dfb701758ca5','Verification','Tensile Strength','N/A','N/A','As Per COC','GSPL Technical Specification/COC','2','[{\"VerificationSampleBarcode1\":\"gllkk\",\"VerificationSampleTest1\":false,\"VerificationSampleRemarks1\":\"ttiioo\"},{\"VerificationSampleBarcode2\":\"uupp\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"}]','10-04-2024 09:52:03',''),
('4697904e-0f41-45b9-820a-e002a6b71a1f','eed25293-708c-4db3-baa3-dfb701758ca5','Electrical','Yield Strength','N/A','N/A','As Per COC','GSPL Technical Specification/COC','2','[{\"ElectricalSampleBarcode1\":\"qqqq\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"},{\"ElectricalSampleBarcode2\":\"eeeee\",\"ElectricalSampleTest2\":true,\"ElectricalSampleRemarks2\":\"\"}]','10-04-2024 09:52:03',''),
('ea87828c-e329-4509-92f5-203b3d251b58','eed25293-708c-4db3-baa3-dfb701758ca5','Performance','Resistivity','N/A','N/A','As Per COC','GSPL Technical Specification/COC','1','[{\"PerformanceSampleBarcode1\":\"ggggg\",\"PerformanceSampleTest1\":true,\"PerformanceSampleRemarks1\":\"\"}]','10-04-2024 09:52:03',''),
('aa18a2f7-2751-4c30-8e51-93dfe19b69ce','acc13729-2b42-4665-a91a-78574bb6ed91','Packaging','Packing (Make Type Expiry date)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice Before expiry Date','1','[{\"PackageSampleBarcode1\":\"350092238259470\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','18-04-2024 12:06:27',''),
('d221e8e1-e41e-4d37-aa44-677aa9bb93a2','acc13729-2b42-4665-a91a-78574bb6ed91','Visual','Dimension(W X T)/Cut/Crease/Spots/Color','Verner Calliper/Measuring Scale','SIL S1 AQL 1.5','As Per Data Sheet/COC','Within tolerance of + 5 mm','6666000000','[]','18-04-2024 12:06:27',''),
('f34281b5-af83-48d2-8e46-d2ad39b449dd','acc13729-2b42-4665-a91a-78574bb6ed91','Physical','Get Content Test','Get Content Setup','One Sample Per Lot','GSPL Technical Specification','>75% to 95%','0','[]','18-04-2024 12:06:27',''),
('782b485e-8211-4a82-9c08-476ca079676a','acc13729-2b42-4665-a91a-78574bb6ed91','FrontBus','Adhesion to Glass Backsheet','Peel Tester','One Sample Per Lot','GSPL Technical Specification','EVA/GLASS: 70N/Cm, EVA/BS: 70N/Cm','0','[]','18-04-2024 12:06:27',''),
('566800e5-0a4a-4bde-878b-618666d54858','acc13729-2b42-4665-a91a-78574bb6ed91','Verification','Volume Resistivity','N/A','N/A','As Per Data Sheet/COC','As per COC/GSPL Specification','0','[]','18-04-2024 12:06:28',''),
('f91dc20e-513a-47d7-8cb1-f5e0d6be0463','3293417d-70e1-4964-90b0-0882624e017d','Packaging','Packing (Make Type, Model)','N/A','Whole Lot','As Per PO/Invoice','No Physical Damage / No Mismatch against PO/Invoice','2','[{\"PackageSampleBarcode1\":\"trrrr\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"},{\"PackageSampleBarcode2\":\"ghjk\",\"PackageSampleTest2\":false,\"PackageSampleRemarks2\":\"bnmnb\"}]','11-04-2024 09:19:02',''),
('f0ed41df-000b-4a6c-8169-05f1ac3f5592','3293417d-70e1-4964-90b0-0882624e017d','Visual','L X W X H Cable Length','Verner Calliper/Measuring Scale','SIL S3 AQL 1.5','Supplier COC','Supplier COC','2','[{\"VisualSampleBarcode1\":\"hhh\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"uiioopp\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"}]','11-04-2024 09:19:02',''),
('e2024491-3324-430b-adfa-4092da605b69','3293417d-70e1-4964-90b0-0882624e017d','Physical','Diode Power','Digital Multimeter','SIL S3 AQL 1.5','Supplier COC','Supplier COC','1','[{\"PhysicalSampleBarcode1\":\"tyy\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"}]','11-04-2024 09:19:02',''),
('51394a85-5ac4-45ea-8332-78cdebbef68d','3293417d-70e1-4964-90b0-0882624e017d','FrontBus','Connecter Size and Type Gland Tightness. No of Diodes, Diode Rating','Verner Calliper/Measuring Scale','SIL S3 AQL 1.5','Supplier COC','Supplier COC','1','[{\"FrontbusSampleBarcode1\":\"yuiop\",\"FrontbusSampleTest1\":false,\"FrontbusSampleRemarks1\":\"rrrr\"}]','11-04-2024 09:19:02',''),
('bf60d4e7-45bc-478b-b521-58b60302827f','3293417d-70e1-4964-90b0-0882624e017d','Verification','Rated Voltage','N/A','N/A','Supplier COC','>/1500VDC','2','[{\"VerificationSampleBarcode1\":\"gg\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"jjj\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"}]','11-04-2024 09:19:03',''),
('b9668c8b-c4a5-4ec5-95a1-b3376cec8d19','3293417d-70e1-4964-90b0-0882624e017d','Electrical','Rated Current','N/A','N/A','Supplier COC','>/25 A For M10','1','[{\"ElectricalSampleBarcode1\":\"rree\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','11-04-2024 09:19:03',''),
('f50f3ed2-8593-441e-8003-7cc75bb659a0','561fc21b-802a-41f9-b77c-314fe3e35789','Packaging','Packing (Make Type)','N/A','Whole Lot','As Per PO/Invoice(Approved Drawing)','No Physical Damage','2','[{\"PackageSampleBarcode1\":\"rrrrrr\",\"PackageSampleTest1\":false,\"PackageSampleRemarks1\":\"jjjj\"},{\"PackageSampleBarcode2\":\"hhhhh\",\"PackageSampleTest2\":true,\"PackageSampleRemarks2\":\"\"}]','12-04-2024 11:13:38',''),
('534faba2-763e-4ef4-8ac7-aa8e0f555f03','561fc21b-802a-41f9-b77c-314fe3e35789','Visual','Dent, Anodizing Marks, Scratches, Bend De Marks, Patches, Delemination Transpotation Damage','N/A','SIL S1 AQL 2.5','As Per PO/Invoice(Approved Drawing)','COC','1','[{\"VisualSampleBarcode1\":\"tt\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"}]','12-04-2024 11:13:38',''),
('595fdfc7-0057-4056-a92a-6c29c8cbb9a5','561fc21b-802a-41f9-b77c-314fe3e35789','Physical','Weight Per Meter, Composition','Measuring Tape, Weighing Scale','SIL S1 AQL 2.5','As Per PO/Invoice(Approved Drawing)','COC','2','[{\"PhysicalSampleBarcode1\":\"ggg\",\"PhysicalSampleTest1\":false,\"PhysicalSampleRemarks1\":\"nnn\"},{\"PhysicalSampleBarcode2\":\"gjjk\",\"PhysicalSampleTest2\":true,\"PhysicalSampleRemarks2\":\"\"}]','12-04-2024 11:13:38',''),
('17918663-ff7c-414d-a3e6-d46446a11012','561fc21b-802a-41f9-b77c-314fe3e35789','FrontBus','Physical Dimensions L X W Mounting Hole x Pitch Mounting Hole Y Pitch','Verner Calliper/Measuring Scale','SIL S1 AQL 2.5','As Per Approved Drawing','COC','1','[{\"FrontbusSampleBarcode1\":\"gfdsa\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"}]','12-04-2024 11:13:38',''),
('4fe3e301-21a1-498b-b657-6048e65c05be','561fc21b-802a-41f9-b77c-314fe3e35789','Verification','Anodizing Thickness','Anodizing Meter','SIL S1 AQL 2.5','Supplier Material Data Sheet','Anodizing Thickness >/ 15 microns','1','[{\"VerificationSampleBarcode1\":\"fgh\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"}]','12-04-2024 11:13:39',''),
('7e264aac-a135-408e-ac0c-e4ffccfe312d','561fc21b-802a-41f9-b77c-314fe3e35789','Electrical','Frame Material','N/A','N/A','Supplier COC','GSPL Specification/COC','1','[{\"ElectricalSampleBarcode1\":\"hh\",\"ElectricalSampleTest1\":true,\"ElectricalSampleRemarks1\":\"\"}]','12-04-2024 11:13:39',''),
('d2f54b3e-4c30-4272-b889-e6fce6b7f135','60597056-5cf4-4377-97bd-c0d62a138730','Packaging','Packaging, Make, Model','N/A','Whole Lot','Transport Condition/PO/Invoice','Physical damage should not be there/No Mismatch in invoice','1','[{\"PackageSampleBarcode1\":\"ghh\",\"PackageSampleTest1\":false,\"PackageSampleRemarks1\":\"ngg\"}]','13-04-2024 11:49:21',''),
('1fc7d0c7-23e1-44f7-b58a-31906a70340d','60597056-5cf4-4377-97bd-c0d62a138730','Visual','Expiry Date','Visual','Whole Lot','Packing Box / COC','Date of Expiry should be 3 months at the of receiving','2','[{\"VisualSampleBarcode1\":\"ffff\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"},{\"VisualSampleBarcode2\":\"jjjj\",\"VisualSampleTest2\":false,\"VisualSampleRemarks2\":\"nnn\"}]','13-04-2024 11:49:21',''),
('fd574b4d-e1a6-448e-b282-6757908b10a3','60597056-5cf4-4377-97bd-c0d62a138730','Physical','Specific Gravity','As per COC','N/A','As per GSPL Technical Specification / COC','As Per GSPL Technical Specification','1','[{\"PhysicalSampleBarcode1\":\"ffff\",\"PhysicalSampleTest1\":true,\"PhysicalSampleRemarks1\":\"\"}]','13-04-2024 11:49:22',''),
('5f2ce050-7043-477c-a0e9-a8f59fe6a5df','60597056-5cf4-4377-97bd-c0d62a138730','FrontBus','Acid Number','As per COC','N/A','As Per GSPL Technical Specification / COC','As per GSPL Technical Specification','2','[{\"FrontbusSampleBarcode1\":\"tt\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"},{\"FrontbusSampleBarcode2\":\"bbb\",\"FrontbusSampleTest2\":false,\"FrontbusSampleRemarks2\":\"ffd\"}]','13-04-2024 11:49:22',''),
('4406086b-6d5a-4f59-93f1-445d35837efb','60597056-5cf4-4377-97bd-c0d62a138730','Verification','Solid Content','As per COC','N/A','As Per GSPL Technical Specification / COC','As per GSPL Technical Specification','1','[{\"VerificationSampleBarcode1\":\"ggk\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"}]','13-04-2024 11:49:22',''),
('3585dec5-ed23-4a28-8484-330b32b8ac06','3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','Packaging','Packing (Make Type Expiry date)','N/A','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice Before expiry Date','2','[{\"PackageSampleBarcode1\":\"gg\",\"PackageSampleTest1\":false,\"PackageSampleRemarks1\":\"kjl\"},{\"PackageSampleBarcode2\":\"gggdd\",\"PackageSampleTest2\":true,\"PackageSampleRemarks2\":\"\"}]','15-04-2024 10:23:47',''),
('8098a6f2-31c2-49a7-839e-d4a17dd54d1a','3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','Visual','Dimension(W X T)/Cut/Crease/Spots/Color','Verner Calliper/Measuring Scale','SIL S1 AQL 4.0','As Per Data Sheet/COC','Within tolerance of + 5 mm','1','[{\"VisualSampleBarcode1\":\"rty\",\"VisualSampleTest1\":true,\"VisualSampleRemarks1\":\"\"}]','15-04-2024 10:23:47',''),
('1ddfa38d-c0ca-4d83-a63c-b11487785c8c','3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','Physical','Adhesion to EVA','Peel Tester','One Sample Per Lot','GSPL Technical Specification','EVA/BS 70 N/10 mm','1','[{\"PhysicalSampleBarcode1\":\"fjlbb\",\"PhysicalSampleTest1\":false,\"PhysicalSampleRemarks1\":\"hbnm\"}]','15-04-2024 10:23:48',''),
('5843c49e-fe8b-4230-bbcf-15de6e8a5d98','3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','FrontBus','Breakdown Voltage','N/A','N/A','Supplier COC/CDF/Test Report','As Per COC / GSPL Technical Specification','2','[{\"FrontbusSampleBarcode1\":\"gf\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"},{\"FrontbusSampleBarcode2\":\"tghk\",\"FrontbusSampleTest2\":true,\"FrontbusSampleRemarks2\":\"\"}]','15-04-2024 10:23:48',''),
('e5ce356e-812f-4920-b122-82f8e4d90c5b','3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','Verification','Partial Discharge','N/A','N/A','Supplier COC/CDF/Test Report','>/ 1500VDC','1','[{\"VerificationSampleBarcode1\":\"gfdsa\",\"VerificationSampleTest1\":false,\"VerificationSampleRemarks1\":\"nn\"}]','15-04-2024 10:23:48',''),
('5e51be7b-14bf-4f6b-bf50-e2c037b4cc44','238524c3-1a23-411f-8453-e8e5e1363ee1','Packaging','Packing (Make Type Expiry date)','N/A','Whole Lot','As Per PO','No Physical Damage','2','[{\"PackageSampleBarcode1\":\"eeee\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"},{\"PackageSampleBarcode2\":\"hbbb\",\"PackageSampleTest2\":false,\"PackageSampleRemarks2\":\"jjj\"}]','16-04-2024 07:19:26',''),
('a12b8629-683f-4f9f-a41d-b3d89ade5d32','238524c3-1a23-411f-8453-e8e5e1363ee1','Visual','Curring time','Watch','SIL S3 AQL 0.40','Data Sheet','>24 hrs','2','[{\"VisualSampleBarcode1\":\"ghj\",\"VisualSampleTest1\":false,\"VisualSampleRemarks1\":\"mkl\"},{\"VisualSampleBarcode2\":\"fdsa\",\"VisualSampleTest2\":true,\"VisualSampleRemarks2\":\"\"}]','16-04-2024 07:19:26',''),
('3de7baac-e81f-4b26-83d8-355cfd7e034e','238524c3-1a23-411f-8453-e8e5e1363ee1','Physical','Adhesion with J-box','Peel Tester','One Sample Per Lot','Data Sheet','>45N','1','[{\"PhysicalSampleBarcode1\":\"fff\",\"PhysicalSampleTest1\":false,\"PhysicalSampleRemarks1\":\"iii\"}]','16-04-2024 07:19:26',''),
('1cae1d78-c571-4695-b271-fbb28611144f','238524c3-1a23-411f-8453-e8e5e1363ee1','FrontBus','Adhesion with AI-box','Peel Tester','One Sample Per Lot','Data Sheet','>20N','1','[{\"FrontbusSampleBarcode1\":\"yyyyy\",\"FrontbusSampleTest1\":true,\"FrontbusSampleRemarks1\":\"\"}]','16-04-2024 07:19:27',''),
('b7376cb6-5bbd-4064-9cb6-6af14e39c6b2','238524c3-1a23-411f-8453-e8e5e1363ee1','Verification','Leakage & Damage','N/A','SIL S3 AQL 0.40','N/A','No Physical Damage','3','[{\"VerificationSampleBarcode1\":\"kky\",\"VerificationSampleTest1\":true,\"VerificationSampleRemarks1\":\"\"},{\"VerificationSampleBarcode2\":\"ggg\",\"VerificationSampleTest2\":true,\"VerificationSampleRemarks2\":\"\"},{\"VerificationSampleBarcode3\":\"ggg\",\"VerificationSampleTest3\":true,\"VerificationSampleRemarks3\":\"\"}]','16-04-2024 07:19:27',''),
('63e3b206-3e61-453c-9e87-de7775c2dfa2','238524c3-1a23-411f-8453-e8e5e1363ee1','Electrical','Trach Free Time','As Per COC','N/A','As Per COC','Supplier COC / GSPL WI','1','[{\"ElectricalSampleBarcode1\":\"ttrr\",\"ElectricalSampleTest1\":false,\"ElectricalSampleRemarks1\":\"bbb\"}]','16-04-2024 07:19:27',''),
('a71297b0-1580-45ec-b6be-a14b3a6f2922','238524c3-1a23-411f-8453-e8e5e1363ee1','Performance','Breakdown Voltage','As Per COC','N/A','As Per COC','Supplier COC / GSPL WI','2','[{\"PerformanceSampleBarcode1\":\"gggg\",\"PerformanceSampleTest1\":false,\"PerformanceSampleRemarks1\":\"jjj\"},{\"PerformanceSampleBarcode2\":\"yyy\",\"PerformanceSampleTest2\":false,\"PerformanceSampleRemarks2\":\"rrr\"}]','16-04-2024 07:19:27',''),
('b3d42c73-a34b-4696-aaba-d8fd1956a2f2','238524c3-1a23-411f-8453-e8e5e1363ee1','Sealant','Volumer Resistivity','As Per COC','N/A','As Per COC','Supplier COC / GSPL WI','2','[{\"SealantSampleBarcode1\":\"bbbb\",\"SealantSampleTest1\":false,\"SealantSampleRemarks1\":\"ccc\"},{\"SealantSampleBarcode2\":\"kkk\",\"SealantSampleTest2\":false,\"SealantSampleRemarks2\":\"ppp\"}]','16-04-2024 07:19:28',''),
('95c43ba0-2a25-48b6-baa3-ca8f182aec34','289ca892-6b67-4ef4-b822-17e12a4ba808','Packaging','Visual Parameters','Should be neat and clean','','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice Before expiry Date','1','[]','17-04-2024 08:42:56',''),
('fc7a53f8-eec6-4e9f-8265-81c91020ba0b','289ca892-6b67-4ef4-b822-17e12a4ba808','Visual','Dimension(W X T)/Cut/Crease/Spots/Color','Verner Calliper/Measuring Scale','SIL S1 AQL 4.0','As Per Data Sheet/COC','Within tolerance of + 5 mm','0','[]','17-04-2024 08:42:56',''),
('3624b2bc-7b11-42b6-814c-c8e0c812b3f9','289ca892-6b67-4ef4-b822-17e12a4ba808','Physical','Adhesion to EVA','Peel Tester','One Sample Per Lot','GSPL Technical Specification','EVA/BS 70 N/10 mm','0','[]','17-04-2024 08:42:57',''),
('5702b3f6-911e-4215-9837-e9dcdfd8ea72','289ca892-6b67-4ef4-b822-17e12a4ba808','FrontBus','Breakdown Voltage','N/A','N/A','Supplier COC/CDF/Test Report','As Per COC / GSPL Technical Specification','0','[]','17-04-2024 08:42:57',''),
('4aa023a0-542e-4ca8-a538-0ce9ddf7dfb3','289ca892-6b67-4ef4-b822-17e12a4ba808','Verification','Partial Discharge','N/A','N/A','Supplier COC/CDF/Test Report','>/ 1500VDC','0','[]','17-04-2024 08:42:57',''),
('c6f84132-a126-400d-82c4-3fc7f7f21e3e','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','Packaging','Packing (Make type and rating)','Visual Inspection','Whole Lot','PO/INVOICE','No Physical Damage / No Mismatch against PO/Invoice','1','[{\"PackageSampleBarcode1\":\"yy\",\"PackageSampleTest1\":true,\"PackageSampleRemarks1\":\"\"}]','20-04-2024 08:17:33',''),
('6dca2d7b-6490-4ebb-b651-14c409e57bc3','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','Visual','Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','As GSPL Technical Specification / Acceptance Criteria','','[]','20-04-2024 08:17:33',''),
('f3bf3aca-0d71-4541-929e-d96a8bc4a0d1','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','Physical','Dimension(L X W X T)','Verner Calliper/Measuring Scale','SIL S1 AQL 6.5','GSPL Technical Specification / Supplier COC','COC','','[]','20-04-2024 08:17:33',''),
('e83f501a-3dc1-4656-ad25-47d0a82bb815','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','FrontBus','Width','Verner Calliper/Measuring Scale','5 Pcs / Lot','GSPL Technical Specification / Supplier COC','COC','5','[]','20-04-2024 08:17:33',''),
('8a65de19-6cfc-42f4-b650-1bd06ccb1580','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','Verification','Electrical Paramiter','Cell Tester','SIL S1 AQL 6.5','GSPL Technical Specification','COC','','[]','20-04-2024 08:17:33',''),
('4584cf29-c48d-45ca-ade0-3f1c581b90c7','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','Electrical','LID(Light Inducted Degradation)/Preconditioning','Sunsimulator','One Module per supplier(each month)','GSPL Technical Specification','COC','1','[]','20-04-2024 08:17:33',''),
('7a9e7ed8-ea51-4244-b722-d3c391dbc1a7','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','Performance','Soidering Peel Test','Peel Tester','5 Cell/Lot','GSPL Technical Specification','1 N to 2N-Cell Frontside 1N to 4N Cell Back side','5','[]','20-04-2024 08:17:33','');

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
  KEY `fk_CheckedBy` (`CheckedBy`),
  KEY `fk_ApprovedBy` (`UpdatedBy`),
  CONSTRAINT `fk_CheckedBy` FOREIGN KEY (`CheckedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=4096 ROW_FORMAT=DYNAMIC;

/*Data for the table `IQCSolarDetails` */

insert  into `IQCSolarDetails`(`SolarDetailID`,`LotSize`,`MaterialName`,`SupplierName`,`QuantityRecd`,`InvoiceDate`,`SupplierRMBatchNo`,`RawMaterialSpecs`,`QualityCheckDate`,`SampleQuantityCheck`,`InvoiceNo`,`ReceiptDate`,`DocumentNo`,`RevisionNo`,`CheckedBy`,`Status`,`COCPdf`,`InvoicePdf`,`UpdatedBy`,`CreatedDate`,`UpdatedDate`) values 
('12df2281-e7e6-4751-b230-fb427b5ffc1a','21','Encapsulant/EVA','Ram','','2024-04-03','09','Raw','2024-04-09','','1009M','2024-04-01','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/12df2281-e7e6-4751-b230-fb427b5ffc1a_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712656622527955.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/12df2281-e7e6-4751-b230-fb427b5ffc1a_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712656622527955.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','09-04-2024 09:57:01','09-04-2024 09:58:12'),
('22b5f67c-4265-4fd2-bc2c-b41a524f8e17','8','Solar Cell','f','','2024-04-20','9','fd','2024-04-18','','g','2024-04-18','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','20-04-2024 08:17:33',''),
('238524c3-1a23-411f-8453-e8e5e1363ee1','5','Sealant/Poating','Whole','','2024-04-09','55','raw','2024-04-16','','Sealant0098','2024-04-16','GSPL/SPM(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/238524c3-1a23-411f-8453-e8e5e1363ee1_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1713251966670652.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IQC/238524c3-1a23-411f-8453-e8e5e1363ee1_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1713251966670652.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','16-04-2024 07:19:26','16-04-2024 13:20:55'),
('289ca892-6b67-4ef4-b822-17e12a4ba808','hh','Backsheet','hh','','2024-04-17','','nn','2024-04-17','','ff','null','GSPL/BS(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','17-04-2024 08:42:56',''),
('3293417d-70e1-4964-90b0-0882624e017d','20','Junction Box','Box','','2024-04-11','22','rt','2024-04-11','','Box001','2024-04-01','GSPL/JB(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/3293417d-70e1-4964-90b0-0882624e017d_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712827142236609.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/3293417d-70e1-4964-90b0-0882624e017d_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712827142236609.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','11-04-2024 09:19:01','11-04-2024 09:35:21'),
('369a0e54-c4ec-44cd-8f7c-171496d49e37','3','Encapsulant/EVA','tamp','','2024-04-09','23','cc','2024-04-01','','55as','2024-04-09','GSPL/EVA(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Rejected','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/369a0e54-c4ec-44cd-8f7c-171496d49e37_4717789870.pdf1712666221654709.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/369a0e54-c4ec-44cd-8f7c-171496d49e37_f4a1b1fb-cb89-4e65-8191-cf37b70707d9_IN2436050647.pdf1712229355948240.pdf1712666221654709.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','09-04-2024 12:37:00','09-04-2024 12:38:16'),
('3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','22','Backsheet','Backsheet','','2024-04-08','32','r','2024-04-15','','B0998','2024-04-15','GSPL/BS(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/3c2d2cd1-a448-4e82-91f6-6ff635cc74b5_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1713176628827063.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IQC/3c2d2cd1-a448-4e82-91f6-6ff635cc74b5_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1713176628827063.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','15-04-2024 10:23:47','15-04-2024 10:24:36'),
('4603e44c-00f2-4b33-b208-5863eab326c8','1','Solar Cell','ttt','','2024-04-03','222','fff','2024-04-03','','G000127','2024-04-03','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','897d6163-e82b-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/4603e44c-00f2-4b33-b208-5863eab326c8_50CommonInterviewQuestionsandAnswers.pdf1712136290940243.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/4603e44c-00f2-4b33-b208-5863eab326c8_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712136290940243.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','03-04-2024 09:24:50','16-04-2024 13:21:49'),
('561fc21b-802a-41f9-b77c-314fe3e35789','21','Aluminium Frame','Aluminum ','','2024-04-10','01','Raw','2024-04-12','','Alu00123','2024-04-12','GSPL/AF(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/561fc21b-802a-41f9-b77c-314fe3e35789_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712920419297115.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/561fc21b-802a-41f9-b77c-314fe3e35789_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712920419297115.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','12-04-2024 11:13:37','12-04-2024 11:14:52'),
('60597056-5cf4-4377-97bd-c0d62a138730','21','Flux','Flux','','2024-04-11','2','frt','2024-04-13','','Flux0098','2024-04-13','GSPL/FX(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/60597056-5cf4-4377-97bd-c0d62a138730_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1713008960169206.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/60597056-5cf4-4377-97bd-c0d62a138730_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1713008960169206.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','13-04-2024 11:49:21','13-04-2024 11:50:21'),
('75e61f5a-95b1-4683-b340-c217bee8533a','11','Solar Glass','rrr','','2024-04-03','222','eee','2024-04-03','','yyy','2024-04-03','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','897d6163-e82b-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/75e61f5a-95b1-4683-b340-c217bee8533a_50CommonInterviewQuestionsandAnswers%20%281%29.pdf1712135442599990.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/75e61f5a-95b1-4683-b340-c217bee8533a_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712135442599990.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','03-04-2024 09:10:42','05-04-2024 15:11:03'),
('9238f0e2-d704-4732-b6bb-de1f6892c960','2','Solar Cell','a','','2024-04-05','2','tt','2024-04-05','checkpackaging','aa','2024-04-05','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','05-04-2024 12:29:39',''),
('94c65a75-caa7-4d7c-aea9-eec2bd471f27','33','Solar Glass','Vikas Entertainment ','','2024-04-03','99','gg','2024-04-03','','V001278','2024-04-03','GSPL/SC(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','03-04-2024 10:09:10',''),
('acc13729-2b42-4665-a91a-78574bb6ed91','5','EVA(Encapsulant)','ttttu','','2024-04-10','23','gfdsa','2024-04-09','','iuy','2024-04-01','GSPL/EVA(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Inprogress',NULL,NULL,'','18-04-2024 12:06:26',''),
('e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','2','Encapsulant/EVA','g','','2024-04-08','99','bb','2024-04-10','','hh','2024-04-10','GSPL/EVA(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Rejected','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/e2ed3cff-e3d4-4fbc-82c1-3f89743c3052_a426b3c5-95da-4339-9b57-7123376d4c04_DocScanner%20Apr%204%2C%202024%2017-16.pdf1712231362475369%20%281%29.pdf1712718516371830.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/e2ed3cff-e3d4-4fbc-82c1-3f89743c3052_12df2281-e7e6-4751-b230-fb427b5ffc1a_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf171265662252795','08326670-ed04-11ee-b439-0ac93defbbf1','10-04-2024 03:08:35','10-04-2024 10:03:55'),
('eed25293-708c-4db3-baa3-dfb701758ca5','2','PV Ribbon','yy','','2024-04-10','52','jk','2024-04-02','','g','2024-04-01','GSPL/PVR(IQC)/001','Ver2.0/13-03-2024','08326670-ed04-11ee-b439-0ac93defbbf1','Approved','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/eed25293-708c-4db3-baa3-dfb701758ca5_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712742721435400.pdf','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/eed25293-708c-4db3-baa3-dfb701758ca5_340623ea-6bbb-4f4c-8280-25a82f69f8c1_50CommonInterviewQuestionsandAnswers%20%283%29.pdf1712147164072650.pdf1712742721435400.pdf','08326670-ed04-11ee-b439-0ac93defbbf1','10-04-2024 09:52:01','10-04-2024 09:53:58');

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

insert  into `JobCard`(`JobCardID`,`JobCardDetailID`,`Process`,`EmployeeId`,`Description`,`Comments`,`CreatedOn`,`UpdatedOn`) values 
('e19b2300-ed4f-461f-b8e1-6659ca5777ce','874c3fac-a09b-4bf8-ac59-1a622db6e686','Foil cutterr','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','20-04-2024 09:53:19',''),
('3598b282-431e-4b7b-9a46-7b87ac11ec3c','874c3fac-a09b-4bf8-ac59-1a622db6e686','Tabbing & Stringing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','20-04-2024 09:53:19',''),
('f1ec3858-cf5c-4362-ba5a-1c0c701d8148','874c3fac-a09b-4bf8-ac59-1a622db6e686','Visual Inspection & Laminator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','20-04-2024 09:53:19',''),
('1cd9d60b-f030-4f3d-b7e3-dfe16f581e45','874c3fac-a09b-4bf8-ac59-1a622db6e686','Bussing/InterConnection','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','20-04-2024 09:53:19',''),
('4c4bd766-294a-495f-8cc9-e10e8a50ae5e','874c3fac-a09b-4bf8-ac59-1a622db6e686','Framing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 09:53:19',''),
('d2253755-e995-463c-9b1a-edcdc166113f','874c3fac-a09b-4bf8-ac59-1a622db6e686','J/B Assembly','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 09:53:19',''),
('2ed065aa-b3fe-4b9a-9d04-0186667054c5','874c3fac-a09b-4bf8-ac59-1a622db6e686','Glass Washing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Lot_No\":\"\",\"size\":\"\"}','','20-04-2024 09:53:19',''),
('4893e148-6883-49d8-b075-447c7bc85ada','874c3fac-a09b-4bf8-ac59-1a622db6e686','Sun Simulator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Pmax\":\"\"}','','20-04-2024 09:53:19',''),
('516d1a16-cfbd-4ef2-9e8c-79188438562d','874c3fac-a09b-4bf8-ac59-1a622db6e686','Edge Triming','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"BackSheet_Cutting\":false}','','20-04-2024 09:53:19',''),
('d0d8488f-8268-40e8-99b9-3fc3873da414','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Glass Washing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Lot_No\":\"\",\"size\":\"\"}','','20-04-2024 09:53:46',''),
('1ed966b6-0d42-4ff1-b1a1-f7091441daeb','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Foil cutterr','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','20-04-2024 09:53:46',''),
('85c229a9-1962-4d81-92ef-0b2224eb5e24','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Tabbing & Stringing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','20-04-2024 09:53:46',''),
('4864ce8b-ae05-4d03-843a-eca6e17d6267','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Bussing/InterConnection','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','20-04-2024 09:53:46',''),
('b9c7dd76-5895-452e-bd00-98a11d97cfb5','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Edge Triming','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"BackSheet_Cutting\":false}','','20-04-2024 09:53:46',''),
('f364cf71-a4cb-4230-80ca-94aebe28efc1','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Visual Inspection & Laminator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','20-04-2024 09:53:46',''),
('7a7c1432-aad0-4524-99dd-20bf2ac36e41','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Framing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 09:53:46',''),
('91cf9d43-6441-43d6-a654-21c92d0c42ab','78a5f6fc-008b-467a-94d5-f9909a9d41aa','Sun Simulator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Pmax\":\"\"}','','20-04-2024 09:53:46',''),
('f3104f55-460a-48ef-b04b-6c709f535f0d','78a5f6fc-008b-467a-94d5-f9909a9d41aa','J/B Assembly','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 09:53:46',''),
('08cb2762-06bf-47b0-a078-9c121e83a069','8475c229-3692-40b5-a9cd-5077fe74ae1a','Glass Washing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Lot_No\":\"\",\"size\":\"\"}','','20-04-2024 10:34:41',''),
('518147cb-428d-4f11-aae1-c1fdca8b81d9','8475c229-3692-40b5-a9cd-5077fe74ae1a','Foil cutterr','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','20-04-2024 10:34:41',''),
('38c29147-9843-4bcc-8c00-919d92cfa804','8475c229-3692-40b5-a9cd-5077fe74ae1a','Tabbing & Stringing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','20-04-2024 10:34:41',''),
('94480bbf-8dda-4a65-8075-a24aaa3b29a0','8475c229-3692-40b5-a9cd-5077fe74ae1a','Bussing/InterConnection','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','20-04-2024 10:34:41',''),
('1e82dcb8-af87-402e-9007-69c1435d530e','8475c229-3692-40b5-a9cd-5077fe74ae1a','J/B Assembly','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 10:34:41',''),
('08f7967c-e2a1-4f51-8b5b-cd3911b69d59','8475c229-3692-40b5-a9cd-5077fe74ae1a','Visual Inspection & Laminator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','20-04-2024 10:34:41',''),
('12cbe045-31c7-4e31-8e22-54bf503b243d','8475c229-3692-40b5-a9cd-5077fe74ae1a','Sun Simulator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Pmax\":\"\"}','','20-04-2024 10:34:41',''),
('19abf668-f2db-4c2c-8fd9-c5cf7023617e','8475c229-3692-40b5-a9cd-5077fe74ae1a','Edge Triming','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"BackSheet_Cutting\":false}','','20-04-2024 10:34:41',''),
('1d5dd30e-719e-4b83-a122-e7359ce7b89b','8475c229-3692-40b5-a9cd-5077fe74ae1a','Framing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 10:34:41',''),
('f7b6af27-05cf-457f-af60-f43535d53e3d','28e3e2b1-02cc-4755-aba8-49440cff552e','Glass Washing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Lot_No\":\"\",\"size\":\"\"}','','20-04-2024 10:40:47',''),
('025aec6c-83b6-439e-a8ce-f1b7625d2d91','28e3e2b1-02cc-4755-aba8-49440cff552e','Edge Triming','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"BackSheet_Cutting\":false}','','20-04-2024 10:40:47',''),
('88e4a22a-b20f-4f50-b8b3-61b67c9a3912','28e3e2b1-02cc-4755-aba8-49440cff552e','Bussing/InterConnection','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_To_Cell_Gap\":\"\",\"String_To_String_Gap\":\"\",\"Soldering_Temp\":\"\"}','','20-04-2024 10:40:47',''),
('e38c1828-e285-480d-a9a1-95daec4817b8','28e3e2b1-02cc-4755-aba8-49440cff552e','Visual Inspection & Laminator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Temperature\":\"\",\"Cycle_Time\":\"\",\"Laminate_Quality\":false}','','20-04-2024 10:40:47',''),
('2b58385e-e532-4014-bb3f-3b119834812c','28e3e2b1-02cc-4755-aba8-49440cff552e','Foil cutterr','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"EVA_Lot_No\":\"\",\"EVA_Size\":\"\",\"Backsheet_Lot\":\"\",\"Backsheet_size\":\"\"}','','20-04-2024 10:40:47',''),
('fa40034d-252f-4fe1-97ec-7037893a6669','28e3e2b1-02cc-4755-aba8-49440cff552e','Tabbing & Stringing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_Lot_No\":\"\",\"Cell_Type\":\"\",\"Cell_Size\":\"\",\"Cell_Eff\":\"\",\"Interconnect_Ribbon_Size\":\"\",\"Busbar_Size\":\"\",\"Flux\":\"\"}','','20-04-2024 10:40:47',''),
('64c11536-aa25-4ac2-a075-19a7f4d50788','28e3e2b1-02cc-4755-aba8-49440cff552e','J/B Assembly','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"JB_Lot_No\":\"\",\"JB_Type\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 10:40:47',''),
('196fbf99-8944-4eb6-8a35-3ab9817369b6','28e3e2b1-02cc-4755-aba8-49440cff552e','Framing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Frame_Type\":\"\",\"Frame_Size\":\"\",\"Silicon_Glue_Lot_No\":\"\"}','','20-04-2024 10:40:47',''),
('4657245a-682a-4429-9190-4aeacd7d0a1a','28e3e2b1-02cc-4755-aba8-49440cff552e','Sun Simulator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Pmax\":\"\"}','','20-04-2024 10:40:47',''),
('c58db822-346d-40f4-b0ec-6bbc170c057d','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Foil cutterr','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"EVA_Lot_No\":\"hj\",\"EVA_Size\":\"hu\",\"Backsheet_Lot\":\"hh\",\"Backsheet_size\":\"bb\"}','hhh','20-04-2024 11:11:14',''),
('052ea8bc-a965-4058-94e1-9046e0a04603','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Tabbing & Stringing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_Lot_No\":\"bh\",\"Cell_Type\":\"hj\",\"Cell_Size\":\"nj\",\"Cell_Eff\":\"nn\",\"Interconnect_Ribbon_Size\":\"j\",\"Busbar_Size\":\"n\",\"Flux\":\"n\"}','jj','20-04-2024 11:11:14',''),
('2a3b7c57-d588-4a89-b5f6-a28acde117e9','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Glass Washing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Lot_No\":\"jj\",\"size\":\"jj\"}','hj','20-04-2024 11:11:14',''),
('cad7a5cd-8132-4c4d-bc3c-d03529dd28b9','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Bussing/InterConnection','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Cell_To_Cell_Gap\":\"jj\",\"String_To_String_Gap\":\"jj\",\"Soldering_Temp\":\"nn\"}','jj','20-04-2024 11:11:14',''),
('dbfdf05a-0f72-4ea9-8063-d87d990c5c77','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Visual Inspection & Laminator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Temperature\":\"jj\",\"Cycle_Time\":\"jj\",\"Laminate_Quality\":true}','nn','20-04-2024 11:11:14',''),
('3e3cb5fd-fa89-466a-a1c6-b5704e58825c','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Edge Triming','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"BackSheet_Cutting\":false}','jj','20-04-2024 11:11:14',''),
('ed3ca71f-05e0-4a9c-b72e-70e0db0709bf','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Sun Simulator','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Pmax\":\"jj\"}','k','20-04-2024 11:11:14',''),
('5c957bd1-a08a-460d-9d9b-540397fd2637','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Framing','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"Frame_Type\":\"kk\",\"Frame_Size\":\"kk\",\"Silicon_Glue_Lot_No\":\"jj\"}','jj','20-04-2024 11:11:14',''),
('1292a4c1-5193-4038-8b4c-d4e097629ab2','aefbc23c-2d3a-4a83-8f6b-46498c9a483f','J/B Assembly','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','{\"JB_Lot_No\":\"jj\",\"JB_Type\":\"jj\",\"Silicon_Glue_Lot_No\":\"jj\"}','jj','20-04-2024 11:11:14','');

/*Table structure for table `JobCardDetails` */

DROP TABLE IF EXISTS `JobCardDetails`;

CREATE TABLE `JobCardDetails` (
  `JobCardDetailID` varchar(255) NOT NULL,
  `Type` varchar(55) DEFAULT NULL,
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
  PRIMARY KEY (`JobCardDetailID`),
  KEY `JD_PersonId` (`CreatedBy`),
  CONSTRAINT `JD_PersonId` FOREIGN KEY (`CreatedBy`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192 ROW_FORMAT=DYNAMIC;

/*Data for the table `JobCardDetails` */

insert  into `JobCardDetails`(`JobCardDetailID`,`Type`,`DocNo`,`RevisionNo`,`RevisonDate`,`ModuleType`,`ModuleNo`,`Date`,`MatrixSize`,`ReferencePdf`,`Status`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`) values 
('28e3e2b1-02cc-4755-aba8-49440cff552e','Job Card','GSPL/IPQC/BM/024','1.0','12.08.2023','','99','2024-04-20','',NULL,'Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','','20-04-2024 10:40:47',''),
('78a5f6fc-008b-467a-94d5-f9909a9d41aa','Job Card','GSPL/IPQC/BM/024','1.0','12.08.2023','','999','','',NULL,'Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','','20-04-2024 09:53:46',''),
('8475c229-3692-40b5-a9cd-5077fe74ae1a','Job Card','GSPL/IPQC/BM/024','1.0','12.08.2023','','9999','','',NULL,'Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','','20-04-2024 10:34:41',''),
('874c3fac-a09b-4bf8-ac59-1a622db6e686','Job Card','GSPL/IPQC/BM/024','1.0','12.08.2023','','100','','',NULL,'Inprogress','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','','20-04-2024 09:53:19',''),
('aefbc23c-2d3a-4a83-8f6b-46498c9a483f','Job Card','GSPL/IPQC/BM/024','1.0','12.08.2023','hh','0099','2024-04-20','hh','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IPQC/aefbc23c-2d3a-4a83-8f6b-46498c9a483f_100636f5-2f2f-4dbb-9073-ceba2e5694b4_a426b3c5-95da-4339-9b57-7123376d4c04_DocScanner%20Apr%204%2C%202024%2017-16.pdf1712231362475369.pdf1713515233801362.p','Approved','ad320aa6-f3f2-11ee-b439-0ac93defbbf1','08326670-ed04-11ee-b439-0ac93defbbf1','20-04-2024 11:13:46','20-04-2024 11:38:05');

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
  `Status` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` varchar(255) DEFAULT NULL,
  `UpdatedOn` varchar(255) DEFAULT NULL,
  `CreadtedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  UNIQUE KEY `EmployeeID` (`EmployeeID`),
  KEY `fk_Department` (`Department`),
  KEY `fk_Designation` (`Desgination`),
  KEY `fk_WorkLocation` (`WorkLocation`),
  CONSTRAINT `fk_Department` FOREIGN KEY (`Department`) REFERENCES `Department` (`DepartmentID`),
  CONSTRAINT `fk_Designation` FOREIGN KEY (`Desgination`) REFERENCES `Designation` (`DesignationID`),
  CONSTRAINT `fk_WorkLocation` FOREIGN KEY (`WorkLocation`) REFERENCES `WorkLocation` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384 ROW_FORMAT=DYNAMIC;

/*Data for the table `Person` */

insert  into `Person`(`PersonID`,`EmployeeID`,`Name`,`LoginID`,`Password`,`WorkLocation`,`Email`,`Department`,`ProfileImg`,`Desgination`,`Status`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`CreadtedBy`) values 
('08326670-ed04-11ee-b439-0ac93defbbf1','Emp003','Bhanu','QCM','Bhanu@3813','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/08326670-ed04-11ee-b439-0ac93defbbf1','d66db440-e2ab-11ee-974e-12d6db81f661','Active',NULL,NULL,NULL,NULL,NULL),
('11d81dd4-f1bc-11ee-b439-0ac93defbbf1','Emp009','girl','QCM01','girl@8584','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/11d81dd4-f1bc-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Inactive',NULL,NULL,NULL,NULL,NULL),
('14aa171b-0142-11ef-b439-0ac93defbbf1','hh766','Example','IPQCAdmin','Example@8524','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active','08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'23-04-2024 12:51:18',NULL,NULL),
('27d6d47d-0140-11ef-b439-0ac93defbbf1','Employee ','gaurav','IPQCAdmin','gaurav@8781','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849684af-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/27d6d47d-0140-11ef-b439-0ac93defbbf1','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active','08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'23-04-2024 07:07:32',NULL,NULL),
('31d942b3-f3f0-11ee-b439-0ac93defbbf1','E009','IPQC','IPQC','IPQC@7898','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/31d942b3-f3f0-11ee-b439-0ac93defbbf1','d66db440-e2ab-11ee-974e-12d6db81f661','Inactive',NULL,NULL,NULL,NULL,NULL),
('340a6585-0142-11ef-b439-0ac93defbbf1','hh76wer6','Example','IPQCAdmin','Example@7744','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active','08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'23-04-2024 12:52:11',NULL,NULL),
('5a114928-e8f3-11ee-b439-0ac93defbbf1','Emp001','Test','QCM2','Test@3547','fc9c9178-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/5a114928-e8f3-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Inactive',NULL,NULL,NULL,NULL,NULL),
('728cc56d-f3ef-11ee-b439-0ac93defbbf1','E001','Admin','Admin','Admin@2035','fc9c9178-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/728cc56d-f3ef-11ee-b439-0ac93defbbf1','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active',NULL,NULL,NULL,NULL,NULL),
('897d6163-e82b-11ee-b439-0ac93defbbf1','em1','Neha Sharma','QCM1','Neha@5273','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/897d6163-e82b-11ee-b439-0ac93defbbf1','d66db440-e2ab-11ee-974e-12d6db81f661','Active',NULL,'08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'08-04-2024 13:27:15',NULL),
('a3217901-f3f1-11ee-b439-0ac93defbbf1','E00111','AdminIPQC','IPQCAdmin','AdminIPQC@9143','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/a3217901-f3f1-11ee-b439-0ac93defbbf1','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active',NULL,NULL,NULL,NULL,NULL),
('ad320aa6-f3f2-11ee-b439-0ac93defbbf1','eo88','QC','Krishna','QC@3353','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/ad320aa6-f3f2-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,NULL,NULL,NULL),
('baef197e-f5a0-11ee-b439-0ac93defbbf1','E11','QA','QA','QA@1828','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/baef197e-f5a0-11ee-b439-0ac93defbbf1','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active',NULL,'08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'08-04-2024 12:09:00',NULL),
('cbbfde91-f243-11ee-b439-0ac93defbbf1','ttt','ttt','ttt','ttt@7027','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','84949eb1-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/cbbfde91-f243-11ee-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active',NULL,NULL,NULL,NULL,NULL),
('d8a51098-014b-11ef-b439-0ac93defbbf1','emp90','fat','Saif','fat@3462','fc9c906b-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/d8a51098-014b-11ef-b439-0ac93defbbf1','d66d6ab7-e2ab-11ee-974e-12d6db81f661','Active','08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'23-04-2024 08:31:14',NULL,NULL),
('e41d9df7-013f-11ef-b439-0ac93defbbf1','Emp12','Arun','Krishna','Arun@8733','fc9c8db9-e817-11ee-b439-0ac93defbbf1','krishukumar7827@gmail.com','849b50dd-e816-11ee-b439-0ac93defbbf1','https://qcm-project-bucket.s3.ap-south-1.amazonaws.com/e41d9df7-013f-11ef-b439-0ac93defbbf1','1af9d9f7-e817-11ee-b439-0ac93defbbf1','Active','08326670-ed04-11ee-b439-0ac93defbbf1',NULL,'23-04-2024 07:05:39',NULL,NULL);

/*Table structure for table `PreLam` */

DROP TABLE IF EXISTS `PreLam`;

CREATE TABLE `PreLam` (
  `PreLamId` varchar(255) NOT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `Stage` varchar(255) DEFAULT NULL,
  `CheckPoint` longtext,
  `Frequency` longtext,
  `AcceptanceCriteria` longtext,
  `Remark` varchar(255) DEFAULT NULL,
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

insert  into `PreLamDetail`(`PreLamDetailId`,`DocNo`,`RevNo`,`Date`,`Shift`,`Line`,`PONo`,`CheckedBy`,`CreatedBy`,`UpdatedBy`,`CreatedOn`,`UpdatedOn`,`Status`,`Type`,`PreLamPdf`) values 
('03e83a82-3dde-461b-b6e9-08d8cab861bb','GSPL/IPQC/AF/011','1.0/12.08.2023','2024-04-23','','1',NULL,'08326670-ed04-11ee-b439-0ac93defbbf1',NULL,NULL,'23-04-2024 17:59:34',NULL,'Inprogress','Framing','https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IPQC/03e83a82-3dde-461b-b6e9-08d8cab861bb_24e09070-b638-4807-a080-fab3a519148a_file-sample_150kB.pdf1713421177261904.pdf1713871644885058.pdf'),
('3da33151-7a81-4419-8222-a3ca60af509f','GSPL/IPQC/AF/011','1.0/12.08.2023','2024-04-23','Day Shift','1',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,NULL,'23-04-2024 12:59:45',NULL,'Inprogress','Framing',NULL),
('868752ac-f2a5-4b0f-94a6-257d86a9439e','GSPL/IPQC/AF/011','1.0/12.08.2023','','','33',NULL,'ad320aa6-f3f2-11ee-b439-0ac93defbbf1',NULL,NULL,'23-04-2024 18:44:42',NULL,'Inprogress','Framing',NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `Rejected` */

insert  into `Rejected`(`RejectedID`,`SolarDetailID`,`CheckTypes`,`Reason`,`Result`,`CreatedDate`,`UpdatedDate`) values 
('75d4c4bf-0259-4cfc-a0ed-0bd4271c41fc','4603e44c-00f2-4b33-b208-5863eab326c8','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Pass','03-04-2024 09:24:52',''),
('8592b7eb-9cf3-45e9-880e-c46b05824f10','75e61f5a-95b1-4683-b340-c217bee8533a','[{\"Packaging\":false},{\"Visual\":true},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":true}]','test','Fail','03-04-2024 09:10:44',''),
('7e25c457-2808-4b5d-bedc-58756e827340','94c65a75-caa7-4d7c-aea9-eec2bd471f27','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false}]','','Fail','03-04-2024 10:09:12',''),
('ede4a145-ee3d-4b27-afba-e953f28b64ab','9238f0e2-d704-4732-b6bb-de1f6892c960','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Fail','05-04-2024 12:29:40',''),
('cbaf47e1-b864-4d71-a4cb-d8c85bb6db36','12df2281-e7e6-4751-b230-fb427b5ffc1a','[{\"Packaging\":false},{\"Visual\":true},{\"Physical\":true},{\"FrontBus\":false},{\"Verification\":false}]','Width not set.','Fail','09-04-2024 09:57:02',''),
('5343117a-b808-437f-a5f1-8413ce95e37a','369a0e54-c4ec-44cd-8f7c-171496d49e37','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false}]','','Pass','09-04-2024 12:37:02',''),
('6972af3d-87d9-49a3-afe1-e8d632ba2b73','e2ed3cff-e3d4-4fbc-82c1-3f89743c3052','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false}]','','Pass','10-04-2024 03:08:37',''),
('077bac52-5900-4536-83d5-140c64729c1c','eed25293-708c-4db3-baa3-dfb701758ca5','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":true},{\"FrontBus\":false},{\"Verification\":true},{\"Electrical\":false},{\"Performance\":true}]','Not good','Fail','10-04-2024 09:52:04',''),
('9a470dd4-fe1f-4d05-a58e-c888d5171da5','acc13729-2b42-4665-a91a-78574bb6ed91','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false}]','','Fail','18-04-2024 12:06:28',''),
('6b09c0e9-6f25-418e-bc10-616ca73332b7','3293417d-70e1-4964-90b0-0882624e017d','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":true},{\"Electrical\":true}]','ghnbv','Fail','11-04-2024 09:19:03',''),
('e4cb6b3b-033b-49b4-bba4-1f1ea56829e4','561fc21b-802a-41f9-b77c-314fe3e35789','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":true},{\"FrontBus\":true},{\"Verification\":false},{\"Electrical\":false}]','fff','Fail','12-04-2024 11:13:39',''),
('9452461b-d0a6-4bd9-9acd-6f20192d29be','60597056-5cf4-4377-97bd-c0d62a138730','[{\"Packaging\":false},{\"Visual\":true},{\"Physical\":true},{\"FrontBus\":false},{\"Verification\":false}]','gg','Fail','13-04-2024 11:49:22',''),
('fc3cceb0-e751-487c-91af-f437a4591ff8','3c2d2cd1-a448-4e82-91f6-6ff635cc74b5','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":true},{\"Verification\":true}]','ggg','Fail','15-04-2024 10:23:48',''),
('e5966de6-16d7-463f-bec5-791d346a2547','238524c3-1a23-411f-8453-e8e5e1363ee1','[{\"Packaging\":false},{\"Visual\":true},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false},{\"Sealant\":true}]','no','Fail','16-04-2024 07:19:28',''),
('29eae10a-33ca-4b61-9416-2afa4c630bbb','289ca892-6b67-4ef4-b822-17e12a4ba808','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false}]','','Fail','17-04-2024 08:42:57',''),
('1791691b-6255-4d14-963a-e822f775fb4a','22b5f67c-4265-4fd2-bc2c-b41a524f8e17','[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]','','Fail','20-04-2024 08:17:33','');

/*Table structure for table `StringerMachine` */

DROP TABLE IF EXISTS `StringerMachine`;

CREATE TABLE `StringerMachine` (
  `StringerMachineId` varchar(255) DEFAULT NULL,
  `PreLamDetailId` varchar(255) DEFAULT NULL,
  `TS01A` longtext,
  `TS01B` longtext,
  `TS02A` longtext,
  `TS02B` longtext,
  `TS03A` longtext,
  `TS03B` longtext,
  KEY `StingerMachinePreLamDetailId_ak` (`PreLamDetailId`),
  CONSTRAINT `StingerMachinePreLamDetailId_ak` FOREIGN KEY (`PreLamDetailId`) REFERENCES `PreLamDetail` (`PreLamDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `StringerMachine` */

/*Table structure for table `WorkLocation` */

DROP TABLE IF EXISTS `WorkLocation`;

CREATE TABLE `WorkLocation` (
  `LocationID` varchar(255) NOT NULL,
  `Location` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  DECLARE vSolarDetailID VARCHAR(155);
  DECLARE vDate DATE;
  DECLARE vRejectionReason VARCHAR(255);

  SET vSolarDetailID = UUID();
  SET vDate = CURDATE();
  SET vRejectionReason = pRejectionReason;

  -- inserting Values into IQCSolarDetails Table
  INSERT INTO IQCSolarDetails(SolarDetailID, LotSize, SupplierName, QuantityRecd, InvoiceDate, RMDetails, QualityCheckDate, SampleQuantityCheck, InvoiceNo, ReceiptDate, DocumentNo, RevisionNo, CheckedBy, CreatedDate)
  VALUES (vSolarDetailID, pLotSize, pSupplierName, pQuantityRecd, pInvoiceDate, pRMDetails, pQualityCheckDate, pSampleQuantityCheck, pInvoiceNo, pRecieptDate, pDocumentNo, pRevisionNo, pCheckedBy, vDate);

  -- inserting Values into IQCSolar Table
  INSERT INTO IQCSolar(IQCSolarID, SolarDetailID, CheckType, Characterstics, MeasuringMethod, Sampling, Reference, AcceptanceCriteria, Samples, CreatedDate)
  VALUES (UUID(), vSolarDetailID, pCheckType, pCharterstics, pMeasuringMethod, pSampling, pReference, pAcceptanceCriteria, pSamples, vDate);
      
  -- inserting Values into Rejected Table
    INSERT INTO Rejected(RejectedID, SolarDetailID, RejectionReason,CreatedDate)
    VALUES (UUID(), vSolarDetailID, vRejectionReason,vDate);
  
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
