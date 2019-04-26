USE [DB35]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/25/2019 10:42:50 PM ******/

INSERT [dbo].[Admin] ([UserName], [Password]) VALUES (N'AdminSMS', N'Admin_123')
/****** Object:  Trigger [dbo].[TRGOneAdmin]    Script Date: 4/25/2019 10:42:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[TRGOneAdmin]
ON [dbo].[Admin] INSTEAD OF INSERT AS
Begin
	PRINT 'NO INSERTIONS ALLOWED'
--only one admin allowed
End

GO
