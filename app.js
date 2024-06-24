const express = require('express')
const { dbConn } = require('./db.config/db.config')
const { PersonRouter } = require('./Routes/Person.Route')
const { designationRouter } = require('./Routes/DesignationRoute')
const { IQCSolarCellRoute } = require('./Routes/IQCSolarCellRoute')
const { QualityRoute } = require('./Routes/QualityRoutes');
const {getCurrentDateTime} = require('./Utilis/IQCSolarCellUtilis')
const {MaintenanceRouter} = require('./Routes/MaintenanceRoutes')
const Path = require('path');
const { v4: uuidv4, v4 } = require('uuid');
const nodemailer = require('nodemailer')
const {QualityExcelGenerate} = require('./Utilis/QualityUtilis')
const cron = require('node-cron');
const util = require('util');
const chalk =  import('chalk');
const fs = require('fs');
const { IPQC } = require('./Routes/IPQCRoute')
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 8080
//const ExcelJS = require('exceljs');
require('dotenv').config()
app.use(express.json())
app.use(cors())

/** Making Sync To Query to Loop */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);

/** Nodemailer Configuration */
var transport = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'qualityreport.gautamsolar@gmail.com',
    pass: 'dypg tdqb wxah xafe'
  }
});

/**Endpoints */

/** to Employee */
app.use('/Employee', PersonRouter)

/** to Department and Designation */
app.use('/QCM', designationRouter)

/** to IQC Solar Cell */
app.use('/IQCSolarCell', IQCSolarCellRoute)

/**to IPQC */
app.use('/IPQC', IPQC);

/**to Quality */
app.use('/Quality', QualityRoute)


/**to Maintenance */
app.use('/Maintenance',MaintenanceRouter)

function formatDate(date) {
  const day = String(date.getDate()).padStart(2, '0');
  const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are 0-based
  const year = date.getFullYear();
  return `${day}-${month}-${year}`;
}

const QualityExcelShedule = async()=>{
  const currentDate = new Date();
  const previousDate = new Date(currentDate);
  previousDate.setDate(currentDate.getDate() - 1);

  const formattedCurrentDate = formatDate(currentDate);
  const formattedPreviousDate = formatDate(previousDate);

  let UUID = v4()
  try {
     let query = `SELECT Q.CreatedOn, Q.QualityId, Q.Shift, Q.ShiftInChargeName, Q.ShiftInChargePreLime, Q.ShiftInChargePostLim, Q.ProductBarCode, P.Name AS CreatedBy, Q.Wattage, Q.Stage, Q.ResposiblePerson, Q.ReasonOfIssue, Q.IssueComeFrom, Q.ActionTaken, Q.OtherIssueType, Q.ModulePicture,Q.Status, Q.OtherModelNumber,Q.IssueType,Q.ModelNumber, Q.CreatedTime
    FROM Quality Q
    JOIN Person P ON P.PersonID = Q.CreatedBy
    WHERE Q.Status = 'Completed' AND STR_TO_DATE(Q.CreatedOn, '%d-%m-%Y %H:%i:%s') BETWEEN STR_TO_DATE('${formattedPreviousDate} 00:00:00', '%d-%m-%Y %H:%i:%s') AND STR_TO_DATE('${formattedPreviousDate} 23:59:59', '%d-%m-%Y %H:%i:%s')
    ORDER BY STR_TO_DATE(Q.CreatedOn, '%d-%m-%Y %H:%i:%s') DESC;`;

    let Quality = await queryAsync(query);
    console.log(Quality)
   let ModelQuery = `SELECT ModelName, ModelId FROM ModelTypes;`
   let IssueQuery = `SELECT Issue, IssueId FROM IssuesType;`
   let ModelNames = await queryAsync(ModelQuery);
   let IssueNames = await queryAsync(IssueQuery);
   /** To Find name Function  */
   const findName = (Type, Id) => {
    if (Type === 'Model') {
      const model = ModelNames.find(data => data['ModelId'] === Id);
      if (model) {
        return model['ModelName'];
      }
    } else {
      const issue = IssueNames.find(data => data['IssueId'] === Id);
      if (issue) {
        return issue['Issue'];
      }
    }
    return undefined; // If no match is found, return undefined
  };
  
    for (const data of Quality) {
      if (data['ModelNumber']) {
        data['ModelName'] = findName('Model',data['ModelNumber']);

      } else {
        data['ModelName'] = '';

      }

      if (data['IssueType']) {
        data['Issue'] = findName('Issue',data['IssueType']);

      } else {
        data['Issue'] = '';

      }
      delete data['ModelNumber'];
      delete data['IssueType'];
    }

    Quality.forEach((el) => {
      if (el['Issue'] == 'Other') {
        el['Issue'] = el['OtherIssueType']

      }

      if (el['ModelName'] == 'Other') {
        el['ModelName'] = el['OtherModelNumber']

      }
      delete el['OtherIssueType'];
      delete el['OtherModelNumber'];
      el['CreatedOn'] = el['CreatedOn'].split(' ')[0];
    })

    let CompletedQualityExcelBytes = await QualityExcelGenerate(Quality, formattedPreviousDate, formattedPreviousDate, 'Completed');


    // Define the folder path
    let folderPath = Path.join('Quality-Upload');

    // Create the folder if it doesn't exist
    if (!fs.existsSync(folderPath)) {

      fs.mkdirSync(folderPath, { recursive: true });
    }

    // Define the file path, including the desired file name and format
    let fileName = `${UUID}.xlsx`;
    let filePath = Path.join(folderPath, fileName);

    // Save the file buffer to the specified file path
    fs.writeFileSync(filePath, CompletedQualityExcelBytes);

    query = `INSERT INTO QualityReportExcel(ExcelId,FromDate,ToDate,ExcelURL,CreatedBy,CreatedOn)
                                    VALUES('${UUID}','${formattedPreviousDate}','${formattedPreviousDate}','http://srv515471.hstgr.cloud:${PORT}/Quality/File/${fileName}','','${getCurrentDateTime()}');`
    await queryAsync(query);

/*** In Progress   */
UUID = v4()
     query = `SELECT Q.CreatedOn, Q.QualityId, Q.Shift, Q.ShiftInChargeName, Q.ShiftInChargePreLime, Q.ShiftInChargePostLim, Q.ProductBarCode, P.Name AS CreatedBy, Q.Wattage, Q.Stage, Q.ResposiblePerson, Q.ReasonOfIssue, Q.IssueComeFrom, Q.ActionTaken, Q.OtherIssueType, Q.ModulePicture,Q.Status, Q.OtherModelNumber,Q.IssueType,Q.ModelNumber, Q.CreatedTime
    FROM Quality Q
    JOIN Person P ON P.PersonID = Q.CreatedBy
    WHERE Q.Status = 'Inprogress' AND STR_TO_DATE(Q.CreatedOn, '%d-%m-%Y %H:%i:%s') BETWEEN STR_TO_DATE('${formattedPreviousDate} 00:00:00', '%d-%m-%Y %H:%i:%s') AND STR_TO_DATE('${formattedPreviousDate} 23:59:59', '%d-%m-%Y %H:%i:%s')
    ORDER BY STR_TO_DATE(Q.CreatedOn, '%d-%m-%Y %H:%i:%s') DESC;`;

     Quality = await queryAsync(query);
    console.log(Quality)
    ModelQuery = `SELECT ModelName, ModelId FROM ModelTypes;`
    IssueQuery = `SELECT Issue, IssueId FROM IssuesType;`
    ModelNames = await queryAsync(ModelQuery);
    IssueNames = await queryAsync(IssueQuery);
   /** To Find name Function  */
  
  
    for (const data of Quality) {
      if (data['ModelNumber']) {
        data['ModelName'] = findName('Model',data['ModelNumber']);

      } else {
        data['ModelName'] = '';

      }

      if (data['IssueType']) {
        data['Issue'] = findName('Issue',data['IssueType']);

      } else {
        data['Issue'] = '';

      }
      delete data['ModelNumber'];
      delete data['IssueType'];
    }

    Quality.forEach((el) => {
      if (el['Issue'] == 'Other') {
        el['Issue'] = el['OtherIssueType']

      }

      if (el['ModelName'] == 'Other') {
        el['ModelName'] = el['OtherModelNumber']

      }
      delete el['OtherIssueType'];
      delete el['OtherModelNumber'];
      el['CreatedOn'] = el['CreatedOn'].split(' ')[0];
    })

     let InprogressQualityExcelBytes = await QualityExcelGenerate(Quality, formattedPreviousDate, formattedPreviousDate, 'Inprogress');

    
    // Define the folder path
     folderPath = Path.join('Quality-Upload');

    // Create the folder if it doesn't exist
    if (!fs.existsSync(folderPath)) {

      fs.mkdirSync(folderPath, { recursive: true });
    }

    // Define the file path, including the desired file name and format
     fileName = `${UUID}.xlsx`;
     filePath = Path.join(folderPath, fileName);

    // Save the file buffer to the specified file path
    fs.writeFileSync(filePath, InprogressQualityExcelBytes);

    query = `INSERT INTO QualityReportExcel(ExcelId,FromDate,ToDate,ExcelURL,CreatedBy,CreatedOn)
                                    VALUES('${UUID}','${formattedPreviousDate}','${formattedPreviousDate}','http://srv515471.hstgr.cloud:${PORT}/Quality/File/${fileName}','','${getCurrentDateTime()}');`
    await queryAsync(query);

    await transport.sendMail({
      from: 'qualityreport.gautamsolar@gmail.com',
      cc: 'bhanu.galo@gmail.com',
      to: 'krishukumar535@gmail.com',
      subject: `Quality Report ${formattedPreviousDate}`,
      attachments: [{
        filename: `Quality_Report_InProgress.xlsx`,
        content: InprogressQualityExcelBytes,
        contentType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      },
      {
        filename: `Quality_Report_Completed.xlsx`,
        content: CompletedQualityExcelBytes,
        contentType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      }
    ],
      html: `<div style="position: relative; padding: 5px;">
          <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-image: url('https://galo.co.in/wp-content/uploads/2024/01/Galo-Energy-Logo-06.png'); background-size: cover; background-position: center; background-repeat: no-repeat; opacity: 0.3; z-index: -1;"></div>
          <div style="background-color: rgba(255, 255, 255, 0.8); padding: 20px; border-radius: 10px;">
              <p style="font-size: 16px;">Dear Super Admin,</p>
              <p style="font-size: 16px; margin-bottom: 0;">As Per Your Request, Quality Report generated, You will have data Of Previous Day in Excel.</p>
              <p style="font-size: 16px;">Please find the attached Excel report for more details.</p>
              <br>
              <p style="font-size: 16px;"><em>Best regards,</em></p>
              <p style="font-size: 16px;"><strong>Gautam Solar QCM Team</strong></p>
          </div>
      </div>`
    })

    return `Sent it Email Succesfully of Quality Report🚀`
  } catch (err) {
    console.log(err)
    return err
  }
}



app.get("/getFile", (req, res) => {
  const pathfile = Path.join(__dirname, 'check.png');
  res.download(pathfile);
});


// cron.schedule('35 17 * * *', async () => {
//   try {
   
//     let result =  await QualityExcelShedule();
//    console.log((await chalk).default.blueBright(result));

//   } catch (error) {
//     console.error((await chalk).default.red('Error in cron job:', error));
//     //console.error('Error in cron job:', error);
//   }
// }, {
//   timezone: 'Asia/Kolkata' 
// });

const SealentExcel = async() =>{
  let Data = [{"PreLamDetailId":"27f8c639-e23b-4070-ab8a-217ff678d551", "SealentWeightId":"06c3628b-22d1-49ea-9c00-94acc187c4de", "Stage":"Long Frame", "WithoutSealant":"110", "WithSealant":"220", "DiffWeight":"110.0", "BaseWeight":"18.59g", "CatalystWeight":"3.06g", "Ratio":"6.01g", "PreLamDetailId":"27f8c639-e23b-4070-ab8a-217ff678d551", "DocNo":"GSPL\/IPQC\/SP\/012", "RevNo":"1.0\/12.08.2023", "Date":"2024-05-16", "Shift":"Night Shift", "Line":null, "PONo":null, "CheckedBy":"af305f2c-0b9b-11ef-8005-52549f6cc694", "CreatedBy":"af305f2c-0b9b-11ef-8005-52549f6cc694", "UpdatedBy":"ada6d45d-0b78-11ef-8005-52549f6cc694", "CreatedOn":"15-05-2024 20:59:54", "UpdatedOn":"01-06-2024 06:38:45", "Status":"Approved", "Type":"Sealent", "PreLamPdf":"http:\/\/srv515471.hstgr.cloud:9090\/IPQC\/Pdf\/27f8c639-e23b-4070-ab8a-217ff678d551.pdf", "Location":null, "PersonID":"af305f2c-0b9b-11ef-8005-52549f6cc694", "EmployeeID":"10462", "Name":"gaurav", "LoginID":"gaurav", "Password":"gaurav@4126", "WorkLocation":"fc9c906b-e817-11ee-b439-0ac93defbbf1", "Email":"krishukumar7827@gmail.com", "Department":"849b50dd-e816-11ee-b439-0ac93defbbf1", "ProfileImg":"http:\/\/srv515471.hstgr.cloud:9090\/Employee\/Profile\/af305f2c-0b9b-11ef-8005-52549f6cc694gaurav1714994879458274.jpg", "Desgination":"1af9d9f7-e817-11ee-b439-0ac93defbbf1", "Status":"Active", "UpdatedBy":null, "UpdatedOn":null, "CreatedBy":"b570e501-f8c7-11ee-b439-0ac93defbbf1", "CreatedOn":"06-05-2024 11:27:55"},
  {"PreLamDetailId":"27f8c639-e23b-4070-ab8a-217ff678d551", "SealentWeightId":"46602aab-512e-48cc-986a-0d629cb190df", "Stage":"Junction Box", "WithoutSealant":"138", "WithSealant":"157", "DiffWeight":"19.0", "BaseWeight":"18.59g", "CatalystWeight":"3.06g", "Ratio":"6.01g", "PreLamDetailId":"27f8c639-e23b-4070-ab8a-217ff678d551", "DocNo":"GSPL\/IPQC\/SP\/012", "RevNo":"1.0\/12.08.2023", "Date":"2024-05-16", "Shift":"Night Shift", "Line":null, "PONo":null, "CheckedBy":"af305f2c-0b9b-11ef-8005-52549f6cc694", "CreatedBy":"af305f2c-0b9b-11ef-8005-52549f6cc694", "UpdatedBy":"ada6d45d-0b78-11ef-8005-52549f6cc694", "CreatedOn":"15-05-2024 20:59:54", "UpdatedOn":"01-06-2024 06:38:45", "Status":"Approved", "Type":"Sealent", "PreLamPdf":"http:\/\/srv515471.hstgr.cloud:9090\/IPQC\/Pdf\/27f8c639-e23b-4070-ab8a-217ff678d551.pdf", "Location":null, "PersonID":"af305f2c-0b9b-11ef-8005-52549f6cc694", "EmployeeID":"10462", "Name":"gaurav", "LoginID":"gaurav", "Password":"gaurav@4126", "WorkLocation":"fc9c906b-e817-11ee-b439-0ac93defbbf1", "Email":"krishukumar7827@gmail.com", "Department":"849b50dd-e816-11ee-b439-0ac93defbbf1", "ProfileImg":"http:\/\/srv515471.hstgr.cloud:9090\/Employee\/Profile\/af305f2c-0b9b-11ef-8005-52549f6cc694gaurav1714994879458274.jpg", "Desgination":"1af9d9f7-e817-11ee-b439-0ac93defbbf1", "Status":"Active", "UpdatedBy":null, "UpdatedOn":null, "CreatedBy":"b570e501-f8c7-11ee-b439-0ac93defbbf1", "CreatedOn":"06-05-2024 11:27:55"},
  {"PreLamDetailId":"27f8c639-e23b-4070-ab8a-217ff678d551", "SealentWeightId":"76ed4660-5e08-4b0a-9a60-6591f6959945", "Stage":"Short Frame", "WithoutSealant":"1010", "WithSealant":"1120", "DiffWeight":"110.0", "BaseWeight":"18.59g", "CatalystWeight":"3.06g", "Ratio":"6.01g", "PreLamDetailId":"27f8c639-e23b-4070-ab8a-217ff678d551", "DocNo":"GSPL\/IPQC\/SP\/012", "RevNo":"1.0\/12.08.2023", "Date":"2024-05-16", "Shift":"Night Shift", "Line":null, "PONo":null, "CheckedBy":"af305f2c-0b9b-11ef-8005-52549f6cc694", "CreatedBy":"af305f2c-0b9b-11ef-8005-52549f6cc694", "UpdatedBy":"ada6d45d-0b78-11ef-8005-52549f6cc694", "CreatedOn":"15-05-2024 20:59:54", "UpdatedOn":"01-06-2024 06:38:45", "Status":"Approved", "Type":"Sealent", "PreLamPdf":"http:\/\/srv515471.hstgr.cloud:9090\/IPQC\/Pdf\/27f8c639-e23b-4070-ab8a-217ff678d551.pdf", "Location":null, "PersonID":"af305f2c-0b9b-11ef-8005-52549f6cc694", "EmployeeID":"10462", "Name":"gaurav", "LoginID":"gaurav", "Password":"gaurav@4126", "WorkLocation":"fc9c906b-e817-11ee-b439-0ac93defbbf1", "Email":"krishukumar7827@gmail.com", "Department":"849b50dd-e816-11ee-b439-0ac93defbbf1", "ProfileImg":"http:\/\/srv515471.hstgr.cloud:9090\/Employee\/Profile\/af305f2c-0b9b-11ef-8005-52549f6cc694gaurav1714994879458274.jpg", "Desgination":"1af9d9f7-e817-11ee-b439-0ac93defbbf1", "Status":"Active", "UpdatedBy":null, "UpdatedOn":null, "CreatedBy":"b570e501-f8c7-11ee-b439-0ac93defbbf1", "CreatedOn":"06-05-2024 11:27:55"}]





  const workbook = new ExcelJS.Workbook();
  const worksheet = workbook.addWorksheet('Framing');
  let Style = ({size, bold, horizontal = 'center', vertical = 'middle'})=>{

   let style =  {
      alignment: { horizontal: horizontal, vertical: vertical, wrapText: true },
      font: {
        size: size, bold: bold
      }
    }
    return style;
  }

  let Style2 = {
    alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
    font: {
      size: 22, bold: false
    }
  }

  let MatrixData = [{
    'Date': Data[0]['Date'],
    'Shift': Data[0]['Shift'],
    'Acceptance Crieteria': ">-4N"
  },
  {
    'Line': Data[0]['Line'],
    'Buusing Stage': Data[0]['BussingStage'],
    'Operator Name': Data[0]['OperatorName'],
  },
  {
    'Ribbon Width': Data[0]['Line'],
    'Busbar Width': Data[0]['BussingStage'],
    'Result': "NA",
  }]
  let Border = {
    top: { style: 'thin' },
    bottom: { style: 'thin' },
    left: { style: 'thin' },
    right: { style: 'thin' }
  }




  /**Merging Cells */
  worksheet.mergeCells('A1:I2')
  worksheet.mergeCells('J1:L1')
  worksheet.mergeCells('A3:I3')
  worksheet.mergeCells('J2:L2')
  worksheet.mergeCells('J3:L3')
  worksheet.mergeCells('H4:L4')



  /**putting value in cell */
  worksheet.getCell('J1').value = 'Page No.1';
  worksheet.getCell('A1').value = 'Gautam Solar Pvt. Ltd';
  worksheet.getCell('A3').value = `CheckSheet For Sealent Weight Management`;
  worksheet.getCell('J2').value = `Doc No. ${Data[0]['DocNo']}`;
  worksheet.getCell('J3').value = `Rev No. ${Data[0]['RevNo']}`;
  worksheet.getCell('H4').value = `Line No: ${Data[0]['Line']}`;


  /**Giving Style to Cell */
  worksheet.getCell('J1').style = {
    alignment: { horizontal: 'center', vertical: 'middle' },
    font: {
      size: 12, bold: true, italic: false
    }
  }

  worksheet.getCell('A3').style = {
    alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
    font: {
      size: 15, bold: true
    }
  }

  worksheet.getCell('A1').style = {
    alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
    font: {
      size: 22, bold: true
    }
  }

  worksheet.getCell('J2').style = {
    alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
    font: {
      size: 12, bold: true
    }
  }
  worksheet.getCell('J3').style = {
    alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
    font: {
      size: 12, bold: true
    }
  }

  worksheet.getCell('E4').style = {
    alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
    font: {
      size: 12, bold: true
    }
  }

/**Border */
worksheet.getCell('A1').border = Border;
worksheet.getCell('I2').border = Border;
worksheet.getCell('J1').border = Border;
worksheet.getCell('L1').border = Border;
worksheet.getCell('J2').border = Border;
worksheet.getCell('L2').border = Border;
worksheet.getCell('J3').border = Border;
worksheet.getCell('L3').border = Border;
worksheet.getCell('A3').border = Border;
worksheet.getCell('I3').border = Border;
worksheet.getCell('E4').border = Border;
worksheet.getCell('L4').border = Border;
  /**Height */
  worksheet.getRow(1).height = 15;
  worksheet.getRow(2).height = 27;
  worksheet.getRow(3).height = 24;
  worksheet.getRow(4).height = 25;
  worksheet.getRow(5).height = 20;

  worksheet.mergeCells('A4:C4')
  worksheet.mergeCells('D4:G4')


  worksheet.getCell('A4').value = `Date: ${Data[0]['Date']}`;
  worksheet.getCell('D4').value = `Shift: ${Data[0]['Shift']}`;



  worksheet.getCell('A4').style = Style({size:12,bold:true});
  worksheet.getCell('C4').style = Style({size:12,bold:true});
  worksheet.getCell('D4').style = Style({size:12,bold:true});
  worksheet.getCell('H4').style = Style({size:12,bold:true});
  worksheet.getCell('A6').style = Style({size:12,bold:true});



  worksheet.getCell('A4').border = Border;
  worksheet.getCell('C4').border = Border;
  worksheet.getCell('B4').border = Border;
  worksheet.getCell('D4').border = Border;
  worksheet.getCell('A5').border = Border;




  worksheet.getColumn('C').width = 10;
  worksheet.getColumn('D').width = 10;
  worksheet.getColumn('G').width = 18.5;
  worksheet.getColumn('H').width = 18.5;
  worksheet.getColumn('I').width = 18.5;
  worksheet.getColumn('F').width = 18.5;
  worksheet.getColumn('J').width = 18.5;
  worksheet.getColumn('K').width = 18.5;
  worksheet.getColumn('L').width = 18.5;

  worksheet.getRow(5).height = 31

  worksheet.mergeCells('B5:F5')
  worksheet.getCell('B5').value = `Junction Box`
  worksheet.getCell('B5').style = Style(({size:14,bold:true}));
  worksheet.getCell('B5').border = Border;
  worksheet.getCell('F5').border = Border;

  worksheet.mergeCells('G5:I5')
  worksheet.getCell('G5').value = `Long Frame`
  worksheet.getCell('G5').style = Style(({size:14,bold:true}));
  worksheet.getCell('G5').border = Border;
  worksheet.getCell('I5').border = Border;

  worksheet.mergeCells('J5:L5')
  worksheet.getCell('J5').value = `Short Frame`
  worksheet.getCell('J5').style = Style(({size:14,bold:true}));
  worksheet.getCell('J5').border = Border;
  worksheet.getCell('L5').border = Border;
  worksheet.getCell('A6').border = Border;

  worksheet.getRow(6).height = 36;
  worksheet.getCell('A6').value = 'Sr.No'


    worksheet.mergeCells('B6:C6')
  worksheet.getCell('B6').value = `Without Sealent = A(gm)`
  worksheet.getCell('B6').style = Style(({size:12,bold:true}));
  worksheet.getCell('B6').border = Border;
  worksheet.getCell('C6').border = Border;
  worksheet.mergeCells('D6:E6')
  worksheet.getCell('D6').value = `With Sealent = B(gm)`
  worksheet.getCell('D6').style = Style(({size:12,bold:true}));
  worksheet.getCell('D6').border = Border;
  worksheet.getCell('E6').border = Border;
  worksheet.getCell('F6').value = `Differnce Weight =B-A(gm)`
  worksheet.getCell('F6').style = Style(({size:12,bold:true}));
  worksheet.getCell('F6').border = Border;
  worksheet.getCell('F6').border = Border;


  
  worksheet.getCell('G6').value = `Without Sealent = A(gm)`
  worksheet.getCell('G6').style = Style(({size:12,bold:true}));
  worksheet.getCell('G6').border = Border;
  worksheet.getCell('G6').border = Border;
  
  worksheet.getCell('H6').value = `With Sealent = B(gm)`
  worksheet.getCell('H6').style = Style(({size:12,bold:true}));
  worksheet.getCell('H6').border = Border;
  worksheet.getCell('H6').border = Border;
  worksheet.getCell('I6').value = `Differnce Weight =B-A(gm)`
  worksheet.getCell('I6').style = Style(({size:12,bold:true}));
  worksheet.getCell('I6').border = Border;
  worksheet.getCell('I6').border = Border;

  worksheet.getCell('J6').value = `Without Sealent = A(gm)`
  worksheet.getCell('J6').style = Style(({size:12,bold:true}));
  worksheet.getCell('J6').border = Border;
  worksheet.getCell('J6').border = Border;
  
  worksheet.getCell('K6').value = `With Sealent = B(gm)`
  worksheet.getCell('K6').style = Style(({size:12,bold:true}));
  worksheet.getCell('K6').border = Border;
  worksheet.getCell('K6').border = Border;
  worksheet.getCell('L6').value = `Differnce Weight =B-A(gm)`
  worksheet.getCell('L6').style = Style(({size:12,bold:true}));
  worksheet.getCell('L6').border = Border;
  worksheet.getCell('L6').border = Border;

let Row = 7;
worksheet.getRow(Row).height = 25;
worksheet.getRow(8).height = 25;


Data.forEach((data)=>{
  
  /** Serial No **/
  worksheet.getCell(`A${Row}`).value = `1`
  
  /**Junction Box **/
  if(data['Stage'] == 'Junction Box'){
    /**Without Sealenet */
      worksheet.mergeCells(`B7:C7`)
      worksheet.getCell(`B7`).value = data['WithoutSealant']
      
    /**With Sealent */
    worksheet.mergeCells(`D7:E7`)
      worksheet.getCell(`D7`).value = data['WithSealant']

  /**With Sealent */
 
  worksheet.getCell(`F7`).value = data['DiffWeight']
  }
 

  if(data['Stage'] == 'Long Frame'){
    /**Without Sealenet */
    
      worksheet.getCell(`G7`).value = data['WithoutSealant']
      
    /**With Sealent */
   
      worksheet.getCell(`H7`).value = data['WithSealant']

  /**With Sealent */
 
  worksheet.getCell(`I7`).value = data['DiffWeight']
  }

  if(data['Stage'] == 'Short Frame'){
    /**Without Sealenet */
    
      worksheet.getCell(`J7`).value = data['WithoutSealant']
      
    /**With Sealent */
   
      worksheet.getCell(`K7`).value = data['WithSealant']

  /**With Sealent */
 
  worksheet.getCell(`L7`).value = data['DiffWeight']
  }
  if(data['Stage'] == 'Junction Box'){
    /**Without Sealenet */
      worksheet.mergeCells(`A8:E8`)
      worksheet.getCell(`A8`).value ="Total Weight Per Module"
      
    /**With Sealent */
    worksheet.mergeCells(`F8:G8`)
      worksheet.getCell(`F8`).value = `Base Weight(A): ${data['BaseWeight']}`
      worksheet.mergeCells(`H8:I8`)
      worksheet.getCell(`H8`).value = `Catalyst Weight(B): ${data['CatalystWeight']}`

  /**With Sealent */
  worksheet.mergeCells(`J8:L8`)
 
  worksheet.getCell(`J8`).value = `Ratio(A:B):${data['Ratio']}`
  }
  worksheet.getCell('B7').style = Style({size:12,bold:true})
  worksheet.getCell('D7').style = Style({size:12,bold:true})
  worksheet.getCell('F7').style = Style({size:12,bold:true})
  worksheet.getCell('G7').style = Style({size:12,bold:true})
  worksheet.getCell('I7').style = Style({size:12,bold:true})
  worksheet.getCell('J7').style = Style({size:12,bold:true})
  worksheet.getCell('K7').style = Style({size:12,bold:true})
  worksheet.getCell('L7').style = Style({size:12,bold:true})
  worksheet.getCell('A7').style = Style({size:12,bold:true})
  worksheet.getCell('H7').style = Style({size:12,bold:true})

  worksheet.getCell('A8').style = Style({size:12,bold:true})
  worksheet.getCell('F8').style = Style({size:12,bold:true})
  worksheet.getCell('H8').style = Style({size:12,bold:true})
  worksheet.getCell('J8').style = Style({size:12,bold:true})


  worksheet.getCell('A7').border = Border;
  worksheet.getCell('B7').border = Border;
  worksheet.getCell('C7').border = Border;
  worksheet.getCell('D7').border = Border;
  worksheet.getCell('E7').border = Border;
  worksheet.getCell('F7').border = Border;
  worksheet.getCell('G7').border = Border;
  worksheet.getCell('H7').border = Border;
  worksheet.getCell('I7').border = Border;
  worksheet.getCell('J7').border = Border;
  worksheet.getCell('K7').border = Border;
  worksheet.getCell('L7').border = Border;

  worksheet.getCell('A8').border = Border;
  worksheet.getCell('B8').border = Border;
  worksheet.getCell('C8').border = Border;
  worksheet.getCell('D8').border = Border;
  worksheet.getCell('E8').border = Border;
  worksheet.getCell('F8').border = Border;
  worksheet.getCell('G8').border = Border;
  worksheet.getCell('H8').border = Border;
  worksheet.getCell('I8').border = Border;
  worksheet.getCell('J8').border = Border;
  worksheet.getCell('K8').border = Border;
  worksheet.getCell('L8').border = Border;
  

})
worksheet.getRow('9').height = 35;
worksheet.mergeCells('A9:H9');
worksheet.mergeCells('I9:L9');
worksheet.getCell('A9').value = `Tested by : Krishna`;
worksheet.getCell('I9').value = `Reviewed By : Saif`;
worksheet.getCell('A9').style = Style({size:12,bold:true});
worksheet.getCell('I9').style = Style({size:12,bold:true});
worksheet.getCell('A9').border = Border;
worksheet.getCell('B9').border = Border;
worksheet.getCell('C9').border = Border;
worksheet.getCell('D9').border = Border;
worksheet.getCell('E9').border = Border;
worksheet.getCell('F9').border = Border;
worksheet.getCell('G9').border = Border;
worksheet.getCell('H9').border = Border;
worksheet.getCell('I9').border = Border;
worksheet.getCell('J9').border = Border;
worksheet.getCell('K9').border = Border;
worksheet.getCell('L9').border = Border;






    //Save the workbook to a file
    const excelBuffer = await workbook.xlsx.writeBuffer()
    .then(buffer => {
      console.log('Excel file generated successfully!');

      return buffer; // Return the buffer
    })
    .catch(error => {
      console.error('Error generating Excel file:', error);
    });


  fs.writeFileSync('output.xlsx', excelBuffer)
}



app.listen(PORT, async () => {
  try {
    console.log((await chalk).default.green('server is running'));
    console.log((await chalk).default.yellow('Database is connecting....'))
  
    dbConn
  } catch (err) {
    console.log(err)
  }
})
