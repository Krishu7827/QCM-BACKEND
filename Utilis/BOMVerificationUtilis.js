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

const BOMExcelGenerate = async(Data)=>{

  //   let Data = [
  //     {"BOMId":"4c6e0e40-3a3c-4698-8deb-9f37b55fcb2f", "BOMDetailId":"d34b1924-f7d2-434d-9bac-ec40feb72e14", "BOMItem":"Flux", "Supplier":"", "ModelNo":"", "BatchNo":"", "Remarks":"", "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "UpdatedBy":null, "CreatedOn":"30-04-2024 04:01:08", "UpdatedOn":null, "BOMDetailId":"d34b1924-f7d2-434d-9bac-ec40feb72e14", "Type":"BOM Verification", "RevNo":"1.0 & 12.08.2023", "Date":"2024-04-30", "Shift":"gsg", "Line":"", "PONo":"66", "Status":"Inprogress", "CheckedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "ReviewedBy":null, "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "UpdatedBy":null, "CreatedOn":"30-04-2024 04:01:08", "UpdatedOn":null, "ReferencePdf":null, "DocNo":"GSPL\/IPQC\/BM\/002", "PersonID":"08326670-ed04-11ee-b439-0ac93defbbf1", "EmployeeID":"Emp003", "Name":"Bhanu", "LoginID":"QCM", "Password":"Bhanu@3813", "WorkLocation":"fc9c8db9-e817-11ee-b439-0ac93defbbf1", "Email":"krishukumar7827@gmail.com", "Department":"84949eb1-e816-11ee-b439-0ac93defbbf1", "ProfileImg":"http:\/\/srv515471.hstgr.cloud:8080\/Employee\/Profile\/08326670-ed04-11ee-b439-0ac93defbbf1Bhanu1716280504105294.jpg", "Desgination":"d66db440-e2ab-11ee-974e-12d6db81f661", "Status":"Active", "CreatedBy":null, "UpdatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "CreatedOn":null, "UpdatedOn":"21-05-2024 08:35:04", "CreadtedBy":null, 'ReviewedBy':"Nicky"},
  //   {"BOMId":"59adda3a-0511-475d-8a70-c9f47c0758b2", "BOMDetailId":"d34b1924-f7d2-434d-9bac-ec40feb72e14", "BOMItem":"Back Sheet", "Supplier":"", "ModelNo":"", "BatchNo":"", "Remarks":"", "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "UpdatedBy":null, "CreatedOn":"30-04-2024 04:01:08", "UpdatedOn":null, "BOMDetailId":"d34b1924-f7d2-434d-9bac-ec40feb72e14", "Type":"BOM Verification", "RevNo":"1.0 & 12.08.2023", "Date":"2024-04-30", "Shift":"gsg", "Line":"", "PONo":"66", "Status":"Inprogress", "CheckedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "ReviewedBy":null, "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "UpdatedBy":null, "CreatedOn":"30-04-2024 04:01:08", "UpdatedOn":null, "ReferencePdf":null, "DocNo":"GSPL\/IPQC\/BM\/002", "PersonID":"08326670-ed04-11ee-b439-0ac93defbbf1", "EmployeeID":"Emp003", "Name":"Bhanu", "LoginID":"QCM", "Password":"Bhanu@3813", "WorkLocation":"fc9c8db9-e817-11ee-b439-0ac93defbbf1", "Email":"krishukumar7827@gmail.com", "Department":"84949eb1-e816-11ee-b439-0ac93defbbf1", "ProfileImg":"http:\/\/srv515471.hstgr.cloud:8080\/Employee\/Profile\/08326670-ed04-11ee-b439-0ac93defbbf1Bhanu1716280504105294.jpg", "Desgination":"d66db440-e2ab-11ee-974e-12d6db81f661", "Status":"Active", "CreatedBy":null, "UpdatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "CreatedOn":null, "UpdatedOn":"21-05-2024 08:35:04", "CreadtedBy":null},
  //   {"BOMId":"91515448-8a5e-432b-9bc4-8cfb7658c195", "BOMDetailId":"d34b1924-f7d2-434d-9bac-ec40feb72e14", "BOMItem":"Frame Adhesive sealant", "Supplier":"", "ModelNo":"", "BatchNo":"", "Remarks":"", "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "UpdatedBy":null, "CreatedOn":"30-04-2024 04:01:08", "UpdatedOn":null, "BOMDetailId":"d34b1924-f7d2-434d-9bac-ec40feb72e14", "Type":"BOM Verification", "RevNo":"1.0 & 12.08.2023", "Date":"2024-04-30", "Shift":"gsg", "Line":"", "PONo":"66", "Status":"Inprogress", "CheckedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "ReviewedBy":null, "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "UpdatedBy":null, "CreatedOn":"30-04-2024 04:01:08", "UpdatedOn":null, "ReferencePdf":null, "DocNo":"GSPL\/IPQC\/BM\/002", "PersonID":"08326670-ed04-11ee-b439-0ac93defbbf1", "EmployeeID":"Emp003", "Name":"Bhanu", "LoginID":"QCM", "Password":"Bhanu@3813", "WorkLocation":"fc9c8db9-e817-11ee-b439-0ac93defbbf1", "Email":"krishukumar7827@gmail.com", "Department":"84949eb1-e816-11ee-b439-0ac93defbbf1", "ProfileImg":"http:\/\/srv515471.hstgr.cloud:8080\/Employee\/Profile\/08326670-ed04-11ee-b439-0ac93defbbf1Bhanu1716280504105294.jpg", "Desgination":"d66db440-e2ab-11ee-974e-12d6db81f661", "Status":"Active", "CreatedBy":null, "UpdatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1", "CreatedOn":null, "UpdatedOn":"21-05-2024 08:35:04", "CreadtedBy":null}
  // ]
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet('BOM Verification');
    let Style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:22, bold:true, italic:true
      }
    }
  
    let Border = {
      top: { style: 'thin' },
      bottom: { style: 'thin' },
      left: { style: 'thin' },
      right: { style: 'thin' }
    }
  
    let row = 4;
  
    
    /**Merging Cells */
    worksheet.mergeCells('A1:D2')
    worksheet.mergeCells('E1:F1')
    worksheet.mergeCells('A3:D3')
    worksheet.mergeCells('E2:F2')
    worksheet.mergeCells('E3:F3')
    worksheet.mergeCells(`C${row}:D${row}`)
    worksheet.mergeCells(`E${row}:F${row}`)
    
  
    /**putting value in cell */
    worksheet.getCell('E1').value = 'Page No.1';
    worksheet.getCell('A1').value = 'Gautam Solar Pvt. Ltd';
    worksheet.getCell('A3').value = `BOM Verification CheckSheet`;
    worksheet.getCell('E2').value = `Doc No. ${Data[0]['DocNo']}`;
    worksheet.getCell('E3').value = `Doc No. ${Data[0]['RevNo']}`;
    worksheet.getCell(`A${row}`).value = `Date: ${Data[0]['Date']}`;
    worksheet.getCell(`B${row}`).value = `Shift: ${Data[0]['Shift']}`;
    worksheet.getCell(`C${row}`).value = `Line: ${Data[0]['Line']}`;
    worksheet.getCell(`E${row}`).value = `PO No: ${Data[0]['PONo']}`;
  
    /**Giving Style to Cell */
    worksheet.getCell('E1').style = {
      alignment:{horizontal:'center', vertical:'middle'},
      font:{size:11, bold:true, italic:true
      }
    }
    
    worksheet.getCell('A3').style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:15, bold:true, italic:true
      }
    }
  
    worksheet.getCell('A1').style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:22, bold:true, italic:true
      }
    }
  
    worksheet.getCell('E2').style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:11, bold:true, italic:true
      }
    }
    worksheet.getCell('E3').style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:11, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`A${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:11, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`B${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:11, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`C${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:11, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`E${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:11, bold:true, italic:true
      }
    }
  
    /**Giving Border to Cell */
    worksheet.getCell('A1').border = Border
  
    worksheet.getCell('D2').border = Border
  
    worksheet.getCell('E1').border = {
      top:{style:'thin'},
      bottom:{style:'thin'}
    }
  
    worksheet.getCell('F1').border = {
      top:{style:'thin'},
      right:{style:'thin'},
      bottom:{style:'thin'}
    }
  
    worksheet.getCell('A3').border = Border;
    worksheet.getCell('D3').border = Border;
    worksheet.getCell('E2').border = Border;
    worksheet.getCell('F2').border = Border;
   worksheet.getCell('E3').border = Border;
    worksheet.getCell('F3').border = Border;
    worksheet.getCell(`A${row}`).border = Border;
    worksheet.getCell(`B${row}`).border = Border;
    worksheet.getCell(`C${row}`).border = Border;
    worksheet.getCell(`D${row}`).border = Border;
    worksheet.getCell(`E${row}`).border = Border;
    worksheet.getCell(`F${row}`).border = Border;
  
  
  
    /**Height */
    worksheet.getRow(1).height = 15;
    worksheet.getRow(2).height = 27;
    worksheet.getRow(3).height = 33;
    worksheet.getRow(row).height = 40;
  
    worksheet.getColumn('F').width = 16.86;
    worksheet.getColumn('C').width = 23;
    worksheet.getColumn('D').width = 23;
  
    var startCharCode = 'A'.charCodeAt(0); // 1
    var endCharCode = 'B'.charCodeAt(0); //3
    
    for (var i = startCharCode; i <= endCharCode; i++) {
    
      worksheet.getColumn(`${String.fromCharCode(i)}`).width = 21.9
      
    };
  
  
    row++;
    worksheet.getRow(row).height = 39;
    worksheet.getCell(`A${row}`).value = `BOM Item`;
    worksheet.getCell(`B${row}`).value = `Supplier`;
    worksheet.getCell(`C${row}`).value = `Specification/Model No.`;
    worksheet.getCell(`D${row}`).value = `Lot Batch No.`;
    worksheet.mergeCells(`E${row}:F${row}`)
  
    worksheet.getCell(`E${row}`).value = `Remarks if Any`
  
    worksheet.getCell(`A${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:14, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`B${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:14, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`C${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`D${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`E${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, bold:true, italic:true
      }
    }
  
    worksheet.getCell(`A${row}`).border = Border;
    worksheet.getCell(`B${row}`).border = Border;
    worksheet.getCell(`C${row}`).border = Border;
    worksheet.getCell(`D${row}`).border = Border;
    worksheet.getCell(`E${row}`).border = Border;
    worksheet.getCell(`F${row}`).border = Border;
  
  row++;
  
  Data.forEach((Bom)=>{
  
    worksheet.getRow(row).height = 36.24
    worksheet.getCell(`A${row}`).value = Bom['BOMItem'];
    worksheet.getCell(`B${row}`).value = Bom['Supplier'];
    worksheet.getCell(`C${row}`).value = Bom['ModelNo'];
    worksheet.getCell(`D${row}`).value = Bom['BatchNo'];
    worksheet.mergeCells(`E${row}:F${row}`)
    worksheet.getCell(`E${row}`).value = Bom['Remarks'];
  
    worksheet.getCell(`A${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, italic:true
      }
    }
  
    worksheet.getCell(`B${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12,  italic:true
      }
    }
  
    worksheet.getCell(`C${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12,  italic:true
      }
    }
  
    worksheet.getCell(`D${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, italic:true
      }
    }
  
    worksheet.getCell(`E${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12,  italic:true
      }
    }
  
    worksheet.getCell(`A${row}`).border = Border;
    worksheet.getCell(`B${row}`).border = Border;
    worksheet.getCell(`C${row}`).border = Border;
    worksheet.getCell(`D${row}`).border = Border;
    worksheet.getCell(`E${row}`).border = Border;
    worksheet.getCell(`F${row}`).border = Border;
    
    row++;
  })
  
  worksheet.getRow(row).height = 40;
  
  worksheet.mergeCells(`A${row}:C${row}`)
  worksheet.mergeCells(`D${row}:F${row}`)
  
  worksheet.getCell(`A${row}`).value = `Checked By: ${Data[0]['Name']}`;
  worksheet.getCell(`D${row}`).value = `Reviewed By: ${Data[0]['ReviewedBy']}`
  
  worksheet.getCell(`D${row}`).style = {
    alignment:{horizontal:'left', vertical:'middle',wrapText:true},
    font:{size:12,bold:true, italic:true
    }
  }
  
  worksheet.getCell(`A${row}`).style = {
    alignment:{horizontal:'left', vertical:'middle',wrapText:true},
    font:{size:12,bold:true,  italic:true
    }
  }
  
  worksheet.getCell(`A${row}`).border = Border;
  worksheet.getCell(`C${row}`).border = Border;
  worksheet.getCell(`D${row}`).border = Border;
  worksheet.getCell(`F${row}`).border = Border;
  
  //Save the workbook to a file
  const excelBuffer = await workbook.xlsx.writeBuffer()
  .then(buffer => {
    console.log('Excel file generated successfully!');
  
    return buffer; // Return the buffer
  })
  .catch(error => {
    console.error('Error generating Excel file:', error);
  });
  
  
  await transport.sendMail({
  from: 'ipqc.gautamsolar@gmail.com',
  cc: 'bhanu.galo@gmail.com',
  to: 'krishukumar535@gmail.com',
  subject: `IPQC BOM Verification Report: Module No. ${Data[0]['ModuleNo']}`,
  attachments: [{
    filename: `BOM_Verification_${Data[0]['PONo']}.xlsx`,
    content: excelBuffer,
    contentType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  }],
  html: `<div style="position: relative; padding: 5px;">
      <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-image: url('https://galo.co.in/wp-content/uploads/2024/01/Galo-Energy-Logo-06.png'); background-size: cover; background-position: center; background-repeat: no-repeat; opacity: 0.3; z-index: -1;"></div>
      <div style="background-color: rgba(255, 255, 255, 0.8); padding: 20px; border-radius: 10px;">
          <p style="font-size: 16px;">Dear Super Admin,</p>
          <p style="font-size: 16px; margin-bottom: 0;">Module No: ${Data[0]['PONo']} of BOM Verification has been Reviewed by ${Data[0]['ReviewedBy']}.</p>
          <p style="font-size: 16px;">Please find the attached Excel report for more details.</p>
          <br>
          <p style="font-size: 16px;"><em>Best regards,</em></p>
          <p style="font-size: 16px;"><strong>Gautam Solar QCM Team</strong></p>
      </div>
  </div>`
  })
  
  try{
  
    /** Define the folder path */
    const folderPath = Path.join('ExcelFile');
    
  
    /** Create the folder if it doesn't exist */
    if (!fs.existsSync(folderPath)) {
      fs.mkdirSync(folderPath, { recursive: true });
    }
  
      /** Define the file path, including the desired file name and format */
      const Excel = `${Data[0]['BOMDetailId']}.xlsx`;
      
      const ExcelFilePath = Path.join(folderPath, Excel);
   
  
    /** Save the file buffer to the specified file path */
    fs.writeFileSync(ExcelFilePath, excelBuffer);
   
  }catch(err){
  console.log(err)
  throw err;
  }
  return `${Data[0]['BOMDetailId']}.xlsx`;
  }

module.exports = {getCurrentDateTime,s3, BOMExcelGenerate};
  