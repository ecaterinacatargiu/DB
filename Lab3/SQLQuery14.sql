USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[removeForeignKeyFromDog]    Script Date: 11/20/2019 11:38:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[removeForeignKeyFromDog] AS
BEGIN
ALTER TABLE Dog
DROP CONSTRAINT hairColor_fk
ALTER TABLE Dog
DROP COLUMN Hid
PRINT('DOWN TO V4 - remove foreign key HairColor from the Dog table')
END