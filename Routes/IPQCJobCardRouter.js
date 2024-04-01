const express = require('express')
const {AddIPQCJobCard} = require('../Controller/IPQCJobCard')
const IPQCJobCardRouter = express.Router();






IPQCJobCardRouter.post('/AddJobCard',AddIPQCJobCard);







module.exports = {IPQCJobCardRouter}