const { transport } = require('../Utilis/Person.utilis')
const ExcelJS = require('exceljs');
const Path = require('path');
const fs = require('fs')
require('dotenv').config();



function QualityExcelGenerate(data){

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
  worksheet.mergeCells('A1:N2');


/**Put Value in Cell */
worksheet.getCell('A1').value = `Quality Report ${FromDate} to ${ToDate}`;

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
}