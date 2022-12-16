const getAppointment = "SELECT * FROM appointment;";
const insertAppointment =
  "INSERT INTO appointment (time, doctor, test, number, address, status, id_clinic, id_user) VALUES($1 , $2, $3, $4, $5, $6, $7, $8);";
const updateAppointmentStatus =
  "UPDATE appointment SET status = $1 WHERE id_appointment = $2;";
const deleteAppointment = "DELETE FROM appointment WHERE id_appointment = $1;";
const findAppointmentWithID =
  "SELECT * FROM appointment WHERE id_appointment = $1;";
const findClinicWithID = "SELECT * FROM clinic WHERE id_clinic = $1;";
export default {
  getAppointment,
  insertAppointment,
  updateAppointmentStatus,
  deleteAppointment,
  findAppointmentWithID,
  findClinicWithID,
};
