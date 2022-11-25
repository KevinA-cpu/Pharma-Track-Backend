import { Router } from "express";
import controller from "./controller.js";

const router = Router();

router.get("/", controller.getAppointment);

router.post("/", controller.insertAppointment);

router.put("/", controller.updateAppointmentStatus);

router.delete("/:id_appointment", controller.deleteAppointment);

export default router;
