SELECT
	*
FROM
	[Products]
ORDER BY
	[CategoryID]

SELECT
	[CategoryID],
	COUNT(*) AS [Count],
	SUM([UnitPrice]) AS [Sum],
	AVG([UnitPrice]) AS [Avg],
	MIN([UnitPrice]) AS [Min],
	MAX([UnitPrice]) AS [Max]
FROM
	[Products]
GROUP BY
	[CategoryID]
HAVING
	AVG([UnitPrice]) > 30
ORDER BY
	SUM([UnitPrice])


/*
	Using the products table
	group the products by category
	Add all 5 aggregate functions to the UnitPrice Column
	Filter the results to display only those that have a Avg of 30 or above
*/