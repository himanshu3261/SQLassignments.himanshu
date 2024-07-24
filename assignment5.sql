create database assignment5;
use assignment5;
CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
 INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);

-- Q.1 Select the name of all the pieces.
select name from pieces;

-- Q.2 Select all the providers' data. 
select * from providers;

-- Q.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT PIECE,AVG(PRICE) as "average price" FROM PROVIDES
group by piece;

-- Q.4 Obtain the names of all providers who supply piece 1.
select providers.name,piece from providers
inner join provides 
on providers.code=provides.provider
having piece=1;

-- Q.5 Select the name of pieces provided by provider with code "HAL".
select pieces.name,provides.provider from pieces 
inner join provides
on pieces.code=provides.piece
having provides.provider="HAL";

-- Q.6 For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
select pieces.name as "pieces name",providers.name as "provider",max(price) as "maximum price"from
pieces inner join provides 
on pieces.code=provides.piece
inner join providers on
provides.provider=providers.code
group by pieces.name,providers.name;

-- Q.7 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
 INSERT INTO Provides(piece,provider,price) 
 values(1,"TNBC",7);
 
 -- Q.8 Increase all prices by one cent.
 update provides set price= price+0.01;
 SET SQL_SAFE_UPDATES = 0;
 
 -- Q.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4)
 delete from provides where provider="RBI" and piece=4;
 
-- Q.10Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
    DELETE FROM PROVIDES WHERE PROVIDER="RBT";