USE [DB35]
GO
/****** Object:  Table [dbo].[FeeChallans]    Script Date: 5/2/2019 6:57:16 PM ******/
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
ALTER TABLE [dbo].[FeeChallans]  WITH CHECK ADD  CONSTRAINT [FK_FeeChallans_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[FeeChallans] CHECK CONSTRAINT [FK_FeeChallans_Student]
GO



CREATE TRIGGER trgTriggerName ON [LookUp]
AFTER INSERT AS 
BEGIN
	Print 'NO insertions allowed in this table'
END
