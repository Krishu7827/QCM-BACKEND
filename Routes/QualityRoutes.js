const express = require('express');
const QualityRoute = express.Router();
const {IssueTypes:GetIssueTypes,GetModelListing} = require('../Controller/QualityController')




/** Router To Get Listing of Isssues */
QualityRoute.get('/GetIssues',GetIssueTypes);

/** Router To Get Listing of Model */
QualityRoute.get('/GetIssues',GetIssueTypes);

/** Router To Get Listing of Model */
QualityRoute.get('/GetModels',GetModelListing);

module.exports = {QualityRoute}