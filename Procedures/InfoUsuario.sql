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