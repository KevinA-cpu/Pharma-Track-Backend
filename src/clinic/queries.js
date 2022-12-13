const getClinic = "SELECT * FROM clinic ORDER BY ID ASC;";
const Search_TinhThanhPho = "SELECT * FROM clinic WHERE tinh_thanhpho = $1;";
const Search_TinhThanhPho_QuanHuyen = "SELECT * FROM clinic WHERE tinh_thanhpho = $1 and quan_huyen = $2";
const Search_TinhThanhPho_QuanHuyen_DiaChi = "SELECT * FROM clinic WHERE tinh_thanhpho = $1 and quan_huyen = $2 and diachi = $3";

const insertClinic =
  "INSERT INTO clinic (id_clinic,name_clinic,name_doctor,tinh_thanhpho,quan_huyen,diachi,status_clinic) VALUES($1 , $2, $3, $4, $5, $6, $7);";
const updateClinic = "UPDATE clinic SET name_clinic = $1 WHERE id_clinic = $2;";
const deleteClinic = "DELETE FROM clinic WHERE id_clinic = $1;";
const findClinic = "SELECT * FROM clinic WHERE id_clinic = $1;";
export default {
  getClinic,
  Search_TinhThanhPho,
  Search_TinhThanhPho_QuanHuyen,
  Search_TinhThanhPho_QuanHuyen_DiaChi,
  insertClinic,
  updateClinic,
  deleteClinic,
  findClinic,
};
