--USE [NW2];
/*
CREATE VIEW GermanCustomers AS
	SELECT
		*
	FROM
		[Customers]
	WHERE
		[Country] = 'Germany';
*/
/*
ALTER VIEW GermanCustomers AS
	SELECT
		[CustomerID],
		[CompanyName],
		[City]
	FROM
		[Customers]
	WHERE
		[Country] = 'Germany';
*/

/*

Create a VIEW to list products with their categories 
and another

VIEW to show order details with 
product names and unit prices.

*/


/*
ALTER VIEW [ProductWithCategories] AS
	SELECT
		[P].[ProductID],
		[P].[ProductName],
		[C].[CategoryName]
	FROM
		[Products] AS [P]
		INNER JOIN
		[Categories] AS [C]
			ON [P].[CategoryID] = [C].[CategoryID]
*/

SELECT * FROM [ProductWithCategories]