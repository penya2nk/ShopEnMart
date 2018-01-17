CREATE TABLE [dbo].[CartStatus] (
    [CartStatusId] INT           IDENTITY (1, 1) NOT NULL,
    [CartStatus]   VARCHAR (100) NULL,
    CONSTRAINT [PK_CartStatus] PRIMARY KEY CLUSTERED ([CartStatusId] ASC)
);

