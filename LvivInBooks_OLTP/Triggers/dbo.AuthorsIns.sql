USE [LvivInBooks_OLTP]
GO

/****** Object:  Trigger [dbo].[AuthorsIns]    Script Date: 03.12.2023 16:03:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[AuthorsIns] 
   ON  [dbo].[AUTHORS]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

	insert into History.[AUTHORS_HISTORY] 
		([ID]
		,[FirstName]
		,[LastName]
		,[Nationality]
		,[UpdatedAt]
		)
    select
		 [ID]
		,[FirstName]
		,[LastName]
		,[Nationality]
		,getdate()
	from inserted
END
GO

ALTER TABLE [dbo].[AUTHORS] ENABLE TRIGGER [AuthorsIns]
GO

