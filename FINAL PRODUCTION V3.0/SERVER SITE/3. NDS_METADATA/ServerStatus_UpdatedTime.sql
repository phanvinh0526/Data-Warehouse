USE [NDS_METADATA]
GO
/****** Object:  Trigger [dbo].[ServerStatus_UpdatedTime]    Script Date: 09/04/2018 1:05:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[ServerStatus_UpdatedTime]
ON [dbo].[ServerStatus]
AFTER UPDATE
AS
BEGIN
	/*
		Check if this is an update action on ServerStatus
			Update the current time of UpdatedDate column
	*/
	UPDATE dbo.ServerStatus
	SET UpdatedDate = GETDATE()
	FROM dbo.ServerStatus ss
	WHERE EXISTS(SELECT 1 FROM inserted i WHERE i.ServerStatusID=ss.ServerStatusID)
END