const express = require('express');
const IQCSolarCellRoute = express.Router()
const {AddIQCSolarCell, GetIQCSolarCellTests} = require('../Controller/IQCSolarCell')



/** to add IQC Solar Cell  */
IQCSolarCellRoute.post('/AddIQCSolarCell',AddIQCSolarCell)

/** to Get All tests with checked Person*/
IQCSolarCellRoute.get('/GetIQCTests',GetIQCSolarCellTests)




/** Exporting Routes */
module.exports = {IQCSolarCellRoute}