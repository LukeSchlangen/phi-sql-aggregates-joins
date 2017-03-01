-- THESE ARE JOINS
CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(80),
  last_name VARCHAR(80)
);

INSERT INTO people (first_name, last_name)
VALUES ('Luke', 'Schlangen'),
('Melissa', 'Hare'),
('Jeremy', 'Leif'),
('Christine', 'Pogatchnik');

SELECT *
FROM people;

CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(80) NOT NULL,
  people_id INT REFERENCES people
);

INSERT INTO jobs (title, people_id)
VALUES ('instructor', 1),
('developer', 1),
('theater usher', 2),
('famous ballerina', 2);

SELECT *
FROM jobs;

SELECT *
FROM jobs
JOIN people ON people.id=jobs.people_id;

SELECT *
FROM people
JOIN jobs ON people.id=jobs.people_id;

DROP TABLE jobs;

CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(80) NOT NULL
);

INSERT INTO jobs (title)
VALUES ('instructor'),
('developer'),
('theater usher'),
('famous ballerina');

CREATE TABLE people_jobs (
	id SERIAL PRIMARY KEY,
	people_id INT REFERENCES people,
	jobs_id INT REFERENCES jobs
);

INSERT INTO people_jobs (people_id, jobs_id)
VALUES (1,1),
(1,2),
(2,3),
(2,4),
(1,4),
(2,2);

SELECT *
FROM people_jobs;

SELECT *
FROM people
JOIN people_jobs ON people.id=people_jobs.people_id
JOIN jobs ON jobs.id=people_jobs.jobs_id;

UPDATE people
SET first_name='Posh'
WHERE id=1;

SELECT *
FROM people
JOIN people_jobs ON people.id=people_jobs.people_id
JOIN jobs ON jobs.id=people_jobs.jobs_id
WHERE people.id=2;

SELECT *
FROM people
JOIN people_jobs ON people.id=people_jobs.people_id
JOIN jobs ON jobs.id=people_jobs.jobs_id
WHERE first_name='Melissa';

SELECT *
FROM people
LEFT OUTER JOIN people_jobs ON people.id=people_jobs.people_id
LEFT OUTER JOIN jobs ON jobs.id=people_jobs.jobs_id;

INSERT INTO jobs (title)
VALUES ('phire phiter');

SELECT *
FROM jobs;


SELECT *
FROM people
RIGHT OUTER JOIN people_jobs ON people.id=people_jobs.people_id
RIGHT OUTER JOIN jobs ON jobs.id=people_jobs.jobs_id;


SELECT *
FROM people
FULL OUTER JOIN people_jobs ON people.id=people_jobs.people_id
FULL OUTER JOIN jobs ON jobs.id=people_jobs.jobs_id;

SELECT *
FROM people
LEFT OUTER JOIN people_jobs ON people.id=people_jobs.people_id
FULL OUTER JOIN jobs ON jobs.id=people_jobs.jobs_id;

INSERT INTO people_jobs (people_id, jobs_id)
VALUES (3, 5),
(4,5);

SELECT *
FROM people
JOIN people_jobs ON people.id=people_jobs.people_id
JOIN jobs ON jobs.id=people_jobs.jobs_id;

UPDATE jobs
SET title='Librarian'
WHERE id=5;

UPDATE people_jobs
SET jobs_id=6
WHERE id=8;

--Aggregates
DROP TABLE stats;

CREATE TABLE stats(
id SERIAL PRIMARY KEY,
recorded TIMESTAMP DEFAULT current_date,
inches int,
drought boolean NOT NULL,
city varchar(80)
);

INSERT INTO stats (recorded, inches, drought, city)
VALUES ('1997-10-02', 20, true, 'Chicago'),
('1997-10-02', 10, true, 'Chicago'),
('1997-10-02', 1, false, 'Detroit'),
('1997-10-02', 3, true, 'Detroit'),
('2010-07-06', 0, false, 'Detroit'),
('2016-09-20', 3, true, 'Las Vegas');

SELECT *
FROM stats;

SELECT count(*)
FROM stats;

SELECT MIN(inches)
FROM stats;

SELECT MAX(inches)
FROM stats;

SELECT AVG(inches)
FROM stats;

SELECT SUM(inches)
FROM stats;

SELECT SUM(city)
FROM stats;

SELECT MIN(inches), MAX(inches)
FROM stats;

SELECT MAX(inches)
FROM stats
WHERE city ILIKE 'detroit';

SELECT city, MAX(inches)
FROM stats
GROUP BY stats.city;

SELECT city, MAX(inches)
FROM stats
GROUP BY stats.city;

SELECT city, recorded, MAX(inches)
FROM stats
GROUP BY stats.city, stats.recorded
ORDER BY max DESC;
