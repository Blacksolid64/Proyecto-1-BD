USE [Base_de_Datos_1]
GO
/****** Object:  StoredProcedure [dbo].[SP_selectBeneficiarios]    Script Date: 25/9/2019 03:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/092019
-- Description:	Solicita los beneficiarios de determinada cuenta
-- =============================================
create PROCEDURE [dbo].[SP_selectBeneficiarios] 
	@idCuenta int = 0
AS
BEGIN
	SET NOCOUNT ON;

    SELECT id,nombre,ced,email,(select top 1 P.nombre from Parentesco P where P.id=idParentesco)as parentesco,idParentesco,porcentajeBeneficio,telefono,fechaNac from Beneficiario where idUsuario=@idCuenta and activo=1

END
