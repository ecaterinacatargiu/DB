USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[removeDefaultYears]    Script Date: 11/20/2019 11:37:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[removeDefaultYears] AS
BEGIN
	ALTER TABLE Dog
	DROP CONSTRAINT Years
	PRINT('DOWN TO V2 - remove Years column to the Dog table')
END