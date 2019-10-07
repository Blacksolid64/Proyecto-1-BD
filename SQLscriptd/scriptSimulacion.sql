set nocount on;
declare @info xml='<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xml>
   <Simulacion>
      <FechaOperacion fecha= "2018-01-01" >
         <Cliente>
            <fechaNacimiento>2000-06-10</fechaNacimiento>
            <usuario>aramos</usuario>
            <contrasenia>ar734</contrasenia>
            <tipoDocId>Cedula Nacional</tipoDocId>
            <docId>123479582</docId>
            <email>a.ramos@gmail.com</email>
            <telefono1>24853790</telefono1>
			<telefono2>68203790</telefono2>
            <nombre>Adrian Ramos Gamboa</nombre>
         </Cliente>
		 <Cliente>
            <fechaNacimiento>2000-05-13</fechaNacimiento>
            <usuario>equiros</usuario>
            <contrasenia>eq123</contrasenia>
            <tipoDocId>Cedula Nacional</tipoDocId>
            <docId>177850267</docId>
            <email>e.quiros@gmail.com</email>
            <telefono1>84526710</telefono1>
			<telefono2>28203880</telefono2>
            <nombre>Esteban Leiva Rojas</nombre>
         </Cliente>
		 <Cliente>
            <fechaNacimiento>1987-02-20</fechaNacimiento>
            <usuario>esegura</usuario>
            <contrasenia>es456</contrasenia>
            <tipoDocId>Cedula Extranjera</tipoDocId>
            <docId>127881269</docId>
            <email>e.segura@gmail.com</email>
            <telefono1>87550631</telefono1>
			<telefono2>22203790</telefono2>
            <nombre>Estela Segura Arias</nombre>
         </Cliente>
         <Cuenta>
            <numCuenta>7345619</numCuenta>
            <saldo>100000</saldo>
            <cliente>123479582</cliente>
            <tipoCuentaAhorro>Pobre</tipoCuentaAhorro>
            <fechaCreacion>2018-01-01</fechaCreacion>
         </Cuenta>
		 <Cuenta>
            <numCuenta>1254788</numCuenta>
            <saldo>321920</saldo>
            <cliente>177850267</cliente>
            <tipoCuentaAhorro>Clase Media</tipoCuentaAhorro>
            <fechaCreacion>2018-01-01</fechaCreacion>
         </Cuenta>
		 <Cuenta>
            <numCuenta>1254745</numCuenta>
            <saldo>90152</saldo>
            <cliente>127881269</cliente>
            <tipoCuentaAhorro>Pobre</tipoCuentaAhorro>
            <fechaCreacion>2018-01-01</fechaCreacion>
         </Cuenta>
         <BeneficiarioNuevo>
            <nombre>Felipe Ramos Gamboa</nombre>
            <parentesco>B</parentesco>
            <porcentaje>25</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/>
            <tipoDocId>Cedula Nacional</tipoDocId>
            <docId>128759450</docId>
            <email>feli.gutierrez@gmail.com</email>
            <telefono1>88304655</telefono1>
			<telefono2>22893770</telefono2>
			<numCuenta>7345619</numCuenta>
            <fechaNacimiento>2001-05-10</fechaNacimiento>
         </BeneficiarioNuevo>
		 <BeneficiarioNuevo>
            <nombre>Manuel Ramos Gonzales</nombre>
            <parentesco>P</parentesco>
            <porcentaje>50</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/>
            <tipoDocId>Pasaporte</tipoDocId>
            <docId>117820568</docId>
            <email>fmanu.alfa@gmail.com</email>
            <telefono1>84760290</telefono1>
			<telefono2>22025870</telefono2>
			<numCuenta>7345619</numCuenta>
            <fechaNacimiento>1960-12-12</fechaNacimiento>
         </BeneficiarioNuevo>
		 <BeneficiarioExistente> 
            <parentesco>C</parentesco>
            <porcentaje>25</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/> 
            <docId>177850267</docId> 
			<numCuenta>7345619</numCuenta> 
         </BeneficiarioExistente>
		 <BeneficiarioNuevo>
            <nombre>Marta Flores Acosta</nombre>
            <parentesco>C</parentesco>
            <porcentaje>50</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/>
            <tipoDocId>Cedula Nacional</tipoDocId>
            <docId>172019853</docId>
            <email>marta.flores@gmail.com</email>
            <telefono1>60248930</telefono1>
			<telefono2>24893231</telefono2>
			<numCuenta>1254788</numCuenta>
            <fechaNacimiento>2000-08-12</fechaNacimiento>
         </BeneficiarioNuevo>
		 <BeneficiarioNuevo>
            <nombre>Sophia Leiva Rojas</nombre>
            <parentesco>S</parentesco>
            <porcentaje>25</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/>
            <tipoDocId>Cedula Nacional</tipoDocId>
            <docId>123456951</docId>
            <email>soph.lei@gmail.com</email>
            <telefono1>84653079</telefono1>
			<telefono2>24875931</telefono2>
			<numCuenta>1254788</numCuenta>
            <fechaNacimiento>1998-01-02</fechaNacimiento>
         </BeneficiarioNuevo>
		 <BeneficiarioExistente> 
            <parentesco>B</parentesco>
            <porcentaje>25</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/> 
            <docId>123479582</docId> 
			<numCuenta>1254788</numCuenta> 
         </BeneficiarioExistente>
		 <BeneficiarioNuevo>
            <nombre>Patricia Cruz Segura</nombre>
            <parentesco>M</parentesco>
            <porcentaje>75</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/>
            <tipoDocId>Cedula Nacional</tipoDocId>
            <docId>185478547</docId>
            <email>patri.cruz@gmail.com</email>
            <telefono1>87541236</telefono1>
			<telefono2>24635989</telefono2>
			<numCuenta>1254745</numCuenta>
            <fechaNacimiento>1950-01-02</fechaNacimiento>
         </BeneficiarioNuevo>
		 <BeneficiarioExistente> 
            <parentesco>M</parentesco>
            <porcentaje>25</porcentaje> 
            <activo>1</activo>
            <fechaDesactivo/> 
            <docId>177850267</docId> 
			<numCuenta>1254745</numCuenta> 
         </BeneficiarioExistente>
         <Movimiento>
            <numCuenta>7345619</numCuenta>
            <tipoMovimiento>deposito</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>150000</monto> 
			<descripcion>TGH456MC</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>7345619</numCuenta>
            <tipoMovimiento>retiroCH</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>-100000</monto> 
			<descripcion>Banco Nacional</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>7345619</numCuenta>
            <tipoMovimiento>retiroCA</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>-30000</monto> 
			<descripcion>ATM07</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>1254788</numCuenta>
            <tipoMovimiento>deposito</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>200000</monto> 
			<descripcion>TGH456MC</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>1254788</numCuenta>
            <tipoMovimiento>compras</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>-355000</monto> 
			<descripcion>Bar La Nave</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>1254788</numCuenta>
            <tipoMovimiento>retiroCA</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>-41000</monto> 
			<descripcion>ATM07</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>1254745</numCuenta>
            <tipoMovimiento>deposito</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>50000</monto> 
			<descripcion>TGH456MC</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>1254745</numCuenta>
            <tipoMovimiento>deposito</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>20000</monto> 
			<descripcion>TGH456MC</descripcion>
         </Movimiento>
		 <Movimiento>
            <numCuenta>1254745</numCuenta>
            <tipoMovimiento>retiroCA</tipoMovimiento>
            <fecha>2018-01-01</fecha>
            <monto>-30000</monto> 
			<descripcion>ATM07</descripcion> 
         </Movimiento>
      </FechaOperacion>
   </Simulacion>
</xml>';
declare @Persona table (id int not null identity(1,1),
                        identificacion nvarchar(20),
                        email nvarchar(50),
                        telefono nvarchar(12),
                        idTipoIdent int,
                        nombre nvarchar(50),
                        fechaNac date)
declare @Cliente table (id int not null,
                        username nvarchar(50),
                        password nvarchar(50))
declare @Cuentas table (numCuenta nvarchar(30),
                        saldo money,
                        fechaCreacion date,
                        idTipoCuenta nvarchar(30),
                        idCliente nvarchar(30))
declare @Benefic table (id int not null identity(1,1),
                        idUsuario int,
                        idParentesco int,
                        porcentajeBeneficio int,
                        activo bit,
                        fechaDesactivacion date,
                        idPersona int)
declare @Movimie table (id int identity(1,1) not null,
                        fechaHora datetime,
                        monto money,
                        descripcion nvarchar(200),
                        idTipoMovimiento int,
                        idEstadoDeCuenta int,
                        idCuenta nvarchar(30))
--Datos para iterar sobre todos los movimientos--
declare @idMovimiento int=1,
		@lastMovId int,
		@monto money,
		@idCuenta int,
		@fechaHora datetime,
		@nuevoSaldo money,
		@descripcion nvarchar(200),
		@idTipoMovimiento int,
		@idEstadoCuenta int
declare @tabla table (fecha date)
insert into @tabla
	select tablaTemp.value('data(@fecha)','date') as fecha
	from @info.nodes('(xml/Simulacion/FechaOperacion)') as TEMPTABLE(tablaTemp) order by fecha asc
declare @fechaItera date
while exists(select * from @tabla)
begin
	select @fechaItera=min(fecha) from @tabla
	insert into @Persona(nombre,email,telefono,identificacion,fechaNac,idTipoIdent)
		select 
			tablaTemp.value('(nombre/text())[1]','nvarchar(50)') as nombre,
			tablaTemp.value('(email/text())[1]','nvarchar(50)')as email,
			tablaTemp.value('(telefono1/text())[1]','nvarchar(12)')as telefono,
            tablaTemp.value('(docId/text())[1]','nvarchar(20)')as identificacion,
			tablaTemp.value('(fechaNacimiento/text())[1]','date')as fechaNac,
            (select top 1 t.id from TipoIdentificacion t
                where t.nombre=tablaTemp.value('(tipoDocId/text())[1]','nvarchar(20)')
            ) as idTipoIdent
		from @info.nodes('((xml/Simulacion/FechaOperacion[@fecha= sql:variable("@fechaItera") ])[1]/Cliente)') as TEMPTABLE(tablaTemp)
    insert into @Cliente(id,username,password)
		select 
			tablaTemp.value('(docId/text())[1]','nvarchar(20)')as id,
			tablaTemp.value('(usuario/text())[1]','nvarchar(50)') as username,
			tablaTemp.value('(contrasenia/text())[1]','nvarchar(50)') as password        
		from @info.nodes('((xml/Simulacion/FechaOperacion[@fecha= sql:variable("@fechaItera") ])[1]/Cliente)') as TEMPTABLE(tablaTemp)        
    insert into @Cuentas(numCuenta,saldo,fechaCreacion,idTipoCuenta,idCliente)
        select 
            tablaTemp.value('(numCuenta/text())[1]','nvarchar(30)')as numCuenta,
            tablaTemp.value('(saldo/text())[1]','money')as saldo,
            tablaTemp.value('(fechaCreacion/text())[1]','date')as fechaCreacion,
			(select top 1 id from TipoCuenta
		 	 where nombre=tablaTemp.value('(tipoCuentaAhorro/text())[1]','nvarchar(30)')
			)as idTipoCuenta,
            tablaTemp.value('(cliente/text())[1]','nvarchar(10)')as idCliente
        from @info.nodes('((xml/Simulacion/FechaOperacion[@fecha= sql:variable("@fechaItera") ])[1]/Cuenta)') as TEMPTABLE(tablaTemp)
    insert into @Persona(nombre,email,telefono,identificacion,fechaNac,idTipoIdent)
		select 
			tablaTemp.value('(nombre/text())[1]','nvarchar(50)') as nombre,
			tablaTemp.value('(email/text())[1]','nvarchar(50)')as email,
			tablaTemp.value('(telefono1/text())[1]','nvarchar(12)')as telefono,
            tablaTemp.value('(docId/text())[1]','nvarchar(20)')as identificacion,
			tablaTemp.value('(fechaNacimiento/text())[1]','date')as fechaNac,
            (select top 1 t.id from TipoIdentificacion t
                where t.nombre=tablaTemp.value('(tipoDocId/text())[1]','nvarchar(20)')
            ) as idTipoIdent
		from @info.nodes('((xml/Simulacion/FechaOperacion[@fecha= sql:variable("@fechaItera") ])[1]/BeneficiarioNuevo)') as TEMPTABLE(tablaTemp)
	insert into @Benefic(idUsuario,idPersona,idParentesco,porcentajeBeneficio,activo,fechaDesactivacion)
		select
            tablaTemp.value('(numCuenta/text())[1]','int')as idUsuario,
            tablaTemp.value('(docId/text())[1]','int') as idPersona,
            (select top 1 t.id from Parentesco t
             where t.parentesco=tablaTemp.value('(parentesco/text())[1]','nvarchar(5)')
            ) as idParentesco,
			tablaTemp.value('(porcentaje/text())[1]','smallint') as porcentajeBeneficio,
			tablaTemp.value('(activo/text())[1]','bit')as activo,
			tablaTemp.value('(fechaDesactivo/text())[1]','date')as fechaDesactivacion
		from @info.nodes('((xml/Simulacion/FechaOperacion[@fecha= sql:variable("@fechaItera") ])[1]/BeneficiarioNuevo)') as TEMPTABLE(tablaTemp)
    insert into @Benefic(idUsuario,idPersona,idParentesco,porcentajeBeneficio,activo,fechaDesactivacion)
		select 
            tablaTemp.value('(numCuenta/text())[1]','int')as idUsuario,
            tablaTemp.value('(docId/text())[1]','int') as idPersona,
            (select top 1 t.id from Parentesco t
                where t.parentesco=tablaTemp.value('(parentesco/text())[1]','nvarchar(50)')
            ) as idParentesco,
			tablaTemp.value('(porcentaje/text())[1]','smallint') as porcentajeBeneficio,
			tablaTemp.value('(activo/text())[1]','bit')as activo,
			tablaTemp.value('(fechaDesactivo/text())[1]','date')as fechaDesactivacion
		from @info.nodes('((xml/Simulacion/FechaOperacion[@fecha= sql:variable("@fechaItera") ])[1]/BeneficiarioExistente)') as TEMPTABLE(tablaTemp)
    insert into @Movimie(idCuenta,idTipoMovimiento,fechaHora,descripcion,monto)
        select
            tablaTemp.value('(numCuenta/text())[1]','nvarchar(30)') as idCuenta,
            (select top 1 id from TipoMovimiento 
                where nombre=tablaTemp.value('(tipoMovimiento/text())[1]','nvarchar(30)')
            ) as idTipoMovimiento,
            tablaTemp.value('(fecha/text())[1]','date')as fechaHora,
            tablaTemp.value('(descripcion/text())[1]','nvarchar(200)')as descripcion,
            tablaTemp.value('(monto/text())[1]','money')as monto
        from @info.nodes('((xml/Simulacion/FechaOperacion[@fecha= sql:variable("@fechaItera") ])[1]/Movimiento)') as TEMPTABLE(tablaTemp)
	begin transaction Juliana
	insert into Persona(identificacion,email,telefono,idTipoIdent,nombre,fechaNac) 
		select p.identificacion,p.email,p.telefono,p.idTipoIdent,p.nombre,p.fechaNac 
		from @Persona p
	insert into Cliente(id,username,password) 
		select	p.id as id,
				c.username as username,
				c.password as password 
		from	@Cliente c 
		inner join Persona p 
		on convert(int,p.identificacion)=c.id
	insert into CuentaAhorro(numCuenta,saldo,idTipoCuenta,idCliente,fechaCreacion) 
		select	numCuenta,
				saldo,
				idTipoCuenta,
				p.id as idCliente,
				fechaCreacion 
		from @Cuentas c
		inner join Persona p on convert(int,p.identificacion)=c.idCliente
	insert into Beneficiario(idUsuario,idParentesco,porcentajeBeneficio,activo,fechaDesactivacion,idPersona) 
		select	c.id as idUsuario,
				idParentesco,
				porcentajeBeneficio,
				activo,
				fechaDesactivacion,
				p.id as idPersona 
		from @Benefic b
		inner join Persona p on convert(int,p.identificacion)=idPersona
		inner join CuentaAhorro c on c.numCuenta=b.idUsuario
	select @lastMovId=max(id) from @Movimie 
	while @idMovimiento<=@lastMovId begin
		set @monto=null
		select	@monto=m.monto,
				@descripcion=m.descripcion,
				@fechaHora=m.fechaHora,
				@idTipoMovimiento=m.idTipoMovimiento,
				@idCuenta=m.idCuenta
		from	@Movimie m 
		where	m.id=@idMovimiento
		exec @idEstadoCuenta=SP_getLastIdEstadoDeCuenta @idCuenta, @fechaItera		
		set @idCuenta=(select top 1 id from CuentaAhorro where numCuenta=@idCuenta)
		if @monto is not null
			exec @idEstadoCuenta=SP_procesarMovimiento @monto,@idCuenta,@fechaHora,@descripcion,@idTipoMovimiento,@idEstadoCuenta
		set @idMovimiento+=1
	end
	commit tran Juliana
    delete @tabla where fecha=@fechaItera
end