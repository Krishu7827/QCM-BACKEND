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

let data = {
  PurchaseData: {
    series: "GST-2024-2025",
    vochNo: "GST-2024-2025",
    purcType: "L/GST-12%",
    PartyName: "0c270aeb-023b-4191-abd9-44da628131b0",
    company: "Gautam Solar Private Limited Bhiwani",
    narration: "",
    currentDate: "Sat Jul 20 2024",
  },
  BilingData: [
    {
      Bill_Sundry: "Discount",
      Narration: "",
      Percentage: "",
      Amount: "0.00",
      Total_Amount: "1080.80",
    },
    {
      Bill_Sundry: "Freight",
      Narration: "",
      Percentage: "3",
      Amount: "",
      Total_Amount: "1080.80",
    },
    {
      Bill_Sundry: "IGST",
      Narration: "",
      Percentage: "",
      Amount: "",
      Total_Amount: "1080.80",
    },
    {
      Bill_Sundry: "SGST",
      Narration: "",
      Percentage: 6,
      Amount: "57.90",
      Total_Amount: "1080.80",
    },
    {
      Bill_Sundry: "CGST",
      Narration: "",
      Percentage: 6,
      Amount: "57.90",
      Total_Amount: "1080.80",
    },
  ],
  tableData: {
    items: [
      {
        id: 1,
        spareName: "fhgfgh",
        modelNumber: "fghfgh",
        qty: "4",
        unit: "gfd",
        price: "100",
        gst: "10",
        SparePartId: "10db5181-bed5-4a5d-b148-c0ce5a3f8822",
      },
      {
        id: 1721468333869,
        spareName: "fhgfgh",
        modelNumber: "fghfgh",
        qty: "5",
        unit: "fgd",
        price: "100",
        gst: "5",
        SparePartId: "10db5181-bed5-4a5d-b148-c0ce5a3f8822",
      },
    ],
    totalAmount: 965,
  },
  optionalData: {
    paymentTerm: "fsd",
    deleveryTerm: "dgfs",
    contactPer: "fdgs",
    cellNo: "dfgs",
    warranty: "",
  },
};

const AddPurchaseOrder = async (req, res) => {
  const { PurchaseData, BilingData, tableData, optionalData } = data;
  const UUID = v4();

  try{
    const PurchaseDataQuery = `INSERT INTO 
    PurchaseOrder(Purchase_Order_Id, Voucher_Number, Series, Purchase_Type, Party_Name,Company_Name, Narration, 
    Purchase_Date, Status, Created_On, Created_By )
    VALUES('${UUID}', '${PurchaseData.vochNo}', '${PurchaseData.series}','${PurchaseData.purcType}')`
  }catch(err){
    console.log(err)
  }
  
};

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

module.exports = {getVoucherNumber}
