const express = require('express')
const {AddIPQCJobCard,JobCardList,UploadPdf,GetSpecificJobCard,UpdateJobCardStatus} = require('../Controller/IPQCJobCard')
const {RoleAuthentication,upload} = require('../Middleware/IPQC.Middleware')
const IPQCJobCardRouter = express.Router();





/** Route To Add Job Card */
IPQCJobCardRouter.post('/AddJobCard',AddIPQCJobCard);

/** Router to Upload Reference Pdf in S3 and Get The Location and Set into dbs */
IPQCJobCardRouter.post('/UploadPdf',upload.single('Reference'),UploadPdf)


/** Middleware to check Role Authentication */
IPQCJobCardRouter.use(RoleAuthentication)

/**Router To Get List Of Job Card Data */
IPQCJobCardRouter.post('/GetJobCardList',JobCardList)


/** Router to Get Specific Job Card */
IPQCJobCardRouter.post('/GetSpecificeJobCard',GetSpecificJobCard)


/**Router To Update Status Of Job Card  */
IPQCJobCardRouter.post('/UpdateJobCardStatus',UpdateJobCardStatus)


module.exports = {IPQCJobCardRouter}