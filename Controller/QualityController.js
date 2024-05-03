const { v4: uuidv4, v4 } = require('uuid');
const { dbConn } = require('../db.config/db.config')
const util = require('util');
const fs = require('fs');
const Path = require('path');
const { getCurrentDateTime, s3, ExcelGenerate } = require('../Utilis/IQCSolarCellUtilis');

require('dotenv').config()


/** Making Sync To Query to Loop */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);



/**Get Listing of Issues Type */

const IssueTypes = async(req,res)=>{
    try{
        let query = `SELECT IssueId, Issue FROM IssuesType ORDER BY Issue ASC;`

        let Issues = await queryAsync(query);
        console.log(Issues);
        res.send({Issues});
    }catch(err){
       console.log(err);
       res.send({err})
    }
}

/**Get Listing of Issues Type */

const GetModelListing = async(req,res)=>{
    try{
        let query = `SELECT ModelId, ModelName FROM ModelTypes ORDER BY ModelName ASC;`

        let Models = await queryAsync(query);
        console.log(Models);
        res.send({Models});
    }catch(err){
       console.log(err);
       res.send({err})
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
const AddQuality = async(req,res)=>{
  const {currentuser,shiftinchargename,shift,
    shiftinchargepostlime,shiftinchargeprelime,
    issuetype,otherissuetype,
    modelnumber,othermodelnumber,reasonofissue,responsibleperson,
stage,wattage,productBarcode,issuecomefrom,actiontaken} = req.body;
let UUID = v4()
try{
const query = `INSERT INTO Quality(QualityId,Shift,ShiftInChargeName,ShiftInChargePreLime,ShiftInChargePostLim,ProductBarCode,Wattage,ModelNumber,OtherModelNumber,IssueType,OtherIssueType,Stage,ResposiblePerson,ReasonOfIssue,IssueComeFrom,ActionTaken,CreatedBy,CreatedOn)
              VALUES('${UUID}','${shift}','${shiftinchargename}','${shiftinchargeprelime}','${shiftinchargepostlime}','${productBarcode}','${wattage}','${modelnumber}','${othermodelnumber}','${issuetype}','${otherissuetype}','${stage}','${responsibleperson}','${reasonofissue}','${issuecomefrom}','${actiontaken}','${currentuser}','${getCurrentDateTime()}');`;

  await queryAsync(query);
   res.send({msg:"data inserted Succesfully",UUID});
}catch(err){
  console.log(err);
  res.send({err});
}

}


module.exports = {IssueTypes,GetModelListing,AddQuality}