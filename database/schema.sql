CREATE DATABASE IF NOT EXISTS barberapp
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE barberapp;


-- ==========================================
-- TABLA USUARIO
-- ==========================================

CREATE TABLE usuario (
     id BIGINT AUTO_INCREMENT,
     nombre VARCHAR(50) NOT NULL,
     apellidos VARCHAR(100) NOT NULL,
     email VARCHAR(150) NOT NULL,
     telefono VARCHAR(20) NOT NULL,
     contrasena VARCHAR(255) NOT NULL,
     rol ENUM('CLIENTE', 'BARBERO') NOT NULL DEFAULT 'CLIENTE',

     CONSTRAINT pk_usuario PRIMARY KEY (id),

     CONSTRAINT uq_usuario_email UNIQUE (email),

     CONSTRAINT chk_usuario_nombre
         CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),

     CONSTRAINT chk_usuario_apellidos
         CHECK (CHAR_LENGTH(TRIM(apellidos)) > 0),

     CONSTRAINT chk_usuario_email
         CHECK (CHAR_LENGTH(TRIM(email)) > 0),

     CONSTRAINT chk_usuario_telefono
         CHECK (CHAR_LENGTH(TRIM(telefono)) > 0),

     CONSTRAINT chk_usuario_contrasena
         CHECK (CHAR_LENGTH(TRIM(contrasena)) > 0)
) ENGINE = InnoDB;


-- ==========================================
-- TABLA SERVICIO
-- ==========================================

CREATE TABLE servicio (
    id BIGINT AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(8,2) NOT NULL,
    duracion INT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_servicio PRIMARY KEY (id),

    CONSTRAINT uq_servicio_nombre UNIQUE (nombre),

    CONSTRAINT chk_servicio_nombre
    CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),

    CONSTRAINT chk_servicio_precio
      CHECK (precio >= 0),

    CONSTRAINT chk_servicio_duracion
      CHECK (duracion > 0),

    CONSTRAINT chk_servicio_activo
      CHECK (activo IN (0, 1))
) ENGINE = InnoDB;


-- ==========================================
-- TABLA CITA
-- ==========================================

CREATE TABLE cita (
    id BIGINT AUTO_INCREMENT,
    usuario_id BIGINT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    precio_total DECIMAL(8,2) NOT NULL,
    estado ENUM('PENDIENTE', 'COMPLETADA', 'CANCELADA') NOT NULL DEFAULT 'PENDIENTE',

    CONSTRAINT pk_cita PRIMARY KEY (id),

    CONSTRAINT fk_cita_usuario
    FOREIGN KEY (usuario_id)
      REFERENCES usuario(id)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,

    CONSTRAINT chk_cita_horas
    CHECK (hora_fin > hora_inicio),

    CONSTRAINT chk_cita_rango_horas
    CHECK (
      hora_inicio >= '00:00:00'
          AND hora_fin <= '23:59:59'
      ),

    CONSTRAINT chk_cita_precio_total
    CHECK (precio_total >= 0)
) ENGINE = InnoDB;


-- ==========================================
-- TABLA CITA_SERVICIO
-- ==========================================

CREATE TABLE cita_servicio (
   cita_id BIGINT NOT NULL,
   servicio_id BIGINT NOT NULL,
   precio DECIMAL(8,2) NOT NULL,
   duracion INT NOT NULL,

   CONSTRAINT pk_cita_servicio
       PRIMARY KEY (cita_id, servicio_id),

   CONSTRAINT fk_cita_servicio_cita
       FOREIGN KEY (cita_id)
           REFERENCES cita(id)
           ON DELETE CASCADE
           ON UPDATE RESTRICT,

   CONSTRAINT fk_cita_servicio_servicio
       FOREIGN KEY (servicio_id)
           REFERENCES servicio(id)
           ON DELETE RESTRICT
           ON UPDATE RESTRICT,

   CONSTRAINT chk_cita_servicio_precio
       CHECK (precio >= 0),

   CONSTRAINT chk_cita_servicio_duracion
       CHECK (duracion > 0)
) ENGINE = InnoDB;


-- ==========================================
-- TABLA HORARIO
-- ==========================================

CREATE TABLE horario (
     id BIGINT AUTO_INCREMENT,
     dia_semana TINYINT NOT NULL,
     hora_apertura TIME NOT NULL,
     hora_cierre TIME NOT NULL,

     CONSTRAINT pk_horario PRIMARY KEY (id),

     CONSTRAINT uq_horario_franja
         UNIQUE (dia_semana, hora_apertura, hora_cierre),

     CONSTRAINT chk_horario_dia_semana
         CHECK (dia_semana BETWEEN 1 AND 7),

     CONSTRAINT chk_horario_horas
         CHECK (hora_cierre > hora_apertura),

     CONSTRAINT chk_horario_rango_horas
         CHECK (
             hora_apertura >= '00:00:00'
                 AND hora_cierre <= '23:59:59'
             )
) ENGINE = InnoDB;


-- ==========================================
-- TABLA BLOQUEO
-- ==========================================

CREATE TABLE bloqueo (
    id BIGINT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    motivo VARCHAR(255),

    CONSTRAINT pk_bloqueo PRIMARY KEY (id),

    CONSTRAINT uq_bloqueo_franja
     UNIQUE (fecha, hora_inicio, hora_fin),

    CONSTRAINT chk_bloqueo_horas
     CHECK (hora_fin > hora_inicio),

    CONSTRAINT chk_bloqueo_rango_horas
     CHECK (
         hora_inicio >= '00:00:00'
             AND hora_fin <= '23:59:59'
         )
) ENGINE = InnoDB;


-- ==========================================
-- INDICES
-- ==========================================

CREATE INDEX idx_cita_disponibilidad
    ON cita (fecha, estado, hora_inicio);

CREATE INDEX idx_cita_usuario_fecha
    ON cita (usuario_id, fecha);
