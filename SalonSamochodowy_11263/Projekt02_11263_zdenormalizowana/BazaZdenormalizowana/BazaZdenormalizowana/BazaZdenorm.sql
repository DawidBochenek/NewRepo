USE [master]
GO
/****** Object:  Database [SalonSamocodowyZdenormalizowana]    Script Date: 14.02.2019 11:28:57 ******/
CREATE DATABASE [SalonSamocodowyZdenormalizowana]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalonSamocodowyZdenormalizowana', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SalonSamocodowyZdenormalizowana.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SalonSamocodowyZdenormalizowana_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SalonSamocodowyZdenormalizowana_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalonSamocodowyZdenormalizowana].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET RECOVERY FULL 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET  MULTI_USER 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalonSamocodowyZdenormalizowana', N'ON'
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET QUERY_STORE = OFF
GO
USE [SalonSamocodowyZdenormalizowana]
GO
/****** Object:  Schema [rapAn]    Script Date: 14.02.2019 11:28:57 ******/
CREATE SCHEMA [rapAn]
GO
/****** Object:  Schema [Salon]    Script Date: 14.02.2019 11:28:57 ******/
CREATE SCHEMA [Salon]
GO
/****** Object:  Table [Salon].[Zamowienie]    Script Date: 14.02.2019 11:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Salon].[Zamowienie](
	[ZamownienieId] [int] NOT NULL,
	[ZamownienieKey] [int] NULL,
	[KlientId] [int] NULL,
	[KlientImiePierwsze] [nvarchar](30) NULL,
	[KlientImieDrugie] [nvarchar](30) NULL,
	[KlientNazwisko] [nvarchar](30) NULL,
	[PracownikId] [int] NOT NULL,
	[Imie] [nvarchar](30) NULL,
	[Nazwisko] [nvarchar](30) NULL,
	[ModelId] [int] NULL,
	[NazwaSkr] [nvarchar](30) NULL,
	[Nazwa] [nvarchar](30) NULL,
	[NazwaSilnika] [nvarchar](30) NULL,
	[NazwaTypuSilnika] [nvarchar](30) NULL,
	[PojemnoscCcm] [decimal](6, 2) NOT NULL,
	[IloscKm] [smallint] NULL,
	[PakietId] [int] NULL,
	[NazwaPakietu] [nvarchar](30) NULL,
	[CenaNominalna] [money] NULL,
	[RabatId] [int] NULL,
	[NazwaRabatu] [nvarchar](30) NULL,
	[WartoscRabatu] [decimal](6, 2) NOT NULL,
	[WysokoscRabatu] [money] NULL,
	[CenaSprzedazy] [money] NULL,
	[DataZlozenia] [date] NULL,
	[DataOdbioru] [date] NULL,
	[StatusRealizacji] [bit] NULL,
	[StatusPlatnosci] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamownienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [rapAn].[KlientWartoscZam]    Script Date: 14.02.2019 11:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW  [rapAn].[KlientWartoscZam]
AS
SELECT szm.KlientId, SUM(CenaSprzedazy) as LacznaCenaSprzedazy, COUNT(szm.KlientId)  as IloscZamowien FROM  Salon.Zamowienie as szm
GROUP BY szm.KlientId
GO
/****** Object:  Table [dbo].[ZamowieniaSerwisu]    Script Date: 14.02.2019 11:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZamowieniaSerwisu](
	[ZamowienieId] [int] NOT NULL,
	[ZamowienieKey] [int] IDENTITY(1,1) NOT NULL,
	[StatusyZamowienieId] [int] NULL,
	[KlientId] [int] NOT NULL,
	[KlientImie] [nvarchar](30) NULL,
	[KlientNazwisko] [nvarchar](30) NULL,
	[PracownikId] [int] NOT NULL,
	[DataZlozenia] [date] NOT NULL,
	[DataZakonczenia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamowienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_cs1]    Script Date: 14.02.2019 11:28:57 ******/
CREATE NONCLUSTERED COLUMNSTORE INDEX [idx_cs1] ON [Salon].[Zamowienie]
(
	[KlientNazwisko],
	[DataZlozenia],
	[NazwaPakietu]
)WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SalonSamocodowyZdenormalizowana] SET  READ_WRITE 
GO
