USE Group8DB;
INSERT INTO Customer (email, phoneNo, province, city, street, streetNo)
VALUES (
    'TBob@example.com',
    '1234567890',
    'Ontario',
    'Toronto',
    'Huron Street',
    '160'
);
SELECT * FROM Customer;
INSERT INTO Customer (email, phoneNo, province, city)
VALUES (
    'LiverKing@example.com',
    '4169876543',
    'Quebec',
    'Montreal'
);
SELECT * FROM Customer;

INSERT INTO Customer (email, phoneNo, province, city, street, streetNo)
SELECT 
    CONCAT('copy_of_', email),
    CONCAT('000', RIGHT(phoneNo, 8)),
    province,
    city,
    'Huron Street',
    '99'
FROM Customer
WHERE email = 'LiverKing@example.com';
SELECT * FROM Customer;
