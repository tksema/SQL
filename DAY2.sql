
-Personel isminde bir tablo olusturalim
CREATE TABLE personel(
presonel_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--varolan personel tablosundan pers_id,sehir,adres fieldlarina sahip personel_adres
--adinda yeni bir tablo olusturulim
CREATE TABLE personel_adres
AS
SELECT presonel_id, sehir, adres FROM personel;

--DML-->Data Manupulation Lang.
--INSERT -UPDATE -DELETE
--TAbloya veri ekleme ,tablodan veri guncelleme ve silme islemlerinde kullanilan komutlar
--INSERT
create table student(
id varchar(4),
st_name varchar(30),
age int);
INSERT into student VALUES('1001','Ali Can',25);
INSERT into student VALUES('1002','VELI Can',45);
INSERT into student VALUES('1003','AYSE Can',35);
INSERT into student VALUES('1004','DERYA Can',55);

--TABLOYA PARCALI VERI EKLEME
INSERT into student(st_name,age) values ('murat can',65)

--DQL-->data query Lang
--select
SELECT * from student;
--Sadece isimleri getirmek icin
select st_name from student;

--select komutu where kosulu
select * from student where age>35;

--TCL -TransactionControl Lang.
--Begin - Savepoint -rollback-commit
--Transaction veritabani sistemlerinde bir islem basladiginda baslar ve islem bitince sona erer
--Bu islemler veri tabani olusturma ,veri silme,veri guncelleme,veriyi geri getirmegibi islemleri olabilir

CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);
Begin;
insert into ogrenciler2 VALUES(default,'Ali Can','Hasan',75.5);
insert into ogrenciler2 VALUES(default,'Canan Gul','Hakki',90.5);
SAVEPOINT x;
insert into ogrenciler2 VALUES(default,'kemal han','ahmet',85.5);
insert into ogrenciler2 VALUES(default,'ahmet tan','mustafa',65.5);

ROLLBACK TO x;

select * from ogrenciler2

commit;
--transaction kullaniminda serial data turu kullanmi tavsiye edilmez.
--savepointten sonra ekledigimiz veride sayac mantigi  ile calistigi icin
--sayacta en son hangi sayida kaldiysa oradan  devam eder.
--NOT: PostgreSQL de transaction kullanimi icin 'Begin ' komutuyla baslariz sonrasinda tekrar yanlis bir veriyi
--duzeltmek veya bizim icin onemli olan verilerden sonra ekleme yapabilmek icin 'SAVEPOINT savepointadi'
--kullaniriz ve bu savepointte donebilmek icin 'ROLLBACK TO savepointadi'
--komutun kullaniriz ve rollback calistirildiginda savepoint yazdigimiz satirin ustundeki verileri tabloda bize verir
--ve son olarak transcationu sonlandirmak icin 'commit' komutunu kullaniriz.MySQL de transaction olmadanda kullanilir.

--DML -DELETE -
--DELETE FROM tablo_adi --> tablonun tum icerigini siler.
--Veriyi secerek silmek icin WHERE kosulu kullanilir
--DELETE FROM tablo_adi WHERE sutun_Adi=veri--> tablodaki istedigimiz veriyi siler.

CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select *from ogrenciler;

--soru : id si 124 olan ogrenciyi silinzi

DELETE from ogrenciler where id=124;

--ismi kemal yasa olan satiri siliniz
DELETE FROM ogrenciler where isim='Kemal Yasa'

--ismi nesibe yilmaz veya mustafa bak olan kayitlari silelim
DELETE FROM ogrenciler WHERE isim='Nesibe Yilmaz' or isim='Mustafa Bak'

--soru: ismi Alican ve id'si 123 olan kaydi sil
DELETE FROM ogrenciler WHERE isim='Ali CAN ' or id 123;

--Tablodaki tum  verileri silelim
DELETE FROM ogrenciler

--delete -truncate
--TRUNCATE komutu delete komutu gibi bir tablodaki verilerin tamamini siler ancak secmeli silme yapamaz?
 select * from ogrenciler;
 TRUNCATE table ogrenciler

 --DDL -Data DEfinition lang.
 --Create -alter -drop
 --alter table --
 --alter table tabloda ADD,TYPE,SET,RENAME veyaDROP COLUMNS islemleri icin kullanilir
 --personel tablosuna cinsiyet varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
 alter table personel add cinsiyet VARCHAR(20), add yas int;

 SELECT * from personel;

 --personel tablosundan sirker fieldini siliniz
 alter table personel drop column sirket;

 --personel tablosunnda sehir sutunun adini ulke olarak degistirin
 alter table personel RENAME column sehir to ulke;

 --personel tablosunun adini  isciler olarak degistirin
 alter table personel rename to isciler;
 select * from isciler;
 alter table isciler rename to personel;


 --DDL-DROP komutu
 DROP TABLE isciler;

 --CONSTRANINT --Kisitlamalar
 --Primary key--> bir sutunun null icermemesini ve sutundak verilern unique olmasini saglar.(NOT NULL-UNIQUE)
 --Foreign Key-> Baska bir tablodak primary keyi refrans gostermek icin kullanilir.
 --boylelikle tablolar arasinda iliski kurmus oluruz.
 --UNIQIE-->bir sutundaki tum degerlrin benzersiz olmasini saglar
 --NOT NULL--> bir sutunun null icermemesini yani bos olmamasini saglar.Not null kisitlamasi icin CONSTRAINT ismi tanimlanmaz.Bu kisitlama
 --veri turunden hemen sonra yerlestirilir.
 --CHECK--> bir sutuna yerlestirilebilecek deger araligini sinirlamak icin kullanilir.

 CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);


 INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Mehmet Yilmaz', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mehmet Yilmaz', 5000, '2018-04-14');//uniqe
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--not null
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');//--unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--not null
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key


select *from calisanlar
delete from calisanlar;

--FOREIGN KEY--
create table adresler(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),
sehir varchar(20)
);
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;

select * from calisanlar;

insert into adresler values('10012','Aga sok','30.cad','antep');
--parent tabloda olmayan id ile childi tabloya ekleme yapamayiz

insert into adresler values(NULL,'aga sokak','30.cad','antep');

--calisanlar id adresler tablosundaki adres_id ile eslesenlere bakmak icin

select * from calisanlar, adresler where calisanlar.id=adresler.adres_id;

drop table calisanlar;
--parent tabloyu yani primary ke olan tabloyu silmek istedgimizde tabloyu silmez
--once child tabloyu silmemeiz gerekir.



