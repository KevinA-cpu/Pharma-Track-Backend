import { Router } from "express";
import controller from "./controller.js";

const router = Router();

router.get("/", controller.getClinic);
router.get("/tinh_thanhpho", controller.Search_TinhThanhPho);
router.get("/tinh_thanhpho/quan_huyen", controller.Search_TinhThanhPho_QuanHuyen);
router.get("/tinh_thanhpho/quan_huyen/diachi", controller.Search_TinhThanhPho_QuanHuyen_DiaChi);

router.post("/", controller.insertClinic);

router.put("/", controller.updateClinic);

router.delete("/", controller.deleteClinic);

export default router;
