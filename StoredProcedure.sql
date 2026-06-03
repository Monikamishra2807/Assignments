use E_commerce
--basic stored procedure questions
CREATE PROCEDURE sp_GetAllCustomer
as
begin
   select * from Customer
End

EXEC sp_GetAllCustomer

CREATE PROCEDURE sp_GetAllProducts
as
begin 
  Select * from Product
end

EXEC sp_GetAllProducts

CREATE PROCEDURE sp_GetAllSellers
as
begin 
  Select * from Seller
end

EXEC sp_GetAllSellers


CREATE PROCEDURE sp_GetAllOrders
as
begin 
  Select * from Orders
end

EXEC sp_GetAllOrders


CREATE PROCEDURE sp_GetAllOrderItem
as
begin 
  Select * from OrderItem
end

EXEC sp_GetAllOrderItem

--stored procedure using input parameter

CREATE PROCEDURE sp_GetCustomerId
  @CustomerId int 
as
begin
  select * from Customer where @CustomerId= @CustomerId
end

EXEC sp_GetCustomerId 1;

CREATE PROCEDURE sp_GetProductId
  @ProductId int 
as
begin
  select * from Product where ProductId= @ProductId
end

EXEC sp_GetProductId 1001;

CREATE PROCEDURE sp_GetSellerId
  @SellerId int 
as
begin
  select * from Seller where SellerId= @SellerId
end

EXEC sp_GetSellerId 101;

CREATE PROCEDURE sp_GetOrderId
  @OrderId int 
as
begin
  select * from Orders where OrderId= @OrderId
end

EXEC sp_GetOrderId 201;

CREATE PROCEDURE sp_GetCustomerCity
  @City varchar(50) 
as
begin
  select * from Customer where City= @City
end

EXEC sp_GetCustomerCity 'Chennai';

CREATE PROCEDURE sp_GetProductCategory
  @Category varchar(50) 
as
begin
  select * from Product where Category= @Category
end

EXEC sp_GetProductCategory 'Mobile';

CREATE PROCEDURE sp_GetProductsBySellerId
  @SellerId int 
as
begin
  select * from Product where SellerId= @SellerId
end

EXEC sp_GetProductsBySellerId 102;

CREATE PROCEDURE sp_GetOrdersByCustomerId
  @CustomerId int 
as
begin
  select * from Customer where CustomerId= @CustomerId
end

EXEC sp_GetOrdersByCustomerId 2;

CREATE PROCEDURE sp_GetOrderItemByOrderId
  @OrderId int 
as
begin
  select * from Orders where OrderId= @OrderId
end

EXEC sp_GetOrderItemByOrderId 202;

CREATE PROCEDURE sp_GetProductGreaterThanPrice
  @Price Decimal(10,2) 
as
begin
  select * from Product where Price > @Price
end

EXEC sp_GetProductGreaterThanPrice 70000;

--insert stored procedure

CREATE PROCEDURE sp_InsertCustomer
@CustomerID INT,
@CustomerName varchar(50),
@Email varchar(100),
@MobileNo varchar(15),
@City varchar(50),
@Address varchar(150),
@IsActive bit
as
begin
insert into Customer
(CustomerId,CustomerName,Email,MobileNo,City,Address,IsActive)
values
(@CustomerID,@CustomerName,@Email,@MobileNo,@City,@Address,@IsActive)
end

EXEC sp_InsertCustomer 11,'Monika Mishra','monikamis@gmail.com','9876543210','Chennai','Anna Nagarr',1

CREATE PROCEDURE sp_InsertSeller
@SellerId int,
@SellerName varchar(100),
@Email varchar(100),
@MobileNo varchar(10),
@City varchar(50),
@Rating decimal(3,2),
@IsActive bit
as
begin
insert into Seller(SellerId,SellerName,Email,MobileNo,City,Rating,IsActive) values(@SellerId,@SellerName,@Email,@MobileNo,@City,@Rating,@IsActive)
end


CREATE PROCEDURE sp_InsertProduct
@ProductId int,
@ProductName varchar(100),
@Category varchar(50),
@Price decimal(10,2),
@StockQuantity decimal(10,2),
@SellerId int
as
begin
insert into Product(ProductId,ProductName,Category,Price,StockQuantity,SellerId) values(@ProductId,@ProductName,@Category,@Price,@StockQuantity,@SellerId)
end

CREATE PROCEDURE sp_InsertOrder
@OrderId int,
@CustomerId int,
@PaymentMode varchar(20),
@DeliveryCity varchar(50)
as
begin
insert into Orders(OrderId,CustomerId,PaymentMode,DeliveryCity) values(@OrderId,@CustomerId,@PaymentMode,@DeliveryCity)
end

CREATE PROCEDURE sp_InsertOrderItem
@OrderItemId int,
@OrderId int,
@ProductId int,
@Quantity int,
@UnitPrice decimal(10,2)
as
begin
insert into OrderItem(OrderItemId,OrderId,ProductId,Quantity,UnitPrice) values(@OrderItemId,@OrderId,@ProductId,@Quantity,@UnitPrice)
end

--update the stored procedure
CREATE PROCEDURE sp_UpdateCustomerCity
@CustomerId int,
@City varchar(50)
as
begin
update Customer
set City = @City
where CustomerId = @CustomerId
end

EXEC sp_UpdateCustomerCity 11,'Madurai'

CREATE PROCEDURE sp_UpdateCustomerMobileNo
@CustomerId int,
@MobileNo varchar(15)
as
begin
update Customer
set MobileNo = @MobileNo
where CustomerId = @CustomerId
end

EXEC sp_UpdateCustomerMobileNo 11,'9998883451'

CREATE PROCEDURE sp_UpdateProductPrice
@ProductId int,
@Price decimal(10,2)
as
begin
update Product
set Price = @Price
where ProductId = @ProductId
end

EXEC sp_UpdateProductPrice 1001,80000

CREATE PROCEDURE sp_UpdateProductStockQuantity
@ProductId int,
@StockQuantity decimal(10,2)
as
begin
update Product
set StockQuantity = @StockQuantity
where ProductId = @ProductId
end

EXEC sp_UpdateProductStockQuantity 1001,50

CREATE PROCEDURE sp_UpdateOrderStatus
@OrderId int,
@OrderStatus varchar(15)
as
begin
update Orders
set OrderStatus = @OrderStatus
where OrderId = @OrderId
end

EXEC sp_UpdateOrderStatus 201,'Delivered'

CREATE PROCEDURE sp_UpdateSellerRating
@SellerId int,
@Rating decimal(3,2)
as
begin
update Seller
set Rating = @Rating
where SellerId = @SellerId
end

EXEC sp_UpdateSellerRating 101,4.80

CREATE PROCEDURE sp_UpdateCustomerActiveStatus
@CustomerId int,
@IsActive bit
as
begin
update Customer
set IsActive = @IsActive
where CustomerId = @CustomerId
end

EXEC sp_UpdateCustomerActiveStatus 11,0

CREATE PROCEDURE sp_UpdateSellerActiveStatus
@SellerId int,
@IsActive bit
as
begin
update Seller
set IsActive = @IsActive
where SellerId = @SellerId
end

EXEC sp_UpdateSellerActiveStatus 101,0

--delete stored procedure

CREATE PROCEDURE sp_DeleteCustomer
@CustomerId int
as
begin
delete from Customer where CustomerId = @CustomerId
end

EXEC sp_DeleteCustomer 6

CREATE PROCEDURE sp_DeleteSeller
@SellerId int
as
begin
delete from Seller where SellerId = @SellerId
end

EXEC sp_DeleteSeller 105

CREATE PROCEDURE sp_DeleteProduct
@ProductId int
as
begin
delete from Product where ProductId = @ProductId
end

EXEC sp_DeleteProduct 1009

CREATE PROCEDURE sp_DeleteOrder
@OrderId int
as
begin
delete from Orders where OrderId = @OrderId
end

EXEC sp_DeleteOrder 206

CREATE PROCEDURE sp_DeleteOrderItem
@OrderItemId int
as
begin
delete from OrderItem where OrderItemId = @OrderItemId
end

EXEC sp_DeleteOrderItem 11

--stored proceddure with joins

CREATE PROCEDURE sp_CustomerWiseOrderDetails
as
begin
select C.CustomerName,O.OrderId,O.OrderDate,O.OrderStatus from Customer C join Orders O on C.CustomerId = O.CustomerId
end

EXEC sp_CustomerWiseOrderDetails

CREATE PROCEDURE sp_SellerWiseProductDetails
as
begin
select S.SellerName,P.ProductName,P.Price,P.StockQuantity from Seller S join Product P on S.SellerId = P.SellerId
end

EXEC sp_SellerWiseProductDetails

CREATE PROCEDURE sp_OrderWiseProductDetails
as
begin
select O.OrderId,P.ProductName,OI.Quantity,OI.UnitPrice from Orders O join OrderItem OI on O.OrderId = OI.OrderId join Product P on OI.ProductId = P.ProductId
end

EXEC sp_OrderWiseProductDetails

CREATE PROCEDURE sp_CompleteOrderReport
as
begin
select C.CustomerName,P.ProductName,S.SellerName,OI.Quantity,OI.UnitPrice,OI.Quantity * OI.UnitPrice as TotalAmount from Customer C join Orders O on C.CustomerId = O.CustomerId join OrderItem OI on O.OrderId = OI.OrderId join Product P on OI.ProductId = P.ProductId join Seller S on P.SellerId = S.SellerId
end

EXEC sp_CompleteOrderReport

CREATE PROCEDURE sp_CustomerWiseTotalOrderAmount
as
begin
select C.CustomerName,sum(OI.Quantity * OI.UnitPrice) as TotalAmount from Customer C join Orders O on C.CustomerId = O.CustomerId join OrderItem OI on O.OrderId = OI.OrderId group by C.CustomerName
end

EXEC sp_CustomerWiseTotalOrderAmount

CREATE PROCEDURE sp_SellerWiseTotalSalesAmount
as
begin
select S.SellerName,sum(OI.Quantity * OI.UnitPrice) as TotalSales from Seller S join Product P on S.SellerId = P.SellerId join OrderItem OI on P.ProductId = OI.ProductId group by S.SellerName
end

EXEC sp_SellerWiseTotalSalesAmount

CREATE PROCEDURE sp_ProductWiseTotalSalesQuantity
as
begin
select P.ProductName,sum(OI.Quantity) as TotalQuantity from Product P join OrderItem OI on P.ProductId = OI.ProductId group by P.ProductName
end

EXEC sp_ProductWiseTotalSalesQuantity

--stored procedure with output parameter

CREATE PROCEDURE sp_TotalCustomers
@TotalCustomers int output
as
begin
select @TotalCustomers = count(*) from Customer
end

DECLARE @Amount int
EXEC sp_TotalCustomers @Amount OUTPUT
PRINT @Amount

CREATE PROCEDURE sp_TotalProducts
@TotalProducts int output
as
begin
select @TotalProducts = count(*) from Product
end

DECLARE @Total int
EXEC sp_TotalProducts @Total OUTPUT
PRINT @Total

CREATE PROCEDURE sp_TotalOrders
@TotalOrders int output
as
begin
select @TotalOrders = count(*) from Orders
end

DECLARE @T_Orders int
EXEC sp_TotalOrders @T_Orders OUTPUT
PRINT @T_Orders

CREATE PROCEDURE sp_ProductSalesAmount
@ProductId int,
@TotalSales decimal(10,2) output
as
begin
select @TotalSales = sum(Quantity * UnitPrice) from OrderItem where ProductId = @ProductId
end

DECLARE @T_Sales decimal(10,2)
EXEC sp_ProductSalesAmount 1001,@T_Sales OUTPUT
PRINT @T_Sales

CREATE PROCEDURE sp_CustomerPurchaseAmount
@CustomerId int,
@TotalPurchase decimal(10,2) output
as
begin
select @TotalPurchase = sum(OI.Quantity * OI.UnitPrice) from Orders O join OrderItem OI on O.OrderId = OI.OrderId where O.CustomerId = @CustomerId
end

DECLARE @T_Purchase decimal(10,2)
EXEC sp_CustomerPurchaseAmount 1,@T_Purchase OUTPUT
PRINT @T_Purchase