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

COMMIT WORK;

SELECT * FROM animals;
-- -----------------------------------------------------------------------------------------------------

BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;
-- -----------------------------------------------------------------------------------------------------

BEGIN TRANSACTION;

DELETE FROM animals WHERE date_of_birth >= '2022-01-01';

SAVEPOINT vet_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT vet_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT TRANSACTION;

SELECT * FROM animals;
-- -----------------------------------------------------------------------------------------------------