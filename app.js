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

// let data = [
//   {
//       "SolarDetailID": "94c65a75-caa7-4d7c-aea9-eec2bd471f27",
//       "LotSize": "33",
//       "SupplierName": "Vikas Entertainment ",
//       "InvoiceNo": "V001278",
//       "InvoiceDate": "2024-04-03",
//       "SupplierRMBatchNo": "99",
//       "RawMaterialSpecs": "gg",
//       "QualityCheckDate": "2024-04-03",
//       "ReceiptDate": "2024-04-03",
//       "Status": "Inprogress",
//       "COCPdf": null,
//       "InvoicePdf": null,
//       "IQCSolarID": "a170b3f2-5cb3-4387-bbd8-1ea9c36cd4a3",
//       "RejectedID": "7e25c457-2808-4b5d-bedc-58756e827340",
//       "RejectPackaging": false,
//       "RejectVisual": false,
//       "RejectPhysical": false,
//       "RejectFrontBus": false,
//       "RejectVerification": false,
//       "RejectElectrical": false,
//       "Reason": "",
//       "Result": "Fail",
//       "SampleSizePackaging": 1,
//       "Packaging": [],
//       "SampleSizeVisual": 0,
//       "Visual": [],
//       "SampleSizePhysical": 0,
//       "Physical": [],
//       "SampleSizeFrontBus": 0,
//       "FrontBus": [],
//       "SampleSizeVerification": 0,
//       "Verification": [],
//       "SampleSizeElectrical": 0,
//       "Electrical": []
//   }
// ]

// const ExcelJS = require('exceljs');

// let RenderData = data[0]
// let exceldata = [{"column":"Day Lot No.","value":""},
// {"column":"Material Name","value":"Solar Cell"},
// {"column":"Supplier Name:","value":data[0]['SupplierName']},
// {"column":"Invoice Date:","value":RenderData['InvoiceDate']},
// {"column":"Rm Details","value":RenderData['RawMaterialSpecs']}
// ]

// let rightexceldata = [{"column":"No. of Samples to be checked","value":""},
// {"column":"Sample to be checked","value":"AS PER SIL S1 AQL 4.0"},
// {"column":"Suppliers'RM Batch No.:","value":""},
// {"column":"Invoice No.:","value":""},
// {"column":"Receipt Date:","value":""}
// ]


// // Create a new workbook
// const workbook = new ExcelJS.Workbook();
// const worksheet = workbook.addWorksheet('Junction Box');


// let Border = {
//   top: { style: 'thin' },
//   bottom: { style: 'thin' },
//   left:{style:'thin'},
//   right:{style:'thin'}
// }



// let ColumnNameA = 'A'
// let ColumnValueB = 'B'
// // worksheet.getColumn(ColumnNameA).width = 22;
// // worksheet.getColumn(ColumnValueB).width = 22;

// let CellNo = 7

// exceldata.forEach((data,ind)=>{
  

// worksheet.mergeCells(`A${CellNo}:B${CellNo}`)
// worksheet.mergeCells(`C${CellNo}:D${CellNo}`)
// worksheet.getCell(`A${CellNo}`).value = data['column'];
// worksheet.getCell(`C${CellNo}`).value = data['value'];
// worksheet.getCell(`A${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
// worksheet.getCell(`C${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
// worksheet.getCell(`A${CellNo}`).border = Border
// worksheet.getCell(`B${CellNo}`).border = Border
// worksheet.getCell(`C${CellNo}`).border = Border
// worksheet.getCell(`D${CellNo}`).border = Border

//     worksheet.mergeCells(`E${CellNo}:G${CellNo}`)
// worksheet.mergeCells(`H${CellNo}:I${CellNo}`)
// worksheet.getCell(`E${CellNo}`).value = rightexceldata[ind]['column'];
// worksheet.getCell(`H${CellNo}`).value = rightexceldata[ind]['value'];
// worksheet.getCell(`E${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
// worksheet.getCell(`H${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
// worksheet.getCell(`E${CellNo}`).border = Border
// worksheet.getCell(`G${CellNo}`).border = Border
// worksheet.getCell(`H${CellNo}`).border = Border
// worksheet.getCell(`I${CellNo}`).border = Border
  
//   // worksheet.getCell(`${ColumnNameA}${CellNo}`).value = data['column'];
//   // worksheet.getCell(`${ColumnValueB}${CellNo}`).value = data['value']
//   // worksheet.getCell(`${ColumnNameA}${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:8,bold:true}};
//   // worksheet.getCell(`${ColumnValueB}${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:8,bold:true}};
//   // worksheet.getCell(`${ColumnNameA}${CellNo}`).border = Border
//   // worksheet.getCell(`${ColumnValueB}${CellNo}`).border = Border
//   CellNo++;
// })
// // Merge cells for the header and set text
// worksheet.mergeCells('A1:N2');
// worksheet.mergeCells('A3:G6');
// worksheet.mergeCells('H3:K4');
// worksheet.mergeCells('L3:N4');
// worksheet.mergeCells('H5:K4');
// worksheet.mergeCells('H5:I6');
// //worksheet.mergeCells('A7:B7');  /** Day Lot No. */
// worksheet.getCell('A3').value = 'Gautam Solar Pvt Ltd.';
// worksheet.getCell('A1').value = 'Incoming Quality Control Plan (Solar Glass)';
// worksheet.getCell('H3').value = 'Document No';
// worksheet.getCell('L3').value = 'Rev. No./Rev. Date'
// worksheet.getCell('H5').value = 'GSPL/BS(IQC)/000';
// worksheet.getCell('H5').value = 'Ver. 2.0 /13-03-2024'

// // Apply header styling
// worksheet.getCell('A1').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:16,bold:true}, fill: {
//   type: 'pattern',
//   pattern: 'solid',
//   fgColor: { argb: 'FFF6DC' } // Yellow background color
// }}

// worksheet.getCell('A3').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:15,bold:true}};
// worksheet.getCell('H3').style ={alignment:{horizontal:'center',vertical:'middle'},font:{size:12,bold:true}};
// worksheet.getCell('L3').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:12,bold:true}};
// worksheet.getCell('H5').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:9,bold:true}};;
// worksheet.getCell('H5').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:9,bold:true}};

// /** Border */
// worksheet.getCell('A1').border = Border
// worksheet.getCell('E2').border = Border
// worksheet.getCell('A3').border = Border;
// worksheet.getCell('D5').border = Border
// worksheet.getCell('H3').border = Border;
// worksheet.getCell('L3').border = Border
// worksheet.getCell('H5').border = Border;
// worksheet.getCell('H5').border = Border
// worksheet.getCell('G4').border = Border;
// worksheet.getCell('G6').border = Border
// worksheet.getCell('K4').border = Border;
// worksheet.getCell('I6').border = Border;

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