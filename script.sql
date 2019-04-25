USE [DB35]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Assignments]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[ClassDateSheet]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[ClassSections]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[DateSheet]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[FeeChallans]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[LookUp]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Payroll]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Results]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[SectionStudents]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[SectionTimetable]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[StuAssignmentMarks]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[StudentResult]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Suggestions]    Script Date: 4/25/2019 1:57:45 AM ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 4/25/2019 1:57:45 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 4/25/2019 1:57:45 AM ******/
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
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (1, 2, 0, CAST(N'2019-04-24 14:01:01.617' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (2, 3, 0, CAST(N'2019-04-24 14:01:10.857' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (3, 4, 0, CAST(N'2019-04-24 14:01:16.530' AS DateTime))
INSERT [dbo].[Class] ([ClassId], [Name], [NumOfStudents], [CreatedOn]) VALUES (4, 5, 0, CAST(N'2019-04-25 01:50:22.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[ClassDateSheet] ([DateSheetId], [CourseId], [Date], [StartTime], [EndTime]) VALUES (0, 2, CAST(N'2018-12-04' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[ClassSections] ON 

INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (1, 13, 8)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (4, 14, 9)
INSERT [dbo].[ClassSections] ([ClassId], [SectionId], [Id]) VALUES (4, 15, 10)
SET IDENTITY_INSERT [dbo].[ClassSections] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (1, 2, 13, N'ABC', N'ssss')
INSERT [dbo].[Courses] ([CourseId], [TeacherId], [SectionId], [Title], [Description]) VALUES (2, 1, 13, N'eee', N'eeeeeee')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[DateSheet] ON 

INSERT [dbo].[DateSheet] ([DateSheetId], [ClassId]) VALUES (1, 1)
SET IDENTITY_INSERT [dbo].[DateSheet] OFF
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
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Gender], [Address], [DateOfBirth]) VALUES (3, N'Huda', N'nfsifn', N'09876543211', 1, N'nin', CAST(N'2019-05-11' AS Date))
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (13, N'A', 0, 2)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (14, N'A', 0, 1)
INSERT [dbo].[Section] ([SectionId], [Name], [NumOfStudents], [TeacherId]) VALUES (15, N'C', 0, 3)
SET IDENTITY_INSERT [dbo].[Section] OFF
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword]) VALUES (1, N'abc@gmail.com', 89000, 4, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword]) VALUES (2, N'uet@gmail.com', 98989, 1, NULL)
INSERT [dbo].[Teacher] ([Id], [Email], [Salary], [InchSec], [ResetPassword]) VALUES (3, N'ddd', 88998, 4, NULL)
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
