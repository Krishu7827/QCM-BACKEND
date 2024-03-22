const { dbConn } = require('../db.config/db.config')
const { generatePassword,s3,AWS,transport } = require('../Utilis/Person.utilis')
const bcrypt = require('bcrypt')
const JWT = require('jsonwebtoken')
require('dotenv').config()


/** Controller to Register Employee */
const PersonRegister = async (req, res) => {
    const { personid, employeeid, loginid, joblocation, fullname, department, designation } = req.body
    const PlainPassword = `${fullname.split(' ')[0]}@${generatePassword()}`
    console.log(PlainPassword)
    try {
        /** Hashed the Password */
        //const HashedPassword = await bcrypt.hash(PlainPassword,8)

        /**query to register a Employee */
        const query = `CALL PersonRegister('${personid}','${employeeid}','${fullname}','${loginid}','${PlainPassword}', '${joblocation}','krishukumar7827@gmail.com','${department}','','${designation}' )`

        const data = await new Promise((resolve,reject)=>{
             dbConn.query(query,(err,result)=>{
                if(err){
                   reject(err)
                }else{

                  resolve(result)
                }
             })
        })

        /** Sending A Email to Admin */
        await transport.sendMail({
        from: 'bhanu.galo@gmail.com',
        cc: 'bhanu.galo@gmail.com',
        to:'krishukumar7827@gmail.com' ,
        subject: 'Enrollment in Galo Energy Private Limited',
        html: `<div style="position: relative; padding: 5px;">
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-image: url('https://galo.co.in/wp-content/uploads/2024/01/Galo-Energy-Logo-06.png'); background-size: cover; background-position: center; background-repeat: no-repeat; opacity: 0.3; z-index: -1;"></div>
        <div style="background-color: rgba(255, 255, 255, 0.8); padding: 20px; border-radius: 10px;">
          <h3 style="color: #2f4f4f;">Welcome to Galo Energy Private Limited!</h3>
          <p style="font-size: 16px;">Dear ${fullname},</p>      
          <p style="font-size: 16px; margin-bottom: 0px;">Congratulations, you are now officially enrolled in Galo Energy Private Limited.</p>      
          <p style="font-size: 16px;">Below are your enrollment details:</p>
          <ul style="font-size: 16px;">
            <li><strong>Employee ID:</strong> ${loginid}</li>
            <li><strong>Password:</strong> ${PlainPassword}</li>
          </ul>
          <p style="font-size: 16px; margin-bottom: 0px;">Please keep your Employee ID and Password confidential for security reasons.</p>        
          <p style="font-size: 16px; margin-bottom: 0px;">If you have any questions or need assistance, feel free to contact us at <a href="mailto:info@galoenergy.com" style="color: #007bff;">info@galoenergy.com</a>.</p>
          <p style="font-size: 16px;">We look forward to working with you!</p>
          <br>
          <p style="font-size: 16px;"><em>Sincerely,</em></p>
          <p style="font-size: 16px;"><strong>Galo Energy HR Team</strong></p>
        </div>
      </div>`
      })
    
    res.send({msg:'Employee Registered Succesfully',data})
    } catch (err) {
        console.log(err)
        res.status(500).send({ err })
    }


}


/** Controller to Upload Profile Image */
const UploadProfile = async (req,res)=>{
    const {personid} = req.body;
    console.log(req.file.buffer) 
    try{
       
        /** Uploading Profile Image In S3 Bucket */
        const data = await new Promise((resolve, reject) => {
            s3.upload({
                Bucket: process.env.AWS_BUCKET_1,
                Key: personid,
                Body: req.file.buffer,
                ACL: "public-read-write",
                ContentType: req.body.FileFormat
            },(err,result)=>{
               if(err){
                reject(err)
               }else{
                resolve(result)
               }
            })
        });
    const query = `UPDATE Person SET ProfileImg = '${data.Location}' WHERE PersonID = '${personid}'`
    
    const SqlData = await new Promise((resolve,reject)=>{
       dbConn.query(query,(err,result)=>{
        if(err){
          reject(err)
        }else{
          resolve(result)
        }
       })
    })

    res.send({msg:'Profile Image Updated Succesfully'})
    }catch(err){
        console.log(err)
        res.status(500).send({err})
    }
}


const Login = async(req,res)=>{
  const {loginid,password} = req.body

  const query = `SELECT Password FROM Person Where LoginID = '${loginid}'`
try{
  const hashedPassword = await new Promise((resolve,reject)=>{
    dbConn.query(query,(err,result)=>{
      if(err){
        reject(err)
      }else{
        resolve(result)
      }
    })
  })
console.log(hashedPassword[0].Password)
  try{

  // const match = await bcrypt.compare(password,hashedPassword[0].Password)
   //console.log(match)
    if(hashedPassword[0].Password == password){

    const token = JWT.sign({},process.env.SecretKey)
    res.send({msg:'Login Successfull',token})
    }else{

     res.status(401).send({msg:'Wrong Password'})
    }
  }catch(err){

    res.status(500).send({err})
  }

}catch(err){

  res.status(500).send({err})
}
  
}



module.exports = {PersonRegister,UploadProfile,Login}