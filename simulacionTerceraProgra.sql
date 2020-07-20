USE [MuniCasiCompleta]
GO
/****** Object:  StoredProcedure [dbo].[SP_Lector_Administradores]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





BEGIN TRY

	exec SP_Lector_Administradores
	exec SP_Lector_ConceptosDeCobro
	exec SP_Lector_TipoDocId
	exec SP_Lector_TipoEntidad
	exec SP_Lector_TipoMov


	DECLARE @mydoc XML, @i INT
		
	SET @mydoc = (  
	SELECT * FROM OPENROWSET(  
	   BULK 'C:\Users\LUIS\Documents\TEC\Cuarto año\Bases 1\Segunda tarea programada\XML\XML\Operaciones.xml',  
			   SINGLE_CLOB) AS elDocumento)


    

	DECLARE @fechaOperacion DATE

	DECLARE @Fechas TABLE (sec INT IDENTITY(0,1), fecha DATE)
	DECLARE @PropiedadTemp TABLE (sec INT IDENTITY(0,1), fecha date, NumFinca varchar(max), valor MONEY, direccion varchar(500))
	DECLARE @PropietarioTemp TABLE (sec INT IDENTITY(0,1), fecha date, nombre VARCHAR(50), tipoDocIdentidad INT, identificacion NVARCHAR(50)) 
	DECLARE @PropJuridicoResTemp TABLE (sec INT IDENTITY(0,1), fecha date, docIdPersonaJuridica NVARCHAR(50), tipoDocIdPJ INT, DocIdRepresentante nvarchar(50), 
										nombre VARCHAR(50), TipDocIdRepresentante INT)

	DECLARE @PropiedadDelPropietarioTemp TABLE (sec INT IDENTITY(0,1), fecha date, NumFinca varchar(max), identificacion nvarchar(50))
	DECLARE @ConceptoCobroPorPropiedadTemp TABLE (sec INT IDENTITY(0,1), fecha date, idCobro INT, NumFinca varchar(max))
	DECLARE @UsuarioTemp TABLE (sec INT IDENTITY(0,1), fecha date, nombre VARCHAR(50), password VARCHAR(50), tipo VARCHAR(25))
	DECLARE @UsuarioDePropiedad TABLE (sec INT IDENTITY(0,1),fecha date, NumFinca varchar(max), nombreUsuario VARCHAR(50))

	declare @CambioPropiedad table(sec int identity(0,1),fecha date, NumFinca varchar(max), nuevoValor nvarchar(50))
	declare @TransConsumo table(sec int identity(0,1), fecha date, idTransConsumo int, LecturaM3 int, descripcion varchar(50), NumFinca varchar(max))
	declare @Pago table(sec int identity(0,1), fecha date, tipoRecibo int, NumFinca varchar(max))	


	EXEC sp_xml_preparedocument	@i OUTPUT, @mydoc

	

	SELECT *
	INTO FechasTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia')
	WITH (fecha date)

	INSERT INTO @Fechas (fecha)
	SELECT * FROM FechasTemp
/**
	SELECT *
	INTO PropiedadTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/Propiedad')
	WITH (NumFinca varchar(max), Valor MONEY, Direccion VARCHAR(50))
*/
	INSERT INTO @PropiedadTemp(fecha, NumFinca, valor, direccion)
	SELECT fecha, NumFinca, Valor, Direccion from
	openxml (@i, 'Operaciones_por_Dia/OperacionDia/Propiedad', 2)
	with 
	(fecha date '../@fecha', 
     NumFinca varchar(max) '@NumFinca', 
     valor money '@Valor',
	 direccion varchar (500) '@Direccion'
	);
/**	
	 
	SELECT *
	INTO PropietarioTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/Propietario')
	WITH (Nombre VARCHAR(30), TipoDocIdentidad int, identificacion nvarchar(50))
*/
	INSERT INTO @PropietarioTemp(fecha, nombre, tipoDocIdentidad, identificacion)
	SELECT fecha, Nombre, TipoDocIdentidad, identificacion from
	openxml (@i, 'Operaciones_por_Dia/OperacionDia/Propietario', 2)
	with
	(fecha date '../@fecha', 
	nombre varchar(50) '@Nombre', 
	tipoDocIdentidad int '@TipoDocIdentidad', 
	identificacion nvarchar(50) '@identificacion' 
	);
	 
	/**
	SELECT *
	INTO PropJuridicoResTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/PersonaJuridica')
	WITH (docidPersonaJuridica nvarchar(50), TipoDocIdPJ INT, DocidRepresentante nvarchar(50), Nombre VARCHAR(50), TipDocIdRepresentante int)
	
	INSERT INTO @PropJuridicoResTemp(docIdPersonaJuridica, tipoDocIdPJ, DocIdRepresentante, nombre, TipDocIdRepresentante)
	SELECT * FROM PropJuridicoResTemp		*/
	
	
	INSERT INTO @PropJuridicoResTemp(fecha, docIdPersonaJuridica, tipoDocIdPJ, DocIdRepresentante , 
										nombre, TipDocIdRepresentante)
	SELECT fecha, docidPersonaJuridica, TipoDocIdPJ, DocidRepresentante, Nombre, TipDocIdRepresentante FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/PersonaJuridica',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	docIdPersonaJuridica NVARCHAR(50) '@docidPersonaJuridica', 
	tipoDocIdPJ INT '@TipDocIdPJ', 
	DocIdRepresentante nvarchar(50) '@DocidRepresentante', 
	nombre VARCHAR(50) '@Nombre', 
	TipDocIdRepresentante INT '@TipDocIdRepresentante'
	);

/**
	SELECT *
	INTO PropiedadDelPropietarioTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario')
	WITH (NumFinca varchar(max), identificacion nvarchar(50))
*/
	INSERT INTO @PropiedadDelPropietarioTemp(fecha, NumFinca, identificacion)
	SELECT fecha, NumFinca, identificacion FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	NumFinca varchar(max) '@NumFinca', 
	identificacion nvarchar(50) '@identificacion'
	);
/**
	SELECT *
	INTO ConceptoCobroPorPropiedadTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/ConceptoCobroVersusPropiedad')
	WITH (idcobro INT, NumFinca varchar(max))
*/
	INSERT INTO @ConceptoCobroPorPropiedadTemp(fecha, idCobro, NumFinca)
	SELECT fecha, idcobro, NumFinca FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/ConceptoCobroVersusPropiedad',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	idCobro INT '@idcobro', 
	NumFinca varchar(max) '@NumFinca'
	);
/**
	SELECT *
	INTO UsuarioTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/Usuario')
	WITH (Nombre VARCHAR(50), password VARCHAR(50), tipo VARCHAR(50))
*/
	INSERT INTO @UsuarioTemp(fecha, nombre, password, tipo)
	SELECT fecha, Nombre, password, 0 FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/Usuario',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	nombre VARCHAR(50) '@Nombre', 
	password VARCHAR(50) '@password'
	);
/**
	SELECT *
	INTO UsuarioDePropiedadTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/UsuarioVersusPropiedad')
	WITH (NumFinca varchar(max), nombreUsuario VARCHAR(50))
*/
	INSERT INTO @UsuarioDePropiedad(fecha, NumFinca, nombreUsuario)
	SELECT fecha, NumFinca, nombreUsuario FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/UsuarioVersusPropiedad',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	NumFinca varchar(max) '@NumFinca', 
	nombreUsuario VARCHAR(50) '@nombreUsuario'
	);
/**
	SELECT *
	INTO CambioPropiedadTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/CambioPropiedad')
	WITH (NumFinca varchar(max), NuevoValor int)
*/
	INSERT INTO @CambioPropiedad(fecha, NumFinca, nuevoValor)
	SELECT fecha, NumFinca, NuevoValor FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/CambioPropiedad',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	NumFinca varchar(max) '@NumFinca', 
	nuevoValor nvarchar(50) '@NuevoValor'
	);
/**
	SELECT *
	INTO TransConsumoTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/TransConsumo')
	WITH (id int, LecturaM3 int, descripcion varchar(50), NumFinca varchar(max))
*/
	INSERT INTO @TransConsumo(fecha, idTransConsumo, LecturaM3, descripcion, NumFinca)
	SELECT fecha, idTransConsumo, LecturaM3, descripcion, NumFinca FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/TransConsumo',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	idTransConsumo int '@id', 
	LecturaM3 int '@LecturaM3', 
	descripcion varchar(50) '@descripcion', 
	NumFinca varchar(max) '@NumFinca'
	);
/**
	SELECT *
	INTO PagoTemp
	FROM OPENXML (@i, 'Operaciones_por_Dia/OperacionDia/Pago')
	WITH (tipoRecibo int, NumFinca varchar(max))
*/
	INSERT INTO @Pago(fecha, tipoRecibo, NumFinca)
	SELECT fecha, TipoRecibo, NumFinca FROM --Estos son los nombres de las variables que se van a insertar en la tabla--temporal
	OPENXML (@i,'Operaciones_por_Dia/OperacionDia/Pago',2) --Los de arriba deben coincidir con los del xml si no no cargan
	WITH
	(fecha date '../@fecha', 
	tipoRecibo int '@TipoRecibo', 
	NumFinca varchar(max) '@NumFinca'
	);
	

	-- 6 

---	INSERT INTO @Fechas (fecha)
---	SELECT CONVERT(DATE,F.value('@fecha', 'VARCHAR(50)'), 126)
---	FROM @mydoc.nodes('OperacionDia') AS returnData(F)
	
	EXEC sp_xml_removedocument @i

	drop table FechasTemp
	/**
	DROP TABLE PropiedadTemp
	DROP TABLE PropietarioTemp
	DROP TABLE PropJuridicoResTemp
	DROP TABLE PropiedadDelPropietarioTemp
	DROP TABLE ConceptoCobroPorPropiedadTemp
	DROP TABLE UsuarioTemp
	DROP TABLE UsuarioDePropiedadTemp
	drop table CambioPropiedadTemp
	drop table TransConsumoTemp
	drop table PagoTemp
	*/

	DECLARE @loFecha int, @hiFecha INT 
	declare @minfecha DATETIME, @maxfecha DATETIME

	SELECT @minfecha = MIN(F.fecha), @maxfecha = MAX(F.fecha)
	FROM @Fechas F

	SELECT @loFecha = F.sec 
	FROM @Fechas F
	WHERE F.fecha = @minfecha

	SELECT @hiFecha = F.sec
	FROM @Fechas F
	WHERE F.fecha = @maxfecha

	while @loFecha <= @hiFecha
	begin

		select @fechaOperacion = F.fecha from @fechas F where F.sec = @loFecha 
		
		--select @fechaOperacion

		DECLARE @loProp INT, @hiProp INT, @NumFinca varchar(max), @valor MONEY, @direccion varchar(500)

		SELECT @loProp = MIN(PT.sec), @hiProp = MAX(PT.sec)
		FROM @PropiedadTemp PT
		where PT.fecha = @fechaOperacion

		WHILE @loProp <= @hiProp
		BEGIN
		
			SELECT @NumFinca = PT.NumFinca, @valor = PT.valor, @direccion = PT.direccion
			FROM @PropiedadTemp PT
			WHERE PT.sec = @loProp
			INSERT dbo.Propiedad(NumFinca, valor, direccion, M3Acumulados, M3AcumuladosUR, Activo)
			VALUES(@NumFinca, @valor, @direccion, 0, 0, 1)
		
			set @loProp = @loProp + 1

		END

		DECLARE @loPro INT, @hiPro INT, @Nombre VARCHAR(30), @TipoDocIdentidad int, @identificacion nvarchar(50) 

		SELECT @loPro = MIN(P.sec), @hiPro = MAX(P.sec)
		FROM @PropietarioTemp P
		where P.fecha = @fechaOperacion

		WHILE @loPro <= @hiPro
		BEGIN

			SELECT @Nombre = P.nombre, @TipoDocIdentidad = P.tipoDocIdentidad, @identificacion = P.identificacion
			FROM @PropietarioTemp P
			WHERE P.sec = @loPro
			INSERT dbo.Propietarios(ValorDocId, Nombre, identificacion, activo)
			VALUES(@TipoDocIdentidad, @Nombre, @identificacion, 1)
		
			set @loPro = @loPro + 1
	
		END


		DECLARE @loPJR INT, @hiPJR INT, @docIdPersonaJuridica varchar(50), @tipoDocIdPJ INT, @DocIdRepresentante varchar(50), @nombrePJR VARCHAR(50), @TipDocIdRepresentante INT
		
		SELECT @loPJR = MIN(PJ.sec), @hiPJR = MAX(PJ.sec)
		FROM @PropJuridicoResTemp PJ
		where PJ.fecha = @fechaOperacion

		WHILE @loPJR <= @hiPJR
		BEGIN

			SELECT @docIdPersonaJuridica = PJ.docIdPersonaJuridica, @tipoDocIdPJ = PJ.tipoDocIdPJ, @DocIdRepresentante = PJ.DocIdRepresentante,
				   @nombrePJR = PJ.Nombre, @TipDocIdRepresentante = PJ.TipDocIdRepresentante
			FROM @PropJuridicoResTemp PJ
			WHERE PJ.sec = @loPJR
			INSERT dbo.PropJuridicoResponsable (idTipoDocId, identificacion, identificacionRepresentante, Nombre, tipoDocIdRepresentante, Activo)
			VALUES(@tipoDocIdPJ, @docIdPersonaJuridica, @DocIdRepresentante, @nombrePJR, @TipDocIdRepresentante, 1)
		
			--select @loPJR

			set @loPJR = @loPJR + 1
		
		END

		DECLARE @loPvp INT, @hiPvp INT, @NumFincapvp varchar(max), @identificacionpvp nvarchar(50)

		SELECT @loPvp = MIN(PVP.sec), @hiPvp = MAX(PVP.sec)
		FROM @PropiedadDelPropietarioTemp PVP
		where PVP.fecha = @fechaOperacion

		WHILE @loPvp <= @hiPvp
		BEGIN

			SELECT @NumFincapvp = PVP.NumFinca, @identificacionpvp = PVP.identificacion
			FROM @PropiedadDelPropietarioTemp PVP
			WHERE PVP.sec = @loPvp

			declare @idPropietario int, @idPropiedad int

			select @idPropietario = P.id
			from dbo.Propietarios P
			where @identificacionpvp = P.identificacion

			select @idPropiedad = Pr.id
			from dbo.Propiedad Pr
			where @NumFincapvp = Pr.numFinca

			INSERT dbo.[Propiedad del propietario] (Idpropietario, Idpropiedad, Activo)
			VALUES (@idPropietario, @idPropiedad, 1);
		
			set @loPvp = @loPvp + 1

		END

		DECLARE @loCCP INT, @hiCCP INT, @idCobro INT, @NumFincaCCP varchar(max), @diaCobro int, @QDias int, @fechaFin date, @diaVenc int, @diffDias int,
		@diaOperacion int, @diasResta int, @tipoCC varchar(30), @montoRecibo money, @valorPorc money, @valorFinca money

		SELECT @loCCP = MIN(CCP.sec), @hiCCP = MAX(CCP.sec)
		FROM @ConceptoCobroPorPropiedadTemp CCP
		where CCP.fecha = @fechaOperacion

		WHILE @loCCP <= @hiCCP
		BEGIN


		-- supongo q la fechaInicio seria la de operacion preguntar a joshua y no se q poner en la de fin
		-- igual hay q seguir viendo

			SELECT @idCobro = CCP.idCobro, @NumFincaCCP = CCP.NumFinca
			FROM @ConceptoCobroPorPropiedadTemp CCP
			WHERE CCP.sec = @loCCP

			declare @idPropiedadCCP int

			select @idPropiedadCCP = Pr.id
			from dbo.Propiedad Pr
			where @NumFincaCCP = Pr.numFinca

			select @valorFinca = P.valor
			from dbo.Propiedad P
			where P.NumFinca = @NumFincaCCP

			select @diaCobro = CC.diaCobro
			from dbo.ConceptoCobro CC
			where @idCobro = CC.id

			select @QDias = CC.QDiasVencimiento
			from dbo.ConceptoCobro CC
			where @idCobro = CC.id

			select @valorPorc = CC.valorPorcentaje
			from dbo.ConceptoCobro CC
			where CC.id = @idCobro

			select @tipoCC = CC.tipoCC
			from dbo.ConceptoCobro CC
			where CC.id = @idCobro

			if @tipoCC = 'CC Porcentaje'
			begin

				select @montoRecibo = @valorFinca * (@valorPorc / 100)

			end

			if @tipoCC = 'CC Fijo'
			begin

				select @montoRecibo = CC.monto
				from dbo.ConceptoCobro CC
				where CC.id = @idCobro
				
			end

			set @diaOperacion = datepart(dd, @fechaOperacion) 

			if @diaOperacion = @diaCobro
			begin

				set @fechaFin = dateadd(day, @QDias, @fechaOperacion) 

				INSERT dbo.ConceptoCobroPorPropiedad (idPropiedad, idCCCobro, FechaInicio, FechaFin, Activo)
				VALUES (@idPropiedadCCP, @idCobro, @fechaOperacion, @fechaFin, 1);
			
			end

			else
			begin

				
				select @diasResta = abs(@diaOperacion - @diaCobro)

				select @diaVenc = @diaCobro + @QDias

				select @diffDias = abs(@diaVenc - @diasResta)

				set @fechaFin = dateadd(day, @diffDias, @fechaOperacion) 

				INSERT dbo.ConceptoCobroPorPropiedad (idPropiedad, idCCCobro, FechaInicio, FechaFin, Activo)
				VALUES (@idPropiedadCCP, @idCobro, @fechaOperacion, @fechaFin, 1);

			end

			if @diaCobro = @diaOperacion
			begin

				if @idCobro != 1
				begin

					set @fechaFin = dateadd(day, @QDias, @fechaOperacion) 

					insert into dbo.Recibo(idPropiedad, idCCobro, fecha, fechaVence, monto, estado)
					values(@idPropiedadCCP, @idCobro, @fechaOperacion, @fechaFin, @montoRecibo, 0)

				end

			end

			set @loCCP = @loCCP + 1

		END

		DECLARE @loU INT, @hiU INT, @nombreU VARCHAR(50), @password VARCHAR(50), @tipo VARCHAR(25)

		SELECT @loU = MIN(U.sec), @hiU = MAX(U.sec)
		FROM @UsuarioTemp U
		where U.fecha = @fechaOperacion

		WHILE @loU <= @hiU
		BEGIN

			SELECT @nombreU = U.Nombre, @password = U.password, @tipo = U.tipo
			FROM @UsuarioTemp U
			WHERE U.sec = @loU
			INSERT dbo.Usuario (usuario, password, tipo, Activo)
			VALUES (@nombreU, @password, @tipo, 1);

			set @loU = @loU + 1

		END

		DECLARE @loUvp INT, @hiUvp INT, @NumFincauvp varchar(max), @nombreUsuario VARCHAR(50)

		SELECT @loUvp = MIN(Uvp.sec), @hiUvp = MAX(Uvp.sec)
		FROM @UsuarioDePropiedad Uvp
		where Uvp.fecha = @fechaOperacion

		WHILE @loUvp <= @hiUvp
		BEGIN

			SELECT @NumFincauvp = UVP.NumFinca, @nombreUsuario = UVP.nombreUsuario
			FROM @UsuarioDePropiedad UVP
			WHERE UVP.sec = @loUvp

			declare @idPropiedaduvp int, @idUsuario int

			select @idPropiedaduvp = Pr.id
			from dbo.Propiedad Pr
			where @NumFincauvp = Pr.numFinca

			select @idUsuario = U.id
			from dbo.Usuario U
			where @nombreUsuario = U.usuario

			INSERT dbo.UsuarioDePropiedad (idpropiedad, idusuario, Activo)
			VALUES (@idPropiedaduvp, @idUsuario, 1);

			set @loUvp = @loUvp + 1

		END

		/**
		Aqui se realiza la operacion del cambio de valor a una propiedad dentro de la base de datos
		**/

		declare @nuevoValor bigint, @numFincaCambio varchar(max), @loCP int, @hiCP int

		select @loCP = min(CP.sec), @hiCP = max(CP.sec)
		from @CambioPropiedad CP
		where CP.fecha = @fechaOperacion

		while @loCP <= @hiCP
		begin

			select  @nuevoValor = CP.nuevoValor, @numFincaCambio = CP.NumFinca
			from @CambioPropiedad CP
			where CP.sec = @loCP
		
			update dbo.Propiedad
			set valor = @nuevoValor
			where NumFinca = @numFincaCambio

			insert into dbo.HistorialCambiosFinca(numFinca, nuevoValor)
			values (@numFincaCambio, @nuevoValor)

			set @loCP = @loCP + 1
		
		end

		/**
		Aqui se realiza la operacion del registro de consumo de agua
		*/

		declare @idTransConsumo int, @lectura int, @descripcion varchar(50), @numFincaAgua varchar(max), @loA int, @hiA int, @montoConsumo money,
				@idPropiedadAgua int, @cantConsumida int, @mAcum int, @idCCAgua int, @montoConsumido money, @montoMinProp money

		select @loA = min(TC.sec), @hiA = max(TC.sec)
		from @TransConsumo TC
		where TC.fecha = @fechaOperacion

		while @loA <= @hiA
		begin

			select @idTransConsumo = TC.idTransConsumo, @lectura = TC.LecturaM3, @descripcion = TC.descripcion, @numFincaAgua = TC.NumFinca, @idCCAgua = 1
			from @TransConsumo TC
			where TC.sec = @loA

			set @idPropiedadAgua = (select P.id
			from dbo.Propiedad P
			where P.NumFinca = @numFincaAgua)

			select @mAcum = P.m3acumulados
			from dbo.propiedad p 
			where p.numfinca = @numfincaagua

			select @montoConsumo = CCA.ValorM3
			from dbo.CCAgua CCA
			where CCA.id = 1

			select @cantConsumida = @lectura - @macum
			from dbo.Propiedad P
			where P.numFinca = @numFincaAgua 

			select @montominprop = CCA.montoMin
			from dbo.CCAgua CCA
			where CCA.id = 1

			select @montoConsumido = @montoConsumo * @cantConsumida

			update dbo.Propiedad
			set M3Acumulados = @lectura, 
				M3AcumuladosUR = @cantConsumida
			where NumFinca = @NumFincaAgua

			insert into dbo.MovConsumo(idPropiedad, idTipoMov, fecha, montoM3, lecturaConsumo, nuevoAcumM3)
			values(@idPropiedadAgua, @idTransConsumo, @fechaOperacion, @montoConsumo, @cantConsumida, @lectura)

			-- aqui se generarian los recibos de agua

			select @diaCobro = CC.diaCobro
			from ConceptoCobro CC
			where CC.id = @idCCAgua

			select @QDias = CC.QDiasVencimiento
			from ConceptoCobro CC
			where CC.id = @idCCAgua 

			set @diaOperacion = datepart(dd, @fechaOperacion)

			if @diaCobro = @diaOperacion
			begin

				set @fechaFin = dateadd(day, @QDias, @fechaOperacion) 

			end

			else 
			begin
			 
				select @diasResta = abs(@diaOperacion - @diaCobro)

				select @diaVenc = @diaCobro + @QDias

				select @diffDias = abs(@diaVenc - @diasResta)

				set @fechaFin = dateadd(day, @diffDias, @fechaOperacion) 

			end

			if @montoMinProp <= @montoConsumido
			
			begin

				insert into dbo.Recibo(idPropiedad, idCCobro, fecha, fechaVence, monto, estado)
				values(@idPropiedadAgua, 1, @fechaOperacion, @fechaFin, @montoConsumido, 0)

			end

			set @loA = @loA + 1

		end

		declare @tipoRecibo int, @NumFincaPagos varchar(max), @loPag int, @hiPag int, @fechaVenceMoratoria date, @montoMoroso money, @tasaInteres float,
		@idPropiedadPago int, @idCCMoratoria int, @idRecibo int, @loR int, @hiR int, @fechaVenceRecibo date, @montoURecibo money, @montoTotal money,
		@errorNulo varchar(50)

		select @loPag = min(P.sec), @hiPag = max(P.sec)
		from @Pago P
		where P.fecha = @fechaOperacion

		set @montoTotal = 0
		set @errorNulo = 'Alguno de los campos insertados no coinciden con los registros de la base de datos'

		while @loPag <= @hiPag
		begin

			select @tipoRecibo = P.tipoRecibo, @NumFincaPagos = P.NumFinca
			from @Pago P
			where P.sec = @loPag

			select @idPropiedadPago = P.id
			from dbo.Propiedad P
			where P.NumFinca = @NumFincaPagos

			select @loR = min(R.id), @hiR = max(R.id)
			from dbo.Recibo R
			where @tipoRecibo = R.idCCobro or @idPropiedadPago = R.idPropiedad

			select @loR, @hiR

			if @loR != null and @hiR != null
			begin

				while @loR <= @hiR
				begin

					select @fechaVenceRecibo = R.fechaVence
					from dbo.Recibo R
					where R.id = @loR

					set @idCCMoratoria = 11

					select @montoURecibo = R.monto
					from dbo.Recibo R
					where R.id = @loR

					select @tasaInteres = CC.tasaInteresMoratoria
					from dbo.ConceptoCobro CC
					where CC.id = @tipoRecibo

					set @montoMoroso = (@montoURecibo * (@tasaInteres / 365)) * abs(datediff(day, @fechaVenceRecibo, @fechaOperacion))

					if @fechaOperacion > @fechaVenceRecibo
					begin

						insert into dbo.Recibo(idPropiedad, idCCobro, fecha, fechaVence, monto, estado)
						values(@idPropiedadPago, @idCCMoratoria, @fechaOperacion, @fechaVenceMoratoria, @montoMoroso, 0)		

					end

					--    <Pago TipoRecibo="5" NumFinca="4158692"/>
				
					set @loR = @loR + 1
					
						--set @montoTotal = @montoTotal + @montoURecibo

					update dbo.Recibo
					set estado = 1
					where id = @loR 

					insert into dbo.ComprobantePago(idRecibo, fecha, montoTotal)
					values(@loR, @fechaOperacion, @montoURecibo)
				
				end

				if @loR = null or @hiR = null
			
				begin

				select @errorNulo

				end

			set @loPag = @loPag + 1
	
		end
		
		set @loFecha = @loFecha + 1

		end

		end

	

	END TRY

	BEGIN CATCH

	SELECT ERROR_LINE() AS ErrorLineNo,
		   ERROR_NUMBER() AS ErrorNo,
		   ERROR_MESSAGE() AS ErrorMessage



	END CATCH

