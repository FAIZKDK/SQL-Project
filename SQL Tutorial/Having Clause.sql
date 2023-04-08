/*
Having Clause
*/

select JobTitle, count (Jobtitle)
from [SQL Tutorial].dbo.EmployeeDemographics
join [SQL Tutorial].dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having count (jobtitle) > 1
order by JobTitle desc

