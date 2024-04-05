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





// Create a new workbook
const workbook = new ExcelJS.Workbook();
const worksheet = workbook.addWorksheet('Quality Control Plan (Junction Box)');

// Data to be written
const data = [
    ['','Incoming Quality Control Plan (Junction Box)',''],
    ['Gautam Solar Pvt. Ltd.', 'Document No', 'GSPL/JB(IQC)/001'],
    ['', 'Rev. No. / Rev. Date', 'Ver. 2.0 / 13-03-2024'],
    ['Day Lot no.', 'd', 'No. of Samples to be checked'],
    ['Material Name:', 'Junction Box', 'Sample to be checked'],
    ['Quantity Recd.:', 'd', "Suppliers' RM Batch No.:", 'd'],
    ['Supplier Name:', 'd', 'Invoice No.:', 'd'],
    ['Invoice Date:', 'd', 'Receipt Date:', 'd'],
    ['RM Detail\'s', 'd', 'Date of Quality Check:', 'd']
];

// Write headers and values
data.forEach((rowData, i) => {
    const row = worksheet.addRow(rowData);
    row.eachCell(cell => {
        // Apply border styles to each cell
        cell.border = {
            top: { style: 'medium' },
            left: { style: 'medium' },
            bottom: { style: 'medium' },
            right: { style: 'medium' }
        };
    });
});

// Set row heights and alignment
worksheet.getRow(1).height = 30;
worksheet.getRow(1).alignment = {horizontal:'center',vertical:'middle'}
worksheet.getRow(1).border = {left:{style:'thin'},right:{style:'thin'}}
worksheet.getRow(2).height = 30;
worksheet.getRow(2).alignment = {horizontal:'center',vertical:'middle'}
worksheet.getRow(3).height = 30;
worksheet.getRow(3).alignment = {horizontal:'center',vertical:'middle'}

worksheet.getRow(4).alignment = { vertical: 'middle', horizontal: 'center' };
worksheet.getRow(5).alignment = { vertical: 'middle', horizontal: 'center' };
worksheet.getRow(6).alignment = { vertical: 'middle', horizontal: 'center' };
worksheet.getRow(7).alignment = { vertical: 'middle', horizontal: 'center' };
worksheet.getRow(8).alignment = { vertical: 'middle', horizontal: 'center' };
worksheet.getRow(9).alignment = { vertical: 'middle', horizontal: 'center' };

// Set column widths and alignment
worksheet.columns.forEach(column => {
    column.width = 30; // Adjust width as needed
    column.alignment = { horizontal: 'center' };
});

// Save the workbook to a file
const excelFileName = 'quality_control_plan_junction_box.xlsx';
workbook.xlsx.writeFile(excelFileName)
    .then(() => {
        console.log('Excel file generated successfully!');
    })
    .catch(error => {
        console.error('Error generating Excel file:', error);
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