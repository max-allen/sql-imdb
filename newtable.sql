CREATE TABLE movies(
	id INTEGER PRIMARY KEY,
	name TEXT DEFAULT NULL,
	year INTEGER DEFAULT NULL,
	rank REAL DEFAULT NULL
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY,
  first_name TEXT DEFAULT NULL,
  last_name TEXT DEFAULT NULL,
  gender TEXT DEFAULT NULL
);

CREATE TABLE roles (
  actor_id INTEGER,
  movie_id INTEGER,
  role_name TEXT DEFAULT NULL
);

SELECT *
FROM movies
WHERE year=1991;

SELECT COUNT(*)
FROM movies
WHERE year=1982;

SELECT *
FROM actors
WHERE last_name LIKE '%stack%';

SELECT first_name,COUNT(*) rank
FROM actors
GROUP BY first_name
ORDER BY rank DESC LIMIT 10;

SELECT last_name,COUNT(*) rank
FROM actors
GROUP BY last_name
ORDER BY rank DESC LIMIT 10;

SELECT last_name,COUNT(*) rank
FROM actors
GROUP BY last_name
ORDER BY rank DESC LIMIT 10;

SELECT first_name || ' ' || last_name full_name, COUNT(*) rank
FROM actors
GROUP BY full_name
ORDER BY rank DESC LIMIT 10;

SELECT first_name || ' ' || last_name full_name, id, COUNT(*) rank
FROM actors
LEFT OUTER JOIN roles
ON actors.id = roles.actor_id
GROUP BY actors.id
ORDER BY rank DESC LIMIT 10; 

SELECT genre, COUNT(*) rank
FROM movies_genres
INNER JOIN movies
ON movies_genres.movie_id = movies.id
GROUP BY movies_genres.genre
ORDER BY rank ASC;

SELECT first_name, last_name, role, name
FROM (SELECT first_name, last_name, role, movie_id
	FROM actors
	INNER JOIN roles
	ON actors.id = roles.actor_id) joined
INNER JOIN movies
ON joined.movie_id = movies.id
WHERE movies.name LIKE 'Braveheart'
ORDER BY last_name ASC;

SELECT movies.directors.director_id, movies.directors.movie_id,
	(SELECT movies.id movie_id, movies.year, movies_genres.genre
	FROM movies
	INNER JOIN movies_genres 
	ON movies.id = movies_genres.movie_id
	WHERE movies.year%4 = 0
	AND movies_genres.genre = 'Film-Noir') leapfilms
	(SELECT directors.first_name,directors.last_name,movies_directors.movie_id
	FROM directors
	INNER JOIN movies_directors
	ON director_id = id) directorMovies



FROM directors
INNER JOIN leapfilms
ON 








