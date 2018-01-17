CREATE TABLE [dbo].[Product] (
    [ProductId]    INT             IDENTITY (1, 1) NOT NULL,
    [ProductName]  VARCHAR (100)   NULL,
    [CategoryId]   INT             NULL,
    [IsActive]     BIT             NULL,
    [IsDelete]     BIT             NULL,
    [CreatedDate]  DATE            NULL,
    [ModifiedDate] DATE            NULL,
    [Description]  VARCHAR (500)   NULL,
    [ProductImage] VARCHAR (50)    NULL,
    [Price]        DECIMAL (18, 2) NULL,
    [IsFeatured]   BIT             NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [FK_Category_Product] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([CategoryId])
);

