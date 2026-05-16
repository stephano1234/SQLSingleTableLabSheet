-- Single Table Lab Sheet
   CREATE TABLE pet (
          name VARCHAR(20),
          owner VARCHAR(20),
          species VARCHAR(20),
          sex CHAR(1),
          checkups SMALLINT UNSIGNED,
          birth DATE,
          death DATE
          );

   INSERT INTO pet (name, owner, species, sex, checkups, birth, death)
   VALUES (
          'Fluffy',
          'Harold',
          'cat',
          'f',
          5,
          '2001-02-04',
          NULL
          ),
          (
          'Claws',
          'Gwen',
          'cat',
          'm',
          2,
          '2000-03-17',
          NULL
          ),
          (
          'Buffy',
          'Harold',
          'dog',
          'f',
          7,
          '1999-05-13',
          NULL
          ),
          (
          'Fang',
          'Benny',
          'dog',
          'm',
          4,
          '2000-08-27',
          NULL
          ),
          (
          'Bowser',
          'Diane',
          'dog',
          'm',
          8,
          '1998-08-31',
          '2001-07-29'
          ),
          (
          'Chirpy',
          'Gwen',
          'bird',
          'f',
          0,
          '2002-09-11',
          NULL
          ),
          (
          'Whistler',
          'Gwen',
          'bird',
          '',
          1,
          '2001-12-09',
          NULL
          ),
          (
          'Slim',
          'Benny',
          'snake',
          'm',
          5,
          '2001-04-29',
          NULL
          );

   SELECT *
     FROM pet;

   SELECT *
     FROM pet
    WHERE sex = "m";

   SELECT DISTINCT owner
     FROM pet;

   SELECT name,
          species,
          sex
     FROM pet
    WHERE species = "snake"
       OR species = "bird";

-- Q1-1
   SELECT owner,
          name
     FROM pet
    WHERE sex = 'f';

-- Q1-2
   SELECT name,
          birth
     FROM pet
    WHERE species = "dog";

-- Q1-3
   SELECT DISTINCT owner
     FROM pet
    WHERE species = "bird";

-- Q1-4
   SELECT DISTINCT species
     FROM pet
    WHERE sex = "f";

-- Q1-5
   SELECT name,
          birth
     FROM pet
    WHERE species = "cat"
       OR species = "bird";

-- Q1-6
   SELECT name,
          species
     FROM pet
    WHERE sex = "f"
      AND (
          species = "cat"
       OR species = "bird"
          );

   SELECT name
     FROM pet
    WHERE sex < "m";

   SELECT name
     FROM pet
    WHERE name > "F";

   SELECT name
     FROM pet
    WHERE name > "f";

   SELECT name
     FROM pet
    WHERE name > "F"
      AND owner > "F";

-- Q2-1
   SELECT owner,
          name
     FROM pet
    WHERE name LIKE "%er"
       OR name LIKE "%all";

-- Q2-2
   SELECT name
     FROM pet
    WHERE owner LIKE "%e%";

-- Q2-3
   SELECT name
     FROM pet
    WHERE name NOT LIKE "%fy";

-- Q2-4
   SELECT name
     FROM pet
    WHERE LENGTH(owner) < 5;

-- Q2-5
   SELECT DISTINCT owner
     FROM pet
    WHERE LOWER(owner) <= "e"
      AND LOWER(SUBSTR(owner, -1, 1)) <= "e";

-- Q2-6
   SELECT DISTINCT owner
     FROM pet
    WHERE owner <= "E"
      AND SUBSTR(owner, -1, 1) <= "e";

   SELECT name,
          birth
     FROM pet
 ORDER BY birth;

   SELECT name,
          birth
     FROM pet
 ORDER BY birth DESC;

   SELECT name,
          species,
          birth
     FROM pet
 ORDER BY species,
          birth DESC;

   SELECT name
     FROM pet
    WHERE STRFTIME('%m', birth) = STRFTIME('%m', 'now');

   SELECT name,
          STRFTIME('%m', birth)
     FROM pet;

   SELECT name,
          STRFTIME('%m', birth) AS Month
     FROM pet;

   SELECT owner,
          name,
          (checkups * 20) AS income
     FROM pet;

   SELECT owner,
          name,
          birth,
          MIN(STRFTIME('%Y', birth)) AS birth_year
     FROM pet
 GROUP BY owner;

--  Q3-1
   SELECT owner,
          AVG(checkups) AS checkups_average
     FROM pet
 GROUP BY owner;

--  Q3-2
   SELECT species,
          COUNT(name) AS pets_count
     FROM pet
 GROUP BY species
 ORDER BY species ASC;

--  Q3-3
   SELECT owner,
          species,
          COUNT(name) AS pets_count
     FROM pet
 GROUP BY owner,
          species;

--  Q3-4
   SELECT owner,
          COUNT(DISTINCT species) AS species_count
     FROM pet
 GROUP BY owner;

--  Q3-5
   SELECT sex,
          COUNT(name) AS pets_count
     FROM pet
    WHERE sex <> ""
 GROUP BY sex;

--  Q3-6
   SELECT owner,
          SUM(species = "bird") AS bird_count
     FROM pet
 GROUP BY owner;

--  Q3-7
   SELECT owner,
          SUM(checkups) AS total_checkups
     FROM pet
 GROUP BY owner;