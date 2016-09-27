-- =============================================
-- Author:		Yuriy Shcherbakov
-- Create date: 09/25/2016
-- Description:	Delete an application.
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteApplication] @ApplicationId int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE FROM [Qualification] WHERE ApplicationID = @ApplicationId

	DELETE FROM [Application] WHERE ID = @ApplicationId

END
