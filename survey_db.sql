USE [master]
GO
/****** Object:  Database [survey_db]    Script Date: 27.5.2019 13:46:22 ******/
CREATE DATABASE [survey_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'survey_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\survey_db.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'survey_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\survey_db_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [survey_db] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [survey_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [survey_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [survey_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [survey_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [survey_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [survey_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [survey_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [survey_db] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [survey_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [survey_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [survey_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [survey_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [survey_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [survey_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [survey_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [survey_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [survey_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [survey_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [survey_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [survey_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [survey_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [survey_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [survey_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [survey_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [survey_db] SET RECOVERY FULL 
GO
ALTER DATABASE [survey_db] SET  MULTI_USER 
GO
ALTER DATABASE [survey_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [survey_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [survey_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [survey_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'survey_db', N'ON'
GO
USE [survey_db]
GO
/****** Object:  Table [dbo].[anket_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anket_tbl](
	[anket_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_adi] [nvarchar](200) NULL,
	[anket_ismi] [nvarchar](1000) NULL,
	[anket_aciklamasi] [nvarchar](1000) NULL,
	[baslangic_tarihi] [nvarchar](50) NULL,
	[bitis_tarihi] [nvarchar](50) NULL,
 CONSTRAINT [PK_anket_tbl] PRIMARY KEY CLUSTERED 
(
	[anket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cevaplar_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cevaplar_tbl](
	[yanitlayici_id] [int] NULL,
	[soru_id] [int] NULL,
	[cevap] [nvarchar](1000) NULL,
	[secenek_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kisa_yanit_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kisa_yanit_tbl](
	[soru_id] [int] NULL,
	[numerik_yazi] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kullanici_bilgileri_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanici_bilgileri_tbl](
	[kullanici_adi] [nvarchar](200) NOT NULL,
	[isim] [nvarchar](200) NULL,
	[soyisim] [nvarchar](50) NULL,
	[e_mail] [nvarchar](200) NULL,
	[sifre] [nvarchar](20) NULL,
	[e_mail_kodu] [nvarchar](7) NULL,
	[aktif] [nvarchar](10) NULL,
 CONSTRAINT [PK_kullanici_bilgileri_tbl] PRIMARY KEY CLUSTERED 
(
	[kullanici_adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[secenek_cb_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secenek_cb_tbl](
	[soru_id] [int] NULL,
	[secenek_text] [nvarchar](500) NULL,
	[secenek_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[secenek_okt_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secenek_okt_tbl](
	[soru_id] [int] NULL,
	[secenek] [nvarchar](1000) NULL,
	[satir_sutun] [nvarchar](10) NULL,
	[secenek_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[secenek_rb_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secenek_rb_tbl](
	[soru_id] [int] NULL,
	[secenek_text] [nvarchar](500) NULL,
	[secenek_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[secenek_so_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secenek_so_tbl](
	[soru_id] [int] NULL,
	[birinci_aralik] [int] NULL,
	[ikinci_aralik] [int] NULL,
	[birinci_secenek_text] [nvarchar](500) NULL,
	[ikinci_secenek_text] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[secenek_sot_aralik_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secenek_sot_aralik_tbl](
	[soru_id] [int] NULL,
	[birinci_aralik] [int] NULL,
	[ikinci_aralik] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[secenek_sot_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secenek_sot_tbl](
	[soru_id] [int] NULL,
	[secenek] [nvarchar](1000) NULL,
	[secenek_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sorular_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sorular_tbl](
	[anket_id] [int] NULL,
	[soru_id] [int] IDENTITY(1,1) NOT NULL,
	[soru] [nvarchar](1000) NULL,
	[soru_sirasi] [int] NULL,
	[secenek_turu] [nvarchar](50) NULL,
	[zorunlu_mu] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yanitlayici_tbl]    Script Date: 27.5.2019 13:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yanitlayici_tbl](
	[anket_id] [int] NULL,
	[yanitlayici_id] [int] NOT NULL,
	[baslangic_tarihi] [nvarchar](50) NULL,
	[bitis_tarihi] [nvarchar](50) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[kullanici_bilgileri_tbl] ([kullanici_adi], [isim], [soyisim], [e_mail], [sifre], [e_mail_kodu], [aktif]) VALUES (N'msari14', N'muammer', N'sarı', N'sr_muammer@hotmail.com', N'123456789', N'8155553', N'true')
USE [master]
GO
ALTER DATABASE [survey_db] SET  READ_WRITE 
GO
