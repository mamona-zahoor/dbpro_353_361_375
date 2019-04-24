USE [master]
GO
/****** Object:  Database [DB35]    Script Date: 4/24/2019 6:27:17 PM ******/
CREATE DATABASE [DB35]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB35', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB35.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB35_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB35_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Admin]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[Assignments]    Script Date: 4/24/2019 6:27:18 PM ******/
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
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](4) NOT NULL,
	[NumOfStudents] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassDateSheet]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[ClassSections]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[DateSheet]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[FeeChallans]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[LookUp]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[Payroll]    Script Date: 4/24/2019 6:27:18 PM ******/
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
 CONSTRAINT [PK_Payroll] PRIMARY KEY CLUSTERED 
(
	[PayrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[Results]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[SectionStudents]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[SectionTimetable]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SectionTimetable](
	[TimetableId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[TimeStart] [time](6) NOT NULL,
	[TimeEnd] [time](6) NOT NULL,
	[Day] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SectionTimetable] PRIMARY KEY CLUSTERED 
(
	[TimetableId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StuAssignmentMarks]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[ClassId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[Password] [varchar](8) NOT NULL,
	[SecretQuestion] [varchar](50) NOT NULL,
	[SecretAnswer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[StudentResult]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[ResultId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[ObtainedMarks] [decimal](18, 0) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suggestions]    Script Date: 4/24/2019 6:27:18 PM ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
	[InchSec] [int] NULL,
	[ResetPassword] [varchar](8) NULL,
 CONSTRAINT [PK_Teacher_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TeacherInch] UNIQUE NONCLUSTERED 
(
	[InchSec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 4/24/2019 6:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[TimetableId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
 CONSTRAINT [PK_Timetable_1] PRIMARY KEY CLUSTERED 
(
	[TimetableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
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
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Courses]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Teacher]
GO
ALTER TABLE [dbo].[ClassDateSheet]  WITH CHECK ADD  CONSTRAINT [FK_ClassDateSheet_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[ClassDateSheet] CHECK CONSTRAINT [FK_ClassDateSheet_Courses]
GO
ALTER TABLE [dbo].[ClassDateSheet]  WITH CHECK ADD  CONSTRAINT [FK_ClassDateSheet_DateSheet] FOREIGN KEY([DateSheetId])
REFERENCES [dbo].[DateSheet] ([DateSheetId])
GO
ALTER TABLE [dbo].[ClassDateSheet] CHECK CONSTRAINT [FK_ClassDateSheet_DateSheet]
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
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Courses]
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
ALTER TABLE [dbo].[SectionStudents]  WITH CHECK ADD  CONSTRAINT [FK_SectionStudents_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[SectionStudents] CHECK CONSTRAINT [FK_SectionStudents_Section]
GO
ALTER TABLE [dbo].[SectionStudents]  WITH CHECK ADD  CONSTRAINT [FK_SectionStudents_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[SectionStudents] CHECK CONSTRAINT [FK_SectionStudents_Student]
GO
ALTER TABLE [dbo].[SectionTimetable]  WITH CHECK ADD  CONSTRAINT [FK_SectionTimetable_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[SectionTimetable] CHECK CONSTRAINT [FK_SectionTimetable_Courses]
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
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Section] FOREIGN KEY([InchSec])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Section]
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
