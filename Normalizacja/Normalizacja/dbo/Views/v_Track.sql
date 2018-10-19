CREATE VIEW [dbo].[v_Track]
	AS
	SELECT 
		[tr].[TrackId]
	,	[tr].[Name]				AS [TrackName]
	,	[tr].[AlbumId]
	,	[tr].[Composer]
	,	[tr].[Milliseconds]
	,	[tr].[Bytes]
	,	[tr].[UnitPrice]
	,	[gr].[Name]				AS [GenreName]
	,	[mt].[Name]				AS [MediaTypeName]
	FROM 
			[dbo].[Track]	AS tr
	INNER JOIN	[dbo].[MediaType]	AS mt ON [mt].[MediaTypeId] 	= [tr].[MediaTypeId]
	INNER JOIN	[dbo].[Genre]	AS gr ON [gr].[GenreId]		= [tr].[GenreId]