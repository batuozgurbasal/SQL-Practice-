/*
Employee and Manager Salaries

Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

<employee> table
Preview

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

select b.first_name ,b.salary  from employee a
inner join employee b
on a.id = b.manager_id
where a.salary < b.salary
