-- /**************************//  AND  /  OR   / NOT   //**************************************/
--SELECT *
--//FROM employees
--WHERE job_title = 'Data Scientist' and Gender = 'Male'; // 

-----// where 1. Cond or 2. cond //


/**************************WHERE NOT**************************************/


-- SELECT * FROM employees WHERE NOT gender ='Female' ;
--select * from invoices WHERE NOT BillingCountry<> 'USA' order by total desc;

/* SELECT *
FROM invoices
WHERE BillingCountry = 'USA' or 'Germany' order by InvoiceId asc; */

/*--*SELECT * 
FROM invoices 
WHERE InvoiceDate >= '2012-01-01' AND InvoiceDate <= '2013-01-02';*/


/*********************************BETWEEN AND**************************************
SELECT * 
FROM invoices 
WHERE InvoiceDate BETWEEN '2012-01-01' AND '2013-01-02';*/

/*SELECT * 
FROM invoices 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31' 
ORDER BY InvoiceDate DESC limit 1;*/

/****************************IN****************************************

-- SELECT* FROM employees WHERE job_title in ('Data Scientist') 
--(Birden fazla OR kullanmak yerine IN kullanmak daha kısa ve kolay.


************************* NOT IN****************************************
--SELECT* FROM employees WHERE job_title NOT in ('Data Scientist') 
/*SELECT FirstName, LastName, country 
FROM customers 
WHERE country IN('Belgium', 'Norway', 'Canada', 'USA'); */

/**************************LIKE**************************************************/

/*    %     KARAKTERLERİN TAMAMINI ALIR  'Wo%' = 'Wonderful'
      _     TEK KARAKTER
    

SELECT *
FROM student_info
WHERE county LIKE 'wO%';

SELECT * 
FROM students
WHERE FİELD  LIKE '%Developer';

SELECT * 
FROM students 
WHERE FirstName LIKE 'eL_İS'; 

SELECT name 
FROM tracks 
WHERE Composer LIKE '%Bach';


SELECT *
FROM albums 
WHERE Title LIKE '%Greatest%';


SELECT *
FROM invoices 
WHERE InvoiceDate LIKE '201_-02%'; */     2010 YILINDAN 2019 yılı sonuna kadar
