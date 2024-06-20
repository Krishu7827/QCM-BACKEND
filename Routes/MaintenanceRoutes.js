const express = require('express');
const MaintenanceRouter = express.Router()
const {AddMachineData} = require('../Controller/MachineController');
const {AddParty} = require('../Controller/PartyController');



/**Route to Add Party */
MaintenanceRouter.post('/AddParty',AddParty);


/**Route to Add Machine */
MaintenanceRouter.post('/AddMachine',AddMachineData);



module.exports = {MaintenanceRouter}