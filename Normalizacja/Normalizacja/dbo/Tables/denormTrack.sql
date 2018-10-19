CREATE TABLE [dbo].[denormTrack] (
    [TrackId]       INT             NOT NULL,
    [TrackName]     NVARCHAR (200)  NOT NULL,
    [AlbumId]       INT             NULL,
    [Composer]      NVARCHAR (220)  NULL,
    [Milliseconds]  INT             NOT NULL,
    [Bytes]         INT             NULL,
    [UnitPrice]     NUMERIC (10, 2) NOT NULL,
    [GenreName]     NVARCHAR (120)  NULL,
    [MediaTypeName] NVARCHAR (120)  NULL
);

