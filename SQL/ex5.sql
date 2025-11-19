USE Group8DB;

-- Shows all tables for my reference (I'll delete this later)
SELECT * FROM adoption;
SELECT * FROM adoptionapplication;
SELECT * FROM animal;
SELECT * FROM customer;
SELECT * FROM inventory;
SELECT * FROM inventorypurchase;
SELECT * FROM pet;
SELECT * FROM petnicknames;
SELECT * FROM staff;
SELECT * FROM veterinarian;

-- #1. Basic SELECT FROM WHERE: IDs of all pets of a specified breed.
SELECT petID, breed
FROM pet
WHERE breed = 'f7a85a9c5c4fe4d18a9e'; -- my personal favourite type of pet

-- #2. Basic join: names of adopted pets and their adopted addresses.
SELECT p.petName AS adoptedPet, c.address AS adopterAddress
FROM adoption a, customer c, pet p
WHERE a.adoptedPet = p.petID
	AND a.adoptingClient = c.email;
    
-- #3. Aggregation: lists the top 10 most adopted species.
SELECT a.species, COUNT(*) AS numAdopted
FROM pet p, animal a
WHERE p.breed = a.breed
	AND p.adoptionStatus = 'ADOPTED'
GROUP BY a.species
ORDER BY numAdopted DESC
LIMIT 10;