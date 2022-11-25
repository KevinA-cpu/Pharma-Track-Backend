const getStaff = "SELECT * FROM staff;";
const insertStaff =
  "INSERT INTO staff (name, number, type) VALUES($1 , $2, $3);";
const updateStaffType = "UPDATE staff SET type = $1 WHERE name = $2;";
const deleteStaff = "DELETE FROM staff WHERE name = $1;";
const findStaffWithName = "SELECT * FROM staff WHERE name = $1;";
export default {
  getStaff,
  insertStaff,
  updateStaffType,
  deleteStaff,
  findStaffWithName,
};
