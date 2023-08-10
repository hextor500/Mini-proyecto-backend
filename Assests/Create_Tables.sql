CREATE TABLE productos (
sku serial,
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
codigo_cliente serial, 
PRIMARY KEY (numero_venta),
FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);

CREATE TABLE ventas_items (
numero_venta serial, 
cantidad integer, 
sku serial,
FOREIGN KEY (numero_venta) REFERENCES ventas_realizadas(numero_venta),
FOREIGN KEY (sku) REFERENCES productos(sku),
PRIMARY KEY (numero_venta, sku)
);

/* ID de los clientes de la Ciudad de Monterrey
ID y descripción de los productos que cuesten menos de 15 pesos
ID y nombre de los clientes, cantidad vendida, y descripción del producto, en las ventas en las cuales se vendieron más de 10 unidades.
ID y nombre de los clientes que no aparecen en la tabla de ventas (Clientes que no han comprado productos)
ID y nombre de los clientes que han comprado todos los productos de la empresa.
ID y nombre de cada cliente y la suma total (suma de cantidad) de los productos que ha comprado. Pista: (https://www.postgresqltutorial.com/postgresql-sum-function/).
ID de los productos que no han sido comprados por clientes de Guadalajara.
ID de los productos que se han vendido a clientes de Monterrey y que también se han vendido a clientes de Cancún.
Nombre de las ciudades en las que se han vendido todos los productos.*/

INSERT INTO clientes
VALUES
(1,'Hector','Robayo','alexis_robayo@clientes.com','5555555','123456', 'Monterrey'),
(2,'Francisco','Parada','francisco_parada@clientes.com','5556667','123789', 'Guadalajara'),
(3,'Diana','Perozo','diana_perozo@clientes.com','8889997','123456', 'Monterrey'),
(4,'Hugo','Montes','hugo_montes@clientes.com','2223335','123789', 'Guadalajara'),
(5,'Viviana','Ranquel','viviana_ranquel@clientes.com','5557778','456789', 'Sinaloa'),
(6,'Andres','Hincapie','andres_hincapie@clientes.com','7774445','456789', 'Sinaloa'),
(7,'Michelle','Rodriguez','michelle_rodriguez@clientes.com','3332224','123456', 'Monterrey'),
(8,'Sandra','Perea','sandra_perea@clientes.com','6665558','123789', 'Guadalajara'),
(9,'Julio','Machado','julio_machado@clientes.com','8745692','456123', 'Cancun'),
(10,'Sandra','Perea','sandra_perea@clientes.com','6665558','456123', 'Cancun'),
(11,'Alexis','Parada','alexis_parada@clientes.com','7412589','456123', 'Cancun'),
(12,'Diego','Beltran','diego_beltran@clientes.com','9632587','456123', 'Cancun');

INSERT INTO productos
VALUES 
(1, 'Leche','Leche entera pasteurizada', 10),
(2, 'Huevos','Huevo por unidad AA', 0.20),
(3, 'Pollo','Pollo entero sin desprezar', 20),
(4, 'Pan','Pan por unidad dulce', 0.25),
(5, 'Chocolate','Media libra de chocolate', 18),
(6, 'Arroz','Libra de arroz', 5),
(7, 'Maiz','Libra maiz desgranado', 8),
(8, 'Jabon Bano','Jabon de Bano por 3 unidades', 17),
(9, 'Shampoo','Shampoo liso perfecto 1000 cc', 20),
(10, 'Lomo de Cerdo','Lomo de cerdo por kilo', 22),
(11, 'Helado','Helado cremoso de vainilla 1 litro', 15),
(12, 'Frijol','Frijol cargamanto 1 libra', 7);

INSERT INTO ventas_realizadas
VALUES 
(1, 1), 
(2, 3),
(3, 2),
(4, 4),
(5, 7),
(6, 1),
(7, 8),
(8, 10),
(9, 9),
(10, 11),
(11, 4),
(12, 8),
(13, 12),
(14, 3),
(15, 4);

INSERT INTO ventas_items
VALUES
(1, 1, 1),
(1, 30, 2),
(1, 1, 3),
(1, 12, 4),
(2, 2, 1),
(2, 20, 2),
(2, 11, 3),
(3, 2, 4),
(3, 20, 2),
(3, 11, 3),
(4, 1, 3),
(4, 1, 6),
(4, 1, 7),
(5, 2, 3),
(5, 2, 10),
(5, 2, 12),
(6, 1, 5),
(6, 2, 6),
(6, 1, 7),
(6, 1, 8),
(6, 1, 9),
(6, 2, 10),
(6, 1, 11),
(6, 2, 12),
(7, 12, 4),
(7, 2, 8),
(7, 2, 9),
(7, 2, 11),
(8, 6, 1),
(8, 60, 2),
(8, 4, 3),
(8, 20, 4),
(8, 4, 5),
(8, 20, 6),
(8, 20, 7),
(8, 5, 8),
(8, 5, 9),
(8, 10, 10),
(8, 5, 11),
(8, 10, 12),
(9, 2, 6),
(9, 2, 12),
(9, 2, 3),
(9, 5, 10),
(9, 2, 7),
(10, 2, 1),
(10, 5, 2),
(10, 2, 4),
(10, 2, 5),
(11, 5, 6),
(11, 5, 8),
(11, 8, 10),
(11, 2, 12),
(12, 8, 5),
(12, 5, 7),
(12, 6, 10),
(12, 1, 11),
(13, 2, 1),
(13, 10, 2),
(13, 3, 5),
(13, 4, 7),
(14, 1, 9),
(14, 3, 8),
(14, 5, 7),
(14, 1, 10),
(15, 1, 2),
(15, 1, 3),
(15, 1, 4);

/*Query 1*/

SELECT codigo_cliente, barrio_o_colonia FROM clientes WHERE barrio_o_colonia = 'Monterrey'; 

/*Query 2*/

SELECT sku, descripcion, precio FROM productos WHERE precio < 15;

/*Query 3*/

SELECT clientes.codigo_cliente, clientes.nombre, ventas_items.cantidad, productos.descripcion, ventas_realizadas.numero_venta FROM clientes 
JOIN ventas_realizadas ON clientes.codigo_cliente=ventas_realizadas.codigo_cliente JOIN ventas_items ON ventas_realizadas.numero_venta=ventas_items.numero_venta 
JOIN productos ON ventas_items.sku=productos.sku 
WHERE cantidad > 10;

/*Query 4*/

SELECT codigo_cliente, nombre FROM clientes WHERE codigo_cliente NOT IN (SELECT codigo_cliente FROM ventas_realizadas);

/*Query 5*/

SELECT clientes.codigo_cliente, clientes.nombre
FROM clientes 
WHERE NOT EXISTS (
    SELECT productos.sku
    FROM productos 
    WHERE NOT EXISTS (
        SELECT ventas_items.sku
        FROM ventas_items
        JOIN ventas_realizadas ON ventas_items.numero_venta = ventas_realizadas.numero_venta
        WHERE ventas_realizadas.codigo_cliente = clientes.codigo_cliente AND ventas_items.sku = productos.sku
    )
);

/*Query 6*/

SELECT clientes.codigo_cliente, clientes.nombre, SUM (ventas_items.cantidad) AS total_cantidad, ventas_items.sku FROM clientes 
JOIN ventas_realizadas ON clientes.codigo_cliente=ventas_realizadas.codigo_cliente 
JOIN ventas_items ON ventas_realizadas.numero_venta=ventas_items.numero_venta 
GROUP BY clientes.codigo_cliente, ventas_items.sku ORDER BY clientes.codigo_cliente;

/*Query 7*/

SELECT productos.sku, clientes.barrio_o_colonia
FROM productos 
WHERE NOT EXISTS (
    SELECT ventas_items.sku
    FROM ventas_items 
    JOIN ventas_realizadas ON ventas_items.numero_venta = ventas_realizadas.numero_venta
    JOIN clientes ON ventas_realizadas.codigo_cliente = clientes.codigo_cliente
    WHERE clientes.barrio_o_colonia = 'Guadalajara' AND ventas_items.sku = productos.sku
);

/*Query 8 */

SELECT DISTINCT ventas_items.sku
FROM ventas_items
JOIN ventas_realizadas ON ventas_items.numero_venta = ventas_realizadas.numero_venta
JOIN clientes ON ventas_realizadas.codigo_cliente = clientes.codigo_cliente
WHERE clientes.barrio_o_colonia = 'Monterrey' AND ventas_items.sku IN (
    SELECT ventas_items.sku
    FROM ventas_items
    JOIN ventas_realizadas ON ventas_items.numero_venta = ventas_realizadas.numero_venta
    JOIN clientes ON ventas_realizadas.codigo_cliente = clientes.codigo_cliente
    WHERE clientes.barrio_o_colonia = 'Cancun'
);

/*Query 9*/

SELECT clientes.barrio_o_colonia
FROM clientes
WHERE NOT EXISTS (
    SELECT productos.sku
    FROM productos 
    WHERE NOT EXISTS (
        SELECT ventas_items.sku
        FROM ventas_items
        JOIN ventas_realizadas ON ventas_items.numero_venta = ventas_realizadas.numero_venta
        WHERE ventas_realizadas.codigo_cliente = clientes.codigo_cliente AND ventas_items.sku = productos.sku
    )
);