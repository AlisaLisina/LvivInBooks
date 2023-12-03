USE [LvivInBooks_OLTP]
GO

/****** Object:  View [dbo].[view_length]    Script Date: 03.12.2023 15:59:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_length] -- âèáèðàº àííîòàö³þ äî 100 ñèìâîë³â
AS
  SELECT Title, LEN(Annotation) as length
  FROM BOOKS
  WHERE LEN(Annotation) <=100;
GO

