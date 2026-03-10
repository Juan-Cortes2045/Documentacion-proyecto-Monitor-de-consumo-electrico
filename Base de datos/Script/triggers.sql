CREATE TABLE Log (
id_Log INT IDENTITY(1,1) PRIMARY KEY,
tabla VARCHAR(100) NOT NULL,
accion VARCHAR(100) NOT NULL,
id_Registro INT;
fecha DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER Insertar_Usuario 
ON Usuario 
AFTER INSERT 
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT
        'Usuario',
        'INSERT',
        id_usuario
    FROM inserted;
END;
GO


CREATE TRIGGER Actualizar_Usuario
ON Usuario
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT
        'Usuario',
        'UPDATE',
        id_usuario
    FROM inserted;
END;
GO


CREATE TRIGGER Eliminar_Usuario
ON Usuario
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT
        'Usuario',
        'DELETE',
        id_usuario
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_Dispositivo
ON Dispositivo
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Dispositivo', 'INSERT', id_dispositivo
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_Dispositivo
ON Dispositivo
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Dispositivo', 'UPDATE', id_dispositivo
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_Dispositivo
ON Dispositivo
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Dispositivo', 'DELETE', id_dispositivo
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_ConfiguracionUsuario
ON ConfiguracionUsuario
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'ConfiguracionUsuario', 'INSERT', id_configuracion
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_ConfiguracionUsuario
ON ConfiguracionUsuario
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'ConfiguracionUsuario', 'UPDATE', id_configuracion
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_ConfiguracionUsuario
ON ConfiguracionUsuario
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'ConfiguracionUsuario', 'DELETE', id_configuracion
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_Recomendacion
ON Recomendacion
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Recomendacion', 'INSERT', id_recomendacion
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_Recomendacion
ON Recomendacion
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Recomendacion', 'UPDATE', id_recomendacion
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_Recomendacion
ON Recomendacion
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Recomendacion', 'DELETE', id_recomendacion
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_Medicion
ON Medicion
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Medicion', 'INSERT', id_medicion
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_Medicion
ON Medicion
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Medicion', 'UPDATE', id_medicion
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_Medicion
ON Medicion
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Medicion', 'DELETE', id_medicion
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_Alerta
ON Alerta
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Alerta', 'INSERT', id_alerta
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_Alerta
ON Alerta
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Alerta', 'UPDATE', id_alerta
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_Alerta
ON Alerta
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Alerta', 'DELETE', id_alerta
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_Notificacion
ON Notificacion
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Notificacion', 'INSERT', id_notificacion
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_Notificacion
ON Notificacion
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Notificacion', 'UPDATE', id_notificacion
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_Notificacion
ON Notificacion
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'Notificacion', 'DELETE', id_notificacion
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_HistorialConsumo
ON HistorialConsumo
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'HistorialConsumo', 'INSERT', id_historial
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_HistorialConsumo
ON HistorialConsumo
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'HistorialConsumo', 'UPDATE', id_historial
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_HistorialConsumo
ON HistorialConsumo
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'HistorialConsumo', 'DELETE', id_historial
    FROM deleted;
END;
GO

CREATE TRIGGER Insertar_NivelConsumo
ON NivelConsumo
AFTER INSERT
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'NivelConsumo', 'INSERT', id_nivel
    FROM inserted;
END;
GO

CREATE TRIGGER Actualizar_NivelConsumo
ON NivelConsumo
AFTER UPDATE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'NivelConsumo', 'UPDATE', id_nivel
    FROM inserted;
END;
GO

CREATE TRIGGER Eliminar_NivelConsumo
ON NivelConsumo
AFTER DELETE
AS
BEGIN
    INSERT INTO Log (tabla, accion, id_Registro)
    SELECT 'NivelConsumo', 'DELETE', id_nivel
    FROM deleted;
END;
GO

