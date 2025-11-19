USE Group8DB;

-- #1. Basic SELECT FROM WHERE: IDs of all pets of a specified breed.
SELECT petID, breed
FROM pet
WHERE breed = 'f7a85a9c5c4fe4d18a9e'; -- my personal favourite type of pet

-- #2. Basic join: names of adopted pets and their adopted addresses.
SELECT p.petName AS adoptedPet, c.address AS adopterAddress
FROM adoption a, customer c, pet p
WHERE a.adoptedPet = p.petID
	AND a.adoptingClient = c.email;
    
-- #3. Aggregation: the top 10 most adopted species.
SELECT a.species, COUNT(*) AS numAdopted
FROM pet p, animal a
WHERE p.breed = a.breed
	AND p.adoptionStatus = 'ADOPTED'
GROUP BY a.species
ORDER BY numAdopted DESC
LIMIT 10;

-- #4. NOT: veterinarian phoneNo's that are not from the Territories (i.e. are from the Provinces)
SELECT phoneNo
FROM veterinarian
WHERE province NOT IN ('Northwest Territories', 'Nunavut', 'Yukon');

-- #5. Subquery: names of pets who have at some point been denied adoption.
SELECT p.petName
FROM pet p
WHERE p.petID IN (SELECT a.petID FROM adoptionapplication a WHERE applicationStatus = 'DENIED');

-- #6. EXISTS: phoneNo's of veterinarians that treat more than 4 pets.
SELECT v.phoneNo
FROM veterinarian v
WHERE EXISTS (
	SELECT 1
    FROM pet p
    WHERE p.vetEmail = v.email
    GROUP BY v.email
    HAVING COUNT(*) > 4
);

-- #7. Explicit multi table JOIN and filtering: the petID and customer email of approved pet applications submitted in 2025.
SELECT p.petID, c.email as customerEmail
FROM pet p
JOIN adoptionapplication a ON p.petID = a.petID
JOIN customer c ON a.customerEmail = c.email
WHERE a.applicationDate >= '2025-01-01'
	AND a.applicationDate < '2026-01-01'
	AND a.applicationStatus = 'APPROVED';
