import mariadb, { Pool } from "mariadb"
import dotenv from "dotenv"
dotenv.config()

const pool: Pool = mariadb.createPool({
	host: process.env.DB_HOST || "localhost",
	port: parseInt(process.env.DB_PORT || "3306"),
	user: process.env.DB_USER || "root",
	password: process.env.DB_PASSWORD || "",
	database: process.env.DB_DATABASE || "mydatabase",
	connectionLimit: parseInt(process.env.DB_CONNECTION_LIMIT || "10")
})

export { pool }
