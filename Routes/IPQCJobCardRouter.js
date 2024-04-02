const express = require('express')
const {AddIPQCJobCard,JobCardList} = require('../Controller/IPQCJobCard')
const IPQCJobCardRouter = express.Router();





/** Route To Add Job Card */
IPQCJobCardRouter.post('/AddJobCard',AddIPQCJobCard);


/**Router To Get List Of Job Card Data */
IPQCJobCardRouter.get('/GetJobCardList',JobCardList)







module.exports = {IPQCJobCardRouter}