USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[addCandidateKeyHairColor]    Script Date: 11/20/2019 11:32:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[addCandidateKeyHairColor] AS
BEGIN
ALTER TABLE HairColor
ADD CONSTRAINT hairColor_ck UNIQUE (HairColor)
PRINT('UP TO V6 - add candidate key to the Dog table')
END