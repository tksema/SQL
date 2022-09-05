--DQL => Data Query Language =>Veri sorgulama dili
--**SELECT KOMUTU**--


create table student(
id varchar(4),
st_name varchar(30),
age int);

INSERT into student VALUES('100','Gamze Sarigul ',25);
INSERT into student VALUES('102','Merve Demir',55);
INSERT into student VALUES('103','Emre Aksoy',35);
INSERT into student VALUES('104','Fahri Can',75);

SELECT * FROM  student
--Bu komut olusturulan tablodaki tüm veriyi sorgulamak için kullanılır.Bize tablodaki tum verilri getirir.

SELECT age FROM  student
SELECT id,st_name FROM  student
--'*' ifadesi  yerine tabloda belirtilen kolon isimlerini yazarsak, sadece o kolonda olan bilgiyi getirir.Birden fazla kolon yazilabilir.

select * from  student  where age=35
--where komutundan sonra belirttigimiz ozelliklere sahip verileri getirir.
select * from  student  where age=35 and st_name='Emre Aksoy'
select * from  student  where age=35 or st_name='Merve Demir'
--Where koşul cümlesinden sonra daha fazla koşul eklemek istersek AND veya OR kullanarak birleştirebiliriz.


select * from student where age IN (55,25)
--Aynı kolondan değerleri filtreleyerek sorgu sonucunda getirmek istersek IN komutu kullanılmalıdır.

select distinct st_name from student
--tablonun bbelirlene  sutununda  kaç farklı deger olduğunu öğrenmek istersek DISTINCT komutunu kullaniriz.

SELECT * FROM student ORDER BY  st_name
-- ORDER BY komutu ile personel tablosundaki kayıtlar Adi sütununa göre sıralı olarak sonuç tablosuna aktarılır


select * from student where age BETWEEN '35' and '75';
--BETWEEN komutu ile  belirtilen sutun isminin verilen degerleri arasindaki tumm degerleri getirir.