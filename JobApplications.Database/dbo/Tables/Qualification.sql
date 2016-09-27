CREATE TABLE [dbo].[Qualification] (
    [ID]            INT IDENTITY (1, 1) NOT NULL,
    [ApplicationID] INT NOT NULL,
    [QuestionID]    INT NOT NULL,
    [AnswerID]      INT NOT NULL,
    CONSTRAINT [PK_Qualification] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Qualification_Answer] FOREIGN KEY ([AnswerID]) REFERENCES [dbo].[Answer] ([ID]),
    CONSTRAINT [FK_Qualification_Application] FOREIGN KEY ([ApplicationID]) REFERENCES [dbo].[Application] ([ID]),
    CONSTRAINT [FK_Qualification_Question] FOREIGN KEY ([QuestionID]) REFERENCES [dbo].[Question] ([ID])
);

