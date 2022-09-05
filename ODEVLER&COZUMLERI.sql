-- 1) Her iki tablodaki ortak id’leri ve personel6 tablosunda bu id’ye sahip isimleri
-- isme gore sirali olarak listeleyen query yaziniz
select id,isim from personel6 where exists(select id from isciler where isciler.id=personel6.id) order by isim
-- 2) Personel6 tablosunda kac tane kayit oldugunu gosteren query yazin
select count(*) from personel6
-- 3)Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select * from isciler order by maas desc limit 1
-- 4) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select maas from isciler order by maas desc limit 1 offset 1
select max(maas) as En_Yuksek_Ikinci_Maas from isciler where maas<(select max(maas) from isciler)
 --5) Isciler tablosunda ikinci en yuksek maasi alan kisinin tum bilgilerini listeleyen sorgu yaziniz
select * from isciler order by maas desc limit 1 offset 1