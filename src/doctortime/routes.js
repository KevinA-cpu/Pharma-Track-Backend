import { Router } from "express";
import controller from "./controller.js";

const router = Router();

router.get("/getDoctorShifts", controller.getDoctorAvailableShifts);

router.put("/updateDoctorShift", controller.updateDoctorShiftStatus);

export default router;
