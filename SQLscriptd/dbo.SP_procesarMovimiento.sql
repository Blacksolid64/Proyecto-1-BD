CREATE PROCEDURE [dbo].[SP_procesarMovimiento]
		@monto money,
		@idCuenta int,
		@fechaHora datetime,
		@descripcion nvarchar(200),
		@idTipoMovimiento int,
		@idEstadoCuenta int
AS
begin
	update CuentaAhorro set saldo+=@monto where id=@idCuenta
	declare @nuevoSaldo money=(select top 1 c.saldo from CuentaAhorro c where c.id=@idCuenta)
	insert into 
		Movimiento(descripcion,fechaHora,idCuenta,idEstadoDeCuenta,idTipoMovimiento,monto,nuevoSaldo)
	values (@descripcion,@fechaHora,@idCuenta,@idEstadoCuenta,@idTipoMovimiento,@monto,@nuevoSaldo)
	update	EstadoDeCuenta 
	set	QRCH+=(case when @idTipoMovimiento=(select top 1 id 
											from TipoMovimiento 
											where nombre='retiroCH')
					then 1 
					else 0 
				end),
		saldoMinimo=(	case when saldoMinimo<@nuevoSaldo 
							then saldoMinimo 
							else @nuevoSaldo 
						end) 
	where id=@idEstadoCuenta
	--if @idTipoMovimiento=9 begin
		--here comes the deposit to the objective account
	--end
	RETURN 0
end