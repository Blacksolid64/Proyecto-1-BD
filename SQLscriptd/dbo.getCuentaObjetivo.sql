CREATE PROCEDURE [dbo].[SP_getCuentaObjetivo]
	@idCuenta int
as
	select descripcion from CuentaObjetivo where idCuenta=@idCuenta and activo = 1
