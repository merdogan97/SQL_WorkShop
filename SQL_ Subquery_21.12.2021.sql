/*===================================================
 SUBQUERIES
====================================================*/

	/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
	tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
	Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */
	/*SELECT * FROM albums;*/
	
*******	subquery: **************
	
	SELECT TrackId, name, AlbumId
	FROM tracks
	WHERE AlbumId = (SELECT AlbumId
								FROM albums
								WHERE Title = 'Faceless');
								
***********  join: ******************
  
  SELECT t.TrackId, t.name, t.AlbumId
  FROM tracks t
  JOIN albums a
  on t.AlbumId = a.AlbumId
  WHERE a.Title = 'Faceless';
    
	veya
SELECT t.TrackId, t.name, t.AlbumId
  FROM tracks t
  JOIN albums a
  on t.AlbumId = a.AlbumId AND a.Title = 'Faceless';

  /* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
	albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
	SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. 
	
	SELECT TrackId, name, AlbumId
	FROM tracks
	WHERE AlbumId in  (SELECT AlbumId
								FROM albums
								WHERE Title = 'Faceless' or Title= 'LetThere Be Rock');  
								
								veya */
								
	SELECT TrackId, name, AlbumId
	FROM tracks
	WHERE AlbumId in  (SELECT AlbumId
								FROM albums
								WHERE Title in ('Faceless' , 'LetThere Be Rock'));  