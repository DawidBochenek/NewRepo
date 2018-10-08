CREATE TABLE [dbo].[PRODUCENT] (
    [Prd_ShortName]        VARCHAR (10)  NULL,
    [Prd_FullName]         NVARCHAR (25) NULL,
    [Prd_NumberOfBranches] INT           NULL,
    [Prd_CarModels]        INT           NULL,
    [Prd_MarketValue]      MONEY         NULL,
    [Prd_ContactNumber]    INT           NULL,
    [Prd_CreationDate]     DATETIME      DEFAULT (getdate()) NOT NULL,
    [Prd_ModificationDate] DATETIME      NULL
);

