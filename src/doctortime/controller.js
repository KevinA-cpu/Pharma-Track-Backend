import pool from "../../db.js";
import queries from "./queries.js";

const getDoctorAvailableShifts = async (req, res) => {
  try {
    const { name } = req.body;
    const results = await pool.query(queries.getDoctorAvailableShifts, [name]);
    res.status(200).json(results.rows);
  } catch (error) {
    throw error;
  }
};

const updateDoctorShiftStatus = async (req, res) => {
  try {
    const { name, shift, action } = req.body;
    if (action === "book")
      await pool.query(queries.bookDoctorShift, [name, shift]);
    else await pool.query(queries.unbookDoctorShift, [name, shift]);
    res.status(200).json({
      results: "success",
      message: `shift ${action} successfully`,
      data: {
        name: name,
        shift: shift,
        action: action,
      },
    });
  } catch (error) {
    throw error;
  }
};

export default {
  getDoctorAvailableShifts,
  updateDoctorShiftStatus,
};
