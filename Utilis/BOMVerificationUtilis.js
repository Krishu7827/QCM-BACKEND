const AWS = require('aws-sdk');
require('aws-sdk/lib/maintenance_mode_message').suppress = true;
require('dotenv').config()

/** to Get current Date & Time */
function getCurrentDateTime() {
    const date = new Date();
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');
    return `${day}-${month}-${year} ${hours}:${minutes}:${seconds}`;
  };


  /** Config to Upload Pdf in S3 Bucket */

  /** AWS Config */

/* Set AWS region **/
AWS.config.update({ region: 'ap-south-1' });

/* Set AWS credentials **/
AWS.config.credentials = new AWS.Credentials({
    accessKeyId: process.env.ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_ACCESS_KEY_SECRET
});

/* Create S3 instance **/
const s3 = new AWS.S3();

async function QualityExcelGenerate(Quality, FromDate, ToDate) {

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
  worksheet.mergeCells('A1:M3');


  /**Put Value in Cell */
  worksheet.getCell('A1').value = `Gautam Solar Pvt Ltd.`;

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

  /** Set The Column Names in Excel */
  var startCharCode = 'A'.charCodeAt(0);
  var endCharCode = 'M'.charCodeAt(0);
  let row = 3;
  worksheet.getRow(row).height = 40;

  let index = 0;
  let ColumnNames = ['Date','Shift', 'Shift InCharge Name PreLime', 'Shift InCharge Name PostLime', 'Product Barcode', 'Wattage', 'Model Number', 'Issue type',  'Stage', 'Taken Action', 'Reason Of Issue', 'Issue Come From', 'Found By']; 

  for (let i = startCharCode; i <= endCharCode; i++) {
    worksheet.getColumn(`${String.fromCharCode(i)}`).width = 20;
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).value = `${ColumnNames[index]}`;
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).style = {
      alignment: { horizontal: 'center', vertical: 'middle', wrapText:true}, font: { size: 10, bold: true }
    }
    worksheet.getCell(`${String.fromCharCode(i)}${row}`).border = Border;
    index++;
  }

  
row = row+1;

Quality.forEach((data)=>{
  worksheet.getRow(row).height = 40
  const style = { alignment: { horizontal: 'center', vertical: 'middle', wrapText: true }, font: { size: 9} }
  /**Put the value in cell */
  worksheet.getCell(`A${row}`).value = data['CreatedOn'];
  worksheet.getCell(`B${row}`).value = data['Shift'];
 // worksheet.getCell(`C${row}`).value = data['ShiftInChargeName'];
  worksheet.getCell(`C${row}`).value = data['ShiftInChargePreLime'];
  worksheet.getCell(`D${row}`).value = data['ShiftInChargePostLim'];
  worksheet.getCell(`E${row}`).value = data['ProductBarCode'];
  worksheet.getCell(`F${row}`).value = data['Wattage'];
  worksheet.getCell(`G${row}`).value = data['ModelName'];
  worksheet.getCell(`H${row}`).value = data['Issue'];
  worksheet.getCell(`I${row}`).value = data['Stage']; 
  worksheet.getCell(`J${row}`).value = data['ActionTaken'];
  worksheet.getCell(`K${row}`).value = data['ReasonOfIssue'];
  worksheet.getCell(`L${row}`).value = data['IssueComeFrom'];
  worksheet.getCell(`M${row}`).value = data['CreatedBy'];

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
  // worksheet.getCell(`N${row}`).border = Border;

  row++;
}); 
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

module.exports = {getCurrentDateTime,s3};
  