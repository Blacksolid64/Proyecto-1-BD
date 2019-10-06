create trigger crearPrimerEstadoDeCuenta
on CuentaAhorros
after insert
as begin
	set nocount on;
	insert into EstadoDeCuenta(idCuenta,fechaInicio,saldoInicial,saldoMinimo)
		select id as idCuenta,fechaCreacion as fechaInicio,saldo as saldoInicial,saldo as saldoMinimo  from inserted
end