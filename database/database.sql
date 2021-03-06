USE [master]
GO
/****** Object:  Database [Scalefocus-PMA-db]    Script Date: 7/16/2021 12:21:09 AM ******/
CREATE DATABASE [Scalefocus-PMA-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scalefocus-PMA-db', FILENAME = N'D:\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Scalefocus-PMA-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scalefocus-PMA-db_log', FILENAME = N'D:\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Scalefocus-PMA-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scalefocus-PMA-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET  MULTI_USER 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scalefocus-PMA-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Scalefocus-PMA-db] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Scalefocus-PMA-db]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[LastModifiedById] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Projects_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectsTeams]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectsTeams](
	[TeamId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectsTeams] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Title] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Status] [tinyint] NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[AssignToId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[LastModifiedById] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Tasks] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](45) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[DateOfCreation] [datetime2](0) NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NULL,
	[LastModifiedById] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Teams_Title] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](25) NOT NULL,
	[PasswordHashWithSalt] [nvarchar](100) NOT NULL,
	[Salt] [nvarchar](100) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[DateOfCreation] [datetime2](0) NOT NULL,
	[CreatorId] [int] NULL,
	[DateOfLastChange] [datetime2](0) NOT NULL,
	[LastModifiedById] [int] NULL,
	[RoleId] [tinyint] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Users_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTeams](
	[TeamId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UsersTeams] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkLogs]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Time] [time](0) NULL,
	[Date] [date] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_WorkLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Statistics]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[Statistics]

AS

SELECT COUNT(Id) AS UsersCount FROM Users 
GO
/****** Object:  View [dbo].[vAllProjects]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vAllProjects]

AS

SELECT	
		p.Id, p.Title, p.[Description], p.DateOfCreation, 
		p.CreatorId, p.LastModifiedById, p.DateOfLastChange, u.Username
FROM Projects p
INNER JOIN Users u
ON
p.CreatorId = u.Id
WHERE p.IsDeleted = 0
GO
/****** Object:  View [dbo].[vAllTasks]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   VIEW [dbo].[vAllTasks]

AS

SELECT t.Id, t.ProjectId, t.AuthorId, t.Title, t.[Description], t.[Status], t.DateOfCreation, t.AssignToId, t.DateOfLastChange, t.LastModifiedById,
	   p.Title AS ProjectTitle, u.Username AS AuthorUsername, u2.Username AS AssigneeUsername, ts.Status AS StatusName, t.IsDeleted
	FROM Tasks t
INNER JOIN Users u ON t.AuthorId = u.Id
INNER JOIN Users u2 ON t.AssignToId = u2.Id
INNER JOIN Projects p ON t.ProjectId = p.Id
INNER JOIN TaskStatus ts ON ts.Id = t.Status
GO
/****** Object:  View [dbo].[vAllTeams]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   VIEW [dbo].[vAllTeams]
AS
SELECT	
		t.Id, t.Title, t.[Description], t.DateOfCreation, 
		t.CreatorId, t.LastModifiedById, t.DateOfLastChange, u.Username, u2.Username AS LastModifiedByUsername
FROM Teams t
INNER JOIN Users u
ON
t.CreatorId = u.Id
INNER JOIN Users u2 ON
t.LastModifiedById = u2.Id
WHERE t.IsDeleted = 0

GO
/****** Object:  View [dbo].[vAllUsers]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vAllUsers]

AS

SELECT	u.Id, u.Username, u.Firstname, u.Lastname, u.DateOfCreation, u.DateOfLastChange, 
		u.LastModifiedById, u.CreatorId, u2.Username as LastModifiedByUsername, u3.Username CreatorUsername
	FROM Users u
INNER JOIN Users u2 ON
u2.Id = u.LastModifiedById
INNER JOIN Users u3 ON
u3.Id = u.CreatorId
WHERE u.IsDeleted = 0
GO
/****** Object:  View [dbo].[vProjectsWithTeams]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vProjectsWithTeams]

AS

SELECT ProjectId, TeamId, p.Title, p.Description, u.Username AS CreatorUsername
FROM ProjectsTeams
INNER JOIN Projects p
ON
p.Id = ProjectId
INNER JOIN Teams t
ON
t.Id = TeamId
INNER JOIN Users u
ON
u.Id = p.CreatorId
WHERE p.IsDeleted = 0 AND t.IsDeleted = 0
GO
/****** Object:  View [dbo].[vTasksWithTeams]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   VIEW [dbo].[vTasksWithTeams]

AS

SELECT distinct t.Id, t.ProjectId, t.AuthorId, t.Title, t.Description,
	t.Status, t.DateOfCreation, t.AssignToId, t.DateOfLastChange, t.LastModifiedById,
	ut.TeamId, tms.Title AS TeamName, ts.Status AS StatusName, us.Username AS LastModifiedByUsername,
	us2.Username AS AssigneeUsername
FROM Tasks t
INNER JOIN Projects p
ON
p.Id = t.ProjectId
INNER JOIN ProjectsTeams pt
ON
pt.ProjectId = p.Id
INNER JOIN UsersTeams ut
ON
ut.TeamId = pt.TeamId
INNER JOIN Teams tms
ON
tms.Id = ut.TeamId
INNER JOIN TaskStatus ts
ON
ts.Id = t.Status
INNER JOIN Users us
ON
us.Id = t.LastModifiedById
INNER JOIN Users us2
ON
us2.Id = t.AssignToId
WHERE tms.IsDeleted = 0 AND t.IsDeleted = 0


GO
/****** Object:  View [dbo].[vTeamsWithUsers]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vTeamsWithUsers]

AS

SELECT TeamId, UserId, t.Title, t.[Description], u.Username FROM UsersTeams
INNER JOIN Teams t
ON
TeamId = t.Id
INNER JOIN Users u
ON
UserId = u.Id
WHERE t.IsDeleted = 0 AND u.IsDeleted = 0
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfCreation]  DEFAULT (getutcdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_DateOfLastChange]  DEFAULT (getutcdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_DateOfCreation]  DEFAULT (getutcdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_DateOfLastChange]  DEFAULT (getutcdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_DateOfCreation]  DEFAULT (getutcdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_DateOfLastChange]  DEFAULT (getutcdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_LastModifiedById]  DEFAULT (NULL) FOR [LastModifiedById]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF_Teams_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfCreation]  DEFAULT (getdate()) FOR [DateOfCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateOfLastChange]  DEFAULT (getdate()) FOR [DateOfLastChange]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RoleId]  DEFAULT ((1)) FOR [RoleId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[WorkLogs] ADD  CONSTRAINT [DF_WorkLogs_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users_CID] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users_CID]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users_LastModifiedById] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users_LastModifiedById]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Projects]
GO
ALTER TABLE [dbo].[ProjectsTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectsTeams_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[ProjectsTeams] CHECK CONSTRAINT [FK_ProjectsTeams_Teams]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Projects_PID] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Projects_PID]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[TaskStatus] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskStatus]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_AssignToId] FOREIGN KEY([AssignToId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_AssignToId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_AuthorId]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_LastModifiedById] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_LastModifiedById]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users_CID] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users_CID]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users_LastModifiedById] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users_LastModifiedById]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([LastModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users1] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users1]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Teams]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Users]
GO
ALTER TABLE [dbo].[WorkLogs]  WITH CHECK ADD  CONSTRAINT [FK_WorkLogs_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([Id])
GO
ALTER TABLE [dbo].[WorkLogs] CHECK CONSTRAINT [FK_WorkLogs_Tasks]
GO
ALTER TABLE [dbo].[WorkLogs]  WITH CHECK ADD  CONSTRAINT [FK_WorkLogs_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[WorkLogs] CHECK CONSTRAINT [FK_WorkLogs_Users]
GO
/****** Object:  StoredProcedure [dbo].[AssignProjectToTeam]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AssignProjectToTeam]

@TeamId int,
@ProjectId int

AS

INSERT INTO [dbo].[ProjectsTeams]
	(TeamId, ProjectId)
VALUES(@TeamId, @ProjectId)
GO
/****** Object:  StoredProcedure [dbo].[AssignUserToTeam]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AssignUserToTeam]

@TeamId int,
@UserId int

AS

INSERT INTO [dbo].[UsersTeams]
	(TeamId, UserId)
VALUES(@TeamId, @UserId)
GO
/****** Object:  StoredProcedure [dbo].[CreateProject]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateProject]

@Title nvarchar(50),
@Description nvarchar(150),
@CreatorId int

AS

INSERT INTO [dbo].[Projects]
	(Title, [Description], CreatorId, DateOfCreation, DateOfLastChange)
VALUES(@Title, @Description, @CreatorId, GETUTCDATE(), GETUTCDATE())
GO
/****** Object:  StoredProcedure [dbo].[CreateTask]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateTask]

@ProjectId int,
@AuthorId int,
@Title nvarchar(25),
@Description nvarchar(50),
@Status int,
@AssigneeId int

AS

INSERT INTO [dbo].[Tasks]
	(ProjectId, AuthorId, Title, [Description], [Status], AssignToId, DateOfCreation, DateOfLastChange)
VALUES(@ProjectId, @AuthorId, @Title, @Description, @Status, @AssigneeId, GETUTCDATE(), GETUTCDATE())
GO
/****** Object:  StoredProcedure [dbo].[CreateTeam]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateTeam]

@Title nvarchar(45),
@Description nvarchar(200),
@CreatorId int

AS

INSERT INTO [dbo].[Teams]
	(Title, [Description], CreatorId, DateOfCreation, DateOfLastChange)
VALUES(@Title, @Description, @CreatorId, GETUTCDATE(), GETUTCDATE())
GO
/****** Object:  StoredProcedure [dbo].[CreateWorkLog]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateWorkLog]

@TaskId int, 
@UserId int,
@HoursSpent time,
@DateOfOccurence date

AS

INSERT INTO WorkLogs
	(TaskId, UserId, [Time], [Date])
VALUES(@TaskId, @UserId, @HoursSpent, @DateOfOccurence)
GO
/****** Object:  StoredProcedure [dbo].[DeleteProject]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteProject]

@Id int

AS

UPDATE dbo.Projects
	SET IsDeleted = 1
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteTask]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteTask]

@TaskId int

AS

UPDATE Tasks
	SET IsDeleted = 1
WHERE Id = @TaskId
GO
/****** Object:  StoredProcedure [dbo].[DeleteTeam]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteTeam]

@Id int

AS

UPDATE dbo.Teams
	SET IsDeleted = 1
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteUser]
@Id int

AS

UPDATE dbo.Users
	SET IsDeleted = 1
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteWorkLog]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteWorkLog]

@Id int

AS

UPDATE WorkLogs
	SET IsDeleted = 1
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterUser]

@Username varchar(25),
@HashedPassword varchar(100),
@Salt varchar(100),
@Firstname nvarchar(50),
@Lastname nvarchar(50),
@CreatorId int

AS

INSERT INTO [dbo].[Users]

(Username, PasswordHashWithSalt, Salt, Firstname, Lastname, CreatorId)

VALUES(@Username, @HashedPassword, @Salt, @Firstname, @Lastname, @CreatorId)
GO
/****** Object:  StoredProcedure [dbo].[RemoveUserFromTeam]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RemoveUserFromTeam]

@TeamId int,
@UserId int

AS

DELETE FROM UsersTeams
WHERE TeamId = @TeamId AND UserId = @UserId
GO
/****** Object:  StoredProcedure [dbo].[SetTaskStatus]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SetTaskStatus]

@TaskId int,
@StatusId int

AS

UPDATE Tasks
	SET Status = @StatusId
WHERE Id = @TaskId
GO
/****** Object:  StoredProcedure [dbo].[UpdateProject]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateProject]

@Id int,
@NewTitle nvarchar(50),
@NewDescription nvarchar(150),
@LastModifiedById int

AS

UPDATE Projects
	SET Title = @NewTitle,
		[Description] = @NewDescription,
		LastModifiedById = @LastModifiedById,
		DateOfLastChange = GETUTCDATE()
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateTask]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[UpdateTask]

@TaskId int,
@AssigneeId int,
@Title nvarchar(25),
@Description nvarchar(50),
@LastModifiedById int

AS

UPDATE Tasks
	SET AssignToId = @AssigneeId,
		Title = @Title,
		Description = @Description,
		LastModifiedById = @LastModifiedById,
		DateOfLastChange = GETUTCDATE()
WHERE Id = @TaskId	
GO
/****** Object:  StoredProcedure [dbo].[UpdateTeam]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateTeam]

@Id int,
@NewTitle nvarchar(45),
@NewDescription nvarchar(200),
@LastModifiedById int

AS

UPDATE Teams
	SET Title = @NewTitle,
		Description = @NewDescription,
		LastModifiedById = @LastModifiedById,
		DateOfLastChange = GETUTCDATE()
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateUser]

@Id int,
@NewUsername varchar(25),
@NewHashedPassword varchar(100),
@NewSalt varchar(100),
@NewFirstname nvarchar(50),
@NewLastname nvarchar(50),
@LastModifiedById int

AS

UPDATE [dbo].[Users]
	SET Username = @NewUsername,
		PasswordHashWithSalt = @NewHashedPassword,
		Salt = @NewSalt,
		Firstname = @NewFirstname,
		Lastname = @NewLastname,
		LastModifiedById = @LastModifiedById,
		DateOfLastChange = GETUTCDATE()
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateWorkLog]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateWorkLog]

@Id int,
@TaskId int,
@UserId int,
@HoursSpent time,
@DateOfOccurence date

AS

UPDATE WorkLogs
	SET TaskId = @TaskId,
		UserId = @UserId,
		[Time] = @HoursSpent,
		[Date] = @DateOfOccurence
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[VerifyLogin]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[VerifyLogin]

@Username varchar(25),
@PasswordHashWithSaltIncoming varchar(100),
@IsVerified int OUTPUT,
@RoleId tinyint OUTPUT,
@Firstname nvarchar(50) OUTPUT,
@Lastname nvarchar(50) OUTPUT

AS

DECLARE @PasswordHashWithSalt varchar(100)
DECLARE @IsDeleted bit

SELECT @IsVerified = Id, @RoleId = RoleId, @Firstname = Firstname, @Lastname = Lastname, @PasswordHashWithSalt = PasswordHashWithSalt, @IsDeleted = IsDeleted
	FROM [dbo].[Users] 
WHERE Username = @Username;

IF @PasswordHashWithSalt <> @PasswordHashWithSaltIncoming
	SET @IsVerified = 0
IF @IsDeleted = 1
	SET @IsVerified = 0
GO
/****** Object:  Trigger [dbo].[BeforeDeleteTrigger]    Script Date: 7/16/2021 12:21:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[BeforeDeleteTrigger]
	ON [dbo].[Users]
	-- Executes everytime before a delete operation
	-- It doesn't check for any constraints or smh
	INSTEAD OF DELETE
AS 
	IF @@ROWCOUNT = 0
		RETURN;
	SET NOCOUNT ON;
	UPDATE Teams
		SET CreatorId = NULL,
			LastModifiedById = NULL
	WHERE CreatorId = (SELECT TOP 1 Id FROM deleted)
GO
ALTER TABLE [dbo].[Users] ENABLE TRIGGER [BeforeDeleteTrigger]
GO
USE [master]
GO
ALTER DATABASE [Scalefocus-PMA-db] SET  READ_WRITE 
GO
