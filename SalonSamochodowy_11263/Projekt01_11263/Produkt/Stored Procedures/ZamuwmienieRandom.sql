
CREATE PROCEDURE Produkt.ZamuwmienieRandom
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