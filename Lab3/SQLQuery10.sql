USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[removeYearsFromDogs]    Script Date: 11/20/2019 11:34:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[removeYearsFromDogs] AS
BEGIN
	ALTER TABLE Dog
	DROP COLUMN Years
	PRINT('DOWN TO V1 - remove Years column to the Dog table')
END
