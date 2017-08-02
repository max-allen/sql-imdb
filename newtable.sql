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






