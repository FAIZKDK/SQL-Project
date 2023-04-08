--- Project Portofolio Covid ---


-- Total Cases Vs Total Death

Select date, location, population, total_cases, total_deaths, (total_cases/population)*100 as InfectedPercentage,
(total_deaths/total_cases)*100 as DeathPercentage 
from PortofolioProject..CovidDeaths
--where location like 'indonesia' and total_deaths is not null
order by location



-- Highest Infection Rate Location

Select location, population, Max(total_cases) as HighestInfected, Max((total_cases)/(population))*100 as InfectionRate
from PortofolioProject..CovidDeaths
group by location, population
order by InfectionRate desc


-- Highest Death Rate Location

select location, population, Max(cast(total_deaths as int)) as HighestDeath, max(cast(total_deaths as int)/(population))*100 as DeathRate
from PortofolioProject..CovidDeaths
where location is not null and continent is not null
group by location, population
order by DeathRate desc


-- Infected and Death Rate By Continent

Select location, max(cast(total_deaths as int)) as TotalDeath
from PortofolioProject..CovidDeaths
where continent is null
group by location
order by TotalDeath desc


-- Global Numbers Cases and Death per Day

select date, SUM(new_cases) as CasesPerDay, Sum(cast(new_deaths as int)) as DeathPerDay
from PortofolioProject..CovidDeaths
where new_cases is not null
group by date
order by date


-- Joins Table, Use CTEs

With PopulationvsVaccine (date, location, population, total_cases, new_vaccinations, TrackVaccine)
as
(
Select dea.date, dea.location, dea.population, dea.total_cases, vac.new_vaccinations, Sum(cast(vac.new_vaccinations as bigint)) 
over (partition by dea.location order by dea.date, dea.location) as TrackVaccine
from PortofolioProject..CovidDeaths dea
join PortofolioProject..CovidVaccinations vac
	on dea.date = vac.date
	and dea.location = vac.location
where dea.continent is not null and dea.location is not null and vac.people_vaccinated is not null
--order by location, date
)
Select *, (TrackVaccine/population)*100 as PercentageOfPop
from PopulationvsVaccine




-- Use Temp Tables

Drop Table if Exists #PercentagePeopleVaccinated
Create Table #PercentagePeopleVaccinated
(
date datetime,
Location nvarchar (255),
population numeric,
total_cases numeric,
new_vaccinations numeric,
TrackVaccine numeric
)

Insert into #PercentagePeopleVaccinated
Select dea.date, dea.location, dea.population, dea.total_cases, vac.new_vaccinations, Sum(cast(vac.new_vaccinations as bigint)) 
over (partition by dea.location order by dea.date, dea.location) as TrackVaccine
from PortofolioProject..CovidDeaths dea
join PortofolioProject..CovidVaccinations vac
	on dea.date = vac.date
	and dea.location = vac.location
where dea.continent is not null and dea.location is not null and vac.people_vaccinated is not null
--order by location, date

Select *, (TrackVaccine/population)*100 as PercentagePopulationVaccinated
from #PercentagePeopleVaccinated


-- Create View for Visual

-- Create View Total Death Rate By Continent

Create View TotalDeathByContinent as
Select location, max(cast(total_deaths as int)) as TotalDeath
from PortofolioProject..CovidDeaths
where continent is null
group by location


-- Create View Highest Infection Rate Location

Create View HighestInfectionRate as
Select location, population, Max(total_cases) as HighestInfected, Max((total_cases)/(population))*100 as InfectionRate
from PortofolioProject..CovidDeaths
group by location, population