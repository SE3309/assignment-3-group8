USE Group8DB;

-- Update command #1: Approve in-progress adoption applications for a specific staff
UPDATE AdoptionApplication
SET applicationStatus = 'APPROVED'
WHERE assignedStaffEmail = 'rogerF120@gmail.com'
  AND applicationStatus = 'IN_PROGRESS';

-- Insert command #2: Add a default nickname for pets that don't have any nicknames yet
INSERT INTO PetNicknames (petID, nickname)
SELECT p.petID, CONCAT(p.petName, '_Buddy')
FROM Pet p
WHERE NOT EXISTS (
    SELECT 1 
    FROM PetNicknames n 
    WHERE n.petID = p.petID
);

-- Delete command #3: Remove tiny ineligible pets whose only adoption attempts failed
DELETE FROM AdoptionApplication
WHERE petID IN (
    SELECT petID FROM (
        SELECT p.petID
        FROM Pet p
        JOIN AdoptionApplication a
            ON p.petID = a.petID
        GROUP BY p.petID, p.weight, p.adoptionStatus
        HAVING p.adoptionStatus = 'INELIGIBLE'
           AND p.weight < 1.0
           AND COUNT(*) = SUM(a.applicationStatus = 'DENIED')
    ) AS sub
);

