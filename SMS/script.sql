USE [DB35]
GO
/****** Object:  Table [dbo].[TeacherTimetable]    Script Date: 5/1/2019 10:34:03 AM ******/
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
/****** Object:  Table [dbo].[Ttable]    Script Date: 5/1/2019 10:34:04 AM ******/
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
ALTER TABLE [dbo].[Ttable]  WITH CHECK ADD  CONSTRAINT [FK_Ttable_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Ttable] CHECK CONSTRAINT [FK_Ttable_Teacher]
GO
