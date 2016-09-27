CREATE TABLE [dbo].[Application] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [ApplicantName]     VARCHAR (200) NULL,
    [CreatedDateTime]   DATETIME      CONSTRAINT [DF_Application_CreatedDateTime] DEFAULT (getdate()) NOT NULL,
    [CreatedByUser]     INT           NOT NULL,
    [SubmittedDateTime] DATETIME      NULL,
    CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED ([ID] ASC)
);

