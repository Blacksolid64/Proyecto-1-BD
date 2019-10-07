USE [Banco]
GO
/****** Object:  StoredProcedure [dbo].[SP_OperacionesMovimientos]    Script Date: 06/10/2019 9:59:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia Lopez
-- Create date: 2019/10/03
-- Description:	<Muestra y búsqueda de Movimientos en cuenta>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BuscarMovimientos] 
	-- Add the parameters for the stored procedure here
	@idcuenta int = 0,
	@patron nvarchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT fechaHora,nuevoSaldo,descripcion,monto FROM Movimiento WHERE idCuenta = @idcuenta and CHARINDEX(@patron,descripcion) > 0
END
