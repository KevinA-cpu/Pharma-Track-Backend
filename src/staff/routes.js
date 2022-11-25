import { Router } from "express";
import controller from "./controller.js";

const router = Router();

router.get("/", controller.getStaff);

router.post("/", controller.insertStaff);

router.put("/", controller.updateStaffType);

router.delete("/:name", controller.deleteStaff);

export default router;
