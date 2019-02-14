CREATE TABLE [Hr].[GodzinowyCzasPracy] (
    [RokId]             INT NOT NULL,
    [MiesiacId]         INT NOT NULL,
    [LiczbaGodzinPracy] INT NULL,
    [LiczbaDniPracy]    INT NULL,
    [LiczbaDniWolnych]  INT NULL,
    PRIMARY KEY CLUSTERED ([RokId] ASC, [MiesiacId] ASC)
);

