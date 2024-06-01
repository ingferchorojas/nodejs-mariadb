import { body, ValidationChain } from "express-validator"

export const validateRegister = (): ValidationChain[] => [
	body("nombre").notEmpty().withMessage("El nombre es requerido"),
	body("apellido").notEmpty().withMessage("El apellido es requerido"),
	body("email").isEmail().withMessage("El correo electrónico no es válido"),
	body("password")
		.isLength({ min: 6 })
		.withMessage("La contraseña debe tener al menos 6 caracteres")
		.matches(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/)
        .withMessage("La contraseña debe contener al menos una letra mayúscula, una letra minúscula, un número y un carácter especial")
]

export const validateLogin = (): ValidationChain[] => [
	body("email").isEmail().withMessage("El correo electrónico no es válido"),
	body("password").notEmpty().withMessage("La contraseña es requerida")
]
