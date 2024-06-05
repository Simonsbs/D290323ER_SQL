SELECT
	[Country],
	[City],
	COUNT(*)
FROM
	[Employees]
GROUP BY
	[Country],
	[City]


SELECT
	[Country],
	[City],
	COUNT(*)
FROM
	[Customers]
WHERE
	[Country] = 'USA'
GROUP BY
	[Country],
	[City]
HAVING
	COUNT(*) > 1

/*
	Group the Customer by Country and City and add a count column
	Then filter the countries only to the USA
	And countries that have atleast 3 customers
*/

