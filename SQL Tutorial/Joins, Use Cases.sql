/*
Inner Joins, Full/Left/Right Outer Joins
*/

--select *
--from [SQL Tutorial].dbo.EmployeeDemographics

--select *
--from [SQL Tutorial].dbo.EmployeeSalary

--Select *
--from [SQL Tutorial].dbo.EmployeeDemographics
--join [SQL Tutorial].dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Select *
--from [SQL Tutorial].dbo.EmployeeDemographics
--full outer join [SQL Tutorial].dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Age, Gender, Salary
--from [SQL Tutorial].dbo.EmployeeDemographics
--join [SQL Tutorial].dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Case 1 Robert Calif pressuring michael scott to meet his quarterly quota and michael is almost there, he needs like more few thousand
--Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Age, Gender, Salary
--from [SQL Tutorial].dbo.EmployeeDemographics
--join [SQL Tutorial].dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--where firstname <> 'Michael'
--order by salary desc

--Case 2 Calculate AVG salary for Salesmen
--Select JobTitle, AVG(Salary) as AVGSalary
--from [SQL Tutorial].dbo.EmployeeDemographics
--join [SQL Tutorial].dbo.EmployeeSalary
--on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--where jobtitle = 'Salesman'
--group by JobTitle


