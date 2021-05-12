---Lay tat ca
ALTER PROCEDURE Proc_GetCategorys
AS
BEGIN
SELECT * FROM Category 
END 
GO
EXEC Proc_GetCategorys
GO

--Lay 1 ban ghi
ALTER PROCEDURE Proc_GetCategory(@CategoryID uniqueidentifier)
AS
BEGIN
SELECT * FROM Category WHERE CategoryID = @CategoryID
END 
GO
EXEC Proc_GetCategory @CategoryID = N'0E984725-C51C-4BF4-9960-E1C60E27ABA0'
GO

--them du lieu
ALTER PROCEDURE Proc_InsertCategory(@CategoryID uniqueidentifier, @CategoryName nvarchar(50))
AS
BEGIN
INSERT INTO Category([CategoryID], [CategoryName]) VALUES (NEWID(), @CategoryName)
END
GO
EXEC Proc_InsertCategory @CategoryID = N'0E984725-C51C-4BF4-9960-E1C60E27ABA0',
						 @CategoryName = N'Kinh dam'
GO

--Sua du lieu
ALTER PROCEDURE Proc_UpdateCategory(@CategoryID uniqueidentifier, @CategoryName nvarchar(50))
AS
BEGIN
UPDATE Category SET CategoryName = @CategoryName WHERE CategoryID = @CategoryID
END
GO
EXEC Proc_UpdateCategory @CategoryID = N'0E984725-C51C-4BF4-9960-E1C60E27ABA0',
						 @CategoryName = N'Kinh Tung' 
GO
 --Xoa du lieu
ALTER PROCEDURE Proc_DeleteCategory(@ID uniqueidentifier)
AS
BEGIN
DELETE FROM Category WHERE CategoryID = @ID
END 
GO
EXEC Proc_DeleteCategory @ID = N'0E984725-C51C-4BF4-9960-E1C60E27ABA0'
GO

-----------------------------------------------------------------------------------
--Lay tat ca
CREATE PROC Proc_GetCustomers
AS
BEGIN
SELECT * FROM Customer
END
GO
EXEC Proc_GetCustomers
GO
--Lay 1 ban ghi
ALTER PROC Proc_GetCustomer(@ID uniqueidentifier)
AS
BEGIN
SELECT * FROM Customer WHERE ID = @ID
END
GO
EXEC Proc_GetCustomer @ID = N'90AD37AD-FE4F-4DA8-AF0F-47671FC4A71F'
GO
--Them du lieu
CREATE PROC Proc_InsertCustomer(@ID uniqueidentifier, @Name nvarchar(30), @Age int, @PhoneNumber int, @Address nvarchar(30), @Email nvarchar(30))
AS
BEGIN
INSERT INTO Customer([ID],[Name],[Age],[PhoneNumber],[Address], [Email]) VALUES (NEWID(), @Name, @Age, @PhoneNumber, @Address, @Email)
END
GO
EXEC Proc_InsertCustomer @ID = N'0E984725-C51C-4BF4-9960-E1C60E27ABA0', @Name ='Tung lol', @Age='20', @PhoneNumber = '0123456789', @Address = 'Ha Noi', @Email = 'Tunglol@gmail.com'
GO
--Sua du lieu
CREATE PROC Proc_UpdateCustomer(@ID uniqueidentifier, @Name nvarchar(30), @Age int, @PhoneNumber int, @Address nvarchar(30), @Email nvarchar(30))
AS
BEGIN
UPDATE Customer SET [Name] = @Name, Age = @Age, PhoneNumber = @PhoneNumber, [Address] = @Address, Email = @Email WHERE ID = @ID
END
GO
EXEC Proc_UpdateCustomer @ID = N'90AD37AD-FE4F-4DA8-AF0F-47671FC4A71F', @Name ='Tung', @Age='20', @PhoneNumber = '0123456780', @Address = 'Ha Noi', @Email = 'Tungklol@gmail.com'
GO

--Xoa du lieu
CREATE PROC Proc_DeleteCustomer(@ID uniqueidentifier)
AS
BEGIN
DELETE FROM Customer WHERE ID = @ID
END
GO
EXEC Proc_DeleteCustomer @ID = N'21974CDC-4176-414B-96D3-2F420FE5E042'
GO
----------------------------------------------------------------------------
ALTER PROC Proc_GetOrders
AS
BEGIN
SELECT * FROM [Order]
END
GO
EXEC Proc_GetOrders
GO
---Lay mot ban ghi
ALTER PROC Proc_GetOrder(@Id int)
AS
BEGIN
SELECT * FROM [Order] WHERE Id = @Id
END
GO
EXEC Proc_GetOrder @Id = 1
GO
--Them ban ghi
ALTER PROC Proc_InsertOrder(@Id int, @OrderDate date, @Status int)
AS
BEGIN
INSERT INTO [Order]([Id],[OrderDate],[Status]) VALUES (@Id, @OrderDate, @Status)
END
GO
EXEC Proc_InsertOrder @Id = '3', @OrderDate = N'2021-05-01', @Status = '3'
GO

--Sua du lieu
ALTER PROC Proc_UpdateOrder(@Id int, @OrderDate date, @Status int)
AS
BEGIN
UPDATE [Order] SET OrderDate = @OrderDate, [Status] = @Status WHERE ID = @ID
END
GO
EXEC Proc_UpdateOrder @Id = '2', @OrderDate = N'2021-05-08', @Status = '2'
GO
--Xoa du lieu
ALTER PROC Proc_DeleteOrder(@Id int)
AS
BEGIN
DELETE FROM [Order] WHERE Id = @Id
END
GO
EXEC Proc_DeleteOrder @Id = '3'
GO
-------------------------------------------------------------
CREATE PROC Proc_GetOrderDetails
AS
BEGIN
SELECT * FROM OrderDetail
END
GO
EXEC Proc_GetOrderDetails
GO
--Them ban ghi
CREATE PROC Proc_InsertOrderDetail(@OrderID uniqueidentifier, @ProductID uniqueidentifier, @Quantity int, @Price money)
AS
BEGIN
INSERT INTO OrderDetail([OrderID],[ProductID],[Quantity],[Price]) VALUES (NEWID(), NEWID(), @Quantity, @Price)
END
GO
EXEC Proc_InsertOrderDetail @OrderID = N'31974CDC-4176-414B-96D3-2F420FE5E032', @ProductID=N'21074CDC-4176-424B-96D3-2F420FE5E042', @Quantity='2', @Price='200000'
GO
---Lay mot ban ghi
CREATE PROC Proc_GetOrderDetail(@OrderID uniqueidentifier)
AS
BEGIN
SELECT * FROM OrderDetail WHERE OrderID = @OrderID
END
GO
EXEC Proc_GetOrderDetail @OrderID = N'661BFA25-780B-4A79-BF5F-9ACCE06A15B3'
GO
--Sua du lieu
CREATE PROC Proc_UpdateOrderDetail(@OrderID uniqueidentifier, @ProductID uniqueidentifier, @Quantity int, @Price money)
AS
BEGIN
UPDATE OrderDetail SET ProductID = @ProductID, Quantity = @Quantity, Price = @Price WHERE OrderID = @OrderID
END
GO
EXEC Proc_UpdateOrderDetail @OrderID = N'CAC4F867-5F66-447C-8718-0DD697E84D6C', @ProductID=N'21074CDC-4176-424B-96D3-2F420FE5E042', @Quantity='3', @Price='300000'
GO
--Xoa du lieu
CREATE PROC Proc_DeleteOrderDetail(@OrderID uniqueidentifier)
AS
BEGIN
DELETE FROM OrderDetail WHERE OrderID = @OrderID
END
GO
EXEC Proc_DeleteOrderDetail @OrderID = 'CAC4F867-5F66-447C-8718-0DD697E84D6C'
GO
-----------------------------------
CREATE PROC Proc_GetProducts
AS
BEGIN
SELECT * FROM Product
END
GO
EXEC Proc_GetProducts
GO
---Lay mot ban ghi
CREATE PROC Proc_GetProduct(@Id uniqueidentifier)
AS
BEGIN
SELECT * FROM Product WHERE Id = @Id
END
GO
EXEC Proc_GetProduct @Id = N'66564C10-4CDD-40DB-BBE6-882B48D3CB8F'
GO
--Them ban ghi
CREATE PROC Proc_InsertProduct(@Id uniqueidentifier, @Code char(10), @Name nvarchar(50), @Price money, @Amount int)
AS
BEGIN
INSERT INTO Product([Id],[Code],[Name],[Price],[Amount]) VALUES (NEWID(), @Code, @Name, @Price, @Amount)
END
GO
EXEC Proc_InsertProduct @Id = N'CAC4F867-5F66-447C-8718-0DD697E84D6C', @Code = 'SP01', @Name = N'Kinh bt', @Price = '100000', @Amount = '4'
GO

--Sua du lieu
CREATE PROC Proc_UpdateProduct(@Id uniqueidentifier, @Code char(10), @Name nvarchar(50), @Price money, @Amount int)
AS
BEGIN
UPDATE Product SET Code = @Code, [Name] = @Name, Price = @Price, Amount = @Amount WHERE Id = @Id
END
GO
EXEC Proc_UpdateProduct @Id = N'D044443E-74AA-4385-95F7-E539AB6C6449', @Code = 'SP03', @Name = N'Kinh nhan hang', @Price = '110000', @Amount = '1'
GO
--Xoa du lieu
CREATE PROC Proc_DeleteProduct(@Id uniqueidentifier)
AS
BEGIN
DELETE FROM Product WHERE Id = @Id
END
GO
EXEC Proc_DeleteProduct @Id = N'66564C10-4CDD-40DB-BBE6-882B48D3CB8F'
GO
-----------------------------------
-----------------------------------
CREATE PROC Proc_GetSuppliers
AS
BEGIN
SELECT * FROM Supplier
END
GO
EXEC Proc_GetSuppliers
GO
---Lay mot ban ghi
CREATE PROC Proc_GetSupplier(@Code char(10))
AS
BEGIN
SELECT * FROM Supplier WHERE Code = @Code
END
GO
EXEC Proc_GetSupplier @Code = 'SP01'
GO
--Them ban ghi
CREATE PROC Proc_InsertSupplier(@Code char(10), @Name nvarchar(50), @Address nvarchar(50), @PhoneNumber int, @Email nvarchar(50))
AS
BEGIN
INSERT INTO Supplier([Code],[Name],[Address],[PhoneNumber],[Email]) VALUES (@Code, @Name, @Address, @PhoneNumber, @Email)
END
GO
EXEC Proc_InsertSupplier @Code = 'SP03', @Name = N'Kinh dep khong', @Address = N'Ha Noi', @PhoneNumber = '0121312731', @Email = N'ab2w@gmail.com'
GO

--Sua du lieu
CREATE PROC Proc_UpdateSupplier(@Code char(10), @Name nvarchar(50), @Address nvarchar(50), @PhoneNumber int, @Email nvarchar(50))
AS
BEGIN
UPDATE Supplier SET [Name] = @Name, [Address] = @Address, PhoneNumber = @PhoneNumber, Email = @Email WHERE Code = @Code
END
GO
EXEC Proc_UpdateSupplier @Code = 'SP01', @Name = N'Kinh 01', @Address = N'Ha Noi1', @PhoneNumber = '012111111', @Email = N'hieu@gmail.com'
GO
--Xoa du lieu
CREATE PROC Proc_DeleteSupplier(@Code char(10))
AS
BEGIN
DELETE FROM Supplier WHERE Code = @Code
END
GO
EXEC Proc_DeleteSupplier @Code = 'SP01'
GO
------------------------------------------------
ALTER PROC Proc_Users
AS
BEGIN
SELECT * FROM [User]
END
GO
EXEC Proc_Users
GO
---Lay mot ban ghi
ALTER PROC Proc_GetUser(@UserID uniqueidentifier)
AS
BEGIN
SELECT * FROM [User] WHERE UserID = @UserID
END
GO
EXEC Proc_GetUser @UserID = N'BF61D68B-D676-4E75-80B7-25FD87A845DB'
GO
--Them ban ghi
ALTER PROC Proc_InsertUser(@UserID uniqueidentifier, @UserName nvarchar(30), @UserSurName nvarchar(30), @UserPhoneNumber int, @UserAccount nvarchar(20), @UserEmail nvarchar(20))
AS
BEGIN
INSERT INTO [User]([UserID],[UserName],[UserSurName],[UserPhoneNumber],[UserAccount],[UserEmail]) VALUES (NEWID(), @UserName, @UserSurName, @UserPhoneNumber, @UserAccount, @UserEmail)
END
GO
EXEC Proc_InsertUser @UserID = N'CAC4F867-5F66-447C-8718-0DD697E84D6C', @UserName = 'Tung', @UserSurName='Tran', @UserPhoneNumber='0194837262', @UserAccount='tunglol123', @UserEmail='tunglol@gmail.com'
GO
--Sua du lieu
ALTER PROC Proc_UpdateUser(@UserID uniqueidentifier, @UserName nvarchar(30), @UserSurName nvarchar(30), @UserPhoneNumber int, @UserAccount nvarchar(20), @UserEmail nvarchar(20))
AS
BEGIN
UPDATE [User] SET UserName = @UserName,UserSurName = @UserSurName,UserPhoneNumber=@UserPhoneNumber,UserAccount= @UserAccount,UserEmail=@UserEmail WHERE UserID = @UserID
END
GO
EXEC Proc_UpdateUser @UserID = N'A47F776B-DC28-426F-9B58-BF8A456CFBF0', @UserName = 'Hie', @UserSurName='Nguyen', @UserPhoneNumber='0943188795', @UserAccount='hieudzvl', @UserEmail='hieu12@gmail.com'
GO
--Xoa du lieu
ALTER PROC Proc_DeleteUser(@UserID uniqueidentifier)
AS
BEGIN
DELETE FROM [User] WHERE UserID = @UserID
END
GO
EXEC Proc_DeleteUser @UserID = N'A47F776B-DC28-426F-9B58-BF8A456CFBF0'
GO