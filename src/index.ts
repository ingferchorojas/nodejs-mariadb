import express from "express"
import dotenv from "dotenv"
import morgan from "morgan"
import cors from "cors"
import adminRoutes from "./routes/adminRoutes"

dotenv.config()

const app = express()
const port = process.env.PORT || 3000

app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(morgan("dev"))
app.use(cors())

app.use("/admin", adminRoutes)

app.listen(port, () => {
  console.log(`Server is running on port ${port}.`)
})
