
/*
Exercise: Students write queries using INNER JOIN, 
LEFT JOIN, RIGHT JOIN, and FULL JOIN.
Task: Find products and their corresponding supplier names (use INNER JOIN), 
list all products and their supplier names (use LEFT JOIN), 
and list all suppliers and their products (use RIGHT JOIN).

*/

USE [NW2]

SELECT
	[p].[ProductName],
	[s].[CompanyName]
FROM
	[Products] AS [p]
	INNER JOIN
	[Suppliers] AS [s]
		ON [p].[SupplierID] = [s].[SupplierID]


SELECT
	[p].[ProductName],
	[s].[CompanyName]
FROM
	[Products] AS [p]
	LEFT JOIN
	[Suppliers] AS [s]
		ON [p].[SupplierID] = [s].[SupplierID]

SELECT
	[p].[ProductName],
	[s].[CompanyName]
FROM
	[Products] AS [p]
	RIGHT JOIN
	[Suppliers] AS [s]
		ON [p].[SupplierID] = [s].[SupplierID]

SELECT
	[p].[ProductName],
	[s].[CompanyName]
FROM
	[Products] AS [p]
	FULL JOIN
	[Suppliers] AS [s]
		ON [p].[SupplierID] = [s].[SupplierID]