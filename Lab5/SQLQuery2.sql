CREATE DATABASE CollegeDB
GO
USE CollegeDB
GO

CREATE TABLE Student(
	studentId INT PRIMARY KEY,
	studentName VARCHAR(30),
	cnp INT UNIQUE
)

CREATE TABLE Course(
	courseId INT PRIMARY KEY,
	courseName VARCHAR(30),
	val INT
)

CREATE TABLE Grades(
	gradeId INT PRIMARY KEY,
	studentId INT FOREIGN KEY REFERENCES Student(studentId),
	courseId INT FOREIGN KEY REFERENCES Course(courseId),
	val INT
)


SELECT * FROM Course
SELECT * FROM Student
SELECT * FROM Grades

--a

CREATE PROCEDURE insertStudents(@nr INT) AS
BEGIN
	DECLARE @counter INT = 0
	DECLARE @sid INT = 0
	DECLARE @name VARCHAR(30) = 'Name'
	DECLARE @cnp INT = 0
	DECLARE @vname VARCHAR(30)
	WHILE @counter < @nr
		BEGIN
			SET @vname = @name + cast(@counter AS VARCHAR)
			INSERT INTO Student VALUES (@sid, @vname, @cnp)
			SET @sid = @sid + 1
			SET @cnp = @cnp + 1
			SET @counter = @counter+1
		END
END

EXEC insertStudents 200
DELETE Student

CREATE PROCEDURE insertCourses(@nr INT) AS
BEGIN
	DECLARE @cid INT = 0
	DECLARE @name VARCHAR(30) = 'Course Name'
	DECLARE @credits INT = 0
	DECLARE @vname VARCHAR(30)
	WHILE @cid < @nr
		BEGIN
			SET @vname = @name + cast(@cid AS VARCHAR)
			INSERT INTO Course VALUES (@cid, @vname, @cid)
			SET @cid = @cid + 1
		END
END

EXEC insertCourses 200
DELETE Course

CREATE PROCEDURE insertGrades(@nr INT) AS
BEGIN
	DECLARE @gid INT = 0
	DECLARE @sid INT
	declare @cid INT
	DECLARE @val INT
	WHILE @gid < @nr
		BEGIN
			SET @sid = (SELECT TOP 1 s.studentId FROM Student s ORDER BY NEWID())
			SET @cid = (SELECT TOP 1 c.courseId FROM Course c ORDER BY NEWID())
			SET @val = (SELECT FLOOR(rand() * 9 + 1))
			INSERT INTO Grades VALUES (@gid, @sid, @cid, @val)
			SET @gid = @gid + 1
		END
END

EXEC insertGrades 200
DELETE Grades


--a
--clustered index scan
SELECT * FROM Student

--clustered index seek
SELECT s.studentName
FROM Student s
WHERE s.studentId = 177

--nonclustered index scan
SELECT COUNT(*) AS Counter
FROM Student s
GROUP BY s.studentId

--noncustered index seek
SELECT s.studentId
FROM Student s
WHERE s.cnp > 17
----
--key lookup

SELECT * 
FROM Student s
WHERE s.cnp = 17


--b
SELECT c.val
FROM Course c
WHERE c.val>50

CREATE NONCLUSTERED INDEX index_nc_on_credits ON Course(val)
DROP INDEX index_nc_on_credits ON Course

--c
CREATE VIEW viewStudents AS
	SELECT s.studentId, s.studentName AS 'Student Name', g.val AS 'Grade'
	FROM Student s
	INNER JOIN Grades g
	ON s.studentId = g.studentId
	WHERE g.val = 7
GO

EXEC sp_helpindex Student
EXEC sp_helpindex Grades 
EXEC sp_helpindex Course

CREATE NONCLUSTERED INDEX index_nc_on_grades ON Grades(val,studentId)
DROP INDEX index_nc_on_grades ON Grades

SELECT * FROM viewStudents

SELECT * FROM Grades


