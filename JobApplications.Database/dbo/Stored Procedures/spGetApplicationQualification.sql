-- =============================================
-- Author:		Yuriy Shcherbakov
-- Create date: 09/25/2016
-- Description:	Return answered questions for application.
-- =============================================
CREATE PROCEDURE [dbo].[spGetApplicationQualification] @ApplicationID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
	  Qualification.ID AS [QualificationID],
	  Question.ID AS [QuestionID],
	  Question.[Text] AS [QuestionText],
	  Question.DisplayOrder AS [QuestionDisplayOrder],
	  Answer.ID AS [AnswerID],
	  Answer.[Text] AS AnswerText
	FROM Qualification 
	JOIN Question on Question.ID = Qualification.QuestionID
	JOIN Answer on Answer.ID = Qualification.AnswerID
	WHERE Qualification.ApplicationID = @applicationID
	ORDER BY Question.DisplayOrder

END
