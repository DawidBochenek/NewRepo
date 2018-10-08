CREATE TABLE [dbo].[PRODUKT] (
    [Pro_Name]            NVARCHAR (25) NULL,
    [Pro_Type]            NVARCHAR (20) NULL,
    [Pro_NumberOfColours] INT           NULL,
    [Pro_SupplyState]     INT           NULL,
    [Pro_Price]           MONEY         NULL,
    [Pro_IdNumber]        INT           IDENTITY (1, 1) NOT NULL,
    [Prd_IdNumer]         INT           NULL,
    PRIMARY KEY CLUSTERED ([Pro_IdNumber] ASC),
    FOREIGN KEY ([Prd_IdNumer]) REFERENCES [dbo].[PRODUCENT] ([Prd_IdNumber])
);



