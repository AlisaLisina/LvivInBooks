USE [LvivInBooks_OLTP]
GO

/****** Object:  Trigger [dbo].[AuthorsUpd]    Script Date: 03.12.2023 16:04:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[AuthorsUpd] 
   ON  [dbo].[AUTHORS]
   AFTER Update,delete
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
		 d.[ID]
		,isnull(i.[FirstName]  ,d.[FirstName]  ) 
		,isnull(i.[LastName]   ,d.[LastName]   )
		,isnull(i.[Nationality],d.[Nationality])
		,getdate()
	from deleted d
	left join inserted i on i.id = d.Id
END
GO

ALTER TABLE [dbo].[AUTHORS] ENABLE TRIGGER [AuthorsUpd]
GO

