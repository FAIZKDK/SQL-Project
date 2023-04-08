/*
CTEs
*/

With CTE_Employee as
(Select demo.EmployeeID, FirstName, LastName, Gender, JobTitle, Salary
, Count(gender) over(partition by Gender) as TotalGender
, AVG(Salary) over(partition by Gender) as AVGSalary
from [SQL Tutorial]..EmployeeDemographics demo
full outer join [SQL Tutorial]..EmployeeSalary sala
	on demo.EmployeeID = sala.EmployeeID
Where Salary > '40000'
)
Select *
From CTE_Employee