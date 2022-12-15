/*
https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?code_type=1
Number Of Units Per Nationality

Find the number of apartments per nationality that are owned by people under 30 years old. Since a person can own 1 or more properties, duplicates should be removed.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

<airbnb_hosts> table

host_id: int
nationality: varchar
gender: varchar
age: int

<airbnb_units> table

host_id: int
unit_id: varchar
unit_type: varchar
n_beds: int
n_bedrooms: int
country: varchar
city: varchar

*/

select nationality, count(distinct b.unit_id) as apartment_count
from airbnb_hosts a
join airbnb_units b
on a.host_id = b.host_id
where age < 30 and b.unit_type = 'Apartment'
group by nationality  
order by apartment_count desc 
