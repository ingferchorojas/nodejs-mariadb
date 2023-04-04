-- Tabla para los proveedores
CREATE TABLE proveedores (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  correo VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla para los productos
CREATE TABLE productos (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  codigo_producto VARCHAR(50) UNIQUE NOT NULL,
  nombre_producto VARCHAR(255) NOT NULL,
  descripcion VARCHAR(255),
  codigo_barras VARCHAR(50),
  fecha_vencimiento DATE,
  cantidad INT NOT NULL,
  precio_compra DECIMAL(10, 2) NOT NULL,
  precio_venta DECIMAL(10, 2) NOT NULL,
  id_proveedor INT,
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

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
('Juan', 'Pérez', 'juan.perez@example.com', 'password1'),
('María', 'García', 'maria.garcia@example.com', 'password2'),
('Luis', 'Martínez', 'luis.martinez@example.com', 'password3');


-- Inserts para la tabla de proveedores
INSERT INTO proveedores (nombre, direccion, telefono, correo)
VALUES ('Proveedor 1', 'Calle 123, Ciudad', '555-1234', 'proveedor1@ejemplo.com');

INSERT INTO proveedores (nombre, direccion, telefono, correo)
VALUES ('Proveedor 2', 'Avenida 456, Ciudad', '555-5678', 'proveedor2@ejemplo.com');

INSERT INTO proveedores (nombre, direccion, telefono, correo)
VALUES ('Proveedor 3', 'Calle 789, Ciudad', '555-9012', 'proveedor3@ejemplo.com');

-- Inserts para la tabla de productos
INSERT INTO productos (codigo_producto, nombre_producto, descripcion, codigo_barras, fecha_vencimiento, cantidad, precio_compra, precio_venta, id_proveedor) VALUES
('P1001', 'Leche entera 1L', 'Leche entera pasteurizada', '1234567890123', '2023-10-31', 100, 1.50, 2.50, 1),
('P1002', 'Queso fresco 200g', 'Queso fresco de vaca', '1234567890124', '2023-09-30', 50, 2.00, 3.50, 2),
('P1003', 'Pan integral 500g', 'Pan integral de trigo', '1234567890125', '2023-08-31', 80, 1.00, 1.80, 3),
('P1004', 'Huevos 12 unidades', 'Huevos de gallina', '1234567890126', '2023-10-31', 120, 2.50, 3.80, 1),
('P1005', 'Yogurt natural 200g', 'Yogurt natural sin azúcar', '1234567890127', '2023-11-30', 60, 0.80, 1.50, 1),
('P1006', 'Jamon serrano 100g', 'Jamon serrano de cerdo', '1234567890128', '2023-07-31', 30, 2.50, 4.00, 2),
('P1007', 'Galletas de avena 250g', 'Galletas de avena integrales', '1234567890129', '2023-09-30', 40, 1.00, 1.80, 3),
('P1008', 'Pollo entero 1kg', 'Pollo entero fresco', '1234567890130', '2023-10-31', 20, 4.50, 7.00, 1),
('P1009', 'Jugo de naranja 1L', 'Jugo de naranja natural', '1234567890131', '2023-11-30', 70, 1.80, 2.50, 1),
('P1010', 'Salmón ahumado 100g', 'Salmón ahumado en frío', '1234567890132', '2023-08-31', 25, 5.00, 8.50, 2),
('P1011', 'Harina de trigo 1kg', 'Harina de trigo todo uso', '1234567890133', '2023-07-31', 90, 1.20, 2.00, 3),
('P1012', 'Filete de ternera 200g', 'Filete de ternera fresco', '1234567890134', '2023-10-31', 10, 8.50, 12.00, 1),
('P1013', 'Arroz integral 1kg', 'Arroz integral de grano largo', '123456789013', '2023-10-31', 10, 8.50, 12.00, 1),
('P1014', 'Pasta de trigo 500g', 'Pasta de trigo con forma de espagueti', '123456789014', '2024-12-31', 15, 5.75, 8.00, 2),
('P1015', 'Aceite de oliva 500ml', 'Aceite de oliva extra virgen en botella de vidrio', '123456789015', '2026-03-31', 20, 12.50, 18.00, 3),
('P1016', 'Sal refinada 1kg', 'Sal de mesa refinada sin yodo', '123456789016', '2027-06-30', 30, 2.25, 4.00, 1),
('P1017', 'Azúcar blanca 1kg', 'Azúcar blanca refinada en bolsa', '123456789017', '2025-09-30', 20, 2.75, 4.50, 2),
('P1018', 'Leche entera 1L', 'Leche entera pasteurizada en envase Tetra Pak', '123456789018', '2023-12-31', 25, 2.85, 5.00, 3),
('P1019', 'Yogurt natural 1kg', 'Yogurt natural sin azúcar añadida', '123456789019', '2024-10-31', 15, 4.75, 8.00, 1),
('P1020', 'Huevos de gallina x12', 'Huevos de gallina tamaño grande', '123456789020', '2023-09-30', 50, 3.50, 6.00, 2),
('P1021', 'Queso cheddar 500g', 'Queso cheddar en bloque de 500g', '123456789021', '2024-11-30', 10, 10.75, 15.00, 3),
('P1022', 'Café molido 250g', 'Café molido de tueste medio en paquete', '123456789022', '2023-08-31', 20, 7.50, 11.00, 1),
('P1023', 'Té verde 50g', 'Té verde en bolsa de 50g', '123456789023', '2025-01-31', 30, 4.25, 7.00, 2),
('P1024', 'Chocolate negro 200g', 'Chocolate negro 70% cacao en tableta de 200g', '123456789024', '2023-07-31', 15, 6.50, 10.00, 3),
('P1025', 'Mermelada de fresa 250g', 'Mermelada de fresa en frasco de vidrio', '123456789025', '2024-04-30', 25, 3.75, 6.50, 1),
('P1026', 'Cereal de avena 500g', 'Cereal de avena orgánica', '123456789026', '2023-12-31', 15, 9.50, 14.00, 1),
('P1027', 'Galletas de chocolate 150g', 'Galletas de chocolate sin azúcar', '123456789027', '2024-03-31', 20, 4.25, 7.50, 1),
('P1028', 'Café colombiano 500g', 'Café colombiano de grano tostado', '123456789028', '2024-05-31', 10, 15.50, 22.00, 1),
('P1029', 'Aceite de oliva 500ml', 'Aceite de oliva virgen extra', '123456789029', '2025-02-28', 8, 7.00, 12.00, 1),
('P1030', 'Pasta de dientes 100g', 'Pasta de dientes sabor menta', '123456789030', '2023-11-30', 30, 2.50, 5.00, 1),
('P1031', 'Arroz blanco 1kg', 'Arroz blanco de grano corto', '123456789031', '2024-08-31', 12, 6.50, 9.00, 2),
('P1032', 'Leche descremada 1L', 'Leche descremada sin lactosa', '123456789032', '2024-02-28', 20, 2.75, 5.00, 2),
('P1033', 'Queso cheddar 250g', 'Queso cheddar en bloque', '123456789033', '2024-04-30', 5, 8.00, 12.00, 2),
('P1034', 'Yogur griego 500g', 'Yogur griego bajo en grasa', '123456789034', '2023-12-31', 15, 3.50, 6.00, 2),
('P1035', 'Carne molida 1kg', 'Carne de res molida 80/20', '123456789035', '2024-05-31', 6, 12.50, 18.00, 2),
('P1036', 'Salmón ahumado 200g', 'Salmón ahumado noruego', '123456789036', '2024-07-31', 3, 15.00, 23.00, 3),
('P1037', 'Huevos orgánicos 12un', 'Huevos orgánicos de gallinas libres', '123456789037', '2024-04-30', 8, 3.50, 6.50, 3),
('P1038', 'Leche de soja 1L', 'Leche de soja en envase tetra brik', '123456789038', '2023-10-31', 20, 2.50, 4.50, 3),
('P1039', 'Harina de avena 500g', 'Harina de avena integral', '123456789039', '2023-09-30', 15, 3.00, 5.50, 3),
('P1040', 'Manzanas orgánicas 1kg', 'Manzanas orgánicas de la región', '123456789040', '2023-10-15', 12, 7.50, 12.00, 3),
('P1041', 'Pera conferencia 1kg', 'Peras conferencia de calidad', '123456789041', '2023-10-20', 10, 8.50, 12.00, 3),
('P1042', 'Yogur griego 500g', 'Yogur griego natural', '123456789042', '2023-11-30', 18, 2.75, 5.00, 3),
('P1043', 'Aceite de oliva 500ml', 'Aceite de oliva virgen extra', '123456789043', '2024-01-31', 20, 8.00, 14.50, 3),
('P1044', 'Sal rosada del Himalaya 500g', 'Sal rosada del Himalaya en envase de vidrio', '123456789044', NULL, 5, 3.50, 6.00, 3),
('P1045', 'Semillas de chia 250g', 'Semillas de chia en bolsa sellada', '123456789045', '2024-06-30', 8, 3.25, 6.00, 3),
('P1046', 'Queso feta 200g', 'Queso feta en envase de plástico', '123456789046', '2024-01-31', 12, 4.50, 8.00, 3),
('P1047', 'Cebolla morada 1kg', 'Cebolla morada de calidad', '123456789047', '2023-09-30', 5, 3.50, 6.00, 3),
('P1048', 'Pimiento rojo 500g', 'Pimiento rojo de calidad', '123456789048', '2023-10-15', 8, 5.00, 8.50, 3),
('P1049', 'Jengibre fresco 250g', 'Jengibre fresco de la región', '123456789049', '2023-09-30', 10, 2.75, 5.00, 3),
('P1050', 'Mantequilla de maní 500g', 'Mantequilla de maní sin azúcar', '123456789050', '2024-02-28', 15, 4.50, 8.00, 2)
