/*
Learn CTEs
*/

WITH CTE_Employee AS
(SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM LearnSQL.dbo.EmployeeDemographics emp
JOIN LearnSQL.dbo.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '43000'
)
SELECT *
FROM CTE_Employee
