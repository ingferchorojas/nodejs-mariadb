import { Router, Request, Response } from "express"
import { AdminController } from "../controllers/adminController"
import { authMiddleware } from "../middlewares/authMiddleware"
import { validateRegister, validateLogin } from "../validators/adminValidator"
import validationErrorHandler from "../middlewares/validationErrorHandler"

const router = Router()
const adminController = new AdminController()

router.post("/register", validateRegister(), authMiddleware, validationErrorHandler, (req: Request, res: Response) => {
    adminController.register(req, res)
})

router.post("/login", validateLogin(), validationErrorHandler, (req: Request, res: Response) => {
    adminController.login(req, res)
})

router.get("/:id", authMiddleware, adminController.getUser)

export default router
