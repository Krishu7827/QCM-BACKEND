const mysql = require('mysql')



const dbConn = mysql.createPool({
    host: 'qcm.cz2oiimue97z.ap-south-1.rds.amazonaws.com',
    user: 'admin',
    password: 'qcm12345',
    database: 'QCDev',
       })
  
  dbConn.getConnection(function (error) {
    if (error) {
      console.log(error, "ERROR");
      throw error;
    }
    console.log("Database Connected Successfully!!!");
  });
  
  const db = mysql.createPool({
    host: 'qcm.cz2oiimue97z.ap-south-1.rds.amazonaws.com',
    user: 'admin',
    password: 'qcm12345',
    database: 'IPQCP',
       })
  
  db.getConnection(function (error) {
    if (error) {
      console.log(error, "ERROR");
      throw error;
    }
    console.log("Database Connected Successfully!!!");
  });
module.exports = {dbConn,db};
  

