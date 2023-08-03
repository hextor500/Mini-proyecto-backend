CREATE TABLE productos (
sku varchar(20),
nombre varchar(40),
descripcion varchar(120),
precio numeric,
PRIMARY KEY(sku)
);

CREATE TABLE clientes (
codigo_cliente serial,
nombre varchar(40),
apellidos varchar(40),
email varchar(120),
telefono varchar(12),
codigo_postal varchar(10),
barrio_o_colonia varchar (40),
PRIMARY KEY(codigo_cliente)
);

CREATE TABLE ventas_realizadas (
numero_venta serial, 
fecha_venta date, 
codigo_cliente serial, 
PRIMARY KEY (numero_venta),
FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);

CREATE TABLE ventas_items (
numero_venta serial, 
cantidad integer, 
sku varchar(20),
FOREIGN KEY (numero_venta) REFERENCES ventas_realizadas(numero_venta),
PRIMARY KEY (numero_venta)
);
