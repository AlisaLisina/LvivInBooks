USE [LvivInBooks_OLTP]
GO

/****** Object:  StoredProcedure [dbo].[spTopAuthors]    Script Date: 03.12.2023 16:07:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spTopAuthors] 
AS 
  SELECT TOP 3 WITH TIES *
  FROM AUTHORS 
  WHERE AUTHORS.ID IN (
                       SELECT TOP 3 WITH TIES ARef
                       FROM AUTHORS_BOOKS
                       GROUP BY ARef
                       ORDER BY COUNT(BRef) DESC)
  ORDER BY AUTHORS.LastName;
GO

