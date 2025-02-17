USE [FoodieDB]
GO
/****** Object:  StoredProcedure [dbo].[Invoice]    Script Date: 5/13/2024 3:59:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Invoice]
	@Action VARCHAR(10),
	@PaymentId INT = NULL,
	@UserId INT = NULL,
	@OrderDetailsId INT = NULL,
	@Status VARCHAR(50) = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	if @Action='INVOICBYID'
		BEGIN
			SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo], o.OrderNo,p.Name,p.Price,o.Quantity, (p.Price*o.Quantity) as 
			TotalPrice, o.OrderDate,o.Status from Orders o
			inner join Products p on p.ProductId = o.ProductId
			where o.PaymentId = @PaymentId and o.UserId = @UserId
		END
	IF @Action = 'ODRHISTORY'
	 BEGIN
		SELECT DISTINCT p.PaymentId,p.PaymentMode,p.CardNo FROM Orders o
		inner join Payment p on p.PaymentId= o.PaymentId
		where o.UserId = @UserId
	END
	IF @Action = 'GETSTATUS'
		BEGIN
			SELECT o.OrderDetailsId, o.OrderNo,(pr.Price *o.Quantity) as TotalPrice,o.Status,o.OrderDate, p.PaymentMode,pr.Name from Orders o
			inner join Payment p On p.PaymentId = o.PaymentId
			inner join Products pr ON pr.ProductId = o.ProductId
		END
	IF @Action = 'STATUSBYID'
		BEGIN
			SELECT OrderDetailsId, Status From Orders
			WHERE OrderDetailsId = @OrderDetailsId
		END
	IF @Action = 'UPDTSTATUS'
		BEGIN
			UPDATE dbo.Orders
			SET Status = @Status WHERE OrderDetailsId =@OrderDetailsId
		END
END
