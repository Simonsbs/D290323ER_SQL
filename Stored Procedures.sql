--USE [NW2];
/*
ALTER PROCEDURE GetCustomerOrders
	@CustomerID NVARCHAR(5),
	@CategoryName NVARCHAR(20)
AS
BEGIN

	INSERT INTO
		[Categories]
	(
		[CategoryName]
	) VALUES (
		@CategoryName
	)
	
	SELECT
		[OrderID],
		[OrderDate],
		[Freight]
	FROM
		[Orders]
	WHERE
		[CustomerID] = @CustomerID

	SELECT
		*
	FROM
		[Categories]

END;

GO


*/

--sp_helptext 'CustOrderHist'
/*
GO

EXEC
	GetCustomerOrders
@CategoryName='SIMON',
@CustomerID='BLAUS'
*/

/*

Create a stored procedure to update a product's price
and another to calculate the total order value amount for
a specific customer.

*/
/*
ALTER PROCEDURE P_UpdateProductPrice
	@ProductID INT,
	@NewPrice MONEY
AS
BEGIN
	
	SELECT
		*
	FROM
		[Products]
	WHERE
		[ProductID] = @ProductID


	UPDATE
		[Products]
	SET
		[UnitPrice] = @NewPrice
	WHERE
		[ProductID] = @ProductID


	SELECT
		*
	FROM
		[Products]
	WHERE
		[ProductID] = @ProductID

END;

GO

EXEC P_UpdateProductPrice 2, 20.5*/

ALTER PROCEDURE P_OrderAmountForCustomer
	@CustomerID NVARCHAR(5)
AS
BEGIN
	
	WITH [Rows] ([UnitPrice],[Quantity],[Total])
	AS (
		SELECT
			[UnitPrice],
			[Quantity],
			[UnitPrice] * [Quantity] AS [Total]
		FROM
			[Orders] [O]
			INNER JOIN
			[Order Details] [OD]
				ON [O].[OrderID] = [OD].[OrderID]
		WHERE
			[CustomerID] = @CustomerID
	)
	SELECT
		SUM([Total]) AS [Total],
		(SELECT
			COUNT(*)
		FROM
			[Orders]
		WHERE
			[CustomerID] = @CustomerID) AS [Count]
	FROM
		[Rows]
		
END

GO

EXEC P_OrderAmountForCustomer 'BLAUS'