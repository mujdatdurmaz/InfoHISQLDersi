--DML (DATA MANUPILATION LANGUAGE)
--SELECT   SE�ME
--INSERT   EKLEME
--UPDATE   DE���T�RME
--DELETE   S�LME

USE InfoTechHIDB

SELECT * FROM Musteriler 

SELECT ad,soyad,gelir FROM Musteriler 

SELECT * FROM Musteriler
WHERE sehir='Bursa'


SELECT ad,soyad,cinsiyet,sehir FROM Musteriler
WHERE sehir='Ankara'


--puan� 50 den b�y�k olan erkek m��teriler kimler ?
SELECT * FROM Musteriler
WHERE puan>50 AND cinsiyet='ERKEK'


--alias
SELECT ad AS ADI, soyad AS SOYADI FROM Musteriler

--Bursa ve ankarada ya�ayan m��teriler

SELECT * FROM Musteriler
WHERE sehir='Bursa' OR sehir='Ankara'

SELECT * FROM Musteriler
WHERE sehir IN ('Bursa','Ankara')


--PUANI 30 �LE 55 ARASI OLANLAR
SELECT * FROM Musteriler
WHERE puan>=30 AND puan<=55


SELECT * FROM Musteriler
WHERE puan BETWEEN 30 AND 55

--geliri 20000 ile 30000 aras� olan 
--ve puan� 50 den k���k olan erkek musteriler
--ad�, soyad�, geliri,puan, cinsiyet

SELECT ad,
soyad,
gelir,
puan,
cinsiyet
FROM Musteriler
WHERE gelir BETWEEN 20000 AND 30000
AND puan<50 AND cinsiyet='Erkek'



SELECT * FROM Musteriler
WHERE ad LIKE '______'

--SOYADI Z ile biten
--maa�� 10000 ile 50000 aras� olan
--Kad�n m��teriler

SELECT * FROM Musteriler
WHERE soyad LIKE '%Z' AND gelir 
BETWEEN 10000 AND 60000
AND cinsiyet ='Kad�n'



SELECT * FROM Musteriler
ORDER BY gelir desc

--order by s�ralama
--asc k���kten b�y��e a-z
--desc b�y�kten k���ge z-a

SELECT * FROM Musteriler
ORDER BY ad

SELECT * FROM Musteriler
ORDER BY puan desc


--INSERT

INSERT INTO Musteriler(musteriNo,ad,soyad,
dTarih,sehir,cinsiyet,puan,meslek,gelir
)
VALUES(5,'Haydar','D�men','01-01-1940','Adana'
,'Erkek',77,'Doktor',78000
)
,(5,'Haydar','D�men','01-01-1940','Adana'
,'Erkek',77,'Doktor',78000
),
(5,'Haydar','D�men','01-01-1940','Adana'
,'Erkek',77,'Doktor',78000
)

UPDATE Musteriler SET puan=99
WHERE musteriNo=1

--sehri ankara olanlar�n puan� 50 olsun
UPDATE Musteriler SET puan=50
WHERE sehir='Adana'


--Adana olanlar burdur olsun
UPDATE Musteriler Set sehir='Adana', puan=70
WHERE sehir='Burdur'



SELECT TOP  1 * FROM Musteriler
ORDER BY gelir desc


--DELETE

DELETE FROM Musteriler
WHERE ad='Haydar'

SELECT SUM(gelir) FROM Musteriler
SELECT MAX(gelir) FROM Musteriler
SELECT MIN(gelir) FROM Musteriler
SELECT AVG(gelir) FROM Musteriler
SELECT COUNT(*) FROM Musteriler

SELECT * FROM Musteriler

--MAA�I ORTALAMA MAA�TAN B�Y�K OLANLAR

SELECT * FROM Musteriler
WHERE gelir>=(SELECT AVG(gelir) FROM Musteriler)

UPDATE Musteriler SET gelir=25000
WHERE musteriNo=1

UPDATE Musteriler SET gelir=70000
WHERE musteriNo=2

SELECT gelir FROM Musteriler
where musteriNo=3



UPDATE Musteriler SET gelir=
(SELECT gelir FROM Musteriler
where musteriNo=3)
WHERE musteriNo IN (3,4)


SELECT cinsiyet,COUNT(cinsiyet)as [Ki�i Say�s�] FROM Musteriler
GROUP BY cinsiyet

SELECT sehir,COUNT(sehir)as [Ki�i Say�s�] FROM Musteriler
GROUP BY sehir