--here we create the views we need
USE DogShelter
GO

--view1: all the available vaccines
CREATE VIEW View1 AS
	SELECT * FROM Vaccine
GO

--view2: dogs with their vaccines
CREATE VIEW View2 AS
	SELECT d.dogName, v.vaccineName
	FROM Dog d
	INNER JOIN Health h ON h.dogId = d.dogId 
	INNER JOIN Vaccine v ON v.vaccineId = h.vaccineId
GO

--view3:
CREATE VIEW View3 AS
	SELECT DISTINCT d.dogName, COUNT(h.dogId) AS VaccineCounter
	FROM Dog d, Health H
	WHERE (d.dogId=h.dogId)
	GROUP BY d.dogName
GO


CREATE PROCEDURE selectView @viewId INT
AS
BEGIN
	DECLARE @viewName varchar(20) = (SELECT v.Name FROM Views v WHERE v.ViewID = @viewId)

	IF @viewName = 'view1'
		BEGIN
			SELECT * FROM View1
		END
	ELSE 
		IF @viewName = 'view2'
			BEGIN 
				SELECT * FROM View2
			END
		ELSE 
			BEGIN 
				SELECT * FROM View3
			END
END

EXEC selectView 3

--------------INSERTING/DELETING VACCINES------------

CREATE PROCEDURE insertVaccines(@nr INT) AS
BEGIN
	DECLARE @counter INT = 0
	DECLARE @name VARCHAR(30) = 'Vaccine'
	DECLARE @vaccineId INT = 11
	DECLARE @vname VARCHAR(30)
	DECLARE @vid VARCHAR(30)
	WHILE @counter < @nr
		BEGIN
			SET @vname = @name + cast(@counter AS VARCHAR)
			SET @vid = @vaccineId + cast(@counter AS INT)
			INSERT INTO Vaccine VALUES (@vid, @vname)
			SET @counter = @counter+1
		END
END
GO

EXEC insertVaccines 100
SELECT * FROM Vaccine
EXEC deleteVaccines


--------------INSERTING/DELETING HEALTH INFO------------
CREATE PROCEDURE deleteVaccines AS
BEGIN
	DELETE FROM Vaccine
	WHERE Vaccine.vaccineId>10
END
GO

---
CREATE PROCEDURE insertHealthInfos(@nr INT) AS
BEGIN
	DECLARE @counter INT = 0
	DECLARE @date VARCHAR(30) = 'date'
	DECLARE @dogId INT = 11
	DECLARE @vaccineId INT = 11
	DECLARE @vaccineDate VARCHAR(30)
	DECLARE @dogIdd INT
	DECLARE @vaccineIdd INT
	declare @vaccineDatee VARCHAR(30)
	WHILE @counter < @nr
		BEGIN
			SET @vaccineDatee = @date + cast(@counter AS VARCHAR)
			SET @dogIdd = @dogId + cast(@counter AS INT)
			SET @vaccineIdd = @vaccineId + cast(@counter AS INT)
			INSERT INTO Health VALUES (@dogIdd, @vaccineIdd, @vaccineDatee)
			SET @counter = @counter+1
		END
END
GO

EXEC insertHealthInfos 100
SELECT * FROM Health
EXEC deleteHealthInfos

CREATE PROCEDURE deleteHealthInfos AS
BEGIN
	DELETE FROM Health
	WHERE Health.dogId > 10
END
GO

--------------INSERTING/DELETING DOGS------------
SELECT * FROM Dog

CREATE PROCEDURE insertDogs(@nr INT) AS
BEGIN
	DECLARE @counter INT = 0
	DECLARE @dogId INT = 11
	DECLARE @dogName VARCHAR(20) = 'Name'
	DECLARE @dogBirthday VARCHAR(30) = 'Date'
	DECLARE @breedId INT = 1
	DECLARE @staffId INT = 1
	DECLARE @addoptionId INT = 1
	DECLARE @years INT = 2
	DECLARE @yearsOfTraining INT = 1
	DECLARE @dogIdd INT
	DECLARE @dogNamee VARCHAR(20)
	WHILE @counter < @nr
		BEGIN
			SET @dogIdd = @dogId + cast(@counter AS INT)
			SET @dogNamee = @dogName + cast(@counter AS VARCHAR)
			INSERT INTO Dog VALUES (@dogIdd, @dogNamee, @dogBirthday, @breedId, @staffId, @addoptionId, @years, @yearsOfTraining)
			SET @counter = @counter+1
		END
END
GO

CREATE PROCEDURE deleteDogs AS
BEGIN
	DELETE FROM Dog
	WHERE Dog.dogId > 10
END
GO

EXEC insertDogs 100
SELECT * FROM Dog
EXEC deleteDogs


SELECT * FROM Tables
INSERT INTO Tables(Name) VALUES ('Vaccine'), ('Health'), ('Dog')

SELECT * FROM Views
INSERT INTO Views(Name) VALUES ('View1'), ('View2'), ('View3')

SELECT * FROM Tests
INSERT INTO Tests(Name) VALUES ('insertVaccine'), ('insertHealth'), ('insertDog'), ('removeVaccine'), ('removeHealthInfos'), ('removeDog'), ('selectViews')

SELECT * FROM TestViews
INSERT INTO TestViews(TestID, ViewID) VALUES (7,1),(7,2),(7,3)

SELECT * FROM TestTables
INSERT INTO TestTables(TestID, TableID, NoOfRows, Position) VALUES (1,1,1000,1), (2,2,1000,2), (3,3,1000,3), (4,1,1000,4), (5,2,1000,5), (6,3,1000,6)


CREATE PROCEDURE MainProc AS
BEGIN
	DECLARE @startTimeGlobal DATETIME
	SET @startTimeGlobal = getdate()

	DECLARE @startDeleteHealthTime DATETIME
	SET @startDeleteHealthTime = getdate()
	EXEC deleteHealthInfos
	DECLARE @endDeleteHealthTime DATETIME
	SET @endDeleteHealthTime = getdate()

	DECLARE @startDeleteVaccineTime DATETIME
	SET @startDeleteVaccineTime = getdate()
	EXEC deleteVaccines
	DECLARE @endDeleteVaccineTime DATETIME
	SET @endDeleteVaccineTime = getdate()

	DECLARE @startDeleteDogTime DATETIME
	SET @startDeleteDogTime = getdate()
	EXEC deleteDogs
	DECLARE @endDeleteDogTime DATETIME
	SET @endDeleteDogTime = getdate()

	DECLARE @startInsertVaccineTime DATETIME
	SET @startInsertVaccineTime= getdate()
	EXEC insertVaccines 100
	DECLARE @endInsertVaccineTime DATETIME
	SET @endInsertVaccineTime = getdate()

	DECLARE @startInsertDogTime DATETIME
	SET @startInsertDogTime= getdate()
	EXEC insertDogs 100
	DECLARE @endInsertDogTime DATETIME
	SET @endInsertDogTime = getdate()

	DECLARE @startInsertHealthTime DATETIME
	SET @startInsertHealthTime= getdate()
	EXEC insertHealthInfos 100
	DECLARE @endInsertHealthTime DATETIME
	SET @endInsertHealthTime = getdate()

	DECLARE @view1TableStart DATETIME
	SET @view1TableStart = getdate()
	EXEC selectView 1
	DECLARE @view1TableEnd DATETIME
	SET @view1TableEnd = getdate()

	DECLARE @view2TableStart DATETIME
	SET @view2TableStart = getdate()
	EXEC selectView 2
	DECLARE @view2TableEnd DATETIME
	SET @view2TableEnd = getdate()

	DECLARE @view3TableStart DATETIME
	SET @view3TableStart = getdate()
	EXEC selectView 3
	DECLARE @view3TableEnd DATETIME
	SET @view3TableEnd = getdate()


	DECLARE @endTimeGlobal DATETIME
	SET @endTimeGlobal= getdate()
	
	DECLARE @description VARCHAR(50)
	SET @description = 'Test Run'+CONVERT(varchar(7), (SELECT MAX(TestRunID) from TestRuns))

	INSERT INTO TestRuns(Description, StartAt, EndAt) VALUES (@description, @startTimeGlobal, @endTimeGlobal)
	
	DECLARE @lastTestRunId INT
	SET @lastTestRunId = (SELECT MAX(TestRunId) from TestRuns)

	INSERT INTO TestRunTables VALUES (@lastTestRunId, 1, @startDeleteHealthTime, @endInsertHealthTime)
	INSERT INTO TestRunTables VALUES (@lastTestRunId, 2, @startDeleteVaccineTime, @endInsertVaccineTime)
	INSERT INTO TestRunTables VALUES (@lastTestRunId, 3, @startDeleteDogTime, @endInsertDogTime)

	INSERT INTO TestRunViews VALUES (@lastTestRunId, 1, @view1TableStart, @view1TableEnd)
	INSERT INTO TestRunViews VALUES (@lastTestRunId, 2, @view2TableStart, @view2TableEnd)
	INSERT INTO TestRunViews VALUES (@lastTestRunId, 3, @view3TableStart, @view3TableEnd)

END
GO

SELECT * FROM Tables
SELECT * FROM Views

EXEC MainProc

SELECT * FROM TestRuns
SELECT * FROM TestRunTables
SELECT * FROM TestRunViews

DELETE TestRuns
DELETE TestRunTables
DELETE TestRunViews
