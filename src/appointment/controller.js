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
    const { time, doctor, test, number, address, status } = req.body;
    await pool.query(queries.insertAppointment, [
      time,
      doctor,
      test,
      number,
      address,
      status,
    ]);
    res.status(200).json({
      results: "success",
      message: "appointment insert successfully",
      data: {
        time: time,
        doctor: doctor,
        test: test,
        number: number,
        address: address,
        status: status,
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
        results: "fail",
        message: "appointment with id not found",
        data: {
          id_appointment: id_appointment,
        },
      });
      return;
    }

    await pool.query(queries.updateAppointmentStatus, [status, id_appointment]);
    res.status(200).json({
      results: "success",
      message: "appointment update successfully",
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
        results: "fail",
        message: "appointment with id not found",
        data: {
          id_appointment: id_appointment,
        },
      });
      return;
    }
    await pool.query(queries.deleteAppointment, [id_appointment]);
    res.status(200).json({
      results: "success",
      message: "appointment delete successfully",
      data: {
        id_appointment: id_appointment,
      },
    });
  } catch (error) {
    res.status();
    throw error;
  }
};
export default {
  getAppointment,
  insertAppointment,
  updateAppointmentStatus,
  deleteAppointment,
};
