const Path = require('path');
const fs = require('fs')
const pdf = require('html-pdf')

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


  
  const htmlContent1 = `<html>

<head>
    <style>
        body {
            font-family: arial, sans-serif;
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
           margin-top:-11px;
            height: 20px;
            width: 100%;
           border-bottom: 1px solid black;
            border-right: 1px solid black;
            border-left: 1px solid black;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="cell" style=" width: 50%;">
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
             <div style = " font-size:12px;">

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
  <p style="font-size:12px; margin-left:5px">We are Pleased to place the order for the following items:</p>
</div>
</body>

</html>
  `;
  
// Define options for the PDF
const options = { format: 'A4' };

// Create the PDF
pdf.create(htmlContent1,{
   format:'A4',
   header:{
    height:'50px',
    contents:`<div style="width: 100%; border: 1px solid black;">
         <h4 style="text-decoration: underline; text-align: center; margin-top: 0px;">Purchase Order</h4>
        <h3 style=" text-align: center; margin-top: -24px; letter-spacing: 2px; ">Gautam Solar Private Limited (UNIT 11)</h3>
        <h4 style="text-align: center; margin-top: -22px; font-size: 13px;">Plot No 67-70 Sec 8A, IIE Ranipur Sidcul Haridwar, Uttarakhand - 249403</h4>
        <h4 style="text-align: center; margin-top: -19px; font-size: 13px;">GSTIN: 05AAFCG5884Q1ZU</h4>
        <h4 style="text-align: center; margin-top: -19px; font-size: 10px;">email: purchase@gautamsolar.com</h4>
    </div>`
   }
}).toFile('po.pdf', function(err, res) {
  if (err) return console.log(err);
  console.log(res); // { filename: '/path/to/table.pdf' }
})


  module.exports = {getCurrentDateTime}