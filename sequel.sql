/*start the service*/
service mysql start

/*fire up MySQL  note i set an alias in ubuntu (alias mysql='sudo mysql -u root')*/
mysql

/*create the database*/
CREATE DATABASE movie;

/*switch to newly created db*/
USE movie;

/*create the directors table*/
CREATE TABLE directors (director_id INTEGER PRIMARY KEY AUTO_INCREMENT, first VARCHAR(120), last VARCHAR(120), country VARCHAR(120));

/*create the movie table*/
CREATE TABLE movies (movie_id INTEGER PRIMARY KEY AUTO_INCREMENT, title VARCHAR(120),
    ->     year INTEGER, director_id INTEGER, FOREIGN KEY (director_id) REFERENCES directors(director_id));


/*add directors  (NOTE: I got tired of alternating caps lock)*/
insert into directors (first, last, country) values ('Milos', 'Forman', 'Czechoslovakia');
insert into directors (first, last, country) values ('Jonathan', 'Demme', 'United States');
insert into directors (first, last, country) values ('James', 'Merendino', 'United States');
insert into directors (first, last, country) values ('Stanley', 'Kubrick', 'United States');

/*add movies to movies*/
insert into movies (title, year, director_id) values ('One Flew Over the Cuckoos Nest', 1975, (select director_id from directors where last ='Forman'));
insert into movies (title, year, director_id) values ('The Silence of the Lambs', 1991, (select director_id from directors where last ='Demme'));
insert into movies (title, year, director_id) values ('SLC Punk!', 1998, (select director_id from directors where last ='Merendino'));
insert into movies (title, year, director_id) values ('The Shining', 1980, (select director_id from directors where last ='Kubrick'));
insert into movies (title, year, director_id) values ('Full Metal Jacket', 1987, (select director_id from directors where last ='Kubrick'));

/*display in the terminal the movie table*/
select * from movies
            /*
            +----------+--------------------------------+------+-------------+
            | movie_id | title                          | year | director_id |
            +----------+--------------------------------+------+-------------+
            |        1 | One Flew Over the Cuckoos Nest | 1975 |           1 |
            |        2 | The Silence of the Lambs       | 1991 |           2 |
            |        3 | SLC Punk!                      | 1998 |           3 |
            |        4 | The Shining                    | 1980 |           4 |
            |        5 | Full Metal Jacket              | 1987 |           4 |
            +----------+--------------------------------+------+-------------+
            */


/*display in the terminal the directors table*/
select * from directors
            /*
            +-------------+----------+-----------+----------------+
            | director_id | first    | last      | country        |
            +-------------+----------+-----------+----------------+
            |           1 | Milos    | Forman    | Czechoslovakia |
            |           2 | Jonathan | Demme     | United States  |
            |           3 | James    | Merendino | United States  |
            |           4 | Stanley  | Kubrick   | United States  |
            +-------------+----------+-----------+----------------+
            */

/*<-------------STUDIO TASKS--------------->*/
/*List all the titles of the movies in the database*/
select title from movies;
            /*
            +--------------------------------+
            | title                          |
            +--------------------------------+
            | One Flew Over the Cuckoos Nest |
            | The Silence of the Lambs       |
            | SLC Punk!                      |
            | The Shining                    |
            | Full Metal Jacket              |
            +--------------------------------+
            */


/*List all the titles of the movies in the database in descending order of the year they were released*/
/*by defualt, mysql sorts by ascending order*/
select title from movies order by year;
            /*
            +--------------------------------+
            | title                          |
            +--------------------------------+
            | One Flew Over the Cuckoos Nest |
            | The Shining                    |
            | Full Metal Jacket              |
            | The Silence of the Lambs       |
            | SLC Punk!                      |
            +--------------------------------+
            */


/*Insert a new record into the directors table for Jean-Pierre Jeunet*/
insert into directors (first, last, country) values ('Jean-Pierre', 'Jeunet', 'France');

/*List the director_id for Jean-Pierre Jeunet*/
select director_id from directors;
            /*
            +-------------+
            | director_id |
            +-------------+
            |           1 |
            |           2 |
            |           3 |
            |           4 |
            |           5 |
            +-------------+
            */

/*Insert a new record into the movies*/
insert into movies (title, year, director_id) values ('Amelie', 2001, (select director_id from directors where last ='Jeunet'));

/*List all columns for all records of the directors table in ascending alphabetical order of the director's country of origin*/
select * from directors order by country ASC;
            /*
            +-------------+-------------+-----------+----------------+
            | director_id | first       | last      | country        |
            +-------------+-------------+-----------+----------------+
            |           1 | Milos       | Forman    | Czechoslovakia |
            |           5 | Jean-Pierre | Jeunet    | France         |
            |           2 | Jonathan    | Demme     | United States  |
            |           3 | James       | Merendino | United States  |
            |           4 | Stanley     | Kubrick   | United States  |
            +-------------+-------------+-----------+----------------+
            */

/*List the country of origin of the director of Amelie*/

