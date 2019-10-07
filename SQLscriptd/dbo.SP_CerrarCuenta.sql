-- =============================================
-- Author:		Esteban Cruz
-- Create date: 04/10/2019
-- Description:	Evalúa cuál es el último estado de cuenta asociado a una cuenta y si debe cerrarse el estado de cuenta
-- =============================================
CREATE PROCEDURE SP_getLastIdEstadoDeCuenta 
	@idCuenta int,@fechaOperacion date
AS
BEGIN
	DECLARE @idEstadoDeCuenta int,@fechaCierre date, @fechaInicio date,@idReal int
	select @idReal=id from CuentaAhorro where numCuenta=@idCuenta
	SELECT @idEstadoDeCuenta = max(e.id) 
	from EstadoDeCuenta e where e.idCuenta=@idReal
	select @fechaInicio=fechaInicio from EstadoDeCuenta where id=@idEstadoDeCuenta
	set @fechaCierre=(select top 1 fechaCreacion from CuentaAhorro where numCuenta=@idCuenta)
	declare @resta int
	set @resta=datediff(month,@fechaOperacion,@fechaInicio)
	if (day(@fechaOperacion)>=day(@fechaCierre) and @resta>0) or @resta>=2 begin
		exec @idEstadoDeCuenta=dbo.SP_CerrarCuenta @idEstadoDeCuenta,@fechaOperacion
	end
	RETURN @idEstadoDeCuenta

END