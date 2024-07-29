const express = require('express');
const MaintenanceRouter = express.Router()
const {AddMachineData, MachineDetailById, GetMachineModelNumberById} = require('../Controller/MachineController');
const {AddParty,getCurrency,getPartyNames} = require('../Controller/PartyController');
const {UploadImage,AddSpareParts,GetImage,getEquivalent,SparePartList} = require('../Controller/SparePartController');
const {upload} = require('../Middleware/Maintenance.middleware');
const {getVoucherNumber,AddPurchaseOrder, getPurchaseOrderList, getPurchaseOrderById} = require('../Controller/PurchaceOrderController')


/**Route to Add Party */
MaintenanceRouter.post('/AddParty',AddParty);

/**Route to Add Machine */
MaintenanceRouter.post('/AddMachine',AddMachineData);

/**Router To Get Machine Detail By Id */
MaintenanceRouter.get('/MachineDetailById',MachineDetailById);

/**Router To Get Machine Model Number by ID */
MaintenanceRouter.post('/GetMachineModelNumber',GetMachineModelNumberById);

/**Router To Upload Image for Spare Parts */
MaintenanceRouter.post('/SparePartsImage',upload,UploadImage)

/**Router To Add Add Spare Parts */
MaintenanceRouter.post('/AddSparePart',AddSpareParts)

// /**Router To Get Upload FIle FROM Spare Parts */
MaintenanceRouter.get('/File/:filename',GetImage)

/**Router to Get Equivalent data */
MaintenanceRouter.post('/Equ',getEquivalent)

/**Router to get Spare List & Brand Name & Spare Model Number */
MaintenanceRouter.post('/GetAutoData',SparePartList)

/**Router to Get Currency */
MaintenanceRouter.get('/GetCurrency',getCurrency);

/**Router To Get All Party Names */
MaintenanceRouter.get('/GetParty',getPartyNames);

/**Router to get Voucher Number */
MaintenanceRouter.get('/GetVoucherNumber',getVoucherNumber)

/**Router to Add Purchase Data  */
MaintenanceRouter.post('/AddPurchaseOrder', AddPurchaseOrder)

/**Router to Get Purchase Order List */
MaintenanceRouter.get('/GetPurchaseOrderList', getPurchaseOrderList)

/**Router to Get Purchase Order By PO Id For Edit PO */
MaintenanceRouter.post('/GetPurchaseOrderById', getPurchaseOrderById)

module.exports = {MaintenanceRouter}