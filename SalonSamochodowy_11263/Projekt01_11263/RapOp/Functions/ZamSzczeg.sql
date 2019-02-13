

create function rapOp.ZamSzczeg (@ZamId int)
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