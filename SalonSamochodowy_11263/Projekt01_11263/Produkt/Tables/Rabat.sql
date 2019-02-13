CREATE TABLE [Produkt].[Rabat] (
    [RabatId]        INT            NOT NULL,
    [WysokoscRabatu] DECIMAL (6, 2) NOT NULL,
    [NazwaRabatu]    NVARCHAR (25)  NOT NULL,
    PRIMARY KEY CLUSTERED ([RabatId] ASC)
);

