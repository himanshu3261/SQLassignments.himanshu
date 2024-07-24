create database assignment3;
use assignment3;
CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;

  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

 
-- 	Q.1 Select all warehouses.
SELECT * from warehouses;

-- Q.2 Select all boxes with a value larger than $150.
select * from boxes where value>150;

-- Q.3 Select all distinct contents in all the boxes.
select distinct(contents) from boxes;

-- Q.4 Select the average value of all the boxes.
select avg(value) from boxes;

-- Q.5 Select the warehouse code and the average value of the boxes in each warehouse.
select warehouses.code,avg(value) from
warehouses inner join boxes 
on warehouses.code=boxes.warehouse
group by code;

-- Q.6  Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select warehouse,avg(value) as "average_value" from boxes 
group by warehouse
having avg(value)>150;

-- Q.7 Select the code of each box, along with the name of the city the box is located in.
select boxes.code,location from 
boxes inner join warehouses
on warehouses.code=boxes.warehouse;

-- Q.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
select warehouse,count(*) from boxes
group by warehouse;

select warehouses.code, count(boxes.code) as "counted box" from
warehouses left join boxes
on warehouses.code=boxes.warehouse
group by warehouses.code;

-- Q.9 Select the codes of all warehouses that are saturated.
 SELECT Warehouses.Code
  FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse
  GROUP BY Warehouses.code, Warehouses.Capacity
  HAVING Count(Boxes.code) > Warehouses.Capacity;


-- Q.10 Select the codes of all the boxes located in Chicago.
select boxes.code,location from 
boxes left join warehouses 
on Warehouses.Code=Boxes.Warehouse
group by boxes.code 
having location= 'chicago';

-- Q.11 Create a new warehouse in New York with a capacity for 3 boxes.
insert into warehouses (code,location,capacity)
values
(6,"New York",3);

-- Q.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
insert into boxes (Code,Contents,Value,Warehouse)
values
("H5RT","Papers",200,2);

-- Q.13  Reduce the value of all boxes by 15%
update boxes set value = value *0.85;

-- Q.14 Remove all boxes with a value lower than $100.
delete from boxes where value < 100;


-- Q.15 Remove all boxes from saturated warehouses.
delete 



