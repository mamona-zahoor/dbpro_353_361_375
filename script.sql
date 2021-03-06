USE [master]
GO
/****** Object:  Database [DB35]    Script Date: 5/4/2019 4:18:36 PM ******/
CREATE DATABASE [DB35]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB35', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MAMONA\MSSQL\DATA\DB35.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB35_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MAMONA\MSSQL\DATA\DB35_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB35] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [DB35] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB35] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB35', N'ON'
GO
USE [DB35]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[TotalMarks] [decimal](18, 0) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[SectionId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Path] [varchar](max) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[ClassDateSheet]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[ClassSections]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DateSheet]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[FeeChallans]    Script Date: 5/4/2019 4:18:36 PM ******/
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
	[DueDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FeeChallans] PRIMARY KEY CLUSTERED 
(
	[FeeChallanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[LookUp]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Section]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SectionStudents]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionStudents](
	[SectionId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_SectionStudents] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SectionTimetable]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StuAssignmentMarks]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[StudentResult]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[SubmittedAssign]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubmittedAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubmittedBy] [int] NOT NULL,
	[Assignemnt] [int] NOT NULL,
	[Submited_On] [datetime] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[Path] [varchar](max) NOT NULL,
 CONSTRAINT [PK_SubmittedAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suggestions]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TeacherTimetable]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherTimetable](
	[TId] [int] NOT NULL,
	[Lecture1] [int] NULL,
	[Lecture2] [int] NULL,
	[Lecture3] [int] NULL,
	[Lecture4] [int] NULL,
	[Lecture5] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Class1] [int] NULL,
	[Class2] [int] NULL,
	[Class3] [int] NULL,
	[Class4] [int] NULL,
	[Class5] [int] NULL,
 CONSTRAINT [PK_TeacherTimetable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 5/4/2019 4:18:36 PM ******/
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
/****** Object:  Table [dbo].[Ttable]    Script Date: 5/4/2019 4:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ttable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Day] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ttable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([UserName], [Password]) VALUES (N'AdminSMS', N'Admin_123')
SET IDENTITY_INSERT [dbo].[Assignments] ON 

INSERT [dbo].[Assignments] ([AssignmentId], [TotalMarks], [Name], [SectionId], [CourseId], [DueDate], [Title], [TeacherId], [Path], [Description]) VALUES (1, CAST(20 AS Decimal(18, 0)), N'Assignment Lab.docx', 16, 8, CAST(N'2019-05-04 18:00:00.000' AS DateTime), N'ABC', 17, N'C:\Users\Mamuna\Desktop\ABC\dbpro_353_361_375\SMS\SMS\TFiles\Assignment Lab.docx', N'dnsdks')
INSERT [dbo].[Assignments] ([AssignmentId], [TotalMarks], [Name], [SectionId], [CourseId], [DueDate], [Title], [TeacherId], [Path], [Description]) VALUES (2, CAST(10 AS Decimal(18, 0)), N'11111 (1).docx', 16, 8, CAST(N'2019-09-10 00:00:00.000' AS DateTime), N'Blaaaaaaaaah', 17, N'C:\Users\Mamuna\Desktop\ABC\dbpro_353_361_375\SMS\SMS\TFiles\11111 (1).docx', N'onsfosn')
SET IDENTITY_INSERT [dbo].[Assignments] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (1, 2, 0, CAST(N'2019-04-24 14:01:01.617' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (3, 4, 0, CAST(N'2019-04-24 14:01:16.530' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (4, 5, 3, CAST(N'2019-04-25 01:50:22.573' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (5, 6, 3, CAST(N'2019-04-26 00:15:13.457' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (6, 9, 0, CAST(N'2019-04-30 23:57:54.497' AS DateTime))
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[ClassDateSheet] ([DateSheetId], [CourseId], [Date], [StartTime], [EndTime]) VALUES (0, 2, CAST(N'2018-12-04' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ClassSections] ON 

INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (1, 13, 8)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (4, 16, 11)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (5, 24, 19)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (4, 26, 21)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (4, 27, 22)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (4, 28, 23)
SET IDENTITY_INSERT [dbo].[ClassSections] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (1, 2, 13, N'ABC', N'ssss')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (2, 1, 13, N'eee', N'eeeeeee')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (4, 6, 16, N'Computer', N'blah blah blah')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (5, 2, 16, N'Engilsh', N'nlsksa')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (8, 17, 16, N'Computer', N'blah blah blah')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (9, 1, 16, N'Computer', N'nlsksa')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (10, 2, 24, N'Computer', N'blah blah blah')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (13, 17, 13, N'Mathematics', NULL)
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (14, 17, 13, N'Computer', NULL)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[DateSheet] ON 

INSERT [dbo].[DateSheet] ([DateSheetId], [ClassId]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[DateSheet] OFF
SET IDENTITY_INSERT [dbo].[FeeChallans] ON 

INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (1, 12, CAST(280 AS Decimal(18, 0)), NULL, NULL, CAST(280 AS Decimal(18, 0)), 3, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (2, 13, CAST(500 AS Decimal(18, 0)), NULL, NULL, CAST(500 AS Decimal(18, 0)), 4, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (3, 14, CAST(350 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), 3, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (4, 20, CAST(900 AS Decimal(18, 0)), NULL, NULL, CAST(900 AS Decimal(18, 0)), 4, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (5, 21, CAST(700 AS Decimal(18, 0)), NULL, NULL, CAST(700 AS Decimal(18, 0)), 4, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (7, 23, CAST(200 AS Decimal(18, 0)), NULL, NULL, CAST(200 AS Decimal(18, 0)), 4, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (8, 24, CAST(200 AS Decimal(18, 0)), NULL, NULL, CAST(200 AS Decimal(18, 0)), 4, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (10, 26, CAST(300 AS Decimal(18, 0)), NULL, NULL, CAST(300 AS Decimal(18, 0)), 4, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[FeeChallans] ([FeeChallanId], [StudentId], [Fee], [Scholarships], [Fine], [TotalFee], [Status], [DueDate]) VALUES (15, 29, CAST(400 AS Decimal(18, 0)), NULL, NULL, CAST(400 AS Decimal(18, 0)), 3, CAST(N'2019-05-02 00:00:00.000' AS DateTime))
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
INSERT [dbo].[LookUp] ([Id], [Category], [Value]) VALUES (15, N'dss', N'fs')
SET IDENTITY_INSERT [dbo].[Payroll] ON 

INSERT [dbo].[Payroll] ([PayrollId], [TeacherId], [Salary], [Bonus], [Deductions], [Payable], [Status], [Date]) VALUES (1, 17, CAST(2000 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(2500 AS Decimal(18, 0)), 3, CAST(N'2019-04-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Payroll] ([PayrollId], [TeacherId], [Salary], [Bonus], [Deductions], [Payable], [Status], [Date]) VALUES (2, 18, CAST(3000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), 3, CAST(N'2019-04-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Payroll] ([PayrollId], [TeacherId], [Salary], [Bonus], [Deductions], [Payable], [Status], [Date]) VALUES (3, 19, CAST(8000 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(8200 AS Decimal(18, 0)), 3, CAST(N'2019-04-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Payroll] ([PayrollId], [TeacherId], [Salary], [Bonus], [Deductions], [Payable], [Status], [Date]) VALUES (4, 19, CAST(2500 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2700 AS Decimal(18, 0)), 4, CAST(N'2019-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[Payroll] ([PayrollId], [TeacherId], [Salary], [Bonus], [Deductions], [Payable], [Status], [Date]) VALUES (6, 17, CAST(2500 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2700 AS Decimal(18, 0)), 3, CAST(N'2019-04-10 00:00:00.000' AS DateTime))
INSERT [dbo].[Payroll] ([PayrollId], [TeacherId], [Salary], [Bonus], [Deductions], [Payable], [Status], [Date]) VALUES (7, 19, CAST(2500 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2600 AS Decimal(18, 0)), 4, CAST(N'2019-04-02 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payroll] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (1, N'Mamoan', N'dsad', N'09887688998', 2, N'avs', CAST(N'2019-04-20' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (2, N'Haleema', N'Zahoor', N'09876543211', 2, N'nkn', CAST(N'2019-08-20' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (3, N'Huda', N'nfsifn', N'09876543211', 1, N'nin', CAST(N'2019-05-11' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (4, N'Usama', N'dsd', N'09876543211', 1, N' iib', CAST(N'2019-09-11' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (6, N'vndskvn', N'kvbdnlvk', N'09876543211', 1, N'd', CAST(N'2019-08-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (7, N'ihiob', N'uobobo', N'09876543211', 2, N'nkln', CAST(N'2019-09-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (9, N'jjnvdlvn', N'nvdlvn', N'09876543221', 2, N'nkfwnf', CAST(N'2018-08-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (10, N'fsf', N'vins', N'09876543211', 1, N'msld', CAST(N'2018-09-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (11, N'erwe', N'wfn', N'09876543211', 2, N'dnck', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (12, N'Maha', N'Adnan', N'09876543211', 2, N'768676', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (13, N'Hamna', N'Mujahid', N'09876543211', 2, N'dwqw', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (14, N'Yunsa', N'Khalid', N'09876543211', 2, N'vdvd', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (15, N'Adnan', N'Ali', N'09876543211', 2, N'ijuh', CAST(N'0001-01-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (16, N'adas', N'sfsf', N'09876543211', 2, N'cdcd', CAST(N'2019-04-21' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (17, N'Mustafa', N'Sheraaz', N'09876543211', 2, N'jofpsf', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (18, N'Maham', N'Adnan', N'09876543211', 1, N'cnsls', CAST(N'2019-04-08' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (19, N'Madiha', N'Imam', N'09876543211', 1, N'nsfos', CAST(N'2019-04-07' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (20, N'Hammad', N'Waqas', N'09876543211', 1, N'ndvif', CAST(N'2019-04-08' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (21, N'ggs', N'KVNDVN', N'09876543211', 1, N'DD', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (22, N'Hina', N'Mukhtar', N'09876543211', 1, N'jbfej', CAST(N'2019-04-29' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (23, N'Maha', N'Ali', N'09876543211', 1, N'eknw', CAST(N'2019-05-19' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (24, N'huma', N'Badar', N'09876543211', 1, N'dsdsd', CAST(N'2019-05-07' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (25, N'Hamna', N'Abid', N'09876543211', 1, N'eqeb', CAST(N'2019-04-30' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (26, N'KNFKS', N'KNVKDS', N'09876543211', 1, N'cscs', CAST(N'2019-05-14' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (27, N'csj', N'cnsic', N'09876543211', 1, N'fd', CAST(N'2019-05-13' AS Date))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (29, N'nauman', NULL, N'09876543211', 1, N'ib', CAST(N'2019-05-08' AS Date))
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Results] ON 

INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (11, 13, 13, N'MidTerm', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (12, 13, 13, N'MidTerm', CAST(90 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (13, 13, 13, N'Final Term', CAST(90 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (21, 13, 13, N'MidTerm | 2018-19', CAST(30 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (24, 13, 13, N'MidTerm | 2015-16', CAST(30 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (25, 13, 13, N'MidTerm | 17-18', CAST(30 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (26, 16, 8, N'MidTerm | 2018-19', CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (27, 16, 8, N'MidTerm | 17-18', CAST(90 AS Decimal(18, 0)))
INSERT [dbo].[Results] ([ResultId], [SectionId], [CourseId], [Title], [TotalMarks]) VALUES (28, 16, 8, N'AS | 2018-19', CAST(20 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Results] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (13, N'A', 0, 6)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (16, N'B', 0, 7)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (20, N'C', 0, 10)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (22, N'C', 0, 4)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (24, N'B', 2, 2)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (26, N'C', 0, 9)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (27, N'A', 2, 15)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (28, N'D', 0, 16)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (29, N'A', 0, 17)
SET IDENTITY_INSERT [dbo].[Section] OFF
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (12, N'02-B-38', 3, 13, N'any', N'any', N'any', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (13, N'02-B-38', 3, 13, N'any', N'any', N'any', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (14, N'02-B-38', 3, 13, N'any', N'any', N'any', CAST(350 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (20, N'6-A-09', 5, 13, N'MJJKOFFD', N'any', N'any', CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (21, N'6-A-10', 5, 13, N'EPUHBASJ', N'any', N'any', CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (23, N'5-B-9', 4, 24, N'ZPKWCCQV', N'any', N'any', CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (24, N'5-B-9', 4, 24, N'PDULGTOV', N'any', N'any', CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (25, N'6-A-09', 5, 27, N'NCCEUXRT', N'any', N'any', CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (26, N'6-A-10', 5, 27, N'ZWYXEVKX', N'any', N'any', CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (27, N'5-B-89', 4, 16, N'hbk', N'uhhk', N'hk', CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[Student] ([Id], [RegNo], [ClassId], [SectionId], [Password], [SecretQuestion], [SecretAnswer], [Fee]) VALUES (29, N'5-B-10', 4, 16, N'nkn', N'knkn', N'nln', CAST(400 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([Id], [ResultId], [StudentId], [ObtainedMarks]) VALUES (7, 11, 21, CAST(2.0 AS Decimal(18, 1)))
INSERT [dbo].[StudentResult] ([Id], [ResultId], [StudentId], [ObtainedMarks]) VALUES (9, 21, 20, CAST(29.5 AS Decimal(18, 1)))
INSERT [dbo].[StudentResult] ([Id], [ResultId], [StudentId], [ObtainedMarks]) VALUES (10, 25, 21, CAST(24.0 AS Decimal(18, 1)))
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[SubmittedAssign] ON 

INSERT [dbo].[SubmittedAssign] ([Id], [SubmittedBy], [Assignemnt], [Submited_On], [FileName], [Path]) VALUES (6, 27, 1, CAST(N'2019-05-04 15:49:04.157' AS DateTime), N'6-A-09 (1).zip', N'C:\Users\Mamuna\Desktop\Latest\dbpro_353_361_375\SMS\SMS\Files\6-A-09 (1).zip')
INSERT [dbo].[SubmittedAssign] ([Id], [SubmittedBy], [Assignemnt], [Submited_On], [FileName], [Path]) VALUES (7, 27, 1, CAST(N'2019-05-04 13:15:04.013' AS DateTime), N'11111 (2).docx', N'C:\Users\Mamuna\Desktop\ABC\dbpro_353_361_375\SMS\SMS\Files\11111 (2).docx')
INSERT [dbo].[SubmittedAssign] ([Id], [SubmittedBy], [Assignemnt], [Submited_On], [FileName], [Path]) VALUES (8, 29, 1, CAST(N'2019-05-04 15:13:47.027' AS DateTime), N'Database Design.docx', N'C:\Users\Mamuna\Desktop\ABC\dbpro_353_361_375\SMS\SMS\Files\Database Design.docx')
INSERT [dbo].[SubmittedAssign] ([Id], [SubmittedBy], [Assignemnt], [Submited_On], [FileName], [Path]) VALUES (14, 27, 2, CAST(N'2019-05-04 15:29:29.673' AS DateTime), N'ProjectAScripts.txt', N'C:\Users\Mamuna\Desktop\ABC\dbpro_353_361_375\SMS\SMS\Files\ProjectAScripts.txt')
SET IDENTITY_INSERT [dbo].[SubmittedAssign] OFF
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (1, N'abc@gmail.com', CAST(89000 AS Decimal(18, 0)), 16, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (2, N'uet@gmail.com', CAST(98989 AS Decimal(18, 0)), 24, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (3, N'ddd', CAST(88998 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (4, N'U@gmail.com', CAST(89899 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (6, N'nkdflnf', CAST(888 AS Decimal(18, 0)), 13, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (7, N'jbkb', CAST(8888 AS Decimal(18, 0)), 16, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (9, N'bikbi', CAST(98 AS Decimal(18, 0)), 26, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (10, N'cssss', CAST(8 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (15, N'teacher123@gmail.com', CAST(9000 AS Decimal(18, 0)), 27, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (16, N'teacher123@gmail.com', CAST(3000 AS Decimal(18, 0)), 28, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (17, N'uetian997@gmail.com', CAST(2500 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (18, N'uetian997@gmail.com', CAST(3000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword], [Password]) VALUES (19, N'uetian997@gmail.com', CAST(2500 AS Decimal(18, 0)), NULL, NULL, N'tyhsmunf')
SET IDENTITY_INSERT [dbo].[Ttable] ON 

INSERT [dbo].[Ttable] ([Id], [TeacherId], [Day]) VALUES (1, 6, N'Monday')
INSERT [dbo].[Ttable] ([Id], [TeacherId], [Day]) VALUES (2, 17, N'Monday')
SET IDENTITY_INSERT [dbo].[Ttable] OFF
/****** Object:  Index [InchSec]    Script Date: 5/4/2019 4:18:36 PM ******/
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [InchSec] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Courses]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Section]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD  CONSTRAINT [FK_Assignments_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Assignments] CHECK CONSTRAINT [FK_Assignments_Teacher]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Class]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassSections] CHECK CONSTRAINT [FK_ClassSections_Class]
GO
ALTER TABLE [dbo].[ClassSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassSections_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassSections] CHECK CONSTRAINT [FK_ClassSections_Section]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Section]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Teacher]
GO
ALTER TABLE [dbo].[DateSheet]  WITH CHECK ADD  CONSTRAINT [FK_DateSheet_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DateSheet] CHECK CONSTRAINT [FK_DateSheet_Class]
GO
ALTER TABLE [dbo].[FeeChallans]  WITH CHECK ADD  CONSTRAINT [FK_FeeChallans_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
ON DELETE CASCADE
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
ON DELETE CASCADE
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK_Results_Section]
GO
ALTER TABLE [dbo].[SectionStudents]  WITH CHECK ADD  CONSTRAINT [FK_SectionStudents_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SectionStudents] CHECK CONSTRAINT [FK_SectionStudents_Section]
GO
ALTER TABLE [dbo].[SectionStudents]  WITH CHECK ADD  CONSTRAINT [FK_SectionStudents_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[SectionStudents] CHECK CONSTRAINT [FK_SectionStudents_Student]
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
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Section]
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
ON DELETE CASCADE
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student]
GO
ALTER TABLE [dbo].[SubmittedAssign]  WITH CHECK ADD  CONSTRAINT [FK_SubmittedAssign_Assignments] FOREIGN KEY([Assignemnt])
REFERENCES [dbo].[Assignments] ([AssignmentId])
GO
ALTER TABLE [dbo].[SubmittedAssign] CHECK CONSTRAINT [FK_SubmittedAssign_Assignments]
GO
ALTER TABLE [dbo].[SubmittedAssign]  WITH CHECK ADD  CONSTRAINT [FK_SubmittedAssign_Student] FOREIGN KEY([SubmittedBy])
REFERENCES [dbo].[Student] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubmittedAssign] CHECK CONSTRAINT [FK_SubmittedAssign_Student]
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
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Section] FOREIGN KEY([InchSec])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Section]
GO
ALTER TABLE [dbo].[TeacherTimetable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTimetable_Courses] FOREIGN KEY([Lecture3])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[TeacherTimetable] CHECK CONSTRAINT [FK_TeacherTimetable_Courses]
GO
ALTER TABLE [dbo].[TeacherTimetable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTimetable_Courses1] FOREIGN KEY([Lecture2])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[TeacherTimetable] CHECK CONSTRAINT [FK_TeacherTimetable_Courses1]
GO
ALTER TABLE [dbo].[TeacherTimetable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTimetable_Courses2] FOREIGN KEY([Lecture4])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[TeacherTimetable] CHECK CONSTRAINT [FK_TeacherTimetable_Courses2]
GO
ALTER TABLE [dbo].[TeacherTimetable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTimetable_Courses3] FOREIGN KEY([Lecture5])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[TeacherTimetable] CHECK CONSTRAINT [FK_TeacherTimetable_Courses3]
GO
ALTER TABLE [dbo].[TeacherTimetable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTimetable_Courses4] FOREIGN KEY([Lecture1])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[TeacherTimetable] CHECK CONSTRAINT [FK_TeacherTimetable_Courses4]
GO
ALTER TABLE [dbo].[TeacherTimetable]  WITH CHECK ADD  CONSTRAINT [FK_TeacherTimetable_Ttable] FOREIGN KEY([TId])
REFERENCES [dbo].[Ttable] ([Id])
GO
ALTER TABLE [dbo].[TeacherTimetable] CHECK CONSTRAINT [FK_TeacherTimetable_Ttable]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Section]
GO
ALTER TABLE [dbo].[Ttable]  WITH CHECK ADD  CONSTRAINT [FK_Ttable_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ttable] CHECK CONSTRAINT [FK_Ttable_Teacher]
GO
USE [master]
GO
ALTER DATABASE [DB35] SET  READ_WRITE 
GO
