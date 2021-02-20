CREATE DATABASE DogShelter
GO 
USE DogShelter
GO


CREATE TABLE Breed(
breedId INT PRIMARY KEY,
breedName VARCHAR(30) NOT NULL
)

CREATE TABLE Staff(
staffID INT PRIMARY KEY,
staffName VARCHAR(20) NOT NULL
)

CREATE TABLE Adoption(
adoptionId INT PRIMARY KEY,
person VARCHAR(30) NOT NULL,
adoptionDate VARCHAR(30) 
)

CREATE TABLE Dog(
dogId INT PRIMARY KEY,
dogName VARCHAR(20) NOT NULL,
dogBirthday VARCHAR(30) NOT NULL,
breedId INT FOREIGN KEY REFERENCES Breed(breedId),
staffID INT FOREIGN KEY REFERENCES Staff(staffId),
addoptionId INT FOREIGN KEY REFERENCES Adoption(adoptionId),
)

CREATE TABLE Donation(
donationId INT PRIMARY KEY,
donationDate VARCHAR(20) NOT NULL
)

CREATE TABLE Donor(
dogId INT FOREIGN KEY REFERENCES Dog(dogID),
donationId INT FOREIGN KEY REFERENCES Donation(donationId),
donorName VARCHAR(20), 
CONSTRAINT donorId PRIMARY KEY(dogId, donationId)
)


CREATE TABLE Food(
foodId INT PRIMARY KEY,
foodName VARCHAR(30) NOT NULL
)
SELECT * FROM Food

CREATE TABLE Diet(
dogId INT FOREIGN KEY REFERENCES Dog(dogID),
foodId INT FOREIGN KEY REFERENCES Food(foodId),
foodQuantity INT,
CONSTRAINT eatId PRIMARY KEY(dogId, foodId)
)
SELECT * FROM Diet

CREATE TABLE Vaccine(
vaccineId INT PRIMARY KEY,
vaccineName VARCHAR(30) NOT NULL
)

CREATE TABLE Health(
dogId INT FOREIGN KEY REFERENCES Dog(dogID),
vaccineId INT FOREIGN KEY REFERENCES Vaccine(vaccineId),
healthDate VARCHAR(15) NOT NULL,
CONSTRAINT healthId PRIMARY KEY(dogId, vaccineId)
)


INSERT INTO Breed(breedId, breedName) VALUES(1, 'Corgy')
INSERT INTO Breed(breedId, breedName) VALUES(2, 'Labrador')
INSERT INTO Breed(breedId, breedName) VALUES(3, 'Golden Retriever')
INSERT INTO Breed(breedId, breedName) VALUES(4, 'Bichon')
INSERT INTO Breed(breedId, breedName) VALUES(5, 'Chuaua')
INSERT INTO Breed(breedId, breedName) VALUES(6, 'Husky')
INSERT INTO Breed(breedId, breedName) VALUES(7, 'Pomeranian')
INSERT INTO Breed(breedId, breedName) VALUES(8, 'rasa1')
INSERT INTO Breed(breedId, breedName) VALUES(9, 'rasa2')
INSERT INTO Breed(breedId, breedName) VALUES(10, 'rasa3')
INSERT INTO Breed(breedId, breedName) VALUES(11, 'rasa4')
SELECT * FROM Breed

INSERT INTO Food(foodId, foodName) VALUES(1, 'Pedigree')
INSERT INTO Food(foodId, foodName) VALUES(2, 'American Journey')
INSERT INTO Food(foodId, foodName) VALUES(3, 'Cesar')
INSERT INTO Food(foodId, foodName) VALUES(4, 'Advance')
INSERT INTO Food(foodId, foodName) VALUES(5, 'Instinct')
SELECT * FROM Food

INSERT INTO Staff(staffID, staffName) VALUES (1, 'Bogdan Cristina')
INSERT INTO Staff(staffID, staffName) VALUES (2, 'Candet Andrei')
INSERT INTO Staff(staffID, staffName) VALUES (3, 'Breje Mihai')
INSERT INTO Staff(staffID, staffName) VALUES (4, 'Catargiu Ecaterina')
INSERT INTO Staff(staffID, staffName) VALUES (5, 'Costiug Iuliana')
INSERT INTO Staff(staffID, staffName) VALUES (6, 'Catargiu Andreea')
INSERT INTO Staff(staffID, staffName) VALUES (7, 'Fulop Anita')
INSERT INTO Staff(staffID, staffName) VALUES (8, 'Vasincu Otilia')
SELECT * FROM Staff

INSERT INTO Vaccine(vaccineId, vaccineName) VALUES (1, 'Coronaviroza')
INSERT INTO Vaccine(vaccineId, vaccineName) VALUES (2, 'Parainfluenta')
INSERT INTO Vaccine(vaccineId, vaccineName) VALUES (3, 'Leptospiroza')
INSERT INTO Vaccine(vaccineId, vaccineName) VALUES (4, 'Parvoviroza')
INSERT INTO Vaccine(vaccineId, vaccineName) VALUES (5, 'Hepatita infectioasa')
INSERT INTO Vaccine(vaccineId, vaccineName) VALUES (6, 'Hepatita infectioasa2')
SELECT * FROM Vaccine

INSERT INTO Donation(donationId, donationDate) VALUES (1, '20.01.2019')
INSERT INTO Donation(donationId, donationDate) VALUES (2, '14.03.2019')
INSERT INTO Donation(donationId, donationDate) VALUES (3, '21.07.2019')
INSERT INTO Donation(donationId, donationDate) VALUES (4, '23.08.2019')
INSERT INTO Donation(donationId, donationDate) VALUES (5, '10.09.2019')
SELECT * FROM Donation

INSERT INTO Adoption(adoptionId, person, adoptionDate) VALUES (1, 'Tocaciu Valeria', '01.10.2019')
INSERT INTO Adoption(adoptionId, person, adoptionDate) VALUES (2, 'Chitimus Mara', '13.09.2019')
INSERT INTO Adoption(adoptionId, person, adoptionDate) VALUES (3, 'Tiron Ioana', '06.08.2019')
INSERT INTO Adoption(adoptionId, person, adoptionDate) VALUES (4, 'Donisan Alexandra', '16.08.2019')
INSERT INTO Adoption(adoptionId, person, adoptionDate) VALUES (5, 'Corlaci Andreea', '17.01.2019')
INSERT INTO Adoption(adoptionId, person, adoptionDate) VALUES (6, 'Cati', '06.08.2019')
SELECT * FROM Adoption

INSERT INTO Donor(dogId, donationId, donorName) VALUES (1,1,'Deac Beatrice')
INSERT INTO Donor(dogId, donationId, donorName) VALUES (2,2,'Denes Ioana')
INSERT INTO Donor(dogId, donationId, donorName) VALUES (3,3,'Ciocean Bogdan')
INSERT INTO Donor(dogId, donationId, donorName) VALUES (4,4,'Cirtiu Dani')
INSERT INTO Donor(dogId, donationId, donorName) VALUES (5,5,'Pascovici Raluca')
SELECT * FROM Donor

INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (1,1,2)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (2,3,2)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (3,4,1)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (4,2,3)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (1,5,4)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (2,3,3)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (6,3,1)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (5,2,4)
INSERT INTO Diet(dogId, foodId, foodQuantity) VALUES (7,3,5)
SELECT * FROM Diet

INSERT INTO Health(dogId,vaccineId,healthDate) VALUEs (1,2,'20.10.2019')
INSERT INTO Health(dogId,vaccineId,healthDate) VALUEs (2,1,'20.10.2019')
INSERT INTO Health(dogId,vaccineId,healthDate) VALUEs (4,1,'21.10.2019')
INSERT INTO Health(dogId,vaccineId,healthDate) VALUEs (5,5,'29.10.2019')
INSERT INTO Health(dogId,vaccineId,healthDate) VALUEs (6,3,'25.10.2019')
INSERT INTO Health(dogId,vaccineId,healthDate) VALUEs (7,4,'29.10.2019')
INSERT INTO Health(dogId,vaccineId,healthDate) VALUEs (8,2,'25.10.2019')
SELECT * FROM Health

INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (1,'Richi','17.01.1998',1,1,1)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (2,'Tony','17.01.1998',2,2,2)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (3,'Bruno','17.01.1998',3,3,3)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (4,'Sushi','17.01.1998',4,4,4)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (5,'Rolando','17.01.1998',5,5,5)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (6,'Anastasia','17.01.1998',6,6,3)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (7,'Iulia','17.01.1998',7,7,2)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (8,'Roly','17.01.1998',8,8,1)
INSERT INTO Dog(dogId,dogName,dogBirthday,breedId,staffID, addoptionId) VALUES (9,'nEWnAME','17.01.1998',1,3,1)
SELECT * FROM Dog

UPDATE Breed 
SET breedName= 'RASA NECUNOSCUTA'
WHERE (breedId>=9) AND (breedName NOT LIKE 'rasa3')
SELECT * FROM Breed

UPDATE Dog
SET dogName='Alfredo',dogBirthday='20.04.2019'
WHERE (dogId BETWEEN 1 AND 3) AND (dogName = 'Mickyyy')
SELECT * FROM Dog

UPDATE Vaccine
SET vaccineName = 'a new vaccine'
WHERE vaccineName LIKE 'a%'
SELECT * FROM Vaccine 

DELETE FROM Dog
WHERE (dogId>7)


DELETE FROM Breed
WHERE breedName IN ('Pechinez', 'rasa3' )
SELECT * FROM Breed

UPDATE Breed
SET breedName='Husky'
WHERE breedId=6

UPDATE Breed
SET breedName='Terrier'
WHERE breedId=7

UPDATE Breed
SET breedName='Yorkshire'
WHERE breedId=8

UPDATE Breed
SET breedName='rasa3'
WHERE breedId=9
SELECT * FROM Breed


--A. 2 queries with the union operation; use UNION [ALL] and OR;

SELECT dogId, dogName, 'Dog' AS typo
FROM Dog
UNION
SELECT staffID, staffName, 'Staff' AS typo
FROM Staff

SELECT dogName FROM Dog
WHERE staffID=1 OR staffID=3

SELECT dogName FROM dog 
WHERE staffId=1
UNION
SELECT dogName FROM Dog
WHERE staffId=3

SELECT dogId, dogName, 'Dog' AS typo
FROM Dog
UNION ALL
SELECT foodId, foodName, 'Food' AS typo
FROM Food

--B: 2 queries with the intersection operation; use INTERSECT and IN;
--all the staff that have the id = 1 and take care of a dog with breed = Corgy

SELECT d.staffID
FROM Dog d
WHERE (breedId=1)
INTERSECT
SELECT s.staffID
FROM Staff s
WHERE (staffID=1)

--all dogs that have the dogname in Anastasia, Rolando, Mihai
SELECT d.dogId, d.dogName
FROM Dog d
WHERE d.dogName IN ('Anastasia', 'Rolando', 'Mihai')

--C: 2 queries with the difference operation; use EXCEPT and NOT IN;
--all dogs that eat the food name .. royal canin  but does not have a certain vaccine done

SELECT diet.dogId
FROM Diet diet
WHERE diet.foodId=1
EXCEPT
SELECT health.dogId
FROM Health health
WHERE health.vaccineId = 3

--all dogs except the ones that eat american journey

SELECT d.dogId, d.dogName
FROM Dog d
WHERE D.dogId NOT IN (
	SELECT d.dogId
	FROM Diet d
	WHERE d.foodId = 2)

SELECT * FROM Diet
select * from Dog
SELECT * FROM Vaccine

--D: 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN; one query will join at least 3 tables, while another one will join at least two many-to-many relationships;
--all dogs that took the vaccine for hepatita infectioasa

SELECT d.dogId,d.dogName
FROM Dog d
INNER JOIN Health h ON h.dogId = d.dogId 
INNER JOIN Vaccine v ON v.vaccineId = h.vaccineId
WHERE v.vaccineId=5

--all dogs that eat a certain food : Pedigree
SELECT d.dogId, d.dogName, diet.foodId, food.foodName
FROM Dog d
LEFT JOIN Diet diet ON diet.dogId = d.dogId
LEFT JOIN Food food ON food.foodId = diet.foodId
--WHERE food.foodId <> 1
ORDER BY d.dogId

--all donations that were given to a certain dog
SELECT donation.donationId, donation.donationDate
FROM Donation donation
LEFT JOIN Donor donor ON donor.donationId=donation.donationId
LEFT JOIN Dog d ON d.dogId = donor.dogId
WHERE donation.donationId > 3

SELECT * FROM Dog
SELECT * FROM Donor

--all dogs that received a certain vaccine and that eat a certainn type of food : American Journey
SELECT DISTINCT d.dogName as 'DogName', health.vaccineId AS 'Vaccine', food.foodName AS 'Food'
FROM Dog d
FULL JOIN Diet diet ON diet.dogId=d.dogId
FULL JOIN Food food ON food.foodId=diet.foodId
FULL JOIN Health health ON health.dogId=d.dogId
FULL JOIN Vaccine vaccine ON vaccine.vaccineId=health.vaccineId
--WHERE (food.foodId=2) AND (vaccine.vaccineId=1)

SELECT * FROM Dog
SELECT * FROM Health
SELECT * FROM Diet

--E: 2 queries using the IN operator to introduce a subquery in the WHERE clause; in at least one query, the subquery should include a subquery in its own WHERE clause;
-- dogs whhose staffids are between 2 and 5

SELECT DISTINCT d.dogName as DogName
FROM Dog d
WHERE d.staffID IN (
	SELECT staff.staffID
	FROM Staff staff
	WHERE staff.staffID BETWEEN 2 AND 5)

SELECT * FROM Dog
SELECT * FROM Staff

-- dogs that received a vaccine whose name start with letter C
SELECT * FROM Vaccine
SELECT * FROM Dog
SELECT * FROM Health

SELECT d.dogName AS 'Dog Name'
FROM Dog d
WHERE d.dogId IN(
	SELECT health.dogId
	FROM Health health
	WHERE health.vaccineId IN (
		SELECT vaccine.vaccineId
		FROM Vaccine vaccine
		WHERE vaccine.vaccineName LIKE 'C%'))

---F: 2 queries using the EXISTS operator to introduce a subquery in the WHERE clause; 
--all dogs that eat more than 2 kg of food

SELECT * FROM Diet
SELECT * FROM Dog

SELECT d.dogName
FROM Dog d
WHERE EXISTS (
	SELECT diet.dogId
	FROM Diet diet
	WHERE (diet.dogId=d.dogId) AND (diet.foodQuantity >2))


--all dogs that received a donation from a certain donor
SELECT * FROM Dog
SELECT * FROM Donor

SELECT d.dogName
FROM Dog d
WHERE EXISTS (
	SELECT donor.dogId
	FROM Donor donor
	WHERE (donor.dogId=d.dogId) AND (donor.donorName = 'Deac Beatrice'))


--G: 2 queries with a subquery in the FROM clause;          
--all adoption  that which have been adopted on a certain date
SELECT addoptedOn.adoptionId AS 'Adoption ID', addoptedOn.person AS 'Person who adopted'
FROM (
	SELECT * 
	FROM Adoption adoption
	WHERE adoption.adoptionDate='06.08.2019') AS addoptedOn
ORDER BY addoptedOn.adoptionId DESC

--all staff whose name starts with C
SELECT TOP 3 staffNamee.staffID, staffNamee.staffName
FROM ( 
	SELECT *
	FROM Staff staff
	WHERE staff.staffName LIKE 'C%') AS staffNamee
ORDER BY staffNamee.staffName DESC

--H: 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 2 of the latter will also have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX; 
--find the number of dogs that eat  2kg of food
SELECT * FROM Diet
SELECT DISTINCT d.dogId, COUNT(d.dogId) AS FoodCounter
FROM Dog d, Diet diet
WHERE (d.dogId=diet.dogId) AND diet.foodQuantity=2
GROUP BY d.dogId
HAVING d.dogId>=1

--find the average food that the dogs with a certain id eat
SELECT d.dogId, AVG(diet.foodQuantity) as AverageFood
FROM Dog d, Diet diet
WHERE(d.dogId=diet.dogId) and d.dogId>4
GROUP BY d.dogId
ORDER BY d.dogId DESC

--find the average qunatity od food eaten by the dogs with digid between 2 and 7
SELECT d.dogId, AVG(diet.foodQuantity) as 'Average Quantity'
FROM Dog d, Diet diet
WHERE (d.dogId=diet.dogId)
GROUP BY d.dogId
HAVING d.dogId BETWEEN 4 AND 7

--select the food  that is eaten by at least 2 dogs
SELECT diet.foodId, AVG(diet.foodQuantity) AS 'Food quantity'
FROM Diet diet
GROUP BY diet.foodId
HAVING 1 < ( SELECT COUNT(*)
			 FROM Diet diet2
			 WHERE diet.foodId=diet2.foodId)

SELECT * FROM Diet
SELECT * FROM Food

--get the maximum food quantity consumed by dogs whose names start with M
SELECT d.dogName, MIN(diet.foodQuantity) as 'Min food'
FROM Diet diet, Dog d
WHERE (diet.dogId=d.dogId)
GROUP BY d.dogName
HAVING d.dogName LIKE 'M%'


--I:  4 queries using ANY and ALL to introduce a subquery in the WHERE clause; 2 of them should be rewritten with aggregation operators, while the other 2 should also be expressed with [NOT] IN. 
--find a dog that eats less than a dog with dog that a dog that eats another
SELECT diet.dogId, diet.foodQuantity
FROM Diet diet
WHERE diet.foodQuantity < ALL ( SELECT diet2.foodQuantity
								FROM Diet diet2
								WHERE diet2.dogId=2)

SELECT diet.dogId, diet.foodQuantity
FROM Diet diet
WHERE diet.foodQuantity < (SELECT MIN(diet2.foodQuantity)
						   FROM Diet diet2
						   WHERE diet2.foodQuantity=2)

--find the dogId and dogQuntity of the dogs that ate more that any dogs with the dogId=2
SELECT diet.dogId, diet.foodQuantity
FROM Diet diet
WHERE diet.foodQuantity > ANY ( SELECT diet2.foodQuantity
								FROM Diet diet2
								WHERE  diet2.foodQuantity=2)

SELECT diet.dogId, diet.foodQuantity
FROM Diet diet
WHERE diet.foodQuantity > ( SELECT MAX(diet2.foodQuantity)
							FROM Diet diet2
							WHERE diet2.foodQuantity=2)
						
--find a dog that eats a certain type of food
SELECT d.dogId, d.dogName
FROM Dog d
WHERE d.dogId = ANY ( SELECT diet.dogId			
					  FROM Diet diet
					  WHERE diet.foodId =3)

SELECT * FROM Diet
SELECT * FROM Dog

--find a dog that has a vaccine on a certain date
SELECT d.dogName
FROM Dog d
WHERE d.dogId = ANY ( SELECT h.dogId
					  FROM Health h
					  WHERE h.healthDate='20.10.2019')

SELECT d.dogName
FROM Dog d
WHERE d.dogId IN ( SELECT h.dogId
				   FROM Health h
				   WHERE h.healthDate = '20.10.2019')

--the vaccine names that the dog with dogId = 2 does not receive
SELECT v.vaccineName
FROM Vaccine v
WHERE v.vaccineId <> ALL ( SELECT h.vaccineId
						   FROM Health h
						   WHERE h.dogId=2)

SELECT v.vaccineName
FROM Vaccine v
WHERE v.vaccineId NOT IN ( SELECT h.vaccineId
						   FROM Health h
						   WHERE h.dogId=2)

SELECT * FROM Dog

--Lab3

--a. modify the type of a column;
GO
CREATE OR ALTER PROCEDURE AS changeBreedIDToSmallInt AS
ALTER TABLE Dog
ALTER COLUMN breedId SMALLINT
GO
CREATE OR ALTER PROCEDURE AS changeBreedIdToInt AS
ALTER TABLE Dog
ALTER COLUMN breedId INT
GO



