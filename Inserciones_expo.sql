 USE sistema_registro_ptc_2024;
 
 --- insercion de adm ---
 
 INSERT INTO administradores (nombre_administrador, carnet_administrador, correo_administrador, clave_administrador)
VALUES 
('María García', '12345', 'maria.garcia@example.com', 'contraseña123'),
('Juan Martínez', '23456', 'juan.martinez@example.com', 'clave456'),
('Ana López', '34567', 'ana.lopez@example.com', 'password789'),
('Pedro Rodríguez', '45678', 'pedro.rodriguez@example.com', 'secreto123'),
('Laura Pérez', '56789', 'laura.perez@example.com', 'adminclave'),
('David Sánchez', '67890', 'david.sanchez@example.com', 'contraseña456'),
('Sofía Hernández', '78901', 'sofia.hernandez@example.com', 'clave789'),
('Daniel Gómez', '89012', 'daniel.gomez@example.com', 'password123'),
('Elena Ruiz', '90123', 'elena.ruiz@example.com', 'secreto456'),
('Carlos Torres', '01234', 'carlos.torres@example.com', 'admin123');

select * from administradores;

 --- insercion en nivel_grados ---
 
 INSERT INTO nivel_grados (nivel_grado)
VALUES
(7),
(8),
(9),
(1),
(2),
(3);

 --- insercion secciones ---
  INSERT INTO secciones (secciones)
VALUES
('A'),
('B'),
('C'),
('D'),
('E'),
('F');
 
 --- insercion de grupos ---
 
  INSERT INTO grupos (grupo)
VALUES
(1),
(2);
 
 
 --- insercion especialidades ---
 
 INSERT INTO especialidades (nombre_especialidad)
VALUES
('Automotriz'),
('Electromecanica'),
('Software'),
('Electronica'),
('Contaduria'),
('Arquitectura');

 --- insecion de profesores ---
 
 INSERT INTO profesores (nombre_profesor, carnet_profesor, correo_profesor, clave_profesor)
VALUES 
('Juan Pérez', 12345, 'juan.perez@example.com', 'contraseña123'),
('María García', 23456, 'maria.garcia@example.com', 'clave456'),
('Luis Martínez', 34567, 'luis.martinez@example.com', 'password789'),
('Ana López', 45678, 'ana.lopez@example.com', 'secreto123'),
('Pedro Rodríguez', 56789, 'pedro.rodriguez@example.com', 'adminclave'),
('Laura Pérez', 67890, 'laura.perez@example.com', 'contraseña456'),
('Carlos Sánchez', 78901, 'carlos.sanchez@example.com', 'clave789'),
('Sofía Hernández', 89012, 'sofia.hernandez@example.com', 'password123'),
('Daniel Gómez', 90123, 'daniel.gomez@example.com', 'secreto456'),
('Elena Ruiz', 01234, 'elena.ruiz@example.com', 'admin123');


--- insercion roles ---

INSERT INTO roles (rol_estudiante)
VALUES
('Coordinador'),
('Sub-Coordinador'),
('Secretario'),
('Tesorero'),
('Vocal');

--- insercion rubro_comercial ---

INSERT INTO rubro_comercial (tipo_rubro)
VALUES
('Educacion'),
('Tecnología'),
('Salud'),
('Ambiental'),
('Alimentos');

--- insercion tipo_propuestas ---

INSERT INTO tipo_propuestas (tipo_propuesta)
VALUES 
('Proyecto de Investigación'),
('Proyecto de Desarrollo'),
('Proyecto Social'),
('Proyecto Empresarial'),
('Proyecto de Innovación'),
('Proyecto Ambiental'),
('Proyecto Educativo'),
('Proyecto Cultural'),
('Proyecto Tecnológico'),
('Proyecto de Salud');

--- insercion estado_propuestas ---

INSERT INTO estado_propuestas (estado_propuesta)
VALUES 
('Aprobada'),
('En revisión'),
('Denegada');

--- insercion en cursos

INSERT INTO cursos (nombre_cursos)
VALUES 
('Matemáticas'),
('Ciencias'),
('Lenguaje'),
('Sociales'),
('Ingles'),
('Auto'),
('Emca'),
('Software'),
('Eca'),
('Conta'),
('Arqui');

 --- insercion alumnos ---
 
INSERT INTO alumnos (nombre_alumno, carnet_alumno, correo_alumno, clave_alumno) 
VALUES 
('Juan Pérez', 10001, 'juan@example.com', 'contraseña123'),
('María García', 10002, 'maria@example.com', 'clave456'),
('Luis Martínez', 10003, 'luis@example.com', 'password789'),
('Ana López', 10004, 'ana@example.com', 'secreto123'),
('Pedro Rodríguez', 10005, 'pedro@example.com', 'adminclave'),
('Laura Pérez', 10006, 'laura@example.com', 'contraseña456'),
('Carlos Sánchez', 10007, 'carlos@example.com', 'clave789'),
('Sofía Hernández', 10008, 'sofia@example.com', 'password123'),
('Daniel Gómez', 10009, 'daniel@example.com', 'secreto456'),
('Elena Ruiz', 10010, 'elena@example.com', 'admin123');

select * from alumnos
