
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Dashboard
@Action varchar(20) = null

AS
BEGIN

	SET NOCOUNT ON;
	if @Action = 'CATEGORY'
	BEGIN
		Select COUNT(*) From dbo.Categories
	END

	IF @Action = 'PRODUCT'
	BEGIN
		SELECT COUNT(*) FROM dbo.Products
	END
	if @Action = 'ORDER'
	begin
		SELECT COUNT(*) FROM dbo.Orders
	end

	if @Action = 'DELIVERED'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders
		WHERE Status = 'Delivered'
	END
	IF @Action = 'PENDING'
	BEGIN
		SELECT COUNT(*) FROM dbo.Orders
		where Status in ('Pending','Dispatched')
	end

	IF @Action = 'SOLDAMOUNT'
	BEGIN
		SELECT SUM(o.Quantity*p.Price) FROM Orders o
		INNER JOIN Products p ON p.ProductId = o.ProductId
	END

	IF @Action = 'CONTACT'
	BEGIN
		SELECT COUNT(*) FROM dbo.Contact
	END
	IF @Action = 'USER'
	BEGIN
		SELECT COUNT(*) FROM dbo.Users
	END
END
GO
