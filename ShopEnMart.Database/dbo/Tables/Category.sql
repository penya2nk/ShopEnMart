CREATE TABLE [dbo].[Category] (
    [CategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (100) NULL,
    [IsActive]     BIT            NULL,
    [IsDelete]     BIT            NULL,
    CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

