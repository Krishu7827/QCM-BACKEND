const express = require('express')
const { dbConn } = require('./db.config/db.config')
const { PersonRouter } = require('./Routes/Person.Route')
const { designationRouter } = require('./Routes/DesignationRoute')
const { IQCSolarCellRoute } = require('./Routes/IQCSolarCellRoute')
const { QualityRoute } = require('./Routes/QualityRoutes')
const ExcelJS = require('exceljs');
const fs = require('fs');
const { IPQC } = require('./Routes/IPQCRoute')
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 8080
//const ExcelJS = require('exceljs');
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
// let a = {
//   "currentuser": "personid",
//   "shift": "shift",
//   "shiftinchargename": "shiftinchargename",
//   "shiftinchargeprelime": "shiftinchargeprelime",
//   "shiftinchargepostlime": "shiftinchargepostlime",
//   "productBarcode": "productBarcode",
//   "wattage": "wattage",
//   "modelnumber": "modelnumber",
//   "othermodelnumber": "othermodelnumber",
//   "issuetype": "issuetype",
//   "otherissuetype": "otherissuetype",
//   "stage": "stage",
//   "responsibleperson": "responsibleperson",
//   "reasonofissue": "reasonofissue",
//   "issuecomefrom": "issuecomefrom",
//   "actiontaken": "actiontaken",
// }




const BOMExcelGenerate = async()=>{

let Data = [ 
  { 
  "TestDetailId":"cb1886b3-8c38-45bf-89e3-f33b0583e070",
  "DocNo":"GSPL/IPQC/GP/005",
  "RevNo":"1.0 & 12.08.2023",
  "RibbonMake":"",
  "CellSize":"",
  "RibbonSize":"fg",
  "Date":"2024-05-10",
  "Line":"XXXXX0008",
  "Shift":"Day Shift",
  "MachineNo":"",
  "OperatorName":"dpk",
  "CellMake":"",
  "Status":"Pending",
  "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1",
  "UpdatedBy":null,
  "CreatedOn":"10-05-2024 08:59:53",
  "UpdatedOn":null,
  "BussingStage":"Auto",
  "BusBarWidth":"vv",
  "Remarks":"vv",
  "Type":"Busbar",
  "Pdf":"http://srv515471.hstgr.cloud:8080/IPQC/Pdf/cb1886b3-8c38-45bf-89e3-f33b0583e070.pdf",
  "TestDetailId":"cb1886b3-8c38-45bf-89e3-f33b0583e070",
  "TestId":"466c98f6-8319-46f4-8d19-7fc8eada71a8",
  "Track":"Sample1",
  "TrackData":"[{\"sampleAControllers1\":\"cc\"},{\"sampleAControllers2\":\"cf\"}]",
  "PersonID":"08326670-ed04-11ee-b439-0ac93defbbf1",
  "EmployeeID":"Emp003",
  "Name":"Bhanu",
  "LoginID":"QCM",
  "Password":"Bhanu@3813",
  "WorkLocation":"fc9c8db9-e817-11ee-b439-0ac93defbbf1",
  "Email":"krishukumar7827@gmail.com",
  "Department":"84949eb1-e816-11ee-b439-0ac93defbbf1",
  "ProfileImg":"http://srv515471.hstgr.cloud:8080/Employee/Profile/08326670-ed04-11ee-b439-0ac93defbbf1Bhanu1716280504105294.jpg",
  "Desgination":"d66db440-e2ab-11ee-974e-12d6db81f661",
  "Status":"Active",
  "CreatedBy":null,
  "UpdatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1",
  "CreatedOn":null,
  "UpdatedOn":"21-05-2024 08:35:04",
  "CreadtedBy":null,
  "ReviewedBy":"Ajay Kumar"
  },
  { 
  "TestDetailId":"cb1886b3-8c38-45bf-89e3-f33b0583e070",
  "DocNo":"GSPL/IPQC/GP/005",
  "RevNo":"1.0 & 12.08.2023",
  "RibbonMake":"",
  "CellSize":"",
  "RibbonSize":"fg",
  "Date":"2024-05-10",
  "Line":"XXXXX0008",
  "Shift":"Day Shift",
  "MachineNo":"",
  "OperatorName":"dpk",
  "CellMake":"",
  "Status":"Pending",
  "CreatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1",
  "UpdatedBy":null,
  "CreatedOn":"10-05-2024 08:59:53",
  "UpdatedOn":null,
  "BussingStage":"Auto",
  "BusBarWidth":"vv",
  "Remarks":"vv",
  "Type":"Busbar",
  "Pdf":"http://srv515471.hstgr.cloud:8080/IPQC/Pdf/cb1886b3-8c38-45bf-89e3-f33b0583e070.pdf",
  "TestDetailId":"cb1886b3-8c38-45bf-89e3-f33b0583e070",
  "TestId":"bf5d8acf-1f8f-4c69-85cb-f32098fd1d02",
  "Track":"Sample2",
  "TrackData":"[{\"sampleBControllers1\":\"vv\"},{\"sampleBControllers2\":\"vv\"}]",
  "PersonID":"08326670-ed04-11ee-b439-0ac93defbbf1",
  "EmployeeID":"Emp003",
  "Name":"Bhanu",
  "LoginID":"QCM",
  "Password":"Bhanu@3813",
  "WorkLocation":"fc9c8db9-e817-11ee-b439-0ac93defbbf1",
  "Email":"krishukumar7827@gmail.com",
  "Department":"84949eb1-e816-11ee-b439-0ac93defbbf1",
  "ProfileImg":"http://srv515471.hstgr.cloud:8080/Employee/Profile/08326670-ed04-11ee-b439-0ac93defbbf1Bhanu1716280504105294.jpg",
  "Desgination":"d66db440-e2ab-11ee-974e-12d6db81f661",
  "Status":"Active",
  "CreatedBy":null,
  "UpdatedBy":"08326670-ed04-11ee-b439-0ac93defbbf1",
  "CreatedOn":null,
  "UpdatedOn":"21-05-2024 08:35:04",
  "CreadtedBy":null,
  "ReviewedBy":"Ajay Kumar"
  }]
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet('BOM Verification');
    let Style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:22, bold:true, italic:true
      }
    }
  
    let MatrixData = [{
      'Date':Data[0]['Date'],
      'Shift':Data[0]['Shift'],
      'Acceptance Crieteria':">-4N"
    },
  {
    'Line':Data[0]['Line'],
    'Buusing Stage':Data[0]['BussingStage'],
    'Operator Name':Data[0]['OperatorName'],
  },
  {
    'Ribbon Width':Data[0]['Line'],
    'Busbar Width':Data[0]['BussingStage'],
    'Result':"NA",
  }]
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
    worksheet.mergeCells('C7:D7')
    worksheet.mergeCells('E7:F7')
   
    
  
    /**putting value in cell */
    worksheet.getCell('E1').value = 'Page No.1';
    worksheet.getCell('A1').value = 'Gautam Solar Pvt. Ltd';
    worksheet.getCell('A3').value = `Ribbon To Busbar Peel Test Report`;
    worksheet.getCell('E2').value = `Doc No. ${Data[0]['DocNo']}`;
    worksheet.getCell('E3').value = `Doc No. ${Data[0]['RevNo']}`;
    worksheet.getCell('A7').value = 'Sample No';
    worksheet.getCell('B7').value = 'Ribbon No';
    worksheet.getCell('C7').value = 'Peel Value(N)';
    worksheet.getCell('E7').value = 'Remarks';
   
  
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
    worksheet.getCell('A7').style = {
      alignment:{horizontal:'center', vertical:'middle'},
      font:{size:11, bold:true
      }
    }
    worksheet.getCell('B7').style = {
      alignment:{horizontal:'center', vertical:'middle'},
      font:{size:11, bold:true
      }
    }
    worksheet.getCell('C7').style = {
      alignment:{horizontal:'center', vertical:'middle'},
      font:{size:11, bold:true
      }
    }
    worksheet.getCell('E7').style = {
      alignment:{horizontal:'center', vertical:'middle'},
      font:{size:11, bold:true
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
    worksheet.getCell('A7').border = Border;
    worksheet.getCell('B7').border = Border;
    worksheet.getCell('C7').border = Border;
    worksheet.getCell('D7').border = Border;
    worksheet.getCell('E7').border = Border;
    worksheet.getCell('F7').border = Border;
   
  
  
  
    /**Height */
    worksheet.getRow(1).height = 15;
    worksheet.getRow(2).height = 27;
    worksheet.getRow(3).height = 33;
    worksheet.getRow(row).height = 40;
    worksheet.getRow(7).height = 25.75;
  
    worksheet.getColumn('F').width = 16.86;
    worksheet.getColumn('C').width = 23;
    worksheet.getColumn('D').width = 23;
  
    var startCharCode = 'A'.charCodeAt(0); // 1
    var endCharCode = 'B'.charCodeAt(0); //3
    
    for (var i = startCharCode; i <= endCharCode; i++) {
    
      worksheet.getColumn(`${String.fromCharCode(i)}`).width = 21.75
      
    };
  
  // worksheet.getColumn('A').width = 28.40 
  MatrixData.forEach((data)=>{
   worksheet.getRow(row).height = 25;

   let length = 0;
   for(let key in data){
    length++; 
   }

   //2
   //[{"date":"3323","k":"kd","Rev":"fg"},{"date":"3323","k":"kd","Rev":"fg"}]//1
   let index = 0;
   var i = 'A'.charCodeAt(0);
   for(let key in data){

      if(index == length-1){

         worksheet.mergeCells(`C${row}:F${row}`)
         worksheet.getCell(`C${row}`).value = `${key}: ${data[key]}`;

      }else{
        worksheet.getCell(`${String.fromCharCode(i)}${row}`).value = `${key}: ${data[key]}`
        worksheet.getColumn(`${String.fromCharCode(i)}`).width = 28.40
        // worksheet.getCell(`B${row}`).value = `${key}: ${data[key]}`
      }

      /**Style */
      worksheet.getCell(`C${row}`).style = {
        alignment:{horizontal:'left', vertical:'middle',wrapText:true},
        font:{size:12, bold:true
        }
      }
      worksheet.getCell(`C${row}`).border = Border;
      worksheet.getCell(`${String.fromCharCode(i)}${row}`).style ={
        alignment:{horizontal:'left', vertical:'middle',wrapText:true},
        font:{size:12, bold:true
        }
      }
      worksheet.getCell(`${String.fromCharCode(i)}${row}`).border = Border

      
      
       
      index++;
      i++
   }
   row++;
  })
  
  row++;
  let RibbonNo = 1
   Data.forEach((data,i)=>{
   data['TrackData'] = JSON.parse(data['TrackData']);

    let SampleAControllerNo = 1;
    let firstRow = row;
  data['TrackData'].forEach((Track)=>{
    worksheet.getRow(row).height = 35.27;
     worksheet.getCell(`B${row}`).value = `R${RibbonNo}`
     worksheet.mergeCells(`C${row}:D${row}`)
     worksheet.mergeCells(`E${row}:F${row}`)
     worksheet.getCell(`C${row}`).value = Track[`sampleAControllers${SampleAControllerNo}`] || Track[`sampleBControllers${SampleAControllerNo}`]
     worksheet.getCell(`E${row}`).value = data['Remarks'];
   
     worksheet.getCell(`B${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, bold:false
      }
    }

    worksheet.getCell(`C${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, bold:false
      }
    }

    worksheet.getCell(`E${row}`).style = {
      alignment:{horizontal:'center', vertical:'middle',wrapText:true},
      font:{size:12, bold:false
      }
    }

    worksheet.getCell(`B${row}`).border = Border;
    worksheet.getCell(`C${row}`).border = Border;
    worksheet.getCell(`D${row}`).border = Border;
    worksheet.getCell(`E${row}`).border = Border;
    worksheet.getCell(`F${row}`).border = Border;

     RibbonNo++;
     SampleAControllerNo++;
     row++;
  })

  worksheet.mergeCells(`A${firstRow}:A${row-1}`);
  worksheet.getCell(`A${firstRow}`).value = `Sample ${i+1}`;
  
  worksheet.getCell(`A${firstRow}`).style = {
    alignment:{horizontal:'center', vertical:'middle',wrapText:true},
    font:{size:12, bold:true,
    }
  }

  worksheet.getCell(`A${firstRow}`).border = Border;
  worksheet.getCell(`A${row-1}`).border = Border;
   })

   worksheet.getRow(row).height = 38
   worksheet.mergeCells(`A${row}:C${row}`);
   worksheet.mergeCells(`D${row}:F${row}`);

   worksheet.getCell(`A${row}`).value = `Tested By: ${Data[0]['Name']}` 
   worksheet.getCell(`D${row}`).value = `Reviewed By: ${Data[0]['ReviewedBy']}`

   worksheet.getCell(`A${row}`).style = {
    alignment:{horizontal:'left', vertical:'middle',wrapText:true},
    font:{size:12, bold:true,
    }
  }

  worksheet.getCell(`D${row}`).style = {
    alignment:{horizontal:'left', vertical:'middle',wrapText:true},
    font:{size:12, bold:true,
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
  
 
  fs.writeFileSync('output.xlsx',excelBuffer)
  
  }


//BOMExcelGenerate()


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