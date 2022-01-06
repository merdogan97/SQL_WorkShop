<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="" readonly="0" foreign_keys="" case_sensitive_like="" temp_store="" wal_autocheckpoint="" synchronous=""/><attached/><window><main_tabs open="structure browser query pragmas" current="2"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="150"/><column_width id="3" width="1450"/><column_width id="4" width="0"/></tab_structure><tab_browse><current_table name="0,0:"/><default_encoding codec=""/><browse_table_settings/></tab_browse><tab_sql><sql name="Session5_21.12.2021.sql">/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */
	SELECT COUNT(*)
	FROM invoices;
	
	SELECT COUNT(InvoiceId) AS num_of_invoice
	FROM invoices;
		
	/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
	SELECT COUNT(DISTINCT Composer) AS besteci_sayisi
	FROM tracks;
	
	/* ÖDEV: invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 
	
	
	-- MIN,MAX
	-------------------------------------------------------------------------------------------------	
	/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
	sorguyu yaziniz */
	
	SELECT name as Song_Name, min(Milliseconds)/1000.0 as Duration
	FROM tracks;
	
	/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */
	SELECT MIN(Grade), MAX(Grade)
	FROM students;
	
	-- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
	
	SELECT SUM(total) AS Toplam_Gelir
	FROM invoices;
	
	/* ÖDEV: invoices  tablosunda 2009 ile 2013(TAMAMI DAHİL) tarihileri arasındaki faturaların toplam
	değerini listeyiniz */
	
	/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */
	SELECT ROUND(AVG(total),2) as ortalama_gelir
	FROM invoices;
	
	/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	SELECT ROUND(AVG(Milliseconds))
	FROM tracks;
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds &gt; 393599;
	
	/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
	alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki 
	bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds &gt; (SELECT AVG(Milliseconds) FROM tracks);
					
/*===================================================
 GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
	SELECT Composer, COUNT(name) AS Song_Count
	FROM tracks
	WHERE Composer IS NOT NULL
	GROUP BY Composer;
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	SELECT country, COUNT(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country
	ORDER BY nu_of_cust DESC;
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
	SELECT country, City, COUNT(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country, City;
		
 	/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
	SELECT BillingCountry, ROUND(AVG(total)) as ort_fatura
	FROM invoices
	WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 23:59:59'
	GROUP BY BillingCountry;
		
/*===================================================
 JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
  /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
	 SELECT * FROM markalar;
	 SELECT * FROM siparisler;
	 
	 SELECT m.marka_id,m.marka_adi, s.siparis_adedi, s.siparis_tarihi
	 FROM markalar m
	 JOIN siparisler s
	 ON m.marka_id = s.marka_id;
 
 /* ÖDEV: Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz.*/
	
	SELECT * FROM tracks;
	SELECT * FROM genres;
	
	SELECT t.name as Song_Name, g.name as Song_Genre
	FROM tracks t
	LEFT JOIN genres g
	ON t.GenreId = g.GenreId;

 /* ÖDEV: invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 
	SELECT * FROM invoices;
	SELECT * FROM customers;
	
	SELECT c.FirstName,c.LastName, i.InvoiceDate, i.total
	FROM invoices i
	JOIN customers c
	ON i.CustomerId = c.CustomerId;
	
/* ÖDEV: artists tablosunda bulunan her bir kişinin albums tablosunda 
bulunan tüm albümlerinin listeleyen sorguyu yazınız. 
Sorguda ArtistId, Name, Title ve AlbumId olmalıdır */
</sql><sql name="Session6_21.12.2021.sql">/*===================================================
 SUBQUERIES
====================================================*/

	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */
	
	SELECT * from albums;
	
	SELECT TrackId,name,AlbumId
	FROM tracks
	WHERE AlbumId = (SELECT AlbumId
								FROM albums
								WHERE Title = 'Faceless');
	
	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini JOIN kullanarak listeyiniz.
	Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */	
	
	SELECT t.TrackId, t.name, t.AlbumId
	FROM tracks t
	JOIN albums a
	ON t.AlbumId = a.AlbumId
	WHERE a.Title = 'Faceless';</sql><sql name="SQL 3">/*------------------------------------------------------------------------------------------
	/*  CREATE TABLE
	/*------------------------------------------------------------------------------------------
	
	/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
	age(INT) ve hire_date (Date) sutunuları bulunmalıdır.*/
	
	CREATE TABLE personel (
		first_name VARCHAR(20),
		last_name TEXT,
		age INT,
		hire_date DATE
	);
	
	</sql><current_tab id="2"/></tab_sql></sqlb_project>