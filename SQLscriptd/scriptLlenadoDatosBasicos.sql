declare @infoTipoMov xml='<SistemaBanc>

	<TipoMov>
		<nombre>deposito</nombre>
		<tipoDC>C</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>retiroCH</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>retiroCA</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>compras</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>multExcCH</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>cargosSM</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>interesesM</nombre>
		<tipoDC>C</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>montoASubObj</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>rendSubObj</nombre>
		<tipoDC>C</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>intAcuSubObj</nombre>
		<tipoDC>C</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>multSaldMin</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>debAjuste</nombre>
		<tipoDC>D</tipoDC>
	</TipoMov>
	
	<TipoMov>
		<nombre>credAjuste</nombre>
		<tipoDC>C</tipoDC>
	</TipoMov>
	
	<!--gastos y activos se aumentan en el debito y se disminuyen en el crédito-->
	<!--en otros se dismunuyen en el debito y se aumentan en el crédito-->
	
</SistemaBanc>'
declare	@infoTipoCuenta xml='<SistemaBanc>

	<TipoCuentaAhorro>
		<nombre>Pobre</nombre>
		<saldoMinimo>1000</saldoMinimo>
		<multaSaldoMinimo>500</multaSaldoMinimo>
		<cargosPorServicioMensual>100</cargosPorServicioMensual>
		<retiros>7</retiros>
		<simMoneda>¢</simMoneda>
		<maxRetirosCajeroHumano>3</maxRetirosCajeroHumano>
		<multaIncumpleMaxRetirosCajeroHumano>300</multaIncumpleMaxRetirosCajeroHumano>
		<tasaIntereses>10</tasaIntereses>
	</TipoCuentaAhorro>
	
	<TipoCuentaAhorro>
		<nombre>Clase Media</nombre>
		<saldoMinimo>5000</saldoMinimo>
		<multaSaldoMinimo>1000</multaSaldoMinimo>
		<cargosPorServicioMensual>200</cargosPorServicioMensual>
		<retiros>9</retiros>
		<simMoneda>¢</simMoneda>
		<maxRetirosCajeroHumano>5</maxRetirosCajeroHumano>
		<multaIncumpleMaxRetirosCajeroHumano>500</multaIncumpleMaxRetirosCajeroHumano>
		<tasaIntereses>15</tasaIntereses>
	</TipoCuentaAhorro>
	
	<TipoCuentaAhorro>
		<nombre>Clase Opulenta</nombre>
		<saldoMinimo>7000</saldoMinimo>
		<multaSaldoMinimo>1300</multaSaldoMinimo>
		<cargosPorServicioMensual>250</cargosPorServicioMensual>
		<retiros>12</retiros>
		<simMoneda>$</simMoneda>
		<maxRetirosCajeroHumano>5</maxRetirosCajeroHumano>
		<multaIncumpleMaxRetirosCajeroHumano>500</multaIncumpleMaxRetirosCajeroHumano>
		<tasaIntereses>20</tasaIntereses>
	</TipoCuentaAhorro>

</SistemaBanc>'
declare	@infoMoneda xml='<SistemaBanc>

	<Moneda>
		<nombre>Dolares</nombre>
		<simbolo>$</simbolo>
	</Moneda>
	
	<Moneda>
		<nombre>Colones</nombre>
		<simbolo>¢</simbolo>
	</Moneda>

</SistemaBanc>'
declare	@infoIdentificacion xml= '<SistemaBanc>

	<TipoID>
		<nombre>Cedula Nacional</nombre>
	</TipoID>
	
	<TipoID>
		<nombre>Pasaporte</nombre>
	</TipoID>
	
	<TipoID>
		<nombre>Cedula Extranjera</nombre>
	</TipoID>

</SistemaBanc>'
declare @infoParentesco xml='<SistemaBanc>

	<Parentesco>
		<nombre>P</nombre>
		<detalle>Padre</detalle>
	</Parentesco>
	
	<Parentesco>
		<nombre>M</nombre>
		<detalle>Madre</detalle>
	</Parentesco>
	
	<Parentesco>
		<nombre>C</nombre>
		<detalle>Conyuge</detalle>
	</Parentesco>
	
	<Parentesco>
		<nombre>B</nombre>
		<detalle>Hermano</detalle>
	</Parentesco>
	
	<Parentesco>
		<nombre>S</nombre>
		<detalle>Hermana</detalle>
	</Parentesco>
	
	<Parentesco>
		<nombre>H</nombre>
		<detalle>Hijo</detalle>
	</Parentesco>
	
	<Parentesco>
		<nombre>D</nombre>
		<detalle>Hija</detalle>
	</Parentesco>
	
</SistemaBanc>'

insert	TipoMovimiento (nombre)
select	tablaTemp.value('(text())[1]','nvarchar(50)') as nombre
from	@infoTipoMov.nodes('(SistemaBanc/TipoMov/nombre)') as TEMPTABLE(tablaTemp) 

insert	Moneda(nombre)
select	tablaTemp.value('(text())[1]','nvarchar(50)') as nombre
from	@infoTipoMov.nodes('(SistemaBanc/Moneda/nombre)') as TEMPTABLE(tablaTemp) 

insert	TipoIdentificacion(nombre)
select	tablaTemp.value('(nombre/text())[1]','nvarchar(50)') as nombre
from	@infoMoneda.nodes('(SistemaBanc/Moneda)') as TEMPTABLE(tablaTemp) 

insert	TipoIdentificacion(nombre)
select	tablaTemp.value('(nombre/text())[1]','nvarchar(50)') as nombre
from	@infoIdentificacion.nodes('(SistemaBanc/TipoID)') as TEMPTABLE(tablaTemp) 

insert	Parentesco(nombre)
select	tablaTemp.value('(nombre/text())[1]','nvarchar(50)') as nombre
from	@infoParentesco.nodes('(SistemaBanc/Parentesco)') as TEMPTABLE(tablaTemp) 

insert	TipoCuenta (cantRetiros,idMoneda,maxRetiroEnCajeros,montoMensual,multaSaldoMinimo,nombre,saldoMinimo,tasaInteres,multaMaxRetiros)
select	tT.value('(retiros/text())[1]','int')							as	cantRetiros,
		(
		select	id 
		from	Moneda 
		where	nombre=tT.value('(simMoneda/text())[1]','nvarchar(2)')
		)																as	idMoneda,
		tT.value('(maxCantRetirosCajeroHumano/text())[1]','int')		as	maxRetiroEnCajeros,
		tT.value('(cargosPorServicioMensual/text())[1]','money')		as	montoMensual,
		tT.value('(multaSaldoMinimo/text())[1]','money')				as	multaSaldoMinimo,
		tT.value('(nombre/text())[1]','nvarchar(50)')					as  nombre,
		tT.value('(saldoMinimo/text())[1]','money')						as  saldoMinimo,
		tT.value('(tasaIntereses/text())[1]','float')/100				as  tasaInteres,
		tT.value('(multaIncumpleMaxRetirosCajeroHumano/text())[1]','money') as multaMaxRetiros
from	@infoTipoCuenta.nodes('SistemaBanc/TipoCuentaAhorro')				as temptable(tT)