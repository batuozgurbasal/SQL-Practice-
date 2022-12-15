/*
https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=1

Users By Average Session Time

Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, 
assume a user has only 1 session per day and if there are multiple of the same events on that day, 
consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.

<facebook_web_log> table

user_id: int
timestamp: datetime
action: varchar
*/

with my_table as(
    select user_id, date(timestamp) as day, min(timestamp) as exit
    from facebook_web_log
    where action = 'page_exit'
    group by 1,2),

other_table as(
    select user_id, date(timestamp) as day, max(timestamp) as load
    from facebook_web_log
    where action = 'page_load'
    group by 1,2)
    
select my_table.user_id, avg(exit - load)
from my_table
left join other_table
on my_table.user_id = other_table.user_id and my_table.day = other_table.day
group by 1
