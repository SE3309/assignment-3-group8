CREATE TABLE Customer(
	email		VARCHAR(200) NOT NULL UNIQUE,
    phoneNo		VARCHAR(20) NOT NULL UNIQUE,
    province	VARCHAR(25) CHECK(province IN ('British Columbia', 'Alberta',
						'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec',
						'Nova Scotia', 'Newfoundland and Labrador',
						'Prince Edward Island', 'New Brunswick', 'Yukon',
						'Nunavut', 'Northwest Territories')),
    city		VARCHAR(100),
    street		VARCHAR(100),
    streetNo	VARCHAR(50),
    PRIMARY KEY(email)
);

DESCRIBE Customer;

CREATE TABLE Staff(
	email		VARCHAR(200) NOT NULL UNIQUE,
    fName		VARCHAR(100) NOT NULL,
    lName		VARCHAR(100) NOT NULL,
    jobTitle	VARCHAR(100) NOT NULL DEFAULT 'Employee',
    phoneNo		VARCHAR(20) NOT NULL UNIQUE,
    salary		DECIMAL(10, 2) NOT NULL CHECK(salary > 0),
    PRIMARY KEY(email)
);
    
DESCRIBE Staff;

CREATE TABLE Animal(
	breed		VARCHAR(100) NOT NULL UNIQUE,
    species		VARCHAR(100) NOT NULL,
    PRIMARY KEY(breed),
    UNIQUE INDEX(breed, species)
);
    
DESCRIBE Animal;

CREATE TABLE Veterinarian(
	email			VARCHAR(200) NOT NULL UNIQUE,
    phoneNo			VARCHAR(20) NOT NULL,
    phoneExtension	VARCHAR(10) NOT NULL,
    province		VARCHAR(25) CHECK(province IN ('British Columbia', 'Alberta',
							'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec',
                            'Nova Scotia', 'Newfoundland and Labrador',
                            'Prince Edward Island', 'New Brunswick', 'Yukon',
                            'Nunavut', 'Northwest Territories')),
    city			VARCHAR(100),
    street			VARCHAR(100),
    streetNo		VARCHAR(50),
    breed			VARCHAR(100) NOT NULL,
    species			VARCHAR(100) NOT NULL,
    PRIMARY KEY(email),
    UNIQUE(phoneNo, phoneExtension),
    FOREIGN KEY (breed, species) REFERENCES Animal(breed, species)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

DESCRIBE Veterinarian;

CREATE TABLE Pet(
	petID			INT NOT NULL UNIQUE AUTO_INCREMENT,
    petName			VARCHAR(200) NOT NULL,
    breed			VARCHAR(100) NOT NULL,
    dateOfBirth		DATE,
    weight			DECIMAL(5, 3) NOT NULL CHECK(weight > 0),
    adoptionStatus	VARCHAR(100) CONSTRAINT ValidAdoptionStatus
		CHECK(adoptionStatus IN ('AVAILABLE', 'ON_HOLD', 'INELIGIBLE', 'ADOPTED')),
	healthStatus	VARCHAR(300),
    vetEmail		VARCHAR(200),
    adoptionPrice	DECIMAL(6, 2) NOT NULL CHECK(adoptionPrice > 0),
    PRIMARY KEY(petID),
    FOREIGN KEY(breed) REFERENCES Animal(breed)
		ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY(vetEmail) REFERENCES Veterinarian(email)
		ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE Pet;

CREATE TABLE PetNicknames(
	petID		INT NOT NULL,
    nickname	VARCHAR(300) NOT NULL,
    PRIMARY KEY(petID, nickname),
    FOREIGN KEY(petID) REFERENCES Pet(petID)
		ON DELETE CASCADE ON UPDATE CASCADE
);

DESCRIBE PetNicknames;

CREATE TABLE Adoption(
	adoptedPet			INT NOT NULL,
    adoptingClient		VARCHAR(200) NOT NULL,
    adoptionDate		DATE NOT NULL,
    transactionID		INT NOT NULL UNIQUE AUTO_INCREMENT,
    transactionStatus	VARCHAR(100) CHECK(transactionStatus IN ('COMPLETE', 
							'PENDING', 'FAILED')),
	transactionMethod	VARCHAR(200) NOT NULL,
    PRIMARY KEY(adoptedPet, adoptingClient, adoptionDate),
    FOREIGN KEY(adoptedPet) REFERENCES Pet(petID)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(adoptingClient) REFERENCES Customer(email)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

DESCRIBE Adoption;

CREATE TABLE AdoptionApplication(
	customerEmail		VARCHAR(200) NOT NULL,
    applicationDate		DATE NOT NULL,
    petID				INT NOT NULL,
    applicationStatus	VARCHAR(100) CONSTRAINT ValidApplicationStatus
		CHECK(applicationStatus IN ('APPROVED', 'DENIED', 'IN_PROGRESS')),
	assignedStaffEmail	VARCHAR(200) NOT NULL,
    PRIMARY KEY(customerEmail, applicationDate, petID),
    FOREIGN KEY(customerEmail) REFERENCES Customer(email)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(petID) REFERENCES Pet(petID)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(assignedStaffEmail) REFERENCES Staff(email)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

DESCRIBE AdoptionApplication;

CREATE TABLE Inventory(
	item			VARCHAR(300) NOT NULL UNIQUE,
    amount			INT NOT NULL CHECK(amount >= 0),
    expiryDate		DATE,
    purchasePrice	DECIMAL(6, 2) NOT NULL CHECK(purchasePrice > 0),
    PRIMARY KEY(item)
);

DESCRIBE Inventory;

CREATE TABLE InventoryPurchase(
	purchaseID			INT NOT NULL UNIQUE AUTO_INCREMENT,
    customerEmail		VARCHAR(200) NOT NULL,
    transactionStatus	VARCHAR(100) CHECK(transactionStatus IN ('COMPLETE', 
							'PENDING', 'FAILED')),
	transactionMethod	VARCHAR(200) NOT NULL,
    transactionDate		DATE NOT NULL,
    item				VARCHAR(300) NOT NULL,
    amount				INT DEFAULT 1 CHECK(amount >= 1),
    PRIMARY KEY(purchaseID),
    FOREIGN KEY(customerEmail) REFERENCES Customer(email)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(item) REFERENCES Inventory(item)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

DESCRIBE InventoryPurchase;