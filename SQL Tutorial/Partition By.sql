/*
Partition By
*/

Select demo.EmployeeID, demo.FirstName, demo.LastName, demo.Age, demo.Gender, JobTitle, Salary
, Count(demo.Gender) over (Partition by demo.Gender) as TotalGender
from [SQL Tutorial]..EmployeeDemographics demo
full outer join [SQL Tutorial]..EmployeeSalary Sala
	On demo.EmployeeID = sala.EmployeeID
full outer join [SQL Tutorial]..WarehouseEmployeeDemographic Ware
	On demo.EmployeeID = Ware.EmployeeID
Order By demo.EmployeeID 