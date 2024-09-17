CREATE PROCEDURE [dbo].[Save_Orders] @tblOrders OrderDetails READONLY
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Orders(OrderNo, ProductId, Quantity, UserId, Status, PaymentId, OrderDate)
	SELECT OrderNo, ProductId, Quantity, UserId, Status, PaymentId, OrderDate from @tblOrders
END

CREATE PROCEDURE [dbo].[Save_Payment]
@Name VARCHAR(100) = NULL,
@CardNo VARCHAR(50) = NULL,
@ExpiryDate VARCHAR(50) = NULL,
@Cvv int = NULL,
@Address VARCHAR(MAX) = NULL,
@PaymentMode Varchar(10) = 'card',
@InsertedId int OUTPUT
AS
BEGIN
SET NOCOUNT ON;
BEGIN
	INSERT INTO dbo.Payment(Name,CardNo,ExpiryDate,CvvNo,Address,PaymentMode)
	VALUES (@Name,@CardNo,@ExpiryDate,@Cvv,@Address,@PaymentMode)
	SELECT @InsertedId = SCOPE_IDENTITY();
END
END