const getAppointment = "SELECT * FROM appointment;";
const insertAppointment =
  "INSERT INTO appointment (time, doctor, test, number, address, status) VALUES($1 , $2, $3, $4, $5, $6);";
const updateAppointmentStatus =
  "UPDATE appointment SET status = $1 WHERE id_appointment = $2;";
const deleteAppointment = "DELETE FROM appointment WHERE id_appointment = $1;";
const findAppointmentWithID =
  "SELECT * FROM appointment WHERE id_appointment = $1;";
export default {
  getAppointment,
  insertAppointment,
  updateAppointmentStatus,
  deleteAppointment,
  findAppointmentWithID,
};