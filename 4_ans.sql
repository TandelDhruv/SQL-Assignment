
-- 4.1 Select the title of all movies.
	select title from movies;
    
-- 4.2 Show all the distinct ratings in the database.
	select distinct rating from movies;
    
-- 4.3  Show all unrated movies.
	select title from movies where rating is NULL;
    
-- 4.4 Select all movie theaters that are not currently showing a movie.
	select name from theaters where movie is null;
    
-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
    select * from theaters left join movies
		on movies.code = theaters.movie;
        
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
	select * from movies left join theaters
		on movies.code = theaters.movie;
        
-- 4.7 Show the titles of movies not currently being shown in any theaters.
	select title from movies left join theaters
		on movies.code = theaters.movie
	where movie is null;
    
-- 4.8 Add the unrated movie "One, Two, Three".
	 INSERT INTO Movies(Code,Title,Rating) VALUES(9,'One, Two, Three',NULL);
     
-- 4.9 Set the rating of all unrated movies to "G".
	update movies set rating = "G"
    where rating is null;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
	Delete from theaters where movie in (select code from movies where rating = "NC-17");