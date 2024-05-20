const AWS = require('aws-sdk');
const ExcelJS = require('exceljs');
const fs = require('fs');
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

async function QualityExcelGenerate(Data) {

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
  worksheet.mergeCells('A4:M4');
  worksheet.mergeCells('N1:P1');
  worksheet.mergeCells('N2:P2');

  /**Put Value in Cell */
  worksheet.getCell('A1').value = `Gautam Solar Pvt Ltd.`;
  worksheet.getCell('A4').value = 'JOB CARD';
  worksheet.getCell('N1').value = 'Page No. 1';
  worksheet.getCell('N2').value = `Doc No: ${Data[0]['DocNo']}`;
  /** Apply header styling */
  worksheet.getCell('A1').style = {
    alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 16, bold: true }
  }

  worksheet.getCell('A4').style = {
    alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 14, bold: true }
  }

  worksheet.getCell('N1').style = {
    alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 14, bold: true }
  }

  worksheet.getCell('N2').style = {
    alignment: { horizontal: 'center', vertical: 'middle' }, font: { size: 14, bold: true}
  }

  /**Apply Borders */
  worksheet.getCell('A1').border = Border;
  worksheet.getCell('N2').border = Border;
  worksheet.getCell('A4').border = Border;
  worksheet.getCell('M4').border = Border;
  worksheet.getCell('N1').border = Border;
  worksheet.getCell('P1').border = Border;
  worksheet.getCell('N2').border = Border;
  worksheet.getCell('P2').border = Border;

 
   //Save the workbook to a file
const excelBuffer = await workbook.xlsx.writeBuffer()
.then(buffer => {
  fs.writeFileSync('output.xlsx', buffer);
    console.log('Excel file saved successfully!');
})
.catch(error => {
  console.error('Error generating Excel file:', error);
});


}

// QualityExcelGenerate(
//   [
//     {
//       'DocNo':'kkdks'
//     }
//   ]
// )
module.exports = {getCurrentDateTime,s3};
  