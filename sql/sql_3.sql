/*
https://platform.stratascratch.com/coding/9905-highest-target-under-manager?code_type=1

Highest Target Under Manager

Find the highest target achieved by the employee or employees who works under the manager id 13. Output the first name of the employee and target achieved. 
The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

<salesforce_employees> table

id: int
first_name: varchar
last_name: varchar
age: int
sex: varchar
employee_title: varchar
department: varchar
salary: int
target: int
bonus: int
email: varchar
city: varchar
address: varchar
manager_id: int
*/

with tbl as(
select first_name, target
from salesforce_employees
where manager_id = 13
order by target desc)

select first_name, dense_rank() over(order by target desc) as my_rank, target
from tbl
limit 3
