CREATE VIEW [dbo].[v.CustomerOnEmployee]
	AS 
	SELECT 
		[cs].[FirstName]
	,	[cs].[LastName]
	,	[cs].[Company]
	,	[em].[FirstName]	as [EmpFirstName]
	,	[em].[LastName]	as [EmpLastName]
	,	[em].[Title]
	FROM Employee as em
	INNER JOIN Customer as cs on em.EmployeeId= cs.SupportRepId