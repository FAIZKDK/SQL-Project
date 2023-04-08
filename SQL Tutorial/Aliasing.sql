/*
Aliasing
*/

select Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sala.JobTitle, Sala.Salary
from [SQL Tutorial].dbo.EmployeeDemographics As Demo
left join [SQL Tutorial].dbo.WarehouseEmployeeDemographic As Ware
	On Demo.EmployeeID = Ware.EmployeeID
full outer join [SQL Tutorial].dbo.EmployeeSalary As Sala
	On Demo.EmployeeID = Sala.EmployeeID