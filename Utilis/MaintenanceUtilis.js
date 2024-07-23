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


  
  const htmlContent1 = `
  <!DOCTYPE html>
  <html>
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
    opacity: 0.1; /* Adjust the opacity as needed */
    z-index: -1;
    width: 80%; /* Adjust size as needed */
  }
  
  .container {
    display: table;
    width: 100%;
   
    margin-top: 56px;
    font-weight:medium;
  }
  
  .row {
    display: table-row;
  }
  
  .cell {
    display: table-cell;
    padding-left: 5px;
    width: 50%;
    border: 1px solid black;
    padding:5px
  }
  
  .cell p {
    margin: 0;
    padding: 0;
   
  }
  
  .cell .company-name {
    font-size: 12px;
  }
  
  .cell .address {
    font-size: 8px;
  }
  
  </style>
  </head>
  <body>
  
  <div class="container">
      <div class="row">
          <div class="cell" style=" width: 50%;">
              <p style="font-size: 15px">Party Details:</p>
              <p class="company-name">Company Name</p>
              <p class="address">Address</p>
          </div>
          <div class="cell" style=" width: 55%;>
             <div>
              <p  style="font-size: 12px;">Order No.</p>
              <p style="font-size: 12px;">Dated</p>
               <p style="font-size: 12px;">Payment Terms</p>
                <p style="font-size: 12px;">Delivery Terms</p>
                 <p style="font-size: 12px;">Contact Person</p>
                 <p style="font-size: 12px;">Cell No</p>
                 <p style="font-size: 12px;">Warranty</p>
                 </div>

             
          </div>
      </div>
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