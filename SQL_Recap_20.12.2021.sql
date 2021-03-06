<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="E:/IT KURS/DERSLER/SQL/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser query pragmas" current="2"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="150"/><column_width id="3" width="6053"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,9:maincustomers"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="100"/><column index="2" value="300"/><column index="3" value="90"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="clients" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="102"/><column index="2" value="115"/><column index="3" value="111"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="customers" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="131"/><column index="2" value="115"/><column index="3" value="125"/><column index="4" value="300"/><column index="5" value="300"/><column index="6" value="199"/><column index="7" value="65"/><column index="8" value="149"/><column index="9" value="123"/><column index="10" value="199"/><column index="11" value="189"/><column index="12" value="282"/><column index="13" value="156"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="genres" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="96"/><column index="2" value="172"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoice_items" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="153"/><column index="2" value="111"/><column index="3" value="91"/><column index="4" value="105"/><column index="5" value="99"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="invoices" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="111"/><column index="2" value="131"/><column index="3" value="195"/><column index="4" value="300"/><column index="5" value="199"/><column index="6" value="129"/><column index="7" value="156"/><column index="8" value="187"/><column index="9" value="62"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">/*  ??DEV: Chinook veritaban??ndaki tracks tablosunda bulunan her bir ??ark??n??n t??r?? (genre)
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

/* araclar.db ad??ndaki veritaban??n?? kullanarak Markalar ve Siparisler tablolar??ndaki 
 marka_id'si ayni olan kay??tlar??n marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
	 SELECT * FROM markalar;
	 SELECT * FROM siparisler;
	 
	 SELECT m.marka_id,m.marka_adi, s.siparis_adedi, s.siparis_tarihi
	 FROM markalar m
	 JOIN siparisler s
	 ON m.marka_id = s.marka_id;
	 
 /* ??DEV: invoice tablosundaki faturalar??n her birinin m????teri ad??n?? (FirstName),
 soyad??n?? (lastName), fatura tarihi (InvoiceDate) ve fatura mebla????n?? (total) 
 listeleyen sorguyu yaz??n??z */
 
	SELECT c.FirstName, c.LastName, i.InvoiceDate, i.total
	FROM invoices i
	JOIN customers c
	on i.CustomerId = c.CustomerId;
	
	
	/* ??DEV: artists tablosunda bulunan her bir ki??inin albums tablosunda 
bulunan t??m alb??mlerinin listeleyen sorguyu yaz??n??z.  Sorguda ArtistId, Name, Title ve AlbumId olmal??d??r */

SELECT ar.ArtistId, ar.name, al.Title, al.AlbumId
FROM artists ar
LEFT JOIN albums al
on ar.ArtistId = al.ArtistId;
 </sql><sql name="SQL_ReCAP_20.12.2021">/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda ka?? adet fatura bulundu??unu d??nd??ren sorgu yaz??n??z */
	SELECT COUNT(*)
	FROM invoices;
	
	SELECT COUNT(InvoiceId) AS num_of_invoice
	FROM invoices;
		
	/* tracks tablosunda ka?? adet farkl?? Composer bulundu??unu d??nd??ren sorguyu yaz??n??z*/
	SELECT COUNT(DISTINCT Composer) AS besteci_sayisi
	FROM tracks;
	
	/* ??DEV: invoices tablosunda ka?? adet farkl?? y??l oldu??unu hesaplayan sorguyu yaz??n??z*/ 
	
	
	-- MIN,MAX
	-------------------------------------------------------------------------------------------------	
	/* tracks tablosundaki ??ark?? s??resi en k??sa olan ??ark??n??n ad??n?? ve s??resi listeleyen
	sorguyu yaziniz */
	
	SELECT name as Song_Name, min(Milliseconds)/1000.0 as Duration
	FROM tracks;
	
	/*students tablosundaki en d??????k ve en y??ksek notu listeleyen sorguyu yaz??n??z */
	SELECT MIN(Grade), MAX(Grade)
	FROM students;
	
	-- SUM,AVG
	-------------------------------------------------------------------------------------------------	
	/* invoices  tablosundaki faturalar??n toplam de??erini listeyiniz */
	
	SELECT SUM(total) AS Toplam_Gelir
	FROM invoices;
	
	/* ??DEV: invoices  tablosunda 2009 ile 2013(TAMAMI DAH??L) tarihileri aras??ndaki faturalar??n toplam
	de??erini listeyiniz */
	
	/* invoices  tablosundaki faturalar??n ortalama de??erini listeyiniz */
	SELECT ROUND(AVG(total),2) as ortalama_gelir
	FROM invoices;
	
	/* tracks tablosundaki ??ark??lar??n ortalama s??resinden daha uzun olan 
	??ark??lar??n adlar??n?? listeleyiniz */
	SELECT ROUND(AVG(Milliseconds))
	FROM tracks;
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds &gt; 393599;
	
	/*Bu y??ntem hard-coded oldu??u i??in ??ok mant??kl?? bir ????z??m de??il. 
	alt-sorgu(sub-query) ile daha do??ru bir yakla????m olacakt??r sonraki 
	b??l??mlerde alt-sorguyu ayr??nt??l?? bir ??ekilde inceleyece??iz.*/
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds &gt; (SELECT AVG(Milliseconds) FROM tracks);
					
/*===================================================
 GROUP BY
====================================================*/

	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam ??ark?? say??s??n?? 
	Besteci ad??na g??re grupland??rarak listeleyen sorguyu yaz??n??z. */
	
	SELECT Composer, COUNT(name) AS Song_Count
	FROM tracks
	WHERE Composer IS NOT NULL
	GROUP BY Composer;
	
	/* customers tablosundaki m????terilerin say??lar??n?? ??lkelerine (Country) g??re grupland??rarak 
	ve m????teri say??s??na g??re AZALAN ??ekilde s??ralayarak listeleyen sorguyu yaz??n??z*/
	SELECT country, COUNT(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country
	ORDER BY nu_of_cust DESC;
	
	/* customers tablosundaki m????terilerin say??lar??n?? ??lkelerine (Country) ve ??ehirlerine (City) 
	g??re grupland??rarak listeleyen sorguyu yaz??n??z*/
	SELECT country, City, COUNT(FirstName) as nu_of_cust
	FROM customers
	GROUP BY country, City;
		
 	/* invoices tablosundaki her bir ??lkenin (BillingCountry) fatura ortalamalar??n?? 
	hesaplayan ve ??lke bilgileri ile listeleyen sorguyu yaz??n??z.*/
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
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. ??unku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en ??ok kullan??lan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN ????lemlerini desteklemektedir.
  /*===================================================*/   

  /* araclar.db ad??ndaki veritaban??n?? kullanarak Markalar ve Siparisler tablolar??ndaki 
 marka_id'si ayni olan kay??tlar??n marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
	 SELECT * FROM markalar;
	 SELECT * FROM siparisler;
	 
	 SELECT m.marka_id,m.marka_adi, s.siparis_adedi, s.siparis_tarihi
	 FROM markalar m
	 JOIN siparisler s
	 ON m.marka_id = s.marka_id;
 
 /* ??DEV: Chinook veritaban??ndaki tracks tablosunda bulunan her bir ??ark??n??n t??r?? (genre)
listeleyiniz.*/
	
	SELECT * FROM tracks;
	SELECT * FROM genres;
	
	SELECT t.name as Song_Name, g.name as Song_Genre
	FROM tracks t
	LEFT JOIN genres g
	ON t.GenreId = g.GenreId;

 /* ??DEV: invoice tablosundaki faturalar??n her birinin m????teri ad??n?? (FirstName),
 soyad??n?? (lastName), fatura tarihi (InvoiceDate) ve fatura mebla????n?? (total) 
 listeleyen sorguyu yaz??n??z */
 
	SELECT * FROM invoices;
	SELECT * FROM customers;
	
	SELECT c.FirstName,c.LastName, i.InvoiceDate, i.total
	FROM invoices i
	JOIN customers c
	ON i.CustomerId = c.CustomerId;
	
/* ??DEV: artists tablosunda bulunan her bir ki??inin albums tablosunda 
bulunan t??m alb??mlerinin listeleyen sorguyu yaz??n??z. 
Sorguda ArtistId, Name, Title ve AlbumId olmal??d??r */

	</sql><sql name="SQL 3">/*===================================================
 SUBQUERIES
====================================================*/

	/* albums tablosundaki Title sutunu 'Faceless' olan kayd??n albumid'si elde ederek 
	tracks tablosunda bu de??ere e??it olan kay??tlar??n bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmal??d??r. */</sql><current_tab id="1"/></tab_sql></sqlb_project>
