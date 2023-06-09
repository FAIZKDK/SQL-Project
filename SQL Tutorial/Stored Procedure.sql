USE [SQL Tutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 06/04/2023 03:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[Temp_Employee]
@JobTitle nvarchar(50)
as 
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
Where JobTitle = @JobTitle
Group by JobTitle

Select *
from #Temp_Employee