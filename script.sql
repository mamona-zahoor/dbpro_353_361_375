USE [DB35]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 4/28/2019 1:11:57 PM ******/
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
