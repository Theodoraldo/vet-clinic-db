CREATE DATABASE vet_clinic;

CREATE TABLE IF NOT EXISTS animals
(
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER,
    neutered BOOLEAN NOT NULL,
    weight_kg NUMERIC(10,2),
    PRIMARY KEY (id)
);
-- -----------------------------------------------------------------------------------------------------

ALTER TABLE animals ADD COLUMN species varchar(80);

-- -----------------------------------------------------------------------------------------------------

CREATE TABLE owners (
  id INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (
  INCREMENT 1 START 1 CACHE 1),
  full_name VARCHAR(100) NOT NULL,
  age INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE species (
  id INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (
  INCREMENT 1 START 1 CACHE 1),
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE animals 
  DROP COLUMN species,
  ADD COLUMN species_id INTEGER,
  ADD CONSTRAINT animal_species_fk FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals 
  ADD COLUMN owner_id INTEGER,
  ADD CONSTRAINT animal_owners_fk FOREIGN KEY (owner_id) REFERENCES owners (id);
-- -----------------------------------------------------------------------------------------------------

CREATE TABLE vets (
  id INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (
  INCREMENT 1 START 1 CACHE 1),
  name VARCHAR(100) NOT NULL,
  age INTEGER,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);

CREATE TABLE specializations (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    vet_id INTEGER,
    species_id INTEGER, 
    PRIMARY KEY (id),
    CONSTRAINT vet_spe_fk FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT spe_spe_fk FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    vet_id INTEGER,
    animal_id INTEGER,
    visit_date DATE,
    PRIMARY KEY (id),
    CONSTRAINT vet_vis_fk FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT ani_vis_fk FOREIGN KEY (animal_id) REFERENCES animals(id) 
);
-- -----------------------------------------------------------------------------------------------------
