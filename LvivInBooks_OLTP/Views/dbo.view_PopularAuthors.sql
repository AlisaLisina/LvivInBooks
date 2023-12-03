USE [LvivInBooks_OLTP]
GO

/****** Object:  View [dbo].[view_PopularAuthors]    Script Date: 03.12.2023 15:59:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_PopularAuthors] -- âèáèðàº íàéïðîäóêòèâí³øîãî àâòîðà (õ3 )
AS 
with aa as (
	SELECT	a.FirstName + N' ' + a.LastName as Name,
			avg(b.Rating) over( partition by a.Id) t,
			b.Title,
			b.Rating,
			b.id as bId,
			a.id as aId
	FROM dbo.AUTHORS a
	join dbo.AUTHORS_BOOKS ab on a.ID = ab.[ARef]
	join dbo.BOOKS b on ab.BRef = b.ID
)
select distinct top 10 a.Name,a.t, k.Title
from aa as a
cross apply (
	select top 3 b.Title, b.rating 
	from aa as b
	where b.rating > 4 
	and t > 4 
	and b.aId = a.aId
	order by b.rating
	for json auto
) k(Title)
ORDER BY a.t	
GO

