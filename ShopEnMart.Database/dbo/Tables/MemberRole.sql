CREATE TABLE [dbo].[MemberRole] (
    [MemberRoleId] INT IDENTITY (1, 1) NOT NULL,
    [MemberId]     INT NULL,
    [RoleId]       INT NULL,
    CONSTRAINT [PK_MemberRole] PRIMARY KEY CLUSTERED ([MemberRoleId] ASC),
    CONSTRAINT [FK_MemberRole_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([MemberId]),
    CONSTRAINT [FK_Roles_MemberRole] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([RoleId]) ON DELETE CASCADE ON UPDATE CASCADE
);

