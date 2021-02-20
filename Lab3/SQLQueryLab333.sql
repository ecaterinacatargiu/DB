--Lab3
GO	
USE DogShelter


--a. modify the type of a column;
GO
CREATE PROCEDURE up_to_v_1 AS
BEGIN
	ALTER TABLE Diet
	ALTER COLUMN foodQuantity VARCHAR(20)
	PRINT('UP TO V1 - change the foodQuantity to small int')
END

EXEC up_to_v_1

GO
CREATE PROCEDURE down_to_v_0 AS
BEGIN
	ALTER TABLE Diet
	ALTER COLUMN foodQuantity INT
	PRINT('DOWN TO V0 - change foodQuantity back to int')
END

EXEC down_to_v_0


--b. add / remove a column;
GO 
CREATE PROCEDURE up_to_v_2 AS
BEGIN
	ALTER TABLE Dog
	ADD YearsOfTraining INT
	PRINT('UP TO V2- add YearsOfTraining column to the Dog table')
END

EXEC up_to_v_2
SELECT * FROM Dog
;
GO
CREATE PROCEDURE down_to_v_1 AS
BEGIN
	ALTER TABLE Dog
	DROP COLUMN YearsOfTraining
	PRINT('DOWN TO V1- remove YearsOfTraining column from the Dog table')
END
EXEC down_to_v_1
SELECT * FROM Dog

--c. add / remove a DEFAULT constraint;
GO
CREATE PROCEDURE up_to_v_3 AS
BEGIN
	ALTER TABLE Diet
	ADD CONSTRAINT zeros
	DEFAULT 0 FOR foodQuantity
	PRINT('UP TO V3 - add default 0 to foodQuantity column to the Diet table')
END

EXEC up_to_v_3
;
GO
CREATE PROCEDURE down_to_v_2 AS
BEGIN
	ALTER TABLE Diet
	DROP CONSTRAINT zeros
	PRINT('DOWN TO V2 - remove default 0 from foodQuantity  column from the Diet table')
END
EXEC down_to_v_2


--d. add / remove a primary key;
GO
CREATE PROCEDURE up_to_v_4 AS
BEGIN
	CREATE TABLE hairColor ( 
		Hid INT NOT NULL, 
		Colour VARCHAR(20),
		CONSTRAINT dogHairColor_pk PRIMARY KEY (Hid))
	PRINT('UP TO V4- add primary key haircolor to Dog')
END

EXEC up_to_v_4
SELECT * FROM hairColor
;
GO
CREATE PROCEDURE down_to_v_3 AS
BEGIN
	ALTER TABLE hairColor
	DROP CONSTRAINT dogHairColor_pk
	DROP TABLE hairColor
	PRINT('DOWN TO V3 - remove HairColor primaryKey from the Dog table')
END

EXEC down_to_v_3


--e. add / remove a candidate key;
GO
CREATE PROCEDURE up_to_v_5 AS
BEGIN
	ALTER TABLE hairColor
	ADD CONSTRAINT hairColor_ck UNIQUE (Hid)
	PRINT('UP TO V5 - add candidate key hairColor to Dog')
END
EXEC up_to_v_5
;
GO
CREATE PROCEDURE down_to_v_4 AS
BEGIN
	ALTER TABLE hairColor
	DROP CONSTRAINT hairColor_ck
	PRINT('DOWN TO V4 - remove candidate key hairColor from haiColor')
END

EXEC down_to_v_4

--f. add / remove a foreign key;
GO
CREATE PROCEDURE up_to_v_6 AS
BEGIN
	ALTER TABLE Dog
	ADD Hid INT 
	ALTER TABLE Dog
	ADD CONSTRAINT hairColor_fk FOREIGN KEY (Hid) REFERENCES hairColor(Hid)
	PRINT('UP TO V6 - add foreign key hairColor to Dog')
END

EXEC up_to_v_6
SELECT * FROM Dog
;
GO
CREATE PROCEDURE down_to_v_5 AS
BEGIN
	ALTER TABLE Dog
	DROP CONSTRAINT hairColor_fk
	ALTER TABLE Dog
	DROP COLUMN Hid
	PRINT('DOWN TO V5 - remove foreign key hairColor from Dog')
END

EXEC down_to_v_5

--g.create / remove a table
GO
CREATE PROCEDURE up_to_v_7 AS
BEGIN
	CREATE TABLE FavoriteToy(
		FTid INT PRIMARY KEY IDENTITY,
		Tname VARCHAR(20))
	PRINT('UP TO V7 - add favoriteToy table')
END
EXEC up_to_v_7
SELECT * FROM FavoriteToy

;
GO
CREATE PROCEDURE down_to_v_6 AS
BEGIN
	DROP TABLE FavoriteToy
	PRINT('DOWN TO V6 - remove favoriteToy table')
END

EXEC down_to_v_6

--Create a new table that holds the current version of the database schema. For simplicity, the version is assumed to be an integer number.
CREATE TABLE Version(versionId INT PRIMARY KEY)
INSERT INTO Version values(0);
SELECT * FROM Version

TRUNCATE TABLE Version



--Write another stored procedure that receives as a parameter a version number and brings the database to that version.
CREATE TABLE allVersions(
	version INT PRIMARY KEY,
	sp VARCHAR(50),
	rsp VARCHAR(50))

SELECT * FROM allVersions

INSERT INTO allVersions(version, sp, rsp)
VALUES (1, 'changeTypeFoodQuantity2','changeTypeFoodQuantityBack'),
	   (2, 'addYearsToDogs','removeYearsFromDogs'),
	   (3,'setDefaultYears1','removeDefaultYears1'),
	   (4,'addPrimaryKeyHairColor','dropPrimaryKeyHairColor'),
	   (5,'addCandidateKeyHairColor','removeCandidateKeyHairColor'),
	   (6,'addForeignKeyToDog','removeForeignKeyFromDog'),
	   (7,'createFavoriteToyTable','dromFavoriteToyTable')

INSERT INTO allVersions(version, sp, rsp) VALUES(0,NULL,NULL)
SELECT * FROM allVersions

GO
CREATE PROCEDURE main(@newVersion varchar(30)) AS
BEGIN

	DECLARE @nextStep varchar(30)
	DECLARE @currentVersion INT
	SET @currentVersion = (SELECT versionId FROM Version)

	if ISNUMERIC(@newVersion) != 1
	BEGIN
		PRINT('Not a number')
		RETURN 1 
	END

	SET @newVersion = cast(@newVersion as INT)

	WHILE @currentVersion < @newVersion
	BEGIN
		SET @currentVersion = @currentVersion + 1
		SET @nextStep = 'up_to_v_' + convert(varchar(3), @currentVersion)
		EXEC @nextStep
	END

	WHILE @currentVersion > @newVersion
	BEGIN
		SET @currentVersion = @currentVersion - 1
		SET @nextStep = 'down_to_v_' + convert(varchar(3), @currentVersion)
		EXEC @nextStep
	END

	truncate table Version
	INSERT INTO Version values(@newVersion)
END

EXEC main '2'
SELECT * FROM Version

SELECT * FROM Dog



