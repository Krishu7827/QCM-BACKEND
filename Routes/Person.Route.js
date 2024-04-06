const express = require('express');
const PersonRouter = express.Router();
const {upload} = require('../Middleware/Person.middleware');
const {PersonRegister,UploadProfile,Login,EmployeeList} = require('../Controller/PersonController.js');




/** SignUp Route */
PersonRouter.post('/SignUp',PersonRegister)

/** Upload Profile Route during SignUp */
PersonRouter.post('/UploadProfileImg',upload.single('Profile'),UploadProfile)

/** Login */
PersonRouter.post('/Login',Login)

/**Router to Get Employees List */
PersonRouter.get('/GetList',EmployeeList)










module.exports = {PersonRouter}