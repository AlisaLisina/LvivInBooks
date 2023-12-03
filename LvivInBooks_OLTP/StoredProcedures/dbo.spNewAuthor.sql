USE [LvivInBooks_OLTP]
GO

/****** Object:  StoredProcedure [dbo].[spNewAuthor]    Script Date: 03.12.2023 16:07:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*CREATE PROC spNewAuthor
@FirstName nvarchar (50),
@LastName nvarchar (50)
AS
  IF EXIST (SELECT FirstName, LastName 
            FROM AUTHORS
            WHERE FirstName = @FirstName
              AND   LastName = @LastName)
            PRINT N'Òàêèé àâòîð âæå º'
  ELSE 
  BEGIN 
   INSERT INTO AUTHORS
   VALUES (@FirstName, @LastName)
   PRINT N'Àâòîð óñï³øíî äîäàíèé äî áàçè'
  END*/
						-- a procedure, which insert data about author and if it 
CREATE PROC [dbo].[spNewAuthor]
@FirstName nvarchar (50),
@LastName nvarchar (50)
AS

BEGIN 
          
     INSERT INTO AUTHORS (FirstName, LastName)
     VALUES (@FirstName, @LastName)
END
GO

