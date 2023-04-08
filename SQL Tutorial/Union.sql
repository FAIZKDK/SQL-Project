/*
Union, Union All
*/

--select *
--from [SQL Tutorial].dbo.EmployeeDemographics
--union all
--select *
--from [SQL Tutorial].dbo.WarehouseEmployeeDemographic
--order by EmployeeID

--select *
--from [SQL Tutorial].dbo.EmployeeDemographics
--full outer join [SQL Tutorial].dbo.WarehouseEmployeeDemographic
--on EmployeeDemographics.EmployeeID = WarehouseEmployeeDemographic.EmployeeID

select *
from [SQL Tutorial].dbo.EmployeeDemographics
union
select *
from [SQL Tutorial].dbo.EmployeeSalary