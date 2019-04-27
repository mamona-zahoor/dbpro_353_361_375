USE [DB35]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/27/2019 2:00:09 AM ******/
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
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person1] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person1]
GO
