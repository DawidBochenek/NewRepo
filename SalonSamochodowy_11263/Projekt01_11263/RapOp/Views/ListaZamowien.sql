
CREATE VIEW rapOp.ListaZamowien
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