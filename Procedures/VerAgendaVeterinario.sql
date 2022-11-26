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