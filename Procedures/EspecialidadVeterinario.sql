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