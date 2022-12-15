*/
https://platform.stratascratch.com/coding/10077-income-by-title-and-gender?code_type=1

Income By Title and Gender

Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. 
However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee can receive more than one bonus.
Output the employee title, gender (i.e., sex), along with the average total compensation.

<sf_employee> table

id: int
first_name: varchar
last_name: varchar
age: int
sex: varchar
employee_title: varchar
department: varchar
salary: int
target: int
email: varchar
city: varchar
address: varchar
manager_id: int

<sf_bonus> table

worker_ref_id: int
bonus: int

*/

WITH total_bonus AS (
    SELECT worker_ref_id, SUM(bonus) AS bonus
    FROM sf_bonus
    GROUP BY 1
), cte AS (
    SELECT 
        sex,
        employee_title,
        salary + bonus AS income
    FROM sf_employee AS e
    INNER JOIN total_bonus AS b
    ON e.id = b.worker_ref_id
)

SELECT 
    employee_title, 
    sex,
    AVG(income) AS avg_income
FROM cte
GROUP BY 1, 2
