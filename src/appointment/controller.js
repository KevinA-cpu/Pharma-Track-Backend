import pool from "../../db.js";
import queries from "./queries.js";

const checkAppointmentExist = async (id_appointment) => {
  try {
    const results = await pool.query(queries.findAppointmentWithID, [
      id_appointment,
    ]);
    if (!results.rows.length) return false;
    return true;
  } catch (error) {
    throw error;
  }
};

const checkClinicExists = async (id_clinic) => {
  try {
    const results = await pool.query(queries.findClinicWithID, [id_clinic]);
    if (!results.rows.length) return false;
    return true;
  } catch (error) {
    throw error;
  }
};

const getAppointment = async (req, res) => {
  try {
    const results = await pool.query(queries.getAppointment);
    res.status(200).json(results.rows);
  } catch (error) {
    throw error;
  }
};

const insertAppointment = async (req, res) => {
  try {
    const { time, doctor, test, number, address, status, id_clinic, id_user } =
      req.body;
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
    await pool.query(queries.insertAppointment, [
      time,
      doctor,
      test,
      number,
      address,
      status,
      id_clinic,
      id_user,
    ]);
    res.status(200).json({
      results: "thanh cong",
      message: "them appointment thanh cong",
      data: {
        time: time,
        doctor: doctor,
        test: test,
        number: number,
        address: address,
        status: status,
        id_clinic: id_clinic,
        id_user: id_user,
      },
    });
  } catch (error) {
    throw error;
  }
};

const updateAppointmentStatus = async (req, res) => {
  try {
    const { id_appointment, status } = req.body;
    const results = await checkAppointmentExist(id_appointment);

    if (!results) {
      res.status(404).json({
        results: "that bai",
        message: "khong tim thay appointment voi id tren",
        data: {
          id_appointment: id_appointment,
        },
      });
      return;
    }

    await pool.query(queries.updateAppointmentStatus, [status, id_appointment]);
    res.status(200).json({
      results: "thanh cong",
      message: "appointment cap nhat thanh cong",
      data: {
        id_appointment: id_appointment,
        status: status,
      },
    });
  } catch (error) {
    throw error;
  }
};

const deleteAppointment = async (req, res) => {
  try {
    const id_appointment = req.params.id_appointment;
    const results = await checkAppointmentExist(id_appointment);

    if (!results) {
      res.status(404).json({
        results: "that bai",
        message: "khong tim thay appointment voi id o duoi",
        data: {
          id_appointment: id_appointment,
        },
      });
      return;
    }
    await pool.query(queries.deleteAppointment, [id_appointment]);
    res.status(200).json({
      results: "thanh cong",
      message: "appointment xoa thanh cong",
      data: {
        id_appointment: id_appointment,
      },
    });
  } catch (error) {
    throw error;
  }
};
export default {
  getAppointment,
  insertAppointment,
  updateAppointmentStatus,
  deleteAppointment,
};
