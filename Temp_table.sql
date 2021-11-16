/*
Temp Tables
*/

CREATE TABLE #temp_Employee (
EmployeeID INT,
JobTitle VARCHAR(70),
Salary INT
)

SELECT *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES (
'1001', 'Data Analyst', '55000'
)

INSERT INTO #temp_Employee
SELECT *
FROM LearnSQL.dbo.EmployeeSalary

-- TEMP_TABLE 2
DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2 (
JobTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM LearnSQL..EmployeeDemographics emp
JOIN LearnSQL..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2
