CREATE TABLE [dbo].[Question] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [Text]         VARCHAR (200) NOT NULL,
    [DisplayOrder] INT           NULL,
    CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED ([ID] ASC)
);

