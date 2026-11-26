-- BarberApp: datos ficticios para desarrollo. Ejecutar una sola vez sobre tablas vacias.
-- No ejecutar en produccion. Contrasena de prueba: Barber1234 (BCrypt).
USE barberapp;
SET @hash = '$2a$10$winQHoncTLvYl/s7SDbpn.jhh7nJ2mQsK3l9UCTRDYT0DB5VRPZQ.';
-- Lunes de la semana actual; las citas futuras empiezan la semana siguiente.
SET @lunes = DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY);

INSERT INTO usuario (id, nombre, apellidos, email, telefono, contrasena, rol) VALUES
(1, 'Marcos', 'Ruiz', 'barbero@example.com', '600000001', @hash, 'BARBERO'),
(2, 'Pablo', 'Garcia', 'pablo@example.com', '600000002', @hash, 'CLIENTE'),
(3, 'Daniel', 'Lopez', 'daniel@example.com', '600000003', @hash, 'CLIENTE'),
(4, 'Hugo', 'Martin', 'hugo@example.com', '600000004', @hash, 'CLIENTE'),
(5, 'Alvaro', 'Sanchez', 'alvaro@example.com', '600000005', @hash, 'CLIENTE'),
(6, 'Adrian', 'Perez', 'adrian@example.com', '600000006', @hash, 'CLIENTE');

INSERT INTO servicio (id, nombre, descripcion, precio, duracion, activo) VALUES
(1, 'Corte', 'Corte de pelo', 12.00, 30, TRUE),
(2, 'Barba', 'Arreglo de barba', 7.00, 15, TRUE),
(3, 'Cejas', 'Perfilado de cejas', 3.00, 10, TRUE),
(4, 'Tinte', 'Coloracion del cabello', 25.00, 60, TRUE),
(5, 'Lavado', 'Lavado de cabello', 5.00, 10, TRUE);

INSERT INTO horario (dia_semana, hora_apertura, hora_cierre) VALUES
(1, '09:00:00', '14:00:00'),
(1, '16:00:00', '20:00:00'),
(2, '09:00:00', '14:00:00'),
(2, '16:00:00', '20:00:00'),
(3, '09:00:00', '14:00:00'),
(3, '16:00:00', '20:00:00'),
(4, '09:00:00', '14:00:00'),
(4, '16:00:00', '20:00:00'),
(5, '09:00:00', '14:00:00'),
(5, '16:00:00', '20:00:00'),
(6, '09:00:00', '14:00:00');

INSERT INTO bloqueo (fecha, hora_inicio, hora_fin, motivo) VALUES
(DATE_ADD(@lunes, INTERVAL 7 DAY), '12:00:00', '13:00:00', 'Gestion personal'),
(DATE_ADD(@lunes, INTERVAL 9 DAY), '16:00:00', '17:00:00', 'Mantenimiento'),
(DATE_ADD(@lunes, INTERVAL 12 DAY), '09:00:00', '14:00:00', 'Ausencia');

INSERT INTO cita (id, usuario_id, fecha, hora_inicio, hora_fin, precio_total, estado) VALUES
(1, 2, DATE_SUB(@lunes, INTERVAL 7 DAY), '10:00:00', '10:30:00', 12.00, 'COMPLETADA'),
(2, 3, DATE_SUB(@lunes, INTERVAL 6 DAY), '11:00:00', '11:45:00', 19.00, 'COMPLETADA'),
(3, 4, DATE_SUB(@lunes, INTERVAL 5 DAY), '10:00:00', '10:15:00', 7.00, 'CANCELADA'),
(4, 2, DATE_ADD(@lunes, INTERVAL 7 DAY), '10:00:00', '10:45:00', 19.00, 'PENDIENTE'),
(5, 5, DATE_ADD(@lunes, INTERVAL 7 DAY), '10:45:00', '11:15:00', 12.00, 'PENDIENTE'),
(6, 6, DATE_ADD(@lunes, INTERVAL 8 DAY), '16:00:00', '17:10:00', 30.00, 'PENDIENTE'),
(7, 3, DATE_ADD(@lunes, INTERVAL 9 DAY), '11:00:00', '11:10:00', 3.00, 'PENDIENTE'),
(8, 4, DATE_ADD(@lunes, INTERVAL 7 DAY), '10:00:00', '10:30:00', 12.00, 'CANCELADA');

INSERT INTO cita_servicio (cita_id, servicio_id, precio, duracion) VALUES
(1, 1, 12.00, 30),
(2, 1, 12.00, 30), (2, 2, 7.00, 15),
(3, 2, 7.00, 15),
(4, 1, 12.00, 30), (4, 2, 7.00, 15),
(5, 1, 12.00, 30),
(6, 4, 25.00, 60), (6, 5, 5.00, 10),
(7, 3, 3.00, 10),
(8, 1, 12.00, 30);
