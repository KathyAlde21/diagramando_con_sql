-- Ejercicio Diagramando bajo conceptos de de modelo entidad relación
/*
“La clínica “SAN PATRÁS” necesita llevar un control informatizado de su gestión de Pacientes y médicos. De cada paciente
 se desea guardar el código, nombre, apellidos, dirección, población, provincia, código postal, teléfono y fecha de 
 nacimiento.
De cada médico se desea guardar el código, nombre, apellidos, teléfono y especialidad. Se desea llevar el control de cada
 uno de los ingresos que el paciente hace en el hospital. Cada ingreso que realiza el paciente queda registrado en la base
 de datos. De cada ingreso se guarda el código de ingreso (que se incrementará automáticamente cada vez que el paciente
 realice un ingreso), el número de habitación y cama en la que el paciente realiza el ingreso y la fecha de ingreso.
Un médico puede atender varios ingresos, pero el ingreso de un paciente solo puede ser atendido por un único médico.
 Un paciente puede realizar varios ingresos en el hospital”.
*/

CREATE TABLE pacientes(
    codigo_paciente INT NOT NULL PRIMARY KEY,
    nombre_paciente VARCHAR(60) NOT NULL,
    apellidos_paciente VARCHAR(60) NOT NULL,
    direccion_paciente VARCHAR(100) NOT NULL,
    poblacion VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    telefono_paciente VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    UNIQUE(codigo_paciente)
);

CREATE TABLE medicos(
    codigo_medico INT NOT NULL PRIMARY KEY,
    nombre_medico VARCHAR(60) NOT NULL,
    apellidos_medico VARCHAR(60) NOT NULL,
    telefono_medico VARCHAR(20) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    UNIQUE(codigo_medico)
);

CREATE TABLE ingresos(
    codigo_ingreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_codigo_paciente INT NOT NULL,
    fk_codigo_medico INT NOT NULL,
    numero_habitacion INT NOT NULL,
    cama INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (fk_codigo_paciente) REFERENCES pacientes(codigo_paciente),
    FOREIGN KEY (fk_codigo_medico) REFERENCES medicos(codigo_medico),
    UNIQUE(codigo_ingreso, fk_codigo_paciente, fk_codigo_medico)
);
