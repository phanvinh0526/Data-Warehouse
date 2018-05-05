USE AG_METADATA
GO
CREATE TRIGGER dbo.Packages_UpdatedTime
ON dbo.Packages
AFTER UPDATE
AS
BEGIN
	/*
		Check if this is an update action on ServerStatus
			Update the current time of UpdatedDate column
	*/
	UPDATE dbo.Packages
	SET UpdatedDate = GETDATE()
	FROM dbo.Packages p
	WHERE EXISTS(SELECT 1 FROM inserted i WHERE i.PackageID=p.PackageID)
END