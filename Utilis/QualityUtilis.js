const ExcelJS = require('exceljs');
const Path = require('path');
const fs = require('fs')
const pdf = require('html-pdf')

require('dotenv').config();


async function QualityExcelGenerate(Quality, FromDate, ToDate, Status) {

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
  worksheet.getCell('A1').value = `Quality Report ${FromDate} To ${ToDate}`;

  /** Apply header styling */
  worksheet.getCell('A1').style = {
    alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 16, bold: true }, fill: {
      type: 'pattern',
      pattern: 'solid',
      fgColor: { argb: 'FFF6DC' } // Yellow background color
    }
  };

      /**Merge Cells */
      worksheet.mergeCells('A3:O3');

      /** width of row */
      worksheet.getRow(3).height = 24
      /**Put Value in Cell */
  worksheet.getCell('A3').value = `Quality Type: ${Status}`;

   /** Apply header styling */
   worksheet.getCell('A3').style = {
    alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 12, bold: true }, fill: {
      type: 'pattern',
      pattern: 'solid',
      fgColor: { argb: 'FFF6DC' } // Yellow background color
    }
  };

  /**Apply Borders */
  worksheet.getCell('A1').border = {
    top: { style: 'thin' },
    left:{ style: 'thin' },
    right: { style: 'thin' }
  
  };
  worksheet.getCell('N2').border = {
    top: { style: 'thin' },
    left:{ style: 'thin' },
    right: { style: 'thin' }
  
  };
   /**Apply Borders */
   worksheet.getCell('A3').border = {
    right: { style: 'thin' },
    left:{ style: 'thin' },
    bottom: { style: 'thin' },
   
   
  };
   worksheet.getCell('N3').border = {
    right:{ style: 'thin' },
    bottom: { style: 'thin' },
    left:{ style: 'thin' },
   
  };;

  /** Set The Column Names in Excel */
  var startCharCode = 'A'.charCodeAt(0);
  var endCharCode = 'O'.charCodeAt(0);
  let row = 4;
  worksheet.getRow(row).height = 40;

  let index = 0;
  let ColumnNames =   ['Date','Time','Shift', 'Shift InCharge Name PreLime', 'Shift InCharge Name PostLime', 'Product Barcode',
    'Wattage', 'Model Number', 'Issue type',  'Stage', 'Taken Action', 'Reason Of Issue', 'Issue Come From',
    'Responsible Person', 'Found By']; 

  for (let i = startCharCode; i <= endCharCode; i++) {
    worksheet.getColumn(`${String.fromCharCode(i)}`).width = 20;
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).value = `${ColumnNames[index]}`;
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).style = {
      alignment: { horizontal: 'center', vertical: 'middle', wrapText:true}, font: { size: 10, bold: true }
    }
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).border = Border;
    index++;
  }

  
//  let Quality = [
//         {
//             "QualityId": "ef877c5c-df03-45a9-bd94-c456c7f14930",
//             "Shift": "shift",
//             "ShiftInChargeName": "Rahul",
//             "ShiftInChargePreLime": "Viney",
//             "ShiftInChargePostLim": "Akash",
//             "ProductBarCode": "productBarcode",
//             "CreatedOn": "07-05-2024",
//             "CreatedBy": "Bhanu",
//             "Wattage": "wattage",
//             "Stage": "stage",
//             "ResposiblePerson": "Nagar",
//             "ReasonOfIssue": "reasonofissue",
//             "IssueComeFrom": "issuecomefrom",
//             "ActionTaken": "actiontaken",
//             "ModulePicture": null,
//             "Issue": "otherissuetyp",
//             "ModelName": "G2×Bifacial 1715-HAD"
//         },
//         {
//             "QualityId": "7ec71bb8-dc2f-476c-add9-a46c0c690866",
//             "Shift": "Day",
//             "ShiftInChargeName": "",
//             "ShiftInChargePreLime": "",
//             "ShiftInChargePostLim": "",
//             "ProductBarCode": "",
//             "CreatedOn": "07-05-2024",
//             "CreatedBy": "Bhanu",
//             "Wattage": "bh",
//             "Stage": "bb",
//             "ResposiblePerson": "hh",
//             "ReasonOfIssue": "nj",
//             "IssueComeFrom": "hj",
//             "ActionTaken": "hhhh",
//             "ModulePicture": "http://srv515471.hstgr.cloud:8080/Quality/File/7ec71bb8-dc2f-476c-add9-a46c0c6908661715082135413133.jpg",
//             "Issue": "Flux Spot",
//             "ModelName": "bb"
//         },
//         {
//             "QualityId": "18e98723-0715-461e-9c3e-88955c367184",
//             "Shift": "shift",
//             "ShiftInChargeName": "Rahul",
//             "ShiftInChargePreLime": "Viney",
//             "ShiftInChargePostLim": "Akash",
//             "ProductBarCode": "productBarcode",
//             "CreatedOn": "07-05-2024",
//             "CreatedBy": "Bhanu",
//             "Wattage": "wattage",
//             "Stage": "stage",
//             "ResposiblePerson": "Nagar",
//             "ReasonOfIssue": "reasonofissue",
//             "IssueComeFrom": "issuecomefrom",
//             "ActionTaken": "actiontaken",
//             "ModulePicture": null,
//             "Issue": "Flux Spot",
//             "ModelName": "othermodelnumber"
//         }
       
//     ];
row = row+1;

Quality.forEach((data)=>{

  worksheet.getRow(row).height = 40
  const style = { alignment: { horizontal: 'center', vertical: 'middle', wrapText: true }, font: { size: 9} }
  /**Put the value in cell */
  worksheet.getCell(`A${row}`).value = data['CreatedOn'];
  worksheet.getCell(`B${row}`).value = data['CreatedTime'];
 
  worksheet.getCell(`C${row}`).value = data['Shift'];
  worksheet.getCell(`D${row}`).value = data['ShiftInChargePreLime'];
  worksheet.getCell(`E${row}`).value = data['ShiftInChargePostLim'];
  worksheet.getCell(`F${row}`).value = data['ProductBarCode'];
  worksheet.getCell(`G${row}`).value = data['Wattage'];
  worksheet.getCell(`H${row}`).value = data['ModelName'];
  worksheet.getCell(`I${row}`).value = data['Issue']; 
  worksheet.getCell(`J${row}`).value = data['Stage'];
  worksheet.getCell(`K${row}`).value = data['ActionTaken'];
  worksheet.getCell(`L${row}`).value = data['ReasonOfIssue'];
  worksheet.getCell(`M${row}`).value = data['IssueComeFrom'];
  worksheet.getCell(`N${row}`).value = data['ResposiblePerson'];
  worksheet.getCell(`O${row}`).value = data['CreatedBy'];

  /**Styling */
  worksheet.getCell(`A${row}`).style = style;
  worksheet.getCell(`B${row}`).style = style;
  worksheet.getCell(`C${row}`).style = style;
  worksheet.getCell(`D${row}`).style = style;
  worksheet.getCell(`E${row}`).style = style;
  worksheet.getCell(`F${row}`).style = style;
  worksheet.getCell(`G${row}`).style = style;
  worksheet.getCell(`H${row}`).style = style;
  worksheet.getCell(`I${row}`).style = style;
  worksheet.getCell(`J${row}`).style = style;
  worksheet.getCell(`K${row}`).style = style;
  worksheet.getCell(`L${row}`).style = style;
  worksheet.getCell(`M${row}`).style = style;
  worksheet.getCell(`N${row}`).style = style;
  worksheet.getCell(`O${row}`).style = style;
  // worksheet.getCell(`N${row}`).style = style;

  /**Border */
  worksheet.getCell(`A${row}`).border = Border;
  worksheet.getCell(`B${row}`).border = Border;
  worksheet.getCell(`C${row}`).border = Border;
  worksheet.getCell(`D${row}`).border = Border;
  worksheet.getCell(`E${row}`).border = Border;
  worksheet.getCell(`F${row}`).border = Border;
  worksheet.getCell(`G${row}`).border = Border;
  worksheet.getCell(`H${row}`).border = Border;
  worksheet.getCell(`I${row}`).border = Border;
  worksheet.getCell(`J${row}`).border = Border;
  worksheet.getCell(`K${row}`).border = Border;
  worksheet.getCell(`L${row}`).border = Border;
  worksheet.getCell(`M${row}`).border = Border;
  worksheet.getCell(`N${row}`).border = Border;
  worksheet.getCell(`O${row}`).border = Border;
  // worksheet.getCell(`N${row}`).border = Border;

  row++;
})

   //Save the workbook to a file
const excelBuffer = await workbook.xlsx.writeBuffer()
.then(buffer => {
  console.log('Excel file generated successfully!');

  return buffer; // Return the buffer
})
.catch(error => {
  console.error('Error generating Excel file:', error);
});

return excelBuffer;

}
  
let data = [
  {"PersonID":"08d5d779-0b9c-11ef-8005-52549f6cc694","Name":"danish ali","EmployeeID":"929","Total_Working_Day":1,"Total_Completed_Issue":4,"Total_Inprogress_Issue":0},
  {"PersonID":"195a1f4d-2328-11ef-bf59-52549f6cc694","Name":"Gaurav Verma ","EmployeeID":"QC2","Total_Working_Day":9,"Total_Completed_Issue":57,"Total_Inprogress_Issue":2},
  {"PersonID":"4324c8da-2e29-11ef-bdcb-1a2cd4d9c0d1","Name":"nikhil pandey","EmployeeID":"10477","Total_Working_Day":6,"Total_Completed_Issue":46,"Total_Inprogress_Issue":16},
  {"PersonID":"5e71881e-23ce-11ef-bf59-52549f6cc694","Name":"Danish Ali","EmployeeID":"QC5","Total_Working_Day":10,"Total_Completed_Issue":44,"Total_Inprogress_Issue":0},
  {"PersonID":"70e6caa3-2329-11ef-bf59-52549f6cc694","Name":"Abhishek Kumar ","EmployeeID":"QC4","Total_Working_Day":11,"Total_Completed_Issue":186,"Total_Inprogress_Issue":0},
  {"PersonID":"8e7237a2-127e-11ef-8005-52549f6cc694","Name":"admin quality shubham","EmployeeID":"19","Total_Working_Day":7,"Total_Completed_Issue":77,"Total_Inprogress_Issue":6},
  {"PersonID":"8f60157c-1432-11ef-8005-52549f6cc694","Name":"qualtity admin abhishek","EmployeeID":"391","Total_Working_Day":1,"Total_Completed_Issue":0,"Total_Inprogress_Issue":0},
  {"PersonID":"9cf315ea-23db-11ef-bf59-52549f6cc694","Name":"Umesh Kumar Tiwari","EmployeeID":"QC7","Total_Working_Day":7,"Total_Completed_Issue":27,"Total_Inprogress_Issue":1},
  {"PersonID":"a157d1c1-23ce-11ef-bf59-52549f6cc694","Name":"Shivanshu Verma","EmployeeID":"QC6","Total_Working_Day":19,"Total_Completed_Issue":165,"Total_Inprogress_Issue":2},
  {"PersonID":"b570e501-f8c7-11ee-b439-0ac93defbbf1","Name":"admin shubham singh","EmployeeID":"Emp001","Total_Working_Day":2,"Total_Completed_Issue":1,"Total_Inprogress_Issue":3},
  {"PersonID":"d27429f4-2327-11ef-bf59-52549f6cc694","Name":"Harshit Mishra","EmployeeID":"QC1","Total_Working_Day":10,"Total_Completed_Issue":13,"Total_Inprogress_Issue":2},
  {"PersonID":"d87d9a44-2328-11ef-bf59-52549f6cc694","Name":"Ashutosh Yadav","EmployeeID":"QC3","Total_Working_Day":8,"Total_Completed_Issue":59,"Total_Inprogress_Issue":13}]

const base64Image = `data:image/png;base64,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`
const htmlContent = `
<!DOCTYPE html>
<html>
<head>
<style>
body {
  position: relative;
  font-family: arial, sans-serif;
}

.watermark {
  position: absolute;
  top: 50%;
  left: 10%;
  transform: translate(-50%, -50%);
  opacity: 0.1; /* Adjust the opacity as needed */
  z-index: -1;
  width: 80%; /* Adjust size as needed */
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid black;
  text-align: center;
  padding: 4px;
  font-size: small;
  
}

tr:nth-child(even) {
  background-color: #dddddd;

}

</style>
</head>
<body>



    <img src="${base64Image}" style="display: block;
        margin-left: auto;
         width: 300px;
         margin-bottom:-100px;
          margin-top: -100px;
        margin-right: auto;"/>
        <img src="${base64Image}" class="watermark" alt="Watermark" />
 <h3 style="text-align: center; font-family: arial, sans-serif;"> Monthly Quality Report</h3>
<h4 style="text-align: center; font-family: arial, sans-serif; margin-top:-10px">June-2024</h4>
<table>
  <tr>
    <th>SR NO.</th>
    <th>Name</th>
    <th>EmployeeID</th>
     <th>Total Working Days</th>
    <th>Total Completed Issue</th>
    <th>Total Inprogress Issue</th>
    
  </tr>
  ${data.map((row,i)=>{
    return `<tr>
    <td>${i+1}</td>
    <td>${row.Name}</td>
    <td>${row.EmployeeID}</td>
    <td>${row.Total_Working_Day}</td>
    <td>${row.Total_Completed_Issue}</td>
    <td>${row.Total_Inprogress_Issue}</td>
  </tr>`
  }).join(' ')}
  
</table>

</body>
</html>
`;



pdf.create(htmlContent, {
  format:'A4',
  childProcessOptions:{
    env:{
      OPENSSL_CONF: '/dev/null',
    }
  }
}).toFile('table.pdf', function(err, res) {
  if (err) return console.log(err);
  console.log(res); // { filename: '/path/to/table.pdf' }
});

module.exports = {QualityExcelGenerate}