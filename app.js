const express = require('express')
const {dbConn} = require('./db.config/db.config')
const {PersonRouter} = require('./Routes/Person.Route')
const {designationRouter} = require('./Routes/DesignationRoute')
const {IQCSolarCellRoute} = require('./Routes/IQCSolarCellRoute')
const {IPQC} = require('./Routes/IPQCRoute')
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 8080
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

const ExcelJS = require('exceljs');





// // Create a new workbook
// const workbook = new ExcelJS.Workbook();
// const worksheet = workbook.addWorksheet('Quality Control Plan (Junction Box)');


// let Border = {
//   top: { style: 'thin' },
//   bottom: { style: 'thin' },
//   left:{style:'thin'},
//   right:{style:'thin'}
// }

// // Merge cells for the header and set text
// worksheet.mergeCells('A1:I2');
// worksheet.getCell('A1').value = 'Incoming Quality Control Plan (Solar Glass)';

// // Apply header styling
// worksheet.getCell('A1').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:13,bold:true}, fill: {
//   type: 'pattern',
//   pattern: 'solid',
//   fgColor: { argb: 'FFFF00' } // Yellow background color
// }}
// worksheet.getCell('A1').border = Border
// worksheet.getCell('E2').border = Border
// // Save the workbook to a file
// const excelFileName = 'quality_control_plan_junction_box.xlsx';
// workbook.xlsx.writeFile(excelFileName)
//     .then(() => {
//         console.log('Excel file generated successfully!');
//     })
//     .catch(error => {
//         console.error('Error generating Excel file:', error);
//     });



app.listen(PORT,async()=>{
  try{
    console.log('server is running')
    console.log('Database is connecting....')
      dbConn
  }catch(err){
console.log(err)
  }
})