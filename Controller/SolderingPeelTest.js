const { v4: uuidv4, v4 } = require('uuid');
const { getCurrentDateTime, s3 } = require('../Utilis/PreLamUtilis');
const util = require('util');
const fs = require('fs');
const Path = require('path')
const { dbConn } = require('../db.config/db.config');


/** Making Sync To Query */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);

var data = {
    "JobCardDetailId": "",
    "Type":"",
    "DocNo": "",
    "RevNo": "",
    "RibbonMake": "",
    "CellSize": "",
    "RibbonSize": "",
    "Date": "",
    "Line": "",
    "Shift": "",
    "MachineNo": "",
    "OperatorName": "",
    "CellMake": "",
    "Status": "",
    "BussingStage": "",
    "BusBarWidth": "",
    "CreatedBy": "",
    "Remarks":"",
    "Samples": {
         "Sample1": [{ "FrontController": "dd", "BackController": "" }, { "FrontController": "drfug", "BackController": "" }], 
         "Sample2": [{ "FrontController": "dd", "BackController": "" }, { "FrontController": "xd", "BackController": "" }] 
        }
};


const AddSolderingPeelTest = async (req, res) => {
    const { JobCardDetailId, Type,Date, Remarks,DocNo, RevNo, RibbonMake, RibbonSize, CellMake, CellSize, Line, Shift, Samples, MachineNo, OperatorName, CreatedBy, Status, BusBarWidth, BussingStage } = req.body;
    const UUID = v4()
    if (!JobCardDetailId) {
        try {
            const SolderingPeelTestDetailQuery = `INSERT INTO SolderingPeelTestDetail(TestDetailId,Type,DocNo,RevNo,RibbonMake,CellSize,RibbonSize,Date,Line,Shift,MachineNo,OperatorName,CellMake,Status,BussingStage,BusBarWidth,Remarks,CreatedBy,CreatedOn)
                                    VALUES('${UUID}','${Type}','${DocNo}','${RevNo}','${RibbonMake}','${CellSize}','${RibbonSize}','${Date}','${Line}','${Shift}','${MachineNo}','${OperatorName}','${CellMake}','${Status}','${BussingStage}','${BusBarWidth}','${Remarks}','${CreatedBy}','${getCurrentDateTime()}');`
            await queryAsync(SolderingPeelTestDetailQuery);

            for( let key in Samples){
                let SampleName = key;
             const SolderingPeelTestQuery = `INSERT INTO SolderingPeelTest(TestDetailId,TestId,Track,TrackData)
                              VALUES('${UUID}','${v4()}','${SampleName}','${JSON.stringify(Samples[key])}');`
              await queryAsync(SolderingPeelTestQuery);
            }
    
            res.send({ msg: 'Data Inserted Succesfully !', UUID });
        } catch (err) {
            console.log(err)
            res.status(400).send({ err })
        }
    } else {
        try {
          const SolderingPeelTestDetailQuery = `UPDATE SolderingPeelTestDetail
          SET
              DocNo = '${DocNo}',
              RevNo = '${RevNo}',
              RibbonMake = '${RibbonMake}',
              CellSize = '${CellSize}',
              RibbonSize = '${RibbonSize}',
              Date = '${Date}',
              Line = '${Line}',
              Shift = '${Shift}',
              MachineNo = '${MachineNo}',
              OperatorName = '${OperatorName}',
              CellMake = '${CellMake}',
              Status = '${Status}',
              BussingStage = '${BussingStage}',
              BusBarWidth = '${BusBarWidth}',
              Remarks = '${Remarks}',
              CreatedBy = '${CreatedBy}',
              CreatedOn = '${getCurrentDateTime()}'
          WHERE
              TestDetailId = '${JobCardDetailId}' AND Type = '${Type}';
          `
          await queryAsync(SolderingPeelTestDetailQuery);

          for( let key in Samples){
            let SampleName = key;
         const SolderingPeelTestQuery = `UPDATE SolderingPeelTest
         SET
             TrackData = '${JSON.stringify(Samples[key])}'
         WHERE
             TestDetailId = '${UUID}' AND Track = '${SampleName}';
         `
          await queryAsync(SolderingPeelTestQuery);
        }

        res.send({ msg: 'Data Inserted Succesfully !', UUID: JobCardDetailId });
        } catch (err) {
            console.log(err)
            res.status(400).send({ err })
        }
    }
}


const UploadSolderingPeelTestPdf = async(req,res)=>{
    const { JobCardDetailId } = req.body;

    if(req.file.size){
      /** making file in IPQC-Pdf-Folder*/
      try {
         // Get the file buffer and the file format
         const fileBuffer = req.file.buffer;
         
         // Define the folder path
         const folderPath = Path.join('IPQC-Pdf-Folder');
    
         // Create the folder if it doesn't exist
         if (!fs.existsSync(folderPath)) {
    
             fs.mkdirSync(folderPath, { recursive: true });
         }
         
         // Define the file path, including the desired file name and format
         const fileName = `${JobCardDetailId}.pdf`;
         const filePath = Path.join(folderPath, fileName);
    
         // Save the file buffer to the specified file path
      fs.writeFileSync(filePath, fileBuffer);
         const query = `UPDATE SolderingPeelTestDetail
         SET Pdf = 'http://srv515471.hstgr.cloud:8080/IPQC/Pdf/${JobCardDetailId}.pdf'
         WHERE TestDetailId = '${JobCardDetailId}';`;
    const update = await queryAsync(query);
    
    // Send success response with the file URL
    res.send({ msg: 'Data inserted successfully!', URL: `http://srv515471.hstgr.cloud:8080/IPQC/Pdf/${JobCardDetailId}.pdf` });
      } catch (err) {
        console.log(err);
        res.status(401).send(err);
      }
    }else{
      res.status(401).send({status:false,'err':'file is empty'});
    }
}


module.exports = {AddSolderingPeelTest,UploadSolderingPeelTestPdf};