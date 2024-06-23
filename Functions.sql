ALTER FUNCTION GetTotalSales (
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


/*

Create a function to calculate the total order value 
amount including a discount in a specific category

*/