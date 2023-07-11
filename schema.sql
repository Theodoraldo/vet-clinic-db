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
