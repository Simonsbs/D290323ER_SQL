/*ALTER FUNCTION GetTotalSales (
	@EmployeeID INT
)RETURNS MONEY
AS
BEGIN
	DECLARE @Result MONEY;

	SELECT
		@Result = SUM([Freight])
	FROM
		[Orders]
	WHERE
		[EmployeeID] = @EmployeeID

	RETURN @Result;
END

GO

SELECT
	[EmployeeID],
	dbo.GetTotalSales([EmployeeID]) AS [TotalSales],
	[FirstName] + ' '+ [LastName] AS [Name]
FROM
	[Employees]

	*/
/*

Create a function to calculate the total order value 
amount including a discount in a specific category

*/

/*
ALTER FUNCTION GetTotalOrderValueByCategory(
	@CategoryID INT
) RETURNS MONEY
AS
BEGIN

	DECLARE @Result MONEY

	SELECT
		@Result = SUM(([OD].[UnitPrice] * [OD].[Quantity]) * (1 - [OD].[Discount])) 
	FROM
		[Order Details] AS [OD]
		INNER JOIN
		[Products] AS [P]
			ON [OD].[ProductID] = [P].[ProductID]
	WHERE
		[P].[CategoryID] = @CategoryID

	RETURN @Result

END

GO

SELECT
	dbo.GetTotalOrderValueByCategory([CategoryID]) AS [Total]
FROM
	[Categories]

	*/
	/*
GO

ALTER FUNCTION GetCustomerOrdersTbl (
	@CustomerID NVARCHAR(5)
)RETURNS TABLE
AS
RETURN (
	SELECT
		*
	FROM
		[Orders]
	WHERE
		[CustomerID] = @CustomerID
)

GO

SELECT
	*
FROM
	dbo.GetCustomerOrdersTbl('BLAUS')

	*/

/*

Create a table-valued function to return the
names and prices of products in a specific category.

*/

ALTER FUNCTION GetProductNamesByCategory (
	@CategoryID INT
)RETURNS TABLE
AS
RETURN (
	SELECT
		[ProductName],
		[UnitPrice]
	FROM
		[Products]
	WHERE
		[CategoryID] = @CategoryID
)


GO

SELECT
	*
FROM
	dbo.GetProductNamesByCategory(2)
