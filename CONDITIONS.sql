/*DECLARE @Value INT = 2;
DECLARE @Country NVARCHAR(50);

IF @Value > 1
BEGIN
	SET @Country = 'Spain'
END
ELSE
BEGIN
	SET @Country = 'Germany'
END

SELECT
	*
FROM
	[Customers]
WHERE
	[Country] = @Country
*/
/*
DECLARE @Value INT = 10;

IF @Value > 5
BEGIN
	IF @Value = 10
	BEGIN
		PRINT 'Value is Ten'
	END
	ELSE
	BEGIN
		PRINT 'Value is bigger than 5 and not ten'
	END
END
ELSE
BEGIN
	IF @Value < 2
	BEGIN
		PRINT 'Value less than two'
	END
	ELSE
	BEGIN
		PRINT 'Value is less than 5 and bigger than 2'
	END
END*/

/*
SELECT
	[ProductID],
	[ProductName],
	[UnitPrice],
	CASE
		WHEN [UnitPrice] < 10 THEN 'Cheap'
		WHEN [UnitPrice] BETWEEN 10 AND 20 THEN 'Average'
		ELSE 'Expensive'
	END
FROM
	[Products]
*/

/*
SELECT
	SUM(CASE WHEN [Freight] < 50 THEN 1 ELSE 0 END) AS [Low],
	SUM(CASE WHEN [Freight] BETWEEN 50 AND 100 THEN 1 ELSE 0 END) AS [Mid],
	SUM(CASE WHEN [Freight] > 100 THEN 1 ELSE 0 END) AS [High]
FROM
	[Orders]
*/

DECLARE @Max money = 10;


SELECT
	[OrderID],
	[Freight]
FROM
	[Orders]
WHERE
	/*CASE
		WHEN @Max > 50 THEN
			CASE WHEN [Freight] > @Max THEN 1 ELSE 0 END
		ELSE
			CASE WHEN [Freight] <= @Max THEN 1 ELSE 0 END
	END = 1*/

	CASE 
		WHEN [Freight] > @Max THEN 1 
		ELSE 0 
	END = 1