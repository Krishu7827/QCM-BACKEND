const mysql = require('mysql')
const chalk = import('chalk')


const dbConn = mysql.createPool({
    host: '93.127.167.249',
    user: 'admin',
    password: 'QCMDev@123',
    database: 'QCMDev',
       })
    
  dbConn.getConnection(async(error)=> {
    const c =  await chalk
    if (error) {
      console.log(error, "ERROR");
    }else{
      console.log(c.default.blue('Database Connected Succesfully !'))
    }
  });
  

module.exports = {dbConn};
  

