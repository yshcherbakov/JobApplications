-- =============================================
-- Author:		Yuriy Shcherbakov
-- Create date: 09/25/2016
-- Description:	Submit answer for an application question.
-- =============================================
CREATE PROCEDURE [dbo].[spSubmitApplication] @ApplicationID int, @SubmittedDateTime DateTime
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @ExistingApplicationID INT, 
	        @ExistingSubmittedDateTime DATETIME
	
	SELECT 
		@ExistingApplicationID = ID, 
		@ExistingSubmittedDateTime = SubmittedDateTime 
	FROM [Application]
	WHERE ID = @ApplicationID
	
	IF @ExistingApplicationID IS NULL
	BEGIN
		RAISERROR ('Invalid Application ID provided.', 16, 1);
		RETURN;
	END  
	
	IF @ExistingSubmittedDateTime IS NOT NULL
	BEGIN
		RAISERROR ('Application has been already submitted.', 16, 1);
		RETURN;
	END  	
	
	-- check if application has unaswered questions?
	IF EXISTS (
		SELECT 1
		FROM Question
		LEFT JOIN Qualification on Qualification.QuestionID = Question.ID
		  AND Qualification.ApplicationID = @ApplicationID
		WHERE Qualification.ID IS NULL )
	BEGIN
		RAISERROR ('Application is not complete yet.', 16, 1);
		RETURN;	
	END	

	UPDATE [Application]
	SET SubmittedDateTime = @SubmittedDateTime
	WHERE ID = @ApplicationID;

END
