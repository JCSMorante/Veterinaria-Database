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