import pool from "../../db.js";
import queries from "./queries.js";
import { checkClinicExists } from "../checkForeignKeyContraint.js";
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
    const { name, number, type, department, id_clinic } = JSON.parse(req.body);
    const results = await checkClinicExists(id_clinic);
    if (!results) {
      res.status(404).json({
        results: "that bai",
        message:
          "khong tim thay clinic voi id tren, vi pham rang buoc khoa ngoai",
        data: {
          id_clinic: id_clinic,
        },
      });
      return;
    }
    await pool.query(queries.insertStaff, [
      name,
      number,
      type,
      department,
      id_clinic,
    ]);
    const results1 = await pool.query(queries.findStaffID, [
      name,
      number,
      id_clinic,
    ]);
    res.status(200).json({
      results: "thanh cong",
      message: "them staff thanh cong",
      data: {
        id_staff: results1.rows,
        name: name,
        number: number,
        type: type,
        department: department,
        id_clinic: id_clinic,
      },
    });
  } catch (error) {
    throw error;
  }
};

const updateStaffType = async (req, res) => {
  try {
    const { name, type } = JSON.parse(req.body);
    const results = await checkStaffExist(name);

    if (!results) {
      res.status(404).json({
        results: "that bai",
        message: "khong tim thay staff voi ten o duoi",
        data: {
          name: name,
        },
      });
      return;
    }

    await pool.query(queries.updateStaffType, [type, name]);
    res.status(200).json({
      results: "thanh cong",
      message: "cap nhat staff thanh cong",
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
    const { name } = JSON.parse(req.body);
    const results = await checkStaffExist(name);

    if (!results) {
      res.status(404).json({
        results: "that bai",
        message: "khong tim thay staff voi ten o duoi",
        data: {
          name: name,
        },
      });
      return;
    }

    await pool.query(queries.deleteStaff, [name]);
    res.status(200).json({
      results: "thanh cong",
      message: "xoa staff thanh cong",
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
    const { name } = JSON.parse(req.body);
    const results = await pool.query(queries.getDoctorByName, [name]);
    res.status(200).json(results.rows);
  } catch {
    throw error;
  }
};

const getStaffByDepartment = async (req, res) => {
  try {
    const { department } = JSON.parse(req.body);
    const results = await pool.query(queries.getStaffByDepartment, [
      department,
    ]);
    res.status(200).json(results.rows);
  } catch (error) {
    throw error;
  }
};

const getStaffByID = async (req, res) => {
  try {
    const { id_staff } = JSON.parse(req.body);
    const results = await pool.query(queries.getStaffByID, [id_staff]);
    res.status(200).json(results.rows);
  } catch (error) {
    throw error;
  }
};

const getStaffByClinicID = async (req, res) => {
  try {
    const { id_clinic } = JSON.parse(req.body);
    const results = await pool.query(queries.getStaffByClinicID, [id_clinic]);
    res.status(200).json(results.rows);
  } catch (error) {
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
  getStaffByID,
  getStaffByClinicID,
};
