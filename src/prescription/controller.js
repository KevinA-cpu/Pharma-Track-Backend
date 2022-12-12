import pool from "../../db.js";
import queries from "./queries.js";
import moment from 'moment';
moment().format();

const checkPrescriptionExists = async (id_prescription) => {
  try {
    const results = await pool.query(queries.findPrescription, [id_prescription]);
    if (!results.rows.length) return false;
    return true;
  } catch (error) {
    throw error;
  }
};

const getPrescription = async (req, res) => {
  try {
    const results = await pool.query(queries.getPrescription);
    res.status(200).json(results.rows);
  } catch (error) {
    throw error;
  }
};

const getPrescriptionByIDPrescription = async (req, res) => {
  try {
    const {id_prescription} = req.body
    const results = await pool.query(queries.findPrescription,[id_prescription]);
    if(!results.rows.length)
    {
      res.status(401).json({
        result: "That bai",
        reason: `Khong co don thuoc duoc có ID ${id_prescription}`
      })
    }
    else
    {
      res.status(200).json(results.rows);
    }
  } catch (error) {
    throw error;
  }
};

const getPrescriptionByDateMedical = async (req, res) => {
  try {
    const {date_medical} = req.body
    const results = await pool.query(queries.getPrescriptionByDateMedical,[date_medical]);
    if(!results.rows.length)
    {
      res.status(401).json({
        result: "That bai",
        reason: `Khong co don thuoc duoc thuc hien vao ngay ${date_medical}`
      })
    }
    else
    {
      res.status(200).json(results.rows);
    }
  } catch (error) {
    throw error;
  }
};

const insertPrescription = async (req, res) => {
  try {
    const {id_prescription,image,date_medical} = req.body;
    const check = checkPrescriptionExists(id_prescription);
    if(check === false)
    {
      await pool.query(queries.insertPrescription, [id_prescription,image,date_medical]);
      res.status(200).json({
        results: "success",
        message: "Prescription insert successfully",
        data: {
          id_prescription : id_prescription ,
          image: image,
          date_medical: date_medical 
        },
      });
    }
    else
    {
      res.status(401).json({
        results: "failed",
        message: "Prescription is already exist",
        data: {
          id_prescription : id_prescription ,
          image: image,
          date_medical: date_medical 
        },
      });
    }
  } catch (error) {
    throw error;
  }
};

const updatePrescription = async (req, res) => {
  try {
    const { date_medical, id_prescription } = req.body;
    const results = await checkPrescriptionExists(id_prescription);

    if (!results) {
      res.status(404).json({
        results: "fail",
        message: "prescription with name not found",
        data: {
            id_prescription: id_prescription,
        },
      });
      return;
    }

    await pool.query(queries.updatePrescription, [date_medical, id_prescription]);
    res.status(200).json({
      results: "success",
      message: "prescription update successfully",
      data: {
        date_medical: date_medical,
        id_prescription: id_prescription,
      },
    });
  } catch (error) {
    throw error;
  }
};

const deletePrescription = async (req, res) => {
  try {
    const { id_prescription } = req.body;
    const results = await checkPrescriptionExists(id_prescription);

    if (!results) {
      res.status(404).json({
        results: "fail",
        message: "Prescription with name not found",
        data: {
            id_prescription: id_prescription,
        },
      });
      return;
    }

    await pool.query(queries.deletePrescription, [id_prescription]);
    res.status(200).json({
      results: "success",
      message: "staff delete successfully",
      data: {
        id_prescription: id_prescription,
      },
    });
  } catch (error) {
    throw error;
  }
};
export default {
  getPrescription,
  getPrescriptionByIDPrescription,
  getPrescriptionByDateMedical,
  insertPrescription,
  updatePrescription,
  deletePrescription,
};