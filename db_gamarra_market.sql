-- Crear la base de datos
CREATE DATABASE db_gamarra_market;

-- Usar la base de datos recién creada
USE db_gamarra_market;

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
    id INT PRIMARY KEY,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    email VARCHAR(80),
    celular CHAR(9),
    fecha_nacimiento DATE,
    activo BOOLEAN
);

-- Tabla VENDEDOR
CREATE TABLE VENDEDOR (
    id INT PRIMARY KEY,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    salario DECIMAL(8,2),
    celular CHAR(9),
    email VARCHAR(80),
    activo BOOLEAN
);

-- Tabla VENTA
CREATE TABLE VENTA (
    id INT PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    activo BOOLEAN,
    cliente_id INT,
    vendedor_id INT
);

-- Tabla PRENDA
CREATE TABLE PRENDA (
    id INT PRIMARY KEY,
    descripcion VARCHAR(90) NOT NULL,
    marca VARCHAR(60),
    cantidad INT,
    talla VARCHAR(10),
    precio DECIMAL(8,2),
    activo BOOLEAN
);

-- Tabla VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    id INT PRIMARY KEY,
    cantidad INT NOT NULL,
    venta_id INT,
    prenda_id INT
);


-- Relación entre CLIENTE y VENTA
ALTER TABLE VENTA
ADD CONSTRAINT fk_cliente_venta
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id);

-- Relación entre VENDEDOR y VENTA
ALTER TABLE VENTA
ADD CONSTRAINT fk_vendedor_venta
FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id);

-- Relación entre VENTA y VENTA_DETALLE
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_venta_venta_detalle
FOREIGN KEY (venta_id) REFERENCES VENTA(id);

-- Relación entre PRENDA y VENTA_DETALLE
ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_prenda_venta_detalle
FOREIGN KEY (prenda_id) REFERENCES PRENDA(id);


-- Ver las tablas creadas
SHOW TABLES;


-- Insertar datos en la tabla CLIENTE
INSERT INTO CLIENTE (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES 
(1, 'DNI', '12345678', 'Juan', 'Perez', 'juan.perez@example.com', '987654321', '1985-06-15', TRUE),
(2, 'DNI', '87654321', 'Maria', 'Lopez', 'maria.lopez@example.com', '912345678', '1990-02-20', TRUE);

-- Mostrar tabla cliente
SELECT * FROM CLIENTE;


-- Seleccionar un cliente específico por ID
SELECT * FROM CLIENTE WHERE id = 1;


-- Nueva columna estado civil
ALTER TABLE CLIENTE
ADD COLUMN estado_civil CHAR(1);


-- Actualizar el nombre y apellido de un cliente por su ID
UPDATE CLIENTE 
SET nombres = 'Juan Carlos', apellidos = 'Rodriguez'
WHERE id = 1;


-- Borrar un cliente específico por su ID
DELETE FROM CLIENTE WHERE id = 1;


-- Cambiar el estado de un cliente a inactivo
UPDATE CLIENTE 
SET activo = FALSE
WHERE id = 2;


-- Eliminar una columna 
ALTER TABLE CLIENTE
DROP COLUMN nombres;


-- Eliminar la tabla CLIENTE
DROP TABLE CLIENTE;


-- Eliminar la base de datos
DROP DATABASE db_gamarra_market;
