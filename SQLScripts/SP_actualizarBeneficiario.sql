USE [Base_de_Datos_1]
GO
/****** Object:  StoredProcedure [dbo].[SP_actualizarBeneficiario]    Script Date: 25/9/2019 03:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/092019
-- Description:	Actualiza la información de un cierto beneficiario determinado por @id
-- =============================================
create PROCEDURE [dbo].[SP_actualizarBeneficiario] 
	@id int,
	@nombre nvarchar,
	@ced nvarchar,
	@email nvarchar,
	@idParentesco int,
	@porcentajeBeneficio smallint,
	@telefono nvarchar,
	@fechaNac date
AS
BEGIN
	SET NOCOUNT ON;
	declare @idCuenta int;
	set @idCuenta = (select top 1 idUsuario from Beneficiario where id=@id)
	if 100<(select sum(porcentajeBeneficio) from Beneficiario where activo=1 and id=@idCuenta)+@porcentajeBeneficio
		return -1
	UPDATE [Beneficiario] SET [nombre] = @nombre, [ced] = @ced, [email] = @email, [idParentesco] = @idParentesco, [porcentajeBeneficio] = @porcentajeBeneficio, [telefono] = @telefono, [fechaNac] = @fechaNac WHERE [id] = @id
	return 0
END
