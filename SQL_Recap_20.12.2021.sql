<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="E:/IT KURS/DERSLER/SQL/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser query pragmas" current="2"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="150"/><column_width id="3" width="6053"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,9:maincustomers"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="100"/><column index="2" value="300"/><column index="3" value="90"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="clients" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="102"/><column index="2" value="115"/><column index="3" value="111"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="customers" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="131"/><column index="2" value="115"/><column index="3" value="125"/><column index="4" value="300"/><column index="5" value="300"/><column index="6" value="199"/><column index="7" value="65"/><column index="8" value="149"/><column index="9" value="123"/><column index="10" value="199"/><column index="11" value="189"/><column index="12" value="282"/><column index="13" value="156"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="genres" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="96"/><column index="2" value="172"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoice_items" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="153"/><column index="2" value="111"/><column index="3" value="91"/><column index="4" value="105"/><column index="5" value="99"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoices" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="111"/><column index="2" value="131"/><column index="3" value="195"/><column index="4" value="300"/><column index="5" value="199"/><column index="6" value="129"/><column index="7" value="156"/><column index="8" value="187"/><column index="9" value="62"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">/*  ÖDEV: Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türü (genre)
listeleyiniz.*/


SELECT t1.x, t2.y, ....
	FROM TABLO1 t1
	FULL JOIN TABLO2 t2
	ON t1.FK = t2.PK;
	 


 SELECT  t.name, g.name
 FROM tracks t 
LEFT JOIN genres g
ON  t.GenreId = g. GenreId;

 SELECT  t.name as Song_Name, g.name as Song_Genre
 FROM tracks t 
LEFT JOIN genres g
ON  t.GenreId = g. GenreId;*/

/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
	 SELECT * FROM markalar;
	 SELECT * FROM siparisler;
	 
	 SELECT m.marka_id,m.marka_adi, s.siparis_adedi, s.siparis_tarihi
	 FROM markalar m
	 JOIN siparisler s
	 ON m.marka_id = s.marka_id;
	 
 /* ÖDEV: invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
 soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
 listeleyen sorguyu yazınız */
 
	SELECT c.FirstName, c.LastName, i.InvoiceDate, i.total
	FROM invoices i
	JOIN customers c
	on i.CustomerId = c.CustomerId;
	
	
	/* ÖDEV: artists tablosunda bulunan her bir kişinin albums tablosunda 
bulunan tüm albümlerinin listeleyen sorguyu yazınız.  Sorguda ArtistId, Name, Title ve AlbumId olmalıdır */

SELECT ar.ArtistId, ar.name, al.Title, al.AlbumId
FROM artists ar
LEFT JOIN albums al
on ar.ArtistId = al.ArtistId;
 </sql><sql name="SQL_ReCAP_20.12.2021">/*===================================================
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

	</sql><sql name="SQL 3">/*===================================================
 SUBQUERIES
====================================================*/

	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */</sql><current_tab id="1"/></tab_sql></sqlb_project>
