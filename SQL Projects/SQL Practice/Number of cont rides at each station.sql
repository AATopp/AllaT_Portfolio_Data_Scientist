-- Find the number of continuous rides performed at each station.
-- Continous rides can be identified when the end time of the first ride is the same as the start time of the second ride and the start station is the same for both rides.
-- Output the start station and the corresponding number of continuous rides.
-- Order records by the number of continuous rides in descending order.

-- Solution:
-- group by start station
-- order by count() DESC

select dc1.start_station, 
       COUNT(*) AS end_to_end_ride
from dc_bikeshare_q1_2012 dc1 JOIN dc_bikeshare_q1_2012 dc2
     ON dc1.bike_number = dc2.bike_number
WHERE dc1.end_time = dc2.start_time 
      AND dc1.start_station = dc2.start_station
GROUP BY 1
ORDER BY 2 DESC
