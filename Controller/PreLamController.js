const { v4: uuidv4, v4 } = require('uuid');
const { getCurrentDateTime, s3 } = require('../Utilis/PreLamUtilis');
const util = require('util');
const { dbConn } = require('../db.config/db.config');


/** Making Sync To Query */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);

// let data = [{
//   "PreLamDetaildId": "024eb029-af7d-4947-b16f-801473771068",
//   "CurrentUser": "5a114928-e8f3-11ee-b439-0ac93defbbf1",
//   "DocNo": "GSPL/IPQC/IPC/003",
//   "RevNo": "1.0 dated 12.08.2023",
//   "Date": "DayController.text",
//   "Shift": "shiftController.text",
//   "Line": "lineController.text",
//   "PONo": "PoController.text"
// }, [
//   {
//     "Stage": "Glass Loader",
//     "CheckPoint": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderGlassDimensionController.text",
//       "Avaibility of WI": "GlassLoaderAvaibilityController.text",
//     },
//     "AcceptanceCriteria": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderCriteria1Controller.text",
//       "Avaibility of WI": "GlassLoaderCriteria2Controller.text"
//     },
//     "Frequency": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderFreqquency1Controller.text",
//       "Avaibility of WI": "GlassLoaderFrequency2Controller.text"
//     },
//     "Remark": "GlassLoaderRemarkController.text"
//   },
//   {
//     "Stage": "Glass side EVA cutting machine",
//     "CheckPoint": {
//       "EVA dimension{LengthxWidthxThickness}": "GlassEVADimensionController.text",
//       "Cutting edge of EVA": "GlasCuttingEdgeController.text",
//       "Position of front EVA": ""
//     },
//     "AcceptanceCriteria": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderCriteria1Controller.text",
//       "Avaibility of WI": "GlassLoaderCriteria2Controller.text"
//     },
//     "Frequency": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderFreqquency1Controller.text",
//       "Avaibility of WI": "GlassLoaderFrequency2Controller.text"
//     },
//     "Remark": "GlassLoaderRemarkController.text"
//   },
//   {
//     "Stage": "Cell Loading",
//     "CheckPoint": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderGlassDimensionController.text",
//       "string length & cell to cell Gap": ["kdfksd", "ksdfksdfk"]
//     },
//     "AcceptanceCriteria": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderCriteria1Controller.text",
//       "Avaibility of WI": "GlassLoaderCriteria2Controller.text"
//     },
//     "Frequency": {
//       "Glass dimension(LengthxWidthxThickness)": "GlassLoaderFreqquency1Controller.text",
//       "string length & cell to cell Gap": "5 String"
//     },
//     "Remark": "GlassLoaderRemarkController.text"
//   }

// ]];

const AddPreLam = async (req, res) => {
  const PreLamDetail = req.body[0];
  const PreLam = req.body[1];
  const PreLamDetailId = PreLamDetail['PreLamDetailId']
  const UUID = v4();
  if (!PreLamDetailId) {
    try {
      const PreLamDetailQuery = `INSERT INTO PreLamDetail(PreLamDetailId,Type,DocNo,RevNo,Date,Shift,Line,PONo,CheckedBy,CreatedBy,CreatedOn,Status)
                                          VALUES('${UUID}','PreLam','${PreLamDetail['DocNo']}','${PreLamDetail['RevNo']}','${PreLamDetail['Date']}','${PreLamDetail['Shift']}','${PreLamDetail['Line']}','${PreLamDetail['PONo']}','${PreLamDetail['CurrentUser']}','${PreLamDetail['CurrentUser']}','${getCurrentDateTime()}','${PreLamDetail['Status']}')`

      await queryAsync(PreLamDetailQuery);

      PreLam.forEach(async (Lam) => {

        const PreLamQuery = `INSERT INTO PreLam(PreLamId,PreLamDetailId,Stage,CheckPoint,Frequency,AcceptanceCriteria,Remark)
                                          VALUES('${v4()}','${UUID}','${Lam['Stage']}','${JSON.stringify(Lam['CheckPoint'])}','${JSON.stringify(Lam['Frequency'])}','${JSON.stringify(Lam['AcceptanceCriteria'])}','${Lam['Remark']}');`
        await queryAsync(PreLamQuery);

      })
      res.send({ msg: 'Data Inserted Succesfully !', UUID });
    } catch (err) {
      console.log(err)
      res.status(400).send(err);
    }
  } else {

    try {
      const PreLamDetailQuery = `UPDATE PreLamDetail
   SET
     DocNo = '${PreLamDetail['DocNo']}',
     RevNo = '${PreLamDetail['RevNo']}',
     Date = '${PreLamDetail['Date']}',
     Shift = '${PreLamDetail['Shift']}',
     Line = '${PreLamDetail['Line']}',
     PONo = '${PreLamDetail['PONo']}',
     CheckedBy = '${PreLamDetail['CurrentUser']}',
     CreatedBy = '${PreLamDetail['CurrentUser']}',
     Status = '${PreLamDetail['Status']}'
   WHERE PreLamDetailId = '${PreLamDetailId}';
     `
      await queryAsync(PreLamDetailQuery);

      PreLam.forEach(async (Lam) => {
        // const PreLamQuery = `INSERT INTO PreLam(PreLamId,PreLamDetailId,Stage,CheckPoint,Frequency,AcceptanceCriteria,Remark)
        // VALUES('${v4()}','${UUID}','${Lam['Stage']}','${JSON.stringify(Lam['CheckPoint'])}','${JSON.stringify(Lam['Frequency'])}','${JSON.stringify(Lam['AcceptanceCriteria'])}','${Lam['Remark']}');`

        const PreLamQuery = `UPDATE PreLam
     SET
       CheckPoint = '${JSON.stringify(Lam['CheckPoint'])}',
       Frequency = '${JSON.stringify(Lam['Frequency'])}',
       AcceptanceCriteria = '${JSON.stringify(Lam['AcceptanceCriteria'])}',
       Remark = '${Lam['Remark']}'
     WHERE PreLamDetailId = '${PreLamDetailId}' AND Stage = '${Lam['Stage']}';
       `
        await queryAsync(PreLamQuery);
      })
      res.send({ msg: 'Data Inserted Succesfully !',UUID:PreLamDetailId });
    } catch (err) {
      
      console.log(err)
      res.status(400).send({err})
    }
  }

}


const PreLamUploadPdf = async (req, res) => {

  const { JobCardDetailId } = req.body;
  console.log(req.file)
  /** Uploading PDF in S3 Bucket */
  try {
    const ReferencePdf = await new Promise((resolve, reject) => {
      s3.upload({
        Bucket: process.env.AWS_BUCKET_2,
        Key: `IPQC/${JobCardDetailId}_${req.file.originalname}`,
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



    const query = `UPDATE PreLamDetail
    set PreLamPdf = '${ReferencePdf.Location}'
   WHERE PreLamDetailId = '${JobCardDetailId}';`;

    const update = await queryAsync(query);
    res.send({ msg: 'Data Inserted SuccesFully !', URL: ReferencePdf.Location });
  } catch (err) {
    console.log(err);
    res.status(401).send(err);
  }
}


const GetSpecificPreLam = async(req,res)=>{
const {JobCardDetailId} = req.body
try{
  const query = `SELECT *FROM PreLamDetail PD
  JOIN PreLam PL ON PD.PreLamDetailId = PL.PreLamDetailId
  WHERE PD.PreLamDetailId = '${JobCardDetailId}';`

    const PreLam = await queryAsync(query)
   
    let response = {}

    PreLam.forEach((Lam,i)=>{
      if(Lam['Stage'] == 'Tabber & Stringer'){
        JSON.parse(Lam['Frequency']['Visual Check after stringer Number of Created Input text']);
        JSON.parse(Lam['Frequency']['EI image of string  Number of Created Input text']);
      }
         if(i == 0){
             response['PreLamDetailId'] = Lam['PreLamDetailId'];
             response['DocNo'] = Lam['DocNo'];
             response['RevNo'] = Lam['RevNo'];
             response['Date'] = Lam['Date'];
             response['Shift'] = Lam['Shift'];
             response['Line'] = Lam['Line'];
             response['PONo'] = Lam['PONo'];
             response['PreLamPdf'] = Lam['PreLamPdf'];
             response['CheckedBy'] = Lam['CheckedBy'];
             response['Status'] = Lam['Status'];
         }
         const Stage = Lam['Stage'].split(' ').join('');
        response[`${Stage}CheckPoint`] = JSON.parse(Lam['CheckPoint']);
        response[`${Stage}Frequency`] = JSON.parse(Lam['Frequency']);
        response[`${Stage}AcceptanceCriteria`] = JSON.parse(Lam['AcceptanceCriteria']);
        response[`${Stage}Remark`] = Lam['Remark'];

    })
    res.send({response})
}catch(err){
  console.log(err)
  res.status(400).send({err})
}
}



const UpdatePreLamStatus = async(req,res)=>{
  const {JobCardDetailId,Status,CurrentUser} = req.body;

  try{
     const UpdateStatusQuery = `UPDATE PreLamDetail
                                SET
                                  Status = '${Status}',
                                  UpdatedBy = '${CurrentUser}',
                                  UpdatedOn = '${getCurrentDateTime()}'
                                WHERE PreLamDetailId = '${JobCardDetailId}';`;

    let UpdateStatus =  await queryAsync(UpdateStatusQuery);

    res.send({status:true,data:UpdateStatus});
  }catch(err){
    console.log(err)
    res.status(400).send({status:false,err})
  }
}


module.exports = { AddPreLam,PreLamUploadPdf,GetSpecificPreLam,UpdatePreLamStatus } 

let a = {
  "response": {
      "PreLamDetailId": "bf97b3f8-a069-44f1-b314-603b5dff845b",
      "DocNo": "GSPL/IPQC/IPC/003",
      "RevNo": "1.0 dated 12.08.2023",
      "Date": "2024-04-15",
      "Shift": "we",
      "Line": "df",
      "PONo": "678",
      "PreLamPdf": "https://qcm-pdf-project-bucket.s3.ap-south-1.amazonaws.com/IPQC/bf97b3f8-a069-44f1-b314-603b5dff845b_file-sample_150kB.pdf1713181936319431.pdf",
      "CheckedBy": "08326670-ed04-11ee-b439-0ac93defbbf1",
      "Status": "Pending",
      "LaminatorCheckPoint": {
          "Monitoring of Laminator Process parameter": "gf",
          "Adhesive on backsheet of the module": "gf",
          "Peel Adhesive Test": "bvf",
          "Gel Content Test": "fd"
      },
      "LaminatorFrequency": {
          "Monitoring of Laminator Process parameter": "Once per Shift",
          "Adhesive on backsheet of the module": "Once per Shift",
          "Peel Adhesive Test": "All Position | All Laminator Once a Week",
          "Gel Content Test": " All Position | All Laminator once a week "
      },
      "LaminatorAcceptanceCriteria": {
          "Monitoring of Laminator Process parameter": "Laminator specification GSPL/IPQC/LM/008 |  GSPL/IPQC/LM/009 |  GSPL/IPQC/LM/010",
          "Adhesive on backsheet of the module": "Teflon should be clean, No EVA residue is allowed ",
          "Peel Adhesive Test": "Eva to Glass = 70N/cm EVA to Backsheet >= 80N/cm",
          "Gel Content Test": "75 to 95% "
      },
      "LaminatorRemark": "df",
      "GlassLoaderCheckPoint": {
          "Glass dimension(LengthxWidthxThickness)": "rh",
          "Avaibility of WI": "fg"
      },
      "GlassLoaderFrequency": {
          "Glass dimension(LengthxWidthxThickness)": "Once a Shift",
          "Avaibility of WI": "Once a Shift"
      },
      "GlassLoaderAcceptanceCriteria": {
          "Glass dimension(LengthxWidthxThickness)": "Refer Production Order & Module Drawing",
          "Avaibility of WI": "Avability of WI & Operator Should be aware with WI"
      },
      "GlassLoaderRemark": "fg",
      "ModuleReworkStationCheckPoint": {
          "Avaibility of work instruvtion(WI)": "cx",
          "Method of Rework": "cx",
          "Handling of Modules": "cx",
          "Cleaning of Rework station/soldering iron sponge": "cx"
      },
      "ModuleReworkStationFrequency": {
          "Avaibility of work instruvtion(WI)": "Once per Shift",
          "Method of Rework": "Once per Shift",
          "Handling of Modules": "Once per Shift",
          "Cleaning of Rework station/soldering iron sponge": "Once per Shift"
      },
      "ModuleReworkStationAcceptanceCriteria": {
          "Avaibility of work instruvtion(WI)": "WI Should be available at station and operator should be aware of WI",
          "Method of Rework": "As per WI",
          "Handling of Modules": "Operator Should handle the rework module with both the Hands",
          "Cleaning of Rework station/soldering iron sponge": "Rework station should be clean"
      },
      "ModuleReworkStationRemark": "cx",
      "AutoStringLayupCheckPoint": {
          "Cell to cell gap": "vb",
          "String to string gap": "gfg",
          "cell edge to glass edge(Top,bottom & sides)": "gn"
      },
      "AutoStringLayupFrequency": {
          "Cell to cell gap": "Once per Shift",
          "String to string gap": "Once per Shift",
          "cell edge to glass edge(Top,bottom & sides)": "Once per Shift"
      },
      "AutoStringLayupAcceptanceCriteria": {
          "Cell to cell gap": "None",
          "String to string gap": "None",
          "cell edge to glass edge(Top,bottom & sides)": "None"
      },
      "AutoStringLayupRemark": "gh",
      "CellLoadingCheckPoint": {
          "cellcolor": "fh",
          "cleanlines of cell Loading Area ": "fh",
          "Cell loading as per WI": "rg",
          "Avability of WI ": "th",
          "Verification of process parameter": "th",
          "string length & cell to cell gap": "gh"
      },
      "CellLoadingFrequency": {
          "cell color": "Thrice per Shift",
          "cleanlines of cell Loading Area ": "Once per Shift",
          "Cell loading as per WI": "Once Per Shift",
          "Avability of WI ": "Once per Shift ",
          "Verification of process parameter": "Once per Shift",
          "string length & cell to cell gap": "5 string/stringer/shift ",
          "string length Number of String": "",
          "string length Number of String Number of Created Input text": "[]"
      },
      "CellLoadingAcceptanceCriteria": {
          "cell color": "Different Color of cell loading at a time not allowed",
          "cleanlines of cell Loading Area ": "no unwanted or waste material should be near cell Loading Area",
          "Cell loading as per WI": "As per WI",
          "Avability of WI ": "",
          "Verification of process parameter": "As pe Machine per Specification ",
          "string length & cell to cell gap": "Refer Production Order 7 Module Drawing"
      },
      "CellLoadingRemark": "fh",
      "StringReworkstationCheckPoint": {
          "Avaibility of work instruvtion(WI)": "cx",
          "Cleaning of Rework station/soldering iron sponge": "cx"
      },
      "StringReworkstationFrequency": {
          "Avaibility of work instruvtion(WI)": "Once per Shift",
          "Cleaning of Rework station/soldering iron sponge": "Once per Shift"
      },
      "StringReworkstationAcceptanceCriteria": {
          "Avaibility of work instruvtion(WI)": "WI Should be available at station and operator should be aware of WI",
          "Cleaning of Rework station/soldering iron sponge": "Rework Station should be Clean"
      },
      "StringReworkstationRemark": "xc",
      "Tabber&StringerCheckPoint": {
          "Visual Check after stringer": "fg",
          "EI image of string": "ajy",
          "Verification of sildering peel strength": "rt",
          "Avaibility os Specification & WI": "fg"
      },
      "Tabber&StringerFrequency": {
          "Visual Check after stringer": "5 string/stringer/shift ",
          "Visual Check after stringer Number of Stringer": "1",
          "Visual Check after stringer Number of Created Input text ": "[{TabberVisualStringerControllers1: fg}, {TabberVisualStringerControllers2: fh}, {TabberVisualStringerControllers3: gh}, {TabberVisualStringerControllers4: rh}, {TabberVisualStringerControllers5: df}]",
          "EI image of string": "5 string/stringer/shift ",
          "EI image of string  Number of Stringer ": "1",
          "EI image of string  Number of Created Input text ": "[{TabberEIimageofStringerControllers1: fg}, {TabberEIimageofStringerControllers2: fh}, {TabberEIimageofStringerControllers3: uu}, {TabberEIimageofStringerControllers4: ui}, {TabberEIimageofStringerControllers5: io}]",
          "Verification of sildering peel strength": "2 string/stringer/shift ",
          "Verification of sildering peel strength  Number of Stringer ": "1",
          "Verification of sildering peel strength Created Inputtext": "[{TabberVerificationofsilderingControllers1: fg}, {TabberVerificationofsilderingControllers2: rt}, {TabberVerificationofsilderingControllers3: dg}, {TabberVerificationofsilderingControllers4: rd}, {TabberVerificationofsilderingControllers5: ch}]",
          "Avaibility os Specification & WI": "Once per Shift"
      },
      "Tabber&StringerAcceptanceCriteria": {
          "Visual Check after stringer": "As per pre Lam Visual Criteria",
          "EI image of string": "As per pre Lam EI Criteria ",
          "Verification of sildering peel strength": ">=0.5N  |  Refer:GSPL/IPQC/GP/001",
          "Avaibility os Specification & WI": "Avaibility of specification and wi & operator should be aware with specification"
      },
      "Tabber&StringerRemark": "rh",
      "AutoBussing&TappingCheckPoint": {
          "Soldering Peel strength between Ribbon to bushbar interconnector": "gh",
          "Terminal busbar to edge of cell": "fb",
          "soldering quality of Ribbon to busbar": "xc",
          "Clearance between RFID&Logo patch to cell in module": "sd",
          "Position verification of RFID& Logo Patch on Module": "fg",
          "Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass": "xc",
          "quality of auto taping": "cv",
          "Avaibility of specification & WI": "bc"
      },
      "AutoBussing&TappingFrequency": {
          "Soldering Peel strength between Ribbon to bushbar interconnector": "Once per Shift",
          "Terminal busbar to edge of cell": "Once per Shift",
          "soldering quality of Ribbon to busbar": "Once per Shift",
          "Clearance between RFID&Logo patch to cell in module": "Thrice per Shift",
          "Position verification of RFID& Logo Patch on Module": "Thrice per Shift",
          "Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass": "Thrice per Shift",
          "quality of auto taping": "Once per Shift",
          "Avaibility of specification & WI": "Once per Shift"
      },
      "AutoBussing&TappingAcceptanceCriteria": {
          "Soldering Peel strength between Ribbon to bushbar interconnector": ">=4N | Refer",
          "Terminal busbar to edge of cell": "As per respective Layup Drawing",
          "soldering quality of Ribbon to busbar": "No Dry Soldering",
          "Clearance between RFID&Logo patch to cell in module": "Should not be 2mm-4mm gapfrom the cell to the patch",
          "Position verification of RFID& Logo Patch on Module": "Shiould not be tilt,Busbar should not visible",
          "Top & Bottom Creepage Distance/Terminal busbar to Edge of Glass": "creepage distance should be 16+-1mm",
          "quality of auto taping": "No poor taping,cell shifting,cell breakage",
          "Avaibility of specification & WI": "Avaibility of specification & WI & operator should be aware of specification "
      },
      "AutoBussing&TappingRemark": "ds",
      "PrelaminationEL&VisualCheckPoint": {
          "EI Inspection": "vc",
          "Visual inspection": "vc",
          "Avaibility of acceptance criteria & WI": "vc"
      },
      "PrelaminationEL&VisualFrequency": {
          "EI Inspection after stringer": "5 Pieces Per Shift ",
          "EI Inspection after stringer Number of Stringer": "1",
          "EI Inspection after stringer Number of Created Input text ": "[{PreLaminationEIinspectionrControllers1: cx}, {PreLaminationEIinspectionrControllers2: cx}, {PreLaminationEIinspectionrControllers3: cx}, {PreLaminationEIinspectionrControllers4: xc}, {PreLaminationEIinspectionrControllers5: cx}]",
          "Visual inspection of string": "5 Pieces Per Shift ",
          "Visual inspection of string  Number of Stringer ": "1",
          "Visual inspection of string  Number of Created Input text ": "[{PreLaminationVisualinspectionrControllers1: vc}, {PreLaminationVisualinspectionrControllers2: cvx}, {PreLaminationVisualinspectionrControllers3: c}, {PreLaminationVisualinspectionrControllers4: vcv}, {PreLaminationVisualinspectionrControllers5: c}]",
          "Avaibility of acceptance criteria & WI": "Once per Shift"
      },
      "PrelaminationEL&VisualAcceptanceCriteria": {
          "EI Inspection": "EI image should fulfil the EL Acceptance Critoria ",
          "Visual inspection": "Visual image should fulfil the Visual Acceptance Critoria as per GSPL/IPQC/EL/020",
          "Avaibility of acceptance criteria & WI": "Avaibility of Acceptance Criteria and operator should be aware of Criteria"
      },
      "PrelaminationEL&VisualRemark": "vc",
      "Temperature&Relativehumidity(%RH)monitoringCheckPoint": {
          "shop floor Temperature condition": "fg",
          "Relative humidity(%RH)in shop floor": "fg"
      },
      "Temperature&Relativehumidity(%RH)monitoringFrequency": {
          "shop floor Temperature condition": "Once a Shift",
          "Relative humidity(%RH)in shop floor": "Once per Shift"
      },
      "Temperature&Relativehumidity(%RH)monitoringAcceptanceCriteria": {
          "shop floor Temperature condition": "Temperature: 25+/- °C",
          "Relative humidity(%RH)in shop floor": "Humidity(%RH)<= 60%"
      },
      "Temperature&Relativehumidity(%RH)monitoringRemark": "fg",
      "GlasssideEVAcuttingmachineCheckPoint": {
          "EVA dimension{LengthxWidthxThickness}": "fg",
          "Cutting Edge EVA ": "dg",
          "Position of front EVA": "dg",
          "Avability of Specification & WI": "gh"
      },
      "GlasssideEVAcuttingmachineFrequency": {
          "EVA dimension{LengthxWidthxThickness}": "Once a Shift",
          "Cutting Edge EVA ": "Once a Shift",
          "Position of front EVA": "Once a Shift",
          "Avability of Specification & WI": "Once a Shift"
      },
      "GlasssideEVAcuttingmachineAcceptanceCriteria": {
          "EVA dimension{LengthxWidthxThickness}": "Refer Production order & Module Drawing",
          "Cutting Edge EVA ": "Should not be uneven",
          "Position of front EVA": "Shifting of EVA on Glass not allowed",
          "Avability of Specification & WI": "Avability of Specification and WI & operator should be aware with specification"
      },
      "GlasssideEVAcuttingmachineRemark": "gh",
      "EVA/BacksheetcuttingCheckPoint": {
          "Rear EVA dimension & sift cutting width(mm)": "ds",
          "Back-sheet dimension& slit cutting diameter": "vc",
          "cutting Edge of Rear EVA & Backsheet on Glass": "vc",
          "Position of Back EVA & Backsheet on Glass": "cv",
          "Avaibility of specification&wI.": "xc"
      },
      "EVA/BacksheetcuttingFrequency": {
          "Rear EVA dimension & sift cutting width(mm)": "Once per Shift",
          "Back-sheet dimension& slit cutting diameter": "Once per Shift",
          "cutting Edge of Rear EVA & Backsheet on Glass": "Once per Shift",
          "Position of Back EVA & Backsheet on Glass": "Once per Shift",
          "Avaibility of acceptance criteria & WI": "Once per Shift"
      },
      "EVA/BacksheetcuttingAcceptanceCriteria": {
          "Rear EVA dimension & sift cutting width(mm)": "As per Specification GSPL/EVA(IQC)/001 & production order",
          "Back-sheet dimension& slit cutting diameter": "As per Specification GSPL/BS(IQC)/001 & production order",
          "cutting Edge of Rear EVA & Backsheet on Glass": "Should not be uneven",
          "Position of Back EVA & Backsheet on Glass": "Shifting of EVA on Glass not allowed",
          "Avaibility of specification&wI.": "xc"
      },
      "EVA/BacksheetcuttingRemark": "vc",
      "CellcuttingmachineCheckPoint": {
          "cell Size": "gh",
          "Cell manufacture & Eff.": "rt",
          "cell color ": "yu",
          "Avability of Specification & WI.": "gh"
      },
      "CellcuttingmachineFrequency": {
          "cell Size": "Thrice per shift",
          "Cell manufacture & Eff.": "Thrice per Shift",
          "cell color ": "Thrice per Shift",
          "Avability of Specification & WI.": "Once a Shift"
      },
      "CellcuttingmachineAcceptanceCriteria": {
          "cell Size": "Refere Production Order",
          "Cell manufacture & Eff.": "Refer Production Order",
          "cell color ": "Proper Segregation should be done as per color mixing not allowed",
          "Avability of Specification & WI.": "Avability of WI & Operator should be aware with WI"
      },
      "CellcuttingmachineRemark": "ry"
  }
}