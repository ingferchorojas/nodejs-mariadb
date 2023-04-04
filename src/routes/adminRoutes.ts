import { Router } from "express";
import { AdminController } from "../controllers/adminController";
import { authMiddleware } from "../middlewares/authMiddleware";

const router = Router();
const adminController = new AdminController();

router.post("/signup", adminController.signup);
router.post("/login", adminController.login);
router.get("/:id", authMiddleware, adminController.getUser);

export default router;
