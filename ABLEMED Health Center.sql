USE [master]
GO
/****** Object:  Database [Able_Med_Health_Center]    Script Date: 6/7/2021 5:22:25 PM ******/
CREATE DATABASE [Able_Med_Health_Center]
 CONTAINMENT = PARTIAL
 ON  PRIMARY 
( NAME = N'Able_Med_Health_Center', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Able_Med_Health_Center.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Able_Med_Health_Center_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Able_Med_Health_Center_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Able_Med_Health_Center] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Able_Med_Health_Center].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Able_Med_Health_Center] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET ARITHABORT OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Able_Med_Health_Center] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Able_Med_Health_Center] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Able_Med_Health_Center] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Able_Med_Health_Center] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Able_Med_Health_Center] SET  MULTI_USER 
GO
ALTER DATABASE [Able_Med_Health_Center] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Able_Med_Health_Center] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET DEFAULT_FULLTEXT_LANGUAGE = 1033 
GO
ALTER DATABASE [Able_Med_Health_Center] SET DEFAULT_LANGUAGE = 1033 
GO
ALTER DATABASE [Able_Med_Health_Center] SET NESTED_TRIGGERS = ON 
GO
ALTER DATABASE [Able_Med_Health_Center] SET TRANSFORM_NOISE_WORDS = OFF 
GO
ALTER DATABASE [Able_Med_Health_Center] SET TWO_DIGIT_YEAR_CUTOFF = 2049 
GO
ALTER DATABASE [Able_Med_Health_Center] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Able_Med_Health_Center] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Able_Med_Health_Center] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Able_Med_Health_Center] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Able_Med_Health_Center', N'ON'
GO
ALTER DATABASE [Able_Med_Health_Center] SET QUERY_STORE = OFF
GO
USE [Able_Med_Health_Center]
GO
/****** Object:  User [django]    Script Date: 6/7/2021 5:22:25 PM ******/
CREATE USER [django] WITH PASSWORD=N'95PU9pRaCoTAcxodv0veKGFduEXWJ8rs8aWdJ6O1fCM=', DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [django]
GO
/****** Object:  Table [dbo].[VISITS]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISITS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PATIENT] [int] NOT NULL,
	[DOCTOR] [int] NOT NULL,
	[TIME] [date] NOT NULL,
	[ROOM] [int] NOT NULL,
	[DESCRIPTION] [text] NOT NULL,
 CONSTRAINT [PK_VISITS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROOMS]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOMS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NUMBER] [int] NOT NULL,
 CONSTRAINT [PK_ROOMS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCTORS]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCTORS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](250) NOT NULL,
	[SURNAME] [nvarchar](250) NOT NULL,
	[NAME] [nvarchar](250) NOT NULL,
	[SPECIALITY] [int] NOT NULL,
 CONSTRAINT [PK_DOCTORS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PATIENTS]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PATIENTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](250) NOT NULL,
	[SURMAME] [nvarchar](250) NOT NULL,
	[CITY] [int] NOT NULL,
	[BIRTHYEAR] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL,
 CONSTRAINT [PK_PATIENTS_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VISITSVIEW]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW  [dbo].[VISITSVIEW]

AS

SELECT VISITS.[ID]
      ,[dbo].[PATIENTS].[NAME] as PATIENT_NAME  
	  ,[dbo].[PATIENTS].[SURMAME] as PATIENT_SURNAME  
	  ,[dbo].[DOCTORS].[NAME] as DOCTOR_NAME  
	  ,[dbo].[DOCTORS].[SURNAME] as DOCTOR_SURNAME  
      ,[TIME]
      ,[dbo].[ROOMS].NUMBER as ROOM_NUMBER
      ,[DESCRIPTION]
  FROM [dbo].[VISITS]
  INNER JOIN [PATIENTS] ON PATIENT = [dbo].PATIENTS.ID
  INNER JOIN [DOCTORS] ON DOCTOR = [dbo].DOCTORS.ID
  INNER JOIN [ROOMS] ON ROOM = [dbo].ROOMS.ID

GO
/****** Object:  Table [dbo].[CITIES]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITIES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CITY_NAME] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_CITIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PATIENTSVIEW]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PATIENTSVIEW] 

AS

SELECT [PATIENTS].ID,
		NAME,
		SURMAME AS SURNAME,
		CITIES.CITY_NAME AS CITY,
		BIRTHYEAR,
		WEIGHT
  FROM [dbo].[PATIENTS]
 INNER JOIN CITIES ON CITY = CITIES.ID
 

GO
/****** Object:  Table [dbo].[SPECIALITIES]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPECIALITIES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SPECIALITYNAME] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_SPECIALITIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TITLES]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TITLES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLENAME] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TITLES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DOCTORSVIEW]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[DOCTORSVIEW]

AS

SELECT 
	DOCTORS.ID,
	TITLES.TITLENAME AS TITLE,
	SURNAME,
	NAME,
	SPECIALITIES.SPECIALITYNAME AS SPECIALITY
  FROM DOCTORS
 INNER JOIN TITLES ON TITLE = TITLES.ID
 INNER JOIN SPECIALITIES ON SPECIALITY = SPECIALITIES.ID


GO
/****** Object:  Table [dbo].[CITY]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_CITY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCTORSSHADOW]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCTORSSHADOW](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SHADOWOPERATION] [char](1) NOT NULL,
	[SHADOWTIME] [datetime2](7) NOT NULL,
	[DOCTORID] [int] NOT NULL,
	[TITLE] [nvarchar](250) NOT NULL,
	[SURNAME] [nvarchar](250) NOT NULL,
	[NAME] [nvarchar](250) NOT NULL,
	[SPECIALITY] [int] NOT NULL,
 CONSTRAINT [PK_DOCTORSSHADOW] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PATIENTSSHADOW]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PATIENTSSHADOW](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SHADOWOPERATION] [char](1) NOT NULL,
	[SHADOWTIME] [datetime2](7) NOT NULL,
	[PATIENTID] [int] NOT NULL,
	[NAME] [nvarchar](250) NOT NULL,
	[SURMAME] [nvarchar](250) NOT NULL,
	[CITY] [nvarchar](250) NOT NULL,
	[BIRTHYEAR] [int] NOT NULL,
	[WEIGHT] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VISITSSHADOW]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VISITSSHADOW](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SHADOWOPERATION] [char](1) NOT NULL,
	[SHADOWTIME] [datetime2](7) NOT NULL,
	[VISITID] [int] NOT NULL,
	[PATIENT] [int] NOT NULL,
	[DOCTOR] [int] NOT NULL,
	[TIME] [datetime2](0) NOT NULL,
	[ROOM] [int] NOT NULL,
	[DESCRIPTION] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DOCTORS]  WITH CHECK ADD  CONSTRAINT [FK_DOCTORS_SPECIALITIES] FOREIGN KEY([SPECIALITY])
REFERENCES [dbo].[SPECIALITIES] ([ID])
GO
ALTER TABLE [dbo].[DOCTORS] CHECK CONSTRAINT [FK_DOCTORS_SPECIALITIES]
GO
ALTER TABLE [dbo].[PATIENTS]  WITH CHECK ADD  CONSTRAINT [FK_PATIENTS_CITIES] FOREIGN KEY([CITY])
REFERENCES [dbo].[CITIES] ([ID])
GO
ALTER TABLE [dbo].[PATIENTS] CHECK CONSTRAINT [FK_PATIENTS_CITIES]
GO
ALTER TABLE [dbo].[VISITS]  WITH CHECK ADD  CONSTRAINT [FK_VISITS_DOCTORS] FOREIGN KEY([DOCTOR])
REFERENCES [dbo].[DOCTORS] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VISITS] CHECK CONSTRAINT [FK_VISITS_DOCTORS]
GO
ALTER TABLE [dbo].[VISITS]  WITH CHECK ADD  CONSTRAINT [FK_VISITS_PATIENTS] FOREIGN KEY([PATIENT])
REFERENCES [dbo].[PATIENTS] ([ID])
GO
ALTER TABLE [dbo].[VISITS] CHECK CONSTRAINT [FK_VISITS_PATIENTS]
GO
ALTER TABLE [dbo].[VISITS]  WITH CHECK ADD  CONSTRAINT [FK_VISITS_ROOMS] FOREIGN KEY([ROOM])
REFERENCES [dbo].[ROOMS] ([ID])
GO
ALTER TABLE [dbo].[VISITS] CHECK CONSTRAINT [FK_VISITS_ROOMS]
GO
/****** Object:  StoredProcedure [dbo].[DocotrsViewPorcedure]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DocotrsViewPorcedure]
as

SELECT ID
	  ,[TITLE]
      ,[SURNAME]
      ,[NAME]
      ,[SPECIALITY]
  FROM [dbo].[DOCTORSVIEW]

GO
/****** Object:  StoredProcedure [dbo].[DoctorsDelete]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DoctorsDelete]
	
	@ID int

AS

Begin 
	Exec ShadowDoctors @ID , 'D'

	DELETE FROM DOCTORS
    WHERE ID = @ID
End


GO
/****** Object:  StoredProcedure [dbo].[DoctorsDetails]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[DoctorsDetails]

	@Doctor int
	as

SELECT 
	TITLES.TITLENAME AS TITLE,
	SURNAME,
	NAME,
	SPECIALITIES.SPECIALITYNAME AS SPECIALITY
  FROM DOCTORS
 INNER JOIN TITLES ON TITLE = TITLES.ID
 INNER JOIN SPECIALITIES ON SPECIALITY = SPECIALITIES.ID

 where DOCTORS.ID = @Doctor


GO
/****** Object:  StoredProcedure [dbo].[DoctorsHistory]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[DoctorsHistory]

	@Doctor int
	as

SELECT VISITS.[ID]
      ,[dbo].[PATIENTS].[NAME] as PATIENT_NAME  
	  ,[dbo].[PATIENTS].[SURMAME] as PATIENT_SURNAME  
	  ,[dbo].[DOCTORS].[NAME] as DOCTOR_NAME  
	  ,[dbo].[DOCTORS].[SURNAME] as DOCTOR_SURNAME  
      ,[TIME]
      ,[dbo].[ROOMS].NUMBER as ROOM_NUMBER
      ,[DESCRIPTION]
  FROM [dbo].[VISITS]
  INNER JOIN [PATIENTS] ON PATIENT = [dbo].PATIENTS.ID
  INNER JOIN [DOCTORS] ON DOCTOR = [dbo].DOCTORS.ID
  INNER JOIN [ROOMS] ON ROOM = [dbo].ROOMS.ID

   where DOCTORS.ID = @Doctor 

GO
/****** Object:  StoredProcedure [dbo].[DoctorsInsert]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

cREATE PROCEDURE [dbo].[DoctorsInsert] (
			@TITLE nvarchar(250),
		    @NAME nvarchar(250),
           @SURNAME nvarchar(250),
           @SPECIALITY int)

AS

INSERT INTO [dbo].[DOCTORS]
           ([TITLE],
		   [NAME],
           [SURNAME],
           [SPECIALITY])
     VALUES
           (@TITLE,
		   @NAME,
		   @SURNAME,
		   @SPECIALITY)
GO
/****** Object:  StoredProcedure [dbo].[DoctorsSelect]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DoctorsSelect]

as

SELECT [ID]
      ,[TITLE]
      ,[SURNAME]
      ,[NAME]
      ,[SPECIALITY]
  FROM [dbo].[DOCTORS]

GO
/****** Object:  StoredProcedure [dbo].[DoctorsUpdate]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[DoctorsUpdate] (
			@TITLE nvarchar(250),
		    @NAME nvarchar(250),
           @SURNAME nvarchar(250),
           @SPECIALITY int,
		   @ID int)
As
BEGIN
	Exec ShadowDoctors @ID , 'U'
	UPDATE DOCTORS
	SET 
	  TITLE = @TITLE,
	  NAME = @NAME,
      SURNAME = @SURNAME,
      SPECIALITY = @SPECIALITY
     
	Where ID = @ID
	
END

GO
/****** Object:  StoredProcedure [dbo].[PatientsDelete]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatientsDelete]
	
	@ID int

AS

Begin 
	Exec ShadowPatients @ID , 'D'

	DELETE FROM PATIENTS
    WHERE ID = @ID
End


GO
/****** Object:  StoredProcedure [dbo].[PatientsDetails]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[PatientsDetails]

	@PATIENT int

	as

SELECT [PATIENTS].ID,
		NAME,
		SURMAME AS SURNAME,
		CITIES.CITY_NAME AS CITY,
		BIRTHYEAR,
		WEIGHT
  FROM [dbo].[PATIENTS]
 INNER JOIN CITIES ON CITY = CITIES.ID
	where [PATIENTS].ID = @PATIENT

GO
/****** Object:  StoredProcedure [dbo].[PatientsHistory]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[PatientsHistory]

	@PATIENT int

	as

SELECT VISITS.[ID]
      ,[dbo].[PATIENTS].[NAME] as PATIENT_NAME  
	  ,[dbo].[PATIENTS].[SURMAME] as PATIENT_SURNAME  
	  ,[dbo].[DOCTORS].[NAME] as DOCTOR_NAME  
	  ,[dbo].[DOCTORS].[SURNAME] as DOCTOR_SURNAME  
      ,[TIME]
      ,[dbo].[ROOMS].NUMBER as ROOM_NUMBER
      ,[DESCRIPTION]
  FROM [dbo].[VISITS]
  INNER JOIN [PATIENTS] ON PATIENT = [dbo].PATIENTS.ID
  INNER JOIN [DOCTORS] ON DOCTOR = [dbo].DOCTORS.ID
  INNER JOIN [ROOMS] ON ROOM = [dbo].ROOMS.ID

  Where PATIENT = @PATIENT

GO
/****** Object:  StoredProcedure [dbo].[PatientsInsert]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatientsInsert] (
		    @NAME nvarchar(250),
           @SURMAME nvarchar(250),
           @CITY int,
           @BIRTHYEAR int,
           @WEIGHT int)

AS

INSERT INTO [dbo].[PATIENTS]
           ([NAME]
           ,[SURMAME]
           ,[CITY]
           ,[BIRTHYEAR]
           ,[WEIGHT])
     VALUES
           (@NAME,
		   @SURMAME,
		   @CITY,
		   @BIRTHYEAR,
		   @WEIGHT)
GO
/****** Object:  StoredProcedure [dbo].[PatientsSelect]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatientsSelect]

as

SELECT [ID]
      ,[NAME]
      ,[SURMAME]
      ,[CITY]
      ,[BIRTHYEAR]
      ,[WEIGHT]
  FROM [dbo].[PATIENTS]

GO
/****** Object:  StoredProcedure [dbo].[PatientsUpdate]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PatientsUpdate]
			@NAME nvarchar(250),
           @SURMAME nvarchar(250),
           @CITY int,
           @BIRTHYEAR int,
           @WEIGHT int,
		   @ID int
As
BEGIN
	Exec ShadowPatients @ID , 'U'
	UPDATE PATIENTS
	SET 
	  NAME = @NAME,
      SURMAME = @SURMAME,
      CITY = @CITY,
      BIRTHYEAR = @BIRTHYEAR,
      WEIGHT = @WEIGHT
	Where ID = @ID
	
END

GO
/****** Object:  StoredProcedure [dbo].[PatientsViewPorcedure]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PatientsViewPorcedure]
as

SELECT [ID]
      ,[NAME]
      ,[SURNAME]
      ,[CITY]
      ,[BIRTHYEAR]
      ,[WEIGHT]
  FROM [dbo].[PATIENTSVIEW]

GO
/****** Object:  StoredProcedure [dbo].[ShadowDoctors]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ShadowDoctors]
	@ID int,
	@OP char(1)
	
	as
		Insert into DOCTORSSHADOW (SHADOWOPERATION, SHADOWTIME,DOCTORID,TITLE,NAME,SURNAME,SPECIALITY)
		Select @OP , GETDATE(), ID,TITLE,NAME,SURNAME,SPECIALITY
		From DOCTORS
		Where ID = @ID

GO
/****** Object:  StoredProcedure [dbo].[ShadowPatients]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ShadowPatients]
	@ID int,
	@OP char(1)
	
	as
		Insert into PATIENTSSHADOW (SHADOWOPERATION, SHADOWTIME,PATIENTID,NAME,SURMAME,CITY,BIRTHYEAR,WEIGHT)
		Select @OP , GETDATE(), ID,NAME,SURMAME,CITY,BIRTHYEAR,WEIGHT
		From PATIENTS
		Where ID = @ID

GO
/****** Object:  StoredProcedure [dbo].[ShadowVisits]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ShadowVisits]
	@ID int,
	@OP char(1)
	
	as
		Insert into VISITSSHADOW (SHADOWOPERATION, SHADOWTIME,VISITID,PATIENT,DOCTOR,TIME,ROOM,DESCRIPTION)
		Select @OP , GETDATE(), ID,PATIENT,DOCTOR,TIME,ROOM,DESCRIPTION
		From VISITS
		Where ID = @ID

GO
/****** Object:  StoredProcedure [dbo].[VisitsDelete]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VisitsDelete]
	
	@ID int

AS

Begin 
	Exec ShadowVisits @ID , 'D'

	DELETE FROM VISITS
    WHERE ID = @ID
End


GO
/****** Object:  StoredProcedure [dbo].[VisitsInsert]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VisitsInsert] (
			@PATIENT int,
		    @DOCTOR int,
           @TIME date,
		   @ROOM int,
           @DESCRIPTION text)

AS

INSERT INTO [dbo].[VISITS]
           ([PATIENT]
           ,[DOCTOR]
           ,[TIME]
           ,[ROOM]
           ,[DESCRIPTION])
     VALUES
           (@PATIENT,
		   @DOCTOR,
		   @TIME,
		   @ROOM,
		   @DESCRIPTION)
GO
/****** Object:  StoredProcedure [dbo].[VisitsSelect]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VisitsSelect]

as

SELECT		[PATIENT]
           ,[DOCTOR]
           ,[TIME]
           ,[ROOM]
           ,[DESCRIPTION]
  FROM [dbo].[VISITS]



		   
GO
/****** Object:  StoredProcedure [dbo].[VisitsUpdate]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VisitsUpdate] (
			@PATIENT int,
		    @DOCTOR int,
           @TIME date,
		   @ROOM int,
           @DESCRIPTION text,
		   @ID int)

AS
BEGIN
	Exec ShadowVisits @ID , 'U'
UPDATE VISITS
     SET
          PATIENT = @PATIENT,
		  DOCTOR= @DOCTOR,
		  TIME = TIME,
		  ROOM = @ROOM,
		  DESCRIPTION = @DESCRIPTION

		  	Where ID = @ID
	
END

GO
/****** Object:  StoredProcedure [dbo].[VisitsViewProcedure]    Script Date: 6/7/2021 5:22:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VisitsViewProcedure]
as

SELECT [ID]
      ,[PATIENT_NAME]
      ,[PATIENT_SURNAME]
      ,[DOCTOR_NAME]
      ,[DOCTOR_SURNAME]
      ,[TIME]
      ,[ROOM_NUMBER]
      ,[DESCRIPTION]
  FROM [dbo].[VISITSVIEW]

GO
USE [master]
GO
ALTER DATABASE [Able_Med_Health_Center] SET  READ_WRITE 
GO
