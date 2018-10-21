
	------------------------------------------------------------------------------

	CREATE VIEW dbo.View11
	WITH SCHEMABINDING
	AS
	SELECT
		dd.[CalendarMonthLabel] 
	,	ds.[StoreName]
	,	dp.[BrandName]
	,	COUNT_BIG(*)								AS [RowCount]	
	,	SUM(f.[SalesQuantity]	)					AS [SUM_SalesQuantity]
	FROM 
				[dbo].[FactSales]		AS f
	INNER JOIN	[dbo].[DimChannel]		AS dc ON [dc].[ChannelKey]		= [f].[channelKey]
	INNER JOIN	[dbo].[DimStore]		AS ds ON [ds].[StoreKey]		= [f].[StoreKey]
	INNER JOIN	[dbo].[DimProduct]		AS dp ON [dp].[ProductKey]		= [f].[ProductKey]
	INNER JOIN	[dbo].[DimDate]			AS dd ON [dd].[Datekey]			= [f].[DateKey]

	WHERE 1=1
	AND dd.[CalendarYear]	=	2009
	GROUP BY
		dd.[CalendarMonthLabel] 
	,	ds.[StoreName]
	,	dp.[BrandName]