-- SQLite
-- database: create-a-table.sqlite
CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

INSERT INTO friends (id, name, birthday) Values (1, "Ororo Munroe", "1940-05-30");

INSERT INTO friends (id, name, birthday) Values (2, "Anston F", "1998-08-22");

INSERT INTO friends (id, name, birthday) Values (3, "Matthew C", "1997-07-05");


UPDATE friends
SET name = "Storm"
Where id = 1;

ALTER TABLE friends
ADD COLUMN email TEXT;

UPDATE friends
SET email = "storm@codecademy.com"
WHERE id = 1;

UPDATE friends
SET email = "anston@codecademy.com"
WHERE id = 2;

UPDATE friends
SET email = "matthew@codecademy.com"
WHERE id = 3;

DELETE FROM friends
WHERE id = 1;

SELECT * from friends;

