-- Generate Customer
DROP PROCEDURE IF EXISTS GenerateCustomer;
DELIMITER //
CREATE PROCEDURE GenerateCustomer(IN num INT)
BEGIN
    -- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	my_loop: WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO Customer(email, phoneNo, province, city, street, streetNo) VALUES (
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20),
            ELT(FLOOR(RAND() * 13) + 1, 'British Columbia', 'Alberta',
						'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec',
						'Nova Scotia', 'Newfoundland and Labrador',
						'Prince Edward Island', 'New Brunswick', 'Yukon',
						'Nunavut', 'Northwest Territories'),
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20),
            SUBSTR(MD5(RAND()), 1, 20)
        );
	END WHILE;
END //
DELIMITER ;
CALL GenerateCustomer(10);

SELECT * FROM Customer;

-- Generate Staff
DROP PROCEDURE IF EXISTS GenerateStaff;
DELIMITER //
CREATE PROCEDURE GenerateStaff(IN num INT)
BEGIN
    -- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
		INSERT INTO Staff(email, fName, lName, jobTitle, phoneNo, salary) VALUES (
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20),
			ROUND((RAND() * 1000.0) + 100.0, 2)
		);
	END WHILE;
END //
DELIMITER ;
CALL GenerateStaff(10);

SELECT * FROM Staff;

-- Generate Animal
DROP PROCEDURE IF EXISTS GenerateAnimal;
DELIMITER //
CREATE PROCEDURE GenerateAnimal(IN num INT)
BEGIN
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO Animal(breed, species) VALUES (
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20)
        );
	END WHILE;
END //
DELIMITER ;
CALL GenerateAnimal(10);

SELECT * FROM Animal;

-- Generate Veterinarian
DROP PROCEDURE IF EXISTS GenerateVeterinarian;
DELIMITER //
CREATE PROCEDURE GenerateVeterinarian(IN num INT)
BEGIN
    DECLARE randBreed VARCHAR(100);
    DECLARE randSpecies VARCHAR(100);
    
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        SET randBreed = (SELECT breed FROM Animal ORDER BY RAND() LIMIT 1);
        SET randSpecies = (SELECT species FROM Animal WHERE breed=randBreed ORDER BY RAND() LIMIT 1);
        INSERT INTO Veterinarian(email, phoneNo, phoneExtension, province, city, street, streetNo, breed, species) VALUES (
			SUBSTR(MD5(RAND()), 1, 20),
			SUBSTR(MD5(RAND()), 1, 20),
            SUBSTR(MD5(RAND()), 1, 10),
            ELT(FLOOR(RAND() * 13) + 1, 'British Columbia', 'Alberta',
						'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec',
						'Nova Scotia', 'Newfoundland and Labrador',
						'Prince Edward Island', 'New Brunswick', 'Yukon',
						'Nunavut', 'Northwest Territories'),
			SUBSTR(MD5(RAND()), 1, 20),
            SUBSTR(MD5(RAND()), 1, 20),
            SUBSTR(MD5(RAND()), 1, 20),
            randBreed,
            randSpecies
        );
	END WHILE;
END //
DELIMITER ;
CALL GenerateVeterinarian(10);

SELECT * FROM Veterinarian;

-- Generate Pet
DROP PROCEDURE IF EXISTS GeneratePet;
DELIMITER //
CREATE PROCEDURE GeneratePet(IN num INT)
BEGIN
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO Pet(petName, breed, dateOfBirth, weight, adoptionStatus, healthStatus, vetEmail, adoptionPrice) VALUES (
			SUBSTR(MD5(RAND()), 1, 20),
			(SELECT breed FROM Animal ORDER BY RAND() LIMIT 1),
            (CURRENT_DATE + INTERVAL FLOOR((RAND() - 0.5) * 365) DAY),
            ROUND((RAND() * 30.0) + 5.0, 2),
            ELT(FLOOR(RAND() * 4) + 1, 'AVAILABLE', 'ON_HOLD', 'INELIGIBLE', 'ADOPTED'),
			SUBSTR(MD5(RAND()), 1, 20),
            (SELECT email FROM Veterinarian ORDER BY RAND() LIMIT 1),
            ROUND((RAND() * 100.0) + 15.0, 2)
        );
	END WHILE;
END //
DELIMITER ;
CALL GeneratePet(10);

SELECT * FROM Pet;

-- Generate PetNicknames
DROP PROCEDURE IF EXISTS GeneratePetNicknames;
DELIMITER //
CREATE PROCEDURE GeneratePetNicknames(IN num INT)
BEGIN
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO PetNicknames(petID, nickname) VALUES (
			(SELECT petID FROM Pet ORDER BY RAND() LIMIT 1),
			SUBSTR(MD5(RAND()), 1, 20)
        );
	END WHILE;
END //
DELIMITER ;
CALL GeneratePetNicknames(10);

SELECT * FROM PetNicknames;

-- Generate Adoption
DROP PROCEDURE IF EXISTS GenerateAdoption;
DELIMITER //
CREATE PROCEDURE GenerateAdoption(IN num INT)
BEGIN
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO Adoption(adoptedPet, adoptingClient, adoptionDate, transactionStatus, transactionMethod) VALUES (
			(SELECT petID FROM Pet ORDER BY RAND() LIMIT 1),
            (SELECT email FROM Customer ORDER BY RAND() LIMIT 1),
            (CURRENT_DATE + INTERVAL FLOOR((RAND() - 0.5) * 365) DAY),
            ELT(FLOOR(RAND() * 3) + 1, 'COMPLETE', 'PENDING', 'FAILED'),
			SUBSTR(MD5(RAND()), 1, 20)
        );
	END WHILE;
END //
DELIMITER ;
CALL GenerateAdoption(10);

SELECT * FROM Adoption;

-- Generate AdoptionApplication
DROP PROCEDURE IF EXISTS GenerateAdoptionApplication;
DELIMITER //
CREATE PROCEDURE GenerateAdoptionApplication(IN num INT)
BEGIN
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO AdoptionApplication(customerEmail, applicationDate, petID, applicationStatus, assignedStaffEmail) VALUES (
			(SELECT email FROM Customer ORDER BY RAND() LIMIT 1),
            (CURRENT_DATE + INTERVAL FLOOR((RAND() - 0.5) * 365) DAY),
			(SELECT petID FROM Pet ORDER BY RAND() LIMIT 1),
            ELT(FLOOR(RAND() * 3) + 1, 'APPROVED', 'DENIED', 'IN_PROGRESS'),
            (SELECT email FROM Staff ORDER BY RAND() LIMIT 1)
        );
	END WHILE;
END //
DELIMITER ;
CALL GenerateAdoptionApplication(10);

SELECT * FROM AdoptionApplication;

-- Generate Inventory
DROP PROCEDURE IF EXISTS GenerateInventory;
DELIMITER //
CREATE PROCEDURE GenerateInventory(IN num INT)
BEGIN
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO Inventory(item, amount, expiryDate, purchasePrice) VALUES (
			SUBSTR(MD5(RAND()), 1, 20),
            FLOOR(RAND() * 100) + 1,
            (CURRENT_DATE + INTERVAL FLOOR((RAND() - 0.5) * 365) DAY),
            ROUND((RAND() * 100.0) + 5.0, 2)
        );
	END WHILE;
END //
DELIMITER ;
CALL GenerateInventory(10);

SELECT * FROM Inventory;

-- Generate InventoryPurchase
DROP PROCEDURE IF EXISTS GenerateInventoryPurchase;
DELIMITER //
CREATE PROCEDURE GenerateInventoryPurchase(IN num INT)
BEGIN
	-- Ignore duplicate generated keys
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	END;
    
	WHILE num > 0 DO
		SET num = num - 1;
        INSERT INTO InventoryPurchase(customerEmail, transactionStatus, transactionMethod,
			transactionDate, item, amount) VALUES (
				(SELECT email FROM Customer ORDER BY RAND() LIMIT 1),
                ELT(FLOOR(RAND() * 3) + 1, 'COMPLETE', 'PENDING', 'FAILED'),
                SUBSTR(MD5(RAND()), 1, 20),
                (CURRENT_DATE + INTERVAL FLOOR((RAND() - 0.5) * 365) DAY),
                (SELECT item FROM Inventory ORDER BY RAND() LIMIT 1),
				FLOOR(RAND() * 100) + 1
        );
	END WHILE;
END //
DELIMITER ;
CALL GenerateInventoryPurchase(10);

SELECT * FROM InventoryPurchase;