/*
https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=1

Ranking Most Active Guests


Rank guests based on the number of messages they've exchanged with the hosts. 
Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.

<airbnb_contacts> table

id_guest: varchar
id_host: varchar
id_listing: varchar
ts_contact_at: datetime
ts_reply_at: datetime
ts_accepted_at: datetime
ts_booking_at: datetime
ds_checkin: datetime
ds_checkout: datetime
n_guests: int
n_messages: int

*/

select dense_rank() over (order by sum(n_messages) desc) as rank, id_guest, sum(n_messages) as sum_n_messages
from airbnb_contacts
group by id_guest
order by sum_n_messages desc
