USE SalonSamochodowy
GO


INSERT INTO [SalonSamocodowyZdenormalizowana].[Salon].[Zamowienie]
(ZamownienieId,
ZamownienieKey,
KlientId,
KlientImiePierwsze,
KlientImieDrugie,
KlientNazwisko,
PracownikId,Imie,Nazwisko,ModelId,NazwaSkr,Nazwa,NazwaSilnika,NazwaTypuSilnika,PojemnoscCcm,IloscKm,PakietId,NazwaPakietu,CenaNominalna,RabatId,NazwaRabatu,WartoscRabatu,WysokoscRabatu,CenaSprzedazy,DataZlozenia,DataOdbioru,StatusRealizacji,StatusPlatnosci)

SELECT zm.ZamownienieId,
zm.ZamownienieKey, 
zm.KlientId,
kl.KlientImiePierwsze,
kl.KlientImieDrugie,
kl.KlientNazwisko,
zm.PracownikId,
pc.Imie as ImiePracownika, 
pc.Nazwisko as NazwiskoPracownika,
zm.ModelId,
mr.NazwaSkr,
mo.Nazwa, 
rs.Nazwa as TypSilnika, 
sl.Nazwa,
sl.PojemnoscCcm,
sl.IloscKm,
zm.PakietId,
pk.Nazwa as NazwaPakietu,
mo.CenaNominalna,
zm.RabatId,
rb.NazwaRabatu, 
rb.WysokoscRabatu as ProcentowaWartoscRabatu,
(select zm.CenaSprzedazy-mo.CenaNominalna) as WysokoscRabatu,
zm.CenaSprzedazy, 
zm.DataZlozenia,
zm.DataOdbioru,
zm.StatusRealizacji,
zm.StatusPlatnosci
FROM [SalonSamochodowy].[Produkt].[Zamownienie] as zm
LEFT JOIN Produkt.Pakiet as pk on zm.PakietId=pk.PakietId
LEFT JOIN Produkt.Klient as kl on zm.KlientId=kl.KlientId
LEFT JOIN Hr.Pracownik as pc on zm.PracownikId=pc.PracownikId
LEFT JOIN Produkt.Model as mo on zm.ModelId=mo.MarkaId
LEFT JOIN Produkt.Rabat as rb on zm.RabatId=rb.RabatId
LEFT JOIN Produkt.Marka as mr on mo.MarkaId=mr.MarkaId
LEFT JOIN Produkt.Silnik as sl on mo.SilnikId=sl.SilnikId
LEFT JOIN Produkt.RodzajSilnika as rs on sl.RodzajSilnikaId=rs.RodzajSilnikaId
