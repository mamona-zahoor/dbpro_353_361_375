USE [DB35]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 4/28/2019 4:33:09 PM ******/
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
/****** Object:  Table [dbo].[SectionTimetable]    Script Date: 4/28/2019 4:33:10 PM ******/
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
/****** Object:  Table [dbo].[Timetable]    Script Date: 4/28/2019 4:33:10 PM ******/
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
ALTER TABLE [dbo].[SectionTimetable]  WITH CHECK ADD  CONSTRAINT [FK_SectionTimetable_Timetable] FOREIGN KEY([TimetableId])
REFERENCES [dbo].[Timetable] ([TimetableId])
GO
ALTER TABLE [dbo].[SectionTimetable] CHECK CONSTRAINT [FK_SectionTimetable_Timetable]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Section]
GO
