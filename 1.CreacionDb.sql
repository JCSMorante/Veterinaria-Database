USE master
IF EXISTS(SELECT 1 FROM master.sys.databases 
          WHERE name='Veterinaria')
	DROP DATABASE Veterinaria
GO
CREATE  DATABASE Veterinaria
GO 
USE Veterinaria
GO
CREATE TABLE TipoDocumento (
 ID INT PRIMARY KEY NOT NULL IDENTITY,
 Nombre VARCHAR(50)
)
GO
CREATE TABLE Paciente(
 ID INT PRIMARY KEY NOT NULL IDENTITY,
 NombreMascota VARCHAR(50),
 Edad INT NOT NULL,
 Esterilizado BIT NOT NULL, 
 Hembra BIT NOT NULL, 
 Raza VARCHAR(50) NOT NULL,
 Especie VARCHAR(50) NOT NULL,
 Direccion VARCHAR(50) NOT NULL,
 Telefono VARCHAR(50) NOT NULL,
 TipoDocumentoId INT NOT NULL,
 Documento VARCHAR(50) NOT NULL,
 NombreDueño VARCHAR(50) NOT NULL,
 FOREIGN KEY (TipoDocumentoId) REFERENCES TipoDocumento(ID)
)
GO
CREATE TABLE Usuario(
  ID INT PRIMARY KEY NOT NULL IDENTITY,
  Nombre VARCHAR(50) NOT NULL,
  TipoDocumentoId INT NOT NULL, 
  Correo VARCHAR(50),
  Documento VARCHAR(50),
  FOREIGN KEY (TipoDocumentoId) REFERENCES TipoDocumento(ID)
)
GO
CREATE TABLE Veterinario(
 ID INT PRIMARY KEY NOT NULL IDENTITY,
 UsuarioId INT NOT NULL --
)
GO
CREATE TABLE Sede(
 ID INT PRIMARY KEY NOT NULL IDENTITY,
 Telefono VARCHAR(50) NOT NULL,
 Direccion VARCHAR(50) NOT NULL,
 Nombre VARCHAR(50) NOT NULL,
  
)
GO
CREATE TABLE ConsultaMedica (
 ID INT PRIMARY KEY NOT NULL IDENTITY,
 Fecha DATETIME NOT NULL, 
 Formula VARCHAR(500),
 Diagnostico VARCHAR(500),
 PacienteId INT NOT NULL,
 VeterinarioId INT NOT NULL,
 Descripcion VARCHAR(700),
 Motivo VARCHAR(550),
 SedeId INT NOT NULL,
 FOREIGN KEY (VeterinarioId) REFERENCES Veterinario(ID),
 FOREIGN KEY (SedeId) REFERENCES Sede(ID),
)
GO
CREATE TABLE SedeXVeterinario (
 ID INT PRIMARY KEY NOT NULL IDENTITY,
 VeterinarioId INT NOT NULL,
 FOREIGN KEY (VeterinarioId) REFERENCES Veterinario(ID),
)
GO 
CREATE TABLE Especialidades(
 ID INT PRIMARY KEY NOT NULL IDENTITY,
 Nombre VARCHAR(50)
)
GO
CREATE TABLE EspecialidadesXVeterinario (
	EspecialidadId INT NOT NULL,
	VeterinarioId INT NOT NULL,
	Estado BIT NOT NULL,
	FOREIGN KEY (VeterinarioId) REFERENCES Veterinario(ID),
	FOREIGN KEY (EspecialidadId) REFERENCES Especialidades(ID),
)
