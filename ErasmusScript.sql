-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2020-02-02 21:13:41 GMT
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012

create database Erasmus
go

use Erasmus
go

CREATE TABLE asignaturas (
    id         VARCHAR(30) NOT NULL,
    nombre     VARCHAR(30),
    creditos   VARCHAR(30)
)

go

ALTER TABLE Asignaturas ADD constraint asignaturas_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
	  go

CREATE TABLE beca (
    id            VARCHAR(30) NOT NULL,
    nombre        VARCHAR(30),
    periodo       VARCHAR(30),
    cuantia       VARCHAR(30),
    metodo_pago   VARCHAR(30)
)

go

ALTER TABLE Beca ADD constraint beca_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
	  go

CREATE TABLE estudiante (
    id               VARCHAR(30) NOT NULL,
    nombre           VARCHAR(30),
    apellido         VARCHAR(30),
    "DNI/NIE"        VARCHAR(30),
    nivel_estudios   VARCHAR(30),
    email            VARCHAR(30),
    iban             VARCHAR(30),
    universidad_id   VARCHAR(30) NOT NULL,
    beca_id          VARCHAR(30) NOT NULL
)

go

ALTER TABLE Estudiante ADD constraint estudiante_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
	  go

CREATE TABLE estudiante_asignatura (
    estudiante_id    VARCHAR(30) NOT NULL,
    asignaturas_id   VARCHAR(30) NOT NULL
)

go

ALTER TABLE Estudiante_Asignatura ADD constraint estudiante_asignatura_pk PRIMARY KEY CLUSTERED (Estudiante_Id, Asignaturas_Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
	 go

CREATE TABLE estudio (
    id            VARCHAR(30) NOT NULL,
    nombre        VARCHAR(30),
    descripcion   VARCHAR(30)
)

go

ALTER TABLE Estudio ADD constraint estudio_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
	  go

CREATE TABLE pais (
    id       VARCHAR(30) NOT NULL,
    nombre   VARCHAR(30)
)

go

ALTER TABLE Pais ADD constraint pais_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
	 go

CREATE TABLE trabajo (
    id            VARCHAR(30) NOT NULL,
    nombre        VARCHAR(30),
    descripcion   VARCHAR(30)
)

go

ALTER TABLE Trabajo ADD constraint trabajo_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
	  go

CREATE TABLE tribunal (
    id       VARCHAR(30) NOT NULL,
    nombre   VARCHAR(30)
)

go

ALTER TABLE Tribunal ADD constraint tribunal_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
	  go

CREATE TABLE tribunal_beca (
    tribunal_id   VARCHAR(30) NOT NULL,
    beca_id       VARCHAR(30) NOT NULL
)

go

ALTER TABLE Tribunal_Beca ADD constraint tribunal_beca_pk PRIMARY KEY CLUSTERED (Tribunal_Id, Beca_Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) 
	 go

CREATE TABLE universidad (
    id          VARCHAR(30) NOT NULL,
    nombre      VARCHAR(30),
    direccion   VARCHAR(30),
    telefono    VARCHAR(30),
    email       VARCHAR(30),
    pais_id     VARCHAR(30) NOT NULL
)

go

ALTER TABLE Universidad ADD constraint universidad_pk PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
	  go

ALTER TABLE Estudiante_Asignatura
    ADD CONSTRAINT estudiante_asignatura_asignaturas_fk FOREIGN KEY ( asignaturas_id )
        REFERENCES asignaturas ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
	go

ALTER TABLE Estudiante_Asignatura
    ADD CONSTRAINT estudiante_asignatura_estudiante_fk FOREIGN KEY ( estudiante_id )
        REFERENCES estudiante ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
	go

ALTER TABLE Estudiante
    ADD CONSTRAINT estudiante_beca_fk FOREIGN KEY ( beca_id )
        REFERENCES beca ( id )
ON DELETE NO ACTION 
    ON UPDATE no action
	 go

ALTER TABLE Estudiante
    ADD CONSTRAINT estudiante_universidad_fk FOREIGN KEY ( universidad_id )
        REFERENCES universidad ( id )
ON DELETE NO ACTION 
    ON UPDATE no action
	 go

ALTER TABLE Estudio
    ADD CONSTRAINT estudio_beca_fk FOREIGN KEY ( id )
        REFERENCES beca ( id )
ON DELETE NO ACTION 
    ON UPDATE no action
	 go

ALTER TABLE Trabajo
    ADD CONSTRAINT trabajo_beca_fk FOREIGN KEY ( id )
        REFERENCES beca ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
	go

ALTER TABLE Tribunal_Beca
    ADD CONSTRAINT tribunal_beca_beca_fk FOREIGN KEY ( beca_id )
        REFERENCES beca ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
	go

ALTER TABLE Tribunal_Beca
    ADD CONSTRAINT tribunal_beca_tribunal_fk FOREIGN KEY ( tribunal_id )
        REFERENCES tribunal ( id )
ON DELETE NO ACTION 
    ON UPDATE no action
	 go

ALTER TABLE Universidad
    ADD CONSTRAINT universidad_pais_fk FOREIGN KEY ( pais_id )
        REFERENCES pais ( id )
ON DELETE NO ACTION 
    ON UPDATE no action 
	go



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
