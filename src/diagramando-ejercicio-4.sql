-- Ejercicio Diagramando bajo conceptos de de modelo entidad relación
/*
“Se desea diseñar una base de datos para almacenar y gestionar la información empleada por una empresa dedicada a la
 venta de automóviles, teniendo en cuenta los siguientes aspectos:
La empresa dispone de una serie de coches para su venta. Se necesita conocer la Matrícula, marca y modelo, el color y
 el precio de venta de cada coche.
Los datos que interesa conocer de cada cliente son el NIF, nombre, dirección, ciudad y número de teléfono: además, los
 clientes se diferencian por un código interno de la Empresa que se incrementa automáticamente cuando un cliente se da 
 de alta en ella. Un cliente puede comprar tantos coches como desee a la empresa. Un coche determinado solo puede ser 
 comprado por un único cliente.
El concesionario también se encarga de llevar a cabo las revisiones que se realizan a cada coche. Cada revisión tiene 
asociado un código que se incrementa automáticamente por cada revisión que se haga. De cada revisión se desea saber
 si se ha hecho cambio de filtro, si se ha hecho cambio de aceite, si se ha hecho cambio de frenos u otros. Los coches
 pueden pasar varias revisiones en el concesionario”.
*/

CREATE TABLE clientes(
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(20) NOT NULL UNIQUE,
    nombre_cliente VARCHAR(60) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    UNIQUE(id_cliente)
);

CREATE TABLE coches(
    matricula VARCHAR(20) NOT NULL PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    fk_id_cliente INT,
    FOREIGN KEY (fk_id_cliente) REFERENCES clientes(id_cliente),
    UNIQUE(matricula, fk_id_cliente)
);

CREATE TABLE revisiones(
    id_revision INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_matricula VARCHAR(20) NOT NULL,
    cambio_filtro BOOLEAN NOT NULL,
    cambio_aceite BOOLEAN NOT NULL,
    cambio_frenos BOOLEAN NOT NULL,
    otros TEXT,
    FOREIGN KEY (fk_matricula) REFERENCES coches(matricula),
    UNIQUE(id_revision, fk_matricula)
);

