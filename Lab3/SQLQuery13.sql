USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[dromFavoriteToyTable]    Script Date: 11/20/2019 11:37:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[dromFavoriteToyTable] AS
BEGIN
DROP TABLE FavoriteToy
PRINT('DOWN TO V3 - remove Years column to the Dog table')
END
