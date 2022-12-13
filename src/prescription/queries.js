const getPrescription = "SELECT * FROM prescription order by date_medical asc;";
const getPrescriptionByDateMedical = "SELECT* FROM prescription where date_medical = $1;"
const insertPrescription =
  "INSERT INTO prescription (id_prescription,image,date_medical) VALUES($1 , $2, $3);";
const updatePrescription = "UPDATE prescription SET date_medical = $1 WHERE id_prescription = $2;";
const deletePrescription = "DELETE FROM prescription WHERE id_prescription = $1;";
const findPrescription = "SELECT * FROM prescription WHERE id_prescription = $1;";
export default {
  getPrescription,
  getPrescriptionByDateMedical,
  insertPrescription,
  updatePrescription,
  deletePrescription,
  findPrescription,
};
