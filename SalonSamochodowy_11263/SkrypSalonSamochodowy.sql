USE [master]
GO
/****** Object:  Database [SalonSamochodowy]    Script Date: 14.02.2019 09:45:00 ******/
CREATE DATABASE [SalonSamochodowy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalonSamochodowy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SalonSamochodowy.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SalonSamochodowy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SalonSamochodowy_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SalonSamochodowy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalonSamochodowy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalonSamochodowy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalonSamochodowy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalonSamochodowy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SalonSamochodowy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalonSamochodowy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET RECOVERY FULL 
GO
ALTER DATABASE [SalonSamochodowy] SET  MULTI_USER 
GO
ALTER DATABASE [SalonSamochodowy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalonSamochodowy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalonSamochodowy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalonSamochodowy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SalonSamochodowy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalonSamochodowy', N'ON'
GO
ALTER DATABASE [SalonSamochodowy] SET QUERY_STORE = OFF
GO
USE [SalonSamochodowy]
GO
/****** Object:  Schema [Hr]    Script Date: 14.02.2019 09:45:00 ******/
CREATE SCHEMA [Hr]
GO
/****** Object:  Schema [Produkt]    Script Date: 14.02.2019 09:45:00 ******/
CREATE SCHEMA [Produkt]
GO
/****** Object:  Schema [RapOp]    Script Date: 14.02.2019 09:45:00 ******/
CREATE SCHEMA [RapOp]
GO
/****** Object:  Schema [Serwis]    Script Date: 14.02.2019 09:45:00 ******/
CREATE SCHEMA [Serwis]
GO
/****** Object:  Schema [Wspolne]    Script Date: 14.02.2019 09:45:00 ******/
CREATE SCHEMA [Wspolne]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEaster]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GetEaster](@year int)
returns Date
as begin
	declare @Easter date
	declare @a int, @b int, @c int, @d int, @e int, @f int, @g int,
			@h int, @i int, @k int, @l int, @m int, @p int, @n int

	set @a = @year % 19
	set @b = @year / 100
	set @c = @year % 100

	set @d = @b / 4
	set @e = @b % 4

	set @f = (@b + 8) / 25
	set @g = (@b - @f + 1) / 3
	set @h = (19 * @a + @b - @d - @g + 15) % 30
	
	set @i = @c / 4
	set @k = @c % 4

	set @l = (32 + 2*@e + 2*@i - @h - @k) % 7 
	set @m = (@a + 11 * @h + 22 * @l) / 451

	set @p = (@h + @l - 7 * @m + 114) % 31
	set @p = @p + 1

	set @n = (@h + @l - 7 * @m + 114) / 31

	set @Easter = DATEFROMPARTS(@year, @n, @p)

	return @Easter


end
GO
/****** Object:  UserDefinedFunction [dbo].[GetHolidays]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Funkcja zwraca listę dni wolnych od pracy na podany rok
create function [dbo].[GetHolidays](@year int)
returns @Dates table (HolidayDate date, HolidayName nvarchar(100))
as 
begin
	declare @Easter date
	set @Easter = dbo.GetEaster(@year)

	insert into @Dates values
		(DATEFROMPARTS(@year, 1, 1),	'Nowy Rok'),
		(DATEFROMPARTS(@year, 1, 6),	'Trzech Króli (Objawienie Pańskie)'),
		(@Easter,						'Wielkanoc'),
		(dateadd(day, 1, @Easter),		'Poniedziałek Wielkanocny'),
		(DATEFROMPARTS(@year, 5, 1),	'Międzynarodowe Święto Pracy'),
		(DATEFROMPARTS(@year, 5, 3),	'Święto Konstytucji 3 Maja'),
		(dateadd(day, 60, @Easter),		'Boże Ciało'),
		(DATEFROMPARTS(@year, 8, 15),	'Święto Wojska Polskiego, Wniebowzięcie Najświętszej Maryi Panny'),
		(DATEFROMPARTS(@year, 11, 1),	'Wszystkich Świętych'),
		(DATEFROMPARTS(@year, 11, 11),	'Narodowe święto Niepodległości'),
		(DATEFROMPARTS(@year, 12, 25),	'Boże Narodzenie (pierwszy dzień)'),
		(DATEFROMPARTS(@year, 12, 26),	'Boże Narodzenie (drugi dzień)')
	return
end
GO
/****** Object:  UserDefinedFunction [dbo].[WorkingDays]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[WorkingDays]
(
	@StartDate datetime,
	@EndDate datetime
)
RETURNS int
AS
BEGIN
DECLARE @days int
 
DECLARE @SatName nvarchar(100),@SunName nvarchar(100)
 
-- niezależnie od języka traktujemy sobotę i niedzielę jako dzień wolny
SELECT @SatName = DATENAME(dw,5), @SunName = DATENAME(dw,6)
 
SELECT @days = DATEDIFF(d,@StartDate ,@EndDate ) - DATEDIFF(wk,@StartDate ,@EndDate ) * 2 
- CASE 
    WHEN DATENAME(dw, @StartDate) <> @SatName AND DATENAME(dw, @EndDate) = @SatName THEN 1 
    WHEN DATENAME(dw, @StartDate) = @SatName AND DATENAME(dw, @EndDate) <> @SatName THEN -1 
  ELSE 0 END
- (SELECT COUNT(*) FROM dbo.GetHolidays(year(@StartDate)) WHERE HolidayDate BETWEEN @StartDate AND @EndDate 
		AND DATENAME(dw, HolidayDate) <> @SatName 
		AND DATENAME(dw, HolidayDate) <> @SunName)
 
RETURN (@days)
 
END
GO
/****** Object:  Table [Produkt].[RodzajSilnika]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[RodzajSilnika](
	[RodzajSilnikaId] [int] NOT NULL,
	[RodzajSilnikaKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](12) NOT NULL,
	[Opis] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[RodzajSilnikaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Silnik]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Silnik](
	[SilnikId] [int] NOT NULL,
	[SilnikKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](35) NULL,
	[PojemnoscCcm] [decimal](6, 2) NOT NULL,
	[IloscKm] [smallint] NULL,
	[RodzajSilnikaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SilnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Benzyna]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Benzyna] AS  
SELECT s.Nazwa, s.PojemnoscCcm, s.IloscKm, rs.Nazwa AS TypPaliwa FROM Produkt.Silnik AS s
LEFT JOIN Produkt.RodzajSilnika AS rs ON s.RodzajSilnikaId=rs.RodzajSilnikaId
WHERE rs.RodzajSilnikaId = 1
GO
/****** Object:  View [dbo].[Disel]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Disel] AS  
SELECT s.Nazwa, s.PojemnoscCcm, s.IloscKm, rs.Nazwa AS TypPaliwa FROM Produkt.Silnik AS s
LEFT JOIN Produkt.RodzajSilnika AS rs ON s.RodzajSilnikaId=rs.RodzajSilnikaId
WHERE rs.RodzajSilnikaId = 2
GO
/****** Object:  Table [Serwis].[TypUslugi]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[TypUslugi](
	[TypUslugiId] [int] NOT NULL,
	[TypUslugiKey] [int] NULL,
	[NazwaUslugi] [nvarchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypUslugiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[CennikUslugi]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[CennikUslugi](
	[CennikUslugiId] [int] NOT NULL,
	[CennikUslugiKey] [int] IDENTITY(1,1) NOT NULL,
	[UslugiId] [int] NULL,
	[DataObowOd] [date] NULL,
	[DataObowDo] [date] NULL,
	[Cena] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CennikUslugiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[Uslugi]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[Uslugi](
	[UslugiId] [int] NOT NULL,
	[UslugiKey] [int] IDENTITY(1,1) NOT NULL,
	[NazwaUslugi] [nvarchar](60) NULL,
	[TypId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UslugiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [RapOp].[Cennik]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [RapOp].[Cennik]
AS
-- Skrócona informacja dot. obowiązjącego cennika usług 

SELECT cu.UslugiId,cu.DataObowOd,cu.DataObowDo, tu.NazwaUslugi AS TypUslugi,su.NazwaUslugi,cu.Cena  FROM Serwis.CennikUslugi cu
LEFT JOIN Serwis.Uslugi as su on  cu.UslugiId=su.UslugiId
LEFT JOIN Serwis.TypUslugi as tu on su.TypId=tu.TypUslugiId
GO
/****** Object:  Table [Hr].[Pracownik]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Pracownik](
	[PracownikId] [int] NOT NULL,
	[PracownikKey] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nvarchar](15) NOT NULL,
	[Nazwisko] [nvarchar](45) NOT NULL,
	[DataUrodzenia] [date] NOT NULL,
	[DataZatrudnienia] [date] NOT NULL,
	[PESEL] [bigint] NOT NULL,
	[Adres] [nvarchar](25) NOT NULL,
	[Miasto] [int] NOT NULL,
	[KodPocztowy] [nvarchar](6) NOT NULL,
	[Kraj] [nvarchar](25) NOT NULL,
	[Telefon] [nvarchar](20) NOT NULL,
	[StanowiskoId] [int] NULL,
	[ZespolId] [int] NULL,
	[Przelozony] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PracownikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PESEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PESEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Zamownienie]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Zamownienie](
	[ZamownienieId] [int] NOT NULL,
	[ZamownienieKey] [int] IDENTITY(1,1) NOT NULL,
	[KlientId] [int] NOT NULL,
	[PracownikId] [int] NOT NULL,
	[CenaSprzedazy] [money] NULL,
	[DataZlozenia] [date] NULL,
	[DataOdbioru] [date] NULL,
	[StatusRealizacji] [bit] NULL,
	[StatusPlatnosci] [bit] NULL,
	[ModelId] [int] NULL,
	[PakietId] [int] NULL,
	[RabatId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamownienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [RapOp].[ListaPracownikowZamowienia]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [RapOp].[ListaPracownikowZamowienia]
AS

SELECT hrp.PracownikId,hrp.Imie,hrp.Nazwisko,z.WartosSprzedazy,z.IloscZamowien FROM Hr.Pracownik as hrp  with (readuncommitted)
RIGHT JOIN (SELECT zam.PracownikId, SUM(zam.CenaSprzedazy)AS WartosSprzedazy ,COUNT(zam.ZamownienieId) AS IloscZamowien FROM Produkt.Zamownienie as zam
GROUP BY zam.PracownikId) as z on hrp.PracownikId=z.PracownikId
GO
/****** Object:  Table [Produkt].[Model]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Model](
	[ModelId] [int] NOT NULL,
	[ModelKey] [int] IDENTITY(1,1) NOT NULL,
	[MarkaId] [int] NULL,
	[Nazwa] [nvarchar](30) NOT NULL,
	[TypNadwoziaId] [int] NULL,
	[SegmentId] [int] NULL,
	[SilnikId] [int] NULL,
	[PakietId] [int] NULL,
	[Rocznik] [int] NULL,
	[CenaNominalna] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Marka]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Marka](
	[MarkaId] [int] NOT NULL,
	[MarkaKey] [int] IDENTITY(1,1) NOT NULL,
	[NazwaSkr] [nvarchar](8) NULL,
	[NazwaDl] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [RapOp].[ListaSprzedanychMarek]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RapOp].[ListaSprzedanychMarek] AS

SELECT mark.NazwaSkr AS Marka, SUM(CenaSprzedazy) as SumarycznaKwotaSprzedazy, COUNT(mark.NazwaSkr) AS IloscZamowien FROM Produkt.Zamownienie as zam  with (readuncommitted)
LEFT JOIN Produkt.Model as m on zam.ModelId=m.ModelId
LEFT JOIN Produkt.Marka as mark on m.MarkaId=mark.MarkaId
GROUP BY mark.NazwaSkr
GO
/****** Object:  View [RapOp].[ModeleNieSprzedane]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RapOp].[ModeleNieSprzedane] 
AS
SELECT m.ModelId,m.Nazwa,m.Rocznik FROM Produkt.Model as m  with (readuncommitted)
LEFT JOIN Produkt.Zamownienie as zam on m.ModelId=zam.ModelId 
WHERE ZamownienieId is null
GO
/****** Object:  Table [Produkt].[Klient]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Klient](
	[KlientId] [int] NOT NULL,
	[KlientKey] [int] IDENTITY(1,1) NOT NULL,
	[KlientImiePierwsze] [nvarchar](20) NOT NULL,
	[KlientImieDrugie] [nvarchar](20) NOT NULL,
	[KlientNazwisko] [nvarchar](35) NOT NULL,
	[DataDodania] [date] NOT NULL,
	[Telefon] [int] NOT NULL,
	[EmailId] [nvarchar](45) NOT NULL,
	[DowodOsobistyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KlientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DowodOsobistyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[StatusyZamowienie]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[StatusyZamowienie](
	[StatusyZamowienieId] [int] NOT NULL,
	[StatusyZamownienieKey] [int] IDENTITY(1,1) NOT NULL,
	[NazaStatusu] [nvarchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusyZamowienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[Zamowienie]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[Zamowienie](
	[ZamowienieId] [int] NOT NULL,
	[ZamowienieKey] [int] IDENTITY(1,1) NOT NULL,
	[StatusyZamowienieId] [int] NULL,
	[KlientId] [int] NOT NULL,
	[PracownikId] [int] NOT NULL,
	[DataZlozenia] [date] NOT NULL,
	[DataZakonczenia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamowienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [RapOp].[RaportDataZakonczeniaStatusDoSprawdzenia]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [RapOp].[RaportDataZakonczeniaStatusDoSprawdzenia]
AS

SELECT z.ZamowienieId,sz.NazaStatusu,z.KlientId,kl.KlientImiePierwsze,
kl.KlientNazwisko,kl.Telefon,z.PracownikId,p.Imie AS ImiePracownika,p.Nazwisko AS NazwiskoPracownika,
z.DataZlozenia,z.DataZakonczenia FROM Serwis.Zamowienie AS z  with (readuncommitted)
LEFT JOIN Serwis.StatusyZamowienie AS sz ON z.StatusyZamowienieId=sz.StatusyZamowienieId
LEFT JOIN Hr.Pracownik AS p ON z.PracownikId=p.PracownikId
LEFT JOIN Produkt.Klient as kl on z.KlientId=kl.KlientId
WHERE DataZakonczenia is not null AND z.StatusyZamowienieId <6 OR z.StatusyZamowienieId >6
GO
/****** Object:  Table [Hr].[KartaCzasuPracy]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[KartaCzasuPracy](
	[PracownikId] [int] NOT NULL,
	[MiesiacId] [int] NOT NULL,
	[iloscDni] [int] NULL,
	[IloscNadgodzin] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PracownikId] ASC,
	[MiesiacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Hr].[RaportKartaCzasuPracy]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Hr].[RaportKartaCzasuPracy]
AS
SELECT * FROM Hr.KartaCzasuPracy
GO
/****** Object:  Table [Produkt].[SzczegolyZamowienia]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[SzczegolyZamowienia](
	[ZamowienieId] [int] NOT NULL,
	[WyposzazenieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamowienieId] ASC,
	[WyposzazenieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[PakietLista]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[PakietLista](
	[PakietId] [int] NOT NULL,
	[PakietKey] [int] IDENTITY(1,1) NOT NULL,
	[WyposzazenieId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PakietId] ASC,
	[WyposzazenieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[TypWyposazenia]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[TypWyposazenia](
	[TypWyposazeniaId] [int] NOT NULL,
	[TypWyposazeniaKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypWyposazeniaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[TypNadwozia]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[TypNadwozia](
	[TypNadwoziaId] [int] NOT NULL,
	[TypNadwoziaKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypNadwoziaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Wyposzazenie]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Wyposzazenie](
	[WyposzazenieId] [int] NOT NULL,
	[WyposzazenieKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[TypWyposazeniaId] [int] NULL,
	[CENA] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[WyposzazenieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Pakiet]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Pakiet](
	[PakietId] [int] NOT NULL,
	[PakietKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](25) NOT NULL,
	[CenaNominalna] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[PakietId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [RapOp].[ZamSzczeg]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create function [RapOp].[ZamSzczeg] (@ZamId int)
returns TABLE
AS
RETURN

SELECT sz.ZamowienieId, 
mark.Nazwa,
typ.Nazwa AS TypNadwozia,
pak.Nazwa as NazwaPakietu, 
tw.Nazwa AS NazwaTypWyposazenia, -- 5
wyp.WyposzazenieId,
wyp.Nazwa  as NazwaWyposzazenia,
wyp.CENA as CenaWyposazenia,mark.CenaNominalna 
FROM Produkt.Wyposzazenie AS wyp
RIGHT JOIN Produkt.SzczegolyZamowienia AS sz ON wyp.WyposzazenieId=sz.WyposzazenieId
RIGHT JOIN Produkt.Zamownienie AS z ON sz.ZamowienieId=z.ZamownienieId 
LEFT JOIN  Produkt.Model as mark ON z.ModelId=mark.ModelId
LEFT JOIN Produkt.TypNadwozia as typ on mark.TypNadwoziaId=typ.TypNadwoziaId
LEFT JOIN Produkt.Pakiet as pak on mark.PakietId=pak.PakietId
LEFT JOIN Produkt.TypWyposazenia as tw on wyp.TypWyposazeniaId=tw.TypWyposazeniaId
WHERE sz.WyposzazenieId is not null

UNION

SELECT zam.ZamownienieId, 
mark.Nazwa,
typ.Nazwa AS TypNadwozia, 
pak.Nazwa as NazwaPakietu, 
tw.Nazwa AS NazwaTypWyposazenia, --5
w.TypWyposazeniaId , w.Nazwa as NazwaWyposzazenia,
w.CENA as CenaWyposazenia, mark.CenaNominalna
FROM Produkt.Zamownienie as zam
LEFT JOIN  Produkt.Model as mark ON zam.ModelId=mark.ModelId
LEFT JOIN  Produkt.TypNadwozia as typ on mark.TypNadwoziaId=typ.TypNadwoziaId
LEFT JOIN  Produkt.Pakiet as pak on mark.PakietId=pak.PakietId
LEFT JOIN  Produkt.PakietLista as pl on pak.PakietId=pl.PakietId
LEFT JOIN Produkt.Wyposzazenie as w on pl.WyposzazenieId=w.WyposzazenieId
LEFT JOIN Produkt.TypWyposazenia as tw on w.TypWyposazeniaId=tw.TypWyposazeniaId

WHERE zam.ZamownienieId=@ZamId




GO
/****** Object:  Table [Produkt].[Rabat]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Rabat](
	[RabatId] [int] NOT NULL,
	[WysokoscRabatu] [decimal](6, 2) NOT NULL,
	[NazwaRabatu] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RabatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [RapOp].[ListaZamowien]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [RapOp].[ListaZamowien]
AS
SELECT z.ZamownienieId,z.DataZlozenia, r.NazwaRabatu,
z.CenaSprzedazy,m.CenaNominalna, (SELECT (CenaNominalna-CenaSprzedazy)/(SELECT CenaNominalna)) AS Wartosc,
su.WartoscWypDodatkowego,r.WysokoscRabatu AS ProcentRabatu, 
ABS((SELECT CenaNominalna-CenaSprzedazy)) as WartoscRabatu

FROM Produkt.Zamownienie as z with (readuncommitted)
LEFT JOIN Produkt.Rabat as r ON z.RabatId=r.RabatId
LEFT JOIN Produkt.Model as m ON z.ModelId=m.ModelId
LEFT JOIN Produkt.SzczegolyZamowienia as sz on z.ZamownienieId=sz.ZamowienieId
LEFT JOIN (SELECT sz.ZamowienieId , SUM(wy.CENA) AS WartoscWypDodatkowego FROM Produkt.SzczegolyZamowienia as sz
LEFT JOIN Produkt.Wyposzazenie as wy on sz.WyposzazenieId=wy.WyposzazenieId
GROUP BY sz.ZamowienieId) AS su ON z.ZamownienieId=su.ZamowienieId


GO
/****** Object:  Table [dbo].[TableName]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableName](
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[DniRoboczeMiesiac]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[DniRoboczeMiesiac](
	[RokId] [int] NOT NULL,
	[MiesiacId] [int] NOT NULL,
	[DienRoboczy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RokId] ASC,
	[MiesiacId] ASC,
	[DienRoboczy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[GodzinowyCzasPracy]    Script Date: 14.02.2019 09:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[GodzinowyCzasPracy](
	[RokId] [int] NOT NULL,
	[MiesiacId] [int] NOT NULL,
	[LiczbaGodzinPracy] [int] NULL,
	[LiczbaDniPracy] [int] NULL,
	[LiczbaDniWolnych] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RokId] ASC,
	[MiesiacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[KartaCzasuPracyDni]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[KartaCzasuPracyDni](
	[PracownikId] [int] NOT NULL,
	[MiesiacId] [int] NOT NULL,
	[Dzien] [int] NOT NULL,
	[ObecnoscId] [int] NOT NULL,
	[Od] [decimal](10, 2) NULL,
	[Do] [decimal](10, 2) NULL,
	[Nadgodziny] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PracownikId] ASC,
	[MiesiacId] ASC,
	[Dzien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[ObecnoscId]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[ObecnoscId](
	[ObecnoscId] [int] NOT NULL,
	[Nazwa] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ObecnoscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Premie]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Premie](
	[PremieId] [int] NOT NULL,
	[PremieKey] [int] IDENTITY(1,1) NOT NULL,
	[PracownikId] [int] NULL,
	[PremiaMnoznik] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[PremieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Stanowisko]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Stanowisko](
	[StanowiskoId] [int] NOT NULL,
	[StanowiskoKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StanowiskoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Typ]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Typ](
	[TypId] [int] NOT NULL,
	[TypKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[WynagrodzeniaPracwonika]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[WynagrodzeniaPracwonika](
	[WynId] [int] NOT NULL,
	[WynagrodzeniaKey] [int] IDENTITY(1,1) NOT NULL,
	[PracownikId] [int] NULL,
	[MiesiacRokId] [int] NOT NULL,
	[OkresOd] [date] NULL,
	[OkresDo] [date] NULL,
	[WartoscWynagrodzenia] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[WynId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Wyplaty]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Wyplaty](
	[PracownikId] [int] NOT NULL,
	[MiesiacRokId] [int] NOT NULL,
	[WynId] [int] NOT NULL,
	[WyplatyKey] [int] IDENTITY(1,1) NOT NULL,
	[PremieId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PracownikId] ASC,
	[MiesiacRokId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hr].[Zespol]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hr].[Zespol](
	[ZespolId] [int] NOT NULL,
	[ZespolKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZespolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Cennik]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Cennik](
	[CennikId] [int] NOT NULL,
	[CennikKey] [int] IDENTITY(1,1) NOT NULL,
	[ModelId] [int] NOT NULL,
	[DataDodania] [date] NOT NULL,
	[DataObowiazywania] [date] NOT NULL,
	[CenaNominalna] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CennikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[CennikWyposzazenia]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[CennikWyposzazenia](
	[CennikWypoId] [int] NOT NULL,
	[CennikWyposzazeniaKey] [int] IDENTITY(1,1) NOT NULL,
	[WyposzazenieId] [int] NOT NULL,
	[ModelId] [int] NOT NULL,
	[DataDodania] [date] NOT NULL,
	[DataObowiazywania] [date] NOT NULL,
	[CenaNominalna] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[CennikWypoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Do]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Do](
	[DoId] [int] NOT NULL,
	[DoKey] [int] IDENTITY(1,1) NOT NULL,
	[Seria] [nvarchar](12) NOT NULL,
	[WydanyPrzez] [nvarchar](45) NOT NULL,
	[WaznyDo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Seria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Samochod]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Samochod](
	[SamochodId] [int] NOT NULL,
	[SamochodKey] [int] IDENTITY(1,1) NOT NULL,
	[NrVin] [nvarchar](45) NOT NULL,
	[ModelId] [int] NULL,
	[ZamowienieId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SamochodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Produkt].[Segment]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Produkt].[Segment](
	[SegmentId] [int] NOT NULL,
	[SegmentKey] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nazwa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[HistoriaAudyt]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[HistoriaAudyt](
	[AudytId] [int] IDENTITY(1,1) NOT NULL,
	[ZamowienieId] [int] NULL,
	[StatusId] [int] NULL,
	[PracownikId] [int] NULL,
	[DataZmiany] [date] NULL,
	[AktualizowanePrzez] [nvarchar](128) NULL,
	[AktualizowanoDnia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AudytId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[HistoriaZamowienia]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[HistoriaZamowienia](
	[HistoriaZamowieniaId] [int] NOT NULL,
	[ZamowienieId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[PracownikId] [int] NOT NULL,
	[DataZmiany] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoriaZamowieniaId] ASC,
	[ZamowienieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Serwis].[SzczegolyZamowienia]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Serwis].[SzczegolyZamowienia](
	[ZamowienieID] [int] NOT NULL,
	[UslugaId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZamowienieID] ASC,
	[UslugaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Wspolne].[Miasto]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Wspolne].[Miasto](
	[MiastoId] [int] NOT NULL,
	[MiastoKey] [int] NOT NULL,
	[NazwaMista] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MiastoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NazwaMista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Produkt].[Wyposzazenie] ADD  DEFAULT ((1)) FOR [TypWyposazeniaId]
GO
ALTER TABLE [Hr].[KartaCzasuPracy]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[KartaCzasuPracyDni]  WITH CHECK ADD FOREIGN KEY([ObecnoscId])
REFERENCES [Hr].[ObecnoscId] ([ObecnoscId])
GO
ALTER TABLE [Hr].[KartaCzasuPracyDni]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[Pracownik]  WITH CHECK ADD FOREIGN KEY([Przelozony])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[Pracownik]  WITH CHECK ADD FOREIGN KEY([StanowiskoId])
REFERENCES [Hr].[Stanowisko] ([StanowiskoId])
ON DELETE SET NULL
GO
ALTER TABLE [Hr].[Pracownik]  WITH CHECK ADD FOREIGN KEY([ZespolId])
REFERENCES [Hr].[Zespol] ([ZespolId])
ON DELETE SET NULL
GO
ALTER TABLE [Hr].[Pracownik]  WITH CHECK ADD  CONSTRAINT [Miasto] FOREIGN KEY([Miasto])
REFERENCES [Wspolne].[Miasto] ([MiastoId])
GO
ALTER TABLE [Hr].[Pracownik] CHECK CONSTRAINT [Miasto]
GO
ALTER TABLE [Hr].[Premie]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[WynagrodzeniaPracwonika]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Hr].[Wyplaty]  WITH CHECK ADD FOREIGN KEY([PremieId])
REFERENCES [Hr].[Premie] ([PremieId])
GO
ALTER TABLE [Hr].[Wyplaty]  WITH CHECK ADD FOREIGN KEY([WynId])
REFERENCES [Hr].[WynagrodzeniaPracwonika] ([WynId])
GO
ALTER TABLE [Produkt].[Cennik]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[CennikWyposzazenia]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[CennikWyposzazenia]  WITH CHECK ADD FOREIGN KEY([WyposzazenieId])
REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
GO
ALTER TABLE [Produkt].[Klient]  WITH CHECK ADD FOREIGN KEY([DowodOsobistyId])
REFERENCES [Produkt].[Do] ([DoId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([MarkaId])
REFERENCES [Produkt].[Marka] ([MarkaId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([PakietId])
REFERENCES [Produkt].[Pakiet] ([PakietId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([SegmentId])
REFERENCES [Produkt].[Segment] ([SegmentId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([SilnikId])
REFERENCES [Produkt].[Silnik] ([SilnikId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Model]  WITH CHECK ADD FOREIGN KEY([TypNadwoziaId])
REFERENCES [Produkt].[TypNadwozia] ([TypNadwoziaId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[PakietLista]  WITH CHECK ADD FOREIGN KEY([WyposzazenieId])
REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
GO
ALTER TABLE [Produkt].[Samochod]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[Samochod]  WITH CHECK ADD FOREIGN KEY([ZamowienieId])
REFERENCES [Produkt].[Zamownienie] ([ZamownienieId])
GO
ALTER TABLE [Produkt].[Silnik]  WITH CHECK ADD FOREIGN KEY([RodzajSilnikaId])
REFERENCES [Produkt].[RodzajSilnika] ([RodzajSilnikaId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[SzczegolyZamowienia]  WITH CHECK ADD FOREIGN KEY([WyposzazenieId])
REFERENCES [Produkt].[Wyposzazenie] ([WyposzazenieId])
GO
ALTER TABLE [Produkt].[Wyposzazenie]  WITH CHECK ADD FOREIGN KEY([TypWyposazeniaId])
REFERENCES [Produkt].[TypWyposazenia] ([TypWyposazeniaId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([KlientId])
REFERENCES [Produkt].[Klient] ([KlientId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([ModelId])
REFERENCES [Produkt].[Model] ([ModelId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([PakietId])
REFERENCES [Produkt].[Pakiet] ([PakietId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD FOREIGN KEY([RabatId])
REFERENCES [Produkt].[Rabat] ([RabatId])
GO
ALTER TABLE [Serwis].[CennikUslugi]  WITH CHECK ADD FOREIGN KEY([UslugiId])
REFERENCES [Serwis].[Uslugi] ([UslugiId])
ON DELETE SET NULL
GO
ALTER TABLE [Serwis].[HistoriaZamowienia]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Serwis].[HistoriaZamowienia]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [Serwis].[StatusyZamowienie] ([StatusyZamowienieId])
GO
ALTER TABLE [Serwis].[HistoriaZamowienia]  WITH CHECK ADD FOREIGN KEY([ZamowienieId])
REFERENCES [Serwis].[Zamowienie] ([ZamowienieId])
GO
ALTER TABLE [Serwis].[SzczegolyZamowienia]  WITH CHECK ADD FOREIGN KEY([UslugaId])
REFERENCES [Serwis].[Uslugi] ([UslugiId])
GO
ALTER TABLE [Serwis].[Uslugi]  WITH CHECK ADD FOREIGN KEY([TypId])
REFERENCES [Serwis].[TypUslugi] ([TypUslugiId])
ON DELETE SET NULL
GO
ALTER TABLE [Serwis].[Zamowienie]  WITH CHECK ADD FOREIGN KEY([KlientId])
REFERENCES [Produkt].[Klient] ([KlientId])
GO
ALTER TABLE [Serwis].[Zamowienie]  WITH CHECK ADD FOREIGN KEY([PracownikId])
REFERENCES [Hr].[Pracownik] ([PracownikId])
GO
ALTER TABLE [Serwis].[Zamowienie]  WITH CHECK ADD FOREIGN KEY([StatusyZamowienieId])
REFERENCES [Serwis].[StatusyZamowienie] ([StatusyZamowienieId])
ON DELETE SET NULL
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD CHECK  (([CenaSprzedazy]>(0)))
GO
ALTER TABLE [Produkt].[Zamownienie]  WITH CHECK ADD CHECK  (([CenaSprzedazy]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[DodajSzczegolyZam]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[DodajSzczegolyZam]
@ZamowienieId int,
@WyposzazenieId int


AS
BEGIN
SET IDENTITY_INSERT Produkt.Zamownienie  ON
INSERT INTO Produkt.SzczegolyZamowienia (ZamowienieId,WyposzazenieId)
VALUES (@ZamowienieId,@WyposzazenieId)
DECLARE @Suma money
DECLARE @Rabat decimal (6,2)
DECLARE @WyliczWartoscKoncowa money
DECLARE @RabatId int

SET @RabatId = (Select RabatId FROM Produkt.Zamownienie WHERE ZamownienieId=@ZamowienieId)
SET @Rabat = (Select WysokoscRabatu FROM Produkt.Rabat WHERE RabatId=@RabatId)

SET @Suma = (SELECT CenaSprzedazy FROM Produkt.Zamownienie WHERE ZamownienieId=@ZamowienieId)+
(SELECT SUM(CENA) FROM Produkt.SzczegolyZamowienia as p
LEFT JOIN Produkt.Wyposzazenie as w ON p.WyposzazenieId=w.WyposzazenieId)

SET @WyliczWartoscKoncowa = @Suma-(@Suma*@Rabat)/100

UPDATE Produkt.Zamownienie
SET CenaSprzedazy =@WyliczWartoscKoncowa
WHERE ZamownienieId=@ZamowienieId
END
GO
/****** Object:  StoredProcedure [dbo].[NowyKlient]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NowyKlient]

@KlientId int,
@KlientKey int,
@KlientImiePierwsze nvarchar (20),
@KlientImieDrugie nvarchar (20),
@KlientNazwisko nvarchar (35),
@DataDodania date,
@Telefon int,
@EmailId nvarchar (45),
@DowodOsobistyId int
AS
BEGIN
SET IDENTITY_INSERT Produkt.Klient ON
INSERT INTO Produkt.Klient (KlientId,KlientKey,KlientImiePierwsze,KlientImieDrugie,KlientNazwisko,DataDodania,Telefon,EmailId,DowodOsobistyId)
VALUES (@KlientId,@KlientKey,@KlientImiePierwsze,@KlientImieDrugie,@KlientNazwisko,@DataDodania,@Telefon,@EmailId,@DowodOsobistyId);
END
GO
/****** Object:  StoredProcedure [dbo].[NowyKlientDo]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NowyKlientDo]

@DoId int,
@DoKey int,
@Seria nvarchar(12),
@WydanyPrzez nvarchar(45),
@WaznyDo date
AS
BEGIN

SET IDENTITY_INSERT Produkt.Do ON
INSERT INTO Produkt.Do (DoId,DoKey,Seria,WydanyPrzez,WaznyDo)
VALUES (@DoId,@DoKey,@Seria,@WydanyPrzez,@WaznyDo)

END
GO
/****** Object:  StoredProcedure [Hr].[DodajKartaCzasuPracyDni]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Hr].[DodajKartaCzasuPracyDni]
@PracownikId int,
@MiesiacId int,
@Dzien int,
@ObecnoscId int,
@Od decimal(10,2),
@Do decimal(10,2)
AS
BEGIN

DECLARE @Nadgodziny decimal(10,2)

SET @Nadgodziny = (SELECT @Do-@Od)-8

INSERT INTO Hr.KartaCzasuPracyDni (PracownikId,MiesiacId,Dzien,ObecnoscId,Od,Do,Nadgodziny)
VALUES (@PracownikId,@MiesiacId,@Dzien,@ObecnoscId,@Od,@Do,@Nadgodziny)

END
GO
/****** Object:  StoredProcedure [Produkt].[ZamuwmienieRandom]    Script Date: 14.02.2019 09:45:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Produkt].[ZamuwmienieRandom]
AS
--select * from Produkt.Zamownienie

DECLARE @startLoopID INT = 1
DECLARE @endLoopID INT = 20 -- Rows you want to add

SET IDENTITY_INSERT Produkt.Zamownienie ON
WHILE @startLoopID <= @endLoopID
BEGIN

SET @startLoopID = @startLoopID + 1;

DECLARE 
@ZamownienieId int,
@ZamownienieKey int,
@KlientId int, -- random 1-15
@PracownikId int, -- random
@CenaSprzedazy money, -- select cena nominalna z modelu
@DataZlozenia date, --  @rdate
@DataOdbioru date,
@StatusRealizacji bit, --0
@StatusPlatnosci bit,--0
@ModelId int, -- random od 4 do 13
@PakietId int,  -- random 1
@RabatId int, -- random od 1 do 4
@rdate DATE --  @rdate SET @rdate = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365 ), '2018-05-01');

SET @ZamownienieId = (SELECT MAX(ZamownienieId)+1 FROM Produkt.Zamownienie)
SET @ZamownienieKey = (SELECT MAX(ZamownienieId)+1 FROM Produkt.Zamownienie)

--KlientId
DECLARE @Random@KlientId INT;
DECLARE @Upper@KlientId INT;
DECLARE @Lower@KlientId  INT

--PracownikId
DECLARE @Random@PracownikId INT;
DECLARE @Upper@PracownikId INT;
DECLARE @Lower@PracownikId  INT

--ModelId
DECLARE @Random@ModelId INT;
DECLARE @Upper@ModelId INT;
DECLARE @Lower@ModelId  INT

--RabatId
DECLARE @Random@RabatId INT;
DECLARE @Upper@RabatId INT;
DECLARE @Lower@RabatId  INT

SET @Lower@KlientId = 1 ---- The lowest random number
SET @Upper@KlientId = 15 ---- The highest random number
SELECT @Random@KlientId = ROUND(((@Upper@KlientId - @Lower@KlientId -1) * RAND() + @Lower@KlientId), 0)
SET @KlientId =@Random@KlientId -- przypisanie losowego nr kl


SET @Lower@PracownikId = 1 ---- The lowest random number
SET @Upper@PracownikId = 4 ---- The highest random number
SELECT @Random@PracownikId = ROUND(((@Upper@PracownikId - @Lower@PracownikId -1) * RAND() + @Lower@PracownikId), 0)
SET @PracownikId= @Random@PracownikId -- przypisanie pracowniak sprzedazy

SET @Lower@ModelId = 4 ---- The lowest random number
SET @Upper@ModelId = 13 ---- The highest random number
SELECT @Random@ModelId = ROUND(((@Upper@ModelId - @Lower@ModelId -1) * RAND() + @Lower@ModelId), 0)
SET @ModelId= @Random@ModelId

SET @PakietId = 1
SET @CenaSprzedazy = (SELECT CenaNominalna FROM Produkt.Model WHERE ModelId= @ModelId)

SET @rdate  = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365 ), '2018-05-01');
SET @DataZlozenia=  @rdate

SET @DataOdbioru=null
SET @StatusRealizacji = 0
SET @StatusPlatnosci =0


SET @Lower@RabatId = 1 ---- The lowest random number
SET @Upper@RabatId = 4 ---- The highest random number
SELECT @Random@RabatId= ROUND(((@Upper@RabatId - @Lower@RabatId -1) * RAND() + @Lower@RabatId), 0)
SET @RabatId =@Random@RabatId -- przypisanie losowego nr kl

INSERT INTO Produkt.Zamownienie 
		(ZamownienieId,ZamownienieKey,KlientId,PracownikId,CenaSprzedazy,DataZlozenia,DataOdbioru,StatusRealizacji,StatusPlatnosci,ModelId,PakietId,RabatId)
VALUES (@ZamownienieId,@ZamownienieKey,@KlientId,@PracownikId,@CenaSprzedazy,@DataZlozenia,@DataOdbioru,@StatusRealizacji,@StatusPlatnosci,@ModelId,@PakietId,@RabatId)



END
GO
USE [master]
GO
ALTER DATABASE [SalonSamochodowy] SET  READ_WRITE 
GO
