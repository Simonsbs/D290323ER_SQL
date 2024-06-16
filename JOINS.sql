/*
SELECT
	*
FROM
	[Categories]

SELECT
	*
FROM
	[Products]


SELECT
	*
FROM
	[Products] INNER JOIN [Categories]
		ON [Products].[CategoryID] = [Categories].[ID]


*/


USE [NewDB];

SELECT
	*
FROM
	[Users] INNER JOIN [Departments]
		ON [Users].[DepartmentID] = [Departments].[ID]

SELECT
	*
FROM
	[Users] LEFT JOIN [Departments]
		ON [Users].[DepartmentID] = [Departments].[ID]

SELECT
	*
FROM
	[Users] RIGHT JOIN [Departments]
		ON [Users].[DepartmentID] = [Departments].[ID]

--SELECT * FROM [Departments]
--SELECT * FROM [Users] WHERE [Users].[DepartmentID] = 1
--SELECT * FROM [Users] WHERE [Users].[DepartmentID] = 2
--SELECT * FROM [Users] WHERE [Users].[DepartmentID] = 3
--SELECT * FROM [Users] WHERE [Users].[DepartmentID] = 4
--SELECT * FROM [Users] WHERE [Users].[DepartmentID] = 10

SELECT
	*
FROM
	[Users] FULL JOIN [Departments]
		ON [Users].[DepartmentID] = [Departments].[ID]




