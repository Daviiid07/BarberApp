-- BarberApp - Pruebas de integridad de MySQL
-- Requiere schema.sql y data.sql ejecutados previamente.
-- Ejecutar cada bloque por separado, NO todo el fichero de una vez.
-- Los errores indicados son esperados. Ejecutar siempre el ROLLBACK
-- de cada bloque, incluso si la sentencia anterior produce un error.
USE barberapp;

-- 01. Usuario valido: debe insertarse una fila.
START TRANSACTION;
INSERT INTO usuario (id, nombre, apellidos, email, telefono, contrasena)
VALUES (-1, 'Usuario', 'Prueba', 'test@example.com', '600000099',
        (SELECT contrasena FROM (SELECT contrasena FROM usuario WHERE id = 2) AS u));
SELECT id, nombre, rol FROM usuario WHERE id = -1;
-- Esperado: rol CLIENTE por defecto.
ROLLBACK;

-- 02. Email duplicado: error 1062 (UNIQUE).
START TRANSACTION;
UPDATE usuario SET email = 'pablo@example.com' WHERE id = 3;
ROLLBACK;

-- 03. Nombre NULL: error 1048 (NOT NULL).
START TRANSACTION;
UPDATE usuario SET nombre = NULL WHERE id = 2;
ROLLBACK;

-- 04. Nombre vacio: error 3819 (CHECK).
START TRANSACTION;
UPDATE usuario SET nombre = '   ' WHERE id = 2;
ROLLBACK;

-- 05. Precio negativo: error 3819 (CHECK).
START TRANSACTION;
UPDATE servicio SET precio = -5 WHERE id = 1;
ROLLBACK;

-- 06. Duracion cero: error 3819 (CHECK).
START TRANSACTION;
UPDATE servicio SET duracion = 0 WHERE id = 1;
ROLLBACK;

-- 07. Usuario inexistente: error 1452 (FOREIGN KEY).
START TRANSACTION;
UPDATE cita SET usuario_id = -999 WHERE id = 1;
ROLLBACK;

-- 08. Hora de fin anterior a la de inicio: error 3819 (CHECK).
START TRANSACTION;
UPDATE cita SET hora_fin = '09:00:00' WHERE id = 1;
ROLLBACK;

-- 09. Hora fuera del dia: error 3819 (CHECK).
START TRANSACTION;
UPDATE cita SET hora_fin = '25:00:00' WHERE id = 1;
ROLLBACK;

-- 10. Servicio duplicado en una cita: error 1062 (PRIMARY KEY).
START TRANSACTION;
INSERT INTO cita_servicio (cita_id, servicio_id, precio, duracion)
VALUES (1, 1, 12.00, 30);
ROLLBACK;

-- 11. Dia de semana invalido: error 3819 (CHECK).
START TRANSACTION;
UPDATE horario SET dia_semana = 8 WHERE dia_semana = 6;
ROLLBACK;

-- 12. Horario duplicado: error 1062 (UNIQUE).
START TRANSACTION;
INSERT INTO horario (id, dia_semana, hora_apertura, hora_cierre)
VALUES (-1, 1, '09:00:00', '14:00:00');
ROLLBACK;

-- 13. Bloqueo con horas invalidas: error 3819 (CHECK).
START TRANSACTION;
INSERT INTO bloqueo (id, fecha, hora_inicio, hora_fin, motivo)
VALUES (-1, CURDATE(), '12:00:00', '11:00:00', 'Prueba');
ROLLBACK;

-- 14. Eliminar servicio referenciado: error 1451 (RESTRICT).
START TRANSACTION;
DELETE FROM servicio WHERE id = 1;
ROLLBACK;

-- 15. Eliminar usuario referenciado: error 1451 (RESTRICT).
START TRANSACTION;
DELETE FROM usuario WHERE id = 2;
ROLLBACK;

-- 16. Eliminar cita: debe eliminar tambien sus dos servicios (CASCADE).
START TRANSACTION;
SELECT COUNT(*) AS lineas_antes FROM cita_servicio WHERE cita_id = 2;
DELETE FROM cita WHERE id = 2;
SELECT COUNT(*) AS citas_despues FROM cita WHERE id = 2;
SELECT COUNT(*) AS lineas_despues FROM cita_servicio WHERE cita_id = 2;
-- Esperado: 2, 0, 0.
ROLLBACK;
SELECT COUNT(*) AS citas_restauradas FROM cita WHERE id = 2;
SELECT COUNT(*) AS lineas_restauradas FROM cita_servicio WHERE cita_id = 2;
-- Esperado: 1, 2.

-- 17. Comprobacion final: mismos recuentos que data.sql.
SELECT 'usuario' AS tabla, COUNT(*) AS registros FROM usuario
UNION ALL SELECT 'servicio', COUNT(*) FROM servicio
UNION ALL SELECT 'horario', COUNT(*) FROM horario
UNION ALL SELECT 'bloqueo', COUNT(*) FROM bloqueo
UNION ALL SELECT 'cita', COUNT(*) FROM cita
UNION ALL SELECT 'cita_servicio', COUNT(*) FROM cita_servicio;
-- Esperado: 6, 5, 11, 3, 8, 11 (44 registros).
