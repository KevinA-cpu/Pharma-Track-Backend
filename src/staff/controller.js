import pool from "../../db.js";
import queries from "./queries.js";

const checkStaffExist = async (name) => {
  try {
    const results = await pool.query(queries.findStaffWithName, [name]);
    if (!results.rows.length) return false;
    return true;
  } catch (error) {
    throw error;
  }
};

const getStaff = async (req, res) => {
  try {
    const results = await pool.query(queries.getStaff);
    res.status(200).json(results.rows);
  } catch (error) {
    throw error;
  }
};

const insertStaff = async (req, res) => {
  try {
    const { name, number, type } = req.body;
    await pool.query(queries.insertStaff, [name, number, type]);
    res.status(200).json({
      results: "success",
      message: "staff insert successfully",
      data: {
        name: name,
        number: number,
        type: type,
      },
    });
  } catch (error) {
    throw error;
  }
};

const updateStaffType = async (req, res) => {
  try {
    const { name, type } = req.body;
    const results = await checkStaffExist(name);

    if (!results) {
      res.status(404).json({
        results: "fail",
        message: "staff with name not found",
        data: {
          name: name,
        },
      });
      return;
    }

    await pool.query(queries.updateStaffType, [type, name]);
    res.status(200).json({
      results: "success",
      message: "staff update successfully",
      data: {
        name: name,
        type: type,
      },
    });
  } catch (error) {
    throw error;
  }
};

const deleteStaff = async (req, res) => {
  try {
    const { name } = req.body;
    const results = await checkStaffExist(name);

    if (!results) {
      res.status(404).json({
        results: "fail",
        message: "staff with name not found",
        data: {
          name: name,
        },
      });
      return;
    }

    await pool.query(queries.deleteStaff, [name]);
    res.status(200).json({
      results: "success",
      message: "staff delete successfully",
      data: {
        name: name,
      },
    });
  } catch (error) {
    throw error;
  }
};
const getDoctorByName = async (req, res) => {
  try {
    const { name } = req.body;
    const results = await pool.query(queries.getDoctorByName, [name]);
    res.status(200).json(results.rows);
  } catch {
    res.status(500).json(failMessage);
    throw error;
  }
};

const getStaffByDepartment = async (req, res) => {
  try {
    const { department } = req.body;
    const results = await pool.query(queries.getStaffByDepartment, [
      department,
    ]);
    res.status(200).json(results.rows);
  } catch (error) {
    res.status(500).json(failMessage);
    throw error;
  }
};
export default {
  getStaff,
  insertStaff,
  updateStaffType,
  deleteStaff,
  getDoctorByName,
  getStaffByDepartment,
};
