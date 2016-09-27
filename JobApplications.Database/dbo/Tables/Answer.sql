CREATE TABLE [dbo].[Answer] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [QuestionID]   INT           NOT NULL,
    [Text]         VARCHAR (200) NOT NULL,
    [DisplayOrder] INT           NOT NULL,
    [IsAcceptable] BIT           CONSTRAINT [DF_Answer_IsAcceptable] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Answer_Question] FOREIGN KEY ([QuestionID]) REFERENCES [dbo].[Question] ([ID])
);

