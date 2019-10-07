USE [Base_de_Datos_1]
GO
/****** Object:  StoredProcedure [dbo].[getBeneficiarios]    Script Date: 24/9/2019 11:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/092019
-- Description:	Inserta una nueva fila en la tabla de beneficiarios si y solo si se cumplen las condiciones
-- =============================================
create PROCEDURE [dbo].[SP_insertarBeneficiario] 
	@idCuenta int,
	@nombre nvarchar,
	@ced nvarchar,
	@email nvarchar,
	@parentesco nvarchar,
	@porcentajeBeneficio smallint,
	@telefono nvarchar,
	@fechaNac date
AS
BEGIN
	SET NOCOUNT ON;
	declare @porcentajes table(porcentaje int);
	insert into @porcentajes 
		select porcentajeBeneficio from Beneficiario where activo=1 and idUsuario=@idCuenta;
	if 100 < ((select sum(porcentaje)from @porcentajes) + @porcentajeBeneficio)
		return -1
	else if (select count(porcentaje) from @porcentajes) >= 3
		return -2
	else
	begin 
		INSERT INTO [Beneficiario] ([idUsuario], [nombre], [ced], [email], [idParentesco], [porcentajeBeneficio], [telefono], [fechaNac],[activo]) VALUES (@idCuenta, @nombre, @ced, @email, @parentesco, @porcentajeBeneficio, @telefono, @fechaNac, 1)
		return 0
	end
END
