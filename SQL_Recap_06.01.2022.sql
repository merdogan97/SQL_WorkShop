SELECT count (LastName) FROM customers;

SELECT count (FirstName) FROM customers;

SELECT count (City= "London") FROM customers;

SELECT count (city) FROM customers WHERE country = "Brazil";

SELECT count (city) FROM customers WHERE country = "USA";

SELECT min (total) FROM invoices;

SELECT max (total) FROM invoices;

SELECT max (total) FROM invoices WHERE BillingCountry = 'USA';

SELECT min (total), BillingAddress FROM invoices WHERE BillingCountry = 'USA';

SELECT min (total) as "en kucuk fiyat" FROM invoices WHERE BillingCountry = 'USA';

SELECT sum(total) as "toplam tutar" from invoices where BillingCountry = 'USA';

SELECT AVG (total) as "toplam tutar" from invoices where BillingCountry = 'USA';