SELECT 
    a.id_alerta,
    u.nombre AS usuario,
    d.nombre AS dispositivo,
    n.tipo AS nivel_consumo,
    a.mensaje,
    a.estado,
    a.fecha_alerta
FROM Alerta a
INNER JOIN Medicion m ON a.id_medicion = m.id_medicion
INNER JOIN Dispositivo d ON m.id_dispositivo = d.id_dispositivo
INNER JOIN Usuario u ON d.id_usuario = u.id_usuario
INNER JOIN NivelConsumo n ON a.id_nivel = n.id_nivel
WHERE a.estado IN ('pendiente', 'enviada')
ORDER BY a.fecha_alerta DESC;



SELECT 
    u.nombre AS usuario,
    c.limite_diario,
    c.limite_mensual,
    c.notificaciones,
    r.descripcion AS recomendacion,
    r.tipo AS tipo_recomendacion,
    DATE_FORMAT(r.fecha_generada, '%Y-%m-%d %H:%i') AS fecha_recomendacion
FROM Usuario u
LEFT JOIN ConfiguracionUsuario c ON u.id_usuario = c.id_usuario
LEFT JOIN Recomendacion r ON u.id_usuario = r.id_usuario
WHERE r.fecha_generada = (
    SELECT MAX(r2.fecha_generada)
    FROM Recomendacion r2
    WHERE r2.id_usuario = u.id_usuario
)
ORDER BY u.nombre ASC;
