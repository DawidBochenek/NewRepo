
	CREATE VIEW dbo.View1
	AS
	SELECT
		dd.[FullDateLabel] 
	,	dc.[ChannelName]
	,	ds.[StoreName]
	,	dp.[ProductName]
	,	dr.[PromotionName]
	,	dx.[CurrencyName]
	,	f.[UnitCost]
	,	f.[UnitPrice]
	,	f.[SalesQuantity]
	FROM 
				[dbo].[FactSales]		AS f
	INNER JOIN	[dbo].[DimChannel]		AS dc ON [dc].[ChannelKey]		= [f].[channelKey]
	INNER JOIN	[dbo].[DimStore]		AS ds ON [ds].[StoreKey]		= [f].[StoreKey]
	INNER JOIN	[dbo].[DimProduct]		AS dp ON [dp].[ProductKey]		= [f].[ProductKey]
	INNER JOIN	[dbo].[DimPromotion]	AS dr ON [dr].[PromotionKey]	= [f].[PromotionKey]
	INNER JOIN	[dbo].[DimCurrency]		AS dx ON [dx].[CurrencyKey]		= [f].[CurrencyKey]
	INNER JOIN	[dbo].[DimDate]			AS dd ON [dd].[Datekey]			= [f].[DateKey]