USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[addPrimaryKeyHairColor]    Script Date: 11/20/2019 11:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[addPrimaryKeyHairColor] AS
BEGIN
	CREATE TABLE HairColor ( 
		Hid INT NOT NULL, 
		Colour VARCHAR(20),
		CONSTRAINT dogHairColor PRIMARY KEY (Hid))
	PRINT('UP TO V7 - add Years column to the Dog table')
END
