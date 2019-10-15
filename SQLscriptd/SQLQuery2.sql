set nocount on;
delete Beneficiario
delete Movimiento
delete EstadoDeCuenta
delete CuentaAhorro
delete Cliente
delete Persona
DBCC CHECKIDENT ('[Beneficiario]', RESEED, 0);
DBCC CHECKIDENT ('[Movimiento]', RESEED, 0);
DBCC CHECKIDENT ('[EstadoDeCuenta]', RESEED, 0);
DBCC CHECKIDENT ('[Persona]', RESEED, 0);
DBCC CHECKIDENT ('[CuentaAhorro]', RESEED, 0);