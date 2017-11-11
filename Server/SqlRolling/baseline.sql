﻿USE [master]
GO
/****** Object:  Database [stoptheline]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE DATABASE [stoptheline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'stoptheline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\stoptheline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'stoptheline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\stoptheline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [stoptheline] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [stoptheline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [stoptheline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [stoptheline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [stoptheline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [stoptheline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [stoptheline] SET ARITHABORT OFF 
GO
ALTER DATABASE [stoptheline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [stoptheline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [stoptheline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [stoptheline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [stoptheline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [stoptheline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [stoptheline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [stoptheline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [stoptheline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [stoptheline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [stoptheline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [stoptheline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [stoptheline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [stoptheline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [stoptheline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [stoptheline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [stoptheline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [stoptheline] SET RECOVERY FULL 
GO
ALTER DATABASE [stoptheline] SET  MULTI_USER 
GO
ALTER DATABASE [stoptheline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [stoptheline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [stoptheline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [stoptheline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [stoptheline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [stoptheline] SET QUERY_STORE = OFF
GO
USE [stoptheline]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [stoptheline]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[TenantId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupUser]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupUser](
	[GroupId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [Pk_UserGroupId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
 CONSTRAINT [Pk_LogId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stop]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stop](
	[Id] [uniqueidentifier] NOT NULL,
	[Problem] [nvarchar](255) NOT NULL,
	[TenantId] [uniqueidentifier] NOT NULL,
	[By] [nvarchar](255) NOT NULL,
	[ById] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[WhenResolved] [datetime] NULL,
	[GroupName] [nvarchar](255) NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StopGroupUser]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StopGroupUser](
	[StopId] [uniqueidentifier] NOT NULL,
	[UserEmail] [nvarchar](255) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [Pk_StopGroupUserId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[NameFriendly] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[TimeZoneId] [nvarchar](256) NOT NULL,
	[ClientId] [varchar](256) NOT NULL,
	[Authority] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[TenantId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[IDPID] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserContact]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContact](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInvite]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInvite](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[TenantId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[InviteKey] [uniqueidentifier] NOT NULL,
	[InvitedByUserId] [uniqueidentifier] NOT NULL,
	[DateModified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInviteGroup]    Script Date: 11/11/2017 2:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInviteGroup](
	[UserInviteId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NULL,
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [Pk_UserInviteGroupId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [Group_Indx_Id]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [Group_Indx_Id] ON [dbo].[Group]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Group_Indx_TenantId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [Group_Indx_TenantId] ON [dbo].[Group]
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [GroupUser_Indx_GroupId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [GroupUser_Indx_GroupId] ON [dbo].[GroupUser]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [GroupUser_Indx_UserId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [GroupUser_Indx_UserId] ON [dbo].[GroupUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Stop_Indx_GroupId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [Stop_Indx_GroupId] ON [dbo].[Stop]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Stop_Indx_TenantId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [Stop_Indx_TenantId] ON [dbo].[Stop]
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Tenant_Indx_NameFriendly]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [Tenant_Indx_NameFriendly] ON [dbo].[Tenant]
(
	[NameFriendly] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Tenant_Indx_TenantId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [Tenant_Indx_TenantId] ON [dbo].[Tenant]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [User_Indx_Id]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [User_Indx_Id] ON [dbo].[User]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [User_Indx_TenantEmail]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [User_Indx_TenantEmail] ON [dbo].[User]
(
	[TenantId] ASC,
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [User_Indx_TenantId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [User_Indx_TenantId] ON [dbo].[User]
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UserContact_Indx_UserId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [UserContact_Indx_UserId] ON [dbo].[UserContact]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UserInvite_Indx_TenantId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [UserInvite_Indx_TenantId] ON [dbo].[UserInvite]
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UserInviteGroup_Indx_GroupId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [UserInviteGroup_Indx_GroupId] ON [dbo].[UserInviteGroup]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UserInviteGroup_Indx_UserInviteId]    Script Date: 11/11/2017 2:24:50 PM ******/
CREATE NONCLUSTERED INDEX [UserInviteGroup_Indx_UserInviteId] ON [dbo].[UserInviteGroup]
(
	[UserInviteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[StopGroupUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[UserInviteGroup] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FRK_Tenant] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FRK_Tenant]
GO
ALTER TABLE [dbo].[GroupUser]  WITH CHECK ADD  CONSTRAINT [FRK_GroupUser_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[GroupUser] CHECK CONSTRAINT [FRK_GroupUser_Group]
GO
ALTER TABLE [dbo].[GroupUser]  WITH CHECK ADD  CONSTRAINT [FRK_GroupUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupUser] CHECK CONSTRAINT [FRK_GroupUser_User]
GO
ALTER TABLE [dbo].[Stop]  WITH CHECK ADD  CONSTRAINT [FRK_Stop_Tenant] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([Id])
GO
ALTER TABLE [dbo].[Stop] CHECK CONSTRAINT [FRK_Stop_Tenant]
GO
ALTER TABLE [dbo].[StopGroupUser]  WITH CHECK ADD  CONSTRAINT [FRK__StopGroupUser_Stop] FOREIGN KEY([StopId])
REFERENCES [dbo].[Stop] ([Id])
GO
ALTER TABLE [dbo].[StopGroupUser] CHECK CONSTRAINT [FRK__StopGroupUser_Stop]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FRK_User_Tenant] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FRK_User_Tenant]
GO
ALTER TABLE [dbo].[UserContact]  WITH CHECK ADD  CONSTRAINT [FRK_UserContact_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserContact] CHECK CONSTRAINT [FRK_UserContact_User]
GO
ALTER TABLE [dbo].[UserInvite]  WITH CHECK ADD  CONSTRAINT [FRK_UserInvite_Tenant] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([Id])
GO
ALTER TABLE [dbo].[UserInvite] CHECK CONSTRAINT [FRK_UserInvite_Tenant]
GO
ALTER TABLE [dbo].[UserInvite]  WITH CHECK ADD  CONSTRAINT [FRK_UserInvite_User] FOREIGN KEY([InvitedByUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInvite] CHECK CONSTRAINT [FRK_UserInvite_User]
GO
ALTER TABLE [dbo].[UserInviteGroup]  WITH CHECK ADD  CONSTRAINT [FRK_UserInviteGroup_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[UserInviteGroup] CHECK CONSTRAINT [FRK_UserInviteGroup_Group]
GO
ALTER TABLE [dbo].[UserInviteGroup]  WITH CHECK ADD  CONSTRAINT [FRK_UserInviteGroup_UserInvite] FOREIGN KEY([UserInviteId])
REFERENCES [dbo].[UserInvite] ([Id])
GO
ALTER TABLE [dbo].[UserInviteGroup] CHECK CONSTRAINT [FRK_UserInviteGroup_UserInvite]
GO
USE [master]
GO
ALTER DATABASE [stoptheline] SET  READ_WRITE 
GO
