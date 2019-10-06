declare @info xml = '<SistemaBanc>

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
delete TipoMovimiento
DBCC CHECKIDENT ('[TipoMovimiento]', RESEED, 0);
insert into TipoMovimiento(nombre)
select x.value('(nombre/text())[1]','nvarchar(50)')as nombre
from @info.nodes('(SistemaBanc/TipoMov)') as TEMPTABLE(x)