const Path = require('path');
const fs = require('fs')
const pdf = require('html-pdf')
const { PDFDocument } = require('pdf-lib');

require('dotenv').config();

/** to Get current Date & Time */
function getCurrentDateTime() {
    const date = new Date();
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');
    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  };


  
 const htmlContent1 = ` <html>

<head>
    <style>
        body {
            font-family: arial, sans-serif;
            font-weight:bold;
        }

        .watermark {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0.1;
            /* Adjust the opacity as needed */
            z-index: -1;
            width: 80%;
            /* Adjust size as needed */
        }

        .container {
            display: table;
            width: 100%;
            margin-top: 56px;
            font-weight: medium;
            padding:-10px;
        }

        .row {
            display: table-row;
        }

        .cell {
            display: table-cell;
            padding-left: 5px;
            width: 50%;
            border: 1px solid black;
            padding: 5px
        }

        .cell p {
            margin: 0;
            padding: 0;

        }

        .cell .company-name {
            font-size: 13px;
        }

        .cell .address {
            font-size: 11px;
        }
        .empty-box{
           margin-top:0px;
            height: 20px;
            width: 100%;
           border-bottom: 1px solid black;
            border-right: 1px solid black;
            border-left: 1px solid black;
        }

          .empty-box1{
           margin-top:-12px;
            height: 20px;
            width: 100%;
           border-bottom: 1px solid black;
            border-right: 1px solid black;
            border-left: 1px solid black;
        }

              table {
            width: 100.3%;
            margin-top:0.5px;
            border-collapse: collapse;
            border-bottom: 1px solid black;
            border-right: 1px solid black;
            border-left: 1px solid black;
            
        }

        th, td {
            border: 1px solid #ddd;
           border: 1px solid black;
        }

        th {
            background-color: #f2f2f2;
            text-align: center;
            font-weight:bold;
        border: 1px solid black;
        }

        ul {
            list-style-type: none;
            padding-left: 0;
        }

        .parent {
            font-weight: bold;
            font-size:13px
        }

        .child {
            margin-left: 20px;
            font-size:10px
        }

        .serialNo{
          text-align: center;
          font-size:12px;
          font-weight:bold;
        }
        .center-td{
         text-align: center;
         font-size:12px;
         font-weight:bold;
        }


        .summary-desc {
            overflow: hidden;
            width: 100%;
        }

        .summary-desc-left, .summary-desc-right {
            float: left;
            box-sizing: border-box; /* Ensures padding and border are included in the width */
        }

        .summary-desc-left {
            width: 50%; /* Adjust the width as needed */
            border: 1px solid black; /* Adding border */
            padding-left:10px;
        }

        .summary-desc-right {
            width: 50%; /* Adjust the width as needed */
            border: 1px solid black; /* Adding border */
           
        }

        /* Clearfix to clear floats */
        .summary-desc::after {
            content: "";
            display: table;
            clear: both;
        }

       th, td {
    border: 1px solid black;
    page-break-inside: auto;
}

tr {
    page-break-inside: auto;
}
 
    </style>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="cell" style=" width: 50%; font-weight:bold;">
                <p style="font-size: 14px">Party Details:</p>
                <p class="company-name">A-tech Pneumatics Pvt Ltd.</p>
                <p class="address">209,2nd Floor Vardhaman Bee Pee Plaza , Plot No 1 sec -5 Dwarka New Delhi - 11007</p>
                <br>
                <br>
                <span style="font-size: 14px;">GSTIN/UIN :</span> <span
                    style=" font-size: 14px; margin-left:30px">07AAGCA1509H1Z0</span>
            </div>

            <!-- Second-->
            <div class="cell" style=" width: 55%;">
             <div style = " font-size:12px; font-weight:bold;">

                <div>

                    <div>
                        <span style="font-size: 12px;">Order No. :</span><span
                            style="font-size:12px; margin-left:32px;">GST 23</span>
                    </div>
                    <div>
                        <span style="font-size: 12px;">Dated :</span><span
                            style="font-size:12px; margin-left:52px;">20-01-2024</span>
                    </div>
                    <div>
                        <span style="font-size: 12px;">Payment Terms :</span><span
                            style="font-size:12px; margin-left:1px;">30 days credit</span>
                    </div>
                    <div>
                        <span style="font-size: 12px;">Delivery Terms:</span><span
                            style="font-size:12px; margin-left:10px;">Immediate</span>
                    </div>
                    <div>
                        <span style="font-size: 12px;">Contact Person:</span><span
                            style="font-size:12px; margin-left:10px;">Md Afroj</span>
                    </div>
                    <div>
                        <span style="font-size: 12px;">Cell No:</span><span
                            style="font-size:12px; margin-left:52px;">9999999999</span>
                    </div>
                    <div>
                        <span style="font-size: 12px;">Warranty:</span><span
                            style="font-size:12px; margin-left:44px;">9999999999</span>
                    </div>

                </div>


            </div>
        </div>
    </div>
</div>

<div class="empty-box">
          
</div>
<div class="empty-box1">
  <p style="font-size:12px; margin-left:5px; ">We are Pleased to place the order for the following items:</p>
</div>

  <!-----------------------  Table  ------------------------->
 <table class = "page-break">
    <thead>
        <tr>
            <th>S.N.</th>
            <th style="width:50%;">Description of Goods</th>
            <th>HSN/SAC Code</th>
            <th>Qty.</th>
            <th>Unit</th>
            <th>Price</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>
    
         <tr>
            <td class="serialNo" >2</td>
            <td>
                <ul>
                    <li class="parent">Cylinder
                        <ul>
                            <li class="child">Airtac Rotary Clamp Cylinder</li>
                            <li class="child">Model No. QCKR32X30S</li>
                        </ul>
                    </li>
                </ul>
            </td>
            <td class="center-td">XXXXX</td> <!-- Replace with actual HSN/SAC Code -->
            <td class="center-td" >2</td> <!-- Replace with actual Qty. -->
            <td class="center-td" >Pc</td>
            <td class="center-td" >1500</td> <!-- Replace with actual Price -->
            <td class="center-td" >3000</td> <!-- Replace with actual Amount -->
        </tr>

         <tr>
            <td class="serialNo" >2</td>
            <td>
                <ul>
                    <li class="parent">Cylinder
                        <ul>
                            <li class="child">Airtac Rotary Clamp Cylinder</li>
                            <li class="child">Model No. QCKR32X30S</li>
                        </ul>
                    </li>
                </ul>
            </td>
            <td class="center-td">XXXXX</td> <!-- Replace with actual HSN/SAC Code -->
            <td class="center-td" >2</td> <!-- Replace with actual Qty. -->
            <td class="center-td" >Pc</td>
            <td class="center-td" >1500</td> <!-- Replace with actual Price -->
            <td class="center-td" >3000</td> <!-- Replace with actual Amount -->
        </tr>

         <tr>
            <td class="serialNo" >2</td>
            <td>
                <ul>
                    <li class="parent">Cylinder
                        <ul>
                            <li class="child">Airtac Rotary Clamp Cylinder</li>
                            <li class="child">Model No. QCKR32X30S</li>
                        </ul>
                    </li>
                </ul>
            </td>
            <td class="center-td">XXXXX</td> <!-- Replace with actual HSN/SAC Code -->
            <td class="center-td" >2</td> <!-- Replace with actual Qty. -->
            <td class="center-td" >Pc</td>
            <td class="center-td" >1500</td> <!-- Replace with actual Price -->
            <td class="center-td" >3000</td> <!-- Replace with actual Amount -->
        </tr>

         <tr>
            <td class="serialNo" >2</td>
            <td>
                <ul>
                    <li class="parent">Cylinder
                        <ul>
                            <li class="child">Airtac Rotary Clamp Cylinder</li>
                            <li class="child">Model No. QCKR32X30S</li>
                        </ul>
                    </li>
                </ul>
            </td>
            <td class="center-td">XXXXX</td> <!-- Replace with actual HSN/SAC Code -->
            <td class="center-td" >2</td> <!-- Replace with actual Qty. -->
            <td class="center-td" >Pc</td>
            <td class="center-td" >1500</td> <!-- Replace with actual Price -->
            <td class="center-td" >3000</td> <!-- Replace with actual Amount -->
        </tr>

        <!----------------- @@@@ Last Row to final QTY and amount @@@@@@@@@@@@@@@@------>
        <tr style="height:50px;">
            <td style="border:0px solid black;" class="serialNo" ></td>
            <td style="border:0px solid black;">
                <p style = "text-align:center; font-weight:bold;">Total C/o </p>
            </td>
            <td style="border:0px solid black; font-weight:bold;" class="center-td"></td> <!-- Replace with actual HSN/SAC Code -->
            <td style="border:0px solid black; font-weight:bold;" class="center-td" style = "text-align:center; font-weight:bold;" >2</td> <!-- Replace with actual Qty. -->
            <td style="border:0px solid black; font-weight:bold;" class="center-td" style = "text-align:center; font-weight:bold;" >Pc</td>
            <td  style="border:0px solid black; font-weight:bold;" class="center-td" ></td> <!-- Replace with actual Price -->
            <td style="border:0px solid black; font-weight:bold;" class="center-td" style = "text-align:center; font-weight:bold;" >3000</td> <!-- Replace with actual Amount -->
        </tr>

    </tbody>
</table>

</body>

</html>`;





const options = {
  format: 'A4',
  footer: {
    height: '150px',
    contents: `<div style="width: 100%;" class="summary-desc">
         <div class="summary-desc-left">
           <p style="text-decoration: underline; font-size:10px;">Terms & Conditions</p>
           <p style="font-size:12px;">1. Purchase Order Is Inclusive of All taxes i.e GST </p>
           <p style="font-size:12px; margin-top:-10px;">2. All Material will be dispatch to Haridwar factory</p>
           <p style="font-size:12px; margin-top:-10px;">3. If the supplied qty is in excess of Purchase Order Qty, we may reject the excess supplied qty without any economic consideration.</p>
           <p style="font-size:12px; margin-top:-10px;">4. All disputes subject to Delhi Jurisdiction.</p>
         </div>

         <div class="summary-desc-right">
           <div>
             <p style="margin-left:10px; font-size:12px;">Receiver's signature</p>
           </div>

           <div style="height:102px; border-top:1px solid black">
             <p style="margin-right:10px; font-size:16px; text-align: end;">for Gautam Solar Private Limited</p>
             <p style="margin-right:10px; font-size:16px; text-align: end;">Authorised Signatory</p>
           </div>
         </div>
       </div>`
  },
  header: {
    height: '50px',
    contents: `<div style="width: 100%; border: 1px solid black;">
         <h4 style="text-decoration: underline; text-align: center; margin-top: 0px;">Purchase Order</h4>
         <h3 style="text-align: center; margin-top: -24px; letter-spacing: 2px;">Gautam Solar Private Limited (UNIT 11)</h3>
         <h4 style="text-align: center; margin-top: -22px; font-size: 13px;">Plot No 67-70 Sec 8A, IIE Ranipur Sidcul Haridwar, Uttarakhand - 249403</h4>
         <h4 style="text-align: center; margin-top: -19px; font-size: 13px;">GSTIN: 05AAFCG5884Q1ZU</h4>
         <h4 style="text-align: center; margin-top: -19px; font-size: 10px;">email: purchase@gautamsolar.com</h4>
       </div>`
  }
};

// Function to create PDF and return as a promise
function createPdf(html, options) {
  return new Promise((resolve, reject) => {
    pdf.create(html, options).toBuffer((err, buffer) => {
      if (err) return reject(err);
      resolve(buffer);
    });
  });
}

// Function to merge PDFs
async function mergePdfs(buffers) {
  const pdfDoc = await PDFDocument.create();
  for (const buffer of buffers) {
    const pdfBuffer = await PDFDocument.load(buffer);
    const pages = await pdfDoc.copyPages(pdfBuffer, pdfBuffer.getPageIndices());
    pages.forEach(page => pdfDoc.addPage(page));
  }
  const mergedPdf = await pdfDoc.save();
  return mergedPdf;
}

// Create and handle PDF buffers
async function generateAndMergePdfs() {
  try {
    let page1 = await createPdf(htmlContent1, options);
    let page2 = await createPdf(htmlContent1, options); // Assuming you want the same content for page2

    const mergedPdfBuffer = await mergePdfs([page1, page2]);

    fs.writeFile('merged.pdf', mergedPdfBuffer, (err) => {
      if (err) return console.log(err);
      console.log('Merged PDF created and saved as merged.pdf');
    });
  } catch (err) {
    console.error('Error generating or merging PDFs:', err);
  }
}

generateAndMergePdfs();




  module.exports = {getCurrentDateTime}