-- Find the employee who has achieved the highest target.
-- Output the employee's first name along with the achieved target and the bonus.

select 
    first_name, target, bonus
from employee
ORDER BY 2 DESC
LIMIT 1
