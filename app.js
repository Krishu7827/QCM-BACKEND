const express = require('express')
const { dbConn } = require('./db.config/db.config')
const { PersonRouter } = require('./Routes/Person.Route')
const { designationRouter } = require('./Routes/DesignationRoute')
const { IQCSolarCellRoute } = require('./Routes/IQCSolarCellRoute')
const { QualityRoute } = require('./Routes/QualityRoutes')
const path = require('path')
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
let a = {
  "currentuser": "personid",
  "shift": "shift",
  "shiftinchargename": "shiftinchargename",
  "shiftinchargeprelime": "shiftinchargeprelime",
  "shiftinchargepostlime": "shiftinchargepostlime",
  "productBarcode": "productBarcode",
  "wattage": "wattage",
  "modelnumber": "modelnumber",
  "othermodelnumber": "othermodelnumber",
  "issuetype": "issuetype",
  "otherissuetype": "otherissuetype",
  "stage": "stage",
  "responsibleperson": "responsibleperson",
  "reasonofissue": "reasonofissue",
  "issuecomefrom": "issuecomefrom",
  "actiontaken": "actiontaken",
}





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