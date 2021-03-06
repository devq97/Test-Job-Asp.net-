USE [master]
GO
/****** Object:  Database [DBTEST]    Script Date: 14/02/2019 14:23:21 ******/
CREATE DATABASE [DBTEST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST-DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TEST-DB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TEST-DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TEST-DB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBTEST] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBTEST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBTEST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBTEST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBTEST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBTEST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBTEST] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBTEST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBTEST] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBTEST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBTEST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBTEST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBTEST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBTEST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBTEST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBTEST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBTEST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBTEST] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBTEST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBTEST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBTEST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBTEST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBTEST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBTEST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBTEST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBTEST] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBTEST] SET  MULTI_USER 
GO
ALTER DATABASE [DBTEST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBTEST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBTEST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBTEST] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBTEST]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteEmployee]    Script Date: 14/02/2019 14:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteEmployee] (
	@code VARCHAR(50)
)
AS
	BEGIN TRY
		DELETE FROM Employee WHERE k_employee = @code;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH;
		
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 14/02/2019 14:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertEmployee] 
( @code VARCHAR(50),
  @name VARCHAR(50),
  @sam VARCHAR(50),
  @country VARCHAR(50),
  @active VARCHAR(5),
  @systemAdmin VARCHAR(5),
  @email VARCHAR(50)
)
AS
	BEGIN TRY
		INSERT 
			INTO Employee(k_employee,n_employee,o_sam_employee,o_country,i_active,o_email_employee,i_system_administrator)
			VALUES (@code,@name,@sam,@country,@active,@email,@systemAdmin);
	END   TRY
	BEGIN CATCH
		THROW;
	END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[spSearchCode]    Script Date: 14/02/2019 14:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearchCode]
( @code varchar(50),
  @coder varchar(50)
)
AS
	BEGIN
		SELECT E.k_employee, E.n_employee, E.o_sam_employee, E.o_country, E.i_active, E.i_system_administrator, E.o_email_employee 
		FROM Employee E
		WHERE k_employee=@code or k_employee like @coder
	END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployee]    Script Date: 14/02/2019 14:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateEmployee] (
	@code VARCHAR(50),
  @name VARCHAR(50),
  @sam VARCHAR(50),
  @country VARCHAR(50),
  @active VARCHAR(5),
  @systemAdmin VARCHAR(5),
  @email VARCHAR(50)
)
AS
	BEGIN TRY
		UPDATE Employee SET n_employee = @name, o_country = @country, i_active = @active, i_system_administrator = @systemAdmin,
		o_email_employee = @email WHERE k_employee = @code AND o_sam_employee = @sam;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH;
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14/02/2019 14:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[k_employee] [varchar](50) NOT NULL,
	[n_employee] [varchar](50) NOT NULL,
	[o_sam_employee] [varchar](50) NOT NULL,
	[o_country] [varchar](50) NOT NULL,
	[i_active] [varchar](5) NOT NULL,
	[o_email_employee] [varchar](50) NOT NULL,
	[i_system_administrator] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[k_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [DBTEST] SET  READ_WRITE 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
INSERT INTO [dbo].[Employee](k_employee,n_employee,o_sam_employee,o_country,i_active,o_email_employee,i_system_administrator) 
values 
(9999999, 'Fernando Melo - ADM', 'fmeladm', 'Brazil', 'Yes', 'fmelo@gmail.com', 'Yes'),
(611555, 'Fernando Melo','fmeladm', 'Brazil', 'Yes', 'fmelo@gmail.com', 'Yes'),
(521458, 'David Vargas', 'devq', 'Colombia', 'Yes', 'devq@gmail.com', 'No'),
(111112, 'Jose Manuel Paredes', 'jose', 'Colombia', 'Yes', 'jose@gmail.com', 'Yes'),
(111113, 'Catalina Sanchez', 'cataSan', 'Argentina', 'No', 'cataSan@gmail.com', 'No'),
(111114, 'Julio Baron', 'juliobr', 'Argentina', 'Yes', 'juliobar@gmail.com', 'No'),
(388412, 'Juan Perez','jperez', 'Argentina', 'Yes', 'jperez@gmail.com', 'Yes');

GO
