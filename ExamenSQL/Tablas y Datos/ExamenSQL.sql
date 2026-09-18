USE CENTROSALUD2;

-- =========================================
-- 1. PERSONAL
-- =========================================

CREATE TABLE personal (
    id_personal INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    fecha_incorporacion DATE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    categoria VARCHAR(20)
);


-- =========================================
-- 2. TIPO DE EMPLEADO
-- =========================================

CREATE TABLE tipo_empleado (
    id_tipo_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);


-- =========================================
-- 3. TIPO DE MEDICO
-- =========================================

CREATE TABLE tipo_medico (
    id_tipo_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);


-- =========================================
-- 4. ESPECIALIDAD
-- =========================================

CREATE TABLE especialidad (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL
);


-- =========================================
-- 5. EMPLEADO
-- =========================================

CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY,
    id_tipo_empleado INT NOT NULL,

    FOREIGN KEY (id_empleado)
        REFERENCES personal(id_personal),

    FOREIGN KEY (id_tipo_empleado)
        REFERENCES tipo_empleado(id_tipo_empleado)
);


-- =========================================
-- 6. MEDICO
-- =========================================

CREATE TABLE medico (
    id_medico INT PRIMARY KEY,
    numero_colegiado VARCHAR(15) NOT NULL,
    id_tipo_medico INT NOT NULL,
    id_especialidad INT NOT NULL,

    FOREIGN KEY (id_medico)
        REFERENCES personal(id_personal),

    FOREIGN KEY (id_tipo_medico)
        REFERENCES tipo_medico(id_tipo_medico),

    FOREIGN KEY (id_especialidad)
        REFERENCES especialidad(id_especialidad)
);


-- =========================================
-- 7. PACIENTE
-- =========================================

CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20),
    tarjeta_sanitaria VARCHAR(20) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20),
    fecha_alta DATE NOT NULL,
    id_medico INT NOT NULL,

    FOREIGN KEY (id_medico)
        REFERENCES medico(id_medico)
);


-- =========================================
-- 8. HORARIO DE CONSULTA
-- =========================================

CREATE TABLE horario_consulta (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    dia_semana VARCHAR(15) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,

    FOREIGN KEY (id_medico)
        REFERENCES medico(id_medico)
);


-- =========================================
-- 9. EMPLEADO MEDICO
-- =========================================

CREATE TABLE empleado_medico (
    id_empleado INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    funcion VARCHAR(60),

    PRIMARY KEY (id_empleado, id_medico),

    FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado),

    FOREIGN KEY (id_medico)
        REFERENCES medico(id_medico)
);


-- =========================================
-- 10. SUSTITUCION
-- =========================================

CREATE TABLE sustitucion (
    id_sustitucion INT AUTO_INCREMENT PRIMARY KEY,
    id_medico_sustituto INT NOT NULL,
    id_medico_sustituido INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    motivo VARCHAR(50),

    FOREIGN KEY (id_medico_sustituto)
        REFERENCES medico(id_medico),

    FOREIGN KEY (id_medico_sustituido)
        REFERENCES medico(id_medico)
);


-- =========================================
-- 11. VACACIONES
-- =========================================

CREATE TABLE vacaciones (
    id_vacaciones INT AUTO_INCREMENT PRIMARY KEY,
    id_personal INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    dias INT,
    estado VARCHAR(20) DEFAULT 'planificada',
    observaciones VARCHAR(200),

    FOREIGN KEY (id_personal)
        REFERENCES personal(id_personal)
);



-- =========================================
-- DATOS PARA PERSONAL
-- =========================================

INSERT INTO personal
(dni, nombre, apellidos, fecha_nacimiento, telefono, email, fecha_incorporacion, activo, categoria)
VALUES
('100100100', 'Carlos', 'Gomez Perez', '1985-03-15', '3001111111', 'carlos@gmail.com', '2020-01-10', TRUE, 'medico'),
('100100101', 'Maria', 'Rodriguez Lopez', '1990-07-20', '3002222222', 'maria@gmail.com', '2021-02-15', TRUE, 'medico'),
('100100102', 'Juan', 'Martinez Diaz', '1988-11-05', '3003333333', 'juan@gmail.com', '2019-05-20', TRUE, 'medico'),
('100100103', 'Laura', 'Hernandez Ruiz', '1995-01-25', '3004444444', 'laura@gmail.com', '2022-03-10', TRUE, 'empleado'),
('100100104', 'Pedro', 'Gonzalez Torres', '1992-06-18', '3005555555', 'pedro@gmail.com', '2022-04-12', TRUE, 'empleado'),
('100100105', 'Ana', 'Ramirez Castro', '1998-09-30', '3006666666', 'ana@gmail.com', '2023-01-15', TRUE, 'empleado');


-- =========================================
-- DATOS PARA TIPO_EMPLEADO
-- =========================================

INSERT INTO tipo_empleado (nombre)
VALUES
('Enfermero'),
('Administrativo'),
('Recepcionista'),
('Auxiliar');


-- =========================================
-- DATOS PARA TIPO_MEDICO
-- =========================================

INSERT INTO tipo_medico (nombre)
VALUES
('General'),
('Especialista'),
('Cirujano');


-- =========================================
-- DATOS PARA ESPECIALIDAD
-- =========================================

INSERT INTO especialidad (nombre)
VALUES
('Medicina General'),
('Cardiologia'),
('Pediatria'),
('Dermatologia');


-- =========================================
-- DATOS PARA EMPLEADO
-- =========================================

INSERT INTO empleado (id_empleado, id_tipo_empleado)
VALUES
(4, 1),
(5, 2),
(6, 3);


-- =========================================
-- DATOS PARA MEDICO
-- =========================================

INSERT INTO medico
(id_medico, numero_colegiado, id_tipo_medico, id_especialidad)
VALUES
(1, 'MED001', 1, 1),
(2, 'MED002', 2, 2),
(3, 'MED003', 2, 3);


-- =========================================
-- DATOS PARA PACIENTE
-- =========================================

INSERT INTO paciente
(dni, tarjeta_sanitaria, nombre, apellidos, fecha_nacimiento, telefono, fecha_alta, id_medico)
VALUES
('200200200', 'TS001', 'Andres', 'Lopez Garcia', '1995-04-10', '3101111111', '2024-01-15', 1),
('200200201', 'TS002', 'Sofia', 'Martinez Perez', '2000-08-22', '3102222222', '2024-02-10', 2),
('200200202', 'TS003', 'Daniel', 'Rodriguez Gomez', '2015-05-12', '3103333333', '2024-03-05', 3),
('200200203', 'TS004', 'Camila', 'Hernandez Ruiz', '1998-12-01', '3104444444', '2024-03-20', 1),
('200200204', 'TS005', 'Miguel', 'Torres Castro', '1980-09-17', '3105555555', '2024-04-10', 2);


-- =========================================
-- DATOS PARA HORARIO_CONSULTA
-- =========================================

INSERT INTO horario_consulta
(id_medico, dia_semana, hora_inicio, hora_fin)
VALUES
(1, 'lunes', '08:00:00', '12:00:00'),
(1, 'miercoles', '08:00:00', '12:00:00'),
(1, 'viernes', '14:00:00', '18:00:00'),

(2, 'martes', '08:00:00', '12:00:00'),
(2, 'jueves', '14:00:00', '18:00:00'),

(3, 'lunes', '14:00:00', '18:00:00'),
(3, 'viernes', '08:00:00', '12:00:00');


-- =========================================
-- DATOS PARA EMPLEADO_MEDICO
-- =========================================

INSERT INTO empleado_medico
(id_empleado, id_medico, fecha_asignacion, funcion)
VALUES
(4, 1, '2024-01-10', 'Asistente medico'),
(5, 2, '2024-02-15', 'Asistente administrativo'),
(6, 3, '2024-03-01', 'Recepcionista');


-- =========================================
-- DATOS PARA SUSTITUCION
-- =========================================

INSERT INTO sustitucion
(id_medico_sustituto, id_medico_sustituido, fecha_inicio, fecha_fin, motivo)
VALUES
(2, 1, '2024-06-01', '2024-06-15', 'Vacaciones'),
(3, 2, '2024-07-01', '2024-07-10', 'Permiso');


-- =========================================
-- DATOS PARA VACACIONES
-- =========================================

INSERT INTO vacaciones
(id_personal, fecha_inicio, fecha_fin, dias, estado, observaciones)
VALUES
(1, '2024-08-01', '2024-08-10', 10, 'planificada', 'Vacaciones de agosto'),
(2, '2024-07-15', '2024-07-24', 10, 'disfrutada', 'Vacaciones programadas'),
(3, '2024-09-01', '2024-09-05', 5, 'planificada', 'Vacaciones pendientes'),
(4, '2024-06-10', '2024-06-15', 6, 'disfrutada', 'Descanso anual'),
(5, '2024-12-20', '2024-12-30', 11, 'planificada', 'Vacaciones de fin de año');


