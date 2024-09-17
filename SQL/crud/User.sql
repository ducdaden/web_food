CREATE PROCEDURE [dbo].[User_Crud]
	@Action VARCHAR(20),
	@UserId INT = NULL,
	@Name VARCHAR(50) = NULL,
	@Username VARCHAR(50) = NULL,
	@Mobile VARCHAR(50) = NULL,
	@Email VARCHAR(50) = NULL,
	@Address varchar(max) = NULL,
	@PostCode VARCHAR(50)=NULL,
	@Password varchar(50)=NULL,
	@ImageUrl VARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	--select
	IF @Action = 'SELECT4LOGIN'
		BEGIN
			SELECT * From dbo.Users where Username= @Username and Password = @Password
		END

		IF @Action = 'SELECT4PROFILE'
		BEGIN
			SELECT * From dbo.Users where UserId = @UserId
		END
	--INSERT
	IF @Action = 'INSERT'
		BEGIN 
			INSERT INTO dbo.Users(Name, Username, Mobile, ImageUrl, Email, Address, PostCode,Password,CreatedDate)
			VALUES(@Name,@Username,@Mobile,@ImageUrl,@Email,@Address,@PostCode,@Password,GETDATE())
		END

	--UPDATE USER PROFILE
	IF @Action = 'UPDATE'
		BEGIN
			DECLARE @UPDATE_IMAGE VARCHAR(20)
			SELECT @UPDATE_IMAGE= (CASE WHEN @ImageUrl IS NULL THEN 'NO' ELSE 'YES' END)
			IF @UPDATE_IMAGE = 'NO'
				BEGIN
					UPDATE dbo.Users
					SET Name = @Name, Username = @Username,Mobile = @Mobile, Email = @Email, Address = @Address, PostCode=@PostCode
					WHERE UserId = @UserId
				END
			ELSE
				BEGIN
					UPDATE dbo.Users
					SET Name = @Name, Username = @Username, Mobile = @Mobile,Email = @Email, Address=@Address,
					PostCode = @PostCode, ImageUrl=@ImageUrl
					WHERE UserId= @UserId
				END
		END
	--SELECT FOR ADMIN
	IF @Action = 'SELECT4ADMIN'
		BEGIN
			SELECT ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS [SrNo] , UserId, Name,Username,Email,CreatedDate
			FROM Users
		END
	--DELETE
	IF @Action = 'DELETE'
		BEGIN
			DELETE FROM dbo.Users WHERE UserId = @UserId
		END
END