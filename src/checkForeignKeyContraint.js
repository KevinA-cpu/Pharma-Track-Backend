import pool from "../db.js";
const findClinicWithID = "SELECT * FROM clinic WHERE id_clinic = $1;";
const checkClinicExists = async (id_clinic) => {
  try {
    const results = await pool.query(findClinicWithID, [id_clinic]);
    if (!results.rows.length) return false;
    return true;
  } catch (error) {
    throw error;
  }
};

export { checkClinicExists };
