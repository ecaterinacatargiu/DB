USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[addYearsToDogs]    Script Date: 11/20/2019 11:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[addYearsToDogs] AS
	ALTER TABLE Dog
	ADD Years INT
	PRINT('UP TO V1 - add Years column to the Dog table')
