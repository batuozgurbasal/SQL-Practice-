/*
https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type?code_type=1

Find the rate of processed tickets for each type


<facebook_complaints> table

complaint_id: int
type: int
processed: bool

*/
SELECT
 type,
 SUM(CASE WHEN processed THEN 1 ELSE 0 END) :: NUMERIC /
 COUNT(*) AS processed_rate
FROM
 facebook_complaints
GROUP BY
 type
