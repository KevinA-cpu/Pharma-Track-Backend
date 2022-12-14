import { Router } from "express";
import controller from "./controller.js";

const router = Router();

router.get("/", controller.getStaff);

router.get("/doctorName", controller.getDoctorByName);

router.get("/staffDepartment", controller.getStaffByDepartment);

router.get("/staffByID", controller.getStaffByID);

router.get("/staffByClinicID", controller.getStaffByClinicID);

router.post("/", controller.insertStaff);

router.put("/", controller.updateStaffType);

router.delete("/", controller.deleteStaff);

export default router;
