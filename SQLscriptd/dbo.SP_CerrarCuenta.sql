CREATE procedure [dbo].SP_CerrarCuenta
	@idEstadoDeCuenta int,
	@fechaCierre date
AS
BEGIN
	declare @saldoMinimoEDC money,@idCuenta int,@multaSM int,@saldoMinimoTC money,@idTipoCuenta int,@fechaInicio date,@saldoFinal money,@QRCH int,@Max_QRCH int,@multaExcesoRCH money,@montoCargosXSM money
	select @saldoMinimoEDC=saldoMinimo,@idCuenta=idCuenta,@fechaInicio=fechaInicio,@QRCH=QRCH from EstadoDeCuenta where id=@idEstadoDeCuenta
	select @idTipoCuenta=idTipoCuenta from CuentaAhorro where id=@idCuenta
	select @saldoMinimoTC=t.saldoMinimo,@multaSM=t.multaSaldoMinimo,@Max_QRCH=t.maxRetiroEnCajeros, @montoCargosXSM=t.montoMensual from TipoCuenta t where t.id=@idTipoCuenta
	if @saldoMinimoEDC<@saldoMinimoTC 
		exec dbo.SP_procesarMovimiento @multaSM,@idCuenta,@fechaCierre,'Multa por incumplimiento de saldo mínimo',11,@idEstadoDeCuenta
	if @QRCH>@Max_QRCH
		exec dbo.SP_procesarMovimiento @multaExcesoRCH,@idCuenta,@fechaCierre,'Multa por exceso de retiros en cajero humano',5,@idEstadoDeCuenta
	exec dbo.SP_procesarMovimiento @montoCargosXSM,@idCuenta,@fechaCierre,'Cargos por servicio mensual',6,@idEstadoDeCuenta
	set @saldoFinal=(select top 1 saldo from CuentaAhorro where id=@idCuenta);
	set @fechaInicio=DATEADD(month,1,@fechaInicio)
	insert into EstadoDeCuenta ([fechaInicio],[saldoInicial],[saldoMinimo],[idCuenta])
				values		   (@fechaInicio,@saldoFinal,@saldoFinal,@idCuenta);
	update EstadoDeCuenta set fechaFinal=@fechaInicio,saldoFinal=@saldoFinal where id=@idEstadoDeCuenta			
	return scope_identity()
END