USE master
IF EXISTS(SELECT 1 FROM master.sys.databases 
          WHERE name='Veterinaria')
	DROP DATABASE Veterinaria
GO
CREATE  DATABASE Veterinaria
GO 
USE Veterinaria
GO
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
GO
INSERT INTO TipoDocumento VALUES('Cedula De Ciudadania')
INSERT INTO TipoDocumento VALUES('Cedula Extranjera')
INSERT INTO TipoDocumento VALUES('Tarjeta de identidad')

INSERT INTO Especialidades VALUES('Anesteiologo')
INSERT INTO Especialidades VALUES('Radiologo')
INSERT INTO Especialidades VALUES('Cardiologo')
INSERT INTO Especialidades VALUES('Cirujano')
INSERT INTO Especialidades VALUES('General')

INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 1')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 2')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 3')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 4')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 5')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 6')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 7')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 8')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 9')
INSERT INTO Sede VALUES('3202884882', 'Calle Falsa 123', 'Sede 10')

INSERT INTO Usuario VALUES('Pepe Vaticano', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Carlos Nombe', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Primiciero Calvo', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Martin Elias', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Brayan Vladimir', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Maritza Avenllaneda', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Marcela Catalan', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Alcocer Segundo', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Alvarado Abudinen', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Yeraldine Abrias', 1, 'Correo@correo.com', '101020201')
INSERT INTO Usuario VALUES('Karol Gomez', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Vicente Ferrari', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Ariel Sirenosa', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Reynel Leon', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Marco Polo', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Simon Bolibia', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Marta Santa', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Fry Andres', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Joe Calderon', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Thomas Suarez', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Amador Romero', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Marcarlos Gonzales', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Fortunato Montes', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Luz Marina', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Angel Jose', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Gregorio Morales', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Miranda Martinez', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))
INSERT INTO Usuario VALUES('Horacio Aleman', 1, 'Correo@correo.com', CONVERT(varchar(50), Round(RAND() * 700004, 0)))

INSERT INTO Veterinario VALUES(1)
INSERT INTO Veterinario VALUES(2)
INSERT INTO Veterinario VALUES(3)
INSERT INTO Veterinario VALUES(4)
INSERT INTO Veterinario VALUES(5)
INSERT INTO Veterinario VALUES(6)
INSERT INTO Veterinario VALUES(7)
INSERT INTO Veterinario VALUES(8)
INSERT INTO Veterinario VALUES(9)
INSERT INTO Veterinario VALUES(10)
INSERT INTO Veterinario VALUES(11)
INSERT INTO Veterinario VALUES(12)
INSERT INTO Veterinario VALUES(13)
INSERT INTO Veterinario VALUES(14)
INSERT INTO Veterinario VALUES(15)
INSERT INTO Veterinario VALUES(16)


INSERT EspecialidadesXVeterinario VALUES(1,1,1)
INSERT EspecialidadesXVeterinario VALUES(2,1,1)
INSERT EspecialidadesXVeterinario VALUES(1,2,1)
INSERT EspecialidadesXVeterinario VALUES(2,3,1)
INSERT EspecialidadesXVeterinario VALUES(5,3,1)
INSERT EspecialidadesXVeterinario VALUES(4,4,1)
INSERT EspecialidadesXVeterinario VALUES(1,5,1)
INSERT EspecialidadesXVeterinario VALUES(2,5,1)
INSERT EspecialidadesXVeterinario VALUES(3,6,1)
INSERT EspecialidadesXVeterinario VALUES(4,7,1)
INSERT EspecialidadesXVeterinario VALUES(5,8,1)
INSERT EspecialidadesXVeterinario VALUES(5,9,1)
INSERT EspecialidadesXVeterinario VALUES(4,8,1)
INSERT EspecialidadesXVeterinario VALUES(3,9,1)
INSERT EspecialidadesXVeterinario VALUES(2,10,1)
INSERT EspecialidadesXVeterinario VALUES(1,11,1)
INSERT EspecialidadesXVeterinario VALUES(5,11,1)
INSERT EspecialidadesXVeterinario VALUES(3,12,1)
INSERT EspecialidadesXVeterinario VALUES(4,13,1)
INSERT EspecialidadesXVeterinario VALUES(5,12,1)
INSERT EspecialidadesXVeterinario VALUES(5,14,1)
INSERT EspecialidadesXVeterinario VALUES(4,15,1)
INSERT EspecialidadesXVeterinario VALUES(3,16,1)
INSERT EspecialidadesXVeterinario VALUES(2,15,1)

GO

IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'EspecialidadVeterinario'
	and s.name = 'dbo'
)
	DROP PROCEDURE EspecialidadVeterinario
GO
CREATE PROCEDURE EspecialidadVeterinario @TipoDocumento INT, @Documento VARCHAR(50)
AS 
BEGIN 
	SELECT E.Nombre Especialidades FROM Usuario U
	INNER JOIN Veterinario V ON U.ID = V.UsuarioId
	INNER JOIN EspecialidadesXVeterinario EXV ON V.ID = EXV.VeterinarioId
	INNER JOIN Especialidades E ON E.ID = EXV.EspecialidadId
	WHERE U.Documento = @Documento AND U.TipoDocumentoId = @TipoDocumento
END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'InfoPaciente'
	and s.name = 'dbo'
)
	DROP PROCEDURE InfoPaciente
GO
CREATE PROCEDURE InfoPaciente @TipoDocumento INT, @Documento VARCHAR(50)
AS 
BEGIN 
	SELECT NombreMascota
	,Edad
	,Esterilizado
	,Hembra
	,Raza
	,Especie
	,Direccion
	,Telefono
	,TD.Id TipoDocumentoId
	,Documento
	,NombreDueño FROM Paciente P
	INNER JOIN TipoDocumento TD ON P.ID = TD.ID
	WHERE TD.ID = @TipoDocumento AND Documento = @Documento
END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'InfoUsuario'
	and s.name = 'dbo'
)
	DROP PROCEDURE InfoUsuario
GO
CREATE PROCEDURE InfoUsuario @TipoDocumento INT, @Documento VARCHAR(50)
AS 
BEGIN 
	SELECT U.Nombre,TD.Nombre TipoDocumento ,Correo,Documento FROM Usuario U
	INNER JOIN TipoDocumento TD ON U.TipoDocumentoId = TD.ID
	WHERE U.Documento = @Documento AND TD.ID = @TipoDocumento
END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'InfoVeterinario'
	and s.name = 'dbo'
)
	DROP PROCEDURE InfoVeterinario
GO
CREATE PROCEDURE InfoVeterinario @TipoDocumento INT, @Documento VARCHAR(50)
AS 
BEGIN 
	SELECT U.Nombre,TD.ID TipoDocumento ,Correo,Documento FROM Usuario U
	INNER JOIN TipoDocumento TD ON U.TipoDocumentoId = TD.ID
	INNER JOIN Veterinario V ON U.ID = V.UsuarioId
	WHERE U.Documento = @Documento AND TD.ID = @TipoDocumento
END
GO
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'RegistroPaciente'
	and s.name = 'dbo'
)
	DROP PROCEDURE RegistroPaciente
GO
CREATE PROCEDURE RegistroPaciente 
 @NombreMascota VARCHAR(50)
,@Edad INT
,@Esterilizado BIT
,@Hembra BIT
,@Raza VARCHAR(50)
,@Especie VARCHAR(50)
,@Direccion VARCHAR(50)
,@Telefono VARCHAR(50)
,@TipoDocumento INT
,@Documento VARCHAR(50)
,@NombreDueño VARCHAR(50)
AS 
BEGIN 
	if EXISTS(SELECT 1 FROM Paciente WHERE Documento = @Documento AND TipoDocumentoId = @TipoDocumento)
		UPDATE Paciente SET
			NombreMascota		= @NombreMascota,
			Edad				= @Edad,
			Esterilizado		= @Esterilizado,
			Hembra				= @Hembra,
			Raza				= @Raza,
			Especie				= @Especie,
			Direccion			= @Direccion,
			Telefono			= @Telefono,
			TipoDocumentoId		= @TipoDocumento,
			Documento			= @Documento,
			NombreDueño         = @NombreDueño
		 WHERE Documento = @Documento AND TipoDocumentoId = @TipoDocumento	
	ELSE
		INSERT INTO Paciente VALUES(@NombreMascota, @Edad, @Esterilizado, @Hembra, @Raza, @Especie, @Direccion, @Telefono, @TipoDocumento, @Documento, @NombreDueño)
END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'AgendarCita'
	and s.name = 'dbo'
)
	DROP PROCEDURE AgendarCita
GO
CREATE PROCEDURE AgendarCita @VeterinarioId INT, @PacienteId INT, @Fecha DATETIME, @SedeId INT
AS 
BEGIN 
	SELECT 1 FROM ConsultaMedica WHERE VeterinarioId = @VeterinarioId AND Fecha = @Fecha
	IF @@ROWCOUNT > 0
		THROW 50005, N'El doctor esta ocupado', 1;

	SELECT 1 FROM ConsultaMedica WHERE PacienteId = @PacienteId AND Fecha = @Fecha
	IF @@ROWCOUNT > 0
		THROW 50005, N'El paciente esta ocupado', 1;

	IF @Fecha < GETDATE()
		THROW 50005, N'Fecha invalida', 1;
		
	INSERT INTO ConsultaMedica VALUES(@Fecha, NULL, NULL, @PacienteId, @VeterinarioId, NULL, NULL, @SedeId)
END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'VerAgendaPaciente'
	and s.name = 'dbo'
)
	DROP PROCEDURE VerAgendaPaciente
GO
CREATE PROCEDURE VerAgendaPaciente @PacienteId INT, @Fecha DATETIME
AS 
BEGIN 
	SELECT U.Nombre Veterinario, P.NombreDueño NombreDueño, P.NombreMascota Mascota, cm.Fecha FROM ConsultaMedica cm 
	INNER JOIN Veterinario vet on cm.VeterinarioId = vet.ID
	INNER JOIN Usuario U ON U.ID = vet.UsuarioId
	INNER JOIN Paciente P ON P.ID = cm.PacienteId
	WHERE P.ID = @PacienteId and cm.Fecha >= Fecha

END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'VerAgendaVeterinario'
	and s.name = 'dbo'
)
	DROP PROCEDURE VerAgendaVeterinario
GO
CREATE PROCEDURE VerAgendaVeterinario @VeterinarioId INT, @Fecha DATETIME
AS 
BEGIN 
	SELECT U.Nombre Veterinario, P.NombreDueño NombreDueño, P.NombreMascota Mascota, cm.Fecha FROM ConsultaMedica cm 
	INNER JOIN Veterinario vet on cm.VeterinarioId = vet.ID
	INNER JOIN Usuario U ON U.ID = vet.UsuarioId
	INNER JOIN Paciente P ON P.ID = cm.PacienteId
	WHERE vet.ID = @VeterinarioId and cm.Fecha >= Fecha

END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'AgregarHistoriaClinica'
	and s.name = 'dbo'
)
	DROP PROCEDURE AgregarHistoriaClinica
GO
CREATE PROCEDURE AgregarHistoriaClinica @ConsultaMedicaId INT, @Formula VARCHAR(500)
,@Diagnostico  VARCHAR(500)
,@Descripcion  VARCHAR(700)
,@Motivo  VARCHAR(550)
AS 
BEGIN 
	UPDATE ConsultaMedica SET 	Formula = @Formula	,Diagnostico = @Diagnostico	,Descripcion = @Descripcion	,Motivo = @Motivo
	WHERE ID = @ConsultaMedicaId
END
GO
IF  EXISTS (
	SELECT * FROM sys.objects o
	INNER JOIN sys.schemas s ON (s.schema_id = o.schema_id)
	WHERE o.name = 'VerHitoriaClinica'
	and s.name = 'dbo'
)
	DROP PROCEDURE VerHitoriaClinica
GO
CREATE PROCEDURE VerHitoriaClinica @PacienteId INT
AS 
BEGIN 
	SELECT Fecha ,Formula ,Diagnostico ,VeterinarioId ,Descripcion ,Motivo FROM ConsultaMedica WHERE PacienteId = @PacienteId

END
GO 