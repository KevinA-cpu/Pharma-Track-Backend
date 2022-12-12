import pool from "../../db.js";
import queries from "./queries.js";

const checkClinicExists = async (id_clinic) => {
  try {
    const results = await pool.query(queries.findClinic, [id_clinic]);
    if (!results.rows.length) return false;
    return true;
  } catch (error) {
    throw error;
  }
};

const getClinic = async (req, res) => {
  try {
    const results = await pool.query(queries.getClinic);
    res.status(200).json(results.rows);
  } catch (error) {
    throw error;
  }
};

const Search_TinhThanhPho = async(req,res)=>{
  try {
    const {tinh_thanhpho} = req.body;
    const results = await pool.query(queries.Search_TinhThanhPho,[tinh_thanhpho]);
    if(!results.rows.length)
    {
      res.status(401).json({
        result: "Failed",
        reason : `Don't have Clinic with name ${tinh_thanhpho} in database`
      });
    }
    else
    {
      res.status(200).json(results.rows);
    }
  } catch (error) {
    throw error;
  }
}

const Search_TinhThanhPho_QuanHuyen = async(req,res) =>
{
  try {
    const {tinh_thanhpho,quan_huyen} = req.body;
    const results = await pool.query(queries.Search_TinhThanhPho_QuanHuyen,[tinh_thanhpho,quan_huyen]);
    if(!results.rows.length)
    {
      res.status(401).json({
        result: "Failed",
        reason : `Khong ton tai phong kham o tinh/thanhpho: ${tinh_thanhpho} va quan/huyen: ${quan_huyen} trong database`
      });
    }
    else
    {
      res.status(200).json(results.rows);
    }
  } catch (error) {
    throw error;
  }
}

const Search_TinhThanhPho_QuanHuyen_DiaChi = async(req,res) =>
{
  try {
    const {tinh_thanhpho,quan_huyen,diachi} = req.body;
    const results = await pool.query(queries.Search_TinhThanhPho_QuanHuyen_DiaChi,[tinh_thanhpho,quan_huyen,diachi]);
    if(!results.rows.length)
    {
      res.status(401).json({
        result: "Failed",
        reason : `Khong ton tai phong kham o tinh/thanhpho ${tinh_thanhpho} va quan/huyen ${quan_huyen} va diachi = ${diachi} trong database`
      });
    }
    else
    {
      res.status(200).json(results.rows);
    }
  } catch (error) {
    throw error;
  }
}

const insertClinic = async (req, res) => {
  try {
    const {id_clinic,name_clinic,name_doctor,tinh_thanhpho,quan_huyen,diachi,status_clinic} = req.body;
    const checkexists = checkClinicExists(id_clinic)
    if(checkexists === false)
    {
      await pool.query(queries.insertClinic, [id_clinic,name_clinic,name_doctor,tinh_thanhpho,quan_huyen,diachi,status_clinic]);
      res.status(200).json({
        results: "success",
        message: "Clinic insert successfully",
        data: {
          id_clinic: id_clinic,
          name_clinic: name_clinic,
          name_doctor: name_doctor,
          tinh_thanhpho: tinh_thanhpho,
          quan_huyen: quan_huyen,
          diachi:diachi,
          status_clinic: status_clinic
        },
      });  
    }
    else
    {
      res.status(404).json({
        results: "fail",
        message: "Clinic with is already exists",
        data: {
          id_clinic: id_clinic
        },
      });
    }
  } catch (error) {
    throw error;
  }
};

const updateClinic = async (req, res) => {
  try {
    const { name_clinic, id_clinic } = req.body;
    const results = await checkClinicExists(id_clinic);

    if (!results) {
      res.status(404).json({
        results: "fail",
        message: "Clinic with name not found",
        data: {
          name_clinic: name_clinic,
        },
      });
      return;
    }

    await pool.query(queries.updateClinic, [name_clinic,id_clinic]);
    res.status(200).json({
      results: "success",
      message: "Clinic update successfully",
      data: {
        name_clinic: name_clinic,
        id_clinic: id_clinic,
      },
    });
  } catch (error) {
    throw error;
  }
};

const deleteClinic = async (req, res) => {
  try {
    const { id_clinic } = req.body;
    const results = await checkClinicExists(id_clinic);

    if (!results) {
      res.status(404).json({
        results: "fail",
        message: "Clinic with id_clinic not found",
        data: {
          id_clinic:id_clinic
        },
      });
      return;
    }

    await pool.query(queries.deleteClinic, [id_clinic]);
    res.status(200).json({
      results: "success",
      message: "clinic delete successfully",
      data: {
        id_clinic: id_clinic,
      },
    });
  } catch (error) {
    throw error;
  }
};
export default {
  getClinic,
  Search_TinhThanhPho,
  Search_TinhThanhPho_QuanHuyen,
  Search_TinhThanhPho_QuanHuyen_DiaChi,
  insertClinic,
  updateClinic,
  deleteClinic,
};
