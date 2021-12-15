SELECT * FROM invoices WHERE BillingCity='Paris' LIMIT 5;
SELECT  BillingState, BillingAddress, BillingCity  
FROM invoices 
where BillingCountry= 'USA' 
LIMIT 10;

SELECT InvoiceId, InvoiceDate, total FROM invoices WHERE total > 10 LIMIT 4;
SELECT * FROM employees ORDER BY FirstName ASC;
SELECT FirstName, LastName, BirthDate, HireDate FROM employees ORDER BY HireDate ASC;
SELECT * FROM invoices WHERE total>10 ORDER BY total ASC;
SELECT * FROM invoices where total>10 ORDER BY InvoiceDate DESC LIMIT 10; 
SELECT * FROM customers WHERE country = 'USA' or 'Canada' ORDER BY CustomerId LIMIT 10;
SELECT * FROM invoices WHERE BillingCountry= 'USA' OR BillingCountry= 'Germany' ORDER BY InvoiceId;
SELECT * FROM invoices WHERE InvoiceDate >= '2012-01-01 00:00:00' AND InvoiceDate <= '2012-01-03' ;