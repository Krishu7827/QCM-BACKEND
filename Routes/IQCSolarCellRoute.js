const express = require('express');
const IQCSolarCellRoute = express.Router()
const {AddIQCSolarCell, GetIQCSolarCellTests,GetSpecificSolarCellTest} = require('../Controller/IQCSolarCell')
const {RoleAuthentication} = require('../Middleware/IQCSolarCell.Middleware')


/** to add IQC Solar Cell  */
IQCSolarCellRoute.post('/AddIQCSolarCell',AddIQCSolarCell)


IQCSolarCellRoute.use(RoleAuthentication)
/** to Get All tests with checked Person*/
IQCSolarCellRoute.post('/GetIQCTests',GetIQCSolarCellTests)

/** to Get Specific Test */
IQCSolarCellRoute.post('/GetSpecificTest',GetSpecificSolarCellTest)


/** Exporting Routes */
module.exports = {IQCSolarCellRoute}