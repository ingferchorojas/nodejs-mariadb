-- Tabla para los administradores
CREATE TABLE administradores (
  id_administrador INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Inserts para la tabla de administradores
INSERT INTO administradores (nombre, apellido, email, password)
VALUES
('Admin', 'User', 'admin@email.com', '$2y$10$VktbUXa5q.83RilS7oW81ufqXTDcLgTej6xBVMdfzMVePUYWHQsVK');