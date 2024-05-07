const express = require('express')
const { dbConn } = require('./db.config/db.config')
const { PersonRouter } = require('./Routes/Person.Route')
const { designationRouter } = require('./Routes/DesignationRoute')
const { IQCSolarCellRoute } = require('./Routes/IQCSolarCellRoute')
const { QualityRoute } = require('./Routes/QualityRoutes')
const path = require('path')
const { IPQC } = require('./Routes/IPQCRoute')
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 8080
const ExcelJS = require('exceljs');
require('dotenv').config()
app.use(express.json())
app.use(cors())




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

function QualityExcelGenerate(data, FromDate, ToDate) {

  // Create a new workbook
  const workbook = new ExcelJS.Workbook();
  const worksheet = workbook.addWorksheet('Quality Report');


  let Border = {
    top: { style: 'thin' },
    bottom: { style: 'thin' },
    left: { style: 'thin' },
    right: { style: 'thin' }
  }

  let WrapTextAlignment = { horizontal: 'center', vertical: 'middle', wrapText: true };

  /**Merge Cells */
  worksheet.mergeCells('A1:O2');


  /**Put Value in Cell */
  worksheet.getCell('A1').value = `Quality Report ${FromDate} - ${ToDate}`;

  /** Apply header styling */
  worksheet.getCell('A1').style = {
    alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 16, bold: true }, fill: {
      type: 'pattern',
      pattern: 'solid',
      fgColor: { argb: 'FFF6DC' } // Yellow background color
    }
  }

  /**Apply Borders */
  worksheet.getCell('A1').border = Border;
  worksheet.getCell('Q2').border = Border;

  /** Set The Column Names in Excel */
  var startCharCode = 'A'.charCodeAt(0);
  var endCharCode = 'O'.charCodeAt(0);
  let row = 3;
  worksheet.getRow(row).height = 40;

  let index = 0;
  let ColumnNames = ['Shift', 'In Charge Name', 'PreLam Incharge Name', 'Post Incharege Name', 'Product Barcode', 'Wattage', 'Model Number', 'Other Model Number', 'Issue type', 'Other Issue Type', 'Stage', 'Found By', 'Reason Of Issue', 'Issue Come From', 'Taken Action'];

  for (let i = startCharCode; i <= endCharCode; i++) {
    worksheet.getColumn(`${String.fromCharCode(i)}`).width = 20;
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).value = `${ColumnNames[index]}`;
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).style = {
      alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 10, bold: true }
    }
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).border = Border
    index++;
  }


  const excelFileName = 'QualityReport.xlsx';
  workbook.xlsx.writeFile(excelFileName)
    .then(() => {
      console.log('Excel file generated successfully!');
    })
    .catch(error => {
      console.error('Error generating Excel file:', error);
    });


}

//QualityExcelGenerate([], '25 Jan 2024', '20 May 2024');


app.get("/getFile", (req, res) => {
  const pathfile = path.join(__dirname, 'check.png');
  res.download(pathfile);
});
app.listen(PORT, async () => {
  try {
    console.log('server is running')
    console.log('Database is connecting....')
    dbConn
  } catch (err) {
    console.log(err)
  }
})