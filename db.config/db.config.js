const mysql = require('mysql')
const chalk = import('chalk')
require('dotenv').config()

const dbConn = mysql.createPool({
    host: process.env.Host,
    user: process.env.User,
    password: process.env.Password,
    database: process.env.Database,
       })
    
  dbConn.getConnection(async(error)=> { 
    const c =  await chalk
    if (error) {
      console.log(error, "ERROR");
    }else{
      console.log(c.default.blue('Database Connected Succesfully🎉 !'))
    }
  });
  

module.exports = {dbConn};
  

