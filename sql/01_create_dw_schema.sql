CREATE TABLE dim_clientes (
    id_cliente_sk SERIAL PRIMARY KEY,
    customer_id_origen VARCHAR(50),
    pais VARCHAR(100)
);

CREATE TABLE dim_productos (
    id_producto_sk SERIAL PRIMARY KEY,
    stock_code_origen VARCHAR(50),
    descripcion VARCHAR(255)
);

CREATE TABLE dim_tiempo (
    id_tiempo_sk SERIAL PRIMARY KEY,
    fecha_completa DATE,
    anio INT,
    mes INT,
    dia INT
);

CREATE TABLE fact_ventas (
    id_venta_sk SERIAL PRIMARY KEY,
    numero_factura VARCHAR(50),
    id_producto_sk INT,
    id_cliente_sk INT,
    id_tiempo_sk INT,
    cantidad INT,
    precio_unitario DECIMAL(12,2),
    total_venta DECIMAL(12,2),
    CONSTRAINT fk_producto FOREIGN KEY (id_producto_sk) REFERENCES dim_productos(id_producto_sk),
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente_sk) REFERENCES dim_clientes(id_cliente_sk),
    CONSTRAINT fk_tiempo FOREIGN KEY (id_tiempo_sk) REFERENCES dim_tiempo(id_tiempo_sk)
);