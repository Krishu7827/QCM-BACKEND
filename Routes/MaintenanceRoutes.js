const express = require('express');
const MaintenanceRouter = express.Router()
const {AddMachineData,MachineDetailById} = require('../Controller/MachineController');
const {AddParty} = require('../Controller/PartyController');



/**Route to Add Party */
MaintenanceRouter.post('/AddParty',AddParty);


/**Route to Add Machine */
MaintenanceRouter.post('/AddMachine',AddMachineData);


/**Router To Get Machine Detail By Id */
MaintenanceRouter.post('/MachineDetailById',MachineDetailById);

module.exports = {MaintenanceRouter}