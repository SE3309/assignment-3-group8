CREATE DATABASE IF NOT EXISTS Group8DB;
USE Group8DB;

-- Customer
INSERT INTO Customer(email, phoneNo, province, city, street, streetNo) VALUES (
	'jdoe@gmail.com', '555-123-4567', 'British Columbia', 'Vancouver', 'Main St.', '123'
);
INSERT INTO Customer(email, phoneNo, province, city, street, streetNo) VALUES (
	'johnsmith@yahoo.com', '555-456-1234', 'British Columbia', 'Vancouver', 'Main St.', '678'
);
INSERT INTO Customer(email, phoneNo, province, city, street, streetNo) VALUES (
	'bigbob@gmail.com', '555-202-0202', 'Ontario', 'London', 'York St.', '5698'
);
INSERT INTO Customer(email, phoneNo, province, city, street, streetNo) VALUES (
	'alice_k@outlook.com', '555-000-3004', 'Ontario', 'Toronto', 'Queen St.', '343'
);
INSERT INTO Customer(email, phoneNo, province, city, street, streetNo) VALUES (
	'greg_f@outlook.com', '555-398-4017', 'Quebec', 'Montreal', 'Little Cr.', '10'
);

SELECT * FROM Customer;

-- Staff
INSERT INTO Staff(email, fName, lName, jobTitle, phoneNo, salary) VALUES (
	'georgeP345@gmail.com', 'George', 'Pembrook', 'Accountant', '555-046-8901', '56000.00'
);
INSERT INTO Staff(email, fName, lName, jobTitle, phoneNo, salary) VALUES (
	'sarahL890@gmail.com', 'Sarah', 'Lambton', 'Vet Tech', '555-867-4982', '68000.00'
);
INSERT INTO Staff(email, fName, lName, jobTitle, phoneNo, salary) VALUES (
	'larsM557@yahoo.com', 'Lars', 'McIntosh', 'Receptionist', '555-709-1256', '47000.00'
);
INSERT INTO Staff(email, fName, lName, jobTitle, phoneNo, salary) VALUES (
	'stephC298@outlook.com', 'Stephanie', 'Cartwright', 'Vet Tech', '555-398-0091', '72000.00'
);
INSERT INTO Staff(email, fName, lName, jobTitle, phoneNo, salary) VALUES (
	'rogerF120@gmail.com', 'Roger', 'Fredrick', 'Receptionist', '555-999-1212', '59000.00'
);

SELECT * FROM Staff;

-- Animal
INSERT INTO Animal(breed, species) VALUES (
	'Golden Retriever', 'Dog'
);
INSERT INTO Animal(breed, species) VALUES (
	'Orange', 'Cat'
);
INSERT INTO Animal(breed, species) VALUES (
	'Poodle', 'Dog'
);
INSERT INTO Animal(breed, species) VALUES (
	'Tabby', 'Cat'
);
INSERT INTO Animal(breed, species) VALUES (
	'Dachshund', 'Dog'
);

SELECT * FROM Animal;

-- Veterinarian
INSERT INTO Veterinarian(email, phoneNo, phoneExtension, province, city, street, streetNo, breed, species) VALUES (
	'r_penrose@hotmail.com', '555-090-7865', '3', 'Ontario', 'St. Thomas', 'Main St.', '90', 'Poodle', 'Dog'
);
INSERT INTO Veterinarian(email, phoneNo, phoneExtension, province, city, street, streetNo, breed, species) VALUES (
	't_mcarthur@hotmail.com', '555-080-1123', '9', 'Saskatchewan', 'Saskatoon', 'High St.', '870', 'Poodle', 'Dog'
);
INSERT INTO Veterinarian(email, phoneNo, phoneExtension, province, city, street, streetNo, breed, species) VALUES (
	'l_frank@hotmail.com', '555-010-2009', '1', 'Ontario', 'Toronto', 'University Ave.', '410', 'Tabby', 'Cat'
);
INSERT INTO Veterinarian(email, phoneNo, phoneExtension, province, city, street, streetNo, breed, species) VALUES (
	'o_black@gmail.com', '555-030-7005', '5', 'British Columbia', 'Vancouver', 'Bay St.', '163', 'Orange', 'Cat'
);
INSERT INTO Veterinarian(email, phoneNo, phoneExtension, province, city, street, streetNo, breed, species) VALUES (
	't_mann@outlook.com', '555-070-5151', '2', 'Ontario', 'Toronto', 'Grand St.', '9760', 'Dachshund', 'Dog'
);

SELECT * FROM Veterinarian;

-- Pet
INSERT INTO Pet(petName, breed, dateOfBirth, weight, adoptionStatus, healthStatus, vetEmail, adoptionPrice) VALUES (
	'Fluffy', 'Poodle', '2020-11-18', '23.220', 'AVAILABLE', 'HEALTHY', 't_mcarthur@hotmail.com', '900.00'
);
INSERT INTO Pet(petName, breed, dateOfBirth, weight, adoptionStatus, healthStatus, vetEmail, adoptionPrice) VALUES (
	'Sparky', 'Dachshund', '2017-08-20', '10.397', 'ADOPTED', 'Spinal injury', 't_mann@outlook.com', '700.00'
);
INSERT INTO Pet(petName, breed, dateOfBirth, weight, adoptionStatus, healthStatus, vetEmail, adoptionPrice) VALUES (
	'Mittens', 'Orange', '2022-01-03', '7.996', 'AVAILABLE', 'HEALTHY', 'o_black@gmail.com', '650.00'
);
INSERT INTO Pet(petName, breed, dateOfBirth, weight, adoptionStatus, healthStatus, vetEmail, adoptionPrice) VALUES (
	'Rover', 'Poodle', '2019-10-26', '25.604', 'ADOPTED', 'HEALTHY', 't_mcarthur@hotmail.com', '950.00'
);
INSERT INTO Pet(petName, breed, dateOfBirth, weight, adoptionStatus, healthStatus, vetEmail, adoptionPrice) VALUES (
	'Whiskers', 'Tabby', '2018-04-28', '6.550', 'ON_HOLD', 'Ringworm', 'l_frank@hotmail.com', '600.00'
);

SELECT * FROM Pet;

-- PetNicknames
INSERT INTO PetNicknames(petID, nickname) VALUES (
	'3', 'Boo-boo'
);
INSERT INTO PetNicknames(petID, nickname) VALUES (
	1, 'Pumpkin'
);
INSERT INTO PetNicknames(petID, nickname) VALUES (
	4, 'Wawa'
);
INSERT INTO PetNicknames(petID, nickname) VALUES (
	3, 'Spoopy'
);
INSERT INTO PetNicknames(petID, nickname) VALUES (
	2, 'Little guy'
);

SELECT * FROM PetNicknames;

-- Adoption
INSERT INTO Adoption(adoptedPet, adoptingClient, adoptionDate, transactionStatus, transactionMethod) VALUES (
	'2', 'bigbob@gmail.com', '2020-04-02', 'COMPLETE', 'Mastercard'
);
INSERT INTO Adoption(adoptedPet, adoptingClient, adoptionDate, transactionStatus, transactionMethod) VALUES (
	'1', 'bigbob@gmail.com', '2024-06-12', 'COMPLETE', 'Mastercard'
);
INSERT INTO Adoption(adoptedPet, adoptingClient, adoptionDate, transactionStatus, transactionMethod) VALUES (
	'4', 'johnsmith@yahoo.com', '2021-10-19', 'COMPLETE', 'Cheque'
);
INSERT INTO Adoption(adoptedPet, adoptingClient, adoptionDate, transactionStatus, transactionMethod) VALUES (
	'5', 'alice_k@outlook.com', '2025-11-19', 'PENDING', 'Visa'
);
INSERT INTO Adoption(adoptedPet, adoptingClient, adoptionDate, transactionStatus, transactionMethod) VALUES (
	'3', 'greg_f@outlook.com', '2024-01-30', 'COMPLETE', 'Visa'
);

SELECT * FROM Adoption;

-- Adoption Application
INSERT INTO AdoptionApplication(customerEmail, applicationDate, petID, applicationStatus, assignedStaffEmail) VALUES (
	'bigbob@gmail.com', '2020-03-29', '2', 'APPROVED', 'larsM557@yahoo.com'
);
INSERT INTO AdoptionApplication(customerEmail, applicationDate, petID, applicationStatus, assignedStaffEmail) VALUES (
	'bigbob@gmail.com', '2024-06-05', '1', 'APPROVED', 'larsM557@yahoo.com'
);
INSERT INTO AdoptionApplication(customerEmail, applicationDate, petID, applicationStatus, assignedStaffEmail) VALUES (
	'johnsmith@yahoo.com', '2021-10-10', '4', 'APPROVED', 'rogerF120@gmail.com'
);
INSERT INTO AdoptionApplication(customerEmail, applicationDate, petID, applicationStatus, assignedStaffEmail) VALUES (
	'alice_k@outlook.com', '2025-11-11', '5', 'IN_PROGRESS', 'rogerF120@gmail.com'
);
INSERT INTO AdoptionApplication(customerEmail, applicationDate, petID, applicationStatus, assignedStaffEmail) VALUES (
	'greg_f@outlook.com', '2024-01-24', '3', 'APPROVED', 'rogerF120@gmail.com'
);

SELECT * FROM AdoptionApplication;

-- Inventory
INSERT INTO Inventory(item, amount, expiryDate, purchasePrice) VALUES (
	'Dog kibble', '400', '2026-04-15', '20.99'
);
INSERT INTO Inventory(item, amount, expiryDate, purchasePrice) VALUES (
	'Dry cat food', '200', '2026-03-10', '21.99'
);
INSERT INTO Inventory(item, amount, expiryDate, purchasePrice) VALUES (
	'Wet cat food', '50', '2025-12-22', '24.99'
);
INSERT INTO Inventory(item, amount, purchasePrice) VALUES (
	'Dog beds', '200', '45.99'
);
INSERT INTO Inventory(item, amount, purchasePrice) VALUES (
	'Poop bags', '6000', '0.10'
);

SELECT * FROM Inventory;

-- InventoryPurchase
INSERT INTO InventoryPurchase(customerEmail, transactionStatus, transactionMethod, transactionDate, item, amount) VALUES (
	'bigbob@gmail.com', 'COMPLETE', 'Mastercard', '2020-04-02', 'Dog beds', '1'
);
INSERT INTO InventoryPurchase(customerEmail, transactionStatus, transactionMethod, transactionDate, item, amount) VALUES (
	'bigbob@gmail.com', 'COMPLETE', 'Mastercard', '2020-04-02', 'Dog kibble', '5'
);
INSERT INTO InventoryPurchase(customerEmail, transactionStatus, transactionMethod, transactionDate, item, amount) VALUES (
	'bigbob@gmail.com', 'COMPLETE', 'Mastercard', '2024-06-12', 'Dog beds', '1'
);
INSERT INTO InventoryPurchase(customerEmail, transactionStatus, transactionMethod, transactionDate, item, amount) VALUES (
	'greg_f@outlook.com', 'COMPLETE', 'Visa', '2024-01-30', 'Wet cat food', '3'
);
INSERT INTO InventoryPurchase(customerEmail, transactionStatus, transactionMethod, transactionDate, item, amount) VALUES (
	'alice_k@outlook.com', 'COMPLETE', 'Visa', '2025-11-19', 'Dry cat food', '4'
);

SELECT * FROM InventoryPurchase;