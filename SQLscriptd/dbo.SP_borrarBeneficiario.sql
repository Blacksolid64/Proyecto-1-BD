-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/092019
-- Description:	Solicita los beneficiarios de determinada cuenta
-- =============================================
create PROCEDURE [dbo].[SP_borrarBeneficiario] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [Beneficiario] SET [activo]=0, [fechaDesactivacion]=GETDATE() WHERE [id] = @id

END