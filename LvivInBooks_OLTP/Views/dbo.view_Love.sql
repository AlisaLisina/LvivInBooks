USE [LvivInBooks_OLTP]
GO

/****** Object:  View [dbo].[view_Love]    Script Date: 03.12.2023 15:59:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[view_Love] 
AS 
SELECT * FROM BOOKS
WHERE Annotation LIKE N'%Кохання%';
GO

