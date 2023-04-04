import { pool } from "../config/database";

interface IAdmin {
  id_administrador?: number;
  nombre: string;
  apellido: string;
  email: string;
  password: string;
}

export class Admin {
  public async create(admin: IAdmin): Promise<any> {
     // Check if admin email already exists
    const [existingAdmin] = await pool.query(
      "SELECT * FROM administradores WHERE email = ?",
      [admin.email]
    );
    if (existingAdmin) {
      throw new Error("Ya existe un administrador con este correo electrónico");
    }
    const query = "INSERT INTO administradores (nombre, apellido, email, password) VALUES (?, ?, ?, ?)";
    const values = [admin.nombre, admin.apellido, admin.email, admin.password];
    const result = await pool.query(query, values);
    return result;
  }

  public async findByEmail(email: string): Promise<IAdmin | null> {
    const query = "SELECT * FROM administradores WHERE email = ?";
    const values = [email];
    const [row] = await pool.query(query, values);
    if (row) {
      return row as IAdmin;
    }
    return null;
  }

  public async findById(id: number): Promise<IAdmin | null> {
    const query = "SELECT * FROM administradores WHERE id_administrador = ?";
    const values = [id];
    const [row] = await pool.query(query, values);
    if (row) {
      return row as IAdmin;
    }
    return null;
  }
}
