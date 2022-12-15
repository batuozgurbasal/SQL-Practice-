/*
https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=1

Customer Revenue In March


Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
Output the revenue along with the customer id and sort the results based on the revenue in descending order.

<orders> table

id: int
cust_id: int
order_date: datetime
order_details: varchar
total_order_cost: int
*/

select cust_id, sum(total_order_cost)
from orders
WHERE TO_CHAR(order_date, 'YYYY-MM') = '2019-03'
group by cust_id
