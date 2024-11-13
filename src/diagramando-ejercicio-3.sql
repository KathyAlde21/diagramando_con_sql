-- Ejercicio Diagramando bajo conceptos de de modelo entidad relación
/*
“Se desea diseñar la base de datos de un Instituto. 
En la base de datos se desea guardar los datos de los profesores del Instituto (DNI, nombre, dirección y teléfono). 
Los Profesores imparten módulos, y cada módulo tiene un código y un nombre.
Cada alumno Está matriculado en uno o varios módulos. De cada alumno se desea guardar el nº de Expediente,
nombre, apellidos y fecha de nacimiento. 
Los profesores pueden impartir varios módulos, pero un módulo sólo puede ser impartido por un profesor. 
Cada curso tiene un grupo de alumnos, uno de los cuales es el delegado del grupo”.
*/

CREATE TABLE profesores_instituto(
dni_profesor VARCHAR(20) NOT NULL PRIMARY KEY,
nombre_profesor VARCHAR(60) NOT NULL,
direccion_profesor VARCHAR(60) NOT NULL,
telefono VARCHAR(20) NOT NULL,
UNIQUE(dni_profesor)
);

CREATE TABLE modulos(
id_modulo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_modulo VARCHAR(60) NOT NULL,
fk_dni_profesor VARCHAR(20),
FOREIGN KEY(fk_dni_profesor) REFERENCES profesores_instituto(dni_profesor),
UNIQUE(id_modulo, fk_dni_profesor)
);

CREATE TABLE alumnos(
numero_de_expediente_alumno INT NOT NULL PRIMARY KEY,
nombre_alumno VARCHAR(60) NOT NULL,
apellidos_alumno VARCHAR(60) NOT NULL,
fecha_de_nacimiento DATE NOT NULL,
fk_id_curso INT,
FOREIGN KEY(fk_id_curso) REFERENCES cursos(id_curso),
UNIQUE(numero_de_expediente_alumno, fk_id_curso)
);

CREATE TABLE cursos(
id_curso INT NOT NULL PRIMARY KEY,
delegado_del_curso INT NOT NULL,
UNIQUE(id_curso)
);

CREATE TABLE alumnos_modulo(
id_alumno_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_numero_de_expediente_alumno INT,
fk_id_modulo INT,
FOREIGN KEY(fk_numero_de_expediente_alumno) REFERENCES alumnos(numero_de_expediente_alumno),
FOREIGN KEY(fk_id_modulo) REFERENCES modulos(id_modulo),
UNIQUE(id_alumno_curso, fk_numero_de_expediente_alumno, fk_id_modulo)
);
