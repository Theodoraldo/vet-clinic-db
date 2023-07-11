SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE DATE_PART('YEAR',date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered;

SELECT * FROM animals WHERE name NOT IN ('Gabumon');

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
-- -----------------------------------------------------------------------------------------------------

BEGIN WORK;

UPDATE animals SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK WORK;

SELECT * FROM animals;
-- -----------------------------------------------------------------------------------------------------


BEGIN WORK;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

SELECT * FROM animals;

COMMIT WORK;

SELECT * FROM animals;
-- -----------------------------------------------------------------------------------------------------

BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;
-- -----------------------------------------------------------------------------------------------------

BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT vet_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT vet_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT TRANSACTION;

SELECT * FROM animals;
-- -----------------------------------------------------------------------------------------------------

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

SELECT * FROM animals WHERE neutered;

SELECT * FROM animals WHERE NOT neutered;

SELECT MAX(weight_kg), species FROM animals GROUP BY species;

SELECT MIN(weight_kg), species FROM animals GROUP BY species;

SELECT AVG(escape_attempts), species FROM animals WHERE DATE_PART('YEAR',date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;