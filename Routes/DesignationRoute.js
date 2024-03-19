const express = require('express')
const designationRouter = express.Router()

const {getDesignationList} = require('../Controller/DesignationController.js')





/** To get Designation List */
designationRouter.get('/GetDesignationList',getDesignationList)



/** export */
module.exports = {designationRouter}