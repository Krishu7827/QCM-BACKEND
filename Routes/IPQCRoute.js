const express = require('express');
const {AddIPQCJobCard,JobCardList,UploadPdf,GetSpecificJobCard,UpdateJobCardStatus} = require('../Controller/IPQCJobCard');
const {AddBomVerification,BOMUploadPdf,GetSpecificBOMVerification, UpdateStatusBOM} = require('../Controller/BOMVerification');
const {AddPreLam,PreLamUploadPdf,GetSpecificPreLam,UpdatePreLamStatus} = require('../Controller/PreLamController');
const {AddFraming,UploadFramingPdf,GetSpecificFraming,UpdateFramingStatus,GetPdf} = require("../Controller/FramingController");
const {AddSealentWeight,UploadSealentWeightPdf} = require('../Controller/SealentWeightController')
const {RoleAuthentication,upload} = require('../Middleware/IPQC.Middleware');
const IPQC = express.Router();





/** Route To Add Job Card */
IPQC.post('/AddJobCard',AddIPQCJobCard);

/** Router to Upload Reference Pdf in S3 and Get The Location and Set into dbs */
IPQC.post('/UploadPdf',upload.single('Reference'),UploadPdf);

/** Router to Upload Reference Pdf in S3 and Get The Location and Set into dbs(BOM Verification Table) */
IPQC.post('/BOMUploadPdf',upload.single('ReferencePdf'),BOMUploadPdf);

/** Router to Upload Reference Pdf in S3 and Get The Location and Set into dbs(PreLamDetail Table) */
IPQC.post('/UploadPreLamPdf',upload.single('PreLamPdf'),PreLamUploadPdf);

/** Router to Upload Reference Pdf in S3 and Get The Location and Set into dbs(PreLamDetail Table) */
IPQC.post('/UploadFramingPdf',upload.single('FramingPdf'),UploadFramingPdf);

/** Router to Upload Reference Pdf in S3 and Get The Location and Set into dbs(PreLamDetail Table) */
IPQC.post('/UploadSealentWeightPdf',upload.single('SealentWeightPdf'),UploadSealentWeightPdf);

/**Router To Add BOM Verification Data*/
IPQC.post('/AddBOMVerification',AddBomVerification);

/**Router To Add PreLam Data **/
IPQC.post("/AddPreLam",AddPreLam);

/** Router To Add Framing Detail */
IPQC.post('/AddFraming',AddFraming);

/**Router To Add Sealent Weight */
IPQC.post('/AddSealentWeight',AddSealentWeight);

/**Router to Get Pdf */
IPQC.get('/Pdf/:filename',GetPdf);

/** Middleware to check Role Authentication */
IPQC.use(RoleAuthentication);

/**Router To Get List Of Job Card Data */
IPQC.post('/GetJobCardList',JobCardList);


/** Router to Get Specific Job Card */
IPQC.post('/GetSpecificeJobCard',GetSpecificJobCard);

/** Get Specific Bom Verification */
IPQC.post('/GetSpecificBOMVerification',GetSpecificBOMVerification);

/**Router to Get Specific PreLam */
IPQC.post('/GetSpecificPreLam',GetSpecificPreLam);

/**Router to Get Specific Framing  */
IPQC.post('/GetSpecificFraming',GetSpecificFraming);

/**Router To Update Status Of Job Card  */
IPQC.post('/UpdateJobCardStatus',UpdateJobCardStatus);

/**Router to Update Status of BOM Verification */
IPQC.post('/UpdateBOMStatus',UpdateStatusBOM);

/**Router to Update Status of Pre Lam  */
IPQC.post('/UpdatePreLamStatus',UpdatePreLamStatus);

/**Router to Update Status of Framing  */
IPQC.post('/UpdateFramingStatus',UpdateFramingStatus);

module.exports = {IPQC}  