DROP DATABASE IF EXISTS sistema_registro_ptc_2024;

 

CREATE DATABASE sistema_registro_ptc_2024;

 

USE sistema_registro_ptc_2024;
 
CREATE TABLE administradores(
id_administrador VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
nombre_administrador VARCHAR(50) NOT NULL UNIQUE,
carnet_administrador VARCHAR(5) NOT NULL UNIQUE,
correo_administrador VARCHAR(40) NOT NULL UNIQUE,
clave_administrador  VARCHAR(30) NOT NULL
);
 
CREATE TABLE nivel_grados(
id_nivel_academico VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
nivel_grado INT NOT NULL UNIQUE CHECK (nivel_grado>0)
);
 
CREATE TABLE secciones(
id_seccion VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
secciones VARCHAR (1) NOT NULL UNIQUE 
);
 
CREATE TABLE grupos(
id_grupo VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
grupo INT NOT NULL UNIQUE CHECK (grupo>0)
);
 
 
CREATE TABLE especialidades(
id_especialidad VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
nombre_especialidad VARCHAR(50)
);
 
CREATE TABLE profesores(
id_profesores VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
nombre_profesor VARCHAR(50) NOT NULL UNIQUE,
carnet_profesor INT NOT NULL UNIQUE,
correo_profesor VARCHAR(50) NOT NULL UNIQUE,
clave_profesor VARCHAR (40) NOT NULL
);
 
 
CREATE TABLE roles(
id_rol VARCHAR(36) PRIMARY KEY DEFAULT  (UUID()),
rol_estudiante VARCHAR(25) NOT NULL UNIQUE
);
 
CREATE TABLE rubro_comercial(
id_rubro VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
tipo_rubro VARCHAR (50) NOT NULL
);
 
CREATE TABLE tipo_propuestas(
id_tipo_propuesta VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
tipo_propuesta  VARCHAR (50)
);
 
CREATE TABLE estado_propuestas(
id_estado_propuesta VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
estado_propuesta VARCHAR(15)
);
 
CREATE TABLE cursos(
id_curso VARCHAR (36) PRIMARY KEY DEFAULT (UUID()),
nombre_cursos VARCHAR (50) NOT NULL UNIQUE,
id_seccion VARCHAR(36),
id_especialidad VARCHAR(36),
id_grupo VARCHAR(36),
id_nivel_academico VARCHAR(36),
id_profesores VARCHAR(36),
CONSTRAINT fk_id_seccion_cursos
FOREIGN KEY (id_seccion) REFERENCES secciones(id_seccion),
CONSTRAINT fk_id_especialidad_cursos
FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad),
CONSTRAINT fk_id_grupo_cursos
FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo),
CONSTRAINT fk_id_nivel_academico_cursos
FOREIGN KEY (id_nivel_academico) REFERENCES nivel_grados(id_nivel_academico),
CONSTRAINT fk_id_profesor_cursos
FOREIGN KEY (id_profesores) REFERENCES profesores(id_profesores)
);
 
CREATE TABLE propuestas(
id_propuesta VARCHAR (36) PRIMARY KEY DEFAULT (UUID()),
nombre_empresa VARCHAR (100) NOT NULL UNIQUE,
nombre_contacto VARCHAR (100) NOT NULL UNIQUE,
cargo_contacto VARCHAR (50) NOT NULL,
telefono_contacto int not null unique,
correo_contacto VARCHAR(100) NOT NULL UNIQUE,
contenido_problematica VARCHAR (500) NOT NULL,
contenido_requerimiento VARCHAR (500) not null,
id_tipo_propuesta VARCHAR (36),
CONSTRAINT fk_id_tipo_propuesta_propuestas 
FOREIGN KEY (id_tipo_propuesta) REFERENCES tipo_propuestas(id_tipo_propuesta),
id_estado_propuesta VARCHAR (36),
CONSTRAINT fk_id_estado_propuesta_propuestas FOREIGN KEY (id_estado_propuesta) REFERENCES estado_propuestas(id_estado_propuesta)
);
 
 
 CREATE TABLE proyectos(
 id_proyecto VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
 url_proyecto VARCHAR(100) NOT NULL UNIQUE,
 nombre_proyecto VARCHAR(50) NOT NULL UNIQUE,
 estado_proyecto VARCHAR (40) NOT NULL,
 id_profesores VARCHAR(36),
 id_propuesta VARCHAR (36),
 CONSTRAINT fk_id_profesor_proyectos
 FOREIGN KEY (id_profesores)  REFERENCES profesores (id_profesores),
 CONSTRAINT fk_id_propuesta_proyectos
 FOREIGN KEY (id_propuesta)  REFERENCES propuestas (id_propuesta)
 );
 
 CREATE TABLE alumnos(
 id_alumno VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
 nombre_alumno VARCHAR (36) NOT NULL,
 carnet_alumno INT NOT NULL UNIQUE,
 correo_alumno VARCHAR (100) NOT NULL UNIQUE,
 clave_alumno VARCHAR (50) NOT NULL,
 id_curso VARCHAR(36),
 CONSTRAINT fk_id_curso_alumnos          
 FOREIGN KEY (id_curso)  REFERENCES cursos (id_curso)
 );
 
 CREATE TABLE equipo_expo(
 id_equipo_expo VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
 id_rol VARCHAR(36),
 CONSTRAINT fk_id_rol_equipo_expo
 FOREIGN KEY (id_rol)  REFERENCES roles (id_rol),
 id_proyecto VARCHAR(36),
 CONSTRAINT fk_id_proyecto_equipo_expo
 FOREIGN KEY (id_proyecto)  REFERENCES proyectos (id_proyecto),
 id_alumno VARCHAR(36),
 CONSTRAINT fk_id_alumno_equipo_expo
 FOREIGN KEY (id_alumno)  REFERENCES alumnos (id_alumno)
 );