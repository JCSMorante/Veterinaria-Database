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
	IF @@ROWCOUNT = 0
		THROW 50005, N'El doctor esta ocupado', 1;

	SELECT 1 FROM ConsultaMedica WHERE PacienteId = @PacienteId AND Fecha = @Fecha
	IF @@ROWCOUNT = 0
		THROW 50005, N'El paciente esta ocupado', 1;

	INSERT INTO ConsultaMedica VALUES(@Fecha, NULL, NULL, @PacienteId, @VeterinarioId, NULL, NULL, @SedeId)
END
