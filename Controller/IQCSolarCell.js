const { v4: uuidv4, v4 } = require('uuid');
const { dbConn } = require('../db.config/db.config')
const util = require('util')
/**Rename to column RMD Details */

/** Making Sync To Query to Loop */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);

// const s = [
//   '{"name":"krish","email":true}',
//   '{"name":"kkk","email":true}'
// ];

// let data = {
//   "CurrentUser": "jfidj923923923423k",
//   "SolarCellDetails": {
//     "LotNo": 3,
//     "SupplierName": "supplierNameController.text",
//     "InvoiceNo": "invoiceNoController.text",
//     "InvoiceDate": "invoiceDate",
//     "RawMaterialSpecs": "rawMaterialSpecsController.text",
//     "DateOfQualityCheck": "dateOfQualityCheck",
//     "SupplierRMBatchNo": "rMBatchNoController.text",
//     "RecieptDate": "receiptDate",
//     "DocumentNo": "GSPL/SC(I QC)/001",
//     "RevNo": "Ver2.0/13-03-2024"
//   },
//   "SolarCell": {
//     "Packaging": {
//       "Characterstics": "packagingCharactersticsController.text",
//       "MeasuringMethod": "packagingMeasuringMethodController.text",
//       "Sampling": "packagingSamplingController.text",
//       "SmapleSize": "packagingSampleSizeController.text",
//       "Reference": "packagingReferenceDocController.text",
//       "AcceptanceCriteria": "packagingAcceptanceCriteriaController.text",
//       "Samples": s
//     },
//     "Visual": {
//       "Characterstics": "visualCharactersticsController.text",
//       "MeasuringMethod": "visualMeasuringMethodController.text",
//       "Sampling": "visualSamplingController.text",
//       "Reference": "visualReferenceDocController.text",
//       "AcceptanceCriteria": "visualAcceptanceCriteriaController.text",
//       "Samples": s
//     },
//     "Physical": {
//       "Characterstics": "physicalCharactersticsController.text",
//       "MeasuringMethod": "physicalMeasuringMethodController.text",
//       "Sampling": "physicalSamplingController.text",
//       "Reference": "physicalReferenceDocController.text",
//       "AcceptanceCriteria": "physicalAcceptanceCriteriaController.text",
//       "Samples": s
//     },
//     "FrontBus": {
//       "Characterstics": "frontbusCharactersticsController.text",
//       "MeasuringMethod": "frontbusMeasuringMethodController.text",
//       "Sampling": "frontbusSamplingController.text",
//       "Reference": "frontbusReferenceDocController.text",
//       "AcceptanceCriteria": "frontbusAcceptanceCriteriaController.text",
//       "Samples": s
//     },
//     "Verification": {
//       "Characterstics": "verificationCharactersticsController.text",
//       "MeasuringMethod": "verificationMeasuringMethodController.text",
//       "Sampling": "verificationSamplingController.text",
//       "Reference": "verificationReferenceDocController.text",
//       "AcceptanceCriteria": "verificationAcceptanceCriteriaController.text",
//       "Samples": s
//     },
//     "Electrical": {
//       "Characterstics": "electricalCharactersticsController.text",
//       "MeasuringMethod": "electricalMeasuringMethodController.text",
//       "Sampling": "electricalSamplingController.text",
//       "Reference": "electricalReferenceDocController.text",
//       "AcceptanceCriteria": "electricalAcceptanceCriteriaController.text",
//       "Samples": s
//     },
//     "Performance": {
//       "Characterstics": "performanceCharactersticsController.text",
//       "MeasuringMethod": "performanceMeasuringMethodController.text",
//       "Sampling": "performanceSamplingController.text",
//       "Reference": "performanceReferenceDocController.text",
//       "AcceptanceCriteria": "performanceAcceptanceCriteriaController.text",
//       "Samples":s
//     }
//   },
//   "Rejected": {
//     "Result": "result",
//     "CheckTypes": [
//       { "Packaging": "packagingRejection" },
//       { "Visual": "visualRejection" },
//       { "Physical": "physicalRejection" },
//       { "FrontBus": "frontbusRejection" },
//       { "Verification": "verificationRejection" },
//       { "Electrical": "electricalRejection" },
//       { "Performance": "performanceRejection" },
//     ],
//     "Reason": "rejectionReasonController.text"
//   }
// };

/**to Add Solar Cell In IQC */
const AddIQCSolarCell = async (req, res) => {
   const data = req.body
  let temp;
  const UUID = v4();
  const currentDate = new Date();
  const SolarCellDetail = data['SolarCellDetails']
  const SolarCel = data['SolarCell']
  const Rejected = data['Rejected']
  try {

    /** Inserting Data in IQCSolarDetails Table */
    const SolarDetailQuery = `INSERT INTO IQCSolarDetails(SolarDetailID,LotSize,SupplierName,QuantityRecd,InvoiceDate,RMDetails,QualityCheckDate,SampleQuantityCheck,InvoiceNo,ReceiptDate,DocumentNo,RevisionNo,CheckedBy,ApprovedBy,Status,CreatedDate,UpdatedDate) 
    VALUES ('${UUID}','${SolarCellDetail['LotNo']}','${SolarCellDetail['SupplierName']}','','${SolarCellDetail['InvoiceDate']}','${SolarCellDetail['RawMaterialSpecs']}','${SolarCellDetail['DateOfQualityCheck']}','','${SolarCellDetail['InvoiceNo']}','${SolarCellDetail['RecieptDate']}','${SolarCellDetail['DocumentNo']}','${SolarCellDetail['RevNo']}','${data['CurrentUser']}','','Pending','${getCurrentDate()}','');`
   
    const result = await new Promise((resolve, reject) => {
      dbConn.query(SolarDetailQuery, (err, result) => {
        if (err) {
          console.log(err)
         return reject(err);
        } else {

          return resolve(result);
        }
      });
    });



   /** Inserting Data in IQC Solar Table */
  for (let key in SolarCel) {
    const Samples = SolarCel[key]['Samples'];
    for (let i = 0; i < Samples.length; i++) {
      Samples[i] = JSON.parse(Samples[i]);
      Samples[i] = JSON.stringify(Samples[i]);
    }

    const SolarCellQuery = `INSERT INTO IQCSolar(IQCSolarID,SolarDetailID,CheckType,Characterstics,MeasuringMethod,Sampling,Reference,AcceptanceCriteria,Samples,CreatedDate,UpdatedDate)
     VALUES ('${uuidv4()}','${UUID}','${key}','${SolarCel[key]['Characterstics']}','${SolarCel[key]['MeasuringMethod']}','${SolarCel[key]['Sampling']}','${SolarCel[key]['Reference']}','${SolarCel[key]['AcceptanceCriteria']}','[${Samples}]','${getCurrentDate()}','');`;

    const Solar = await queryAsync(SolarCellQuery);
    temp = Solar;
    console.log("nn", Solar);
    console.log(key);
  }


    /** Inserting Data in Rejected Table */
    let checkTypes = []
    for(let i = 0; i<Rejected['CheckTypes'].length; i++){
        checkTypes.push(JSON.stringify(Rejected['CheckTypes'][i]))
    }
    console.log(checkTypes)
    const RejectedQuery = `INSERT INTO Rejected(RejectedID,SolarDetailID,CheckTypes,Reason,Result,CreatedDate,UpdatedDate)
 VALUES ('${v4()}','${UUID}','[${checkTypes}]','${Rejected['Reason']}','${Rejected['Result']}','${getCurrentDate()}','');`
    const Reject = await queryAsync(RejectedQuery);
console.log(Reject,result);
    res.send({msg:'Data Inserted SuccesFully !'})
  } catch (err) {
   
  
  res.status(401).send(err)
  }
}

/** to Get current Date */
function getCurrentDate() {
  const date = new Date();
  const day = String(date.getDate()).padStart(2, '0');
  const month = String(date.getMonth() + 1).padStart(2, '0');
  const year = date.getFullYear();
  return `${day}-${month}-${year}`;
}


/** Export Controllers */
module.exports = { AddIQCSolarCell }


// {
//   "result": {
//       "fieldCount": 0,
//       "affectedRows": 1,
//       "insertId": 0,
//       "serverStatus": 2,
//       "warningCount": 0,
//       "message": "",
//       "protocol41": true,
//       "changedRows": 0
//   }
// }

// {
//   "fieldCount": 0,
//   "affectedRows": 1,
//   "insertId": 0,
//   "serverStatus": 2,
//   "warningCount": 0,
//   "message": "",
//   "protocol41": true,
//   "changedRows": 0
// }