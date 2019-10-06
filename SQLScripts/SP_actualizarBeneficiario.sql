USE [Base_de_Datos_1]
GO
/****** Object:  StoredProcedure [dbo].[SP_actualizarBeneficiario]    Script Date: 2/10/2019 06:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/09/2019
-- Description:	actualiza los datos de determinada beneficiario
-- =============================================
ALTER PROCEDURE [dbo].[SP_actualizarBeneficiario] 
	@id int,
	@nombre nvarchar(50),
	@ced nvarchar(20),
	@email nvarchar(50),
	@idParentesco int,
	@porcentajeBeneficio smallint,
	@telefono nvarchar(12),
	@fechaNac date,
	@idCuenta int
AS
BEGIN
	SET NOCOUNT ON;
	declare @suma int;
	set @suma = (	select	sum(porcentajeBeneficio) 
					from	Beneficiario 
					where	activo=1 and 
							idUsuario=@idCuenta and 
							id!=@id
				)
	if 100<(@suma+@porcentajeBeneficio)
		return -1
	else
	begin
		UPDATE [Persona] 
			SET [nombre] = @nombre, [identificacion] = @ced, [email] = @email, [telefono] = @telefono 
			WHERE [id] = @id
		update [Beneficiario] 
			set [idParentesco] = @idParentesco, [porcentajeBeneficio] = @porcentajeBeneficio, [fechaNac] = @fechaNac 
			where [id]=@id
		return 0
	end
END
