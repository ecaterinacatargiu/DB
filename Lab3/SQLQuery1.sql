USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[changeTypeFoodQuantity]    Script Date: 11/20/2019 11:17:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[changeTypeFoodQuantity] AS
	ALTER TABLE Diet
	ALTER COLUMN foodQuantity SMALLINT
	PRINT('UP TO V0 - modify the foodQuantity from int to small int')

