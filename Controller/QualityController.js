const { v4: uuidv4, v4 } = require('uuid');
const { dbConn } = require('../db.config/db.config')
const util = require('util');
const fs = require('fs');
const Path = require('path');
const { getCurrentDateTime, s3, ExcelGenerate } = require('../Utilis/IQCSolarCellUtilis');
require('dotenv').config()
const PORT = process.env.PORT || 8080

/** Making Sync To Query to Loop */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);



/**Get Listing of Issues Type */

const IssueTypes = async (req, res) => {
  try {
    let query = `SELECT IssueId, Issue FROM IssuesType ORDER BY Issue ASC;`

    let Issues = await queryAsync(query);
    console.log(Issues);
    res.send({ Issues });
  } catch (err) {
    console.log(err);
    res.send({ err })
  }
}

/**Get Listing of Issues Type */

const GetModelListing = async (req, res) => {
  try {
    let query = `SELECT ModelId, ModelName FROM ModelTypes ORDER BY ModelName ASC;`

    let Models = await queryAsync(query);
    console.log(Models);
    res.send({ Models });
  } catch (err) {
    console.log(err);
    res.send({ err })
  }
}
let a = {
  "currentuser": "personid",
  "shift": "shift",
  "shiftinchargename": "shiftinchargename",
  "shiftinchargeprelime": "shiftinchargeprelime",
  "shiftinchargepostlime": "shiftinchargepostlime",
  "productBarcode": "productBarcode",
  "wattage": "wattage",
  "modelnumber": "modelnumber",
  "othermodelnumber": "othermodelnumber",
  "issuetype": "issuetype",
  "otherissuetype": "otherissuetype",
  "stage": "stage",
  "responsibleperson": "responsibleperson",
  "reasonofissue": "reasonofissue",
  "issuecomefrom": "issuecomefrom",
  "actiontaken": "actiontaken",
}
const AddQuality = async (req, res) => {
  const { currentuser, shiftinchargename, shift,
    shiftinchargepostlime, shiftinchargeprelime,
    issuetype, otherissuetype,
    modelnumber, othermodelnumber, reasonofissue, responsibleperson,
    stage, wattage, productBarcode, issuecomefrom, actiontaken } = req.body;
  let UUID = v4()
  try {
    const query = `INSERT INTO Quality(QualityId,Shift,ShiftInChargeName,ShiftInChargePreLime,ShiftInChargePostLim,ProductBarCode,Wattage,ModelNumber,OtherModelNumber,IssueType,OtherIssueType,Stage,ResposiblePerson,ReasonOfIssue,IssueComeFrom,ActionTaken,CreatedBy,CreatedOn)
              VALUES('${UUID}','${shift}','${shiftinchargename}','${shiftinchargeprelime}','${shiftinchargepostlime}','${productBarcode}','${wattage}','${modelnumber}','${othermodelnumber}','${issuetype}','${otherissuetype}','${stage}','${responsibleperson}','${reasonofissue}','${issuecomefrom}','${actiontaken}','${currentuser}','${getCurrentDateTime()}');`;

    await queryAsync(query);
    res.send({ msg: "data inserted Succesfully", UUID });
  } catch (err) {
    console.log(err);
    res.send({ err });
  }

}

const UploadModuleImage = async (req, res) => {
  const { QualityId } = req.body;
  try {
    if (req.file.size) {
      /** making file in IPQC-Pdf-Folder*/
      try {
        // Get the file buffer and the file format
        const fileBuffer = req.file.buffer;

        // Define the folder path
        const folderPath = Path.join('Quality-Upload');

        // Create the folder if it doesn't exist
        if (!fs.existsSync(folderPath)) {

          fs.mkdirSync(folderPath, { recursive: true });
        }

        // Define the file path, including the desired file name and format
        const fileName = `${QualityId}${req.file.originalname}`;
        const filePath = Path.join(folderPath, fileName);

        // Save the file buffer to the specified file path
        fs.writeFileSync(filePath, fileBuffer);
        const query = `UPDATE Quality
         SET ModulePicture = 'http://srv515471.hstgr.cloud:${PORT}/Quality/File/${fileName}'
         WHERE QualityId = '${QualityId}';`;
        const update = await queryAsync(query);

        // Send success response with the file URL
        res.send({ msg: 'Data inserted successfully!', URL: `http://srv515471.hstgr.cloud:${PORT}/Quality/File/${fileName}` });
      } catch (err) {
        console.log(err);
        res.status(401).send(err);
      }
    }
  } catch (err) {
    res.send({ status: false, 'err': 'file is empty' })
  }
}

const QualityListing = async(req,res)=>{

 try{
   let query = `SELECT *FROM Quality ORDER BY STR_TO_DATE(CreatedOn, '%d-%m-%Y %H:%i:%s') DESC;`
   let data = await queryAsync(query);
   
   res.send({data})
 }catch(err){
  console.log(err);
  res.send({err})
 }
}

const GetModuleImage = async(req,res)=>{
  const filename = req.params.filename;
   // Define the absolute path to the IPQC-Pdf-Folder directory
   const pdfFolderPath = Path.resolve('Quality-Upload');

   // Construct the full file path to the requested file
   const filePath = Path.join(pdfFolderPath, filename);

   // Send the file to the client
   res.sendFile(filePath, (err) => {
       if (err) {
           console.error('Error sending file:', err);
          res.send(`  <h1 style="text-align: center; font: 1em sans-serif; font-size: 50px; font-weight: 500;">
          404:Not Found
      </h1>`)
       }
   });
}

module.exports = { IssueTypes, GetModelListing, AddQuality, UploadModuleImage, GetModuleImage, QualityListing }