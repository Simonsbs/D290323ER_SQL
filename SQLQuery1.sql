SELECT
	--[SupplierID],
	[CategoryID],
	COUNT(*) AS [Count]
FROM
	[Products]
GROUP BY
	--[SupplierID],
	[CategoryID]

/*
Using Employees table
group by the Country and City
Then add a count
And then do the same on Customers
*/