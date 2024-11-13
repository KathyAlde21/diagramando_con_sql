-- Ejercicio Diagramando bajo conceptos de de modelo entidad relación
/*
EJERCICIO 1
A partir del siguiente enunciado se desea realiza el modelo entidad-relación.
“Una empresa vende productos a varios clientes. Se necesita conocer los datos Personales de los clientes 
(nombre, apellidos, Rut, dirección y fecha de nacimiento). Cada producto tiene un nombre y un código, así
como un precio unitario. Un cliente puede comprar varios productos a la empresa, y un mismo producto puede
ser comprado por varios clientes. Los productos son suministrados por diferentes proveedores. Se debe tener
en cuenta que un producto sólo puede ser suministrado por un proveedor, y que un proveedor puede suministrar
diferentes productos. De cada proveedor se desea conocer el NIF, nombre y dirección”.
 */

-- Tabla productos
CREATE TABLE productos(
codigo_producto INT NOT NULL PRIMARY KEY,
nombre_producto VARCHAR(40) NOT NULL,
precio_unitario INT NOT NULL,
fk_nif_proveedor VARCHAR(20),
FOREIGN KEY(fk_nif_proveedor) REFERENCES proveedores(nif_proveedor),
UNIQUE(codigo_producto, fk_nif_proveedor)
);

-- Tabla proveedor
CREATE TABLE proveedores(
nif_proveedor VARCHAR(20) NOT NULL PRIMARY KEY,
nombre_proveedor VARCHAR(40) NOT NULL,
direccion_proveedor VARCHAR(40) NOT NULL,
UNIQUE(nif_proveedor)
);

-- Tabla clientes
CREATE TABLE clientes(
rut_cliente VARCHAR(20) NOT NULL PRIMARY KEY,
nombre_cliente VARCHAR(40) NOT NULL,
apellidos_cliente VARCHAR(50) NOT NULL,
direccion_cliente VARCHAR(40) NOT NULL,
fecha_de_nacimiento DATE NOT NULL,
fk_codigo_producto INT,
FOREIGN KEY(fk_codigo_producto) REFERENCES productos(codigo_producto),
UNIQUE(rut_cliente, fk_codigo_producto)
);

