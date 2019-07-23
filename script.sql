USE [master]
GO
/****** Object:  Database [Timetable_pro]    Script Date: 5/29/2019 3:22:33 PM ******/
CREATE DATABASE [Timetable_pro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Timetable_pro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Timetable_pro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Timetable_pro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Timetable_pro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Timetable_pro] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Timetable_pro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Timetable_pro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Timetable_pro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Timetable_pro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Timetable_pro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Timetable_pro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Timetable_pro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Timetable_pro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Timetable_pro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Timetable_pro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Timetable_pro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Timetable_pro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Timetable_pro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Timetable_pro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Timetable_pro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Timetable_pro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Timetable_pro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Timetable_pro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Timetable_pro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Timetable_pro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Timetable_pro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Timetable_pro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Timetable_pro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Timetable_pro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Timetable_pro] SET  MULTI_USER 
GO
ALTER DATABASE [Timetable_pro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Timetable_pro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Timetable_pro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Timetable_pro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Timetable_pro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Timetable_pro] SET QUERY_STORE = OFF
GO
USE [Timetable_pro]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[NoPhone] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Subject]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Course_ID] [int] NULL,
	[Subject_ID] [int] NULL,
 CONSTRAINT [PK_Course_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject_Lecturer]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_Lecturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Course_Sub_ID] [int] NULL,
	[Lect_ID] [int] NULL,
	[Type_ID] [int] NULL,
 CONSTRAINT [PK_Subject_Lecturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeName] [varchar](50) NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_KiraSub]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_KiraSub]
AS
SELECT        dbo.Lecturer.ID, dbo.Subject.Name, dbo.Lecturer.Name AS NameLecturer, dbo.Type.Name AS type, dbo.Subject_Lecturer.ID AS Expr2, dbo.Type.ID AS Expr1, dbo.Course.Name AS Expr3
FROM            dbo.Lecturer INNER JOIN
                         dbo.Subject_Lecturer ON dbo.Lecturer.ID = dbo.Subject_Lecturer.Lect_ID INNER JOIN
                         dbo.Course_Subject ON dbo.Subject_Lecturer.Course_Sub_ID = dbo.Course_Subject.ID INNER JOIN
                         dbo.Subject ON dbo.Course_Subject.Subject_ID = dbo.Subject.ID INNER JOIN
                         dbo.Type ON dbo.Subject_Lecturer.Type_ID = dbo.Type.ID INNER JOIN
                         dbo.Course ON dbo.Course_Subject.Course_ID = dbo.Course.ID
WHERE        (dbo.Type.ID = 1)
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Type_ID] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[ID] [int] NOT NULL,
	[Day] [varchar](50) NULL,
 CONSTRAINT [PK_Timetable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Room_ID] [int] NULL,
	[Lect_Sub_ID] [int] NULL,
	[Course_ID] [int] NULL,
	[Timetable_ID] [int] NULL,
	[Number] [int] NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_lect]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_lect]
AS
SELECT        dbo.Lecturer.Name, dbo.Timetable.Day, dbo.Subject_Lecturer.ID, dbo.Slot.Number, dbo.Lecturer.ID AS LectID, dbo.Timetable.ID AS DayID, dbo.Subject.Name AS NameSub, dbo.Course.Name AS CourseName, 
                         dbo.Room.Name AS RoomName
FROM            dbo.Lecturer INNER JOIN
                         dbo.Subject_Lecturer ON dbo.Lecturer.ID = dbo.Subject_Lecturer.Lect_ID INNER JOIN
                         dbo.Slot ON dbo.Subject_Lecturer.ID = dbo.Slot.Lect_Sub_ID INNER JOIN
                         dbo.Timetable ON dbo.Slot.Timetable_ID = dbo.Timetable.ID INNER JOIN
                         dbo.Course_Subject ON dbo.Subject_Lecturer.Course_Sub_ID = dbo.Course_Subject.ID INNER JOIN
                         dbo.Subject ON dbo.Course_Subject.Subject_ID = dbo.Subject.ID INNER JOIN
                         dbo.Course ON dbo.Slot.Course_ID = dbo.Course.ID AND dbo.Course_Subject.Course_ID = dbo.Course.ID INNER JOIN
                         dbo.Room ON dbo.Slot.Room_ID = dbo.Room.ID
GO
/****** Object:  View [dbo].[View_Room]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Room]
AS
SELECT        dbo.Timetable.Day, dbo.Room.Name, dbo.Slot.ID, dbo.Slot.Number, dbo.Room.ID AS RoomID, dbo.Timetable.ID AS DayID
FROM            dbo.Room INNER JOIN
                         dbo.Slot ON dbo.Room.ID = dbo.Slot.Room_ID INNER JOIN
                         dbo.Timetable ON dbo.Slot.Timetable_ID = dbo.Timetable.ID
GO
/****** Object:  View [dbo].[View_sub2]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_sub2]
AS
SELECT        dbo.Subject.ID, dbo.Lecturer.Name AS LecturerName, dbo.Subject.Name, dbo.Subject.Year, dbo.Type.ID AS TypeID, dbo.Type.Name AS Type, dbo.Subject_Lecturer.ID AS sublectID
FROM            dbo.Subject_Lecturer INNER JOIN
                         dbo.Lecturer ON dbo.Subject_Lecturer.Lect_ID = dbo.Lecturer.ID INNER JOIN
                         dbo.Subject ON dbo.Subject_Lecturer.Sub_ID = dbo.Subject.ID INNER JOIN
                         dbo.Type ON dbo.Subject_Lecturer.Type_ID = dbo.Type.ID
WHERE        (dbo.Subject.Year = 2)
GO
/****** Object:  View [dbo].[View_sub3]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_sub3]
AS
SELECT        dbo.Subject.ID, dbo.Subject.Name, dbo.Subject.Year, dbo.Lecturer.Name AS LecturerName, dbo.Type.ID AS TypeID, dbo.Type.Name AS Type, dbo.Subject_Lecturer.ID AS sublectID
FROM            dbo.Subject_Lecturer INNER JOIN
                         dbo.Subject ON dbo.Subject_Lecturer.Sub_ID = dbo.Subject.ID INNER JOIN
                         dbo.Lecturer ON dbo.Subject_Lecturer.Lect_ID = dbo.Lecturer.ID INNER JOIN
                         dbo.Type ON dbo.Subject_Lecturer.Type_ID = dbo.Type.ID
WHERE        (dbo.Subject.Year = 3)
GO
/****** Object:  View [dbo].[viewSub]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewSub]
AS
SELECT DISTINCT TOP (100) PERCENT dbo.Subject.ID, dbo.Subject.Name, dbo.Type.Name AS Type, dbo.Subject.Year, dbo.Subject_Lecturer.ID AS sublectID, dbo.Lecturer.Name AS LecturerName, dbo.Type.ID AS TypeID
FROM            dbo.Subject INNER JOIN
                         dbo.Subject_Lecturer ON dbo.Subject.ID = dbo.Subject_Lecturer.Sub_ID INNER JOIN
                         dbo.Lecturer ON dbo.Lecturer.ID = dbo.Subject_Lecturer.Lect_ID INNER JOIN
                         dbo.Type ON dbo.Subject_Lecturer.Type_ID = dbo.Type.ID
WHERE        (dbo.Subject.Year = 1)
GO
/****** Object:  View [dbo].[View_1DIT]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1DIT]
AS
SELECT        dbo.Subject.Name AS SubjectName, dbo.Course.Name, dbo.Subject.CodeName, dbo.Course.ID, dbo.Subject_Lecturer.ID AS Expr1, dbo.Type.ID AS TypeID, dbo.Type.Name AS TypeName
FROM            dbo.Course INNER JOIN
                         dbo.Course_Subject ON dbo.Course.ID = dbo.Course_Subject.Course_ID INNER JOIN
                         dbo.Subject ON dbo.Course_Subject.Subject_ID = dbo.Subject.ID INNER JOIN
                         dbo.Subject_Lecturer ON dbo.Course_Subject.ID = dbo.Subject_Lecturer.Course_Sub_ID INNER JOIN
                         dbo.Type ON dbo.Subject_Lecturer.Type_ID = dbo.Type.ID
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[RoleID] [int] NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/29/2019 3:22:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[RoleID] [int] NULL,
	[Course_ID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([ID], [Name], [RoleID], [email], [password], [image]) VALUES (1, N'admin1', 1, N'admin@test123.com', N'25d89c56c8435d2b5708fe33bfe2f899', N'Logo-Expert-System-website.png')
INSERT [dbo].[Admin] ([ID], [Name], [RoleID], [email], [password], [image]) VALUES (2, N'hisham', 1, N'hisham@test123.com', N'25d89c56c8435d2b5708fe33bfe2f899', N'AI-Icon-300x278.png')
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([ID], [Name]) VALUES (1, N'1 DIT')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (2, N'2 DIT')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (3, N'3 DIT')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (4, N'1 BITC')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (5, N'2 BITC')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (6, N'3 BITC')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (7, N'1 BITD')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (8, N'2 BITD')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (9, N'3 BITD')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (10, N'1 BITE')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (11, N'2 BITE')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (12, N'3 BITE')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (13, N'1 BITI')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (14, N'2 BITI')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (15, N'3 BITI')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (16, N'1 BITM')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (17, N'2 BITM')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (18, N'3 BITM')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (19, N'1 BITS')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (20, N'2 BITS')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (21, N'3 BITS')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (22, N'1 BITZ')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (23, N'2 BITZ')
INSERT [dbo].[Course] ([ID], [Name]) VALUES (24, N'3 BITZ')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Course_Subject] ON 

INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (1, 4, 16)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (2, 4, 17)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (3, 4, 18)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (4, 4, 19)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (5, 4, 20)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (6, 4, 21)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (7, 4, 22)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (8, 4, 23)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (9, 4, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (10, 4, 25)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (11, 4, 26)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (12, 5, 27)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (13, 5, 28)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (14, 5, 29)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (15, 5, 30)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (16, 5, 31)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (17, 5, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (18, 6, 32)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (19, 6, 33)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (20, 6, 34)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (21, 6, 35)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (22, 6, 36)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (23, 6, 37)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (24, 7, 16)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (25, 7, 19)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (26, 7, 20)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (27, 7, 28)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (28, 7, 22)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (29, 7, 23)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (30, 7, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (31, 7, 25)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (32, 7, 26)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (33, 8, 27)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (34, 8, 38)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (35, 8, 39)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (36, 8, 40)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (37, 8, 21)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (38, 8, 41)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (39, 9, 17)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (40, 9, 42)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (41, 9, 43)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (42, 9, 44)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (43, 9, 37)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (44, 10, 45)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (45, 10, 46)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (46, 10, 16)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (47, 10, 20)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (48, 10, 22)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (49, 10, 23)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (50, 10, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (51, 11, 47)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (52, 11, 48)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (53, 11, 49)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (54, 11, 50)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (55, 11, 51)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (56, 11, 18)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (57, 12, 52)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (58, 12, 53)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (59, 12, 54)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (60, 12, 55)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (61, 12, 37)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (62, 13, 27)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (63, 13, 16)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (64, 13, 19)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (65, 13, 20)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (66, 13, 66)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (67, 13, 21)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (68, 13, 22)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (69, 13, 23)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (70, 13, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (71, 13, 25)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (72, 13, 26)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (73, 14, 56)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (74, 14, 57)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (75, 14, 58)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (76, 14, 59)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (77, 14, 18)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (78, 14, 28)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (79, 14, 31)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (80, 14, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (81, 15, 60)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (82, 15, 61)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (83, 15, 62)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (84, 15, 63)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (85, 15, 64)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (86, 15, 37)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (87, 16, 16)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (88, 16, 65)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (89, 16, 19)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (90, 16, 20)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (91, 16, 66)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (92, 16, 22)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (93, 16, 23)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (94, 16, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (95, 16, 25)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (96, 16, 26)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (98, 17, 51)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (99, 17, 18)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (100, 17, 68)
GO
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (101, 17, 40)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (102, 17, 32)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (103, 17, 37)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (104, 18, 67)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (105, 18, 69)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (106, 18, 38)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (107, 18, 70)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (108, 18, 64)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (109, 19, 16)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (110, 19, 19)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (111, 19, 20)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (112, 19, 28)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (113, 19, 22)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (114, 19, 23)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (115, 19, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (116, 19, 25)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (117, 19, 26)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (118, 20, 27)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (119, 20, 38)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (120, 20, 40)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (121, 20, 71)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (122, 20, 21)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (123, 20, 41)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (124, 20, 25)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (125, 21, 17)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (126, 21, 42)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (127, 21, 72)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (128, 21, 70)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (129, 21, 37)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (130, 22, 16)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (131, 22, 18)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (132, 22, 19)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (133, 22, 20)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (134, 22, 21)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (135, 22, 22)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (136, 22, 23)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (137, 22, 24)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (138, 23, 28)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (139, 23, 40)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (140, 23, 73)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (141, 23, 74)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (142, 23, 75)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (143, 24, 76)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (144, 24, 77)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (145, 24, 78)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (146, 24, 79)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (147, 24, 31)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (148, 24, 80)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (149, 1, 1)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (150, 1, 2)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (151, 1, 3)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (152, 1, 4)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (153, 1, 5)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (154, 1, 6)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (155, 2, 7)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (156, 2, 8)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (157, 2, 9)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (158, 2, 10)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (159, 2, 11)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (160, 2, 12)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (161, 2, 13)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (162, 2, 81)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (163, 2, 14)
INSERT [dbo].[Course_Subject] ([ID], [Course_ID], [Subject_ID]) VALUES (164, 2, 15)
SET IDENTITY_INSERT [dbo].[Course_Subject] OFF
SET IDENTITY_INSERT [dbo].[Lecturer] ON 

INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (1, N'TS. DR. NORZIHANI BINTI YUSOF', N'norzihani@utem.edu.my', N'password', N'+606 270 2425', N'norzihani.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (2, N'TS. NORAZLIN BINTI MOHAMMED', N'norazlin@utem.edu.my', N'password', N'+606 270 2531', N'norazlin.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (3, N'DR. ZURINA BINTI SA''AYA', N'zurina@utem.edu.my', N'password', N'+606 270 2557', N'zurina.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (4, N'DR. ZULISMAN BIN MAKSOM', N'zulisman@utem.edu.my', N'password', N'+606 270 2536', N'zulisman.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (5, N'TS. MUHAMMAD SUHAIZAN BIN SULONG', N'suhaizan@utem.edu.my', N'password', N'+606 270 2477', N'suhaizan.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (6, N'TS. AZLIANOR BINTI ABDUL AZIZ', N'azlianor@utem.edu.my', N'password', N'+606 270 2478', N'azlianor.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (7, N'TS. DR. YAHAYA BIN ABD RAHIM', N'yahaya@utem.edu.my', N'password', N'+606 270 2470', N'yahaya.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (8, N'SYAHIDA BINTI MOHTAR', N'msyahida@utem.edu.my', N'password', N'+606 270 2482', N'syahida.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (9, N'TS. ARIFF BIN IDRIS', N'miariff@utem.edu.my', N'password', N'+606 331 6576', N'ariff.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (10, N'TS. ERMAN BIN HAMID', N'erman@utem.edu.my', N'password', N'+606 270 2516', N'erman.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (11, N'NIK RAHILA BINTI WAN IBRAHIM', N'nikrahila@utem.edu.my', N'password', N'+606 270 2746', N'rahila.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (12, N'NOR HAZLEN NIZA BINTI HUSSEIN', N'hazlen@utem.edu.my', N'password', N'+606 270 2740', N'hazlen.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (13, N'AHMAD RIDZWAN BIN MOHD NOOR', N'ahmadridzuan@utem.edu.my', N'password', N'+606 270 2732', N'ridzwan.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (14, N'DR. ANIDAH BINTI ROBANI', N'anidah@utem.edu.my', N'password', N'+606 270 2728', N'anidah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (15, N'SITI ROHANA BINTI OMAR', N'sitirohana@utem.edu.my', N'password', N'+606 270 4502', N'rohanaomar.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (16, N'PROFESOR MADYA DATUK DR. SU''AIDI BIN DATO'' SAFEI', N'suaidi@utem.edu.my', N'password', N'+606 270 2723', N'suaidi.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (17, N'TS. DR. HALIZAH BINTI BASIRON', N'halizah@utem.edu.my', N'password', N'+606 270 2433', N'halizah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (18, N'PROFESOR MADYA DR SHARIFAH SAKINAH BINTI SYED AHMAD', N'sakinah@utem.edu.my', N'password', N'+606 270 2432', N'sharifahsakinah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (19, N'PROFESOR MADYA DR AZAH KAMILAH BINTI DRAMAN @ MUDA', N'azah@utem.edu.my', N'password', N'+606 270 2461', N'azahkamilah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (20, N'DR. NOR HAFEIZAH BINTI HASSAN', N'nor_hafeizah@utem.edu.my', N'password', N'+606 270 2479', N'hafiezah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (21, N'TS. DR. RAJA RINA BINTI RAJA IKRAM', N'raja.rina@utem.edu.my', N'password', N'+606 331 6687', N'rina.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (22, N'TS. DR. ZULKIFLEE BIN MUSLIM', N'zulkiflee@utem.edu.my', N'password', N'+606 270 2496', N'zulkiflee.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (23, N'DR. SYARULNAZIAH BINTI ANAWAR', N'syarulnaziah@utem.edu.my', N'password', N'+606 270 2493', N'syarulnaziah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (24, N'TS. DR. ROBIAH BINTI YUSOF', N'robiah@utem.edu.my', N'password', N'+606 270 2505', N'robiah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (25, N'MARLIZA BINTI RAMLY', N'marliza@utem.edu.my', N'password', N'+606 270 2555', N'marliza.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (26, N'ANISAH BINTI KASIM', N'anisah@utem.edu.my', N'password', N'+606 270 2719', N'anisah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (27, N'NOOR AZLIN BINTI BIDIN', N'azlin@utem.edu.my', N'password', N'+606 331 6965', N'NoorAzlin.jpg', NULL, NULL)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (28, N'DR. RAHMAN BIN HASHIM', N'rahmanhashim@utem.edu.my', N'password', N'+606 270 2769', N'rahman.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (29, N'DR. NURUL AZMA BINTI ZAKARIA', N'azma@utem.edu.my', N'password', N'+606 270 2506', N'azma.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (30, N'NOR AZMAN BIN MAT ARIFF', N'nazman@utem.edu.my', N'password', N'+606 270 2521', N'azman.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (31, N'TS. SUHAIMI BIN BASRAH', N'suhaimibasrah@utem.edu.my', N'password', N'+606 270 2499', N'suhaimi.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (32, N'KHADIJAH BINTI WAN MOHD GHAZALI', N'khadijah@utem.edu.my', N'password', N'+606 270 2511', N'khadijah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (33, N'TS. DR. NORHARYATI BINTI HARUM', N'norharyati@utem.edu.my', N'password', N'+606 270 2525', N'norhayati.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (34, N'PROFESOR MADYA DR MOHD FAIZAL BIN ABDOLLAH', N'faizalabdollah@utem.edu.my', N'password', N'+606 270 2510', N'faizal.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (35, N'TS. DR. NAZRULAZHAR BIN BAHAMAN', N'nazrulazhar@utem.edu.my', N'password', N'+606 270 2504', N'nazrulazhar.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (36, N'TS. DR. ASLINDA BINTI HASSAN', N'aslindahassan@utem.edu.my', N'password', N'+606 270 2508', N'aslinda.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (37, N'MOHD FADZIL BIN ZULKIFLI', N'fadzil@utem.edu.my', N'password', N'+606 270 2474', N'fadzil.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (38, N'DR. NUR FADZILAH BINTI OTHMAN', N'fadzilah.othman@utem.edu.my', N'password', N'+606 270', N'fadzilah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (39, N'TS. DR. SEK YONG WEE', N'ywsek@utem.edu.my', N'password', N'+606 270 2442', N'sekyongwee.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (40, N'DR. NORHIDAYAH BINTI MOHAMAD', N'norhidayah@utem.edu.my', N'password', NULL, NULL, N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (41, N'ATIKAH SAADAH BINTI SELAMAT', N'atikahsaadah@utem.edu.my', N'password', NULL, N'atikah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (42, N'DR. SITI AZIRAH BINTI ASMAI', N'azirah@utem.edu.my', N'password', N'+606 270 2429', N'azirah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (43, N'IRDA BINTI ROSLAN', N'irda@utem.edu.my', N'password', N'+606 270 2520', N'irda.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (44, N'TS. DR. GEDE PRAMUDYA ANANTA', N'gedepramudya@utem.edu.my', N'password', N'+606 270 2446', N'gede.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (45, N'DR. SAZELIN BINTI ARIF', N'sazelin@utem.edu.my', N'password', N'+606 270 2725', N'sazelin.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (46, N'PROFESOR TS. DR. GOH ONG SING', N'goh@utem.edu.my', N'password', N'+606 270 1580', N'goh.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (47, N'DATIN TS. NURAZLINA BINTI MD SANUSI', N'nurazlina@utem.edu.my', N'password', N'+606 270 2481', N'azlina.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (48, N'PROFESOR MADYA TS. DR. NURUL AKMAR BINTI EMRAN', N'nurulakmar@utem.edu.my', N'password', N'+606 270 2459', N'akmar.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (49, N'TS. DR. LIZAWATI BINTI SALAHUDDIN', N'lizawati@utem.edu.my', N'password', N'+606 331 6738', N'lizawati.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (50, N'MOHAMAD TAHKIM BIN SALAHUDIN', N'tahkim@utem.edu.my', N'password', N'+606 270 2761', N'tahkim.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (51, N'DR. LINDA KHOO MEI SUI', N'linda@utem.edu.my', N'password', N'+606 270 2742', N'linda.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (52, N'KASTURI A/P KANCHYMALAY', N'kasturi@utem.edu.my', N'password', N'+606 270 2483', N'kasturi.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (53, N'ROSMIZA WAHIDA BINTI ABDULLAH', N'rosmiza@utem.edu.my', N'password', N'+606 270 2469', N'rosmiza.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (54, N'TS. HIDAYAH BINTI RAHMALAN', N'hidayah@utem.edu.my', N'password', N'+606 270 2451', N'hidayah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (55, N'TS. DR. NORASHIKIN BINTI AHMAD', N'norashikin@utem.edu.my', N'password', N'+606 270 2455', N'ashikin.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (57, N'TS. ROSLEEN BINTI ABDUL SAMAD', N'rosleen@utem.edu.my', N'password', N'+606 270 2454', N'rosleen.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (58, N'MOHAMAD LUTFI BIN DOLHALIT', N'lutfi@utem.edu.my', N'password', N'+606 270 2543', N'lutfi.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (59, N'TS. AHMAD SHAARIZAN BIN SHAARANI', N'shaarizan@utem.edu.my', N'password', N'+606 270 4527', N'shaarizan.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (60, N'PROFESOR MADYA TS. DR. ZURAIDA BINTI ABAL ABAS', N'zuraidaa@utem.edu.my', N'password', N'+606 270 2435', N'zuraida.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (61, N'ISMAIL BIN IBRAHIM', N'ismailibrahim@utem.edu.my', N'password', N'+606 270 2735', N'ismail.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (62, N'TS. DR. SAZALINSYAH BIN RAZALI', N'sazalinsyah@utem.edu.my', N'password', N'+606 270 2436', N'sazali.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (63, N'PROFESOR MADYA TS. DR. AHMAD NAIM BIN CHE PEE @ CHE HANAPI', N'naim@utem.edu.my', N'password', N'+606 270 2535', N'naim.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (64, N'DR. MOHD HAFIZ BIN ZAKARIA', N'hafiz@utem.edu.my', N'password', N'+606 270 2533', N'hafiz.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (65, N'TS. DR. IBRAHIM BIN AHMAD', N'ibrahim@utem.edu.my', N'password', N'+606 270 2540', N'ibrahim.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (66, N'DR. FAUZIAH BINTI KASMIN', N'fauziah@utem.edu.my', N'password', N'+606 270 2428', N'fauziah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (67, N'DR. FARAH NADIA BINTI AZMAN', N'farah@utem.edu.my', N'password', N'+606 270 2538', N'farah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (68, N'NAZREEN BIN ABDULLASIM', N'nazreen.abdullasim@utem.edu.my', N'password', N'+606 270 2550', N'nazreen.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (69, N'TS. DR. HAMZAH ASYRANI BIN SULAIMAN', N'asyrani@utem.edu.my', N'password', N'+606 270 2545', N'hamzah.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (70, N'HARTINI BINTI AZMAN', N'hartini@utem.edu.my', N'password', NULL, N'hartini.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (71, N'SHAHRIL BIN PARUMO', N'shahrilparumo@utem.edu.my', N'password', N'+606 270 2541', N'shahril.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (72, N'TS. AHMAD FADZLI NIZAM BIN ABDUL RAHMAN', N'	fadzli@utem.edu.my', N'password', N'+606 270 2424', N'fadzli.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (73, N'ZURAINI BINTI OTHMAN', N'	zuraini@utem.edu.my', N'password', N'+606 270 2438', N'zuraini.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (74, N'ANIZA BINTI OTHMAN', N'aniza@utem.edu.my', N'password', N'+606 270 2450', N'aniza.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (75, N'AMIR SYARIFUDDIN BIN KASIM', N'syarifuddin@utem.edu.my', N'password', N'+606 331 6535', N'amir.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (76, N'TS. MUHAMAD SYAHRUL AZHAR BIN SANI', N'	syahrul@utem.edu.my', N'password', N'+606 270 2494', N'syahrul.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (77, N'TS. DR. WAHIDAH BINTI MD SHAH', N'wahidah@utem.edu.my', N'password', N'+606 270 2495', N'wahidah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (78, N'TS. DR. MOHD RIZUAN BIN BAHARON', N'	mohd.rizuan@utem.edu.my', N'password', N'+606 270 2513', N'rizuan.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (80, N'DR. NUR ZAREEN BINTI ZULKARNAIN', N'zareen@utem.edu.my', N'password', N'+606 270 2556', N'zareen.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (81, N'TS. DR. ZERATUL IZZAH BINTI  MOHD YUSOH', N'zeratul@utem.edu.my', N'password', N'+606 270 2430', N'zeratul.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (82, N'PROFESOR MADYA TS. DR. CHOO YUN HUOY', N'huoy@utem.edu.my', N'password', N'+606 270 2427', N'choo.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (83, N'TS. DR. ABDUL SYUKOR BIN MOHAMAD JAYA', N'	syukor@utem.edu.my', N'password', N'+606 270 2439', N'syukor.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (84, N'TS. MASHANUM BINTI OSMAN', N'mashanum@utem.edu.my', N'password', N'+606 270 2476', N'mashanum.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (85, N'PROFESOR MADYA DR ABD SAMAD BIN HASAN BASARI', N'abdsamad@utem.edu.my', N'password', N'+606 270 2431', N'samad.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (86, N'PROFESOR MADYA GS. DR. ASMALA BIN AHMAD', N'asmala@utem.edu.my', N'password', N'+606 270 1317', N'asmala.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (87, N'TS. DR. RAIHANA SYAHIRAH BINTI ABDULLAH', N'raihana.syahirah@utem.edu.my', N'password', N'+606 270 2526', N'raihana.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (88, N'TS. DR. MOHD ZAKI BIN MAS''UD', N'	zaki.masud@utem.edu.my', N'password', N'+606 270 2518', N'zaki.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (90, N'TS. DR. NGO HEA CHOON', N'	heachoon@utem.edu.my', N'password', N'+606 270 2440', N'ngo.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (91, N'DR. NOOR FAZILLA BINTI ABD YUSOF', N'elle@utem.edu.my', N'password', N'+606 270 2562', N'fazilla.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (92, N'PROFESOR MADYA TS. DR. NORASIKEN BINTI BAKAR', N'	norasiken@utem.edu.my', N'password', N'+606 270 4528', N'asiken.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (93, N'TS. DR. SITI NURUL MAHFUZAH BINTI MOHAMAD', N'mahfuzah@utem.edu.my', N'password', N'+606 270 2551', N'mahfuzah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (94, N'PROFESOR DR. MOHAMMAD ISHAK BIN DESA', N'mohammad.ishak@utem.edu.my', N'password', N'+606 270 2447', N'ishak.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (95, N'ABDUL RAZAK BIN HUSSAIN', N'razak@utem.edu.my', N'password', N'+606 270 2452', N'razak.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (96, N'ALBERT FEISAL @ MUHD FEISAL BIN ISMAIL', N'feisal@utem.edu.my', N'password', NULL, N'feisal.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (97, N'PROFESOR DR. NANNA SURYANA', N'	nsuryana@utem.edu.my', N'password', N'+606 270 1322', N'nanna.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (98, N'MOHD HARIZ BIN NAIM @ MOHAYAT', N'mohdhariz@utem.edu.my', N'password', N'+606 270 2490', N'hariz.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (99, N'DR. INTAN ERMAHANI BINTI A. JALIL', N'ermahani@utem.edu.my', N'password', N'+606 270 2465', N'intan.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (100, N'TS. NOR MAS AINA BINTI MD. BOHARI', N'aina@utem.edu.my', N'password', N'+606 270 2463', N'aina.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (101, N'PROFESOR MADYA DR SABRINA BINTI AHMAD', N'sabrinaahmad@utem.edu.my', N'password', N'+606 270 2462', NULL, NULL, NULL)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (102, N'DR. NORUN NAJJAH BINTI AHMAT', N'najjah@utem.edu.my', N'password', N'+606 270 2733', N'najjah.jpg', N'F', 2)
GO
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (103, N'DR. YOGAN A/L JAYA KUMAR', N'yogan@utem.edu.my', N'password', N'+606 270 2441', N'yogan.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (104, N'PROFESOR DR. MOHD KHANAPI BIN ABD GHANI', N'khanapi@utem.edu.my', N'password', N'+606 270 2471', N'khanapi.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (105, N'PROFESOR MADYA TS. DR. MOHD SANUSI BIN AZMI', N'	sanusi@utem.edu.my', N'password', N'+606 270 2472', N'sanusi.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (106, N'PROFESOR MADYA TS. DR. MASSILA BINTI KAMALRUDIN', N'massila@utem.edu.my', N'password', N'+606 270 2807', N'massila.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (107, N'TS. DR. MUHAMMAD HAZIQ LIM BIN ABDULLAH', N'haziq@utem.edu.my', N'password', N'+606 270 2539', N'haziq.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (108, N'DR. ABDUL KARIM BIN MOHAMAD', N'	karim@utem.edu.my', N'password', N'+606-331 6988', N'karim.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (109, N'TS. NOR HASLINDA BINTI ISMAIL', N'	lynda@utem.edu.my', N'password', N'+606 270 2485', N'haslinda.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (110, N'MOHD AMIN BIN MOHAMAD', N'amin@utem.edu.my', N'password', NULL, N'amin.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (111, N'TS. DR. SITI RAHAYU BINTI SELAMAT', N'sitirahayu@utem.edu.my', N'password', N'+606 270 2509', N'rahayu.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (112, N'PROFESOR MADYA DR NOR AZMAN BIN ABU', N'nura@utem.edu.my', N'password', N'+606 270 2514', N'nura.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (113, N'DR. S.M.WARUSIA MOHAMED BIN S.M.M YASSIN', N'	s.m.warusia@utem.edu.my', N'password', N'+606 270 2528', N'warusia.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (114, N'MOHD SHAMSURI BIN MD SAAD', N'shamsuri@utem.edu.my', N'password', N'+606 270 2720', N'shamsuri.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (115, N'NURLISA LOKE BINTI ABDULLAH', N'nurlisa@utem.edu.my', N'password', NULL, NULL, N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (116, N'TS. HANIZA BINTI NAHAR', N'haniza@utem.edu.my', N'password', N'+606 270 2498', N'haniza.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (117, N'DR. NORHAZWANI BINTI MD YUNOS', N'wanie.my@utem.edu.my', N'password', N'+606 270 2444', N'hazwani.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (118, N'GS. TS. DR. SAFIZA SUHANA BINTI KAMAL BAHARIN', N'safiza@utem.edu.my', N'password', N'+606 270 2449', N'safiza.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (119, N'TS. MASLITA BINTI ABD AZIZ', N'	maslita@utem.edu.my', N'password', N'+606 270 2448', N'maslita.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (120, N'DR. ZAHRIAH BINTI OTHMAN', N'zahriah@utem.edu.my', N'password', N'+606 270 2460', N'zahriah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (122, N'NOOR BAIDURI BINTI ABD HALIM', N'baiduri@utem.edu.my', N'password', NULL, N'baiduri.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (123, N'NADIAH BINTI ZAINAL ABIDIN', N'nadiah@utem.edu.my', N'password', NULL, N'nadiah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (124, N'NUZULHA KHILWANI BINTI IBRAHIM', N'	nuzulha@utem.edu.my', N'password', N'+606 270 2443', N'nuzulha.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (125, N'PROFESOR MADYA DR BURHANUDDIN BIN MOHD ABOOBAIDER', N'burhanuddin@utem.edu.my', N'password', N'+606 270 2437', N'burhan.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (126, N'YAHYA BIN IBRAHIM', N'yahya@utem.edu.my', N'password', N'	+606 270 2453', N'yahya.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (127, N'NOR LAILATUL AZILAH BINTI HAMDZAH', N'lailatulazilah@utem.edu.my', N'password', N'+606 270 2763', N'azilah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (128, N'NOOR AZILAH BINTI DRAMAN@MUDA', N'	azilah@utem.edu.my', N'password', N'+606 270 2456', N'nazilah.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (129, N'MOHD NAJWAN BIN MD KHAMBARI', N'	najwan@utem.edu.my', N'password', N'+606 270 2523', N'najwan.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (130, N'DR. INDRA DEVI A/P M.SUBRAMANIAM', N'indradevi@utem.edu.my', N'password', NULL, N'devi.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (132, N'TS. DR. NORASWALIZA BINTI ABDULLAH', N'noraswaliza@utem.edu.my', N'password', N'+606 270 2468', N'aswaliza.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (133, N'DR. MAHADI BIN ABU HASSAN', N'mahadi@utem.edu.my', N'password', N'+606 270 2731', N'mahadi.jpg', N'M', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (134, N'DR. ZAHEERA BINTI ZAINAL ABIDIN', N'zaheera@utem.edu.my', N'password', N'+606 270 2522', N'zaheera.jpg', N'F', 2)
INSERT [dbo].[Lecturer] ([ID], [Name], [Email], [Password], [NoPhone], [Image], [Gender], [RoleID]) VALUES (135, N'TS. DR. MOHD FAIRUZ ISKANDAR BIN OTHMAN', N'mohdfairuz@utem.edu.my', N'password', N'+606 270 4523', N'fairuz.jpg', N'M', 2)
SET IDENTITY_INSERT [dbo].[Lecturer] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Lecturer')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Student')
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (1, N'BK 1', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (2, N'BK 2', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (3, N'BK 3', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (4, N'BK 4', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (5, N'BK 5', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (6, N'BK 6', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (7, N'BK 7', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (8, N'BK 8', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (9, N'BK 9 & 10', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (10, N'RECAP ROOM', 1)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (11, N'MAKMAL CCNA/CCNP', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (12, N'MAKMAL PERMAINAN KOMPUTER', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (13, N'MAKMAL KESELAMATAN 1', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (14, N'MAKMAL KESELAMATAN 2', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (15, N'MAKMAL KEJURUTERAAN PERISIAN 1', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (16, N'MAKMAL KEJURUTERAAN PERISIAN 2', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (17, N'MAKMAL KEJURUTERAAN PERISIAN 3', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (18, N'MAKMAL MULTIMEDIA 1', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (19, N'MAKMAL MULTIMEDIA 2', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (20, N'MAKMAL MULTIMEDIA 3', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (21, N'MAKMAL MULTIMEDIA 4', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (22, N'MAKMAL PENGATURCARAAN 1', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (23, N'MAKMAL PENGATURCARAAN 2', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (24, N'MAKMAL PENGATURCARAAN 3', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (25, N'MAKMAL PENGATURCARAAN 4', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (26, N'MAKMAL PANGKALAN DATA 1', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (27, N'MAKMAL PANGKALAN DATA 2', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (28, N'MAKMAL PANGKALAN DATA 3', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (29, N'MAKMAL RANGKAIAN 1', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (30, N'MAKMAL RANGKAIAN 2', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (31, N'MAKMAL KEPINTARAN BUATAN 1', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (32, N'MAKMAL KEPINTARAN BUATAN 2', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (33, N'MAKMAL KEPINTARAN BUATAN 3', 2)
INSERT [dbo].[Room] ([ID], [Name], [Type_ID]) VALUES (34, N'MAKMAL KEPINTARAN BUATAN 4', 2)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (1, 2, 253, 1, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (2, 7, 264, 2, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (3, 26, 254, 1, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (4, 15, 265, 2, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (5, 8, 255, 1, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (6, 10, 266, 2, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (7, 29, 256, 1, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (8, 29, 267, 2, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (9, 4, 259, 1, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (10, 8, 268, 2, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (11, 34, 260, 1, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (12, 13, 269, 2, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (13, 10, 261, 1, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (14, 1, 270, 2, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (15, 31, 262, 1, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (16, 13, 271, 2, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (17, 10, 282, 1, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (18, 7, 272, 2, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (19, 26, 283, 1, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (20, 31, 273, 2, 3, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (21, 5, 274, 2, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (22, 31, 275, 2, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (23, 4, 276, 2, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (24, 24, 277, 2, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (25, 6, 278, 2, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (26, 27, 279, 2, 4, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (27, 20, 280, 2, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (28, 2, 106, 13, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (29, 6, 123, 14, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (30, 10, 137, 15, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (31, 13, 107, 13, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (32, 14, 124, 14, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (33, 13, 138, 15, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (34, 6, 108, 13, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (35, 6, 125, 14, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (36, 2, 139, 15, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (37, 17, 109, 13, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (38, 29, 126, 14, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (39, 30, 140, 15, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (40, 2, 110, 13, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (41, 5, 127, 14, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (42, 9, 141, 15, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (43, 23, 111, 13, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (44, 29, 128, 14, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (45, 29, 142, 15, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (46, 1, 112, 13, 3, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (47, 7, 129, 14, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (48, 2, 143, 15, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (49, 26, 113, 13, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (50, 20, 130, 14, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (51, 26, 144, 15, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (52, 1, 114, 13, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (53, 2, 131, 14, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (54, 3, 145, 15, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (55, 23, 115, 13, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (56, 13, 132, 14, 5, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (57, 29, 146, 15, 5, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (58, 8, 116, 13, 5, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (59, 1, 133, 14, 5, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (60, 31, 117, 13, 5, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (61, 30, 134, 14, 5, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (62, 1, 74, 10, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (63, 2, 85, 11, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (64, 10, 97, 12, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (65, 20, 75, 10, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (66, 28, 86, 11, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (67, 30, 98, 12, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (68, 5, 78, 10, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (69, 4, 87, 11, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (70, 5, 99, 12, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (71, 25, 79, 10, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (72, 28, 88, 11, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (73, 11, 100, 12, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (74, 4, 80, 10, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (75, 9, 89, 11, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (76, 7, 101, 12, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (77, 31, 81, 10, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (78, 28, 90, 11, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (79, 15, 102, 12, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (80, 5, 91, 11, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (81, 6, 103, 12, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (82, 32, 92, 11, 3, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (83, 14, 104, 12, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (84, 10, 93, 11, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (85, 24, 94, 11, 4, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (86, 8, 95, 11, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (87, 19, 96, 11, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (88, 9, 1, 4, 1, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (89, 1, 18, 5, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (90, 4, 28, 6, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (91, 20, 2, 4, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (92, 18, 19, 5, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (93, 14, 29, 6, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (94, 4, 3, 4, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (95, 7, 20, 5, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (96, 4, 30, 6, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (97, 30, 4, 4, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (98, 26, 21, 5, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (99, 13, 31, 6, 2, 5)
GO
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (100, 9, 5, 4, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (101, 7, 22, 5, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (102, 8, 32, 6, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (103, 27, 6, 4, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (104, 18, 23, 5, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (105, 28, 33, 6, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (106, 5, 7, 4, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (107, 8, 24, 5, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (108, 1, 34, 6, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (109, 20, 8, 4, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (110, 20, 25, 5, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (111, 27, 35, 6, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (112, 9, 9, 4, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (113, 10, 36, 6, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (114, 21, 10, 4, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (115, 33, 37, 6, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (116, 5, 11, 4, 5, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (117, 11, 12, 4, 5, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (118, 4, 39, 7, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (119, 9, 52, 8, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (120, 6, 64, 9, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (121, 14, 40, 7, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (122, 20, 53, 8, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (123, 15, 65, 9, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (124, 6, 41, 7, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (125, 6, 54, 8, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (126, 7, 66, 9, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (127, 33, 42, 7, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (128, 32, 55, 8, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (129, 20, 67, 9, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (130, 10, 43, 7, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (131, 10, 56, 8, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (132, 3, 68, 9, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (133, 22, 44, 7, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (134, 13, 57, 8, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (135, 18, 69, 9, 3, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (136, 7, 45, 7, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (137, 6, 58, 8, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (138, 1, 70, 9, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (139, 16, 46, 7, 4, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (140, 18, 59, 8, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (141, 32, 71, 9, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (142, 10, 60, 8, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (143, 26, 61, 8, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (144, 6, 148, 16, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (145, 3, 165, 17, 1, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (146, 7, 176, 18, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (147, 21, 149, 16, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (148, 13, 166, 17, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (149, 17, 177, 18, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (150, 8, 150, 16, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (151, 9, 167, 17, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (152, 9, 178, 18, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (153, 21, 151, 16, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (154, 23, 168, 17, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (155, 19, 179, 18, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (156, 4, 152, 16, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (157, 1, 169, 17, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (158, 4, 180, 18, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (159, 26, 153, 16, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (160, 23, 170, 17, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (161, 25, 181, 18, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (162, 5, 154, 16, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (163, 2, 171, 17, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (164, 9, 182, 18, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (165, 21, 155, 16, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (166, 28, 172, 17, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (167, 21, 183, 18, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (168, 7, 156, 16, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (169, 3, 173, 17, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (170, 2, 184, 18, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (171, 20, 157, 16, 4, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (172, 30, 174, 17, 5, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (173, 25, 185, 18, 5, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (174, 9, 186, 19, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (175, 10, 199, 20, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (176, 5, 211, 21, 1, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (177, 27, 187, 19, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (178, 32, 200, 20, 1, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (179, 20, 212, 21, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (180, 5, 188, 19, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (181, 8, 201, 20, 2, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (182, 4, 213, 21, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (183, 22, 189, 19, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (184, 16, 202, 20, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (185, 26, 214, 21, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (186, 10, 190, 19, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (187, 1, 203, 20, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (188, 3, 215, 21, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (189, 26, 191, 19, 3, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (190, 24, 204, 20, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (191, 25, 216, 21, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (192, 10, 192, 19, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (193, 10, 205, 20, 3, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (194, 6, 217, 21, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (195, 12, 193, 19, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (196, 22, 206, 20, 4, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (197, 19, 218, 21, 4, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (198, 9, 207, 20, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (199, 11, 208, 20, 4, 6)
GO
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (200, 6, 220, 22, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (201, 2, 233, 23, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (202, 7, 243, 24, 1, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (203, 29, 221, 22, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (204, 17, 234, 23, 1, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (205, 33, 244, 24, 1, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (206, 5, 222, 22, 1, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (207, 8, 235, 23, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (208, 7, 245, 24, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (209, 21, 223, 22, 2, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (210, 25, 236, 23, 2, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (211, 28, 246, 24, 2, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (212, 4, 224, 22, 2, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (213, 10, 237, 23, 2, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (214, 10, 247, 24, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (215, 31, 225, 22, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (216, 11, 238, 23, 3, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (217, 28, 248, 24, 3, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (218, 1, 226, 22, 3, 4)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (219, 7, 239, 23, 3, 2)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (220, 6, 249, 24, 3, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (221, 25, 227, 22, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (222, 20, 240, 23, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (223, 11, 250, 24, 4, 5)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (224, 4, 228, 22, 4, 3)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (225, 2, 241, 23, 4, 6)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (226, 11, 229, 22, 4, 7)
INSERT [dbo].[Slot] ([ID], [Room_ID], [Lect_Sub_ID], [Course_ID], [Timetable_ID], [Number]) VALUES (227, 27, 242, 23, 4, 2)
SET IDENTITY_INSERT [dbo].[Slot] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (1, N'SYAHIRAH BINTI MOHAMAD AZAHRI', N'b031810284@student.utem.edu.my', N'password', N'syahirah.jpg', N'F', 3, 7)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (2, N'SITI SOLEHAH BINTI AZIT', N'b031810198@student.utem.edu.my', N'password', N'solehah.jpg', N'F', 3, 16)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (3, N'LUHMAN MUSA BIN ABDUL MUTALIP', N'b031810249@student.utem.edu.my', N'password', N'musa.jpg', N'M', 3, 19)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (4, N'NUR EMILIA SYAFIQAH BINTI RASID', N'b031810263@student.utem.edu.my', N'password', N'emilia.jpg', N'F', 3, 4)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (5, N'NABILAH ZAYANI BINTI YAACOB', N'b031810275@student.utem.edu.my', N'password', N'nabilah.jpg', N'F', 3, 22)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (6, N'ELLE ALIZ BINTI AMINUDDIN', N'b031810295@student.utem.edu.my', N'password', N'elle.jpg', N'F', 3, 13)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (7, N'FATIN MAHFUZAH BINTI RAZI', N'b031810329@student.utem.edu.my', N'password', N'fatin.jpg', N'F', 3, 10)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (8, N'WAN NAZIF DANIAL BIN WAN MOHD NAZLEE', N'd031810061@student.utem.edu.my', N'password', N'wan.jpg', N'M', 3, 1)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (9, N'UMIZATUL SYAHIIDA BINTI RAJMAL', N'd031710295@student.utem.edu.my', N'password', N'umi.jpg', N'F', 3, 2)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (10, N'MOHAMAD DARWISH BIN MOHAMAD ALWAN', N'b031710007@student.utem.edu.my', N'password', N'darwish.jpg', N'M', 3, 20)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (11, N'NUR HAZIRAH BINTI MOHD SHABRI', N'b031710152@student.utem.edu.my', N'password', N'hazirah.jpg', N'F', 3, 8)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (12, N'SOW CHEN WEI', N'b031710174@student.utem.edu.my', N'password', N'sow.jpg', N'M', 3, 14)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (13, N'ASILAHTUL AFRINA BINTI SAMSUDIN', N'b031710287@student.utem.edu.my', N'password', N'asilah.jpg', N'F', 3, 23)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (14, N'	NURUL AIN NABILA BINTI MOHAMAD SHUKRI', N'b031710351@student.utem.edu.my', N'password', N'nurul.jpg', N'F', 3, 5)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (15, N'NUR NAJWA SYAZWANI BINTI AHMAD KAMAL ARIFFIN', N'b031710370@student.utem.edu.my', N'password', N'najwa.jpg', N'F', 3, 17)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (16, N'ARIFF ISKANDAR ZULKARNAIN BIN NORMAN', N'b031710373@student.utem.edu.my', N'password', N'ariff.jpg', N'M', 3, 11)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (17, N'MUHAMMAD FIRDAUS BIN FAZIL', N'b031610039@student.utem.edu.my', N'password', N'firdaus.jpg', N'M', 3, 21)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (18, N'AHMAD ''AIZUDDIN BIN AB GHALIB', N'b031610040@student.utem.edu.my', N'password', N'ahmad.jpg', N'M', 3, 24)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (19, N'	EZATUL AMIERA BINTI ABDUL RAHMAN', N'b031610055@student.utem.edu.my', N'password', N'amiera.jpg', N'F', 3, 6)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (20, N'NATALIE RACHEL RAPHAEL', N'b031610280@student.utem.edu.my', N'password', N'natalie.jpg', N'F', 3, 15)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (21, N'MUHAMAD ZHAFIR AMIR BIN MD SHAH', N'b031610295@student.utem.edu.my', N'password', N'zhafir.jpg', N'M', 3, 12)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (22, N'NUR NADIRAH BINTI HAMZAH', N'b031610302@student.utem.edu.my', N'password', N'nadirah.jpg', N'F', 3, 18)
INSERT [dbo].[Student] ([ID], [Name], [Email], [Password], [Image], [Gender], [RoleID], [Course_ID]) VALUES (23, N'	NURUL ASYIQIN BINTI HAMIDDI', N'b031610451@student.utem.edu.my', N'password', N'asyiqin.jpg', N'F', 3, 9)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (1, N'DITI1223', N'DISCRETE MATHEMATICS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (2, N'DITM2123', N'WEB PROGRAMMING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (3, N'DITP1123', N'PROGRAMMING II')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (4, N'DITP2213', N'SYSTEM ANALYSIS AND DESIGN')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (5, N'DITS2213', N'OPERATING SYSTEM')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (6, N'DLHW2422', N'ENGLISH FOR EFFECTIVE COMMUNICATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (7, N'DITI2213', N'LINEAR ALGEBRA AND NUMERICAL METHODS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (8, N'DITI2223', N'APPLIED STATISTICS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (9, N'DITI3113', N'ARTIFICIAL INTELLIGENCE')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (10, N'DITP2113', N'DATA STRUCTURE AND ALGORITHM')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (11, N'DITP3213', N'SOFTWARE ENGINEERING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (12, N'DITP3323', N'DATABASE ADMINISTRATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (13, N'DITS3613', N'BASIC NETWORKING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (14, N'DITU3933', N'SYSTEM DEVELOPMENT WORKSHOP')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (15, N'DLHW3432', N'ENGLISH FOR MARKETABILITY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (16, N'BITI1223', N'CALCULUS AND NUMERICAL METHODS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (17, N'BITM2113', N'WEB APPLICATION DEVELOPMENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (18, N'BITM2313', N'HUMAN-COMPUTER INTERACTION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (19, N'BITP1123', N'DATA STRUCTURE AND ALGORITHM')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (20, N'BITP1323', N'DATABASE')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (21, N'BITS1313', N'DATA COMMUNICATION AND NETWORKING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (22, N'BLHW1442', N'ENGLISH FOR ACADEMIC PURPOSES')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (23, N'BLHW1702', N'ISLAMIC AND ASIAN CIVILIZATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (24, N'BLHW1742', N'MALAYSIAN STUDIES FOR INTERNATIONAL STUDENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (25, N'BLHW2712', N'ETHNIC RELATIONS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (26, N'BLHW2752', N'MALAYSIAN CULTURE')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (27, N'BITI1113', N'ARTIFICIAL INTELLIGENCE')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (28, N'BITP2213', N'SOFTWARE ENGINEERING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (29, N'BITS2323', N'WIDE AREA NETWORK')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (30, N'BITS2333', N'NETWORK ANALYSIS AND DESIGN')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (31, N'BLHC4032', N'CREATIVE & CRITICAL THINKING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (32, N'BITS2513', N'INTERNET TECHNOLOGY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (33, N'BITS3333', N'MULTIMEDIA NETWORKING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (34, N'BITS3343', N'FIBER OPTIC')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (35, N'BITS3413', N'INFORMATION TECHNOLOGY AND NETWORKING SECURITY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (36, N'BITS3513', N'TCP/IP PROGRAMMING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (37, N'BTMW4012', N'TECHNOLOGY ENTREPRENEURSHIP')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (38, N'BITP2223', N'SOFTWARE REQUIREMENT AND DESIGN')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (39, N'BITP2323', N'DATABASE ADMINISTRATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (40, N'BITP3113', N'OBJECT ORIENTED PROGRAMMING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (41, N'BLHW2403', N'TECHNICAL ENGLISH')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (42, N'BITP3233', N'STRATEGIC INFORMATION SYSTEM PLANNING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (43, N'BITP3353', N'MULTIMEDIA DATABASE')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (44, N'BITP3513', N'ADVANCED DATABASE PROGRAMMING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (45, N'BITE1523', N'GAME PROGRAMMING II')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (46, N'BITE1613', N'2D GAME DEVELOPMENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (47, N'BITE2123', N'ARTIFICIAL INTELLIGENCE FOR GAMES')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (48, N'BITE2613', N'INTERACTIVE 3D ANIMATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (49, N'BITE2633', N'AUDIO VIDEO PRODUCTION FOR GAME')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (50, N'BITE3633', N'GAMEPLAY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (51, N'BITI2233', N'STATISTICS AND PROBABILITY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (52, N'BITE2623', N'3D GAME DEVELOPMENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (53, N'BITE3523', N'GAME PHYSICS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (54, N'BITE3613', N'GAME PROJECT MANAGEMENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (55, N'BITE3723', N'GAME MECHANICS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (56, N'BITI2113', N'LOGIC PROGRAMMING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (57, N'BITI2213', N'KNOWLEDGE BASED SYSTEM')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (58, N'BITI2223', N'MACHINE LEARNING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (59, N'BITI3523', N'ARTIFICIAL INTELLIGENCE IN ROBOTIC AND AUTOMATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (60, N'BITI3113', N'INTELLIGENT AGENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (61, N'BITI3143', N'EVOLUTIONARY COMPUTING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (62, N'BITI3313', N'IMAGE PROCESSING AND PATTERN RECOGNITION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (63, N'BITI3533', N'ARTIFICIAL INTELLIGENCE PROJECT MANAGEMENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (64, N'BITS3423', N'INFORMATION TECHNOLOGY SECURITY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (65, N'BITM1123', N'INTERACTIVE MEDIA AUTHORING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (66, N'BITS1213', N'OPERATING SYSTEM')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (67, N'BITE3623', N'MOTION GRAPHICS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (68, N'BITM3213', N'INTERACTIVE COMPUTER GRAPHICS')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (69, N'BITM3223', N'VIRTUAL REALITY TECHNOLOGY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (70, N'BITP3453', N'MOBILE APPLICATION DEVELOPMENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (71, N'BITP3253', N'SOFTWARE VERIFICATION AND VALIDATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (72, N'BITP3423', N'SPECIAL TOPIC IN SOFTWARE ENGINEERING')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (73, N'BITS2413', N'NETWORK SECURITY INFRASTRUCTURE AND DESIGN')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (74, N'BITS2423', N'PHYSICAL SECURITY AND ELECTRONIC SURVEILLANCE')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (75, N'BITS2523', N'CYBER LAW AND SECURITY POLICY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (76, N'BITS3443', N'DIGITAL FORENSIC')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (77, N'BITS3473', N'WATERMARKING AND STEGANOGRAPHY')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (78, N'BITS3523', N'COMPUTER AUDIT AND RISK MANAGEMENT')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (79, N'BITS3613', N'HACKING TECHNIQUES AND PREVENTION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (80, N'BLHW3403', N'ENGLISH FOR PROFESSIONAL COMMUNICATION')
INSERT [dbo].[Subject] ([ID], [CodeName], [Name]) VALUES (81, N'DITS3633', N'IMPLEMENTING AND ADMINISTERING ACTIVE DIRECTORY')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Subject_Lecturer] ON 

INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (2, 1, 1, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (3, 2, 3, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (4, 2, 3, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (5, 3, 4, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (6, 3, 4, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (7, 4, 6, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (8, 4, 6, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (9, 5, 8, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (10, 5, 8, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (11, 6, 10, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (12, 6, 10, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (13, 7, 12, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (14, 8, 13, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (15, 9, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (16, 10, 15, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (17, 11, 16, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (18, 12, 18, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (19, 12, 18, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (20, 13, 21, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (21, 13, 21, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (22, 14, 23, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (23, 14, 23, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (24, 15, 24, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (25, 15, 24, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (26, 16, 27, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (27, 17, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (28, 18, 30, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (29, 18, 30, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (30, 19, 32, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (31, 19, 32, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (32, 20, 33, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (33, 20, 33, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (34, 21, 34, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (35, 21, 34, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (36, 22, 36, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (37, 22, 36, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (38, 23, 41, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (39, 24, 44, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (40, 24, 44, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (41, 25, 5, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (42, 25, 5, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (43, 26, 7, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (44, 26, 7, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (45, 27, 20, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (46, 27, 20, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (47, 28, 11, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (48, 29, 45, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (49, 30, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (50, 31, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (51, 32, 16, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (52, 33, 46, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (53, 33, 46, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (54, 34, 47, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (55, 34, 47, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (56, 35, 48, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (57, 35, 48, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (58, 36, 49, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (59, 36, 49, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (60, 37, 30, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (61, 37, 30, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (62, 38, 51, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (64, 39, 2, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (65, 39, 2, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (66, 40, 53, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (67, 40, 53, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (68, 41, 54, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (69, 41, 54, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (70, 42, 55, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (71, 42, 55, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (72, 43, 40, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (74, 44, 58, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (75, 44, 58, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (78, 46, 60, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (79, 46, 60, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (80, 47, 7, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (81, 47, 7, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (82, 48, 12, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (83, 49, 61, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (84, 50, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (85, 51, 62, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (86, 51, 62, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (87, 52, 63, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (88, 52, 63, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (89, 53, 64, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (90, 53, 64, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (91, 54, 65, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (92, 54, 65, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (93, 55, 66, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (94, 55, 66, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (95, 56, 67, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (96, 56, 67, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (97, 57, 68, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (98, 57, 68, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (99, 58, 65, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (100, 58, 65, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (101, 59, 63, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (102, 59, 63, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (103, 60, 69, 1)
GO
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (104, 60, 69, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (105, 61, 70, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (106, 62, 17, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (107, 62, 17, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (108, 63, 73, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (109, 63, 73, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (110, 64, 74, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (111, 64, 74, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (112, 65, 75, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (113, 65, 75, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (114, 66, 77, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (115, 66, 77, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (116, 67, 78, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (117, 67, 78, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (118, 68, 12, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (119, 69, 13, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (120, 70, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (121, 71, 15, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (122, 72, 16, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (123, 73, 80, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (124, 73, 80, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (125, 74, 81, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (126, 74, 81, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (127, 75, 82, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (128, 75, 82, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (129, 76, 83, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (130, 76, 83, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (131, 77, 67, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (132, 77, 67, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (133, 78, 84, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (134, 78, 84, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (135, 79, 26, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (136, 80, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (137, 81, 85, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (138, 81, 85, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (139, 82, 81, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (140, 82, 81, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (141, 83, 86, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (142, 83, 86, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (143, 84, 85, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (144, 84, 85, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (145, 85, 88, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (146, 85, 88, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (147, 86, 70, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (148, 87, 90, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (149, 87, 90, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (150, 88, 92, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (151, 88, 92, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (152, 89, 74, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (153, 89, 74, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (154, 90, 132, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (155, 90, 132, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (156, 91, 76, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (157, 91, 76, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (158, 92, 12, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (159, 93, 16, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (160, 94, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (161, 95, 15, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (162, 96, 16, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (165, 98, 94, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (166, 98, 94, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (167, 99, 4, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (168, 99, 4, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (169, 100, 69, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (170, 100, 69, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (171, 101, 95, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (172, 101, 95, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (173, 102, 29, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (174, 102, 29, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (175, 103, 96, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (176, 104, 93, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (177, 104, 93, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (178, 105, 68, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (179, 105, 68, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (180, 106, 97, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (181, 106, 97, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (182, 107, 98, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (183, 107, 98, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (184, 108, 87, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (185, 108, 87, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (186, 109, 44, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (187, 109, 44, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (188, 110, 99, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (189, 110, 99, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (190, 111, 100, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (191, 111, 100, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (192, 112, 101, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (193, 112, 101, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (194, 113, 12, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (195, 114, 133, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (196, 115, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (197, 116, 102, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (198, 117, 16, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (199, 118, 103, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (200, 118, 103, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (201, 119, 104, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (202, 119, 104, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (203, 120, 105, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (204, 120, 105, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (205, 121, 21, 1)
GO
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (206, 121, 21, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (207, 122, 9, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (208, 122, 9, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (209, 123, 51, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (210, 124, 102, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (211, 125, 107, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (212, 125, 107, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (213, 126, 52, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (214, 126, 52, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (215, 127, 108, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (216, 127, 108, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (217, 128, 98, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (218, 128, 98, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (219, 129, 110, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (220, 130, 60, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (221, 130, 60, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (222, 131, 58, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (223, 131, 58, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (224, 132, 5, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (225, 132, 5, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (226, 133, 100, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (227, 133, 100, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (228, 134, 78, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (229, 134, 78, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (230, 135, 12, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (231, 136, 16, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (232, 137, 14, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (233, 138, 57, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (234, 138, 57, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (235, 139, 95, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (236, 139, 95, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (237, 140, 32, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (238, 140, 32, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (239, 141, 134, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (240, 141, 134, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (241, 142, 135, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (242, 142, 135, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (243, 143, 111, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (244, 143, 111, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (245, 144, 112, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (246, 144, 112, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (247, 145, 113, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (248, 145, 113, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (249, 146, 88, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (250, 146, 88, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (251, 147, 114, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (252, 148, 115, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (253, 149, 73, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (254, 149, 73, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (255, 150, 3, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (256, 150, 3, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (259, 152, 42, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (260, 152, 42, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (261, 153, 77, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (262, 153, 77, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (263, 154, 122, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (264, 155, 86, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (265, 155, 86, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (266, 156, 124, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (267, 156, 124, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (268, 157, 125, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (269, 157, 125, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (270, 158, 119, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (271, 158, 119, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (272, 159, 126, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (273, 159, 126, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (274, 160, 128, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (275, 160, 128, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (276, 161, 129, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (277, 161, 129, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (278, 162, 116, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (279, 162, 116, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (280, 163, 126, 2)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (281, 164, 127, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (282, 151, 118, 1)
INSERT [dbo].[Subject_Lecturer] ([ID], [Course_Sub_ID], [Lect_ID], [Type_ID]) VALUES (283, 151, 118, 2)
SET IDENTITY_INSERT [dbo].[Subject_Lecturer] OFF
INSERT [dbo].[Timetable] ([ID], [Day]) VALUES (1, N'Monday')
INSERT [dbo].[Timetable] ([ID], [Day]) VALUES (2, N'Tuesday')
INSERT [dbo].[Timetable] ([ID], [Day]) VALUES (3, N'Wednesday')
INSERT [dbo].[Timetable] ([ID], [Day]) VALUES (4, N'Thursday')
INSERT [dbo].[Timetable] ([ID], [Day]) VALUES (5, N'Friday')
INSERT [dbo].[Type] ([ID], [Name]) VALUES (1, N'Lecturer')
INSERT [dbo].[Type] ([ID], [Name]) VALUES (2, N'Lab')
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Role]
GO
ALTER TABLE [dbo].[Course_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Course_Subject_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Course_Subject] CHECK CONSTRAINT [FK_Course_Subject_Course]
GO
ALTER TABLE [dbo].[Course_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Course_Subject_Subject] FOREIGN KEY([Subject_ID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Course_Subject] CHECK CONSTRAINT [FK_Course_Subject_Subject]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_Role]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Type] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Type]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Course]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Room] FOREIGN KEY([Room_ID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Room]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Subject_Lecturer] FOREIGN KEY([Lect_Sub_ID])
REFERENCES [dbo].[Subject_Lecturer] ([ID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Subject_Lecturer]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Timetable] FOREIGN KEY([Timetable_ID])
REFERENCES [dbo].[Timetable] ([ID])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Timetable]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Role]
GO
ALTER TABLE [dbo].[Subject_Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Lecturer_Course_Subject] FOREIGN KEY([Course_Sub_ID])
REFERENCES [dbo].[Course_Subject] ([ID])
GO
ALTER TABLE [dbo].[Subject_Lecturer] CHECK CONSTRAINT [FK_Subject_Lecturer_Course_Subject]
GO
ALTER TABLE [dbo].[Subject_Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Lecturer_Lecturer] FOREIGN KEY([Lect_ID])
REFERENCES [dbo].[Lecturer] ([ID])
GO
ALTER TABLE [dbo].[Subject_Lecturer] CHECK CONSTRAINT [FK_Subject_Lecturer_Lecturer]
GO
ALTER TABLE [dbo].[Subject_Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Lecturer_Type] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[Subject_Lecturer] CHECK CONSTRAINT [FK_Subject_Lecturer_Type]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[2] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course_Subject"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject_Lecturer"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Type"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 216
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2760
         Width = 1500
         Width = 2100
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1DIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1DIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1DIT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[14] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Lecturer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject_Lecturer"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course_Subject"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 104
               Left = 459
               Bottom = 217
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Type"
            Begin Extent = 
               Top = 126
               Left = 285
               Bottom = 222
               Right = 471
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 645
         Width =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_KiraSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 3210
         Width = 2655
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_KiraSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_KiraSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[8] 2[1] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Lecturer"
            Begin Extent = 
               Top = 157
               Left = 509
               Bottom = 293
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject_Lecturer"
            Begin Extent = 
               Top = 20
               Left = 286
               Bottom = 150
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Slot"
            Begin Extent = 
               Top = 122
               Left = 12
               Bottom = 252
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Timetable"
            Begin Extent = 
               Top = 197
               Left = 269
               Bottom = 293
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course_Subject"
            Begin Extent = 
               Top = 22
               Left = 479
               Bottom = 135
               Right = 649
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 22
               Left = 686
               Bottom = 135
               Right = 856
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 0
               Left = 190
               Bottom = 96
               Right = 360
            End
            Displa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_lect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'yFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room"
            Begin Extent = 
               Top = 55
               Left = 323
               Bottom = 168
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 3510
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 315
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_lect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_lect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Room"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Slot"
            Begin Extent = 
               Top = 7
               Left = 271
               Bottom = 137
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Timetable"
            Begin Extent = 
               Top = 18
               Left = 489
               Bottom = 114
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Subject_Lecturer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Lecturer"
            Begin Extent = 
               Top = 29
               Left = 364
               Bottom = 159
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 0
               Left = 564
               Bottom = 130
               Right = 734
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Type"
            Begin Extent = 
               Top = 84
               Left = 191
               Bottom = 180
               Right = 361
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_sub2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_sub2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_sub2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Subject_Lecturer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject"
            Begin Extent = 
               Top = 0
               Left = 469
               Bottom = 130
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Lecturer"
            Begin Extent = 
               Top = 123
               Left = 430
               Bottom = 253
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Type"
            Begin Extent = 
               Top = 118
               Left = 125
               Bottom = 214
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_sub3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_sub3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_sub3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[15] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Subject"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subject_Lecturer"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Lecturer"
            Begin Extent = 
               Top = 3
               Left = 494
               Bottom = 133
               Right = 664
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Type"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1305
         Width = 2190
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSub'
GO
USE [master]
GO
ALTER DATABASE [Timetable_pro] SET  READ_WRITE 
GO
