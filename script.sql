USE [DB35]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 5/3/2019 1:30:36 AM ******/
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
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubmittedAssign]    Script Date: 5/3/2019 1:30:36 AM ******/
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
	[Content] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_SubmittedAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
ALTER TABLE [dbo].[SubmittedAssign]  WITH CHECK ADD  CONSTRAINT [FK_SubmittedAssign_Assignments] FOREIGN KEY([Assignemnt])
REFERENCES [dbo].[Assignments] ([AssignmentId])
GO
ALTER TABLE [dbo].[SubmittedAssign] CHECK CONSTRAINT [FK_SubmittedAssign_Assignments]
GO
ALTER TABLE [dbo].[SubmittedAssign]  WITH CHECK ADD  CONSTRAINT [FK_SubmittedAssign_Student] FOREIGN KEY([SubmittedBy])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[SubmittedAssign] CHECK CONSTRAINT [FK_SubmittedAssign_Student]
GO
