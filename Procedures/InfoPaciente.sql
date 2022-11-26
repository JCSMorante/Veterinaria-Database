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
	,TD.Nombre TipoDocumento
	,Documento
	,NombreDueño FROM Paciente P
	INNER JOIN TipoDocumento TD ON P.ID = TD.ID
	WHERE TD.ID = @TipoDocumento AND Documento = @Documento
END