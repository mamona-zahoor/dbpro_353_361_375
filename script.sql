USE [master]
GO
/****** Object:  Database [DB35]    Script Date: 30-Apr-19 8:19:22 PM ******/
CREATE DATABASE [DB35]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB35', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FARVASQL\MSSQL\DATA\DB35.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB35_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FARVASQL\MSSQL\DATA\DB35_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB35] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB35].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB35] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB35] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB35] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB35] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB35] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB35] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB35] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB35] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB35] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB35] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB35] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB35] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB35] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB35] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB35] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB35] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB35] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB35] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB35] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB35] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB35] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB35] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB35] SET RECOVERY FULL 
GO
ALTER DATABASE [DB35] SET  MULTI_USER 
GO
ALTER DATABASE [DB35] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB35] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB35] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB35] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB35] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB35', N'ON'
GO
ALTER DATABASE [DB35] SET QUERY_STORE = OFF
GO
USE [DB35]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 30-Apr-19 8:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[TotalMarks] [decimal](18, 0) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[SectionId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[SectionId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NOT NULL,
	[NumOfStudents] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassDateSheet]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassDateSheet](
	[DateSheetId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_ClassDateSheet] PRIMARY KEY CLUSTERED 
(
	[DateSheetId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassSections]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSections](
	[ClassId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ClassSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateSheet]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateSheet](
	[DateSheetId] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_DateSheet_1] PRIMARY KEY CLUSTERED 
(
	[DateSheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeeChallans]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeChallans](
	[FeeChallanId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Fee] [decimal](18, 0) NOT NULL,
	[Scholarships] [decimal](18, 0) NULL,
	[Fine] [decimal](18, 0) NULL,
	[TotalFee] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_FeeChallans] PRIMARY KEY CLUSTERED 
(
	[FeeChallanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] NOT NULL,
	[Lecture1] [int] NULL,
	[Lecture2] [int] NULL,
	[Lecture3] [int] NULL,
	[Lecture4] [int] NULL,
	[Lecture5] [int] NULL,
	[L] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[L] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LookUp]    Script Date: 30-Apr-19 8:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookUp](
	[Id] [int] NOT NULL,
	[Category] [varchar](20) NOT NULL,
	[Value] [varchar](20) NOT NULL,
 CONSTRAINT [PK_LookUp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[PayrollId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Salary] [decimal](18, 0) NOT NULL,
	[Bonus] [decimal](18, 0) NULL,
	[Deductions] [decimal](18, 0) NULL,
	[Payable] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Payroll] PRIMARY KEY CLUSTERED 
(
	[PayrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Contact] [varchar](20) NOT NULL,
	[Gender] [int] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[TotalMarks] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](1) NOT NULL,
	[NumOfStudents] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_Section_1] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionTimetable]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTimetable](
	[TimetableId] [int] NOT NULL,
	[Day] [varchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SectionTimetable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StuAssignmentMarks]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StuAssignmentMarks](
	[StudentId] [int] NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[ObtainedMarks] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_StuAssignmentMarks] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[AssignmentId] ASC,
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[ClassId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[Password] [varchar](8) NOT NULL,
	[SecretQuestion] [varchar](50) NULL,
	[SecretAnswer] [varchar](50) NULL,
	[Fee] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttendance](
	[AttendanceId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_StudentAttendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResultId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[ObtainedMarks] [decimal](18, 1) NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suggestions]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suggestions](
	[PersonId] [int] NOT NULL,
	[SuggestionId] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Suggestions] PRIMARY KEY CLUSTERED 
(
	[SuggestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Salary] [decimal](18, 0) NOT NULL,
	[InchSec] [int] NULL,
	[ResetPassword] [varchar](8) NULL,
	[Password] [varchar](20) NULL,
 CONSTRAINT [PK_Teacher_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 30-Apr-19 8:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[TimetableId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
 CONSTRAINT [PK_Timetable_1] PRIMARY KEY CLUSTERED 
(
	[TimetableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserName], [Password]) VALUES (N'AdminSMS', N'Admin_123')
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (1, 2, 0, CAST(N'2019-04-24T14:01:01.617' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (2, 3, 0, CAST(N'2019-04-24T14:01:10.857' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (3, 4, 0, CAST(N'2019-04-24T14:01:16.530' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (4, 5, 0, CAST(N'2019-04-25T01:50:22.573' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (5, 6, 4, CAST(N'2019-04-26T00:15:13.457' AS DateTime))
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[ClassDateSheet] ([DateSheetId], [CourseId], [Date], [StartTime], [EndTime]) VALUES (0, 2, CAST(N'2018-12-04' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ClassSections] ON 

INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (1, 13, 8)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (4, 16, 11)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (5, 23, 18)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (5, 24, 19)
SET IDENTITY_INSERT [dbo].[ClassSections] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (1, 2, 13, N'ABC', N'ssss')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (2, 1, 13, N'eee', N'eeeeeee')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (4, 6, 16, N'Computer', N'blah blah blah')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (5, 2, 16, N'Engilsh', N'nlsksa')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (6, 2, 23, N'Isl', NULL)
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (7, 17, 23, N'Computer', N'blah blah blah')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (8, 17, 16, N'Computer', N'blah blah blah')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (9, 1, 16, N'Computer', N'nlsksa')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (10, 2, 24, N'Computer', N'blah blah blah')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[DateSheet] ON 

INSERT [dbo].[DateSheet] ([DateSheetId], [ClassId]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[DateSheet] OFF
SET IDENTITY_INSERT [dbo].[FeeChallans] ON 

INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (4, 20, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (14, 30, CAST(1000 AS Decimal(18, 0)), NULL, NULL, CAST(1000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (15, 31, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (16, 32, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (17, 33, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (18, 34, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (19, 35, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (20, 36, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status]) VALUES (21, 37, CAST(2000 AS Decimal(18, 0)), NULL, NULL, CAST(2000 AS Decimal(18, 0)), 4)
SET IDENTITY_INSERT [dbo].[FeeChallans] OFF
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (1, N'Gender', N'Male')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (2, N'Gender', N'Female')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (3, N'Status_Pay_Fee', N'Paid')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (4, N'Staus_Pay_Fee', N'Unpaid')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (5, N'Suggestions', N'Pending')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (6, N'Suggentions', N'Fullfilled')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (7, N'Attendance', N'Present')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (8, N'Attendance', N'Absent')
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (9, N'Attendance', N'Leave')
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (1, N'Mamoan', N'dsad', N'09887688998', 2, N'avs', CAST(N'2019-04-20' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (2, N'Haleema', N'Zahoor', N'09876543211', 2, N'nkn', CAST(N'2019-08-20' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (4, N'Usama', N'dsd', N'09876543211', 1, N' iib', CAST(N'2019-09-11' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (6, N'vndskvn', N'kvbdnlvk', N'09876543211', 1, N'd', CAST(N'2019-08-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (7, N'ihiob', N'uobobo', N'09876543211', 2, N'nkln', CAST(N'2019-09-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (11, N'erwe', N'wfn', N'09876543211', 2, N'dnck', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (12, N'Maha', N'Adnan', N'09876543211', 2, N'768676', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (13, N'Hamna', N'Mujahid', N'09876543211', 2, N'dwqw', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (14, N'Yunsa', N'Khalid', N'09876543211', 2, N'vdvd', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (17, N'Mustafa', N'Sheraaz', N'09876543211', 2, N'jofpsf', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (20, N'farva', N'Sardar', N'09876543211', 1, N'aaa', CAST(N'2019-04-15' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (21, N'ayesha', N'farooq', N'09876543211', 1, N'ss', CAST(N'2019-04-10' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (22, N'farva', N'sardar', N'98487437747', 1, N'4555', CAST(N'2019-04-16' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (23, N'hgdc', N'sardar', N'98487437747', 1, N'ddddd', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (24, N'farva', N'hhhhhhhhhhh', N'98487437747', 1, N'aaaaaaaa', CAST(N'2019-04-16' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (25, N'sfs', N'farooq', N'09876543211', 1, N'aaaaa', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (26, N'hgdc', N'sardar', N'09876543211', 1, N'a', CAST(N'2019-04-16' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (27, N'farva', N'hbzcd', N'12345678909', 1, N'a', CAST(N'2019-04-17' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (29, N'farva', N'sardar', N'98487437747', 1, N'aaaaaaa', CAST(N'2019-04-15' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (30, N'cnkcan', N'kvnvdlvn', N'09876543211', 1, N'mdvdm', CAST(N'2019-04-22' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (31, N'farva', N'hbzcd', N'12345678901', 1, N'sssss', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (32, N'farva', N'sardar', N'09876543211', 1, N's', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (33, N'farva', N'sardar', N'09876543211', 1, N'sdf', CAST(N'2019-04-16' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (34, N'farva', N'sardar', N'09876543211', 1, N'dfs', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (35, N'hgdc', N'NVSKNV', N'12345678909', 1, N'df', CAST(N'2019-04-16' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (36, N'farva', N'sardar', N'09876543211', 1, N'addddd', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (37, N'farva', N'sardar', N'09876543211', 1, N'dgf', CAST(N'2019-04-22' AS Date))
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Results] ON 

INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (1, 23, 7, N'MidTerm', CAST(300 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Results] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (13, N'A', 0, 6)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (16, N'B', 0, 7)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (22, N'C', 0, 4)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (23, N'A', 0, 4)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (24, N'B', 4, 2)
SET IDENTITY_INSERT [dbo].[Section] OFF
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (20, N'2-C-28', 1, 20, N'RPEDDHIK', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (30, N'6-A-09', 5, 23, N'ODKHITXO', N'any', N'any', CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (31, N'6-B-45', 5, 24, N'PVXCPRLB', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (32, N'6-B-25', 5, 24, N'VCTAZFPT', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (33, N'6-B-25', 5, 24, N'NARXEJNZ', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (34, N'6-B-11', 5, 24, N'WRLEOLCO', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (35, N'6-B-24', 5, 24, N'ILMQWPLY', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (36, N'6-B-24', 5, 24, N'BUTVCOGR', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (37, N'6-B-24', 5, 24, N'GQMQUHOG', N'any', N'any', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (1, N'abc@gmail.com', CAST(89000 AS Decimal(18, 0)), 4, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (2, N'uet@gmail.com', CAST(98989 AS Decimal(18, 0)), 24, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (4, N'U@gmail.com', CAST(89899 AS Decimal(18, 0)), 23, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (6, N'nkdflnf', CAST(888 AS Decimal(18, 0)), 13, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (7, N'jbkb', CAST(8888 AS Decimal(18, 0)), 16, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (17, N'uetian997@gmail.com', CAST(2500 AS Decimal(18, 0)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([TimetableId], [SectionId]) VALUES (1, 13)
SET IDENTITY_INSERT [dbo].[Timetable] OFF
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Courses]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Section]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Class]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Section]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Teacher]
GO
ALTER TABLE [dbo].[ClassSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassSections_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[ClassSections] CHECK CONSTRAINT [FK_ClassSections_Class]
GO
ALTER TABLE [dbo].[ClassSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassSections_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[ClassSections] CHECK CONSTRAINT [FK_ClassSections_Section]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Section]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Teacher]
GO
ALTER TABLE [dbo].[DateSheet]  WITH CHECK ADD  CONSTRAINT [FK_DateSheet_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[DateSheet] CHECK CONSTRAINT [FK_DateSheet_Class]
GO
ALTER TABLE [dbo].[FeeChallans]  WITH CHECK ADD  CONSTRAINT [FK_FeeChallans_LookUp] FOREIGN KEY([Status])
REFERENCES [dbo].[LookUp] ([Id])
GO
ALTER TABLE [dbo].[FeeChallans] CHECK CONSTRAINT [FK_FeeChallans_LookUp]
GO
ALTER TABLE [dbo].[FeeChallans]  WITH CHECK ADD  CONSTRAINT [FK_FeeChallans_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[FeeChallans] CHECK CONSTRAINT [FK_FeeChallans_Student]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_Lectures_Courses] FOREIGN KEY([Lecture1])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_Lectures_Courses]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_Lectures_Courses1] FOREIGN KEY([Lecture2])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_Lectures_Courses1]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_Lectures_Courses2] FOREIGN KEY([Lecture3])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_Lectures_Courses2]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_Lectures_Courses3] FOREIGN KEY([Lecture4])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_Lectures_Courses3]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_Lectures_Courses4] FOREIGN KEY([Lecture5])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_Lectures_Courses4]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_Lectures_SectionTimetable] FOREIGN KEY([Id])
REFERENCES [dbo].[SectionTimetable] ([Id])
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_Lectures_SectionTimetable]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_LookUp] FOREIGN KEY([Status])
REFERENCES [dbo].[LookUp] ([Id])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_LookUp]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_Teacher]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_LookUp] FOREIGN KEY([Gender])
REFERENCES [dbo].[LookUp] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_LookUp]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK_Results_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK_Results_Courses]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK_Results_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK_Results_Section]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Teacher]
GO
ALTER TABLE [dbo].[SectionTimetable]  WITH CHECK ADD  CONSTRAINT [FK_SectionTimetable_Timetable] FOREIGN KEY([TimetableId])
REFERENCES [dbo].[Timetable] ([TimetableId])
GO
ALTER TABLE [dbo].[SectionTimetable] CHECK CONSTRAINT [FK_SectionTimetable_Timetable]
GO
ALTER TABLE [dbo].[StuAssignmentMarks]  WITH CHECK ADD  CONSTRAINT [FK_StuAssignmentMarks_Assignments] FOREIGN KEY([AssignmentId])
REFERENCES [dbo].[Assignments] ([AssignmentId])
GO
ALTER TABLE [dbo].[StuAssignmentMarks] CHECK CONSTRAINT [FK_StuAssignmentMarks_Assignments]
GO
ALTER TABLE [dbo].[StuAssignmentMarks]  WITH CHECK ADD  CONSTRAINT [FK_StuAssignmentMarks_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StuAssignmentMarks] CHECK CONSTRAINT [FK_StuAssignmentMarks_Student]
GO
ALTER TABLE [dbo].[StuAssignmentMarks]  WITH CHECK ADD  CONSTRAINT [FK_StuAssignmentMarks_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[StuAssignmentMarks] CHECK CONSTRAINT [FK_StuAssignmentMarks_Teacher]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person1] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person1]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_Attendance] FOREIGN KEY([AttendanceId])
REFERENCES [dbo].[Attendance] ([AttendanceId])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_Attendance]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_LookUp] FOREIGN KEY([Status])
REFERENCES [dbo].[LookUp] ([Id])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_LookUp]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_Student2] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_Student2]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Results] FOREIGN KEY([ResultId])
REFERENCES [dbo].[Results] ([ResultId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Results]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student]
GO
ALTER TABLE [dbo].[Suggestions]  WITH CHECK ADD  CONSTRAINT [FK_Suggestions_LookUp] FOREIGN KEY([Status])
REFERENCES [dbo].[LookUp] ([Id])
GO
ALTER TABLE [dbo].[Suggestions] CHECK CONSTRAINT [FK_Suggestions_LookUp]
GO
ALTER TABLE [dbo].[Suggestions]  WITH CHECK ADD  CONSTRAINT [FK_Suggestions_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Suggestions] CHECK CONSTRAINT [FK_Suggestions_Person]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Person]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Section]
GO
USE [master]
GO
ALTER DATABASE [DB35] SET  READ_WRITE 
GO
