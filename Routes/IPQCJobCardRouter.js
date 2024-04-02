const express = require('express')
const {AddIPQCJobCard,JobCardList,UploadPdf} = require('../Controller/IPQCJobCard')
const {RoleAuthentication,upload} = require('../Middleware/IPQC.Middleware')
const IPQCJobCardRouter = express.Router();





/** Route To Add Job Card */
IPQCJobCardRouter.post('/AddJobCard',AddIPQCJobCard);



/** Middleware to check Role Authentication */
IPQCJobCardRouter.use(RoleAuthentication)

/**Router To Get List Of Job Card Data */
IPQCJobCardRouter.post('/GetJobCardList',JobCardList)


/** Router to Upload Reference Pdf in S3 and Get The Location and Set into dbs */
IPQCJobCardRouter.post('/UploadPdf',upload.single('Reference'),UploadPdf)



module.exports = {IPQCJobCardRouter}