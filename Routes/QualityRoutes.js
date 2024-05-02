const express = require('express');
const QualityRoute = express.Router();
const {IssueTypes:GetIssueTypes} = require('../Controller/QualityController')




/** Router To Get Listing of Isssues */
QualityRoute.get('/GetIssues',GetIssueTypes);




module.exports = {QualityRoute}