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