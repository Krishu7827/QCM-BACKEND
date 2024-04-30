const { v4: uuidv4, v4 } = require('uuid');
const { getCurrentDateTime, s3 } = require('../Utilis/BOMVerificationUtilis')
const util = require('util');
const fs = require('fs');
const Path = require('path');
const { dbConn } = require('../db.config/db.config')

/** Making Sync To Query */
const queryAsync = util.promisify(dbConn.query).bind(dbConn);

const data = {
    "Type": "",
    "JobCardDetailId": "",
    "Status": "",
    "CreatedBy": "",
    "DocNo": "",
    "RevNo": "",
    "Date": "",
    "Shift": "",
    "Stages": [
        {
            "Stage": "",
            "WithoutSealant": "",
            "WithSealant": "",
            "DifferenceWeight": "",
            "BaseWeight": "",
            "CatalystWeight": "",
            "Ratio": ""

        },
        {
            "Stage": "",
            "WithoutSealant": "",
            "WithSealant": "",
            "DifferenceWeight": "",
            "BaseWeight": "",
            "CatalystWeight": "",
            "Ratio": ""

        },
        {
            "Stage": "",
            "WithoutSealant": "",
            "WithSealant": "",
            "DifferenceWeight": "",
            "BaseWeight": "",
            "CatalystWeight": "",
            "Ratio": ""

        },

    ]
};


const AddSealentWeight = async (req, res) => {
    const { Type, JobCardDetailId, Shift, Status, Date, CreatedBy, DocNo, RevNo } = req.body
    const Stages = req.body['Stages'];
    const UUID = v4()
    if (!JobCardDetailId) {
        try {
            const PreLamDetailQuery = `INSERT INTO PreLamDetail(PreLamDetailId,Type,DocNo,RevNo,Date,Shift,CheckedBy,CreatedBy,CreatedOn,Status)
    VALUES('${UUID}','${Type}','${DocNo}','${RevNo}','${Date}','${Shift}','${CreatedBy}','${CreatedBy}','${getCurrentDateTime()}','${Status}');`

            await queryAsync(PreLamDetailQuery);

            Stages.forEach(async (stage) => {
                const SealentWeightQuery = `INSERT INTO SealentWeight(PreLamDetailId,SealentWeightId,Stage,WithoutSealant,WithSealant,DiffWeight,BaseWeight,CatalystWeight,Ratio)
                               VALUES('${UUID}','${v4()}','${stage['Stage']}','${stage['WithoutSealant']}','${stage['WithSealant']}','${stage['DifferenceWeight']}','${stage['BaseWeight']}','${stage['CatalystWeight']}','${stage['Ratio']}');`
                await queryAsync(SealentWeightQuery);
            });

            res.send({ msg: 'Data Inserted Succesfully !', UUID });
        } catch (err) {
            console.log(err)
            res.status(400).send(err);
        }

    } else {
        try {
            const PreLamDetailQuery = `UPDATE PreLamDetail
   SET
       Type = '${Type}',
       DocNo = '${DocNo}',
       RevNo = '${RevNo}',
       Date = '${Date}',
       Shift = '${Shift}',
       CheckedBy = '${CreatedBy}',
       CreatedBy = '${CreatedBy}',
       CreatedOn = '${getCurrentDateTime()}',
       Status = '${Status}'
   WHERE
       PreLamDetailId = '${JobCardDetailId}';
   `
            await queryAsync(PreLamDetailQuery);

            Stages.forEach(async (stage) => {
                const SealentWeightQuery = `UPDATE SealentWeight
    SET
        WithoutSealant = '${stage['WithoutSealant']}',
        WithSealant = '${stage['WithSealant']}',
        DiffWeight = '${stage['DifferenceWeight']}',
        BaseWeight = '${stage['BaseWeight']}',
        CatalystWeight = '${stage['CatalystWeight']}',
        Ratio = '${stage['Ratio']}'
    WHERE
        PreLamDetailId = '${JobCardDetailId}' AND Stage = '${stage['Stage']}';
    `
                await queryAsync(SealentWeightQuery);

            });
            res.send({ msg: 'Data Inserted Succesfully !', UUID: JobCardDetailId });
        } catch (err) {
            console.log(err)
            res.status(400).send({ err })
        }

    }
}



module.exports = {AddSealentWeight}