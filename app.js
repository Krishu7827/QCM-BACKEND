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

let IQC = [
  {
      "SolarDetailID": "9238f0e2-d704-4732-b6bb-de1f6892c960",
      "LotSize": "2",
      "SupplierName": "a",
      "InvoiceNo": "aa",
      "InvoiceDate": "2024-04-05",
      "SupplierRMBatchNo": "2",
      "RawMaterialSpecs": "tt",
      "QualityCheckDate": "2024-04-05",
      "ReceiptDate": "2024-04-05",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "6dd7cf37-2040-4116-b864-0a69545dcdbe",
      "CheckType": "Packaging",
      "Characterstics": "Packing (Make type and rating)",
      "MeasuringMethod": "Visual Inspection",
      "Reference": "PO/INVOICE",
      "Sampling": "Whole Lot",
      "AcceptanceCriteria": "No Physical Damage / No Mismatch against PO/Invoice",
      "SampleSize": "1",
      "Samples": "[]",
      "RejectedID": "ede4a145-ee3d-4b27-afba-e953f28b64ab",
      "CheckTypes": "[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]",
      "Reason": "",
      "Result": "Fail"
  },
  {
      "SolarDetailID": "9238f0e2-d704-4732-b6bb-de1f6892c960",
      "LotSize": "2",
      "SupplierName": "a",
      "InvoiceNo": "aa",
      "InvoiceDate": "2024-04-05",
      "SupplierRMBatchNo": "2",
      "RawMaterialSpecs": "tt",
      "QualityCheckDate": "2024-04-05",
      "ReceiptDate": "2024-04-05",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "f796cc6e-4e18-4275-a254-bb83551e5ceb",
      "CheckType": "Visual",
      "Characterstics": "Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell",
      "MeasuringMethod": "Verner Calliper/Measuring Scale",
      "Reference": "GSPL Technical Specification / Supplier COC",
      "Sampling": "SIL S1 AQL 6.5",
      "AcceptanceCriteria": "As GSPL Technical Specification / Acceptance Criteria",
      "SampleSize": "1",
      "Samples": "[]",
      "RejectedID": "ede4a145-ee3d-4b27-afba-e953f28b64ab",
      "CheckTypes": "[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]",
      "Reason": "",
      "Result": "Fail"
  },
  {
      "SolarDetailID": "9238f0e2-d704-4732-b6bb-de1f6892c960",
      "LotSize": "2",
      "SupplierName": "a",
      "InvoiceNo": "aa",
      "InvoiceDate": "2024-04-05",
      "SupplierRMBatchNo": "2",
      "RawMaterialSpecs": "tt",
      "QualityCheckDate": "2024-04-05",
      "ReceiptDate": "2024-04-05",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "e306f592-278d-4453-92c6-82aaea7fa180",
      "CheckType": "Physical",
      "Characterstics": "Dimension(L X W X T)",
      "MeasuringMethod": "Verner Calliper/Measuring Scale",
      "Reference": "GSPL Technical Specification / Supplier COC",
      "Sampling": "SIL S1 AQL 6.5",
      "AcceptanceCriteria": "COC",
      "SampleSize": "",
      "Samples": "[]",
      "RejectedID": "ede4a145-ee3d-4b27-afba-e953f28b64ab",
      "CheckTypes": "[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]",
      "Reason": "",
      "Result": "Fail"
  },
  {
      "SolarDetailID": "9238f0e2-d704-4732-b6bb-de1f6892c960",
      "LotSize": "2",
      "SupplierName": "a",
      "InvoiceNo": "aa",
      "InvoiceDate": "2024-04-05",
      "SupplierRMBatchNo": "2",
      "RawMaterialSpecs": "tt",
      "QualityCheckDate": "2024-04-05",
      "ReceiptDate": "2024-04-05",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "c02c15aa-f4e3-4297-b55c-0f7de9925dc5",
      "CheckType": "FrontBus",
      "Characterstics": "Width",
      "MeasuringMethod": "Verner Calliper/Measuring Scale",
      "Reference": "GSPL Technical Specification / Supplier COC",
      "Sampling": "5 Pcs / Lot",
      "AcceptanceCriteria": "COC",
      "SampleSize": "5",
      "Samples": "[]",
      "RejectedID": "ede4a145-ee3d-4b27-afba-e953f28b64ab",
      "CheckTypes": "[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]",
      "Reason": "",
      "Result": "Fail"
  },
  {
      "SolarDetailID": "9238f0e2-d704-4732-b6bb-de1f6892c960",
      "LotSize": "2",
      "SupplierName": "a",
      "InvoiceNo": "aa",
      "InvoiceDate": "2024-04-05",
      "SupplierRMBatchNo": "2",
      "RawMaterialSpecs": "tt",
      "QualityCheckDate": "2024-04-05",
      "ReceiptDate": "2024-04-05",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "324a871e-e068-47dc-a9a6-1977100ef88e",
      "CheckType": "Verification",
      "Characterstics": "Electrical Paramiter",
      "MeasuringMethod": "Cell Tester",
      "Reference": "GSPL Technical Specification",
      "Sampling": "SIL S1 AQL 6.5",
      "AcceptanceCriteria": "COC",
      "SampleSize": "",
      "Samples": "[]",
      "RejectedID": "ede4a145-ee3d-4b27-afba-e953f28b64ab",
      "CheckTypes": "[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]",
      "Reason": "",
      "Result": "Fail"
  },
  {
      "SolarDetailID": "9238f0e2-d704-4732-b6bb-de1f6892c960",
      "LotSize": "2",
      "SupplierName": "a",
      "InvoiceNo": "aa",
      "InvoiceDate": "2024-04-05",
      "SupplierRMBatchNo": "2",
      "RawMaterialSpecs": "tt",
      "QualityCheckDate": "2024-04-05",
      "ReceiptDate": "2024-04-05",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "648a290d-446f-4004-b013-818bf7f0a373",
      "CheckType": "Electrical",
      "Characterstics": "LID(Light Inducted Degradation)/Preconditioning",
      "MeasuringMethod": "Sunsimulator",
      "Reference": "GSPL Technical Specification",
      "Sampling": "One Module per supplier(each month)",
      "AcceptanceCriteria": "COC",
      "SampleSize": "1",
      "Samples": "[]",
      "RejectedID": "ede4a145-ee3d-4b27-afba-e953f28b64ab",
      "CheckTypes": "[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]",
      "Reason": "",
      "Result": "Fail"
  },
  {
      "SolarDetailID": "9238f0e2-d704-4732-b6bb-de1f6892c960",
      "LotSize": "2",
      "SupplierName": "a",
      "InvoiceNo": "aa",
      "InvoiceDate": "2024-04-05",
      "SupplierRMBatchNo": "2",
      "RawMaterialSpecs": "tt",
      "QualityCheckDate": "2024-04-05",
      "ReceiptDate": "2024-04-05",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "6f01bcba-1028-444d-b565-0da472249ec7",
      "CheckType": "Performance",
      "Characterstics": "Soidering Peel Test",
      "MeasuringMethod": "Peel Tester",
      "Reference": "GSPL Technical Specification",
      "Sampling": "5 Cell/Lot",
      "AcceptanceCriteria": "1 N to 2N-Cell Frontside 1N to 4N Cell Back side",
      "SampleSize": "5",
      "Samples": "[]",
      "RejectedID": "ede4a145-ee3d-4b27-afba-e953f28b64ab",
      "CheckTypes": "[{\"Packaging\":false},{\"Visual\":false},{\"Physical\":false},{\"FrontBus\":false},{\"Verification\":false},{\"Electrical\":false},{\"Performance\":false}]",
      "Reason": "",
      "Result": "Fail"
  }
]
function ExcelGenerate(){
let data = [
  {
      "SolarDetailID": "94c65a75-caa7-4d7c-aea9-eec2bd471f27",
      "LotSize": "33",
      "SupplierName": "Vikas Entertainment ",
      "InvoiceNo": "V001278",
      "InvoiceDate": "2024-04-03",
      "SupplierRMBatchNo": "99",
      "RawMaterialSpecs": "gg",
      "QualityCheckDate": "2024-04-03",
      "ReceiptDate": "2024-04-03",
      "Status": "Inprogress",
      "COCPdf": null,
      "InvoicePdf": null,
      "IQCSolarID": "a170b3f2-5cb3-4387-bbd8-1ea9c36cd4a3",
      "RejectedID": "7e25c457-2808-4b5d-bedc-58756e827340",
      "RejectPackaging": false,
      "RejectVisual": false,
      "RejectPhysical": false,
      "RejectFrontBus": false,
      "RejectVerification": false,
      "RejectElectrical": false,
      "Reason": "",
      "Result": "Fail",
      "SampleSizePackaging": 1,
      "Packaging": [],
      "SampleSizeVisual": 0,
      "Visual": [],
      "SampleSizePhysical": 0,
      "Physical": [],
      "SampleSizeFrontBus": 0,
      "FrontBus": [],
      "SampleSizeVerification": 0,
      "Verification": [],
      "SampleSizeElectrical": 0,
      "Electrical": []
  }
]

const ExcelJS = require('exceljs');

let RenderData = data[0]
let exceldata = [{"column":"Lot Size","value":RenderData['LotSize']},
{"column":"Material Name","value":"Solar Cell"},
{"column":"Supplier Name:","value":data[0]['SupplierName']},
{"column":"Invoice Date:","value":RenderData['InvoiceDate']},
{"column":"Rm Details","value":RenderData['RawMaterialSpecs']}
]

let rightexceldata = [{"column":"No. of Samples to be checked","value":""},
{"column":"Sample to be checked","value":"AS PER SIL S1 AQL 4.0"},
{"column":"Suppliers'RM Batch No.:","value":""},
{"column":"Invoice No.:","value":""},
{"column":"Receipt Date:","value":""}
]


// Create a new workbook
const workbook = new ExcelJS.Workbook();
const worksheet = workbook.addWorksheet('Junction Box');


let Border = {
  top: { style: 'thin' },
  bottom: { style: 'thin' },
  left:{style:'thin'},
  right:{style:'thin'}
}



let ColumnNameA = 'A'
let ColumnValueB = 'B'
// worksheet.getColumn(ColumnNameA).width = 22;
// worksheet.getColumn(ColumnValueB).width = 22;

let CellNo = 7

 exceldata.forEach((data,ind)=>{
  

worksheet.mergeCells(`A${CellNo}:C${CellNo}`)
worksheet.mergeCells(`D${CellNo}:F${CellNo}`)
worksheet.getCell(`A${CellNo}`).value = data['column'];
worksheet.getCell(`D${CellNo}`).value = data['value'];
worksheet.getCell(`A${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
worksheet.getCell(`D${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
worksheet.getCell(`A${CellNo}`).border = Border
worksheet.getCell(`C${CellNo}`).border = Border
worksheet.getCell(`D${CellNo}`).border = Border
worksheet.getCell(`F${CellNo}`).border = Border

worksheet.mergeCells(`G${CellNo}:J${CellNo}`)
worksheet.mergeCells(`K${CellNo}:N${CellNo}`)
worksheet.getCell(`G${CellNo}`).value = rightexceldata[ind]['column'];
worksheet.getCell(`K${CellNo}`).value = rightexceldata[ind]['value'];
worksheet.getCell(`G${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
worksheet.getCell(`K${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:10,bold:true}};
worksheet.getCell(`G${CellNo}`).border = Border
worksheet.getCell(`K${CellNo}`).border = Border
worksheet.getCell(`J${CellNo}`).border = Border
worksheet.getCell(`N${CellNo}`).border = Border
  
  // worksheet.getCell(`${ColumnNameA}${CellNo}`).value = data['column'];
  // worksheet.getCell(`${ColumnValueB}${CellNo}`).value = data['value']
  // worksheet.getCell(`${ColumnNameA}${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:8,bold:true}};
  // worksheet.getCell(`${ColumnValueB}${CellNo}`).style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:8,bold:true}};
  // worksheet.getCell(`${ColumnNameA}${CellNo}`).border = Border
  // worksheet.getCell(`${ColumnValueB}${CellNo}`).border = Border
  CellNo++;
})
// Merge cells for the header and set text
worksheet.mergeCells('A1:N2');
 worksheet.mergeCells('A3:G6');
 worksheet.mergeCells('H3:K4');
 worksheet.mergeCells('H5:K6');
 worksheet.mergeCells('L3:N4')
worksheet.mergeCells('L5:N6');  /** Day Lot No. */

// Set text for merged cells
worksheet.getCell('A3').value = 'Gautam Solar Pvt Ltd.';
worksheet.getCell('A1').value = 'Incoming Quality Control Plan (Solar Glass)';
worksheet.getCell('H3').value = 'Document No';
worksheet.getCell('H5').value = 'Rev. No./Rev. Date';
worksheet.getCell('L5').value = 'Revision Data';
worksheet.getCell('L3').value = 'data of Document'

// Apply header styling
worksheet.getCell('A1').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:16,bold:true}, fill: {
  type: 'pattern',
  pattern: 'solid',
  fgColor: { argb: 'FFF6DC' } // Yellow background color
}}

worksheet.getCell('A3').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:15,bold:true}};
worksheet.getCell('H3').style ={alignment:{horizontal:'center',vertical:'middle'},font:{size:12,bold:true}};
worksheet.getCell('L3').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:12,bold:true}};
worksheet.getCell('H5').style =  {alignment:{horizontal:'center',vertical:'middle'},font:{size:12,bold:true}};
worksheet.getCell('L5').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:12,bold:true}};
worksheet.getCell('L3').style = {alignment:{horizontal:'center',vertical:'middle'},font:{size:12,bold:true}};

// Apply borders
worksheet.getCell('A1').border = Border;
worksheet.getCell('N2').border = Border;
worksheet.getCell('A3').border = Border;
worksheet.getCell('H3').border = Border;
worksheet.getCell('L3').border = Border;
worksheet.getCell('H5').border = Border;
worksheet.getCell('L5').border = Border;
worksheet.getCell('K4').border = Border;
worksheet.getCell('K6').border = Border;
worksheet.getCell('N6').border = Border;
worksheet.getCell('N4').border = Border;
worksheet.getCell('G6').border = Border;

/** Column  */

/**Merge Cells */
worksheet.mergeCells('A12:A13')
worksheet.getColumn('A').width = 15;
worksheet.getCell('A12').value = 'Check Type'
worksheet.getCell('A12').style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,bold:true},wrapText:true};
worksheet.getCell('A12').border = Border;
worksheet.getCell('A13').border = Border;


worksheet.mergeCells('B12:B13')
worksheet.getColumn('B').width = 15;
worksheet.getCell('B12').value = 'Characterstics';
worksheet.getCell('B12').style ={alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,bold:true},wrapText:true};
worksheet.getCell('B12').border = Border;
worksheet.getCell('B13').border = Border;


worksheet.mergeCells('C12:C13')
worksheet.getColumn('C').width = 15;
worksheet.getCell('C12').value = 'Measuring Method';
worksheet.getCell('C12').style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,bold:true},wrapText:true};
worksheet.getCell('C12').border = Border;
worksheet.getCell('C13').border = Border;


worksheet.mergeCells('D12:D13')
worksheet.getColumn('D').width = 15;
worksheet.getCell('D12').value = 'Sampling';
worksheet.getCell('D12').style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,bold:true},wrapText:true};
worksheet.getCell('D12').border = Border;
worksheet.getCell('D13').border = Border;


worksheet.mergeCells('E12:E13')
worksheet.getColumn('E').width = 15;
worksheet.getCell('E12').value = 'Reference';
worksheet.getCell('E12').style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,bold:true},wrapText:true};
worksheet.getCell('E12').border = Border;
worksheet.getCell('E13').border = Border;


worksheet.mergeCells('F12:F13')
worksheet.getColumn('F').width = 15;
worksheet.getCell('F12').value = 'Acceptance Criteria';
worksheet.getCell('F12').style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,bold:true},wrapText:true};
worksheet.getCell('F12').border = Border;
worksheet.getCell('F13').border = Border;


worksheet.mergeCells('G12:N12')
worksheet.getCell('G12').value = 'Samples';
worksheet.getCell('G12').style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:12,bold:true},wrapText:true};
worksheet.getCell('G12').border = Border;
worksheet.getCell('N12').border = Border;

let SamplesArray =[{Cell:'G',S:'S1'},{Cell:'H',S:'S2'},{Cell:'I',S:'S3'},{Cell:'J',S:'S4'},{Cell:'K',S:'S5'},{Cell:'L',S:'S6'},{Cell:'M',S:'S7'},{Cell:'N',S:'S8'}];

let SampleCellNo = 13;
SamplesArray.forEach((Sample)=>{
  worksheet.getCell(`${Sample['Cell']}${SampleCellNo}`).value = `${Sample['S']}`;
  worksheet.getCell(`${Sample['Cell']}${SampleCellNo}`).style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,bold:true},wrapText:true};
  worksheet.getCell(`${Sample['Cell']}${SampleCellNo}`).border = Border;
  
})

let Row  = 14;
IQC.forEach((Material)=>{
  /**Check Type */
  worksheet.getRow(Row).height = 38

  worksheet.getCell(`A${Row}`).value = Material['CheckType'];
  worksheet.getCell(`A${Row}`).style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,}};
  worksheet.getCell(`A${Row}`).border = Border;
  

  worksheet.getCell(`B${Row}`).value = Material['Characterstics'];
  worksheet.getCell(`B${Row}`).style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,}};
  worksheet.getCell(`B${Row}`).border = Border;
  
  worksheet.getCell(`C${Row}`).value = Material['MeasuringMethod'];
  worksheet.getCell(`C${Row}`).style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,}};
  worksheet.getCell(`C${Row}`).border = Border;

  worksheet.getCell(`D${Row}`).value = Material['Sampling'];
  worksheet.getCell(`D${Row}`).style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,}};
  worksheet.getCell(`D${Row}`).border = Border;

  worksheet.getCell(`E${Row}`).value = Material['Reference'];
  worksheet.getCell(`E${Row}`).style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,}};
  worksheet.getCell(`E${Row}`).border = Border;

  worksheet.getCell(`F${Row}`).value = Material['AcceptanceCriteria'];
  worksheet.getCell(`F${Row}`).style = {alignment:{horizontal:'center',vertical:'middle',wrapText:true},font:{size:10,}};
  worksheet.getCell(`F${Row}`).border = Border;
  Row++;
})
// Save the workbook to a file
const excelFileName = 'quality_control_plan_junction_box.xlsx';
workbook.xlsx.writeFile(excelFileName)
    .then(() => {
        console.log('Excel file generated successfully!');
    })
    .catch(error => {
        console.error('Error generating Excel file:', error);
    });

  }

// ExcelGenerate()
app.listen(PORT,async()=>{
  try{
    console.log('server is running')
    console.log('Database is connecting....')
      dbConn
  }catch(err){
console.log(err)
  }
})