
-- FQC Details Query
CREATE TABLE FQCDetails (
    FQCDetailId VARCHAR(255) PRIMARY KEY,
    ProductSpecs VARCHAR(255),
    ProductBatchNo VARCHAR(255),
    PartyName VARCHAR(255),
    PackingDate VARCHAR(255),
    ReportNumber VARCHAR(255),
    DateOfQualityCheck VARCHAR(255),
    DocumentNo VARCHAR(255),
    RevNo VARCHAR(255),
    Status VARCHAR(255),
    Pdf VARCHAR(255),
    Result Varchar(255),
    CheckTypes longtext,
    Reason Varchar(255),
    CreatedBy VARCHAR(255),
    UpdatedBy VARCHAR(255),
    CreatedOn VARCHAR(255),
    UpdatedOn VARCHAR(255),
    FOREIGN KEY (CreatedBy) REFERENCES Person(PersonID)
);

-- FQCTest Table
Create Table FQCTest(
FQCId Varchar(255) unique key,
FQCDetailId VARCHAR(255),
Sample1 longtext,
Sample2 longtext,
Sample3 longtext,
 FOREIGN KEY (FQCDetailId) REFERENCES FQCDetails(FQCDetailId)
);