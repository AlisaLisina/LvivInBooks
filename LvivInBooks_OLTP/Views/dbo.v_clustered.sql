USE [LvivInBooks_OLTP]
GO

/****** Object:  View [dbo].[v_clustered]    Script Date: 03.12.2023 15:58:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_clustered] WITH SCHEMABINDING  
AS
  SELECT ID, Title, PubHouse, Language, Annotation
  FROM dbo.BOOKS
  WHERE Annotation LIKE N'%історія%'
GO

