-- UNION

SELECT
	[City]
FROM
[Customers]

UNION --ALL

SELECT
	[City]
FROM
	[Suppliers]


/*
Exercise: Students write queries using UNION and UNION ALL.
Task: Combine lists of product names from Products and discontinued 
products.
*/