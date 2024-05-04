const express = require('express')
const {dbConn} = require('./db.config/db.config')
const {PersonRouter} = require('./Routes/Person.Route')
const {designationRouter} = require('./Routes/DesignationRoute')
const {IQCSolarCellRoute} = require('./Routes/IQCSolarCellRoute')
const {QualityRoute} = require('./Routes/QualityRoutes')
const path = require('path')
const {IPQC} = require('./Routes/IPQCRoute')
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 8080
const ExcelJS = require('exceljs');
require('dotenv').config()
app.use(express.json())
app.use(cors())




/**Endpoints */

/** to Employee */
app.use('/Employee',PersonRouter)

/** to Department and Designation */
app.use('/QCM',designationRouter)

/** to IQC Solar Cell */
app.use('/IQCSolarCell',IQCSolarCellRoute)

/**to IPQC */
app.use('/IPQC',IPQC);

/**to Quality */
app.use('/Quality',QualityRoute)

function QualityExcelGenerate(data,FromDate,ToDate){
 
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
worksheet.mergeCells('A1:N2');


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
worksheet.getCell('N2').border = Border;

const excelFileName = 'QualityReport.xlsx';
workbook.xlsx.writeFile(excelFileName)
    .then(() => {
        console.log('Excel file generated successfully!');
    })
    .catch(error => {
        console.error('Error generating Excel file:', error);
    });

  
}

//QualityExcelGenerate([],'25 Jan 2024','20 May 2024');


app.get("/getFile",(req,res)=>{
  const pathfile = path.join(__dirname,'check.png');
  res.download(pathfile);
});
app.listen(PORT,async()=>{
  try{
    console.log('server is running')
    console.log('Database is connecting....')
      dbConn
  }catch(err){
console.log(err)
  }
})