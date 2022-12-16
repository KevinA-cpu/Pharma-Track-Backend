const checkClinicExists = async (id_clinic) => {
  try {
    const results = await pool.query(queries.findClinicWithID, [id_clinic]);
    if (!results.rows.length) return false;
    return true;
  } catch (error) {
    throw error;
  }
};

export { checkClinicExists };
