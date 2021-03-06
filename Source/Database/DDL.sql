USE [Dinero]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[ParentCompanyId] [tinyint] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ledger]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledger](
	[Id] [bigint] NOT NULL,
	[SourceEntityId] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[TransactionTypeId] [tinyint] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Ledger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SourceEntity]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [tinyint] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_SourceEntity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](75) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PasswordHash] [varchar](100) NOT NULL,
	[PasswordSalt] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserCompany]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompany](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyId] [tinyint] NOT NULL,
 CONSTRAINT [PK_UserCompany] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2/15/2015 7:18:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [tinyint] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_SourceEntity] FOREIGN KEY([SourceEntityId])
REFERENCES [dbo].[SourceEntity] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_SourceEntity]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_User]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_User1]
GO
ALTER TABLE [dbo].[SourceEntity]  WITH CHECK ADD  CONSTRAINT [FK_SourceEntity_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[SourceEntity] CHECK CONSTRAINT [FK_SourceEntity_Company]
GO
ALTER TABLE [dbo].[UserCompany]  WITH CHECK ADD  CONSTRAINT [FK_UserCompany_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[UserCompany] CHECK CONSTRAINT [FK_UserCompany_Company]
GO
ALTER TABLE [dbo].[UserCompany]  WITH CHECK ADD  CONSTRAINT [FK_UserCompany_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserCompany] CHECK CONSTRAINT [FK_UserCompany_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
