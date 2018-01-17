CREATE TABLE [dbo].[Members] (
    [MemberId]   INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50)  NOT NULL,
    [LastName]   NVARCHAR (50)  NOT NULL,
    [EmailId]    NVARCHAR (200) NOT NULL,
    [Password]   NVARCHAR (50)  NOT NULL,
    [IsActive]   BIT            NOT NULL,
    [IsDelete]   BIT            NOT NULL,
    [CreatedOn]  DATETIME       NOT NULL,
    [ModifiedOn] DATETIME       NOT NULL,
    CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED ([MemberId] ASC)
);

