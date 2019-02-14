CREATE TABLE [Hr].[DniRoboczeMiesiac] (
    [RokId]       INT NOT NULL,
    [MiesiacId]   INT NOT NULL,
    [DienRoboczy] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([RokId] ASC, [MiesiacId] ASC, [DienRoboczy] ASC)
);

