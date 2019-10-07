﻿-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/09/2019
-- Description:	actualiza los datos de determinada beneficiario
-- =============================================
CREATE PROCEDURE [dbo].[SP_actualizarBeneficiario] 
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
			SET [nombre] = @nombre, [identificacion] = @ced, [email] = @email, [telefono] = @telefono, [fechaNac] = @fechaNac 
			WHERE [id] = @id
		update [Beneficiario] 
			set [idParentesco] = @idParentesco, [porcentajeBeneficio] = @porcentajeBeneficio
			where [id]=@id
		return 0
	end
END