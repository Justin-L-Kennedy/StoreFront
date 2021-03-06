IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieTVWriters]') AND type in (N'U'))
ALTER TABLE [dbo].[MovieTVWriters] DROP CONSTRAINT IF EXISTS [FK_MovieTVWriters_Writers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieTVWriters]') AND type in (N'U'))
ALTER TABLE [dbo].[MovieTVWriters] DROP CONSTRAINT IF EXISTS [FK_MovieTVWriters_MoviesTV]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieTVDirectors]') AND type in (N'U'))
ALTER TABLE [dbo].[MovieTVDirectors] DROP CONSTRAINT IF EXISTS [FK_MovieTVDirectors_MoviesTV]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieTVDirectors]') AND type in (N'U'))
ALTER TABLE [dbo].[MovieTVDirectors] DROP CONSTRAINT IF EXISTS [FK_MovieTVDirectors_Directors]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieTVActors]') AND type in (N'U'))
ALTER TABLE [dbo].[MovieTVActors] DROP CONSTRAINT IF EXISTS [FK_MovieTVActors_MoviesTV]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovieTVActors]') AND type in (N'U'))
ALTER TABLE [dbo].[MovieTVActors] DROP CONSTRAINT IF EXISTS [FK_MovieTVActors_Actors]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoviesTV]') AND type in (N'U'))
ALTER TABLE [dbo].[MoviesTV] DROP CONSTRAINT IF EXISTS [FK_MoviesTV_TitleTypes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoviesTV]') AND type in (N'U'))
ALTER TABLE [dbo].[MoviesTV] DROP CONSTRAINT IF EXISTS [FK_MoviesTV_TitleStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoviesTV]') AND type in (N'U'))
ALTER TABLE [dbo].[MoviesTV] DROP CONSTRAINT IF EXISTS [FK_MoviesTV_Studios]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoviesTV]') AND type in (N'U'))
ALTER TABLE [dbo].[MoviesTV] DROP CONSTRAINT IF EXISTS [FK_MoviesTV_RegionCodes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoviesTV]') AND type in (N'U'))
ALTER TABLE [dbo].[MoviesTV] DROP CONSTRAINT IF EXISTS [FK_MoviesTV_MPAARatings]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoviesTV]') AND type in (N'U'))
ALTER TABLE [dbo].[MoviesTV] DROP CONSTRAINT IF EXISTS [FK_MoviesTV_Genres]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MoviesTV]') AND type in (N'U'))
ALTER TABLE [dbo].[MoviesTV] DROP CONSTRAINT IF EXISTS [FK_MoviesTV_DiscTypes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Writers]
GO
/****** Object:  Table [dbo].[TitleTypes]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[TitleTypes]
GO
/****** Object:  Table [dbo].[TitleStatuses]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[TitleStatuses]
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Studios]
GO
/****** Object:  Table [dbo].[RegionCodes]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[RegionCodes]
GO
/****** Object:  Table [dbo].[MPAARatings]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[MPAARatings]
GO
/****** Object:  Table [dbo].[MovieTVWriters]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[MovieTVWriters]
GO
/****** Object:  Table [dbo].[MovieTVDirectors]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[MovieTVDirectors]
GO
/****** Object:  Table [dbo].[MovieTVActors]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[MovieTVActors]
GO
/****** Object:  Table [dbo].[MoviesTV]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[MoviesTV]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Genres]
GO
/****** Object:  Table [dbo].[DiscTypes]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[DiscTypes]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Directors]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[Actors]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [StoreFront]    Script Date: 11/6/2020 1:42:06 PM ******/
DROP DATABASE IF EXISTS [StoreFront]
GO
/****** Object:  Database [StoreFront]    Script Date: 11/6/2020 1:42:06 PM ******/
CREATE DATABASE [StoreFront]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreFront', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreFront_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\StoreFront_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StoreFront] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreFront].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreFront] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreFront] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreFront] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreFront] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreFront] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreFront] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreFront] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreFront] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreFront] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreFront] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreFront] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreFront] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreFront] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreFront] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreFront] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreFront] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreFront] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreFront] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreFront] SET  MULTI_USER 
GO
ALTER DATABASE [StoreFront] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreFront] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreFront] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreFront] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreFront] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreFront] SET QUERY_STORE = OFF
GO
USE [StoreFront]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/6/2020 1:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 11/6/2020 1:42:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscTypes]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscTypes](
	[DiscTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DiscTypeName] [char](3) NOT NULL,
	[DiscTypeDescription] [varchar](25) NOT NULL,
 CONSTRAINT [PK_DiscTypes] PRIMARY KEY CLUSTERED 
(
	[DiscTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoviesTV]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesTV](
	[MovieTVID] [int] IDENTITY(1,1) NOT NULL,
	[DiscTypeID] [int] NOT NULL,
	[RegionCodeID] [char](3) NOT NULL,
	[UPC] [char](12) NULL,
	[TitleTypeID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[GenreID] [int] NULL,
	[Runtime] [int] NULL,
	[MPAARatingID] [int] NOT NULL,
	[Price] [money] NULL,
	[UnitsSold] [int] NULL,
	[ReleaseDate] [date] NULL,
	[StudioID] [int] NOT NULL,
	[TitleImage] [varchar](100) NULL,
	[IsSiteFeature] [bit] NOT NULL,
	[IsOnSaleFeature] [bit] NOT NULL,
	[TitleStatusID] [int] NOT NULL,
 CONSTRAINT [PK_MoviesTV] PRIMARY KEY CLUSTERED 
(
	[MovieTVID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieTVActors]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTVActors](
	[MovieTVActorID] [int] IDENTITY(1,1) NOT NULL,
	[MovieTVID] [int] NOT NULL,
	[ActorID] [int] NOT NULL,
	[ActorOrder] [tinyint] NULL,
	[Character] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MovieTVActors] PRIMARY KEY CLUSTERED 
(
	[MovieTVActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieTVDirectors]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTVDirectors](
	[MovieTVDirectorID] [int] IDENTITY(1,1) NOT NULL,
	[MovieTVID] [int] NOT NULL,
	[DirectorID] [int] NOT NULL,
	[DirectorOrder] [tinyint] NULL,
 CONSTRAINT [PK_MovieTVDirectors] PRIMARY KEY CLUSTERED 
(
	[MovieTVDirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieTVWriters]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTVWriters](
	[MovieTVWriterID] [int] IDENTITY(1,1) NOT NULL,
	[MovieTVID] [int] NOT NULL,
	[WriterID] [int] NOT NULL,
	[WriterOrder] [tinyint] NULL,
 CONSTRAINT [PK_MovieTVWriters] PRIMARY KEY CLUSTERED 
(
	[MovieTVWriterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPAARatings]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPAARatings](
	[MPAARatingID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [char](5) NOT NULL,
	[RatingInfo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MPAARatings] PRIMARY KEY CLUSTERED 
(
	[MPAARatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegionCodes]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionCodes](
	[RegionCodeID] [char](3) NOT NULL,
	[RegionCodeInfo] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studios](
	[StudioID] [int] IDENTITY(1,1) NOT NULL,
	[StudioName] [varchar](50) NOT NULL,
	[Country] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Studios] PRIMARY KEY CLUSTERED 
(
	[StudioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleStatuses]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleStatuses](
	[TitleStatusID] [int] IDENTITY(1,1) NOT NULL,
	[TitleStatusName] [varchar](25) NOT NULL,
	[Notes] [varchar](100) NULL,
 CONSTRAINT [PK_TitleStatuses] PRIMARY KEY CLUSTERED 
(
	[TitleStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleTypes]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleTypes](
	[TitleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TitleTypeName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_TitleTypes] PRIMARY KEY CLUSTERED 
(
	[TitleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 11/6/2020 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[WriterID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Writers] PRIMARY KEY CLUSTERED 
(
	[WriterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202010121918167_InitialCreate', N'StoreFront.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD85B649DA40DBAB9609D2CFAB6A025DA1156A2B412952628FA657DE827F5173A94A81B2FBAD88AED14058A581C9E190E67C8E170B8FFFEFDCFF8E747DF331E7014BB01999807A37DD3C0C40E1C972C27664217AFDE9A3FBFFBF69BF199E33F1A9F72BA2346073D493C31EF290D8F2D2BB6EFB18FE291EFDA5110070B3AB203DF424E601DEEEFFF641D1C5818204CC0328CF1C78450D7C7E90FF8390D888D439A20EF3270B017F3EFD0324B518D2BE4E33844369E98331A44F83C0A081DDD5D8C2E3F4D47591FD338F15C04F2CCB0B7300D4448401105698FEF623CA3D061390BE103F26E9F420C740BE4C5988FE2B824EF3AA0FD433620ABEC9843D9494C03BF27E0C111D79025765F49CF66A141D0E119E89A3EB151A77A9C98170E4E3F7D0C3C5080C8F078EA458C78625E162C4EE2F00AD351DE7194419E4700F747107D195511F78CCEFDF60A8B3A1CEDB3FFF68C69E2D124C21382131A216FCFB849E69E6BFF869F6E832F984C8E0EE68BA3B7AFDF20E7E8CD8FF8E87575A43056A0AB7D804F375110E20864C38B62FCA661D5FB5962C7A25BA54FA615B025700ED3B8448F1F3059D27B709BC3B7A671EE3E6227FFC28DEB8EB8E04BD0894609FCBC4A3C0FCD3D5CB45B8D3CD9FF1BB81EBE7E3308D72BF4E02ED3A917F883E344E0571FB197B6C6F76E98B9576DBE3F7332F0499FFDAEDB57D6FA79162491CD061368496E51B4C4B42EDDD82A8DB7934933A8E1CD3A47DD7DD36692CAE6AD2465035AC51372169BF6865CDEE7E5DBD9E24EC210262F352DA6912683D36D59230163CF90284B333AE86A460486F77F5E15CF7CE47A032C8B1DB8405CB270231F17A37C1F801122D25BE61B14C7B02A38BFA2F8BE4174F87300D167D84E2230D619457EF8ECDC6EEE0382AF127FCE7C6073BC069B9ADB3F82736483DF9D11D66B6DBC0F81FD2548E819714E11C577D4CE01D9CF5BD7EF0E30883827B68DE3F81C8C193BD300C2EE1CF082D0A3C3DE706C99DA765832F590EBABE3126141FD9C9396B1899A428A4F3464AA18A549D40FC1D225DD44CD49F5A26614ADA272B2BEA232B06E92724ABDA02941AB9C19D560515F3A43C3877D29ECEEC77DEB6DDEBAB5A0A2C63432F905131CC132E6DC204A7144CA19E8B26E6C235848A78F317DF6BD29E5F40979C9D0AC56F286741118DE1B52D8DDF786544CF8FCE03A2C2AE97018CA8901BE13BDFA9CD5EE7382649B7687DA3037CD7C336B80CE5D4EE238B0DDD40B1469309EC4A8CB0F319CD19ED1C846236645606060E82EDBF2E00B8CCD148DEA9A9C620F536C9CD8599A708A621B39B21A61404E0FC1F21D552158991DA90BF783C4132C1D47AC136287A0183CD52554760B97D86E88BC562D093D3B6E616CEC050FB1E51487983086AD9AE8C25C9D0C6102147C844969D3D0D8AA585CB3216AA256DD9CB785B0E5BC4B398A8DD8644BECACB14B1EBF3D8B61366B6C03C6D9AC922E0268137BDB30507E56E96A00E2C165D70C543831690C9487541B31D0BAC6B660A07595BC3803CD8EA85DE75F38AFEE9A79D60FCA9BDFD61BD5B505DBACE963C74C338B3DA10F851E3892CDF374CE1AF123551CCE404E7E3E8B79A82B9A08039F615A4FD994F1AE320EB59A4144236A022C0DAD05945F094A409243F5102ECFE5354AC7A3881EB079DEAD1196AFFD026CC50664ECEAD56885507F812A1A67A7D34731B2C21A2423EF7458A8E0280C425CBCEA03EFA0145D5E56564C9758B84F345C19189F8C0605B544AE1A25E583195C4BB969B66B491590F509C9D6D292103E69B4940F66702D711B6D57922228E81116ACA5A2FA163E90B3E5998E62B729DAC6565637C53F8C2D4D81D5F81285A14B9695822BFEC59865D556D357B3FE05487E8661D9B1A20EA990B6E04483082DB1D00AAC41D273378AE929A2688E589E67EAF81299726FD52CFF39CBEAF6294F62BE0FE4D4EC6F7EB3AABBC8AFEDB87248C291CE619C3E8B6B521C8515A8BB1BAC0C0E792852E4EFA78197F8441F66E97B67B778D5FED91719616C09F24B6194A43329D8AD4F40A7E9915D63D0A92A6299D5A74B0FA1537A1E8956D5AE8B4EF52879B2AA8AA24B606D6DFA7441CD0A5326468DFD67AC15E1797C8C97AA5401F8A79E18956A0709ACD2D61DB55E9052C5ACB7744714AA4EAA9042530F29ABB5253521AB0D2BE16934AAA6E8CE41AE26A9A2CBADDD91157525556845F30AD80A99C5B6EEA88AD2932AB0A2B93B765987222EA53BBC8B69CF326B6E63D9A177BD7D4C83F13CEBE230DB60E56EBF0A54F9DC138BDFDE4B60FCFB4EDA94F6E4B7A64D65198FF56C4A83A15F856A77E3F545A8F1425F8F59BBF0AE2DF44D17FE7ABC7E96FBACF6211DFF4492827B710C148E7B637EF46A7F74239DC53212D3C8D50856F51453EC8F18C168F6D59B7A2E664B7A4E708988BBC031CD8A3CCCC3FD8343E1C5CEEEBC9EB1E2D8F1144757DD139AFA9C6DA05E8B3CA0C8BE47915C3DB1C60B9312544A4C5F10073F4ECC3FD35EC7698E83FD957EDE332EE23BE27E4DA0E1364AB0F1975C0D3A4CC57D87371E85A07FBD88C713DD557EF1FBE7ACEB9E711D813B1D1BFB82A25799FEFA938A5ED2645DD79066E587162FD7DB6A2F1794A882B7ACFE5061EED2411E29E4527EE7A3C7EFFB8AA67C88B016A2E2B1C1507883A850F79860152CED4302077ED2F42141BFC1AA1F16AC229AF651814BFA83894F0ABA2F4379CF2DEE438A63D32696A454CFAD25D96BD5676E7B6F922AB7D77274B93ABB07DCA015D8EB85282FACB279B0AD5351B83C18F636EDFED9AB9577A540B90CDAB75B97BCC952E4862BA6FF5505F20ED4CC296A80B65F67BC695BD3E58177BC58B35F35F18E191BDFE6B75F33BC6963D3258877DCD87A5506EF98AD6D6BFFDCB2A575DE42B75EE72B972C69EE735459E4B63ADE2CE50EC7FF790046904594D9F34B75E15853D16B0BC39244CF545FB12632961C47E22B5134B3ED3756BEE1370E96D334B3D5D47936F1E6EB7F236F4ED3CC5B533DB98D0A6465FDA2AA2ABC651D6B2AA87A4915C7B591B414B8B7C5AC8D97F32FA9C07810A5D4BC4773BBFC72EA890751C990AED3A37E58BE2886BDB3F26F38C2FE1DBBCB1282FD8B8E04DBB55DB3A0B9208B20DFBC05897212214373892972604B3D89A8BB4036856696804EDF8FA7493D760D32C7CE05B94E6898501832F6E75E2DE1C5828026FE6991745DE6F175C87EC5430C01C47459E2FE9ABC4F5CCF29E43E57E48434102CBAE0E95E369794A57D974F05D255403A0271F51541D12DF6430FC0E26B32430F7815D9C0FC3EE025B29FCA0CA00EA47D22EA6A1F9FBA6819213FE618657FF80936ECF88FEFFE031800276BCA540000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (1, N'Christian', N'Slater', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (2, N'Patricia', N'Arquette', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (3, N'Dennis', N'Hopper', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (4, N'Val', N'Kilmer', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (5, N'Gary', N'Oldman', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (6, N'Brad', N'Pitt', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (7, N'Christopher', N'Walken', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (8, N'Bronson', N'Pinchot', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (9, N'Samuel L.', N'Jackson', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (10, N'Michael', N'Rapaport', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (11, N'Saul', N'Rubinek', N'Canada')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (12, N'James', N'Gandolfini', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (13, N'Chris', N'Penn', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (14, N'Tom', N'Sizemore', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (15, N'Tom', N'Hanks', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (16, N'Tim', N'Allen', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (17, N'Don', N'Rickles', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (18, N'Jim', N'Varney', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (19, N'Wallace', N'Shawn', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (20, N'John', N'Ratzenberger', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (21, N'Annie', N'Potts', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (22, N'John', N'Morris', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (23, N'Laurie', N'Metcalf', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (24, N'R. Lee', N'Ermey', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (25, N'Sam', N'Neill', N'New Zealand')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (26, N'Laura', N'Dern', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (27, N'Jeff', N'Goldblum', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (28, N'Richard', N'Attenborough', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (29, N'Bob', N'Peck', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (30, N'Joseph', N'Mazzello', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (31, N'Ariana', N'Richards', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (32, N'Wayne', N'Knight', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (33, N'Martin', N'Ferrero', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (34, N'B.D.', N'Wong', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (35, N'Cary', N'Elwes', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (36, N'Mandy', N'Patinkin', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (37, N'Chris', N'Sarandon', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (38, N'Christopher', N'Guest', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (39, N'André', N'the Giant', N'France')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (40, N'Fred', N'Savage', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (41, N'Robin', N'Wright', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (42, N'Peter', N'Falk', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (43, N'Peter', N'Cook', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (44, N'Mel', N'Smith', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (45, N'Carol', N'Kane', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (46, N'Billy', N'Crystal', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (47, N'Graham', N'Chapman', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (48, N'John', N'Cleese', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (49, N'Eric', N'Idle', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (50, N'Terry', N'Gilliam', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (51, N'Terry', N'Jones', N'Wales')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (52, N'Michael', N'Palin', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (53, N'Kurt', N'Russell', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (54, N'Jennifer Jason', N'Leigh', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (55, N'Walton', N'Goggins', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (56, N'Demián', N'Bichir', N'Mexico')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (57, N'Tim', N'Roth', N'England')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (58, N'Michael', N'Madsen', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (59, N'Bruce', N'Dern', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (60, N'James', N'Parks', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (61, N'Dana', N'Gourrier', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (62, N'Zoë', N'Bell', N'New Zealand')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (63, N'Lee', N'Horsley', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (64, N'Gene', N'Jones', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (65, N'Keith', N'Jefferson', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (66, N'Craig', N'Stark', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (67, N'Belinda', N'Owino', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (68, N'Channing', N'Tatum', N'United States')
INSERT [dbo].[Actors] ([ActorID], [FirstName], [LastName], [Country]) VALUES (69, N'Quentin', N'Tarantino', N'United States')
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'41356a0b-8b14-4b07-8b86-fcd1e896ee8d', N'Admin')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'19c7ba9b-1c4d-4402-92d6-1c283897fab1', N'41356a0b-8b14-4b07-8b86-fcd1e896ee8d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'19c7ba9b-1c4d-4402-92d6-1c283897fab1', N'justin.l.kennedy@outlook.com', 0, N'AGTjHO4tsyx9nk9LgXkZiQ6SthYf7fXl+OJ9zpE2HEF+SmM4TB2l/9OZovlpy3TB5g==', N'c7853d90-d353-4922-853b-aaa64f208acb', NULL, 0, 0, NULL, 1, 0, N'justin.l.kennedy@outlook.com')
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName], [Country]) VALUES (1, N'Tony', N'Scott', N'England')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName], [Country]) VALUES (2, N'John', N'Lasseter', N'United States')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName], [Country]) VALUES (3, N'Steven', N'Spielberg', N'United States')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName], [Country]) VALUES (4, N'Rob', N'Reiner', N'United States')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName], [Country]) VALUES (5, N'Terry', N'Gilliam', N'England')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName], [Country]) VALUES (6, N'Terry', N'Jones', N'Wales')
INSERT [dbo].[Directors] ([DirectorID], [FirstName], [LastName], [Country]) VALUES (7, N'Quentin', N'Tarantino', N'United States')
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
SET IDENTITY_INSERT [dbo].[DiscTypes] ON 

INSERT [dbo].[DiscTypes] ([DiscTypeID], [DiscTypeName], [DiscTypeDescription]) VALUES (1, N'DVD', N'DVD')
INSERT [dbo].[DiscTypes] ([DiscTypeID], [DiscTypeName], [DiscTypeDescription]) VALUES (2, N'BD ', N'Blu-ray')
INSERT [dbo].[DiscTypes] ([DiscTypeID], [DiscTypeName], [DiscTypeDescription]) VALUES (3, N'UHD', N'4K Ultra HD')
SET IDENTITY_INSERT [dbo].[DiscTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (1, N'Action & Adventure')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (2, N'Animation')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (3, N'Anime')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (4, N'Comedy')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (5, N'Crime')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (6, N'Documentary')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (7, N'Drama')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (8, N'Fantasy')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (9, N'Foreign Language')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (10, N'Horror')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (11, N'Kids & Family')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (12, N'Musicals & Concerts')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (13, N'Romance')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (14, N'Science Fiction')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (15, N'Sports')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (16, N'Thriller')
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (17, N'Western')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[MoviesTV] ON 

INSERT [dbo].[MoviesTV] ([MovieTVID], [DiscTypeID], [RegionCodeID], [UPC], [TitleTypeID], [Title], [Description], [GenreID], [Runtime], [MPAARatingID], [Price], [UnitsSold], [ReleaseDate], [StudioID], [TitleImage], [IsSiteFeature], [IsOnSaleFeature], [TitleStatusID]) VALUES (1, 1, N'1  ', N'085392279623', 1, N'True Romance (Unrated Director''s Cut)', N'Runaway lovers Clarence and Alabama play a dangerous game when they come to possess a suitcase of mob contraband. They head for Los Angeles, where they''ll sell the goods and begin a new life. But both sides of the law have other ideas.', 5, 121, 6, 9.9900, 125, CAST(N'1993-09-10' AS Date), 3, N'TrueRomance.jpg', 1, 1, 1)
INSERT [dbo].[MoviesTV] ([MovieTVID], [DiscTypeID], [RegionCodeID], [UPC], [TitleTypeID], [Title], [Description], [GenreID], [Runtime], [MPAARatingID], [Price], [UnitsSold], [ReleaseDate], [StudioID], [TitleImage], [IsSiteFeature], [IsOnSaleFeature], [TitleStatusID]) VALUES (2, 2, N'A  ', N'786936863628', 1, N'Toy Story', N'Woody, a traditional pull-string talking cowboy, has long enjoyed a place of honor as the favorite among six-year-old Andy''s menagerie of toys. When Andy receives a Buzz Lightyear action figure that quickly becomes his new favorite toy, Woody plots to get rid of Buzz before things backfire, resulting in himself getting lost in the outside world with Buzz as his only companion. The two toys must forces in order to find their way home and reunite with Andy before his family moves out.', 2, 81, 1, 12.9900, 3736, CAST(N'1995-11-22' AS Date), 4, N'ToyStory.jpg', 0, 0, 1)
INSERT [dbo].[MoviesTV] ([MovieTVID], [DiscTypeID], [RegionCodeID], [UPC], [TitleTypeID], [Title], [Description], [GenreID], [Runtime], [MPAARatingID], [Price], [UnitsSold], [ReleaseDate], [StudioID], [TitleImage], [IsSiteFeature], [IsOnSaleFeature], [TitleStatusID]) VALUES (3, 2, N'ABC', N'025192179143', 1, N'Jurassic Park (20th Anniversary Edition)', N'On a remote island where an amazing theme park with living cloned dinosaurs is located, five people must battle to survive among the prehistoric predators when the security system breaks down and the beasts are released from their enclosures.', 14, 127, 3, 11.9900, 10330, CAST(N'1993-06-11' AS Date), 1, N'JurassicPark.jpg', 0, 0, 1)
INSERT [dbo].[MoviesTV] ([MovieTVID], [DiscTypeID], [RegionCodeID], [UPC], [TitleTypeID], [Title], [Description], [GenreID], [Runtime], [MPAARatingID], [Price], [UnitsSold], [ReleaseDate], [StudioID], [TitleImage], [IsSiteFeature], [IsOnSaleFeature], [TitleStatusID]) VALUES (4, 1, N'1  ', N'027616865731', 1, N'The Princess Bride (Special Edition)', N'In this fairytale adventure, a young boy falls ill and is read a legendary bedtime story by his visiting grandfather that immediately comes to life. The story is a classic tale of love and adventure as the beautiful Buttercup is kidnapped and held against her will in order to marry the odious Prince Humperdinck. Her childhood beau Westley, now known as the Dread Pirate Roberts, attempts to save her. On the way he meets an accomplished swordsman, a super strong giant and a few bad guys to rescue Princess Buttercup.', 11, 98, 2, 5.9900, 309, CAST(N'1987-09-25' AS Date), 6, N'ThePrincessBride.jpg', 0, 0, 1)
INSERT [dbo].[MoviesTV] ([MovieTVID], [DiscTypeID], [RegionCodeID], [UPC], [TitleTypeID], [Title], [Description], [GenreID], [Runtime], [MPAARatingID], [Price], [UnitsSold], [ReleaseDate], [StudioID], [TitleImage], [IsSiteFeature], [IsOnSaleFeature], [TitleStatusID]) VALUES (5, 1, N'1  ', N'043396052765', 1, N'Monty Python and the Holy Grail (Special Edition)', N'King Arthur and his Knights of the Round Table embark on a surreal, low-budget search for the Holy Grail, encountering many, very silly obstacles.', 4, 91, 2, 7.9900, 50, CAST(N'1975-04-27' AS Date), 5, N'MontyPythonHolyGrail.jpg', 0, 0, 1)
INSERT [dbo].[MoviesTV] ([MovieTVID], [DiscTypeID], [RegionCodeID], [UPC], [TitleTypeID], [Title], [Description], [GenreID], [Runtime], [MPAARatingID], [Price], [UnitsSold], [ReleaseDate], [StudioID], [TitleImage], [IsSiteFeature], [IsOnSaleFeature], [TitleStatusID]) VALUES (6, 2, N'A  ', N'013132638485', 1, N'The Hateful Eight', N'In post-Civil War Wyoming, bounty hunters try to find shelter during a blizzard but get involved in a plot of betrayal and deception.', 17, 168, 4, 8.9900, 1558, CAST(N'2015-12-25' AS Date), 8, N'TheHatefulEight.jpg', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[MoviesTV] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieTVActors] ON 

INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (1, 1, 1, 1, N'Clarence Worley')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (2, 1, 2, 2, N'Alabama Whitman')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (3, 1, 3, 3, N'Clifford Worley')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (4, 1, 4, 4, N'Mentor / Elvis Presley')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (5, 1, 5, 5, N'Drexl Spivey')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (6, 1, 6, 6, N'Floyd')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (7, 1, 7, 7, N'Vincenzo Coccotti')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (8, 1, 8, 8, N'Elliot Blitzer')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (9, 1, 9, 9, N'Big Don')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (10, 1, 10, 10, N'Dick Ritchie')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (11, 1, 11, 11, N'Lee Donowitz')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (12, 1, 12, 12, N'Virgil')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (13, 1, 13, 13, N'Nicky Dimes')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (14, 1, 14, 14, N'Cody Nicholson')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (15, 2, 15, 1, N'Woody')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (16, 2, 16, 2, N'Buzz Lightyear')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (17, 2, 17, 3, N'Mr. Potato Head')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (18, 2, 18, 4, N'Slinky Dog')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (19, 2, 19, 5, N'Rex')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (20, 2, 20, 6, N'Hamm')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (21, 2, 21, 7, N'Bo Peep')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (22, 2, 22, 8, N'Andy Davis')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (23, 2, 23, 10, N'Mrs. Davis')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (24, 2, 24, 11, N'Sergeant')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (25, 3, 25, 1, N'Dr. Alan Grant')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (26, 3, 26, 2, N'Dr. Ellie Sattler')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (27, 3, 27, 3, N'Dr. Ian Malcolm')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (28, 3, 28, 4, N'John Hammond')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (29, 3, 29, 5, N'Robert Muldoon')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (30, 3, 33, 6, N'Donald Gennaro')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (31, 3, 34, 7, N'Dr. Henry Wu')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (32, 3, 30, 8, N'Tim Murphy')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (33, 3, 31, 9, N'Lex Murphy')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (34, 3, 9, 10, N'Ray Arnold')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (35, 3, 32, 11, N'Dennis Nedry')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (36, 4, 35, 1, N'Westley/Dread Pirate Roberts/The Man in Black')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (37, 4, 36, 2, N'Inigo Montoya')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (38, 4, 37, 3, N'Prince Humperdinck')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (39, 4, 38, 4, N'Count Tyrone Rugen')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (40, 4, 19, 5, N'Vizzini')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (41, 4, 39, 6, N'Fezzik')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (42, 4, 40, 7, N'The Grandson')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (43, 4, 41, 8, N'Buttercup/The Princess Bride')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (44, 4, 42, 9, N'The Grandfather/The Narrator')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (45, 4, 43, 10, N'The Impressive Clergyman')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (46, 4, 44, 11, N'The Albino')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (47, 4, 45, 12, N'Valerie')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (48, 4, 46, 13, N'Miracle Max')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (49, 5, 47, 1, N'King Arthur/Voice of God')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (50, 5, 48, 2, N'Sir Lancelot the Brave/The Black Knight/Taunting French Guard /Tim the Enchanter')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (51, 5, 49, 3, N'Sir Robin the Not-Quite-So-Brave-As-Sir Lancelot/Concorde/Roger the Shrubber/Brother Maynard')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (52, 5, 50, 4, N'Patsy/Green Knight/Old Man from Scene 24 (Bridgekeeper)/Sir Bors/Animator')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (53, 5, 51, 5, N'Sir Bedevere the Wise/Prince Herbert/Dennis''s Mother/Voice of Cartoon Scribe')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (54, 5, 52, 6, N'Sir Galahad the Pure/The Knights Who Say Ni/King of Swamp Castle/Dennis/Narrator/Maynard''s Brother')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (55, 6, 9, 1, N'Major Marquis Warren')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (56, 6, 53, 2, N'John "The Hangman" Ruth')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (57, 6, 54, 3, N'Daisy Domergue')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (58, 6, 55, 4, N'Sheriff Chris Mannix')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (59, 6, 56, 5, N'Señor Bob/Marco the Mexican')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (60, 6, 57, 6, N'Oswaldo Mobray/English Pete Hicox')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (61, 6, 58, 7, N'Joe Gage/Grouch Douglass')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (62, 6, 59, 8, N'General Sanford "Sandy" Smithers')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (63, 6, 60, 9, N'O.B.')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (64, 6, 61, 10, N'Minnie Mink')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (65, 6, 62, 11, N'Six-Horse Judy')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (66, 6, 63, 12, N'Ed')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (67, 6, 64, 13, N'Sweet Dave')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (68, 6, 65, 14, N'Charly')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (69, 6, 66, 15, N'Chester Charles Smithers')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (70, 6, 67, 16, N'Gemma')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (71, 6, 68, 17, N'Jody Domergue')
INSERT [dbo].[MovieTVActors] ([MovieTVActorID], [MovieTVID], [ActorID], [ActorOrder], [Character]) VALUES (72, 6, 69, 18, N'Narrator (uncredited)')
SET IDENTITY_INSERT [dbo].[MovieTVActors] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieTVDirectors] ON 

INSERT [dbo].[MovieTVDirectors] ([MovieTVDirectorID], [MovieTVID], [DirectorID], [DirectorOrder]) VALUES (1, 1, 1, 1)
INSERT [dbo].[MovieTVDirectors] ([MovieTVDirectorID], [MovieTVID], [DirectorID], [DirectorOrder]) VALUES (2, 2, 2, 1)
INSERT [dbo].[MovieTVDirectors] ([MovieTVDirectorID], [MovieTVID], [DirectorID], [DirectorOrder]) VALUES (3, 3, 3, 1)
INSERT [dbo].[MovieTVDirectors] ([MovieTVDirectorID], [MovieTVID], [DirectorID], [DirectorOrder]) VALUES (4, 4, 4, 1)
INSERT [dbo].[MovieTVDirectors] ([MovieTVDirectorID], [MovieTVID], [DirectorID], [DirectorOrder]) VALUES (5, 5, 5, 1)
INSERT [dbo].[MovieTVDirectors] ([MovieTVDirectorID], [MovieTVID], [DirectorID], [DirectorOrder]) VALUES (6, 5, 6, 2)
INSERT [dbo].[MovieTVDirectors] ([MovieTVDirectorID], [MovieTVID], [DirectorID], [DirectorOrder]) VALUES (7, 6, 7, 1)
SET IDENTITY_INSERT [dbo].[MovieTVDirectors] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieTVWriters] ON 

INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (1, 1, 1, 1)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (2, 2, 2, 1)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (3, 2, 3, 2)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (4, 2, 4, 3)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (5, 2, 5, 4)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (6, 2, 6, 5)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (7, 2, 7, 6)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (8, 2, 8, 7)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (9, 3, 9, 1)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (10, 3, 10, 2)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (11, 4, 11, 1)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (12, 5, 12, 1)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (13, 5, 13, 2)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (14, 5, 14, 3)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (15, 5, 15, 4)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (16, 5, 16, 5)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (17, 5, 17, 6)
INSERT [dbo].[MovieTVWriters] ([MovieTVWriterID], [MovieTVID], [WriterID], [WriterOrder]) VALUES (18, 6, 1, 1)
SET IDENTITY_INSERT [dbo].[MovieTVWriters] OFF
GO
SET IDENTITY_INSERT [dbo].[MPAARatings] ON 

INSERT [dbo].[MPAARatings] ([MPAARatingID], [Rating], [RatingInfo]) VALUES (1, N'G    ', N'General Audiences - All ages admitted.')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [Rating], [RatingInfo]) VALUES (2, N'PG   ', N'Parental Guidance Suggested - Some material may not be suitable for children.')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [Rating], [RatingInfo]) VALUES (3, N'PG-13', N'Parents Strongly Cautioned - Some material may be inappropriate for children under 13.')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [Rating], [RatingInfo]) VALUES (4, N'R    ', N'Restricted - Under 17 requires accompanying parent or adult guardian.')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [Rating], [RatingInfo]) VALUES (5, N'NC-17', N'Adults Only - No One 17 and Under Admitted.')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [Rating], [RatingInfo]) VALUES (6, N'NR   ', N'Not Rated - Has not been submitted for a rating.')
INSERT [dbo].[MPAARatings] ([MPAARatingID], [Rating], [RatingInfo]) VALUES (7, N'UR   ', N'Unrated - Uncut/extended version of a film that was submitted.')
SET IDENTITY_INSERT [dbo].[MPAARatings] OFF
GO
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'0  ', N'0 - Any region/region-free')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'1  ', N'1 - United States (including Puerto Rico), Canada, and Bermuda')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'2  ', N'2 - Europe (except Belarus, Ukraine, and Russia), Greenland, French Guiana, Turkey, the Middle East, Egypt, Eswatini, Lesotho, South Africa, and Japan')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'3  ', N'3 - Southeast Asia, South Korea, Taiwan, Hong Kong, and Macau')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'4  ', N'4 - Latin America (except French Guiana and Puerto Rico), the Caribbean, and Oceania')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'5  ', N'5 - Africa (except Egypt, Lesotho, Eswatini, and South Africa), Russia, Belarus, Ukraine, Central Asia, South Asia, Mongolia, and North Korea')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'6  ', N'6 - Mainland China')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'7  ', N'7 - MPAA-related DVDs and "media copies" of pre-releases in Asia')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'8  ', N'8 - International venues such as aircraft, cruise ships and spacecraft')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'A  ', N'A - North America, South America, U.S. Territories, Japan, South Korea, Taiwan, and other areas of Southeast Asia')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'ABC', N'ABC - Classified as region-free as it applies to countries listed in Regions A, B, and C')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'ALL', N'ALL - These region discs have all 1-8 flags set, allowing the disc to be played in any location, on any player')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'B  ', N'B - Europe, Africa, Middle East, Australia, and New Zealand')
INSERT [dbo].[RegionCodes] ([RegionCodeID], [RegionCodeInfo]) VALUES (N'C  ', N'C - Asia (except for Japan, Korea, Taiwan, and other areas of Southeast Asia)')
GO
SET IDENTITY_INSERT [dbo].[Studios] ON 

INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (1, N'Universal', N'United States', 1)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (2, N'Paramount', N'United States', 1)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (3, N'Warner Bros', N'United States', 1)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (4, N'Disney', N'United States', 1)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (5, N'Sony', N'United States', 1)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (6, N'20th Century', N'United States', 1)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (7, N'MGM', N'United States', 1)
INSERT [dbo].[Studios] ([StudioID], [StudioName], [Country], [IsActive]) VALUES (8, N'Lionsgate', N'United States', 1)
SET IDENTITY_INSERT [dbo].[Studios] OFF
GO
SET IDENTITY_INSERT [dbo].[TitleStatuses] ON 

INSERT [dbo].[TitleStatuses] ([TitleStatusID], [TitleStatusName], [Notes]) VALUES (1, N'In stock', N'Units are available for purchase and immediate shipment.')
INSERT [dbo].[TitleStatuses] ([TitleStatusID], [TitleStatusName], [Notes]) VALUES (2, N'Out of stock', N'Units can be purchased, but shipment will be delayed as sourced.')
INSERT [dbo].[TitleStatuses] ([TitleStatusID], [TitleStatusName], [Notes]) VALUES (3, N'Backordered', N'Units can be purchased, but shipment will be delayed - already awaiting arrival.')
INSERT [dbo].[TitleStatuses] ([TitleStatusID], [TitleStatusName], [Notes]) VALUES (4, N'Discontinued', N'Units no longer available for purchase - cannot be sourced.')
SET IDENTITY_INSERT [dbo].[TitleStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[TitleTypes] ON 

INSERT [dbo].[TitleTypes] ([TitleTypeID], [TitleTypeName]) VALUES (1, N'Movie')
INSERT [dbo].[TitleTypes] ([TitleTypeID], [TitleTypeName]) VALUES (2, N'TV Show')
SET IDENTITY_INSERT [dbo].[TitleTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Writers] ON 

INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (1, N'Quentin', N'Tarantino', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (2, N'Joss', N'Whedon', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (3, N'Andrew', N'Stanton', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (4, N'Joel', N'Cohen', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (5, N'Alec', N'Sokolow', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (6, N'John', N'Lasseter', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (7, N'Pete', N'Docter', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (8, N'Joe', N'Ranft', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (9, N'Michael', N'Crichton', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (10, N'David', N'Koepp', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (11, N'William', N'Goldman', N'United States')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (12, N'Graham', N'Chapman', N'England')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (13, N'John', N'Cleese', N'England')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (14, N'Eric', N'Idle', N'England')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (15, N'Terry', N'Gilliam', N'England')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (16, N'Terry', N'Jones', N'Wales')
INSERT [dbo].[Writers] ([WriterID], [FirstName], [LastName], [Country]) VALUES (17, N'Michael', N'Palin', N'England')
SET IDENTITY_INSERT [dbo].[Writers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/6/2020 1:42:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:42:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:42:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/6/2020 1:42:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/6/2020 1:42:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/6/2020 1:42:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[MoviesTV]  WITH CHECK ADD  CONSTRAINT [FK_MoviesTV_DiscTypes] FOREIGN KEY([DiscTypeID])
REFERENCES [dbo].[DiscTypes] ([DiscTypeID])
GO
ALTER TABLE [dbo].[MoviesTV] CHECK CONSTRAINT [FK_MoviesTV_DiscTypes]
GO
ALTER TABLE [dbo].[MoviesTV]  WITH CHECK ADD  CONSTRAINT [FK_MoviesTV_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[MoviesTV] CHECK CONSTRAINT [FK_MoviesTV_Genres]
GO
ALTER TABLE [dbo].[MoviesTV]  WITH CHECK ADD  CONSTRAINT [FK_MoviesTV_MPAARatings] FOREIGN KEY([MPAARatingID])
REFERENCES [dbo].[MPAARatings] ([MPAARatingID])
GO
ALTER TABLE [dbo].[MoviesTV] CHECK CONSTRAINT [FK_MoviesTV_MPAARatings]
GO
ALTER TABLE [dbo].[MoviesTV]  WITH CHECK ADD  CONSTRAINT [FK_MoviesTV_RegionCodes] FOREIGN KEY([RegionCodeID])
REFERENCES [dbo].[RegionCodes] ([RegionCodeID])
GO
ALTER TABLE [dbo].[MoviesTV] CHECK CONSTRAINT [FK_MoviesTV_RegionCodes]
GO
ALTER TABLE [dbo].[MoviesTV]  WITH CHECK ADD  CONSTRAINT [FK_MoviesTV_Studios] FOREIGN KEY([StudioID])
REFERENCES [dbo].[Studios] ([StudioID])
GO
ALTER TABLE [dbo].[MoviesTV] CHECK CONSTRAINT [FK_MoviesTV_Studios]
GO
ALTER TABLE [dbo].[MoviesTV]  WITH CHECK ADD  CONSTRAINT [FK_MoviesTV_TitleStatuses] FOREIGN KEY([TitleStatusID])
REFERENCES [dbo].[TitleStatuses] ([TitleStatusID])
GO
ALTER TABLE [dbo].[MoviesTV] CHECK CONSTRAINT [FK_MoviesTV_TitleStatuses]
GO
ALTER TABLE [dbo].[MoviesTV]  WITH CHECK ADD  CONSTRAINT [FK_MoviesTV_TitleTypes] FOREIGN KEY([TitleTypeID])
REFERENCES [dbo].[TitleTypes] ([TitleTypeID])
GO
ALTER TABLE [dbo].[MoviesTV] CHECK CONSTRAINT [FK_MoviesTV_TitleTypes]
GO
ALTER TABLE [dbo].[MovieTVActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieTVActors_Actors] FOREIGN KEY([ActorID])
REFERENCES [dbo].[Actors] ([ActorID])
GO
ALTER TABLE [dbo].[MovieTVActors] CHECK CONSTRAINT [FK_MovieTVActors_Actors]
GO
ALTER TABLE [dbo].[MovieTVActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieTVActors_MoviesTV] FOREIGN KEY([MovieTVID])
REFERENCES [dbo].[MoviesTV] ([MovieTVID])
GO
ALTER TABLE [dbo].[MovieTVActors] CHECK CONSTRAINT [FK_MovieTVActors_MoviesTV]
GO
ALTER TABLE [dbo].[MovieTVDirectors]  WITH CHECK ADD  CONSTRAINT [FK_MovieTVDirectors_Directors] FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Directors] ([DirectorID])
GO
ALTER TABLE [dbo].[MovieTVDirectors] CHECK CONSTRAINT [FK_MovieTVDirectors_Directors]
GO
ALTER TABLE [dbo].[MovieTVDirectors]  WITH CHECK ADD  CONSTRAINT [FK_MovieTVDirectors_MoviesTV] FOREIGN KEY([MovieTVID])
REFERENCES [dbo].[MoviesTV] ([MovieTVID])
GO
ALTER TABLE [dbo].[MovieTVDirectors] CHECK CONSTRAINT [FK_MovieTVDirectors_MoviesTV]
GO
ALTER TABLE [dbo].[MovieTVWriters]  WITH CHECK ADD  CONSTRAINT [FK_MovieTVWriters_MoviesTV] FOREIGN KEY([MovieTVID])
REFERENCES [dbo].[MoviesTV] ([MovieTVID])
GO
ALTER TABLE [dbo].[MovieTVWriters] CHECK CONSTRAINT [FK_MovieTVWriters_MoviesTV]
GO
ALTER TABLE [dbo].[MovieTVWriters]  WITH CHECK ADD  CONSTRAINT [FK_MovieTVWriters_Writers] FOREIGN KEY([WriterID])
REFERENCES [dbo].[Writers] ([WriterID])
GO
ALTER TABLE [dbo].[MovieTVWriters] CHECK CONSTRAINT [FK_MovieTVWriters_Writers]
GO
ALTER DATABASE [StoreFront] SET  READ_WRITE 
GO
