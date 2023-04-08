/*
Temp Tables
*/

Create Table #Temp_Employee (
JobTitle varchar(50),
EmployeePerJob int,
AVGAge int,
AVGSalary int)

Insert Into #Temp_Employee
Select JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
from [SQL Tutorial].dbo.EmployeeDemographics
join [SQL Tutorial]..EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group by JobTitle

Select *
from #Temp_Employee