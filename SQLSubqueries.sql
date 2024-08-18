
CREATE DATABASE IF NOT EXISTS RealEstateDB1;
USE RealEstateDB1;


CREATE TABLE IF NOT EXISTS Agents (
    AgentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS PropertyTypes (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50) -- E.g., Single Family, Condo, Apartment, etc.
);


CREATE TABLE IF NOT EXISTS Properties (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    ListingPrice DECIMAL(10, 2),
    ListingDate DATE,
    TypeID INT,
    AgentID INT,
    FOREIGN KEY (TypeID) REFERENCES PropertyTypes(TypeID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS PropertyDetails (
    PropertyID INT,
    Bedrooms INT,
    Bathrooms DECIMAL(3, 1),
    SquareFeet INT,
    YearBuilt INT,
    ParkingSpaces INT,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS PropertyStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    StatusName VARCHAR(50) -- E.g., Available, Under Contract, Sold
);


CREATE TABLE IF NOT EXISTS PropertyAmenities (
    AmenityID INT AUTO_INCREMENT PRIMARY KEY,
    AmenityName VARCHAR(100) -- E.g., Pool, Gym, Garage, etc.
);

CREATE TABLE IF NOT EXISTS PropertyAmenityAssignments (
    PropertyID INT,
    AmenityID INT,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (AmenityID) REFERENCES PropertyAmenities(AmenityID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    ClientID INT,
    AgentID INT,
    SalePrice DECIMAL(10, 2),
    SaleDate DATE,
    StatusID INT,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (StatusID) REFERENCES PropertyStatus(StatusID) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);


INSERT INTO Agents (FirstName, LastName, Email, PhoneNumber) VALUES
('John', 'Doe', 'johndoe@example.com', '555-1234'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678'),
('Jim', 'Brown', 'jimbrown@example.com', '555-8765'),
('Sara', 'White', 'sarawhite@example.com', '555-4321'),
('Paul', 'Green', 'paulgreen@example.com', '555-6789'),
('Lisa', 'Blue', 'lisablue@example.com', '555-9988');  

INSERT INTO Clients (FirstName, LastName, Email, PhoneNumber) VALUES
('Alice', 'Johnson', 'alicej@example.com', '555-2345'),
('Bob', 'Williams', 'bobw@example.com', '555-3456'),
('Charlie', 'Davis', 'charlied@example.com', '555-4567'),
('Emily', 'Clark', 'emilyc@example.com', '555-5678'),
('Frank', 'Miller', 'frankm@example.com', '555-6789'),
('Nancy', 'Turner', 'nancyturner@example.com', '555-7890'); 


INSERT INTO PropertyTypes (TypeName) VALUES
('Single Family'),
('Condo'),
('Townhouse'),
('Apartment'),
('Duplex');

INSERT INTO PropertyStatus (StatusName) VALUES
('Available'),
('Under Contract'),
('Sold');


INSERT INTO PropertyAmenities (AmenityName) VALUES
('Pool'),
('Gym'),
('Garage'),
('Backyard'),
('Fireplace');


INSERT INTO Properties (Address, City, State, ZipCode, ListingPrice, ListingDate, TypeID, AgentID) VALUES
('123 Main St', 'Los Angeles', 'CA', '90001', 450000.00, '2023-01-15', 1, 1),
('456 Elm St', 'San Francisco', 'CA', '94102', 800000.00, '2023-02-10', 2, 2),
('789 Oak St', 'New York', 'NY', '10001', 650000.00, '2023-03-05', 3, 3),
('101 Pine St', 'Chicago', 'IL', '60601', 500000.00, '2023-04-12', 4, 4),
('202 Birch St', 'Miami', 'FL', '33101', 300000.00, '2023-05-20', 1, 5),
('303 Cedar St', 'Dallas', 'TX', '75201', 700000.00, '2023-06-18', 2, 1),
('404 Maple St', 'Seattle', 'WA', '98101', 900000.00, '2023-07-22', 3, 2),
('505 Walnut St', 'Denver', 'CO', '80201', 350000.00, '2023-08-15', 4, 3),
('606 Cherry St', 'Boston', 'MA', '02101', 750000.00, '2023-09-10', 5, 4),
('707 Aspen St', 'Las Vegas', 'NV', '89101', 400000.00, '2023-10-05', 1, 5),
('909 Ash St', 'Portland', 'OR', '97035', 500000.00, '2024-01-01', 4, 3),
('333 Oak Ave', 'San Diego', 'CA', '92101', 600000.00, '2024-02-01', 2, 2);


INSERT INTO PropertyDetails (PropertyID, Bedrooms, Bathrooms, SquareFeet, YearBuilt, ParkingSpaces) VALUES
(1, 3, 2.5, 2000, 1990, 2),
(2, 2, 1.5, 1500, 1985, 1),
(3, 4, 3.0, 2500, 2005, 2),
(4, 3, 2.0, 1800, 1995, 2),
(5, 2, 1.0, 1200, 2000, 1),
(6, 3, 2.5, 2200, 2010, 2),
(7, 4, 3.5, 3000, 2015, 3),
(8, 2, 2.0, 1600, 2003, 1),
(9, 3, 2.5, 2400, 2018, 2),
(10, 2, 1.5, 1400, 2007, 1),
(11, 3, 2.5, 2000, 1992, 2),
(12, 4, 3.0, 2500, 2003, 2);


INSERT INTO PropertyAmenityAssignments (PropertyID, AmenityID) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 2),
(3, 5),
(4, 3),
(4, 4),
(5, 2),
(6, 1),
(6, 5),
(7, 3),
(8, 1),
(8, 4),
(9, 1),
(9, 2),
(10, 3),
(11, 3), 
(12, 2); 


INSERT INTO Transactions (PropertyID, ClientID, AgentID, SalePrice, SaleDate, StatusID) VALUES
(1, 1, 1, 440000.00, '2023-04-01', 3), 
(2, 2, 2, 790000.00, '2023-04-15', 3),  
(3, 3, 3, 640000.00, '2023-05-10', 3),  
(4, 4, 4, 490000.00, '2023-06-01', 3), 
(5, 5, 5, 290000.00, '2023-07-01', 3),  
(6, NULL, 1, NULL, NULL, 1),           
(7, 2, 2, 880000.00, NULL, 2),          
(8, NULL, 3, NULL, NULL, 1),            
(9, NULL, 4, NULL, NULL, 2),            
(10, 5, 5, 390000.00, '2023-12-01', 3); 

/* Ticket 2 */
/*Task 1 -Find the average listing price of all properties. */
SELECT * FROM PROPERTIES;

SELECT avg 
FROM
((SELECT AVG(listingPrice) AS avg
FROM properties) AS table1);


/* Task 2 - Retrieve the address of the property with the lowest listing price*/
SELECT address
FROM properties
WHERE listingPrice =
(SELECT MIN(listingPrice) FROM properties);

SELECT MIN(listingPrice) FROM properties;

select * from propertyTypes;

select * from properties where address = '202 Birch St';

/*Task 3 : List the addresses of all properties where the listing price is above the average listing price*/
SELECT address 
FROM properties
WHERE listingPrice > 
		(SELECT AVG(listingPrice) FROM properties);
        
SELECT AVG(listingPrice) FROM properties;

SELECT address 
FROM properties
WHERE listingPrice > 575000.00000;

/*Task 4 : Find the names of agents who have listed at least one property with a listing price above $500,000.*/
SELECT firstName, lastName
FROM agents
WHERE agentId in
(SELECT distinct agentId 
FROM properties 
WHERE listingPrice > 500000);
/* Task 5 : Retrieve the address and number of bedrooms for the properties with the highest number of bedrooms.*/
SELECT p.address, pd.bedrooms
FROM properties p, propertyDetails pd
WHERE p.propertyId = pd.propertyId
	  AND pd.bedrooms = (SELECT MAX(bedrooms) FROM propertyDetails);

/*Task 6 : Find the average number of bedrooms across all properties.*/
SELECT AvgBedRooms
FROM 
(SELECT AVG(bedrooms) AS AvgBedRooms FROM propertydetails) as AvgTable;

/* Task 7 : Retrieve the details of the property with the oldest construction date*/
SELECT distinct p.* 
FROM properties p, propertyDetails pd
WHERE p.propertyId = pd.propertyId
AND pd.yearBuilt = (SELECT MIN(yearBuilt) FROM propertyDetails);

SELECT MIN(yearBuilt) FROM propertyDetails;

/*Task 8 : List all properties where the number of bathrooms is greater than the average number of bathrooms.*/
SELECT distinct propertyId
FROM propertyDetails
WHERE bathrooms > (
	SELECT AVG(bathrooms) FROM propertyDetails
);

select propertyId from propertyDetails;
/*Task 9 : Find the total number of properties that have a 'Pool' as an amenity.*/
SELECT COUNT(*)
FROM (
	SELECT DISTINCT * FROM propertyamenityassignments WHERE amenityId IN
    (
		SELECT amenityId FROM propertyamenities 
        WHERE amenityName = "Pool"
    )
) AS propertyWithPool;
SELECT * FROM propertyamenities;
SELECT * FROM propertyamenityassignments WHERE amenityId = 1;

SELECT DISTINCT * FROM propertyamenityassignments WHERE amenityId IN
    (
		SELECT amenityId FROM propertyamenities 
        WHERE amenityName = "Pool"
    );

/*Task 10 : List the names of all amenities that are assigned to more than 3 properties*/

SELECT amenityName 
FROM propertyAmenities
WHERE amenityId IN 
(SELECT amenityId FROM propertyAmenityAssignments
GROUP BY amenityId HAVING COUNT(*) > 3
);

SELECT amenityId, COUNT(*) FROM propertyAmenityAssignments
GROUP BY amenityId ;

select * from propertyAmenityAssignments where amenityId = 1;
/*Task 11: Retrieve all properties that have more bedrooms than the average number of bedrooms
 and a listing price above the average listing price.*/
 
 #To retrieve records with bedrooms > avg no of bedrooms
 SELECT * 
 FROM properties 
 WHERE propertyId IN 
 (SELECT propertyId 
 FROM propertyDetails
 WHERE bedrooms > (SELECT AVG(bedrooms) FROM propertyDetails)); 
 
 #To retrieve records with listingPrice > avg listing price
 SELECT * 
 FROM properties 
 WHERE listingPrice > (SELECT AVG(listingPrice) FROM properties);
 
 #Combining above two queries
 SELECT * 
 FROM properties
 WHERE propertyId IN(
	SELECT propertyId 
	FROM propertyDetails
	WHERE bedrooms > (SELECT AVG(bedrooms) FROM propertyDetails)    
 ) AND (listingPrice > (SELECT AVG(listingPrice) FROM properties));
 
 /*Task 12 : Find the names of clients who have purchased properties with more than 3 bedrooms and a sale price above $500,000.*/
#To get client details who have purchased with more than 3 bedrooms
SELECT * 
FROM clients
WHERE clientId IN
	(SELECT clientId 
    FROM transactions 
    WHERE propertyId in (SELECT DISTINCT propertyId FROM propertyDetails WHERE bedrooms > 3));
    
    SELECT DISTINCT propertyId FROM propertyDetails WHERE bedrooms > 3;

	#To get records with sale price above $500,000
    SELECT DISTINCT clientId
    FROM transactions
    WHERE salePrice > 500000;
    
    #Combining the above 2 queries
    SELECT * 
    FROM clients 
    WHERE clientId IN
		(SELECT DISTINCT clientId 
		FROM transactions 
		WHERE propertyId in (SELECT DISTINCT propertyId FROM propertyDetails WHERE bedrooms > 3)
		AND salePrice > 500000	
		);
