USE [LvivInBooks_OLTP]
GO

/****** Object:  Trigger [dbo].[trriger]    Script Date: 03.12.2023 16:05:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trriger] 
   ON  [dbo].[BOOKS]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

select * from inserted
END
GO

ALTER TABLE [dbo].[BOOKS] ENABLE TRIGGER [trriger]
GO

