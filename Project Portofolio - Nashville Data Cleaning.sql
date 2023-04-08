/*
Cleaning Data in SQL Queries
*/

select * 
from PortofolioProject..NashvilleHousing

-- Standardize Date Format

select SaleDate
from PortofolioProject..NashvilleHousing

select SaleDate, Convert(Date,Saledate)
from PortofolioProject..NashvilleHousing

alter table NashvilleHousing
add FixedDate Date;

update PortofolioProject..NashvilleHousing
set FixedDate = convert(date,Saledate)


----------------------------------------------------------------------

-- Populate Adress Data

select *
from PortofolioProject..NashvilleHousing
where PropertyAddress is null
order by ParcelID


select a.[UniqueID ], a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress
from PortofolioProject..NashvilleHousing a
join PortofolioProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null
order by a.ParcelID


select a.[UniqueID ], a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from PortofolioProject..NashvilleHousing a
join PortofolioProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null
order by a.ParcelID


update a
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from PortofolioProject..NashvilleHousing a
join PortofolioProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

-----------------------------------------------------------------------

-- Breaking out Adress into Individual Columns (Address,City,State)

select PropertyAddress
from PortofolioProject..NashvilleHousing

select
substring (PropertyAddress, 1, charindex(',', PropertyAddress) -1) as Address,
SUBSTRING (PropertyAddress, CHARINDEX(',',PropertyAddress) +1, len(PropertyAddress)) as City 
from PortofolioProject..NashvilleHousing


alter table NashvilleHousing
add Address nvarchar (255)

update PortofolioProject..NashvilleHousing
set Address = substring (PropertyAddress, 1, charindex(',', PropertyAddress) -1)


alter table NashvilleHousing
add City nvarchar (255)

update PortofolioProject..NashvilleHousing
set City = SUBSTRING (PropertyAddress, CHARINDEX(',',PropertyAddress) +1, len(PropertyAddress))


select *
from PortofolioProject..NashvilleHousing

select
PARSENAME(REPLACE(OwnerAddress,',','.'), 3),
PARSENAME(REPLACE(OwnerAddress,',','.'), 2),
PARSENAME(REPLACE(OwnerAddress,',','.'), 1)
from PortofolioProject..NashvilleHousing


alter table NashvilleHousing
add Owner_Adress nvarchar (255)

alter table NashvilleHousing
add Owner_City nvarchar (255)

alter table NashvilleHousing
add Owner_State nvarchar (255)

update PortofolioProject..NashvilleHousing
set Owner_Adress = PARSENAME(REPLACE(OwnerAddress,',','.'), 3)

update PortofolioProject..NashvilleHousing
set Owner_City = PARSENAME(REPLACE(OwnerAddress,',','.'), 2)

update PortofolioProject..NashvilleHousing
set Owner_State = PARSENAME(REPLACE(OwnerAddress,',','.'), 1)

Select Owner_State
from PortofolioProject..NashvilleHousing
group by Owner_State

Update PortofolioProject..NashvilleHousing
set Owner_State = REPLACE(Owner_State, 'TN', 'Tennesee')


-------------------------------------------------------------------------------

-- Change Y and N to Yes and No ( In SoldAsVacant Column)

Select SoldAsVacant,
Case when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	Else SoldAsVacant
	End
from PortofolioProject..NashvilleHousing

Update NashvilleHousing
Set SoldAsVacant = Case when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	Else SoldAsVacant
	End

-----------------------------------------------------------------------------------

-- Remove Duplicates

select *, ROW_NUMBER() over ( partition by parcelID,
											PropertyAddress,
											SalePrice,
											SaleDate,
											LegalReference
										order by
											UniqueID
											) 
											row_num

from PortofolioProject..NashvilleHousing
order by ParcelID



With RowNumCTE as (
select *, ROW_NUMBER() over ( partition by parcelID,
											PropertyAddress,
											SalePrice,
											SaleDate,
											LegalReference
										order by
											UniqueID
											) 
											 as row_num

from PortofolioProject..NashvilleHousing
)
delete 
from RowNumCTE
where row_num > 1


-----------------------------------------------------------------------

-- Delete Unused Column

Select *
from PortofolioProject..NashvilleHousing

Alter table PortofolioProject..NashvilleHousing
drop column PropertyAddress, OwnerAddress, TaxDistrict

Alter table PortofolioProject..NashvilleHousing
drop column SaleDate