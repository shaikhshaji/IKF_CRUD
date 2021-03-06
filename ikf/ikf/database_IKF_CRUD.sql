USE [master]
GO
/****** Object:  Database [IKFdb]    Script Date: 6/21/2021 6:19:10 AM ******/
CREATE DATABASE [IKFdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IKFdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IKFdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IKFdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IKFdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IKFdb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IKFdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IKFdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IKFdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IKFdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IKFdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IKFdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [IKFdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IKFdb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [IKFdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IKFdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IKFdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IKFdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IKFdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IKFdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IKFdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IKFdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IKFdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IKFdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IKFdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IKFdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IKFdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IKFdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IKFdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IKFdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IKFdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IKFdb] SET  MULTI_USER 
GO
ALTER DATABASE [IKFdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IKFdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IKFdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IKFdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [IKFdb]
GO
/****** Object:  StoredProcedure [dbo].[addEmp]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[addEmp]
(
	@Para_Name nvarchar(50) ,
	@Para_DOB nvarchar(50) ,
	@Para_Designation nchar(10) ,
	@Para_skillset nvarchar(150) 
)
	

-- ======================================================================================
-- Author		:	SHAIKH SHAJI IBRAHIM												=
-- Create date	:	20 june 2021													=
-- Description	:	sp to Add employee				=
-- ======================================================================================
As
BEGIN

INSERT INTO [dbo].[tbl_emp]
           ([Name]
           ,[DOB]
           ,[Designation]
           ,[skillset]
           ,[deleteFlag])
     VALUES
           (		   
		   @Para_Name
           ,@Para_DOB
           ,@Para_Designation
           ,@Para_skillset
           ,0);


END
--MAIN END

GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[deleteUser]
(
	@para_ID Int 
	
)
	

-- ======================================================================================
-- Author		:	SHAIKH SHAJI IBRAHIM												=
-- Create date	:	20 june 2021													=
-- Description	:	sp to delete employee				=
-- ======================================================================================
As
BEGIN

UPDATE [dbo].[tbl_emp]   SET [deleteFlag] = 1 WHERE id= @para_ID;

END
--MAIN END

GO
/****** Object:  StoredProcedure [dbo].[EditEmp]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditEmp]
(
	@Para_ID int,
	@Para_Name nvarchar(50) ,
	@Para_DOB nvarchar(50) ,
	@Para_Designation nchar(10) ,
	@Para_skillset nvarchar(150) 
)
	

-- ======================================================================================
-- Author		:	SHAIKH SHAJI IBRAHIM												=
-- Create date	:	20 june 2021													=
-- Description	:	sp to update employee				=
-- ======================================================================================
As
BEGIN

UPDATE [dbo].[tbl_emp]
   SET [Name] = @Para_Name
      ,[DOB] = @Para_DOB
      ,[Designation] = @Para_Designation
      ,[skillset] = @Para_skillset      
 WHERE id=@Para_ID;


END
--MAIN END

GO
/****** Object:  StoredProcedure [dbo].[get_Designation_list]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[get_Designation_list]

	

-- ======================================================================================
-- Author		:	SHAIKH SHAJI IBRAHIM												=
-- Create date	:	20 june 2021													=
-- Description	:	sp to get the designation List				=
-- ======================================================================================
As
BEGIN
SELECT *
  FROM [dbo].[tbl_designation_Master] ;
END
--MAIN END

GO
/****** Object:  StoredProcedure [dbo].[get_emp_list]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[get_emp_list]

		

-- ======================================================================================
-- Author		:	SHAIKH SHAJI IBRAHIM												=
-- Create date	:	20 june 2021													=
-- Description	:	sp to get the employee List				=
-- ======================================================================================
As
BEGIN
SELECT *
  FROM [dbo].[tbl_emp] where deleteFlag=0 ;
END
--MAIN END

GO
/****** Object:  StoredProcedure [dbo].[get_skill_list]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[get_skill_list]

		

-- ======================================================================================
-- Author		:	SHAIKH SHAJI IBRAHIM												=
-- Create date	:	20 june 2021													=
-- Description	:	sp to get the skill List				=
-- ======================================================================================
As
BEGIN

SELECT [id]
      ,[Skill]
  FROM [dbo].[tbl_skill_Master]
END
--MAIN END

GO
/****** Object:  StoredProcedure [dbo].[GetEditUserData]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEditUserData]
(
	@para_ID Int 
	
)
	

-- ======================================================================================
-- Author		:	SHAIKH SHAJI IBRAHIM												=
-- Create date	:	20 june 2021													=
-- Description	:	sp to get edit employee				=
-- ======================================================================================
As
BEGIN

select * from tbl_emp WHERE id= @para_ID;

END
--MAIN END

GO
/****** Object:  Table [dbo].[tbl_designation_Master]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_designation_Master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_designation_Master] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_emp]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_emp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DOB] [nvarchar](50) NULL,
	[Designation] [nchar](10) NULL,
	[skillset] [nvarchar](150) NULL,
	[deleteFlag] [bit] NULL,
 CONSTRAINT [PK_tbl_emp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_skill_Master]    Script Date: 6/21/2021 6:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_skill_Master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Skill] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_skill_Master] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_designation_Master] ON 

INSERT [dbo].[tbl_designation_Master] ([id], [designation]) VALUES (1, N'Student')
INSERT [dbo].[tbl_designation_Master] ([id], [designation]) VALUES (2, N'Internship')
INSERT [dbo].[tbl_designation_Master] ([id], [designation]) VALUES (3, N'Contract programmer')
INSERT [dbo].[tbl_designation_Master] ([id], [designation]) VALUES (4, N'Full time programmer')
SET IDENTITY_INSERT [dbo].[tbl_designation_Master] OFF
SET IDENTITY_INSERT [dbo].[tbl_emp] ON 

INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (1, N'test1', N'10/10/1998', N'student   ', N'c#', 1)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (2, N'katara osai', N'6/15/2021', N'Contract p', N'CSS3,ASP.NET,C++', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (3, N'asdfh', N'6/15/2021', N'Contract p', N',HTML5,CSS3', 1)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (4, N'Testing for the name', N'5/30/2021', N'Contract p', N',CSS3,ASP.NET,C#,C++', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (5, N'shaikh shaji ibrahim', N'6/30/2021', N'Internship', N',HTML5,ASP.NET,C#,ADO.NET,ASP.NET MVC', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (6, N'Ashok Rao', N'6/5/2021', N'Contract p', N',ASP.NET,C,VB.NET', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (7, N'Linsa Abraham', N'6/9/2021', N'Full time ', N',C#,VB.NET', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (8, N'Ratan kumar', N'6/19/2021', N'Full time ', N'HTML5,CSS3,C#,C++', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (9, N'Disha patani', N'6/12/2021', N'Student   ', N'ASP.NET,ADO.NET', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (10, N'zia khan', N'6/24/2021', N'Student   ', N'ADO.NET,LINQ, abc', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (11, N'abc xyz', N'6/24/2021', N'Student   ', N'LINQ,ASP.NET MVC', 0)
INSERT [dbo].[tbl_emp] ([id], [Name], [DOB], [Designation], [skillset], [deleteFlag]) VALUES (12, N'test abc xyz', N'6/16/2021', N'Student   ', N'HTML5,CSS3,C,C++', 1)
SET IDENTITY_INSERT [dbo].[tbl_emp] OFF
SET IDENTITY_INSERT [dbo].[tbl_skill_Master] ON 

INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (1, N'HTML5')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (2, N'CSS3')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (3, N'ASP.NET')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (4, N'C#')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (5, N'C')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (6, N'C++')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (7, N'ADO.NET')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (8, N'VB.NET')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (9, N'LINQ')
INSERT [dbo].[tbl_skill_Master] ([id], [Skill]) VALUES (10, N'ASP.NET MVC')
SET IDENTITY_INSERT [dbo].[tbl_skill_Master] OFF
ALTER TABLE [dbo].[tbl_emp] ADD  CONSTRAINT [DF_tbl_emp_deleteFlag]  DEFAULT ((0)) FOR [deleteFlag]
GO
USE [master]
GO
ALTER DATABASE [IKFdb] SET  READ_WRITE 
GO
