-- Ejercicio Diagramando bajo conceptos de de modelo entidad relación
/*
“Se desea informatizar la gestión de una empresa de transportes que reparte paquetes por toda España. Los encargados
 de llevar los paquetes son los camioneros, de los que se quiere guardar el dni, nombre, teléfono, dirección, salario
 y población en la que vive. 
 De los paquetes transportados interesa conocer el código de paquete, descripción, destinatario y dirección del 
 destinatario. 
 Un camionero distribuye muchos paquetes, y un paquete sólo puede ser distribuido por un camionero.
 De las provincias a las que llegan los paquetes interesa guardar el código de provincia y el nombre. 
 Un paquete sólo puede llegar a una provincia. Sin embargo, a una provincia pueden llegar varios paquetes.
 De los camiones que llevan los camioneros, interesa conocer la matrícula, modelo, tipo potencia. 
 Un camionero puede conducir diferentes camiones en fechas diferentes, y un camión puede ser conducido por 
 varios camioneros”.
*/

-- tabla camionero
CREATE TABLE camionero(
dni VARCHAR(20) NOT NULL PRIMARY KEY,
nombre_camionero VARCHAR(40) NOT NULL,
telefono VARCHAR(20) NOT NULL,
direccion VARCHAR(40) NOT NULL,
poblacion_en_que_vive VARCHAR(40) NOT NULL,
salario INT NOT NULL,
fk_codigo_paquete INT,
fk_matricula_camion VARCHAR(10),
FOREIGN KEY(fk_codigo_paquete) REFERENCES paquete(codigo_paquete),
FOREIGN KEY(fk_matricula_camion) REFERENCES camiones(matricula_camion),
UNIQUE(dni, fk_codigo_paquete, fk_matricula_camion)
);

-- tabla paquete
CREATE TABLE paquete(
codigo_paquete INT NOT NULL PRIMARY KEY,
descripcion VARCHAR(60) NOT NULL,
destinatario VARCHAR(40) NOT NULL,
direccion_destinatario VARCHAR(50) NOT NULL,
fk_codigo_de_provincia INT,
FOREIGN KEY(fk_codigo_de_provincia) REFERENCES provincia(codigo_de_provincia),
UNIQUE(codigo_paquete, fk_codigo_de_provincia)
);

-- tabla provincia
CREATE TABLE provincia(
codigo_de_provincia INT NOT NULL PRIMARY KEY,
nombre_provincia VARCHAR(60) NOT NULL,
fk_matricula_camion VARCHAR(10),
FOREIGN KEY(fk_matricula_camion) REFERENCES camiones(matricula_camion),
UNIQUE(codigo_de_provincia, fk_matricula_camion)
);

-- tabla camiones
CREATE TABLE camiones(
matricula_camion VARCHAR(10) NOT NULL PRIMARY KEY,
modelo VARCHAR(30) NOT NULL,
tipo_potencia VARCHAR(30) NOT NULL,
UNIQUE(matricula_camion)
);

