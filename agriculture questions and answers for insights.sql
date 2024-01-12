create database agriculture;
use agriculture; 
select count(*) from crop_data;

select  crop, temperature from crop_data
where temperature > 30;
 
select sum(production_in_tons) from crop_data;

-- 1 Retrieve the top 5 crops with the highest production.
select crop ,max(production_in_tons) as highest_production from crop_data 
group by crop
limit 5;

-- 2 Retrieve rows where the Temperature is between a specific range, and the Production_in_tons is above a certain value
select temperature, production_in_tons from crop_data
where temperature between 25 and 30 and production_in_tons > 1000;

-- 3 Identify the State_Name with the highest total Nitrogen usage.
select state_name ,sum(nitrogen) as total_usage from crop_data
group by state_name
order by total_usage desc limit 1;

-- 4 Retrieve the total production of each Crop_Type in tons. 
select crop_type, sum(production_in_tons) as total_production from crop_data
group by crop_type;

-- 5 Find the Crop_Type with the highest average Yield per hectare.
select crop_type, avg(yield_ton_per_hec) as average_yield from crop_data
group by crop_type
having avg(yield_ton_per_hec) > (select avg(yield_ton_per_hec) from crop_data);
          -- OR
select crop_type, avg(yield_ton_per_hec) as average_yield
from crop_data
group by  crop_type
order by average_yield desc
limit  1;

-- 6 Calculate the percentage of total production contributed by each Crop_Type. 
select 
    Crop_Type,
    sum(Production_in_tons) as TotalProduction,
    (sum(Production_in_tons) * 100.0 / SUM(SUM(Production_in_tons)) over ()) as PercentageOfTotalProduction
from
    crop_data
group by
    Crop_Type;

-- 7 Find the State_Name where the Potential Hydrogen level is lowest on average.
select state_name, avg(potential_hydrogen) as average_hydrogen_potential from crop_data
group by state_name
order by average_hydrogen_potential
limit 1;

-- 8 Get the top 3 Crop types with the highest overall production.
select crop_type, max(production_in_tons) as highest_production from crop_data
group by crop_type
order by highest_production desc limit 3; 

-- 9 Find the State_Name where the sum of Nitrogen, Phosphorus, and Potassium is the highest.
select state_name, 
sum(nitrogen) as total_nitrogen,
 sum(phosphours) as total_phosphorus,
 sum(postassium) as total_postassium
from crop_data
group by state_name;

--  10 Identify the Crop_Type with the highest average Yield per hectare in States where the rainfall is below the overall average.
select crop_type, 
avg(yield_ton_per_hec) as average_yield, 
state_name, 
avg(rainfall) as average_rainfall
from crop_data
group by crop_type, state_name
order by average_yield desc , average_rainfall asc; 

select crop_type from crop_data;
use agriculture;




