CREATE DATABASE IF NOT EXISTS ConsumoElectrico;
USE ConsumoElectrico;

DELIMITER $$

CREATE PROCEDURE CrearTablas()
BEGIN

CREATE TABLE IF NOT EXISTS Usuario (
id_Usuario VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
correo VARCHAR(100) UNIQUE NOT NULL,
telefono VARCHAR(15),
contrasena VARCHAR(255) NOT NULL,
fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS UsuarioResponsable (
id_UsuarioR VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
correo VARCHAR(100) UNIQUE NOT NULL,
telefono VARCHAR(15),
contrasena VARCHAR(255) NOT NULL,
fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
codigoAcceso VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS Proyecto (
codigo_Proyecto VARCHAR(10) PRIMARY KEY,
ubicacion VARCHAR(50),
codigoAcceso VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS GestionProyecto (
codigo_Proyecto VARCHAR(10),
id_Usuario VARCHAR(10),
id_UsuarioR VARCHAR(10),
PRIMARY KEY (codigo_Proyecto,id_Usuario,id_UsuarioR),
FOREIGN KEY (codigo_Proyecto) REFERENCES Proyecto(codigo_Proyecto),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario),
FOREIGN KEY (id_UsuarioR) REFERENCES UsuarioResponsable(id_UsuarioR)
);

CREATE TABLE IF NOT EXISTS Dispositivo (
id_Dispositivo VARCHAR(10) PRIMARY KEY,
id_Usuario VARCHAR(10) NOT NULL,
nombre VARCHAR(100) NOT NULL,
modelo VARCHAR(50),
tipo_Medidor VARCHAR(50),
ubicacion VARCHAR(100),
descripcion TEXT,
estado ENUM('activo','inactivo') DEFAULT 'activo',
fecha_Instalacion DATE DEFAULT (CURRENT_DATE),
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);

CREATE TABLE IF NOT EXISTS NivelConsumo (
id_Nivel INT PRIMARY KEY,
tipo VARCHAR(50) NOT NULL,
descripcion VARCHAR(150),
limite_Min DOUBLE DEFAULT 0,
limite_Max DOUBLE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS Medicion (
id_Medicion BIGINT AUTO_INCREMENT PRIMARY KEY,
id_Dispositivo VARCHAR(10) NOT NULL,
fecha_hora DATETIME NOT NULL,
valor DOUBLE NOT NULL,
unidad VARCHAR(10) DEFAULT 'kWh',
voltaje DOUBLE,
corriente DOUBLE,
potencia DOUBLE,
FOREIGN KEY (id_Dispositivo) REFERENCES Dispositivo(id_Dispositivo)
);

CREATE TABLE IF NOT EXISTS HistorialConsumo (
id_Historial INT AUTO_INCREMENT PRIMARY KEY,
id_Dispositivo VARCHAR(10),
periodo ENUM('diario','semanal','mensual') DEFAULT 'diario',
fecha_Inicio DATE,
fecha_Fin DATE,
consumo_Total DOUBLE DEFAULT 0,
promedio DOUBLE DEFAULT 0,
FOREIGN KEY (id_Dispositivo) REFERENCES Dispositivo(id_Dispositivo)
);

CREATE TABLE IF NOT EXISTS Alerta (
id_Alerta INT AUTO_INCREMENT PRIMARY KEY,
id_Medicion BIGINT NOT NULL,
id_Nivel INT,
mensaje VARCHAR(255),
fecha_Alerta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
estado ENUM('pendiente','enviada','resuelta') DEFAULT 'pendiente',
FOREIGN KEY (id_Medicion) REFERENCES Medicion(id_Medicion),
FOREIGN KEY (id_Nivel) REFERENCES NivelConsumo(id_Nivel)
);

CREATE TABLE IF NOT EXISTS ConfiguracionUsuario (
id_Configuracion INT AUTO_INCREMENT PRIMARY KEY,
id_Usuario VARCHAR(10) NOT NULL,
limite_Diario DOUBLE,
limite_Mensual DOUBLE,
notificaciones ENUM('activadas','desactivadas') DEFAULT 'activadas',
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);

CREATE TABLE IF NOT EXISTS Recomendacion (
id_Recomendacion INT AUTO_INCREMENT PRIMARY KEY,
id_Usuario VARCHAR(10) NOT NULL,
id_Dispositivo VARCHAR(10),
descripcion TEXT NOT NULL,
tipo ENUM('ahorro','mantenimiento','uso') DEFAULT 'ahorro',
fecha_Generada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario),
FOREIGN KEY (id_Dispositivo) REFERENCES Dispositivo(id_Dispositivo)
);

CREATE TABLE IF NOT EXISTS Notificacion (
id_Notificacion INT AUTO_INCREMENT PRIMARY KEY,
id_Usuario VARCHAR(10) NOT NULL,
titulo VARCHAR(100),
mensaje TEXT,
tipo ENUM('alerta','recomendacion','informativa') DEFAULT 'informativa',
leida BOOLEAN DEFAULT FALSE,
fecha_Envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario)
);

END$$

CALL CrearTablas();
DELIMITER ;