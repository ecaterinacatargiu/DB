USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[changeTypeFoodQuantityBack]    Script Date: 11/20/2019 11:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[changeTypeFoodQuantityBack] AS
BEGIN
	ALTER TABLE Diet
	ALTER COLUMN foodQuantity INT
	PRINT('DOWN TO V0 - set foodQuantity back to int')
END
