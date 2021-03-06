USE [master]
GO
/****** Object:  Database [IDB]    Script Date: 10/31/2020 6:50:08 PM ******/
CREATE DATABASE [IDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IDB] SET  MULTI_USER 
GO
ALTER DATABASE [IDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IDB', N'ON'
GO
ALTER DATABASE [IDB] SET QUERY_STORE = OFF
GO
USE [IDB]
GO
/****** Object:  Table [dbo].[GAME_MODE_T]    Script Date: 10/31/2020 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAME_MODE_T](
	[Game_MODE_ID] [char](5) NOT NULL,
	[Game_name] [varchar](100) NOT NULL,
	[Game_type] [varchar](100) NULL,
	[PA_ID] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Game_MODE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GAME_T]    Script Date: 10/31/2020 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAME_T](
	[Game_ID] [char](5) NOT NULL,
	[Game_date] [date] NOT NULL,
	[Game_time] [time](7) NULL,
	[Games_Heros] [varchar](100) NOT NULL,
	[Game_result] [varchar](100) NOT NULL,
	[PS_ID] [char](5) NOT NULL,
	[PA_ID] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Game_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HERO_T]    Script Date: 10/31/2020 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HERO_T](
	[HR_ID] [char](5) NOT NULL,
	[HR_name] [varchar](50) NOT NULL,
	[HR_role] [varchar](10) NOT NULL,
	[HR_speciality] [varchar](20) NOT NULL,
	[HR_level] [char](2) NOT NULL,
	[HR_price] [numeric](6, 2) NOT NULL,
	[PA_ID] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[HR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal_statics_T]    Script Date: 10/31/2020 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal_statics_T](
	[PS_ID] [char](5) NOT NULL,
	[Most_used_heroes] [varchar](30) NOT NULL,
	[Previous_result] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLAYER_ACCOUNT_T]    Script Date: 10/31/2020 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAYER_ACCOUNT_T](
	[PA_ID] [char](5) NOT NULL,
	[PA_username] [varchar](30) NOT NULL,
	[PA_status] [char](20) NOT NULL,
	[PA_global_level] [char](20) NOT NULL,
	[PA_diamond] [varchar](100) NULL,
	[PA_battlepoint] [varchar](100) NULL,
	[PA_skins_owned] [char](10) NOT NULL,
	[PA_current_level] [varchar](2) NOT NULL,
	[PA_email_adress] [varchar](50) NOT NULL,
	[PA_list_of_heroes] [varchar](50) NULL,
	[team_ID] [char](5) NOT NULL,
 CONSTRAINT [PK__PLAYER_A__28E0060B79BF7102] PRIMARY KEY CLUSTERED 
(
	[PA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SKIN_T]    Script Date: 10/31/2020 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SKIN_T](
	[skin_ID] [char](5) NOT NULL,
	[skin_name] [varchar](100) NOT NULL,
	[skin_price] [numeric](6, 2) NOT NULL,
	[skin_hero_name] [varchar](30) NOT NULL,
	[HR_ID] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEAM_T]    Script Date: 10/31/2020 6:50:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEAM_T](
	[team_ID] [char](5) NOT NULL,
	[TEAM_Hero1] [varchar](30) NOT NULL,
	[TEAM_Hero2] [varchar](30) NOT NULL,
	[TEAM_Hero3] [varchar](30) NOT NULL,
	[TEAM_Hero4] [varchar](30) NOT NULL,
	[TEAM_Hero5] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[team_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GAME_MODE_T] ([Game_MODE_ID], [Game_name], [Game_type], [PA_ID]) VALUES (N'G001 ', N'brawl mode', N'Fight', N'PA00 ')
INSERT [dbo].[GAME_MODE_T] ([Game_MODE_ID], [Game_name], [Game_type], [PA_ID]) VALUES (N'G002 ', N'human vs AI mode', N'Defense', N'PA01 ')
INSERT [dbo].[GAME_MODE_T] ([Game_MODE_ID], [Game_name], [Game_type], [PA_ID]) VALUES (N'G003 ', N'classic mode', N'Offensive', N'PA02 ')
INSERT [dbo].[GAME_MODE_T] ([Game_MODE_ID], [Game_name], [Game_type], [PA_ID]) VALUES (N'G004 ', N'brawl mode', N'Fight', N'PA03 ')
INSERT [dbo].[GAME_MODE_T] ([Game_MODE_ID], [Game_name], [Game_type], [PA_ID]) VALUES (N'G005 ', N'human vs AI mode', N'Defense', N'PA04 ')
INSERT [dbo].[GAME_MODE_T] ([Game_MODE_ID], [Game_name], [Game_type], [PA_ID]) VALUES (N'G006 ', N'classic mode', N'Offensive', N'PA05 ')
GO
INSERT [dbo].[GAME_T] ([Game_ID], [Game_date], [Game_time], [Games_Heros], [Game_result], [PS_ID], [PA_ID]) VALUES (N'G001 ', CAST(N'2020-02-11' AS Date), CAST(N'20:00:00' AS Time), N'Arthur', N'T001', N'PS01 ', N'PA01 ')
INSERT [dbo].[GAME_T] ([Game_ID], [Game_date], [Game_time], [Games_Heros], [Game_result], [PS_ID], [PA_ID]) VALUES (N'G002 ', CAST(N'2020-02-12' AS Date), CAST(N'21:00:00' AS Time), N'Bionic', N'T002', N'PS02 ', N'PA02 ')
INSERT [dbo].[GAME_T] ([Game_ID], [Game_date], [Game_time], [Games_Heros], [Game_result], [PS_ID], [PA_ID]) VALUES (N'G003 ', CAST(N'2020-02-13' AS Date), CAST(N'22:00:00' AS Time), N'Avatar', N'T003', N'PS03 ', N'PA03 ')
INSERT [dbo].[GAME_T] ([Game_ID], [Game_date], [Game_time], [Games_Heros], [Game_result], [PS_ID], [PA_ID]) VALUES (N'G004 ', CAST(N'2020-02-14' AS Date), CAST(N'23:00:00' AS Time), N'Goku', N'T004', N'PS04 ', N'PA04 ')
INSERT [dbo].[GAME_T] ([Game_ID], [Game_date], [Game_time], [Games_Heros], [Game_result], [PS_ID], [PA_ID]) VALUES (N'G005 ', CAST(N'2020-02-20' AS Date), CAST(N'12:00:00' AS Time), N'Saitama', N'T005', N'PS05 ', N'PA05 ')
GO
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H001 ', N'Shanks', N'Assassin', N'Silent Steps', N'5 ', CAST(20.00 AS Numeric(6, 2)), N'PA00 ')
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H002 ', N'Arthur', N'Supporter', N'Null', N'6 ', CAST(30.00 AS Numeric(6, 2)), N'PA01 ')
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H003 ', N'Bionic', N'Caster', N'Teleportation', N'7 ', CAST(40.00 AS Numeric(6, 2)), N'PA02 ')
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H004 ', N'Avatar', N'Shooter', N'Steady aim', N'8 ', CAST(50.00 AS Numeric(6, 2)), N'PA03 ')
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H005 ', N'Goku', N'Fighter', N'Close Combat', N'9 ', CAST(60.00 AS Numeric(6, 2)), N'PA04 ')
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H006 ', N'Saitama', N'Tank', N'One-Hit KO', N'10', CAST(70.00 AS Numeric(6, 2)), N'PA05 ')
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H007 ', N'Meliodas', N'Defender', N'Null', N'11', CAST(80.00 AS Numeric(6, 2)), N'PA06 ')
INSERT [dbo].[HERO_T] ([HR_ID], [HR_name], [HR_role], [HR_speciality], [HR_level], [HR_price], [PA_ID]) VALUES (N'H008 ', N'kagura', N'Advocate', N'Null', N'12', CAST(90.00 AS Numeric(6, 2)), N'PA07 ')
GO
INSERT [dbo].[Personal_statics_T] ([PS_ID], [Most_used_heroes], [Previous_result]) VALUES (N'PS01 ', N'Abdullah', N'Winner')
INSERT [dbo].[Personal_statics_T] ([PS_ID], [Most_used_heroes], [Previous_result]) VALUES (N'PS02 ', N'Goku', N'Loser')
INSERT [dbo].[Personal_statics_T] ([PS_ID], [Most_used_heroes], [Previous_result]) VALUES (N'PS03 ', N'Saitama', N'Winner')
INSERT [dbo].[Personal_statics_T] ([PS_ID], [Most_used_heroes], [Previous_result]) VALUES (N'PS04 ', N'Avatar', N'Loser')
INSERT [dbo].[Personal_statics_T] ([PS_ID], [Most_used_heroes], [Previous_result]) VALUES (N'PS05 ', N'Arthur', N'Winner')
INSERT [dbo].[Personal_statics_T] ([PS_ID], [Most_used_heroes], [Previous_result]) VALUES (N'PS06 ', N'kagura', N'Loser')
GO
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA00 ', N'Akrmov', N'ON                  ', N'3                   ', N'10', N'15', N'5         ', N'6', N'VM@email.com', N'Shanks', N'T001 ')
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA01 ', N'Abdullah', N'ON                  ', N'4                   ', N'20', N'25', N'6         ', N'7', N'AB@gmail.com', N'Saitama', N'T002 ')
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA02 ', N'Steve Rogers', N'OFF                 ', N'5                   ', N'30', N'35', N'7         ', N'8', N'ST@gmail.com', N'Bionic', N'T003 ')
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA03 ', N'Wade Wilson', N'OFF                 ', N'6                   ', N'40', N'45', N'8         ', N'9', N'WW@gmail.com', N'kagura', N'T004 ')
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA04 ', N'Peter Parker', N'ON                  ', N'7                   ', N'50', N'55', N'9         ', N'10', N'PP@gmail.com', N'Goku', N'T005 ')
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA05 ', N'Bruce Wayne', N'ON                  ', N'8                   ', N'60', N'65', N'10        ', N'11', N'BW@gmail.com', N'Arthur', N'T001 ')
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA06 ', N'Mostafa', N'OFF                 ', N'9                   ', N'70', N'75', N'11        ', N'12', N'TS@gmail.com', N'Meliodas', N'T002 ')
INSERT [dbo].[PLAYER_ACCOUNT_T] ([PA_ID], [PA_username], [PA_status], [PA_global_level], [PA_diamond], [PA_battlepoint], [PA_skins_owned], [PA_current_level], [PA_email_adress], [PA_list_of_heroes], [team_ID]) VALUES (N'PA07 ', N'Tony Stark', N'OFF                 ', N'9                   ', N'70', N'75', N'11        ', N'12', N'TS@gmail.com', N'Avatar', N'T003 ')
GO
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S001 ', N'Ultra Instinct', CAST(10.00 AS Numeric(6, 2)), N'Red', N'H001 ')
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S002 ', N'Super Saiyan', CAST(20.00 AS Numeric(6, 2)), N'Yellow', N'H002 ')
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S003 ', N'Golden Freeza', CAST(30.00 AS Numeric(6, 2)), N'Green', N'H003 ')
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S004 ', N'Final Form', CAST(40.00 AS Numeric(6, 2)), N'Blue', N'H004 ')
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S005 ', N'Ninetails cloak', CAST(50.00 AS Numeric(6, 2)), N'Pink', N'H005 ')
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S006 ', N'Sage mode', CAST(60.00 AS Numeric(6, 2)), N'Black', N'H006 ')
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S007 ', N'Excalibur', CAST(70.00 AS Numeric(6, 2)), N'Orange', N'H007 ')
INSERT [dbo].[SKIN_T] ([skin_ID], [skin_name], [skin_price], [skin_hero_name], [HR_ID]) VALUES (N'S008 ', N'Dark Wizard', CAST(80.00 AS Numeric(6, 2)), N'Grey', N'H008 ')
GO
INSERT [dbo].[TEAM_T] ([team_ID], [TEAM_Hero1], [TEAM_Hero2], [TEAM_Hero3], [TEAM_Hero4], [TEAM_Hero5]) VALUES (N'T001 ', N'Shanks', N'Arthur', N'Bionic', N'Avatar', N'Goku')
INSERT [dbo].[TEAM_T] ([team_ID], [TEAM_Hero1], [TEAM_Hero2], [TEAM_Hero3], [TEAM_Hero4], [TEAM_Hero5]) VALUES (N'T002 ', N'Saitama', N'Meliodas', N'kagura', N'Shanks', N'Arthur')
INSERT [dbo].[TEAM_T] ([team_ID], [TEAM_Hero1], [TEAM_Hero2], [TEAM_Hero3], [TEAM_Hero4], [TEAM_Hero5]) VALUES (N'T003 ', N'Bionic', N'Avatar', N'Goku', N'Saitama', N'Meliodas')
INSERT [dbo].[TEAM_T] ([team_ID], [TEAM_Hero1], [TEAM_Hero2], [TEAM_Hero3], [TEAM_Hero4], [TEAM_Hero5]) VALUES (N'T004 ', N'kagura', N'Shanks', N'Arthur', N'Bionic', N'Avatar')
INSERT [dbo].[TEAM_T] ([team_ID], [TEAM_Hero1], [TEAM_Hero2], [TEAM_Hero3], [TEAM_Hero4], [TEAM_Hero5]) VALUES (N'T005 ', N'Goku', N'Saitama', N'Meliodas', N'kagura', N'Shanks')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GAME_MOD__963A8EFE706DBFD0]    Script Date: 10/31/2020 6:50:09 PM ******/
ALTER TABLE [dbo].[GAME_MODE_T] ADD UNIQUE NONCLUSTERED 
(
	[Game_MODE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GAME_T__093B1F8FC07219CF]    Script Date: 10/31/2020 6:50:09 PM ******/
ALTER TABLE [dbo].[GAME_T] ADD UNIQUE NONCLUSTERED 
(
	[Game_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__HERO_T__272A3F7F2942C2F1]    Script Date: 10/31/2020 6:50:09 PM ******/
ALTER TABLE [dbo].[HERO_T] ADD UNIQUE NONCLUSTERED 
(
	[HR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Personal__0119474D710336D3]    Script Date: 10/31/2020 6:50:09 PM ******/
ALTER TABLE [dbo].[Personal_statics_T] ADD UNIQUE NONCLUSTERED 
(
	[PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PLAYER_A__28E0060A911055B0]    Script Date: 10/31/2020 6:50:09 PM ******/
ALTER TABLE [dbo].[PLAYER_ACCOUNT_T] ADD  CONSTRAINT [UQ__PLAYER_A__28E0060A911055B0] UNIQUE NONCLUSTERED 
(
	[PA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SKIN_T__E350C2EF7B9B55AC]    Script Date: 10/31/2020 6:50:09 PM ******/
ALTER TABLE [dbo].[SKIN_T] ADD UNIQUE NONCLUSTERED 
(
	[skin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TEAM_T__F82AE935B25DF7CA]    Script Date: 10/31/2020 6:50:09 PM ******/
ALTER TABLE [dbo].[TEAM_T] ADD UNIQUE NONCLUSTERED 
(
	[team_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GAME_MODE_T]  WITH CHECK ADD  CONSTRAINT [FK__GAME_MODE__PA_ID__36B12243] FOREIGN KEY([PA_ID])
REFERENCES [dbo].[PLAYER_ACCOUNT_T] ([PA_ID])
GO
ALTER TABLE [dbo].[GAME_MODE_T] CHECK CONSTRAINT [FK__GAME_MODE__PA_ID__36B12243]
GO
ALTER TABLE [dbo].[GAME_T]  WITH CHECK ADD  CONSTRAINT [FK__GAME_T__PA_ID__37A5467C] FOREIGN KEY([PA_ID])
REFERENCES [dbo].[PLAYER_ACCOUNT_T] ([PA_ID])
GO
ALTER TABLE [dbo].[GAME_T] CHECK CONSTRAINT [FK__GAME_T__PA_ID__37A5467C]
GO
ALTER TABLE [dbo].[GAME_T]  WITH CHECK ADD FOREIGN KEY([PS_ID])
REFERENCES [dbo].[Personal_statics_T] ([PS_ID])
GO
ALTER TABLE [dbo].[HERO_T]  WITH CHECK ADD  CONSTRAINT [FK__HERO_T__PA_ID__3A81B327] FOREIGN KEY([PA_ID])
REFERENCES [dbo].[PLAYER_ACCOUNT_T] ([PA_ID])
GO
ALTER TABLE [dbo].[HERO_T] CHECK CONSTRAINT [FK__HERO_T__PA_ID__3A81B327]
GO
ALTER TABLE [dbo].[PLAYER_ACCOUNT_T]  WITH CHECK ADD  CONSTRAINT [FK__PLAYER_AC__team___3B75D760] FOREIGN KEY([team_ID])
REFERENCES [dbo].[TEAM_T] ([team_ID])
GO
ALTER TABLE [dbo].[PLAYER_ACCOUNT_T] CHECK CONSTRAINT [FK__PLAYER_AC__team___3B75D760]
GO
ALTER TABLE [dbo].[SKIN_T]  WITH CHECK ADD FOREIGN KEY([HR_ID])
REFERENCES [dbo].[HERO_T] ([HR_ID])
GO
USE [master]
GO
ALTER DATABASE [IDB] SET  READ_WRITE 
GO
