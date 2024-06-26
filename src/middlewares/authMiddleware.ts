import { Request, Response, NextFunction } from "express"
import jwt from "jsonwebtoken"

export const authMiddleware = (
	req: Request,
	res: Response,
	next: NextFunction
) => {
	const token = req.headers.authorization?.split(" ")[1]
	if (!token) {
		return res
			.status(401)
			.json({
				data: {},
				message: "No se ha proporcionado un token",
				error: true
			})
	}
	try {
		const decodedToken: any = jwt.verify(
			token,
			process.env.JWT_SECRET || ""
		)
		req.body.userId = decodedToken.userId
		next()
	} catch (error) {
		return res
			.status(401)
			.json({ data: {}, message: "Token inválido", error: true })
	}
}
