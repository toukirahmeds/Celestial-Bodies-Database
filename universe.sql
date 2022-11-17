DROP DATABASE universe;
CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC NOT NULL,
  total_orbits INT
);

CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC NOT NULL,
  total_orbits INT,
  galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC NOT NULL,
  total_orbits INT,
  star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC NOT NULL,
  total_orbits INT,
  planet_id INT REFERENCES planet(planet_id)
);

CREATE TABLE moon_galaxy(
  moon_galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR,
  moon_id INT NOT NULL UNIQUE REFERENCES moon(moon_id),
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

INSERT INTO galaxy
  (name, description, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, total_orbits)
VALUES
  ('Galaxy 1', 'Galaxy 1 description', true, false, 1000, 100, 0),
  ('Galaxy 2', 'Galaxy 2 description', true, false, 1000, 100, 0),
  ('Galaxy 3', 'Galaxy 3 description', true, false, 1000, 100, 0),
  ('Galaxy 4', 'Galaxy 4 description', true, false, 1000, 100, 0),
  ('Galaxy 5', 'Galaxy 5 description', true, false, 1000, 100, 0),
  ('Galaxy 6', 'Galaxy 6 description', true, false, 1000, 100, 0);

INSERT INTO star
  (name, description, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, total_orbits, galaxy_id)
VALUES
  ('Star 1', 'Star 1 description', true, false, 1000, 100, 0, 1),
  ('Star 2', 'Star 2 description', true, false, 1000, 100, 0, 2),
  ('Star 3', 'Star 3 description', true, false, 1000, 100, 0, 3),
  ('Star 4', 'Star 4 description', true, false, 1000, 100, 0, 4),
  ('Star 5', 'Star 5 description', true, false, 1000, 100, 0, 5),
  ('Star 6', 'Star 6 description', true, false, 1000, 100, 0, 6);

INSERT INTO planet
  (name, description, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, total_orbits, star_id)
VALUES
  ('Planet 1', 'Planet 1 description', true, false, 1000, 100, 0, 1),
  ('Planet 2', 'Planet 2 description', true, false, 1000, 100, 0, 2),
  ('Planet 3', 'Planet 3 description', true, false, 1000, 100, 0, 3),
  ('Planet 4', 'Planet 4 description', true, false, 1000, 100, 0, 4),
  ('Planet 5', 'Planet 5 description', true, false, 1000, 100, 0, 5),
  ('Planet 6', 'Planet 6 description', true, false, 1000, 100, 0, 6),
  ('Planet 7', 'Planet 7 description', true, false, 1000, 100, 0, 1),
  ('Planet 8', 'Planet 8 description', true, false, 1000, 100, 0, 2),
  ('Planet 9', 'Planet 9 description', true, false, 1000, 100, 0, 3),
  ('Planet 10', 'Planet 10 description', true, false, 1000, 100, 0, 4),
  ('Planet 11', 'Planet 11 description', true, false, 1000, 100, 0, 5),
  ('Planet 12', 'Planet 12 description', true, false, 1000, 100, 0, 6);

INSERT INTO moon
  (name, description, has_life, is_spherical, age_in_millions_of_years, distance_from_earth, total_orbits, planet_id)
VALUES
  ('Moon 1', 'Moon 1 description', true, false, 1000, 100, 0, 1),
  ('Moon 2', 'Moon 2 description', true, false, 1000, 100, 0, 2),
  ('Moon 3', 'Moon 3 description', true, false, 1000, 100, 0, 3),
  ('Moon 4', 'Moon 4 description', true, false, 1000, 100, 0, 4),
  ('Moon 5', 'Moon 5 description', true, false, 1000, 100, 0, 5),
  ('Moon 6', 'Moon 6 description', true, false, 1000, 100, 0, 6),
  ('Moon 7', 'Moon 7 description', true, false, 1000, 100, 0, 7),
  ('Moon 8', 'Moon 8 description', true, false, 1000, 100, 0, 8),
  ('Moon 9', 'Moon 9 description', true, false, 1000, 100, 0, 9),
  ('Moon 10', 'Moon 10 description', true, false, 1000, 100, 0, 10),
  ('Moon 11', 'Moon 11 description', true, false, 1000, 100, 0, 11),
  ('Moon 12', 'Moon 12 description', true, false, 1000, 100, 0, 12),
  ('Moon 13', 'Moon 13 description', true, false, 1000, 100, 0, 1),
  ('Moon 14', 'Moon 14 description', true, false, 1000, 100, 0, 2),
  ('Moon 15', 'Moon 15 description', true, false, 1000, 100, 0, 3),
  ('Moon 16', 'Moon 16 description', true, false, 1000, 100, 0, 4),
  ('Moon 17', 'Moon 17 description', true, false, 1000, 100, 0, 5),
  ('Moon 18', 'Moon 18 description', true, false, 1000, 100, 0, 6),
  ('Moon 19', 'Moon 19 description', true, false, 1000, 100, 0, 7),
  ('Moon 20', 'Moon 20 description', true, false, 1000, 100, 0, 8);

INSERT INTO moon_galaxy(name, moon_id, galaxy_id)
VALUES
  ('Moon 1 Galaxy 1', 1, 1),
  ('Moon 2 Galaxy 1', 2, 1),
  ('Moon 3 Galaxy 2', 3, 2);
