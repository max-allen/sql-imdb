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

SELECT directorMovies.first_name || ' ' || directorMovies.last_name full_name,leapfilms.name movie_name, leapfilms.year year
FROM (SELECT movies.id movie_id, movies.name, movies.year, movies_genres.genre
	FROM movies
	INNER JOIN movies_genres 
	ON movies.id = movies_genres.movie_id
	WHERE movies.year%4 = 0
	AND movies_genres.genre = 'Film-Noir') leapfilms
	
INNER JOIN (SELECT directors.first_name,directors.last_name,movies_directors.movie_id 
	FROM directors
	INNER JOIN movies_directors
	ON director_id = id) directorMovies

ON directorMovies.movie_id = leapfilms.movie_id
ORDER BY full_name ASC;

SELECT actors.first_name || ' ' || actors.last_name full_name, drama_actors_films.name name
FROM	
	(SELECT actor_id, movie_id, movies.name name, role
	FROM
		(SELECT actor_id, roles.movie_id movie_id, role
		FROM	
			(SELECT bacon_films.movie_id
			FROM
				(SELECT DISTINCT movie_id, actor_id
				FROM
					(SELECT id, first_name || ' ' || last_name full_name 
					FROM actors
					WHERE full_name = 'Kevin Bacon') bacon_id
				INNER JOIN roles
				ON actor_id = id) bacon_films
			INNER JOIN movies_genres
			ON movies_genres.movie_id = bacon_films.movie_id
			WHERE movies_genres.genre = 'Drama') drama_films
		INNER JOIN roles
		ON roles.movie_id = drama_films.movie_id
		WHERE NOT roles.actor_id = 22591) drama_actors
	INNER JOIN movies
	ON movies.id = drama_actors.movie_id) drama_actors_films
INNER JOIN actors
ON actors.id = drama_actors_films.actor_id;















