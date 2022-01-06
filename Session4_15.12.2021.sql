/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */
	
	/*   SELECT count (*) FROM invoices;
	 SELECT count (InvoiceId) AS num_0f_invoice from tracks; */
	 
	/*  SELECT count (DISTINCT Composer) AS besteci_sayısı FROM tracks;
	 
	/* invoice tablosunda kaç adet farklı yıl olduğunu hesaplayan sorfgu? */ /* hazır fonksiyon var googlela bak. */
	
	
====================MIN / MAX=================================
/* Nümerik değerlerde çalışır. */
/* track tablosundan minimum duraton yaz*/
/* SELECT name,  min(Milliseconds) FROM tracks; */
/* SELECT name as Song_Name, min(Milliseconds)/1000.0 as Duration FROM tracks;?*/
/* select min(Grade), max(Grade) from students;*/
	
	=========================SUM / AVG =============================
	/*invoices taki faturaların toplam değerğ-ini listeleyiniz?*/
	/* select sum(total) AS Toplam_Gelir FROM invoices; */
	
	/*  ****ÖDEV:  invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam değerini listeyiniz */
	
	
/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
/* 	SELECT ROUND(AVG(Milliseconds))
	FROM tracks;
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > 393599;
	
	/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
	alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki 
	bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	
	/* SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > ( 	SELECT AVG(Milliseconds)
										FROM tracks);
	
	
	/* Select Name, Milliseconds from tracks WHERE Milliseconds > (SELECT AVG (Milliseconds) from tracks;   */
	
/*	=========================GROUP BY ============================================
	==========================================================================*/ 
	
/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
	/* select Composer, count(name) As Song_Count from tracks where Composer is NOT NULL GROUP BY  Composer; */
	
	SELECT country, count(FirstName) as num_of_cust
	FROM customers
	GROUP BY country
	ORDER BY num_of_cust DESC;
		
	
		/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	 select country, City, count(FirstName) as num_of_cust
	 FROM customers 
	 GROUP BY country, City;
	
		
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
	select BillingCountry, round(avg(total), 2) as ort_fatura
	from invoices
GROUP BY BillingCountry;


/*===================================================
                                         JOINS
====================================================
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN       :   Tablodaki tum sonuclari gosterir
--     2) INNER JOIN     :  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN        :  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN     :  Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.   (NOTT:    CROSS JOIN : diğerlerinde cross join diye bir şey yoktur. Çok  kullanmamayız)
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
 /* SELECT * FROM markalar;   */
 SELECT * FROM siparisler;
 
/*SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_adedi, siparisler.siparis_tarihi
FROM markalar
LEFT JOIN siparisler  on markalar.marka_id=siparisler.marka_id;
 
 SELECT TABLO_ADI.SUTUN_ADI, ....
 FROM TABLO1
 JOIN TABLO2
 ON TABLO.FK = TABLO2.PK ; 
 
 SELECT * FROM tracks;
  
 SELECT * FROM GENRES; */
 
SELECT t.name as Song_name, g.name as Song_genre
FROM tracks t
JOIN genres g
ON t.GenreId = g.GenreId;
 
 
 
 