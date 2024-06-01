import { Request, Response } from "express"
import { Admin } from "../models/admin"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"
import dotenv from "dotenv"

dotenv.config()

const adminModel = new Admin()

export class AdminController {
  public async register(req: Request, res: Response) {
    const adminData = {
      nombre: req.body.nombre,
      apellido: req.body.apellido,
      email: req.body.email,
      password: await bcrypt.hash(req.body.password, 10)
    }
    
    try {
      await adminModel.create(adminData)
      res.json({
        data: {},
        message: "Administrador registrado exitosamente",
        error: false
      })
    } catch (error) {
      console.log(error)
      if (error instanceof Error && error.message === "Ya existe un administrador con este correo electrónico") {
        res.status(400).json({
          data: {},
          message: "Ya existe un administrador con este correo electrónico",
          error: true
        })
      } else {
        console.log(error)
        res.status(500).json({
          data: {},
          message: "Error al registrar administrador",
          error: true
        })
      }
    }
  }

  public async login(req: Request, res: Response) {
    const email = req.body.email
    const password = req.body.password
    try {
      const admin = await adminModel.findByEmail(email)
      if (admin) {
        const isPasswordValid = await bcrypt.compare(password, admin.password)
        console.log(password, admin.password)
        if (isPasswordValid) {
          const token = jwt.sign(
            { id: admin.id_administrador, email: admin.email },
            process.env.JWT_SECRET as string,
            { expiresIn: "1h" }
          )
          res.json({
            data: token,
            message: "Login exitoso",
            error: false
          })
        } else {
          res.status(401).json({
            data: {},
            message: "Usuario o contraseña incorrecta",
            error: true
          })
        }
      } else {
        res.status(401).json({
          data: {},
          message: "Usuario o contraseña incorrecta",
          error: true
        })
      }
    } catch (error) {
      console.log(error)
      res.status(500).json({
        data: {},
        message: "Error en login",
        error: true
      })
    }
  }

  public async getUser(req: Request, res: Response) {
    const id = req.params.id

    try {
      const admin = await adminModel.findById(Number(id))
      if (admin) {
        res.json({
          data: {
            id: admin.id_administrador,
            nombre: admin.nombre,
            apellido: admin.apellido,
            email: admin.email,
          },
          message: "Detalles del administrador",
          error: false
        })
      } else {
        res.status(404).json({
          data: {},
          message: "Administrador no encontrado",
          error: true
        })
      }
    } catch (error) {
      console.log(error)
      res.status(500).json({
        data: {},
        message: "Error al obtener administrador",
        error: true
      })
    }
  }
}
