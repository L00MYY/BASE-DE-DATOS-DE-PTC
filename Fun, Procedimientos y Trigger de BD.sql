
USE sistema_registro_ptc_2024;

DELIMITER //

-- Creación de un trigger llamado 'crear_proyecto_cuando_propuesta_aceptada'
CREATE TRIGGER crear_proyecto_cuando_propuesta_aceptada
AFTER UPDATE ON propuestas -- Se dispara después de una actualización en la tabla 'propuestas'
FOR EACH ROW -- El trigger actúa sobre cada fila que se actualiza
BEGIN
    -- Revisamos si el nuevo estado de la propuesta ha sido cambiado a 'Aceptada'
    IF NEW.id_estado_propuesta = (SELECT id_estado_propuesta FROM estado_propuestas WHERE estado_propuesta = 'Aceptada') THEN
        -- Insertar un nuevo registro en la tabla 'proyectos'
        INSERT INTO proyectos (
            id_proyecto, 
            url_proyecto, 
            nombre_proyecto, 
            estado_proyecto, 
            id_profesores, 
            id_propuesta
        )
        VALUES (
            UUID(), -- Generar un nuevo UUID para el ID del proyecto
            'http://nuevoproyecto.com', -- URL ejemplo del proyecto
            CONCAT('Proyecto para ', NEW.nombre_empresa), -- Nombre del proyecto con el nombre de la empresa
            'En Progreso', -- Estado inicial del proyecto
            (SELECT id_profesores FROM profesores LIMIT 1), -- Asignar un profesor de forma arbitraria (primer profesor en la tabla) ( por el momento es asi) ya que tendra id profesor si un profesor crea el proyecto
            NEW.id_propuesta -- Vincular el ID de la propuesta actualizada
        );
    END IF;
END //

DELIMITER ;



-- Función: Esta función devuelve el número total de alumnos inscritos en un curso específico.
DELIMITER //
CREATE FUNCTION total_alumnos_curso(id_curso_input VARCHAR(36)) RETURNS INT
BEGIN
    DECLARE total_alumnos INT;
    SELECT COUNT(*) INTO total_alumnos FROM alumnos WHERE id_curso = id_curso_input;
    RETURN total_alumnos;
END //
DELIMITER ;

-- Procedimiento almacenado: Este procedimiento almacenado actualiza el estado de un proyecto dado su ID.
DELIMITER //
CREATE PROCEDURE actualizar_estado_proyecto(IN proyecto_id VARCHAR(36), IN nuevo_estado VARCHAR(40))
BEGIN
    UPDATE proyectos SET estado_proyecto = nuevo_estado WHERE id_proyecto = proyecto_id;
END //
DELIMITER ;