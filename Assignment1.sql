create database E_commerce
use E_commerce
create table Customer
(
CustomerId int primary key,
CustomerName varchar(100) not null,
Email varchar(100) not null unique,
MobileNo varchar(10),
City varchar(50),
Address varchar(150),
IsActive Bit default 1,
CreatedDate DateTime default GetDate()
)
create table Seller
(
SellerId int primary key,
SellerName varchar(100)not null,
Email varchar(100) not null unique,
MobileNo varchar(10),
City varchar(50),
Rating decimal(10,2),
IsActive Bit default 1
)
create table Product
(
ProductId int primary key,
ProductName varchar(100)not null,
Category varchar(50),
Price decimal(10,2),
StockQuantity int,
SellerId int foreign key(SellerId) references Seller(SellerId),
CreatedDate DateTime Default GetDate()
)
create table Orders
(
OrderId int primary key,
CustomerId int foreign key(CustomerId) references Customer(CustomerId),
OrderDate DateTime Default GetDate(),
OrderStatus varchar(15) Default 'Pending',
PaymentMode varchar(20),
DeliveryCity varchar(50)
)
create table OrderItem
(
OrderItemId int primary key,
OrderId int foreign key(OrderId) references Orders(OrderId),
ProductId int foreign key(ProductId) references Product(ProductId),
Quantity int,
UnitPrice decimal(10,2)
)
alter table Product add constraint chk_product_price check(Price>0)
alter table Product add constraint chk_product_stock check(StockQuantity>0)
alter table OrderItem add constraint chk_orderitem_quantity check(Quantity>0)
insert into Customer
(CustomerId, CustomerName, Email, MobileNo, City, Address)
values
(1,'Anand','anand@gmail.com','9876543210','Chennai','Anna Nagar'),
(2,'Monika','monika@gmail.com','9876543211','Bangalore','MG Road'),
(3,'Nandhini','nandhini@gmail.com','9876543212','Hyderabad','Madhapur'),
(4,'Divya','divya@gmail.com','9876543213','Coimbatore','Gandhipuram'),
(5,'Afsheen','afsheen@gmail.com','9876543214','Chennai','T Nagar')

insert into Seller
(SellerId, SellerName, Email, MobileNo, City, Rating)
values
(101,'TechWorld','techworld@gmail.com','9876500001','Chennai',4.5),
(102,'MobileHub','mobilehub@gmail.com','9876500002','Bangalore',4.2),
(103,'LaptopZone','laptopzone@gmail.com','9876500003','Hyderabad',4.8),
(104,'DigitalStore','digitalstore@gmail.com','9876500004','Coimbatore',4.1)

insert into Product
(ProductId, ProductName, Category, Price, StockQuantity, SellerId)
values
(1001,'iPhone 15','Mobile',75000,20,101),
(1002,'Samsung S24','Mobile',70000,15,102),
(1003,'Dell Inspiron','Laptop',60000,10,103),
(1004,'HP Pavilion','Laptop',55000,8,103),
(1005,'OnePlus 12','Mobile',50000,25,102),
(1006,'Lenovo ThinkPad','Laptop',65000,5,104),
(1007,'iPad Air','Tablet',45000,12,101),
(1008,'Boat Headphones','Accessories',3000,50,104)

insert into Orders
(OrderId, CustomerId, OrderStatus,PaymentMode,DeliveryCity)
values
(201,1,'Pending','UPI','Chennai'),
(202,2,'Delivered','Credit Card','Bangalore'),
(203,3,'Shipped','Debit Card','Hyderabad'),
(204,4,'Pending','Cash','Coimbatore'),
(205,5,'Delivered','UPI','Chennai')

insert into OrderItem
values
(1,201,1001,1,75000),
(2,201,1008,2,3000),
(3,202,1003,1,60000),
(4,202,1007,1,45000),
(5,203,1002,1,70000),
(6,203,1008,1,3000),
(7,204,1004,1,55000),
(8,204,1005,2,50000),
(9,205,1006,1,65000),
(10,205,1008,3,3000)

update customer set City ='Mumbai' where CustomerId=2
update Product set Price =78000 where ProductId=1002
update Orders set OrderStatus ='Delivered' where OrderId=201

insert into  Product
(ProductId, ProductName, Category, Price, StockQuantity, SellerId)
values
(1009,'Wireless Mouse','Accessories',1000,20,104);

delete from product where ProductId not in (select ProductId from OrderItem)
select * from Customer
select * from Seller
select * from Orders
select * from OrderItem

select * from Customer where City = 'Chennai'

select * from Customer where City <> 'Chennai'

select * from Product where Price > 50000

select * from Product where Price BETWEEN 10000 AND 60000

select * from Product where Category IN ('Mobile', 'Laptop')

select * from Customer where CustomerName LIKE 'A%'

select * from Customer where Email LIKE '%gmail%'

select * from Product where ProductName LIKE '%Phone%'

select * from Orders where OrderStatus = 'Delivered'

select * from Product where StockQuantity < 10

select * from Customer where MobileNo IS NOT NULL

select * from Product where Price NOT BETWEEN 10000 AND 50000

select * from Customer where City IN ('Chennai', 'Bangalore')

select * from Customer where City = 'Chennai' AND IsActive = 1

select * from Customer where City <> 'Hyderabad'

select City, count(*) as TotalCustomers from Customer group by City

select Category, count(*) as TotalProducts from Product group by Category

select Category, sum(StockQuantity) as TotalStock from Product group by Category

select Category, max(Price) as MaxPrice from Product group by Category

select Category, min(Price) as MinPrice from Product group by Category

select Category, avg(Price) as AvgPrice from Product group by Category

select C.CustomerName,sum(OI.Quantity * OI.UnitPrice) as TotalOrderAmount from Customer C
join Orders O on C.CustomerId = O.CustomerId join OrderItem OI on O.OrderId = OI.OrderId
group by C.CustomerName

select P.ProductName,sum(OI.Quantity * OI.UnitPrice) as TotalSales from Product P join OrderItem OI
on P.ProductId = OI.ProductId group by P.ProductName

select P.ProductName,sum(OI.Quantity) as TotalQuantitySold from Product P join OrderItem OI
on P.ProductId = OI.ProductId group by P.ProductName;

select Category, count(*) as ProductCount from Product group by Category having count(*) > 1

select C.CustomerName,sum(OI.Quantity * OI.UnitPrice) as TotalAmount from Customer C
join Orders O on C.CustomerId = O.CustomerId join OrderItem OI on O.OrderId = OI.OrderId
group by C.CustomerName having sum(OI.Quantity * OI.UnitPrice) > 50000

select S.SellerName,count(P.ProductId) as TotalProducts from Seller S
join Product P on S.SellerId = P.SellerId group by S.SellerName

select S.SellerName,sum(OI.Quantity * OI.UnitPrice) as TotalSales from Seller S
join Product P on S.SellerId = P.SellerId join OrderItem OI on P.ProductId = OI.ProductId
group by S.SellerName

select OrderStatus,count(*) as OrderCount from Orders group by OrderStatus

select City,count(*) as CustomerCount from Customer group by City order by CustomerCount desc

select * from Product order by Price asc

select * from Product order by Price desc

select * from Customer order by City asc, CustomerName asc

select * from Orders order by OrderDate desc

select * from Product order by Category asc, Price desc

select top 3 * from Product order by Price desc

select top 5 * from Orders order by OrderDate desc

select * from Customer order by IsActive desc, CustomerName asc

select * from Orders O inner join Customer C on O.CustomerId = C.CustomerId

select * from Product P inner join Seller S on P.SellerId = S.SellerId

select * from OrderItem OI inner join Product P on OI.ProductId = P.ProductId

select C.CustomerName,O.OrderId,O.OrderDate,P.ProductName,OI.Quantity,OI.UnitPrice, S.SellerName
from Customer C join Orders O on C.CustomerId = O.CustomerId join OrderItem OI on O.OrderId = OI.OrderId 
join Product P on OI.ProductId = P.ProductId join Seller S on P.SellerId = S.SellerId

select * from Customer C left join Orders O on C.CustomerId = O.CustomerId

select * from Customer C right join Orders O on C.CustomerId = O.CustomerId

select * from Customer C full outer join Orders O on C.CustomerId = O.CustomerId

select C.CustomerName, P.ProductName from Customer C cross join Product P



-- basic subquery
select * from Product where Price > (select avg(price) from Product)
select * from Product where StockQuantity < (select avg(StockQuantity) from Product)
select * from Customer where CustomerId in (select CustomerId from Orders)
select * from Customer where CustomerId not in (select CustomerId from Orders)
select * from Product where ProductId in (select ProductId from OrderItem)
select * from Product where ProductId not in (select ProductId from OrderItem)
select * from Seller where sellerid in (select SellerId from Product)
select * from Seller where sellerid not in (select SellerId from Product)
select * from Orders where CustomerId in (select CustomerId from Customer where City ='Chennai')
select * from Product where SellerId in (select SellerId from Seller where City ='Bangalore')

--subquery using in and not in
select * from Customer where CustomerId in (select CustomerId from Orders)
select * from Customer where CustomerId not in (select CustomerId from Orders)
select * from Product where ProductId in (select ProductId from OrderItem)
select * from Product where ProductId not in (select ProductId from OrderItem)
select * from Seller where SellerId in (select SellerId from Product)
select * from Seller where SellerId not in (select SellerId from Product)
select * from Orders where OrderId in (select OrderId from OrderItem where ProductId in (select ProductId from Product where Category ='Mobile'))
select * from Orders where OrderId not in (select OrderId from OrderItem where ProductId in (select ProductId from Product where Category ='Laptop'))

--subquery with aggregate function
select * from Product where Price = (select max(Price) from Product)
select * from Product where Price = (select min(Price) from Product)
select * from Product where Price > (select avg(Price) from Product)
select * from Product where Price < (select avg(Price) from Product)
select * from Customer where CustomerId in (select CustomerId from Orders group by CustomerId having sum(OrderId) > (select avg(OrderId) from Orders))
select * from Seller where SellerId in (select SellerId from Product where ProductId in (select ProductId from OrderItem group by ProductId having sum(Quantity * UnitPrice) > 50000))
select * from Product where ProductId in (select ProductId from OrderItem group by ProductId having sum(Quantity) > (select avg(Quantity) from OrderItem))
select * from Customer where CustomerId = (select top 1 O.CustomerId from Orders O join OrderItem OI on O.OrderId = OI.OrderId group by O.CustomerId order by sum(OI.Quantity * OI.UnitPrice) desc)
select * from Product where ProductId = (select top 1 ProductId from OrderItem group by ProductId order by sum(Quantity * UnitPrice) desc)
select * from Seller where SellerId = (select top 1 P.SellerId from Product P join OrderItem OI on P.ProductId = OI.ProductId group by P.SellerId order by sum(OI.Quantity * OI.UnitPrice) desc)

--corelated subquery
select * from Product P1 where Price > (select avg(Price) from Product P2 where P1.Category = P2.Category)
select * from Product P1 where Price < (select avg(Price) from Product P2 where P1.Category = P2.Category)
select * from Seller S where 2 < (select count(*) from Product P where S.SellerId = P.SellerId)
select * from Customer C where 1 < (select count(*) from Orders O where C.CustomerId = O.CustomerId)
select * from Orders O where (select sum(Quantity * UnitPrice) from OrderItem OI where O.OrderId = OI.OrderId) > (select avg(Quantity * UnitPrice) from OrderItem)
select * from Product P1 where StockQuantity > (select avg(StockQuantity) from Product P2 where P1.Category = P2.Category)
select * from Seller S where (select avg(Price) from Product P where S.SellerId = P.SellerId) > (select avg(Price) from Product)

--exists and not exists subquery
select * from Customer C where exists (select 1 from Orders O where C.CustomerId = O.CustomerId)
select * from Customer C where not exists (select 1 from Orders O where C.CustomerId = O.CustomerId)
select * from Product P where exists (select 1 from OrderItem OI where P.ProductId = OI.ProductId)
select * from Product P where not exists (select 1 from OrderItem OI where P.ProductId = OI.ProductId)
select * from Seller S where exists (select 1 from Product P where S.SellerId = P.SellerId)
select * from Seller S where not exists (select 1 from Product P where S.SellerId = P.SellerId)
select * from Customer C where exists (select 1 from Orders O join OrderItem OI on O.OrderId = OI.OrderId join Product P on OI.ProductId = P.ProductId where C.CustomerId = O.CustomerId and Category ='Mobile')
select * from Customer C where not exists (select 1 from Orders O join OrderItem OI on O.OrderId = OI.OrderId join Product P on OI.ProductId = P.ProductId where C.CustomerId = O.CustomerId and Category ='Laptop')