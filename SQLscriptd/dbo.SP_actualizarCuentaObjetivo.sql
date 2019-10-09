CREATE PROCEDURE [dbo].[SP_actualizarCuentaObjetivo]
	@idCuenta int,
	@descripcion nvarchar(500)
as
	update CuentaObjetivo set descripcion=@descripcion where idCuenta=@idCuenta