

CREATE PROCEDURE DodajSzczegolyZam
@ZamowienieId int,
@WyposzazenieId int,
@RabatId int

AS
BEGIN
SET IDENTITY_INSERT Produkt.Zamownienie  ON
INSERT INTO Produkt.SzczegolyZamowienia (ZamowienieId,WyposzazenieId)
VALUES (@ZamowienieId,@WyposzazenieId)
DECLARE @Suma money
DECLARE @Rabat decimal (6,2)
DECLARE @WyliczWartoscKoncowa money


SET @Rabat = (Select WysokoscRabatu FROM Produkt.Rabat WHERE RabatId=@RabatId)

SET @Suma = (SELECT CenaSprzedazy FROM Produkt.Zamownienie WHERE ZamownienieId=@ZamowienieId)+
(SELECT SUM(CENA) FROM Produkt.SzczegolyZamowienia as p
LEFT JOIN Produkt.Wyposzazenie as w ON p.WyposzazenieId=w.WyposzazenieId)

SET @WyliczWartoscKoncowa = @Suma-(@Suma*@Rabat)/100

UPDATE Produkt.Zamownienie
SET CenaSprzedazy =@WyliczWartoscKoncowa
WHERE ZamownienieId=@ZamowienieId
END