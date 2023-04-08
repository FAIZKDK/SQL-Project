/*
Case Statement
*/

--select Firstname, LastName, Age,
--case
--	when Age >= 32 then 'Old'
--	when Age between 27 and 31 then 'Young'
--	Else 'Baby'
--end as Categorized
--from [SQL Tutorial].dbo.EmployeeDemographics
--where Age is not null
--order by Age

--Case 1 Raises Salary Based on Job Title
--select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary,
--case
--	when JobTitle = 'Salesman' then Salary + (salary*.10)
--	when JobTitle = 'Accountant' then Salary + (salary*.05)
--	when JobTitle = 'HR' then Salary + (salary*.01)
--	else Salary + (Salary*.03)
--end as Bonus
--from [SQL Tutorial].dbo.EmployeeDemographics
--join [SQL Tutorial].dbo.EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
