USE [DB35]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 4/27/2019 9:12:42 AM ******/
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
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Section]
GO
