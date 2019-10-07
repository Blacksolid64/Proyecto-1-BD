-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/092019
-- Description:	Solicita los beneficiarios de determinada cuenta
-- =============================================
CREATE PROCEDURE [dbo].[SP_selectBeneficiarios] 
	@idCuenta int = 0
AS
BEGIN
	SET NOCOUNT ON;

    SELECT b.id as id, s.nombre, S.identificacion as ced,email,P.nombre as parentesco,B.idParentesco,B.porcentajeBeneficio,s.telefono,s.fechaNac 
	from Beneficiario B 
	inner join Parentesco P on P.id=B.idParentesco 
	inner join Persona S on B.idPersona=S.id
	where B.idUsuario=@idCuenta and B.activo=1

END