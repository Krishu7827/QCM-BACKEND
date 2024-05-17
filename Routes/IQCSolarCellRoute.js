const express = require('express');
const IQCSolarCellRoute = express.Router()
const {AddIQCSolarCell, GetIQCSolarCellTests,GetSpecificSolarCellTest,UpdateStatus,UploadPdf,GetPdf,GetExcel} = require('../Controller/IQCSolarCell');
const {AddFQC,GetFQCList,GetSpecificFQC,FQCUpdateStatus,UploadFQCPdf} = require('../Controller/IQCFQC.Controller')
const {RoleAuthentication,upload} = require('../Middleware/IQCSolarCell.Middleware')
const {FQCUpload} = require('../Middleware/FQC.Middleware')

/** to add IQC Solar Cell  */
IQCSolarCellRoute.post('/AddIQCSolarCell',AddIQCSolarCell)

/**to Upload PDF */
IQCSolarCellRoute.post('/UploadPdf',upload,UploadPdf)

/** to Get Upload Pdf */
IQCSolarCellRoute.get('/Pdf/:filename',GetPdf)

/** to Get Upload Excel */
IQCSolarCellRoute.get('/Excel/:filename',GetExcel)

/**to Upload PDF */
IQCSolarCellRoute.post('/UploadFQCPdf',FQCUpload.single('FQCPdf'),UploadFQCPdf)

/**to Add FQC Data in FQCDetails Table And FQCTest Table */
IQCSolarCellRoute.post('/AddFQC',AddFQC);

/** Middleware To Role Authentication  */
//IQCSolarCellRoute.use(RoleAuthentication)

/** to Get All tests with checked Person*/
IQCSolarCellRoute.post('/GetIQCTests',GetIQCSolarCellTests)

/** to Get Specific Test */
IQCSolarCellRoute.post('/GetSpecificTest',GetSpecificSolarCellTest)

/** to Update Status of Solar Cell Details Table and Creating new Column in ApprovalStatus table*/
IQCSolarCellRoute.post('/UpdateStatus',UpdateStatus)

/**to Get FQC Card List */
IQCSolarCellRoute.post('/FQCList',GetFQCList)

/**to Get Specific FQC Detail */
IQCSolarCellRoute.post('/GetSpecificFQC',GetSpecificFQC)

/**To Update Status of Aprrove in FQC Table */
IQCSolarCellRoute.post('/FQCUpdateStatus',FQCUpdateStatus)

/** Exporting Routes */
module.exports = {IQCSolarCellRoute}
//2d8d6fd9-0870-4e73-b0cf-27eac2451f0e_100636f5-2f2f-4dbb-9073-ceba2e5694b4_a426b3c5-95da-4339-9b57-7123376d4c04_DocScanner%20Apr%204%2C%202024%2017-16.pdf1712231362475369.pdf1713515233801362.p