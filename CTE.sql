-- Common Table Expression (CTE)

WITH [CustomerCTE] AS (
	SELECT
		[CustomerID],
		[CompanyName],
		[Country],
		CASE WHEN [Country] = 'Germany' THEN 1 ELSE 0 END AS [IsGerman]
	FROM
		[Customers]
)
SELECT
	[IsGerman],
	COUNT(*)
FROM
	[CustomerCTE]
GROUP BY
	[IsGerman]