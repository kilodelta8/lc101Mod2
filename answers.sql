/*Find out which countries the directors in her collection are from (and make sure your result set only lists each country only once).*/
select DISTINCT country from directors

/*Who are the French directors in her database?*/
SELECT first, last from directors where country='France'

/*What is the date of the first time someone viewed one of Sarah's movies?*/
SELECT date_viewed FROM viewings order by date_viewed limit 1

/*How many movies in her collection were directed by people born in the USA?*/
SELECT count(country) from directors where country='USA'

/*What are the titles of the movies in her collection that were directed by Akira Kurosawa?*/
SELECT movies.title from movies inner join directors on movies.director_id=directors.director_id where directors.first='Akira' and directors.last='Kurosawa'

/*How many times has the movie "Talk to Me" been viewed?*/
SELECT count(viewings.movie_id) from viewings inner join movies on viewings.movie_id=movies.movie_id where movies.title='Talk To Me'

/*When was the last time someone viewed one of her movies?*/
SELECT date_viewed FROM viewings order by date_viewed desc limit 1

/*What is the id of the last-viewed movie?*/
SELECT movie_id FROM viewings order by date_viewed desc limit 1

/*What is the title of the first movie she loaned to a friend for viewing?*/
SELECT movies.title FROM movies inner join viewings on viewings.movie_id=movies.movie_id order by date_viewed limit 1

/*What is the first and last name of the person who viewed the last-viewed movie?*/
select viewers.first, viewers.last from viewers inner join viewings on viewers.movie_id=viewings.movie_id order by date_viewed desc limit 1