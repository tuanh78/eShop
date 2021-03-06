USE [eShopSolutionn]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/7/2021 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [uniqueidentifier] NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/7/2021 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Age] [int] NULL,
	[PhoneNumber] [int] NULL,
	[Address] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/7/2021 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/7/2021 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [uniqueidentifier] NULL,
	[ProductID] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/7/2021 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [char](10) NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [money] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 5/7/2021 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Code] [char](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNumber] [int] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/7/2021 11:12:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](30) NULL,
	[UserSurName] [nvarchar](30) NULL,
	[UserPhoneNumber] [int] NULL,
	[UserAccount] [nvarchar](20) NULL,
	[UserEmail] [nvarchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'd78a8f0f-7235-4244-8904-14332a6998fc', N'Kinh dam')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'f614b991-454b-4a73-be33-772612030a39', N'Kinh dam')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'0e984725-c51c-4bf4-9960-e1c70e27aba0', N'Kinh thoi trang')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba0', N'Kinh lao')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'0e984725-c51c-4bf4-9960-e1c90e27aba0', N'Kinh can')
GO
INSERT [dbo].[Customer] ([ID], [Name], [Age], [PhoneNumber], [Address], [Email]) VALUES (N'90ad37ad-fe4f-4da8-af0f-47671fc4a71f', N'Tung', 20, 123456780, N'Ha Noi', N'Tungklol@gmail.com')
INSERT [dbo].[Customer] ([ID], [Name], [Age], [PhoneNumber], [Address], [Email]) VALUES (N'4d0eed29-d237-483b-bea7-abba74580415', N'Tung k lol', 20, 123456780, N'Ha Noi', N'Tungklol@gmail.com')
GO
INSERT [dbo].[Order] ([Id], [OrderDate], [Status]) VALUES (1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[Order] ([Id], [OrderDate], [Status]) VALUES (2, CAST(N'2021-05-08' AS Date), 2)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (N'661bfa25-780b-4a79-bf5f-9acce06a15b3', N'975a3e6b-1a20-4985-b8bb-51a93ef7c820', 1, 100000.0000)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Price]) VALUES (N'41533665-abcc-4615-a071-a0d0070f285c', N'5dd92f49-6b48-4692-adb7-b6bf45be4b91', 2, 200000.0000)
GO
INSERT [dbo].[Product] ([Id], [Code], [Name], [Price], [Amount]) VALUES (N'7579c535-236f-4ba2-81b0-59c895d45fab', N'SP02      ', N'Kinh hoi xau', 130000.0000, 3)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Price], [Amount]) VALUES (N'758e8840-c81d-48b0-a7ef-84c5e4bbe812', N'SP01      ', N'Kinh bt', 100000.0000, 4)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Price], [Amount]) VALUES (N'd044443e-74aa-4385-95f7-e539ab6c6449', N'SP03      ', N'Kinh nhan hang', 110000.0000, 1)
GO
INSERT [dbo].[Supplier] ([Code], [Name], [Address], [PhoneNumber], [Email]) VALUES (N'SP01      ', N'Kinh dep day', N'Ha Noi', 121021231, N'ab7a@gmail.com')
INSERT [dbo].[Supplier] ([Code], [Name], [Address], [PhoneNumber], [Email]) VALUES (N'SP02      ', N'Kinh dau day', N'Ha Nam', 122341231, N'asdc@gmail.com')
INSERT [dbo].[Supplier] ([Code], [Name], [Address], [PhoneNumber], [Email]) VALUES (N'SP03      ', N'Kinh dep khong', N'Ha Noi', 121312731, N'ab2w@gmail.com')
GO
INSERT [dbo].[User] ([UserID], [UserName], [UserSurName], [UserPhoneNumber], [UserAccount], [UserEmail]) VALUES (N'bf61d68b-d676-4e75-80b7-25fd87a845db', N'Tung', N'Tran', 194837262, N'tunglol123', N'tunglol@gmail.com')
GO
