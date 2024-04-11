const { v4: uuidv4, v4 } = require('uuid');
const { getCurrentDateTime, s3 } = require('../Utilis/PreLamUtilis');
const util = require('util');
const { dbConn } = require('../db.config/db.config');


/** Making Sync To Query */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);

// let data = [{
//     "CurrentUser":"5a114928-e8f3-11ee-b439-0ac93defbbf1",
//     "DocNo":"GSPL/IPQC/IPC/003",
//     "RevNo":"1.0 dated 12.08.2023",
//     "Date":"DayController.text",
//     "Shift":"shiftController.text",
//     "Line":"lineController.text",
//     "PONo":"PoController.text"
//   },[
//     {
//       "Stage":"Glass Loader",
//       "CheckPoint":{
//         "Glass dimension(LengthxWidthxThickness)":"GlassLoaderGlassDimensionController.text",
//         "Avaibility of WI":"GlassLoaderAvaibilityController.text",
//       },
//       "AcceptanceCriteria":{
//         "Glass dimension(LengthxWidthxThickness)":"GlassLoaderCriteria1Controller.text",
//         "Avaibility of WI":"GlassLoaderCriteria2Controller.text"
//       },
//       "Frequency":{
//         "Glass dimension(LengthxWidthxThickness)":"GlassLoaderFreqquency1Controller.text",
//         "Avaibility of WI":"GlassLoaderFrequency2Controller.text"
//       },
//       "Remark":"GlassLoaderRemarkController.text"
//     },
//    {
//       "Stage":"Glass side EVA cutting machine",
//       "CheckPoint":{
//         "EVA dimension{LengthxWidthxThickness}":"GlassEVADimensionController.text",
//         "Cutting edge of EVA": "GlasCuttingEdgeController.text",
//         "Position of front EVA":""
//       },
//       "AcceptanceCriteria":{
//         "Glass dimension(LengthxWidthxThickness)":"GlassLoaderCriteria1Controller.text",
//         "Avaibility of WI":"GlassLoaderCriteria2Controller.text"
//       },
//       "Frequency":{
//         "Glass dimension(LengthxWidthxThickness)":"GlassLoaderFreqquency1Controller.text",
//         "Avaibility of WI":"GlassLoaderFrequency2Controller.text"
//       },
//       "Remark":"GlassLoaderRemarkController.text"
//     },
//  {
//       "Stage":"Cell Loading",
//       "CheckPoint":{
//         "Glass dimension(LengthxWidthxThickness)":"GlassLoaderGlassDimensionController.text",
//         "string length & cell to cell Gap":["kdfksd","ksdfksdfk"]
//       },
//       "AcceptanceCriteria":{
//         "Glass dimension(LengthxWidthxThickness)":"GlassLoaderCriteria1Controller.text",
//         "Avaibility of WI":"GlassLoaderCriteria2Controller.text"
//       },
//       "Frequency":{
//         "Glass dimension(LengthxWidthxThickness)": "GlassLoaderFreqquency1Controller.text",
//         "string length & cell to cell Gap":"5 String"
//       },
//       "Remark": "GlassLoaderRemarkController.text"
//     }
    
//   ]];

const AddPreLam = async(req,res)=>{
  console.log(req.body)
  const PreLamDetail = req.body[0];
  const PreLam = req.body[1];
  const UUID = v4();
 try{
  const PreLamDetailQuery = `INSERT INTO PreLamDetail(PreLamDetailId,Type,DocNo,RevNo,Date,Shift,Line,PONo,CheckedBy,CreatedBy,CreatedOn,Status)
                                          VALUES('${UUID}','PreLam','${PreLamDetail['DocNo']}','${PreLamDetail['RevNo']}','${PreLamDetail['Date']}','${PreLamDetail['Shift']}','${PreLamDetail['Line']}','${PreLamDetail['PONo']}','${PreLamDetail['CurrentUser']}','${PreLamDetail['CurrentUser']}','${getCurrentDateTime()}','${PreLamDetail['Status']}')`

        await queryAsync(PreLamDetailQuery);
    
        PreLam.forEach(async(Lam)=>{
          const PreLamQuery = `INSERT INTO PreLam(PreLamId,PreLamDetailId,Stage,CheckPoint,Frequency,AcceptanceCriteria,Remark)
                                          VALUES('${v4()}','${UUID}','${Lam['Stage']}','${JSON.stringify(Lam['CheckPoint'])}','${JSON.stringify(Lam['Frequency'])}','${JSON.stringify(Lam['AcceptanceCriteria'])}','${Lam['Remark']}')`
          await queryAsync(PreLamQuery);

        })
        res.send({ msg: 'Data Inserted Succesfully !', UUID });
 }catch(err){
   console.log(err)
   res.status(400).send(err);
 }
}


const UploadPdf = async (req, res) => {

  const { JobCardDetailId } = req.body;
  /** Uploading PDF in S3 Bucket */
  try {
    const ReferencePdf = await new Promise((resolve, reject) => {
      s3.upload({
        Bucket: process.env.AWS_BUCKET_2,
        Key: `${JobCardDetailId}_${req.file.originalname}`,
        Body: req.file.buffer,
        ACL: "public-read-write",
        ContentType: req.file.mimetype
      }, (err, result) => {
        if (err) {
          reject(err)
        } else {

          resolve(result)
        }
      })
    });



    const query = `UPDATE JobCardDetails jcd
    set jcd.ReferencePdf = '${ReferencePdf.Location}'
   WHERE jcd.JobCardDetailID = '${JobCardDetailId}';`;

    const update = await queryAsync(query);
    res.send({ msg: 'Data Inserted SuccesFully !', URL: ReferencePdf.Location });
  } catch (err) {
    console.log(err);
    res.status(401).send(err);
  }
}






module.exports = {AddPreLam}