const { v4: uuidv4, v4 } = require("uuid");
const { getCurrentDateTime } = require("../Utilis/MaintenanceUtilis");
const util = require("util");
const fs = require("fs");
const Path = require("path");
const { dbConn } = require("../db.config/db.config");
require("dotenv").config();
const PORT = process.env.PORT || 8080;

/** Making Sync To Query to Loop */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);

// let data = {
//   PurchaseData: {
//     series: "GST-2024-2025",
//     vochNo: "GST-2024-2025-01",
//     purcType: "L/GST-12%",
//     PartyName: "0213fe0c-cae1-4a07-858b-aeeefdaabe0d",
//     company: "fd86454f-4365-11ef-b658-1a2cd4d9c0d1",
//     narration: "jjjjjjsdkfksd",
//     currentDate: "Sat Jul 20 2024",
//     currentUser:'66494d8a-0786-11ef-8005-52549f6cc694'
//   },
//   BilingData: [
//     {
//       Bill_Sundry: "Discount",
//       Narration: "",
//       Percentage: "",
//       Amount: "0.00",
//       Total_Amount: "1080.80",
//     },
//     {
//       Bill_Sundry: "Freight",
//       Narration: "",
//       Percentage: "3",
//       Amount: "",
//       Total_Amount: "1080.80",
//     },
//     {
//       Bill_Sundry: "IGST",
//       Narration: "",
//       Percentage: "",
//       Amount: "",
//       Total_Amount: "1080.80",
//     },
//     {
//       Bill_Sundry: "SGST",
//       Narration: "",
//       Percentage: 6,
//       Amount: "57.90",
//       Total_Amount: "1080.80",
//     },
//     {
//       Bill_Sundry: "CGST",
//       Narration: "",
//       Percentage: 6,
//       Amount: "57.90",
//       Total_Amount: "1080.80",
//     },
//   ],
//   tableData: {
//     items: [
//       {
//         id: 1,
//         spareName: "fhgfgh",
//         modelNumber: "fghfgh",
//         qty: "4",
//         unit: "gfd",
//         price: "100",
//         gst: "10",
//         amount:200,
//         SparePartId: "10db5181-bed5-4a5d-b148-c0ce5a3f8822",
//       },
//       {
//         id: 1721468333869,
//         spareName: "fhgfgh",
//         modelNumber: "fghfgh",
//         qty: "5",
//         unit: "fgd",
//         price: "100",
//         gst: "5",
//         amount:200,
//         SparePartId: "10db5181-bed5-4a5d-b148-c0ce5a3f8822",
//       },
//     ],
//     totalAmount: '965',
//   },
//   optionalData: {
//     paymentTerm: "fsd",
//     deleveryTerm: "dgfs",
//     contactPer: "fdgs",
//     cellNo: "dfgs",
//     warranty: "",
//   },
// };

const AddPurchaseOrder = async (req, res) => {
  const { PurchaseData : P, BilingData : B, tableData:t, optionalData:o } = req.body;
  const UUID = v4();

  try{
    /**
     * ! Inserting Data into Purchase Table
     */
    const PurchaseDataQuery = `INSERT INTO 
    PurchaseOrder(Purchase_Order_Id, Voucher_Number, Series, Purchase_Type, Party_Name, Company_Name, Narration, 
    Purchase_Date, Status, Created_On, Created_By )
    VALUES('${UUID}', '${P.vochNo}', '${P.series}','${P.purcType}',
  '${P.PartyName}','${P.company}', '${P.narration}', '${P.currentDate}', 'Active', '${getCurrentDateTime()}','${P.currentUser}');`;

     await queryAsync(PurchaseDataQuery);

     /**
      * ? Inserting Data into Order Items Table
      */
     t.items.forEach(async(data)=>{
      const uuid = v4();
      const query = `INSERT INTO
    Purchase_Order_Items(Purchase_Order_Item_Id, Purchase_Order_Id, Spare_Part_Id, Quantity, Unit, Price_Rs,
    GST, Amount, Total_Amount)
    VALUES('${uuid}', '${UUID}', '${data.SparePartId}', '${data.qty}', '${data.unit}', '${data.price}', '${data.gst}', '${data.amount}','${t.totalAmount}');`;


      await queryAsync(query);
     })


    /**
   * ! INSERTING Data into Order Billing Table
   */
  B.forEach(async(data)=>{
    const uuid = v4()
      const query = `INSERT INTO 
      Purchase_Order_Billing(Purchase_Order_Billing_Id, Purchase_Order_Id, Bill_Sundry, 
      Narration, Percentage, Amount, Total_Amount)
      VALUES('${uuid}','${UUID}', '${data.Bill_Sundry}', '${data.Narration}', '${data.Percentage}',
            '${data.Amount}','${data.Total_Amount}');`;
    await queryAsync(query)

   })

   /**
    * ! Inserting Data into OPTIONAL Table
    */
   
   const optionQuery = `INSERT INTO Purchase_Order_Optional_Field(Optional_Field_Id,Purchase_Order_Id,Payment_Terms,
   Delivery_Terms, Contact_Person, Cell_Number, Warranty)
   VALUES('${v4()}','${UUID}', '${o.paymentTerm}', '${o.deleveryTerm}','${o.contactPer}','${o.cellNo}','${o.warranty}');`

   await queryAsync(optionQuery)

   res.send({msg:'data Inserted Succesfully'})
  }catch(err){
    console.log(err)
    res.status(400).send(err)
  }

};



/**
 * ! Get Voucher Number Controller
 */
const getVoucherNumber = async(req,res)=>{
    try{
    const query = `SELECT COUNT(Purchase_Order_Id)AS Voucher_Number FROM PurchaseOrder WHERE Status = 'Active';`
    const data = await queryAsync(query);
    const VoucherNumber = data[0]['Voucher_Number']+1;
    res.send({VoucherNumber:VoucherNumber})
    }catch(err){
    console.log(err)
    res.status(400).send(err)
    }
}

module.exports = {getVoucherNumber, AddPurchaseOrder}
