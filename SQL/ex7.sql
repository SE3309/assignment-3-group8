USE Group8DB;

DROP VIEW IF EXISTS StaffInProgressApplications;

CREATE VIEW StaffInProgressApplications AS
SELECT 
    aa.customerEmail,
    aa.applicationDate,
    aa.petID,
    p.petName,
    p.breed,
    a.species,
    aa.assignedStaffEmail,
    s.fullName AS staffFullName,
    s.jobTitle AS staffJobTitle,
    s.phoneNo AS staffPhone
FROM AdoptionApplication aa, Staff s, Pet p, Animal a
Where aa.assignedStaffEmail = s.email
AND aa.petID = p.petID
AND p.breed = a.breed
AND aa.applicationStatus = 'IN_PROGRESS';

DESCRIBE StaffInProgressApplications;

SELECT * FROM StaffInProgressApplications
WHERE assignedStaffEmail = 'rogerF120@gmail.com';

SELECT * FROM StaffInProgressApplications;

DROP VIEW IF EXISTS CustomerAdoptionSummary;

CREATE VIEW CustomerAdoptionSummary AS
SELECT 
    c.email,
    c.phoneNo,
    c.address,
    COUNT(ad.adoptedPet) AS totalAdoptions,
    SUM(p.adoptionPrice) AS totalSpent,
    AVG(p.adoptionPrice) AS avgAdoptionPrice,
    MAX(ad.adoptionDate) AS lastAdoptionDate
FROM Customer c
LEFT JOIN Adoption ad ON c.email = ad.adoptingClient
LEFT JOIN Pet p ON ad.adoptedPet = p.petID
WHERE ad.transactionStatus = 'COMPLETE'
GROUP BY c.email, c.phoneNo, c.address;

DESCRIBE CustomerAdoptionSummary;

SELECT * FROM CustomerAdoptionSummary
ORDER BY totalAdoptions DESC;