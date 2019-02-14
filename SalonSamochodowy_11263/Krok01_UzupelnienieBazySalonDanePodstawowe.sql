--USE SalonSamochodowy
--GO

--SET IDENTITY_INSERT Produkt.Marka ON
--INSERT INTO Produkt.Marka (MarkaId, MarkaKey, NazwaSkr, NazwaDl)
--VALUES (1,1,'BMW','Bayerische Motoren Werke'),
--(2,2,'Fiat','Fiat'),(3,3,'Dacia','Automobile Dacia S.A.');
--SET IDENTITY_INSERT Produkt.Marka OFF


--USE SalonSamochodowy
--GO

--SET IDENTITY_INSERT Produkt.Segment ON
--INSERT INTO Produkt.Segment (SegmentId, SegmentKey, Nazwa)
--VALUES (1,1,'A'),(2,2,'B'),(3,3,'C');
--SET IDENTITY_INSERT Produkt.Segment OFF

--USE SalonSamochodowy
--GO


--SET IDENTITY_INSERT Produkt.TypNadwozia ON

--INSERT INTO Produkt.TypNadwozia (TypNadwoziaId, TypNadwoziaKey, Nazwa)
--VALUES (1,1,'SUV'),(2,2,'Coupé'),(3,3,'Sedan'),(4,4,'lift-back'),(5,5,'Kombi'),
--(6,6,'Kabriolet'),(7,7,'Minivan'),(8,8,'Hatch-back'),(9,9,'Van');
--SET IDENTITY_INSERT Produkt.TypNadwozia OFF

--USE SalonSamochodowy
--GO


--SET IDENTITY_INSERT Produkt.RodzajSilnika ON
--INSERT INTO Produkt.RodzajSilnika (RodzajSilnikaId, RodzajSilnikaKey, Nazwa,Opis)
--VALUES (1,1,'Benzyna','To jest opis Benzyna'),(2,2,'Disel','To jest opis disel ON'),
--(3,3,'Hybryda','Benzyna i elektryk'),(4,4,'Elektryczny','Eko');
--SET IDENTITY_INSERT Produkt.RodzajSilnika OFF

USE SalonSamochodowy
GO
SET IDENTITY_INSERT Produkt.Silnik ON
INSERT INTO Produkt.Silnik (SilnikId, SilnikKey, Nazwa, PojemnoscCcm, IloscKm, RodzajSilnikaId)
VALUES (1,1,'Fiat 1.4 8V 77 KM',1368,77,1),(2,2,'Fiat 1.3 MULTIJET 16V 80 KM',1368,80,2),
(3,3,'Fiat 1.4 16V 95 KM',1368,95,1),(4,4,'Fiat 1.3 MULTIJET 16V 95 KM',1368,95,2),
(5,5,'Fiat 1.6 MULTIJET 16V 120 KM',1568,120,2)
SET IDENTITY_INSERT Produkt.Silnik OFF

USE SalonSamochodowy
GO
SET IDENTITY_INSERT Produkt.Pakiet ON
INSERT INTO Produkt.Pakiet (PakietId,PakietKey,Nazwa)
VALUES (1,1,'POP'),(2,2,'STREET'),(3,3,'EASY'),(4,4,'MIRROR'),(5,5,'LOUNGE'),(6,6,'BUSINESS');
SET IDENTITY_INSERT Produkt.Pakiet OFF

USE SalonSamochodowy
GO

SET IDENTITY_INSERT Produkt.Model  ON
INSERT INTO Produkt.Model (ModelId,ModelKey,MarkaId,Nazwa,TypNadwoziaId,SegmentId,SilnikId,PakietId,Rocznik,CenaNominalna)
VALUES (1,1,2,'Tipo Sedan Disel',3,2,1,1,2018,48100),
(2,2,2,'Tipo Sedan Benzyna',3,1,1,1,2018,48100),
(3,3,1,'BMW X1',4,2,3,2,2018,132900),
(4,4,2,'500',8,2,3,1,2018,46200),
(5,5,2,'Panda',8,2,2,1,2018,34800),
(6,6,2,'Qubo',7,2,1,1,2018,50800),
(7,7,2,'124 Spider',6,2,5,1,2018,117000),
(8,8,2,'Doblo',7,2,5,1,2018,65000),
(9,9,2,'500',8,2,4,1,2019,48500),
(10,10,2,'Panda',8,2,3,1,2019,36800),
(11,11,2,'Qubo',7,2,2,1,2019,56000),
(12,12,2,'124 Spider',6,2,5,1,2019,12400),
(13,13,2,'Doblo',7,2,5,1,2019,68300)
SET IDENTITY_INSERT Produkt.Model  OFF

USE SalonSamochodowy
GO

SET IDENTITY_INSERT Produkt.TypWyposazenia ON
INSERT INTO Produkt.TypWyposazenia (TypWyposazeniaId,TypWyposazeniaKey,Nazwa)
VALUES (1,1,'AUDIO'),(2,2,'BEZPIECZEÑSTWO'),(3,3,'FELGI'),(4,4,'Komfort'),(5,5,'NADWOZIE')

SET IDENTITY_INSERT Produkt.TypWyposazenia OFF

USE SalonSamochodowy
GO


SET IDENTITY_INSERT Produkt.Wyposzazenie ON
INSERT INTO Produkt.Wyposzazenie (WyposzazenieId,WyposzazenieKey,Nazwa,TypWyposazeniaId)
VALUES
(1,1,'Port USB',1), -- AUDIO 
(2,2,'Radio UConnect + system Bluetooth',1),
(3,3,'Funkcja Android Auto / CarPlay',1),
(4,4,'Kierownica ze sterowaniem radioodtwarzaczem UConnect 5" (dla 7HZ i 7J1)',1),
(5,5,'Radio Uconnect z 7" dotykowym ekranem i systemem Bluetooth ',1),
(6,6,'Wyœwietlacz TFT 3,5" monochromatyczny ',1),
(7,7,'Dodatkowe gniazdo zapalniczi w baga¿niku ',1),
(8,8,'Poduszka powietrzna kierowcy ',2),--BEZPIECZEÑSTWO 
(9,9,'Poduszka powietrzna pasa¿era ',2),
(10,10,'Poduszki powietrzne boczne ',2),
(11,11,'Poduszki powietrzne kurtynowe ',2),
(12,12,'System ESC ',2),
(13,13,'Panic Brake Assist ',2),
(14,14,'TC ',2),
(15,15,'DTC ',2),
(16,16,'ERM ',2),
(17,17,'Hill Hold Control ',2),
(18,18,'Dwa tylne zag³ówki ',2),
(19,19,'Œwiat³a przeciwmgielne z funkcj¹ doœwietlania zakrêtów ',2),
(20,20,'Trzy tylne zag³ówki ',2), --13
(21,21,'Felgi stalowe 15" ',3), --FELGI
(22,22,'Felgi stalowe 16" ',3),
(23,23,'Alufelgi 16" ',3),
(24,24,'Alufelgi 15" ',3),
(25,25,'Automatycznie unoszona klapa baga¿nika ',4), --KOMFORT 
(26,26,'Centralny zamek ',4),
(27,27,'Czujnik temperatury zewnêtrznej ',4),
(28,28,'Dwustopniowe elektryczne wspomaganie kierownicy Dualdrive z trybem CITY ',4),
(29,29,'Dzielona i sk³adana tylna kanapa 60/40 ',4),
(30,30,'Elektrycznie sterowane szyby przednie ',4),
(31,31,'Fix&Go - zestaw do naprawy opon ze sprê¿ark¹ (wyklucza ko³o zapasowe) ',4),
(32,32,'Fotel kierowcy z regulacj¹ wysokoœci ',4),
(33,33,'Isofix',4),
(34,34,'Gniazdko 12v na konsoli centralnej',4),
(35,35,'Kierownica ze sterowaniem radioodtwarzaczem UConnect (dla 7BY)',4),
(36,36,'Klimatyzacja manualna',4),
(37,37,'Kolumna kierownicy z regulacj¹',4),
(38,38,'Sterowanie centralnym zamkiem za pomoc¹ pilota w kluczyku',4),
(39,39,'System monitorowania ciœnienia powietrza w oponach (TPMS)',4),
(40,40,'Lusterka zewnêtrzne regulowane mechanicznie',4),
(41,41,'Elektrycznie sterowane szyby tylne',4),
(42,42,'Kierownica i ga³ka zmiany biegów pokryte skór¹',4),
(43,43,'Tempomat',4),
(44,44,'Lusterka regulowane elektrycznie',4),
(45,45,'Czujniki parkowania tylne',4),
(46,46,'Klimatyzacja automatyczna jednostrefowa',4),
(47,47,'Lusterka zewnêtrzne elektrycznie sterowane i podgrzewane',4),
(48,48,'Pod³okietnik przedni',4),
(49,49,'Zderzaki w kolorze nadwozia',5),
(50,50,'Chromowane klamki zewnêtrzne',5),
(51,51,'Listwa chromowana na klapie baga¿nika',5),
(52,52,'Lusterka zewnêtrzne lakierowane w kolorze nadwozia',5),
(53,53,'Listwy boczne w kolorze nadwozia',5),
(54,54,'Œwiat³a do jazdy dziennej LED',5),
(55,55,'Klamki zewnêtrzne w kolorze nadwozia',5),
(56,56,'Listwa na klapie baga¿nika',5),
(57,57,'Listwa chromowana na przednim grillu',5),
(58,58,'Listwy chromowane pod lini¹ szyb bocznych',5),
(59,59,'Lusterka zewnêtrzne chromowane',5),
(60,60,'Brak emblematów',5),
(61,61,'Œwiat³a przeciwmgielne',5),
(62,62,'Chromowane listwy wewnêtrzne',5),
(63,63,'Reling / mocowanie baga¿nika na dachu',5),
(64,64,'Podgrzewanie lusterek zewnêtrznych',5),
(65,65,'Kolor nawdozia inny ',5),
(66,66,'Dodatkowe oœwietlenie baga¿nika',5)

SET IDENTITY_INSERT Produkt.Wyposzazenie OFF


INSERT INTO Wspolne.Miasto (MiastoId,MiastoKey,NazwaMista)
 VALUES (1,1,'Kraków'),
(2,2,'Warszawa'),
(3,3,'Skawina'),
(4,4,'Zakpoane'),
(5,5,'Oœwiêcim'),
(6,6,'Poznañ'),
(7,7,'Wroc³aw'),
(8,8,'Wieliczka'),
(9,9,'Zamoœæ'),
(10,10,'Bielsko Bia³a'),
(11,11,'Bydgoszcz'),
(12,12,'Gdañœk'),
(13,13,'Gdynia'),
(14,14,'Przemyœl'),
(15,15,'P³ock')

USE SalonSamochodowy
GO



SET IDENTITY_INSERT Hr.Zespol ON
INSERT INTO Hr.Zespol (ZespolId,ZespolKey,Nazwa)
VALUES (1,1,'Sprzedawcy'),
(2,2,'Serwis'),
(3,3,'Kadry i p³ace'),
(4,4,'Marketing'),
(5,5,'Zarz¹d')
SET IDENTITY_INSERT Hr.Zespol OFF

USE SalonSamochodowy
GO

SET IDENTITY_INSERT Hr.Stanowisko ON
INSERT INTO Hr.Stanowisko (StanowiskoId,StanowiskoKey,Nazwa)
VALUES (1,1,'M³odszy Sprzedawca'),
(2,2,'Sprzedawca'),
(3,3,'Kierownik sprezda¿y'),
(4,4,'M³odszy Mechanik'),
(5,5,'Mechanik'),
(6,6,'Kierownik serwisu'),
(7,7,'M³odszy specjalista kary i p³ace'),
(8,8,'Specjalista kadry i p³ace'),
(9,9,'Kierownik kadry i p³ace'),
(10,10,'Zastêpca kierwonika sprzeda¿y'),
(11,11,'Zastêpca kierwonika serwisu'),
(12,12,'Zastêpca kierowanika kadry i p³ace'),
(13,13,'Dyrektor'),
(14,14,'Prezes'),
(15,15,'Cz³onek zarz¹du')

SET IDENTITY_INSERT Hr.Stanowisko OFF

USE SalonSamochodowy
GO


SET IDENTITY_INSERT Hr.Pracownik ON
INSERT INTO  Hr.Pracownik (PracownikId,PracownikKey,Imie,Nazwisko,DataUrodzenia,DataZatrudnienia,PESEL,Adres,Miasto,KodPocztowy,Kraj,Telefon,StanowiskoId,ZespolId,Przelozony)
VALUES (1,1,'Jan','Jakiœ','1983-02-03','2018-01-02',83020390454,'Krakowska 12/5',14,'00-123','Polska',123459780,2,1,5),
(2,2,'Wojciech','Nijaki','1979-05-04','2018-01-02',78050466358,'Czêstochowska 5/12',12,'11-123','Polska',00223344,2,1,5),
(3,3,'Micha³','Kowalski','1999-12-01','2018-01-02',99120106750,'Za miastem 5',3,'12-123','Polska',10237711,1,1,5),
(4,4,'Grzegorz','Nowak','1975-01-03','2018-01-02',75010377558,'Grundwaldzka 22/55',7,'13-123','Polska',00245533,2,1,5),
(5,5,'Bogdan','Coœtamcoœtam','1989-02-05','2018-01-02',89020504891,'Bogdana ze Spychowa 13/12',8,'14-123','Polska',00258855,3,1,NULL),
(6,6,'Mirek','Zbirek','1991-07-01','2018-01-02',91070150038,'Muchomorka 1',15,'15-123','Polska',00260011,4,2,10),
(7,7,'Micha³','Pajac','1975-02-19','2018-01-02',75021995431,'Murowana 12',1,'01-001','Polska',00274499,5,2,10),
(8,8,'Antoni','Ma³y','1985-06-16','2018-01-02',85061626358,'Jacka Placka 1/12',9,'09-009','Polska',00283366,5,2,10),
(9,9,'Wojciech','Du¿y','1995-05-05','2018-01-02',95050537576,'Osiedle Lipa 1/12b',2,'02-002','Polska',00295555,4,2,10),
(10,10,'Czes³aw','Maruda','1978-08-07','2018-12-02',78080783959,'Co za Nuda 9/1',8,'08-008','Polska',002109977,6,2,14),
(11,11,'Anna','Nagórna','1995-07-12','2018-10-02',95071278722,'Na dole 13',5,'05-005','Polska',002117722,7,3,13),
(12,12,'Halina','Wredna','1990-10-05','2018-11-02',90100585183,'Jak Cholera 1',6,'06-006','Polska',102121155,8,3,13),
(13,13,'Bogdan','Czepialski','1989-09-05','2018-01-02',89090546519,'Byle Czego 13/12',11,'11-011','Polska',002135555,9,3,13),
(14,14,'Jan','Niewiadomo','1985-10-01','2018-01-02',85100161372,'Jak i Gdzie 1/9',2,'02-012','W³ochy',102143311,15,4,15),
(15,15,'Dawid','Nawalony','1979-08-09','2018-11-02',79080983851,'Jak Mesershmit 109',9,'09-090','W³ochy',002158899,14,5,NULL)

SET IDENTITY_INSERT Hr.Pracownik OFF

USE SalonSamochodowy
GO

SET IDENTITY_INSERT Produkt.Do ON
INSERT INTO Produkt.Do (DoId,DoKey,Seria,WydanyPrzez,WaznyDo)
VALUES
(1,1,'AA-12345','Prezydent Miasta Puck','2019-09-09'),
(2,2,'BB-12345','Prezydent Miasta Kraków','2019-09-09'),
(3,3,'CC-55555','Prezydent Miasta Kraków','2019-09-09'),
(4,4,'DD-11111','Prezydent Miasta Kraków','2020-09-09'),
(5,5,'AA-33333','Prezydent Miasta Kraków','2019-11-02'),
(6,6,'FF-8888','Prezydent Miasta Kraków','2019-12-12'),
(7,7,'GF-12345','Prezydent Miasta Kraków','2019-03-01'),
(8,8,'GG-22566','Prezydent Miasta Warszawa','2020-09-09'),
(9,9,'GG-88999','Prezydent Miasta Warszawa','2019-11-02'),
(10,10,'AA-993366','Prezydent Miasta Poznañ','2019-12-12'),
(11,11,'BB-1122335','Prezydent Miasta Poznañ','2019-03-01'),
(12,12,'CC-664455','Prezydent Miasta Wroc³aw','2019-09-09'),
(13,13,'BB-15673','Prezydent Miasta Gdañsk','2019-11-02'),
(14,14,'GD-1267','Prezydent Miasta Opole','2019-02-27'),
(15,15,'CA-12356','Prezydent Miasta Skawina','2019-12-12')

SET IDENTITY_INSERT Produkt.Do OFF


USE SalonSamochodowy
GO


SET IDENTITY_INSERT Produkt.Klient ON
INSERT INTO Produkt.Klient(KlientId,KlientKey,KlientImiePierwsze,KlientImieDrugie,KlientNazwisko,DataDodania,Telefon,EmailId,DowodOsobistyId)
VALUES (1,1,'£ukasz','Piotr','Nowak','2019-01-04',987654321,'mail@test.pl',1),
(2,2,'Marian','Roman','Antoniak','2019-01-04',123454359,'lfahdsljfa@com.pl',2),
(3,3,'Micha³','Bogdan','Kowalski','2019-02-02',645589601,'ojfaffa@gmail.com',3),
(4,4,'Wojciech','Micha³','Piotrowski','2019-01-03',456846501,'iaksikjfdapo@wp.pl',4),
(5,5,'Franciszek','Bogdan','W³akowski','2018-05-06',881351860,'sajdajias@onet.pl',5),
(6,6,'Joanna','Franciszka','Niewiadomska','2018-07-06',990775663,'osaldcoa11@com.pl',6),
(7,7,'Brygida','Ula','Umuœlna','2018-03-04',669554332,'flnalkjnd2@free.pl',7),
(8,8,'Celestyna','Joanna','Z³ótek','2019-02-02',546889011,'andsfoi1@op.pl',8),
(9,9,'Piotr','£ukasz','Piekarz','2018-10-10',554666997,'sdlknjfkosldnhjfg@gmail.com',9),
(10,10,'Roman','Marian','Jankowski','2018-11-11',443366559,'sldhjfvlk@wp.pl',10),
(11,11,'Bogdan','Micha³','Gucio','2018-12-12',554332119,'ansdnv@gmail.com',11),
(12,12,'Micha³','Wojciech','Jawor','2018-06-05',123256456,'oijgfoisnhg@waan.pl',12),
(13,13,'Tomasz','Piotr','Halny','2018-05-04',113366981,'njaaaakn22@wp.pl',13),
(14,14,'Anna','Katarzyna','Nawiana','2018-04-06',553580900,'dnvvan3bj@interia.pl',14),
(15,15,'Sebastian','Roman','Jakikolwiek','2019-02-09',223355669,'nvcn@wp.pl',15)

SET IDENTITY_INSERT Produkt.Klient OFF

USE SalonSamochodowy
GO

SET IDENTITY_INSERT Produkt.Zamownienie ON
INSERT INTO Produkt.Zamownienie (ZamownienieId,ZamownienieKey,KlientId,PracownikId,CenaSprzedazy,DataZlozenia,DataOdbioru,StatusRealizacji,StatusPlatnosci,ModelId,PakietId,RabatId)
VALUES (1,1,1,1,1,'2019-02-01','2019-03-04',0,0,1,1,1),
(2,2,2,2,1,'2019-02-01','2019-03-05',0,0,1,1,2),
(3,3,3,3,1,'2019-02-01','2019-03-06',0,0,1,1,3),
(4,4,4,4,1,'2019-02-01','2019-03-07',0,0,1,1,4),
(5,5,5,4,1,'2019-02-01','2019-03-08',0,0,1,1,4),
(6,6,6,3,1,'2019-02-01','2019-03-09',0,0,1,1,1),
(7,7,7,2,1,'2019-02-01','2019-03-10',0,0,1,1,2),
(8,8,8,1,1,'2019-02-01','2019-03-11',0,0,1,1,4),
(9,9,9,1,1,'2019-02-01','2019-03-12',0,0,1,1,4),
(10,10,10,2,1,'2019-02-01','2019-03-13',0,0,1,1,4),
(11,11,11,3,1,'2019-02-01','2019-03-14',0,0,1,1,1),
(12,12,12,4,1,'2019-02-01','2019-03-15',0,0,1,1,2),
(13,13,13,4,1,'2019-02-01','2019-03-16',0,0,1,1,1),
(14,14,14,3,1,'2019-02-01','2019-03-17',0,0,1,1,2),
(15,15,15,2,1,'2019-02-01','2019-03-18',0,0,1,1,1)

SET IDENTITY_INSERT Produkt.Zamownienie OFF

USE SalonSamochodowy
GO


SET IDENTITY_INSERT Produkt.PakietLista ON
INSERT INTO Produkt.PakietLista (PakietId,PakietKey,WyposzazenieId)
VALUES (1,1,1),
(1,2,2),
(1,3,8),
(1,4,9),
(1,5,10),
(1,6,11),
(1,7,12),
(1,8,13),
(1,9,14),
(1,10,15),
(1,11,16),
(1,12,17),
(1,13,21),
(1,14,25),
(1,15,26),
(1,16,28),
(1,17,30),
(1,18,31),
(1,19,33),
(1,20,38),
(1,21,39),
(1,22,40),
(2,1,3),
(2,1,4),
(2,1,18),
(2,1,19),
(2,1,22),
(2,1,27),
(2,1,29),
(2,1,36),
(2,1,44),
(2,1,49),
(2,1,52),
(2,1,56),
(2,1,57),
(2,1,62),
(3,3,20),
(3,3,23),
(3,3,32),
(3,3,34),
(3,3,35),
(3,3,37),
(3,3,41),
(3,3,42),
(3,3,43),
(3,3,45),
(3,3,46),
(3,3,47),
(3,3,48),
(3,3,50),
(3,3,51),
(3,3,53),
(3,3,54),
(3,3,55),
(3,3,58),
(3,3,61),
(3,3,63),
(3,3,66),
(4,4,24),
(4,4,59),
(4,4,60),
(4,4,64)




INSERT INTO Serwis.TypUslugi (TypUslugiId,TypUslugiKey,NazwaUslugi)
VALUES (1,1,'Diagnostyka samochodowa'),
(2,2,'Naprawa uk³adu hamulcowego'),
(3,3,'Naprawa uk³adu zap³onowego '),
(4,4,'Mechanika pojazdowa'),
(5,5,'Naprawa uk³adu napêdowego')


SET IDENTITY_INSERT Serwis.Uslugi ON
INSERT INTO Serwis.Uslugi (UslugiId,UslugiKey,NazwaUslugi,TypId)
VALUES(1,1,'Wymiana akumulatora ',1),
(2,2,'Analiza spalin ',1),
(3,3,'Test amortyzatorów ',1),
(4,4,'Test hamulców na p³ytach rolkowych ',1),
(5,5,'Test akumulatora ',1),
(6,6,'Ustawienie zbie¿noœci/geometrii kó³ ',1),
(7,7,'Ustawienie œwiate³ ',1),
(8,8,'Diagnostyka komputerowa ',1),
(9,9,'Kasowanie inspekcji olejowej ',1),
(10,10,'Pomiar zadymienia silnika „ZS” ',1),
(11,11,'Wymiana klocków hamulcowych przód komplet ',2),
(12,12,'Wymiana klocków hamulcowych ty³ komplet ',2),
(13,13,'Wymiana tarcz hamulcowych 2 szt. ',2),
(14,14,'Wymiana szczêk hamulcowych komplet ',2),
(15,15,'Wymiana cylinderka hamulcowego 1 szt. ',2),
(16,16,'Wymiana przewodów hamulcowych komplet ',2),
(17,17,'Wymiana pompy hamulcowej ',2),
(18,18,'Wymiana linki hamulca rêcznego ',2),
(19,19,'Regulacja hamulca rêcznego ',2),
(20,20,'Uruchomienie zacisku hamulcowego ',2),
(21,21,'Wymiana p³ynu hamulcowego ',2),
(22,22,'Regulacja zaworów silnikowych ',3),
(23,23,'Wymiana cewki zap³onowej ',3),
(24,24,'Wymiana przewodów zap³onowych ',3),
(25,25,'Wymiana œwiec zap³onowych komplet ',3),
(26,26,'Wymiana œwiec ¿arowych 1 szt. ',3),
(27,27,'Wymiana oleju z filtrem ',4),
(28,28,'Wymiana filtra powietrza ',4),
(29,29,'Wymiana filtra paliwa ',4),
(30,30,'Wymiana filtra kabinowego ',4),
(31,31,'Wymiana p³ynu hamulcowego ',4),
(32,32,'Wymiana p³ynu ch³odz¹cego ',4),
(33,33,'Wymiana oleju w man. skrzyni biegów',4),
(34,34,'Wymiana oleju w autom.skrzyni biegów',4),
(35,35,'Wymiana oleju w uk³adzie wspomagania ',4),
(36,36,'Przegl¹d okresowy ma³y (15-45-75 tys.) ',4),
(37,37,'Przegl¹d okresowy œredni (30 -90 tys.)',4),
(38,38,'Przegl¹d okresowy du¿y (60-120 tys.) ',4),
(39,39,'Wymiana reflektora ',4),
(40,40,'Uzupe³nienie czynnika klimatyzacji ',4),
(41,41,'Dezynfekcja ',4),
(42,42,'Ozonowanie uk³adu ',4),
(43,43,'Wymiana sprzêg³a ',5),
(44,44,'Wymiana rozrz¹du ',5),
(45,45,'Wymiana pompy wody ',5),
(46,46,'Wymiana paska klinowego 1 szt. ',5),
(47,47,'Wymiana uszczelki pod g³owic¹ ',5),
(48,48,'Demonta¿ silnika naprawa',5),
(49,49,'Wymiana turbosprê¿arki ',5),
(50,50,'Uszczelnienie miski olejowej ',5),
(51,51,'Wymiana termostatu ',5)

SET IDENTITY_INSERT Serwis.Uslugi OFF

USE SalonSamochodowy
GO

SET IDENTITY_INSERT Serwis.CennikUslugi ON
INSERT INTO Serwis.CennikUslugi (CennikUslugiId,CennikUslugiKey,UslugiId,DataObowOd,DataObowDo,Cena)
VALUES (1,1,1,'2018-05-05','2019-05-05',20),
(2,2,2,'2018-05-05','2019-05-05',40),
(3,3,3,'2018-05-05','2019-05-05',40),
(4,4,4,'2018-05-05','2019-05-05',50),
(5,5,5,'2018-05-05','2019-05-05',25),
(6,6,6,'2018-05-05','2019-05-05',120),
(7,7,7,'2018-05-05','2019-05-05',25),
(8,8,8,'2018-05-05','2019-05-05',120),
(9,9,9,'2018-05-05','2019-05-05',40),
(10,10,10,'2018-05-05','2019-05-05',40),
(11,11,11,'2018-05-05','2019-05-05',50),
(12,12,12,'2018-05-05','2019-05-05',70),
(13,13,13,'2018-05-05','2019-05-05',120),
(14,14,14,'2018-05-05','2019-05-05',135),
(15,15,15,'2018-05-05','2019-05-05',60),
(16,16,16,'2018-05-05','2019-05-05',320),
(17,17,17,'2018-05-05','2019-05-05',120),
(18,18,18,'2018-05-05','2019-05-05',90),
(19,19,19,'2018-05-05','2019-05-05',50),
(20,20,20,'2018-05-05','2019-05-05',50),
(21,21,21,'2018-05-05','2019-05-05',60),
(22,22,22,'2018-05-05','2019-05-05',150),
(23,23,23,'2018-05-05','2019-05-05',50),
(24,24,24,'2018-05-05','2019-05-05',40),
(25,25,25,'2018-05-05','2019-05-05',60),
(26,26,26,'2018-05-05','2019-05-05',40),
(27,27,27,'2018-05-05','2019-05-05',30),
(28,28,28,'2018-05-05','2019-05-05',20),
(29,29,29,'2018-05-05','2019-05-05',40),
(30,30,30,'2018-05-05','2019-05-05',40),
(31,31,31,'2018-05-05','2019-05-05',60),
(32,32,32,'2018-05-05','2019-05-05',60),
(33,33,33,'2018-05-05','2019-05-05',60),
(34,34,34,'2018-05-05','2019-05-05',100),
(35,35,35,'2018-05-05','2019-05-05',50),
(36,36,36,'2018-05-05','2019-05-05',150),
(37,37,37,'2018-05-05','2019-05-05',200),
(38,38,38,'2018-05-05','2019-05-05',300),
(39,39,39,'2018-05-05','2019-05-05',60),
(40,40,40,'2018-05-05','2019-05-05',80),
(41,41,41,'2018-05-05','2019-05-05',80),
(42,42,42,'2018-05-05','2019-05-05',80),
(43,43,43,'2018-05-05','2019-05-05',400),
(44,44,44,'2018-05-05','2019-05-05',250),
(45,45,45,'2018-05-05','2019-05-05',150),
(46,46,46,'2018-05-05','2019-05-05',50),
(47,47,47,'2018-05-05','2019-05-05',370),
(48,48,48,'2018-05-05','2019-05-05',1000),
(49,49,49,'2018-05-05','2019-05-05',250),
(50,50,50,'2018-05-05','2019-05-05',125),
(51,51,51,'2018-05-05','2019-05-05',50)

SET IDENTITY_INSERT Serwis.CennikUslugi OFF

USE SalonSamochodowy
GO


SET IDENTITY_INSERT Serwis.StatusyZamowienie  ON
INSERT INTO Serwis.StatusyZamowienie (StatusyZamowienieId,StatusyZamownienieKey,NazaStatusu)
VALUES (1,1,'Otwarte'),
(2,2,'W trakcie realizacji'),
(3,3,'Czeka na czêœci'),
(4,4,'Czeka na decyzjê klienta'),
(5,5,'Czeka na odbiór'),
(6,6,'Zrealizowane'),
(7,7,'Reklamacja'),
(8,8,'Reklamacja zakoñæzona')
SET IDENTITY_INSERT Serwis.StatusyZamowienie  OFF

USE SalonSamochodowy
GO


SET IDENTITY_INSERT Serwis.Zamowienie ON
INSERT INTO Serwis.Zamowienie (ZamowienieId,ZamowienieKey,StatusyZamowienieId,KlientId,PracownikId,DataZlozenia,DataZakonczenia)
VALUES
(1,1,6,9,5,'2018-02-05','2018-02-09'),
(2,2,6,5,4,'2018-03-06','2018-03-09'),
(3,3,6,12,5,'2018-04-05','2018-04-09'),
(4,4,6,5,4,'2018-05-05','2018-05-09'),
(5,5,6,8,4,'2018-06-05','2018-06-09'),
(6,6,4,6,5,'2018-07-05','2018-07-09'),
(7,7,4,7,5,'2019-01-25',NULL),
(8,8,4,11,5,'2019-02-05',NULL),
(9,9,5,2,4,'2019-02-05',NULL),
(10,10,5,14,4,'2019-02-05',NULL),
(11,11,5,6,4,'2019-02-05',NULL),
(12,12,2,12,5,'2019-02-05',NULL),
(13,13,2,8,5,'2019-02-05',NULL),
(14,14,2,4,5,'2019-02-05',NULL),
(15,15,2,14,5,'2019-02-05',NULL),
(16,16,8,8,4,'2019-02-05','2019-02-06'),
(17,17,8,14,4,'2019-02-05','2019-02-07'),
(18,18,7,12,4,'2019-02-05','2019-02-09'),
(19,19,6,2,5,'2018-09-05','2019-02-08'),
(20,20,6,1,4,'2018-09-05','2019-02-07')

SET IDENTITY_INSERT Serwis.Zamowienie OFF

USE SalonSamochodowy
GO


INSERT INTO Serwis.SzczegolyZamowienia (ZamowienieID,UslugaId)
VALUES (1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,19),
(1,27),
(1,28),
(1,29),
(1,30),
(1,38)


INSERT INTO Hr.ObecnoscId (ObecnoscId,Nazwa)
VALUES (1,'Obecny'),(2,'Urlop'),(3,'L-4'),(4,'Nieobecny')


INSERT INTO Produkt.Rabat (RabatId,WysokoscRabatu,NazwaRabatu)
VALUES (1,5.0,'Na Powitanie'),(2,12.50,'Wyprzeda¿ Rocznika'),(3,10.00,'Sta³y Klient'),(4,0.0,'Brak')

INSERT INTO Hr.GodzinowyCzasPracy (RokId,MiesiacId,LiczbaGodzinPracy,LiczbaDniPracy,LiczbaDniWolnych)
VALUES (2019,1,176,22,9),
(2019,2,160,20,8),
(2019,3,168,21,10),
(2019,4,168,21,9),
(2019,5,168,21,10),
(2019,6,152,19,11),
(2019,7,184,23,8),
(2019,8,168,21,10),
(2019,9,168,21,9),
(2019,10,184,23,8),
(2019,11,152,19,11),
(2019,12,160,20,11)




EXEC Hr.DodajKartaCzasuPracyDni 1,1,2,1,8.00,17.30
EXEC Hr.DodajKartaCzasuPracyDni 1,1,3,1,8.00,15.30
EXEC Hr.DodajKartaCzasuPracyDni 1,1,4,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,5,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,7,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,8,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,9,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,10,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,11,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,14,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,15,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,16,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,17,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,18,1,8.00,16.30
EXEC Hr.DodajKartaCzasuPracyDni 1,1,21,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,22,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,23,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,24,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,25,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,28,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,29,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,30,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 1,1,31,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,2,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,3,1,8.00,15.30
EXEC Hr.DodajKartaCzasuPracyDni 2,1,4,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,5,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,7,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,8,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,9,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,10,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,11,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,14,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,15,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,16,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,17,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,18,1,8.00,16.30
EXEC Hr.DodajKartaCzasuPracyDni 2,1,21,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,22,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,23,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,24,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,25,1,10.00,18.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,28,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,29,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,30,1,8.00,16.00
EXEC Hr.DodajKartaCzasuPracyDni 2,1,31,1,8.00,16.00


INSERT INTO Hr.DniRoboczeMiesiac (RokId,MiesiacId,DienRoboczy)
VALUES (2019,1,2),
(2019,1,3),
(2019,1,4),
(2019,1,7),
(2019,1,8),
(2019,1,9),
(2019,1,10),
(2019,1,11),
(2019,1,14),
(2019,1,15),
(2019,1,16),
(2019,1,17),
(2019,1,18),
(2019,1,21),
(2019,1,22),
(2019,1,23),
(2019,1,24),
(2019,1,25),
(2019,1,28),
(2019,1,29),
(2019,1,30),
(2019,1,31)