const express = require('express')
const {AddIPQCJobCard} = require('../Controller/IPQCJobCard')
const IPQCJobCardRouter = express.Router();





/** Route To Add Job Card */
IPQCJobCardRouter.post('/AddJobCard',AddIPQCJobCard);







module.exports = {IPQCJobCardRouter}