create database exercise1db;

use exercise1db;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);




-- 1.1 Select the names of all the products in the store.

select *from products;

-- 1.2 Select the names and the prices of all the products in the store.

Select Name, Price From Products;

-- 1.3 Select the name of the products with a price less than or equal to $200.

Select Name From Products Where Price <=200;

-- 1.4 Select all the products with a price between $60 and $120.

Select *From Products Where Price Between 60 and 120;
Select *From Products Where Price  >=60  And Price <= 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).

Select Name, Price From Products Where Price = Price*100;
Select Name, Price*100 From Products;
Select Name, Concat(Price*100, 'Cents') From Products;

-- 1.6 Compute the average price of all the products.

Select Avg(Price) From Products;
Select Sum(Price)/Count(Price) From Products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.

Select Avg(Price) From Products Where Manufacturer =2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.

Select Count(*) From Products Where Price >=180;

-- 1.9 Select the name and price of all products with a price larger 
-- than or equal to $180, and sort first by price (in descending order), and 
-- then by name (in ascending order).

Select Name, Price From Products Where Price >=180 Order By Price Desc, Name asc;

-- 1.10 Select all the data from the products, including all the data for 
-- each product's manufacturer.

Select *From Products Join Manufacturers On Products.Manufacturer = Manufacturers.Code;
Select *From Products, Manufacturers Where Products.Manufacturer = Manufacturers.Code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.

Select Products.name, Price, Manufacturers.Code From Products Join Manufacturers On 
Products.Manufacturer = Manufacturers.Code;


-- 1.12 Select the average price of each manufacturer's 
-- products, showing only the manufacturer's code.

Select Avg(Price) From Products Group By Manufacturer;
Select Avg(Price), Manufacturer From Products Group By Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, 
-- showing the manufacturer's name.

Select Avg(Price), Manufacturer From Products Group By name;

Select Avg(Price), Manufacturers.Name From Products, Manufacturers Where 
Products.Manufacturer = Manufacturers.Code Group By Manufacturers.name;

-- 1.14 Select the names of manufacturer whose products have an average 
-- price larger than or equal to $150.

Select Avg(Price), Manufacturers.Name From Products, Manufacturers 
Where Products.Manufacturer = Manufacturers.Code 
Group BY Manufacturers.name Having Avg(Price)>=150;
 
Select Avg(Price), Manufacturers.Name From Products Inner Join Manufacturers 
On Products.Manufacturer = Manufacturers.Code Group By Manufacturers.name Having Avg(Price)>=150;

-- 1.15 Select the name and price of the cheapest product.

Select Name, Price From Products Order By Price Asc Limit 1;
Select Name, Price From Products Where Price = (Select Min(Price) From Products);

-- 1.16 Select the name of each manufacturer along with the name and price 
-- of its most expensive product.

Select Manufacturers.Name, Price From Proudct Join Manufacturers On 
Products.Manufacturer = Manufacturers.Code Order By Price Desc, Name Asc;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.

Insert Into Products(Code,Name,Price,Manufacturer) VALUES(13,'Loudspeakers',70,2);

-- 1.18 Update the name of product 8 to "Laser Printer".

Update Products Set Name = 'Laser Printer' Where  Code=8; 

-- 1.19 Apply a 10% discount to all products.

Update Products set Price=Price*.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.

Update Products Set Price = Price*.9 Where price >=120;

select *from Manufacturers;

