-- TRY...CATCH


BEGIN TRY
	--SELECT
	--	1/0

	INSERT INTO
		[Categories]
	(CategoryID, CategoryName)
	VALUES
	(3, 'IM NEW')

END TRY
BEGIN CATCH
	--PRINT 'Error in script, try again'
	--PRINT ERROR_MESSAGE()
	SELECT
		ERROR_MESSAGE() AS [Message],
		ERROR_NUMBER() AS [Number],
		ERROR_SEVERITY() AS [Severity],
		ERROR_STATE() AS [State],
		ERROR_LINE() AS [Line],
		ERROR_PROCEDURE() AS [Procedure]
END CATCH


/*

Exercise: Students write a TRY...CATCH block to handle errors when updating the Products table.
Task: Attempt to update a product's price to a negative value and handle the error appropriately.

*/