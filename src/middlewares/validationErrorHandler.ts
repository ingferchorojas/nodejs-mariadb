import { validationResult } from "express-validator"
import { Request, Response, NextFunction } from "express"

const validationErrorHandler = (req: Request, res: Response, next: NextFunction) => {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
        return res.status(400).json({
            data: errors.array(),
            message: "Errores de validación",
            error: true
        })
    }
    next() // Si no hay errores de validación, pasa al siguiente middleware o controlador
}

export default validationErrorHandler
