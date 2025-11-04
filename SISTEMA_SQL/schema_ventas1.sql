

CREATE TABLE clientes (
  id_cliente SERIAL PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(255),
  ciudad VARCHAR(100)
);

CREATE TABLE sucursales (
  id_sucursal SERIAL PRIMARY KEY,
  nombre_sucursal VARCHAR(200) NOT NULL,
  ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE ventas (
  id_venta SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES clientes(id_cliente),
  id_sucursal INT REFERENCES sucursales(id_sucursal),
  fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE detalle_ventas (
  id_detalle SERIAL PRIMARY KEY,
  id_venta INT REFERENCES ventas(id_venta),
  sku_producto VARCHAR(100),
  cantidad INT NOT NULL,
  precio_venta_momento NUMERIC(12,2) NOT NULL
);

-- ------------------------------------------------------------
-- PRUEBA: Insertar datos de ejemplo
-- ------------------------------------------------------------

INSERT INTO clientes (nombre, email, ciudad)
VALUES ('Jennifer Torres', 'jenni@gmail.com', 'Quito');

INSERT INTO sucursales (nombre_sucursal, ciudad)
VALUES ('Sucursal Quito Norte', 'Quito');

INSERT INTO ventas (id_cliente, id_sucursal)
VALUES (1, 1);

INSERT INTO detalle_ventas (id_venta, sku_producto, cantidad, precio_venta_momento)
VALUES (1, 'P001', 2, 720.50);

-- ------------------------------------------------------------
-- CONSULTAS DE PRUEBA
-- ------------------------------------------------------------
SELECT * FROM clientes;
SELECT * FROM ventas;
SELECT * FROM detalle_ventas;
