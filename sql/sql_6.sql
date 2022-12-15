/*
https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=1

Find matching hosts and guests in a way that they are both of the same gender and nationality


Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.

<airbnb_hosts> table

host_id: int
nationality: varchar
gender: varchar
age: int

<airbnb_guests> table

guest_id: int
nationality: varchar
gender: varchar
age: int

*/

select distinct host_id, guest_id
from airbnb_hosts a
inner join airbnb_guests b
on a.nationality = b.nationality and a.gender = b.gender
