USE [DogShelter]
GO
/****** Object:  StoredProcedure [dbo].[addForeignKeyToDog]    Script Date: 11/20/2019 11:28:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[addForeignKeyToDog] AS
BEGIN
ALTER TABLE Dog
ADD Hid INT 
ALTER TABLE Dog
ADD CONSTRAINT hairColor_fk FOREIGN KEY (Hid) REFERENCES HairColor(Hid)
PRINT('UP TO V5 -set hairColor as foreign key')
END
