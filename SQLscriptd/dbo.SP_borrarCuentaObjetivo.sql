CREATE PROCEDURE [dbo].[SP_borrarCuentaObjetivo]
	@idCuenta int
as
	update CuentaObjetivo set activo=0 where idCuenta=@idCuenta