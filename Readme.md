# Node.js + MariaDB

Este es un proyecto de ejemplo que muestra cómo crear una API REST con Node.js y conectarse a una base de datos MariaDB utilizando el controlador `mariadb`.

## Tecnologías utilizadas

- Node.js
- MariaDB
- Express
- bcrypt
- jsonwebtoken

## Instalación

1. Clonar el repositorio: `git clone https://github.com/ingferchorojas/nodejs-mariadb.git`
2. Ir al directorio del proyecto: `cd nodejs-mariadb`
3. Copiar y configurar las variables de entorno: `cp .env.example .env`
4. Instalar las dependencias: `npm install`
5. Ejecutar docker-compose up para levantar mariadb + phpMyAdmin, acceder a http://localhost:8080, las credenciales están en docker-compose.yml
6. Ejecutar el archivo `database.sql` en phpMyAdmin para crear las tablas y los datos de prueba

## Uso

1. Ejecutar el proyecto: `npm start` para ejecutarlo en modo de desarrollo
2. Enviar una solicitud POST a `/admin/login` con un JSON que contenga los siguientes campos:
```json
{
  "email": "admin@email",
  "password": "admin"
}
```
3. Con el token obtenido, enviar una solicitud POST con Bearer token a `/admin/register` con un JSON que contenga los siguientes campos:
```json
{
  "nombre": "Juan",
  "apellido": "Pérez",
  "email": "juanperez@gmail.com",
  "password": "password"
}
```
4. Enviar una solicitud POST a `/admin/:adminId` con un Bearer token obtenido en el login

## Licencia

Este proyecto está bajo la licencia MIT.