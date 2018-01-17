CREATE TABLE [dbo].[ShippingDetails] (
    [ShippingDetailId] INT           IDENTITY (1, 1) NOT NULL,
    [MemberId]         INT           NULL,
    [AddressLine]      VARCHAR (100) NULL,
    [City]             VARCHAR (50)  NULL,
    [State]            VARCHAR (50)  NULL,
    [Country]          VARCHAR (50)  NULL,
    [ZipCode]          VARCHAR (50)  NULL,
    [OrderId]          VARCHAR (50)  NULL,
    [AmountPaid]       DECIMAL (18)  NULL,
    [PaymentType]      VARCHAR (50)  NULL,
    CONSTRAINT [PK_ShippingAddress] PRIMARY KEY CLUSTERED ([ShippingDetailId] ASC),
    CONSTRAINT [FK_ShippingDetails_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([MemberId])
);

