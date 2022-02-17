USE [master]
GO
/****** Object:  Database [PlaylistCF]    Script Date: 2/17/2022 2:20:22 AM ******/
CREATE DATABASE [PlaylistCF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlaylistCF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PlaylistCF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PlaylistCF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PlaylistCF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PlaylistCF] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlaylistCF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlaylistCF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlaylistCF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlaylistCF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlaylistCF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlaylistCF] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlaylistCF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PlaylistCF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlaylistCF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlaylistCF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlaylistCF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlaylistCF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlaylistCF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlaylistCF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlaylistCF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlaylistCF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PlaylistCF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlaylistCF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlaylistCF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlaylistCF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlaylistCF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlaylistCF] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PlaylistCF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlaylistCF] SET RECOVERY FULL 
GO
ALTER DATABASE [PlaylistCF] SET  MULTI_USER 
GO
ALTER DATABASE [PlaylistCF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlaylistCF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlaylistCF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlaylistCF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlaylistCF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PlaylistCF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PlaylistCF', N'ON'
GO
ALTER DATABASE [PlaylistCF] SET QUERY_STORE = OFF
GO
USE [PlaylistCF]
GO
/****** Object:  User [admin]    Script Date: 2/17/2022 2:20:22 AM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/17/2022 2:20:22 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/17/2022 2:20:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 2/17/2022 2:20:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[PlaylistId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatorId] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Playlists] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 2/17/2022 2:20:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PlaylistId] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Ratings] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/17/2022 2:20:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[FacebookURL] [nvarchar](max) NULL,
	[YoutubeURL] [nvarchar](max) NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 2/17/2022 2:20:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[PlaylistId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Videos] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2032, N'1')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2005, N'Anime')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2011, N'Bruh')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2029, N'cars')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2006, N'Cats')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2018, N'Chatting')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2024, N'coding')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2027, N'Coding tutorial')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2020, N'Creative')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2030, N'Cs Go')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2007, N'Dogs')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2028, N'driving')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2003, N'Gaming')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2022, N'guns')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2031, N'League Of Legends')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2021, N'Life hacks')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2014, N'makeup')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2004, N'Memes')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2008, N'PC')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2002, N'Pets')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2019, N'Poopoo')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2015, N'Prison')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2023, N'rain')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2010, N'Random')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2012, N'Rust')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2013, N'Spoonkid')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2017, N'Stream Highlights')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2026, N'talking')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2009, N'Test')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2025, N'tutorial')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2016, N'Vr')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1002, N'Rust', N'These are some rust videos', 2012, 1009, CAST(N'2021-07-14T15:41:15.010' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1003, N'Anime', N'Some anime videos', 2005, 1009, CAST(N'2021-07-14T15:43:13.450' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1004, N'Spoonkid', N'Best of spoonkid', 2013, 1009, CAST(N'2021-07-14T15:43:59.143' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1005, N'Spoonkid highlights', N'Best of spoonkid''s streams', 2013, 1009, CAST(N'2021-07-14T15:44:29.167' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1006, N'Memes', N'Some memes', 2004, 1009, CAST(N'2021-07-14T15:48:50.297' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1007, N'Coding tutorials', N'Some great coding tutorials', 2027, 1009, CAST(N'2021-07-14T15:50:12.787' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1008, N'Best cat playlist', N'Some very good cat videos', 2006, 1009, CAST(N'2021-07-14T15:52:02.957' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1009, N'Dogs', N'Some cute dogs', 2007, 1009, CAST(N'2021-07-14T15:52:39.657' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1010, N'Stream fails', N'Funny stream fails', 2017, 1009, CAST(N'2021-07-14T15:54:28.200' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1011, N'Minecraft', N'Minecaft best game ever', 2003, 1009, CAST(N'2021-07-14T15:55:20.657' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1012, N'Cars', N'Some cars videos', 2028, 1009, CAST(N'2021-07-14T16:13:38.127' AS DateTime))
GO
INSERT [dbo].[Playlists] ([PlaylistId], [Title], [Description], [CategoryId], [CreatorId], [CreationDate]) VALUES (1013, N'Test1', N'test', 2005, 1008, CAST(N'2021-07-16T22:32:22.113' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Playlists] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1008, 1009, 1002, 3)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1009, 1009, 1003, 2)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1010, 1009, 1004, 5)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1011, 1009, 1005, 4)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1012, 1009, 1006, 2)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1013, 1009, 1007, 4)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1016, 1009, 1008, 4)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1020, 1009, 1011, 5)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1021, 1009, 1010, 1)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1022, 1009, 1012, 1)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1023, 1009, 1009, 1)
GO
INSERT [dbo].[Ratings] ([RatingId], [UserId], [PlaylistId], [Value]) VALUES (1029, 1008, 1009, 5)
GO
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1003, N'user1@site.com', N'CmZrs/H0K2QxezZbeHXjIu7hIEY=', N'User', N'One', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1004, N'user2@site.com', N'Boyp12LUxpw1CG897ZMIU0klooU=', N'User', N'Two', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1005, N'user3@site.com', N'UiaZsyukJ9uikmneHV+SHoXzTfw=', N'User', N'Three', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1006, N'user4@site.com', N'EStWuGAEGkvzYq9WAwgz4OniseA=', N'User', N'Four', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1007, N'user5@site.com', N'Ims08CaRqA+uyvB4NzxNSjPTmQA=', N'User', N'Five', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1008, N'admin@site.com', N'MxGBziOHXTEsbjQt2FbtXbXta9A=', N'Admin', N'Amer', N'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', N'', N'', 1)
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1009, N'amerpandzharov@gmail.com', N'mY7MtZC5I7vtbUMwrlLUssNoCTY=', N'Amer', N'Pandzharov', N'https://pfpmaker.com/_nuxt/img/profile-3-1.3e702c5.png', N'', N'', 0)
GO
INSERT [dbo].[Users] ([UserId], [Email], [Password], [FirstName], [LastName], [ImageURL], [FacebookURL], [YoutubeURL], [Role]) VALUES (1010, N'aasffa@asd.bg', N'HmNImxsiQcD3n9xwE2YAqXdV/1s=', N'asd', N'asd', NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Videos] ON 
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1002, N'https://www.youtube.com/watch?v=l-8t3ahucII', 1002)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1003, N'https://www.youtube.com/watch?v=OwLECdMHVuk', 1002)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1004, N'https://www.youtube.com/watch?v=wtFaAo1ssck&t=42s', 1002)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1005, N'https://www.youtube.com/watch?v=pF8L_haE_2k', 1003)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1006, N'https://www.youtube.com/watch?v=vNaPrlygAI8', 1003)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1007, N'https://www.youtube.com/watch?v=OFXgSR2Z27Y', 1003)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1008, N'https://www.youtube.com/watch?v=QqNvWTJ55mE&t=1183s', 1004)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1009, N'https://www.youtube.com/watch?v=t_BrOiXaEVQ&t=330s', 1004)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1010, N'https://www.youtube.com/watch?v=UZ_xi-RxQ9Y', 1004)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1011, N'https://www.youtube.com/watch?v=ty9JZ51OiNo', 1005)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1012, N'https://www.youtube.com/watch?v=mBirfHTUx4g&t=269s', 1005)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1013, N'https://www.youtube.com/watch?v=O492TpO9zZE&t=53s', 1005)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1014, N'https://www.youtube.com/watch?v=xQ-nbijVtZA', 1006)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1015, N'https://www.youtube.com/watch?v=hKpa9j-rVCo&t=2s', 1006)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1016, N'https://www.youtube.com/watch?v=HfFx5UvzSxc', 1006)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1017, N'https://www.youtube.com/watch?v=n7JhRDRK3Gg', 1007)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1018, N'https://www.youtube.com/watch?v=Z1Yd7upQsXY', 1007)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1019, N'https://www.youtube.com/watch?v=rfscVS0vtbw', 1007)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1020, N'https://www.youtube.com/watch?v=hY7m5jjJ9mM', 1008)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1021, N'https://www.youtube.com/watch?v=a1SJBNrlO-A', 1008)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1022, N'https://www.youtube.com/watch?v=eX2qFMC8cFo', 1008)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1023, N'https://www.youtube.com/watch?v=wtH-hdOF1uA', 1009)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1024, N'https://www.youtube.com/watch?v=f-A989FqyxI', 1009)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1025, N'https://www.youtube.com/watch?v=1HygThMLzGs', 1009)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1026, N'https://www.youtube.com/watch?v=c0C17eJA98Y', 1010)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1027, N'https://www.youtube.com/watch?v=HNCghmRv-hU', 1010)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1028, N'https://www.youtube.com/watch?v=qGn9RaWMBqI', 1010)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1029, N'https://www.youtube.com/watch?v=UZDA1BpQ4Tk', 1011)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1030, N'https://www.youtube.com/watch?v=JnI26BMGMYA&t=180s', 1011)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1031, N'https://www.youtube.com/watch?v=UZDA1BpQ4Tk', 1011)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1032, N'https://www.youtube.com/watch?v=xV6aArhB-jo', 1012)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1033, N'https://www.youtube.com/watch?v=n63zp-2-Za0', 1012)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1034, N'https://www.youtube.com/watch?v=L9ZYdShgtPE', 1012)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1035, N'https://www.youtube.com/watch?v=NlFBxKGXFeI', 1013)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1036, N'https://www.youtube.com/watch?v=2uGMSUbrYGQ', 1013)
GO
INSERT [dbo].[Videos] ([VideoId], [URL], [PlaylistId]) VALUES (1037, N'https://www.youtube.com/watch?v=onoCXmo_sGc', 1013)
GO
SET IDENTITY_INSERT [dbo].[Videos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Name]    Script Date: 2/17/2022 2:20:22 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 2/17/2022 2:20:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Playlists]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CreatorId]    Script Date: 2/17/2022 2:20:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_CreatorId] ON [dbo].[Playlists]
(
	[CreatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlaylistId]    Script Date: 2/17/2022 2:20:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_PlaylistId] ON [dbo].[Videos]
(
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Playlists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Playlists_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Playlists] CHECK CONSTRAINT [FK_dbo.Playlists_dbo.Categories_CategoryId]
GO
ALTER TABLE [dbo].[Playlists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Playlists_dbo.Users_CreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Playlists] CHECK CONSTRAINT [FK_dbo.Playlists_dbo.Users_CreatorId]
GO
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Videos_dbo.Playlists_PlaylistId] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlists] ([PlaylistId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_dbo.Videos_dbo.Playlists_PlaylistId]
GO
USE [master]
GO
ALTER DATABASE [PlaylistCF] SET  READ_WRITE 
GO
