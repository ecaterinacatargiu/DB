USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[createFavoriteToyTable]    Script Date: 11/20/2019 11:27:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[createFavoriteToyTable] AS
CREATE TABLE FavoriteToy(
	FTid INT PRIMARY KEY IDENTITY,
	Tname VARCHAR(20))
	PRINT('UP TO V4 - create a favoriteToy table')

