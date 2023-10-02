create database exercise4;

use exercise4;

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
 
 
-- 4.1 Select the title of all movies.

Select * From Movies;

-- 4.2 Show all the distinct ratings in the database.

Select Distinct Rating From Movies;

-- 4.3  Show all unrated movies.

Select * From Movies Where Rating is Null;

-- 4.4 Select all movie theaters that are not currently showing a movie.

Select *From MovieTheaters Where Movie Is Null;

-- 4.5 Select all data from all movie theaters 
-- and, additionally, the data from the movie that is being shown in the theater 
-- (if one is being shown).

select * from movietheaters join movies on movies.code = movietheaters.movie where rating is not null;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, 
-- show the data from the theater.

Select *From Movies Join MovieTheaters On Movies.Code = MovieTheaters.Movie; 

-- 4.7 Show the titles of movies not currently being shown in any theaters.

Select movies.title,movietheaters.name From MovieTheaters right join Movies On MovieTheaters.Movie = Movies.Code 
Where MovieTheaters.Movie Is Null;

-- 4.8 Add the unrated movie "One, Two, Three".

Insert Into Movies(Code,Title,Rating) VALUES(9,'One, Two, Three',NULL); 

-- 4.9 Set the rating of all unrated movies to "G".

Update Movies Set rating = 'g'
where rating is null;

select * from movies;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".

delete from MovieTheaters 
where Movie in (
select Code from Movies where Rating = 'NC-17'
);

select * from movietheaters right join movies on movies.code = movietheaters.movie  where rating = 'NC-17';

delete * 	from movietheaters right join movies on movies.code = movietheaters.movie  where rating = 'NC-17';