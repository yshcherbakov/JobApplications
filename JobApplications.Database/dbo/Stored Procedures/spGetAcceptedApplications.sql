-- =============================================
-- Author:		Yuriy Shcherbakov
-- Create date: 09/25/2016
-- Description:	Return the next unaswered question for application.
-- =============================================
CREATE PROCEDURE dbo.spGetAcceptedApplications @FromDate DATETIME = NULL, @ToDate DATETIME = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
	  [Application].ID AS [ApplicationID],
	  [Application].ApplicantName,
	  [Application].SubmittedDateTime,
	  [Application].CreatedByUser
	FROM [Application]
	WHERE 
	  [Application].SubmittedDateTime >= ISNULL(@FromDate, '1/1/1900')
	  AND [Application].SubmittedDateTime <= ISNULL(@ToDate, '1/1/2900')
	  AND NOT EXISTS (
	    SELECT 1 FROM Qualification
	    JOIN Question on Question.ID = Qualification.QuestionID
	    JOIN Answer on Answer.ID = Qualification.AnswerID
	    WHERE 
	      Qualification.ApplicationID = [Application].ID
	      AND Answer.IsAcceptable = 0	
	)
END
