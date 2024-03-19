const express = require('express');
const IQCSolarCellRoute = express.Router()
const {AddIQCSolarCell} = require('../Controller/IQCSolarCell')



/** to add IQC Solar Cell  */
IQCSolarCellRoute.post('/AddIQCSolarCell',AddIQCSolarCell)




/** Exporting Routes */
module.exports = {IQCSolarCellRoute}