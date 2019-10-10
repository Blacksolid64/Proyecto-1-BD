-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joshua Arcia Lopez
-- Create date: 2019/10/03
-- Description:	<Muestra y búsqueda de Movimientos en cuenta>
-- =============================================
CREATE PROCEDURE [dbo].SP_OperacionesMovimientos 
	-- Add the parameters for the stored procedure here
	-- modo determina si se va buscar o si se va mostrar la informacion de la tabla
	@idcuenta int = 0,
	@idestadocuenta int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT fechaHora,nuevoSaldo,descripcion,monto FROM Movimiento WHERE idCuenta = @idcuenta and idEstadoDeCuenta = @idestadocuenta
	END
GO
