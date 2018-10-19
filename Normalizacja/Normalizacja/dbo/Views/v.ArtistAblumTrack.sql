CREATE VIEW [dbo].[v.ArtistAblumTrack]
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
	,	[ta].[Title]			AS [AlbumTitle]
	,	[an].[Name]				AS [ArtistName]

	FROM 
			[dbo].[Track]	AS tr
	INNER JOIN	[dbo].[MediaType]	AS mt ON [mt].[MediaTypeId] 	= [tr].[MediaTypeId]
	INNER JOIN	[dbo].[Genre]	AS gr ON [gr].[GenreId]		= [tr].[GenreId]
	INNER JOIN	[dbo].[Album]	AS ta ON ta.AlbumId = tr.AlbumId
	INNER JOIN [dbo].Artist		AS an ON an.ArtistId = tr.AlbumId