-- =============================================
-- Author:		Yuriy Shcherbakov
-- Create date: 09/25/2016
-- Description:	Return the next unaswered question for application.
-- =============================================
CREATE PROCEDURE dbo.spGetApplicationNextQuestion @ApplicationId int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @MaxAnsweredQuestionNo INT

	SELECT @MaxAnsweredQuestionNo = MAX(Question.DisplayOrder) 
	FROM Qualification 
	JOIN Question on Question.ID = Qualification.QuestionID
	WHERE Qualification.ApplicationID = @applicationId

	SELECT TOP 1 ID, [Text], DisplayOrder 
	FROM Question
	WHERE DisplayOrder > ISNULL(@MaxAnsweredQuestionNo, 0)
	ORDER BY DisplayOrder
END
