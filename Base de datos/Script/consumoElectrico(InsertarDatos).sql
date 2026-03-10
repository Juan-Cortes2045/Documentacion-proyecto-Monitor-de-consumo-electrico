DELIMITER $$

CREATE PROCEDURE InsertarDatos()
BEGIN
    
    INSERT INTO Usuario (nombre, apellido, correo, telefono, contrasena) VALUES
    ('Juan', 'Cortes', 'juan.cortes@email.com', '3001112233', '1234'),
    ('Maria', 'Lopez', 'maria.lopez@email.com', '3002223344', '1234'),
    ('Carlos', 'Gomez', 'carlos.gomez@email.com', '3003334455', '1234'),
    ('Ana', 'Martinez', 'ana.martinez@email.com', '3004445566', '1234'),
    ('Sofia', 'Garcia', 'sofia.garcia@email.com', '3005556677', '1234'),
    ('Luis', 'Torres', 'luis.torres@email.com', '3006667788', '1234'),
    ('Valeria', 'Ruiz', 'valeria.ruiz@email.com', '3007778899', '1234'),
    ('Andres', 'Moreno', 'andres.moreno@email.com', '3008889900', '1234'),
    ('Laura', 'Sanchez', 'laura.sanchez@email.com', '3009990011', '1234'),
    ('Mateo', 'Vargas', 'mateo.vargas@email.com', '3010001122', '1234');

   
    INSERT INTO Dispositivo (id_usuario, nombre, modelo, tipo_medidor, ubicacion, descripcion)
    VALUES
    (1,'Monitor de Consumo Eléctrico de Juan','MD-100','Digital','Sala','Sensor principal del hogar'),
    (2,'Monitor de Consumo Eléctrico de Maria','MD-101','Smart','Cocina','Medidor conectado WiFi'),
    (3,'Monitor de Consumo Eléctrico de Carlos','MD-102','Smart','Habitación','Dispositivo de control energético'),
    (4,'Monitor de Consumo Eléctrico de Ana','MD-103','Digital','Comedor','Medidor interno de consumo'),
    (5,'Monitor de Consumo Eléctrico de Sofia','MD-104','Smart','Oficina','Equipo de monitoreo remoto'),
    (6,'Monitor de Consumo Eléctrico de Luis','MD-105','WiFi','Sala','Controlador con conexión Bluetooth'),
    (7,'Monitor de Consumo Eléctrico de Valeria','MD-106','Solar','Techo','Medidor solar principal'),
    (8,'Monitor de Consumo Eléctrico de Andres','MD-107','Digital','Garaje','Monitor de panel externo'),
    (9,'Monitor de Consumo Eléctrico de Laura','MD-108','Smart','Sala','Sensor inteligente doméstico'),
    (10,'Monitor de Consumo Eléctrico de Mateo','MD-109','WiFi','Cuarto','Dispositivo medidor de carga');

  
    INSERT INTO NivelConsumo (tipo, descripcion, limite_min, limite_max)
    VALUES
    ('Bajo','Consumo eficiente',0,1.5),
    ('Medio','Consumo promedio',1.6,3.5),
    ('Alto','Consumo elevado',3.6,6),
    ('Crítico','Consumo muy alto',6.1,NULL),
    ('Eficiente','Por debajo del promedio',0,1),
    ('Sobrecarga','Excede límites normales',6,NULL),
    ('Ecológico','Consumo sostenible',0,2),
    ('Desbalanceado','Variación irregular',2.5,5),
    ('Moderado','En nivel controlado',1,3),
    ('Excesivo','Supera lo establecido',5,NULL);

   
    INSERT INTO ConfiguracionUsuario (id_usuario, limite_diario, limite_mensual, notificaciones)
    VALUES
    (1,5,120,'activadas'),
    (2,6,140,'activadas'),
    (3,5,100,'activadas'),
    (4,4,90,'activadas'),
    (5,7,150,'desactivadas'),
    (6,5,110,'activadas'),
    (7,4,95,'activadas'),
    (8,6,130,'activadas'),
    (9,5,125,'desactivadas'),
    (10,5,120,'activadas');

    
    INSERT INTO Medicion (id_dispositivo, fecha_hora, valor, voltaje, corriente, potencia)
    VALUES
    (1, NOW(), 2.5, 120, 0.8, 96),
    (2, NOW(), 3.0, 118, 0.9, 106),
    (3, NOW(), 1.2, 110, 0.6, 66),
    (4, NOW(), 4.5, 122, 1.0, 122),
    (5, NOW(), 5.1, 125, 1.2, 150),
    (6, NOW(), 2.8, 119, 0.9, 107),
    (7, NOW(), 6.2, 130, 1.5, 195),
    (8, NOW(), 3.9, 115, 1.0, 115),
    (9, NOW(), 2.1, 117, 0.7, 82),
    (10, NOW(), 4.3, 121, 1.1, 133);

    
    INSERT INTO Alerta (id_medicion, id_nivel, mensaje, estado)
    VALUES
    (1,3,'Consumo alto detectado','pendiente'),
    (2,4,'Nivel crítico de consumo','enviada'),
    (3,1,'Consumo eficiente','resuelta'),
    (4,2,'Consumo medio estable','pendiente'),
    (5,6,'Sobrecarga detectada','enviada'),
    (6,3,'Consumo alto','resuelta'),
    (7,4,'Crítico, posible sobrecarga','pendiente'),
    (8,2,'Consumo moderado','pendiente'),
    (9,1,'Consumo óptimo','resuelta'),
    (10,5,'Eficiencia energética destacada','pendiente');

    
    INSERT INTO Recomendacion (id_usuario, id_dispositivo, descripcion, tipo)
    VALUES
    (1,1,'Apaga el dispositivo cuando no esté en uso','ahorro'),
    (2,2,'Verifica el voltaje del circuito','mantenimiento'),
    (3,3,'Usa el modo ahorro de energía','ahorro'),
    (4,4,'Limpia los sensores del medidor','mantenimiento'),
    (5,5,'Reduce el consumo en horas pico','uso'),
    (6,6,'Revisa el cableado','mantenimiento'),
    (7,7,'Programa el apagado automático','ahorro'),
    (8,8,'Mantén ventilado el espacio','uso'),
    (9,9,'Evita conectar múltiples equipos','uso'),
    (10,10,'Monitorea los valores de consumo semanal','ahorro');

   
    INSERT INTO HistorialConsumo (id_usuario, id_dispositivo, periodo, fecha_inicio, fecha_fin, consumo_total, promedio)
    VALUES
    (1,1,'mensual','2025-10-01','2025-10-31',120,4.0),
    (2,2,'mensual','2025-10-01','2025-10-31',130,4.3),
    (3,3,'mensual','2025-10-01','2025-10-31',110,3.7),
    (4,4,'mensual','2025-10-01','2025-10-31',95,3.2),
    (5,5,'mensual','2025-10-01','2025-10-31',140,4.6),
    (6,6,'mensual','2025-10-01','2025-10-31',115,3.8),
    (7,7,'mensual','2025-10-01','2025-10-31',155,5.0),
    (8,8,'mensual','2025-10-01','2025-10-31',128,4.2),
    (9,9,'mensual','2025-10-01','2025-10-31',102,3.4),
    (10,10,'mensual','2025-10-01','2025-10-31',118,3.9);

    
    INSERT INTO Notificacion (id_usuario, titulo, mensaje, tipo, leida)
    VALUES
    (1,'Alerta de Consumo','Tu consumo superó el límite diario','alerta',FALSE),
    (2,'Recomendación Energética','Activa el modo ahorro','recomendacion',FALSE),
    (3,'Informe de Consumo','Tu promedio semanal bajó un 10%','informativa',TRUE),
    (4,'Aviso Crítico','Se detectó un pico de energía','alerta',FALSE),
    (5,'Consejo de Ahorro','Desconecta los cargadores inactivos','recomendacion',TRUE),
    (6,'Reporte Mensual','Tu consumo mensual es de 115 kWh','informativa',TRUE),
    (7,'Notificación de Seguridad','Sobrecarga detectada en el medidor','alerta',FALSE),
    (8,'Recomendación','Optimiza tu consumo en horas valle','recomendacion',FALSE),
    (9,'Actualización','Nuevo modo oscuro disponible','informativa',TRUE),
    (10,'Consumo Óptimo','Has mantenido un consumo bajo','informativa',TRUE);

END $$

DELIMITER ;
