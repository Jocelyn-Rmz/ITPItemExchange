-- Crear base de datos
CREATE DATABASE IF NOT EXISTS ITP_ITEM_EXCHANGE;
USE ITP_ITEM_EXCHANGE;

-- Tabla: alumnos
CREATE TABLE alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    no_control VARCHAR(15) UNIQUE,
    correo VARCHAR(100),
    carrera VARCHAR(100),
    ubicacion VARCHAR(100),
    horario_disponible VARCHAR(100)
);

-- Tabla: items
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    imagen VARCHAR(200),
    estado ENUM('disponible', 'prestado') DEFAULT 'disponible',
    alumno_id INT,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id)
);

-- Prestamos 
CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    alumno_receptor_id INT,
    fecha_prestamo DATETIME DEFAULT CURRENT_TIMESTAMP,
    lugar_entrega VARCHAR(100),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (alumno_receptor_id) REFERENCES alumnos(id)
);



-- Vista: Reporte de ítems disponibles para compartir
CREATE VIEW vw_items_disponibles AS
SELECT 
    i.id AS item_id,
    i.nombre AS nombre_item,
    i.descripcion,
    i.estado,
    i.imagen,
    a.nombre AS propietario,
    a.no_control,
    a.correo,
    a.ubicacion,
    a.horario_disponible
FROM items i
JOIN alumnos a ON i.alumno_id = a.id
WHERE i.estado = 'disponible';

-- Vista de prestamos 
CREATE VIEW vw_items_prestados AS
SELECT 
 i.id AS item_id,
    i.nombre AS nombre_item,
    i.descripcion,
    i.imagen,
    p.fecha_prestamo,
    p.lugar_entrega,
    a1.nombre AS propietario,
    a2.nombre AS receptor,
    a2.no_control AS no_control_receptor,
    a2.correo AS correo_receptor,
    a2.id AS alumno_receptor_id
FROM prestamos p
JOIN items i ON p.item_id = i.id
JOIN alumnos a1 ON i.alumno_id = a1.id
JOIN alumnos a2 ON p.alumno_receptor_id = a2.id;
SELECT * FROM vw_items_prestados LIMIT 1;

DROP VIEW vw_items_prestados;

-- Procedimiento  de registrar prestamo 
DELIMITER $$
CREATE PROCEDURE spRegistrarPrestamo (
    IN p_item_id INT,
    IN p_alumno_receptor_id INT,
    IN p_lugar_entrega VARCHAR(100)
)
BEGIN
DECLARE v_estado VARCHAR(20);
  -- Verificar estado del ítem
    SELECT estado INTO v_estado FROM items WHERE id = p_item_id;
   IF v_estado = 'disponible' THEN
   -- Registrar el préstamo
    INSERT INTO prestamos (item_id, alumno_receptor_id, lugar_entrega)
    VALUES (p_item_id, p_alumno_receptor_id, p_lugar_entrega);

    -- Marcar el ítem como "prestado"
    UPDATE items SET estado = 'prestado' WHERE id = p_item_id;
END $$
DELIMITER ;

-- Procedimeinto de insertar alumno
DELIMITER $$
CREATE PROCEDURE spInsAlumno (
    IN p_nombre VARCHAR(100),
    IN p_no_control VARCHAR(15),
    IN p_correo VARCHAR(100),
    IN p_carrera VARCHAR(100),
    IN p_ubicacion VARCHAR(100),
    IN p_horario VARCHAR(100)
)
BEGIN
    INSERT INTO alumnos (nombre, no_control, correo, carrera, ubicacion, horario_disponible)
    VALUES (p_nombre, p_no_control, p_correo, p_carrera, p_ubicacion, p_horario);
END $$
DELIMITER ;

-- Procedimeinto de modificar alumno 
DELIMITER $$
CREATE PROCEDURE spUpdAlumno (
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_carrera VARCHAR(100),
    IN p_ubicacion VARCHAR(100),
    IN p_horario VARCHAR(100)
)
BEGIN
    UPDATE alumnos 
    SET nombre = p_nombre, correo = p_correo, carrera = p_carrera,
        ubicacion = p_ubicacion, horario_disponible = p_horario
    WHERE id = p_id;
END $$
DELIMITER ;

-- Procedimiento registrar item
DELIMITER $$
CREATE PROCEDURE spInsItem (
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_imagen VARCHAR(200),
    IN p_alumno_id INT
)
BEGIN
    INSERT INTO items (nombre, descripcion, imagen, alumno_id)
    VALUES (p_nombre, p_descripcion, p_imagen, p_alumno_id);
END $$
DELIMITER ;

-- Validar acceso 
DELIMITER $$
CREATE PROCEDURE spValidarAcceso (
    IN p_no_control VARCHAR(15),
    IN p_correo VARCHAR(100)
)
BEGIN
    SELECT id, nombre, no_control, correo, carrera, ubicacion, horario_disponible
    FROM alumnos
    WHERE no_control = p_no_control AND correo = p_correo;
END $$
DELIMITER ;



-- Insertar alumnos
CALL spInsAlumno('Luis Hernández', 'C12345', 'luis.h@itp.edu.mx', 'Ingeniería en Sistemas', 'Edificio B', '10:00-13:00');
CALL spInsAlumno('Ana Torres', 'C12346', 'ana.t@itp.edu.mx', 'Electrónica', 'Edificio A', '08:00-11:00');
CALL spInsAlumno('jocelyn Torres', 'C12456', 'joce.t@itp.edu.mx', 'ITICS', 'Edificio Y', '09:00-11:00');

-- Insertar items
CALL spInsItem('Libro de Cálculo', 'Edición 2022, buen estado', 'img/libro_calculo.jpg', 1);
CALL spInsItem('Multímetro', 'Funciona bien, con cables nuevos', 'img/multimetro.jpg', 2);
CALL spInsItem('Cable de red', 'largo 1m, buien estado', 'img/cable.jpg', 2);

-- Actualizar alumno
CALL spUpdAlumno(1, 'Luis H. Morales', 'luish@itp.edu.mx', 'Sistemas Computacionales', 'Edificio B', '10:00-14:00');

-- Consultar vista
SELECT * FROM vw_items_disponibles;

-- Ver alumnos registrados
SELECT * FROM alumnos;

-- Ver ítems registrados
SELECT * FROM items;


-- Este debe devolver un alumno válido (tras la actualización)
CALL spValidarAcceso('C12345', 'luish@itp.edu.mx');



-- Nuevo alumno
CALL spInsAlumno('Carlos Pérez', 'C12347', 'carlos.p@itp.edu.mx', 'Mecatrónica', 'Edificio C', '11:00-13:00');

-- Nuevo ítem
CALL spInsItem('Arduino UNO', 'Tarjeta con cable USB', 'img/arduino.jpg', 3);

-- Verifica después con:
SELECT * FROM alumnos;
SELECT * FROM items;
SELECT * FROM vw_items_disponibles;

-- Ejemplo: El alumno 3 toma prestado el ítem 1
CALL spRegistrarPrestamo(1, 3, 'Fuera del Salón B101');
SELECT * FROM vw_items_prestados;


SHOW PROCEDURE STATUS WHERE Name = 'spInsAlumno';

