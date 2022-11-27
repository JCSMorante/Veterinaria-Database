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