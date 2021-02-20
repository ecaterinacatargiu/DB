USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[setDefaultYears]    Script Date: 11/20/2019 11:26:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[setDefaultYears] AS
	ALTER TABLE Dog
	ADD CONSTRAINT zero
	DEFAULT 0 FOR Years
	PRINT('UP TO V3 - add 0 as default in Years column to the Dog table')

