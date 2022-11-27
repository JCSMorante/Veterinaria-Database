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