-- =============================================
-- Author:		Esteban Cruz
-- Create date: 24/092019
-- Description:	Solicita los beneficiarios de determinada cuenta
-- =============================================
CREATE PROCEDURE [dbo].[SP_insertarBeneficiario] 
	@idCuenta int,
	@nombre nvarchar(50),
	@ced nvarchar(20),
	@email nvarchar(50),
	@parentesco int,
	@porcentajeBeneficio smallint,
	@telefono nvarchar(12),
	@fechaNac date
AS
BEGIN
	SET NOCOUNT ON;
	declare @porcentajes table(porcentaje int);
	insert into @porcentajes 
		select porcentajeBeneficio from Beneficiario where activo=1 and idUsuario=@idCuenta;
	if (select count(porcentaje) from @porcentajes) >= 3
		return -2
	else if 100 < ((select sum(porcentaje)from @porcentajes) + @porcentajeBeneficio)
		return -1
	else
	begin 
		declare @idPersona int = (select top 1 id from Persona where identificacion=@ced);
		if	@idPersona is null begin
			insert into 
				[Persona]	([nombre],[identificacion],[email],[telefono],[fechaNac])
				values		(@nombre,	@ced,	@email,	@telefono,@fechaNac);
			set @idPersona=scope_identity()
		end
		INSERT INTO 
			[Beneficiario]	([idPersona],[idUsuario], [idParentesco], [porcentajeBeneficio],[activo]) 
			VALUES			(@idPersona,@idCuenta, @parentesco, @porcentajeBeneficio, 1)
		return 0
	end
END