create database assignment1;
use assignment1;
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

/*Q.1Select the names of all the products in the store.*/
select name from products;

/*Q.2 Select the names and the prices of all the products in the store.*/
SELECT NAME,PRICE FROM PRODUCTS;

/*Q.3 Select the name of the products with a price less than or equal to $200.*/
SELECT name,price from products where price<= 200;

/*Q.4 Select all the products with a price between $60 and $120.*/
select * from products where price between 60 and 120;

/*Select the name and price in cents (i.e., the price must be multiplied by 100).*/
select name,price*100 as price_cents from products;

/*Q.6 Compute the average price of all the products.*/
select avg(price) from products;

/*Q. 7 Compute the average price of all products with manufacturer code equal to 2.*/
select avg(price) from products where Manufacturer=2; 

/*Q.8 Compute the number of products with a price larger than or equal to $180.*/
select* from products where price>=180;

/*Q.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).*/
select name,price from products where price>=180 order by price desc,name asc;

/*Q.10 Select all the data from the products, including all the data for each product's manufacturer.*/
select * from products left join  manufacturers
on products.manufacturer = manufacturers.code;

/*Q.11 Select the product name, price, and manufacturer name of all the products.*/
select products.name,price,manufacturers.name
from products inner join manufacturers
on products.manufacturer=manufacturers.code;

/*Q.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.*/
select avg(price),manufacturer from products
group by  manufacturer;

/*Q.13  Select the average price of each manufacturer's products, showing the manufacturer's name.*/
select avg(price),manufacturers.name
from products left join manufacturers
on manufacturers.code=products.manufacturer
group by Manufacturers.name;

/*Q.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.*/
Select avg(price),manufacturers.name
from products left join manufacturers
on products.manufacturer=manufacturers.code
group by name
having avg(price)>=150;

/*Q.15  Select the name and price of the cheapest product.*/
Select name,price from products order by price limit 1;

/*Q.16 Select the name of each manufacturer along with the name and price of its most expensive product.*/

/*Q.17*Add a new product: Loudspeakers, $70, manufacturer 2.*/
insert into products(code,name,price,manufacturer)
values
(11,"loudspeaker","70","2");

/*Q.18*Update the name of product 8 to "Laser Printer".*/
update products set name="laser printer"
where code=8;

/*Q.19 Apply a 10% discount to all products.*/
SET SQL_SAFE_UPDATES = 0;
update products set price = price-(price*0.1);

/*Q.20 Apply a 10% discount to all products with a price larger than or equal to $120.*/
update products set price=price-(price*0.1)
where price>=120;