SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Password] [nvarchar](20) NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[UserName] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
