/*

https://platform.stratascratch.com/coding/10064-highest-energy-consumption?code_type=1

Highest Energy Consumption

Find the date with the highest total energy consumption from the Meta/Facebook data centers. 
Output the date along with the total energy consumption across all data centers.

<fb_eu_energy> table

date: datetime
consumption: int

<fb_asia_energy>

date: datetime
consumption: int

<fb_na_energy>

date: datetime
consumption: int

*/

with 
new_table as(
    select *
    from fb_eu_energy
    union all
    select *
    from fb_asia_energy
    union all 
    select *
    from fb_na_energy),

 
total as(
    select date, dense_rank() over (order by sum(consumption) desc) as rnk, sum(consumption) as total_consumption_by_date
    from new_table
    group by date
    order by total_consumption_by_date desc)

select *
from total
where total_consumption_by_date = (select max(total_consumption_by_date)
from total)
