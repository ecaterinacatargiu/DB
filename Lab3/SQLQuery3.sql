USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[removeYearsFromDogs]    Script Date: 11/20/2019 11:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[removeYearsFromDogs] AS
	ALTER TABLE Dog
	DROP COLUMN Years

