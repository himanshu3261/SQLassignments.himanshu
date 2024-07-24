create database assignment4;
use assignment4;
CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

 INSERT INTO Movies(Code,Title,Rating) VALUES(9,'Citizen King','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);

 -- Q.1 Select the title of all movies.
 select title from movies;
 
 -- Q.2 Show all the distinct ratings in the database.
 select distinct(rating) from movies;
 
 -- Q.3 Show all unrated movies.
 select * from movies where rating is null;
 
 -- Q.4 Select all movie theaters that are not currently showing a movie.
 select * from movietheaters where movie is null;
 
 -- Q.5 Select all data from all movie theaters
 select * from movietheaters;
 -- additionally, the data from the movie that is being shown in the theater (if one is being shown).
 select * from movietheaters
 inner join movies 
 on movietheaters.movie=movies.code;
 
 -- Q.6  Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
 select * from movies
 left join movietheaters
 on movies.code=movietheaters.movie;
 
 -- Q.7 Show the titles of movies not currently being shown in any theaters.
 select title from movies
 left join movietheaters
 on movies.code=movietheaters.movie
 where movietheaters.movie is null;

-- Q.8 Add the unrated movie "One, Two, Three"
INSERT INTO Movies(Code,Title,Rating)
values
(10,"one,two,three",null);

-- Q.9 Set the rating of all unrated movies to "G".
update movies set rating="G" where rating is null;

-- Q.10 Remove movie theaters projecting movies rated "NC-17".
DELETE FROM movietheaters where movie in(select code from movies where rating="NC-17");

