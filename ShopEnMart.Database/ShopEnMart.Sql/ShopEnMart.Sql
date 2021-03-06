USE [master]
GO
/****** Object:  Database [ShopEnMart]    Script Date: 2/9/2018 5:10:59 PM ******/
CREATE DATABASE [ShopEnMart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopEnMart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLDEV2016\MSSQL\DATA\ShopEnMart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopEnMart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLDEV2016\MSSQL\DATA\ShopEnMart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShopEnMart] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopEnMart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopEnMart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopEnMart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopEnMart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopEnMart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopEnMart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopEnMart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopEnMart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopEnMart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopEnMart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopEnMart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopEnMart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopEnMart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopEnMart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopEnMart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopEnMart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopEnMart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopEnMart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopEnMart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopEnMart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopEnMart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopEnMart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopEnMart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopEnMart] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopEnMart] SET  MULTI_USER 
GO
ALTER DATABASE [ShopEnMart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopEnMart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopEnMart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopEnMart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopEnMart] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopEnMart', N'ON'
GO
ALTER DATABASE [ShopEnMart] SET QUERY_STORE = OFF
GO
USE [ShopEnMart]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ShopEnMart]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2/9/2018 5:10:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ShippingDetailId] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartStatus]    Script Date: 2/9/2018 5:10:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](100) NULL,
 CONSTRAINT [PK_CartStatus] PRIMARY KEY CLUSTERED 
(
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/9/2018 5:10:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberRole]    Script Date: 2/9/2018 5:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRole](
	[MemberRoleId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_MemberRole] PRIMARY KEY CLUSTERED 
(
	[MemberRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2/9/2018 5:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailId] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/9/2018 5:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[Description] [varchar](500) NULL,
	[ProductImage] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsFeatured] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/9/2018 5:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 2/9/2018 5:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[AddressLine] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [varchar](50) NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
 CONSTRAINT [PK_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (2, 7, 5, 3, CAST(N'2016-09-29T00:19:22.437' AS DateTime), CAST(N'2016-09-29T00:19:22.437' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (3, 6, 5, 3, CAST(N'2016-09-29T20:12:53.893' AS DateTime), CAST(N'2016-09-29T20:12:53.893' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (4, 4, 5, 2, CAST(N'2016-09-29T23:01:00.223' AS DateTime), CAST(N'2016-09-29T23:06:07.227' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (5, 6, 5, 2, CAST(N'2016-09-29T23:01:07.550' AS DateTime), CAST(N'2016-09-29T23:05:59.023' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (6, 2, 5, 2, CAST(N'2016-09-29T23:02:20.290' AS DateTime), CAST(N'2016-09-29T23:06:04.353' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (7, 4, 5, 1, CAST(N'2016-09-29T23:02:55.833' AS DateTime), CAST(N'2016-09-29T23:02:56.987' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (8, 6, 5, 1, CAST(N'2016-09-29T23:04:10.443' AS DateTime), CAST(N'2016-09-29T23:04:10.447' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (9, 2, 5, 1, CAST(N'2016-09-29T23:05:45.133' AS DateTime), CAST(N'2016-09-29T23:05:45.133' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1004, 7, 5, 3, CAST(N'2016-10-06T01:52:43.600' AS DateTime), CAST(N'2016-10-06T01:52:43.600' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1005, 6, 5, 3, CAST(N'2016-10-06T01:52:52.363' AS DateTime), CAST(N'2016-10-06T01:52:52.363' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1006, 5, 5, 3, CAST(N'2016-10-06T22:22:12.743' AS DateTime), CAST(N'2016-10-06T22:22:12.743' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1007, 6, 5, 3, CAST(N'2016-10-06T22:22:23.367' AS DateTime), CAST(N'2016-10-06T22:22:23.367' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1008, 5, 5, 1, CAST(N'2016-12-01T23:58:46.887' AS DateTime), CAST(N'2016-12-01T23:58:46.887' AS DateTime), NULL)
INSERT [dbo].[Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1009, 6, 5, 3, CAST(N'2018-01-17T18:06:29.460' AS DateTime), CAST(N'2018-01-17T18:06:29.463' AS DateTime), 1001)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[CartStatus] ON 

INSERT [dbo].[CartStatus] ([CartStatusId], [CartStatus]) VALUES (1, N'Added to cart')
INSERT [dbo].[CartStatus] ([CartStatusId], [CartStatus]) VALUES (2, N'Removed from cart')
INSERT [dbo].[CartStatus] ([CartStatusId], [CartStatus]) VALUES (3, N'Purchased the item')
SET IDENTITY_INSERT [dbo].[CartStatus] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (1, N'Mobile', 1, 0)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (2, N'Laptop', 1, 0)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete]) VALUES (3, N'Television', 1, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[MemberRole] ON 

INSERT [dbo].[MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (9, 5, 1)
SET IDENTITY_INSERT [dbo].[MemberRole] OFF
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberId], [FirstName], [LastName], [EmailId], [Password], [IsActive], [IsDelete], [CreatedOn], [ModifiedOn]) VALUES (5, N'Sonu', N'Kumar', N'ssonu.swarna@gmail.com', N'5AwqrbQvSKsohSONwlzlxw==', 1, 0, CAST(N'2018-01-17T18:06:03.047' AS DateTime), CAST(N'2018-01-17T18:06:03.047' AS DateTime))
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (1, N'Samsung Galexy', 1, NULL, NULL, NULL, NULL, N'<p><strong>aSasAS</strong></p>', N'Penguins.jpg', CAST(76.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (2, N'Samsung Galexy j4', 1, 1, 0, CAST(N'2016-08-09' AS Date), CAST(N'2016-08-09' AS Date), N'<p>rtretreterter</p>', N'samsung-galaxy-on5-spotted-1.jpg', CAST(656.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (3, N'Dell Inspiron', 2, 1, 0, CAST(N'2016-08-09' AS Date), CAST(N'2016-08-09' AS Date), N'<p>Dell Inspiron</p>', N'download (1).jpg', CAST(350.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (4, N'Samsung Galexy j5', 1, 1, 0, CAST(N'2016-08-09' AS Date), CAST(N'2016-08-09' AS Date), N'<p><span style="text-decoration: underline;"><strong><span style="text-decoration: underline;">Samsung Galexy j5</span></strong></span></p>', N'download.jpg', CAST(88.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (5, N'Dell Inspiron N5010', 2, 1, 0, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-28' AS Date), N'<p><strong>Nice Mobile</strong></p>', N'3_download (1).jpg', CAST(90000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (6, N'Nokia', 1, 1, 0, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-28' AS Date), N'<p>Nice Mobile</p>', N'images.jpg', CAST(850.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (7, N'HTC', 1, 1, 0, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-28' AS Date), N'<p>HTC Mobile</p>', N'Htc-Desire-516-white--SDL232582179-1-71d4a.jpg', CAST(7600.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[ShippingDetails] ON 

INSERT [dbo].[ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (1, 5, N'sdsad', N'sdasd', N'dwfef', N'ewdwd', N'wqewqe', N'30b8dcac-4e3e-4596-b171-ab8be74868c1', CAST(8450 AS Decimal(18, 0)), N'Pay Using Debit/Credit Card')
INSERT [dbo].[ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (2, 5, N'Karol Bagh', N'Delhi', N'New Delhi', N'India', N'110009', N'428f09f8-141b-49b9-be38-77f5a288ea73', CAST(8450 AS Decimal(18, 0)), N'Pay Using Net banking')
INSERT [dbo].[ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (3, 5, N'Karol Bagh', N'Delhi', N'New Delhi', N'India', N'110006', N'314a9d28-550d-443c-ba6b-13dc905fabaf', CAST(90850 AS Decimal(18, 0)), N'Cash On Delivery')
INSERT [dbo].[ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (1001, 5, N'Test Address', N'Test City', N'Delhi', N'India', N'110011', N'772c5f86-fe97-4608-b649-6af51ea1aa5b', CAST(850 AS Decimal(18, 0)), N'Pay Using Debit/Credit Card')
SET IDENTITY_INSERT [dbo].[ShippingDetails] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CartStatusId])
REFERENCES [dbo].[CartStatus] ([CartStatusId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Member]
GO
ALTER TABLE [dbo].[MemberRole]  WITH CHECK ADD  CONSTRAINT [FK_MemberRole_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[MemberRole] CHECK CONSTRAINT [FK_MemberRole_Member]
GO
ALTER TABLE [dbo].[MemberRole]  WITH CHECK ADD  CONSTRAINT [FK_Roles_MemberRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MemberRole] CHECK CONSTRAINT [FK_Roles_MemberRole]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Category_Product] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Category_Product]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_Member]
GO
/****** Object:  StoredProcedure [dbo].[MemberShoppingCartDetails]    Script Date: 2/9/2018 5:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MemberShoppingCartDetails] 
(@memberId int) 
as 
begin 
select cr.CartId, p.Price,p.ProductId,p.ProductImage,p.ProductName,c.CategoryName 
from Cart cr join Product p on p.ProductId=cr.ProductId 
join Category c on c.CategoryId=p.CategoryId 
join Members m on m.MemberId=cr.MemberId where m.MemberId=@memberId 
and cr.CartStatusId=1 end 

GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 2/9/2018 5:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Search](@searchKey varchar(100)) as begin select p.Description,p.Price,p.ProductId,p.ProductImage, p.ProductName, c.CategoryName from Product p  join Category c on p.CategoryId=c.CategoryId where p.IsActive=1 and p.IsDelete=0 and c.IsActive=1 and c.IsDelete=0 and (p.ProductName like '%'+@searchKey+'%' or c.CategoryName like '%'+@searchKey+'%') end

GO
USE [master]
GO
ALTER DATABASE [ShopEnMart] SET  READ_WRITE 
GO
