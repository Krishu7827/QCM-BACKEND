const express = require('express')
const {AddIPQCJobCard,JobCardList} = require('../Controller/IPQCJobCard')
const {RoleAuthentication} = require('../Middleware/IPQC.Middleware')
const IPQCJobCardRouter = express.Router();





/** Route To Add Job Card */
IPQCJobCardRouter.post('/AddJobCard',AddIPQCJobCard);



/** Middleware to check Role Authentication */
IPQCJobCardRouter.use(RoleAuthentication)

/**Router To Get List Of Job Card Data */
IPQCJobCardRouter.get('/GetJobCardList',JobCardList)







module.exports = {IPQCJobCardRouter}