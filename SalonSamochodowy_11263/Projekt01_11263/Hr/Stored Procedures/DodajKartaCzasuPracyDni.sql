CREATE PROCEDURE Hr.DodajKartaCzasuPracyDni
@PracownikId int,
@MiesiacId int,
@Dzien int,
@ObecnoscId int,
@Od decimal(10,2),
@Do decimal(10,2)
AS
BEGIN

DECLARE @Nadgodziny decimal(10,2)

SET @Nadgodziny = ABS((SELECT @Do-@Od))-8

INSERT INTO Hr.KartaCzasuPracyDni (PracownikId,MiesiacId,Dzien,ObecnoscId,Od,Do,Nadgodziny)
VALUES (@PracownikId,@MiesiacId,@Dzien,@ObecnoscId,@Od,@Do,@Nadgodziny)

END