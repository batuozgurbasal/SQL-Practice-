/*
https://platform.stratascratch.com/coding/10060-top-cool-votes?code_type=1

Top Cool Votes

Find the review_text that received the highest number of  'cool' votes.
Output the business name along with the review text with the highest numbef of 'cool' votes.

<yelp_reviews> table

business_name: varchar
review_id: varchar
user_id: varchar
stars: varchar
review_date: datetime
review_text: varchar
funny: int
useful: int
cool: int
*/

with tbl as(
select distinct business_name, review_text, cool, dense_rank() over(order by cool desc) as cool_ranking
from yelp_reviews
order by cool desc)

select business_name, review_text
from tbl
where cool_ranking = 1
