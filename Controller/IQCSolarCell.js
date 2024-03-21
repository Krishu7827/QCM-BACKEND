





/**to Add Solar Cell In IQC */
const AddIQCSolarCell = (req, res) => {
  console.log(req.body.Rejected['CheckTypes'][0])
}



      /** Export Controllers */
      module.exports = { AddIQCSolarCell }



      // var SolarCell = {
      //   'Packaging': {
      //     'Characterstics': "packagingCharactersticsController.text",
      //     'MeasuringMethod': "packagingMeasuringMethodController.text",
      //     'Sampling': "packagingSamplingController.text",
      //     'SmapleSize': "packagingSampleSizeController.text",
      //     'Reference': "packagingReferenceDocController.text",
      //     'AcceptanceCriteria': "packagingAcceptanceCriteriaController.text"
          
      //   },
      //   'Visual': {
      //     'Characterstics': "visualCharactersticsController.text",
      //     'MeasuringMethod': "visualMeasuringMethodController.text",
      //     'Sampling': "visualSamplingController.text",
      //     'Reference': "visualReferenceDocController.text",
      //     'AcceptanceCriteria': "visualAcceptanceCriteriaController.text"
      //   },
      //   'Physical': {
      //     'Characterstics': "physicalCharactersticsController.text",
      //     'MeasuringMethod': "physicalMeasuringMethodController.text",
      //     'Sampling': "physicalSamplingController.text",
      //     'Reference': "physicalReferenceDocController.text",
      //     'AcceptanceCriteria': "physicalAcceptanceCriteriaController.text"
          
      //   },
      //   'FrontBus': {
      //     'Characterstics': "frontbusCharactersticsController.text",
      //     'MeasuringMethod': "frontbusMeasuringMethodController.text",
      //     'Sampling': "frontbusSamplingController.text",
      //     'Reference': "frontbusReferenceDocController.text",
      //     'AcceptanceCriteria': "frontbusAcceptanceCriteriaController.text"
      //   },
      //   'Verification': {
      //     'Characterstics': "verificationCharactersticsController.text",
      //     'MeasuringMethod': "verificationMeasuringMethodController.text",
      //     'Sampling': "verificationSamplingController.text",
      //     'Reference': "verificationReferenceDocController.text",
      //     'AcceptanceCriteria': "verificationAcceptanceCriteriaController.text"
      //   }
      // };
  
      // var Rejected = {
      //   "CheckTypes": [
      //     {"Packaging": "packagingRejection"},
      //     {"Visual": "visualRejection"},
          
      //   ],
      //   "Reason": "rejectionReasonController"
      // };