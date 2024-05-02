const { v4: uuidv4, v4 } = require('uuid');
const { dbConn } = require('../db.config/db.config')
const util = require('util');
const fs = require('fs');
const Path = require('path');
const { getCurrentDateTime, s3, ExcelGenerate } = require('../Utilis/IQCSolarCellUtilis');

require('dotenv').config()


/** Making Sync To Query to Loop */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);



/**Get Listing of Issues Type */

const IssueTypes = async(req,res)=>{
    try{
        let query = `SELECT IssueId, Issue FROM IssuesType;`

        let Issues = await queryAsync(query);
        console.log(Issues);
        res.send({Issues});
    }catch(err){
       console.log(err);
       res.send({err})
    }
}


module.exports = {IssueTypes}