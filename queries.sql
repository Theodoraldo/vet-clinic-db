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
-- -----------------------------------------------------------------------------------------------------------------------------

SELECT ani.name, own.full_name FROM animals ani INNER JOIN owners own ON ani.owner_id = own.id WHERE own.full_name IN ('Melody Pond');

SELECT ani.name animal_name, sp.name type_name FROM animals ani INNER JOIN species sp ON ani.species_id = sp.id WHERE sp.name = 'Pokemon';

SELECT ani.name animal_name, own.full_name owner_name FROM animals ani FULL JOIN owners own ON ani.owner_id = own.id;

SELECT COUNT(*), sp.name FROM animals ani JOIN species sp ON ani.species_id = sp.id GROUP BY sp.name;

SELECT ani.name animal_name, sp.name specie_name FROM animals ani JOIN species sp ON ani.species_id = sp.id INNER JOIN owners own ON ani.owner_id = own.id WHERE sp.name = 'Digimon' AND own.full_name = 'Jennifer Orwell';

SELECT ani.name, ani.escape_attempts, own.full_name FROM animals ani JOIN owners own ON ani.owner_id = own.id WHERE own.full_name = 'Dean Winchester' AND ani.escape_attempts = 0;

SELECT COUNT(*) , own.full_name FROM animals ani JOIN owners own ON ani.owner_id = own.id GROUP BY own.full_name;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT animals.name animal_name, vets.name, visits.visit_date FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1;

SELECT vets.name, COUNT(*) FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT vets.name doctor, species.name type FROM vets FULL JOIN specializations ON vets.id = specializations.vet_id FULL JOIN species ON species.id = specializations.species_id;

SELECT animals.name animal, visits.visit_date, vets.name doctor FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name animal, COUNT(animals.name) FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;

SELECT animals.name animal, visits.visit_date, vets.name doctor FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.visit_date LIMIT 1;

SELECT animals.name animal, visits.visit_date, vets.name doctor FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id ORDER BY visits.visit_date DESC LIMIT 1;			

SELECT COUNT(animals.name), vets.name doctor FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name;

SELECT COUNT(*), species.name type FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(*) DESC LIMIT 1;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


