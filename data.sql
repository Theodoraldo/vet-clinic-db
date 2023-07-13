INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, 't', 10.23), 
	('Gabumon', '2018-11-15', 2, 't', 8.00),
	('Pikachu', '2021-01-07', 1, 'f', 15.04),
	('Devimon', '2017-05-12', 5, 't', 11.00);
-- -----------------------------------------------------------------------------------------------------

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES ('Charmander', '2020-02-08', 0, 'f', -11.00), 
	('Plantmon', '2021-11-15', 2, 't', -5.70),
	('Squirtle', '1993-04-02', 3, 'f', -12.13),
	('Angemon', '2005-06-12', 1, 't', -45.00),
	('Boarmon', '2005-06-07', 7, 't', 20.40),
	('Blossom', '1998-10-13', 3, 't', 17.00),
	('Ditto', '2022-05-14', 4, 't', 22.00);
-- -----------------------------------------------------------------------------------------------------

INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);
	
INSERT INTO species (name) VALUES
	('Pokemon'),
	('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name = NULL;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- -----------------------------------------------------------------------------------------------------

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
       (3, 1),
       (3, 2),
       (4, 2);


INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES (1, 1, '2020-05-24'),
	   (3, 1, '2020-07-22'),
	   (4, 2, '2021-02-02'),
	   (2, 3, '2020-01-05'),
	   (2, 3, '2020-05-08'),
	   (2, 3, '2020-05-14'),
	   (3, 4, '2021-05-04'),
	   (4, 5, '2021-02-24'),
	   (2, 6, '2019-12-21'),
	   (1, 6, '2020-08-10'),
	   (2, 6, '2021-04-07'),
	   (3, 7, '2019-09-29'),
	   (4, 8, '2020-10-03'),
	   (4, 8, '2020-11-04'),
	   (2, 9, '2019-01-24'),
	   (2, 9, '2019-05-15'),
	   (2, 9, '2020-02-27'),
	   (2, 9, '2020-08-03'),
	   (3, 10, '2020-05-24'),	 
	   (1, 10, '2021-01-11');
-- -----------------------------------------------------------------------------------------------------