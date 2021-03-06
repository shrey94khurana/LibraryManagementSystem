USE [Library_Management_System]
GO
/****** Object:  StoredProcedure [dbo].[spr_updateBookDetails]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_updateBookDetails]
GO
/****** Object:  StoredProcedure [dbo].[spr_updateAuthorDetails]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_updateAuthorDetails]
GO
/****** Object:  StoredProcedure [dbo].[spr_insertBook]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_insertBook]
GO
/****** Object:  StoredProcedure [dbo].[spr_insertAuthor]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_insertAuthor]
GO
/****** Object:  StoredProcedure [dbo].[spr_getBookDetailsbyId]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_getBookDetailsbyId]
GO
/****** Object:  StoredProcedure [dbo].[spr_getBookDetails]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_getBookDetails]
GO
/****** Object:  StoredProcedure [dbo].[spr_getAuthorDetailsbyId]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_getAuthorDetailsbyId]
GO
/****** Object:  StoredProcedure [dbo].[spr_getAuthorDetails]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_getAuthorDetails]
GO
/****** Object:  StoredProcedure [dbo].[spr_deleteBookDetails]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_deleteBookDetails]
GO
/****** Object:  StoredProcedure [dbo].[spr_deleteAuthorDetails]    Script Date: 08-08-2020 08:04:21 ******/
DROP PROCEDURE [dbo].[spr_deleteAuthorDetails]
GO
ALTER TABLE [dbo].[Books] DROP CONSTRAINT [DF_Books_IsBookAvailable]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 08-08-2020 08:04:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
DROP TABLE [dbo].[Books]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 08-08-2020 08:04:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Author]') AND type in (N'U'))
DROP TABLE [dbo].[Author]
GO
USE [master]
GO
/****** Object:  Database [Library_Management_System]    Script Date: 08-08-2020 08:04:21 ******/
DROP DATABASE [Library_Management_System]
GO
/****** Object:  Database [Library_Management_System]    Script Date: 08-08-2020 08:04:21 ******/
CREATE DATABASE [Library_Management_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library_Management_System', FILENAME = N'C:\Users\Shrey\Library_Management_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_Management_System_log', FILENAME = N'C:\Users\Shrey\Library_Management_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Library_Management_System] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library_Management_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library_Management_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library_Management_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library_Management_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library_Management_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library_Management_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library_Management_System] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Library_Management_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library_Management_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library_Management_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library_Management_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library_Management_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library_Management_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library_Management_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library_Management_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library_Management_System] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Library_Management_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library_Management_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library_Management_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library_Management_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library_Management_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library_Management_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library_Management_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library_Management_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library_Management_System] SET  MULTI_USER 
GO
ALTER DATABASE [Library_Management_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library_Management_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library_Management_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library_Management_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library_Management_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library_Management_System] SET QUERY_STORE = OFF
GO
USE [Library_Management_System]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Library_Management_System]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthId] [int] IDENTITY(1,1) NOT NULL,
	[AuthName] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
	[AuthorId] [int] NULL,
	[PublishDate] [datetime] NULL,
	[BookName] [varchar](100) NULL,
	[Cost] [float] NULL,
	[Quantity] [int] NULL,
	[Description] [varchar](255) NULL,
	[IsBookAvailable] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_Books_IsBookAvailable]  DEFAULT ((0)) FOR [IsBookAvailable]
GO
/****** Object:  StoredProcedure [dbo].[spr_deleteAuthorDetails]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spr_deleteAuthorDetails]
  @authid int
  AS
  BEGIN
  Delete from Author  where AuthId=@authid
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_deleteBookDetails]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spr_deleteBookDetails]
  @bookid int
  AS
  BEGIN
  Delete from Books  where BookId=@bookid
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_getAuthorDetails]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_getAuthorDetails]
  AS
  BEGIN
  SELECT  * FROM Author order by 1 desc 
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_getAuthorDetailsbyId]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spr_getAuthorDetailsbyId]
  @authid int
  AS
  BEGIN
  SELECT * FROM Author where AuthId=@authid
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_getBookDetails]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_getBookDetails]
  AS
  BEGIN
  SELECT  * FROM Books order by 1 desc 
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_getBookDetailsbyId]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE PROCEDURE [dbo].[spr_getBookDetailsbyId]
  @bookid int
  AS
  BEGIN
  SELECT * FROM Books where BookId=@bookid
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_insertAuthor]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


  CREATE procedure [dbo].[spr_insertAuthor]
  @Authname varchar(50),
  @Description varchar(255) 
  AS
  BEGIN
  Insert into Author(Authname,Description)values(@Authname,@Description)
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_insertBook]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE procedure [dbo].[spr_insertBook]
  @BookId int,
  @Category varchar(50),
  @AuthorId varchar(50),
  @PublishDate DATE
  AS
  BEGIN
  Insert into Books(BookId,Category,AuthorId,PublishDate)values(@BookId,@Category,@AuthorId,@PublishDate)
  END
GO
/****** Object:  StoredProcedure [dbo].[spr_updateAuthorDetails]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_updateAuthorDetails]
  @authid int,
  @AuthName varchar(50),
  @description varchar(255)
  AS
  BEGIN
  update Author set AuthName=@authname,Description=@description where AuthId=@authid
  END 
GO
/****** Object:  StoredProcedure [dbo].[spr_updateBookDetails]    Script Date: 08-08-2020 08:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spr_updateBookDetails]
  @bookid int,
  @category varchar(50),
  @authorid varchar(50),
  @publishdate DATE
  AS
  BEGIN
  update Books set Category=@category,AuthorId=@authorid, PublishDate=@publishdate where BookId=@bookid
  END 
GO
USE [master]
GO
ALTER DATABASE [Library_Management_System] SET  READ_WRITE 
GO
