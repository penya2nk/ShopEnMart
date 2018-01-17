CREATE TABLE [dbo].[Cart] (
    [CartId]           INT      IDENTITY (1, 1) NOT NULL,
    [ProductId]        INT      NULL,
    [MemberId]         INT      NULL,
    [CartStatusId]     INT      NULL,
    [AddedOn]          DATETIME NULL,
    [UpdatedOn]        DATETIME NULL,
    [ShippingDetailId] INT      NULL,
    CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED ([CartId] ASC),
    FOREIGN KEY ([CartStatusId]) REFERENCES [dbo].[CartStatus] ([CartStatusId]),
    FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId]),
    CONSTRAINT [FK_Cart_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([MemberId])
);

