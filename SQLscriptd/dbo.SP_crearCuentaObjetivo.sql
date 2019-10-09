CREATE PROCEDURE [dbo].[SP_crearCuentaObjetivo]
	@idCuenta int,
	@descripcion nvarchar(500),
	@cantMensual money
as
begin
	insert CuentaObjetivo(idCuenta,descripcion,cantMensual)values(@idCuenta,@descripcion,@cantMensual)
	RETURN 0
end