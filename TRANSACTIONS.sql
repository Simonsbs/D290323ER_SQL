-- TRANSACTOIONS

USE [NW2]

BEGIN TRANSACTION;

BEGIN TRY
	INSERT INTO
		[Categories]
	(CategoryName)
	VALUES
	('NOT SAVED 123');
	
	--SELECT (1/0);

	INSERT INTO
		[Categories]
	(CategoryName)
	VALUES
	('NOT SAVED 456');

	COMMIT;

	SELECT (1/0);
END TRY
BEGIN CATCH
	ROLLBACK;
	PRINT ERROR_MESSAGE();
END CATCH;

SELECT * FROM Categories;


/*
	Build a transaction with a try...catch block, 
	that updates a product's price
	* simulate an error in the try block to check the rollback
	* remove the error and check the commit
*/