/*DECLARE @param1 INT = 1;
DECLARE @Country NVARCHAR(50) = 'Germany';

SET @Country = 'Spain'

SELECT
	*
FROM
	[Customers]
WHERE
	[Country] = @Country
	*/

DECLARE @TotalIncome MONEY

SELECT
	[EmployeeID],
	IIF(SUM([UnitPrice] * [Quantity]) > 100000, 'GOOD', 'BAD')
FROM
	[Order Details]
	INNER JOIN
	[Orders]
		ON [Orders].[OrderID] = [Order Details].[OrderID]
GROUP BY
	[EmployeeID]

/*IF @TotalIncome > 100000
BEGIN
	SELECT 'Good Employee'
END
ELSE
BEGIN
	SELECT 'Bad Employee'
END
*/