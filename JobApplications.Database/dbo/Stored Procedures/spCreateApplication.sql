-- =============================================
-- Author:		Yuriy Shcherbakov
-- Create date: 09/25/2016
-- Description:	Create a new application.
-- =============================================
CREATE PROCEDURE [dbo].[spCreateApplication] @ApplicantName VARCHAR(200), @CreatedByUser INT, @CreatedDateTime DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Application] (ApplicantName, CreatedByUser, CreatedDateTime)
	VALUES (@ApplicantName, @CreatedByUser, @CreatedDateTime)
	
	RETURN SCOPE_IDENTITY();
	
END
