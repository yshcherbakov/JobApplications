-- =============================================
-- Author:		Yuriy Shcherbakov
-- Create date: 09/25/2016
-- Description:	Submit answer for an application question.
-- =============================================
CREATE PROCEDURE dbo.spSubmitApplicationAnswer @ApplicationID int, @QuestionID int, @AnswerID int
AS
BEGIN
	SET NOCOUNT ON;
	
	IF EXISTS (SELECT 1 FROM Qualification
	           WHERE ApplicationID = @ApplicationID
	             AND QuestionID = @QuestionID
	             AND AnswerID = @AnswerID)
	BEGIN
		UPDATE Qualification
		SET AnswerID = @AnswerID
		WHERE ApplicationID = @ApplicationID
	      AND QuestionID = @QuestionID
	      AND AnswerID = @AnswerID;
	END
	ELSE
	BEGIN
		INSERT INTO Qualification (ApplicationID, QuestionID, AnswerID)
		VALUES (@ApplicationID, @QuestionID, @AnswerID);	
	END

END
