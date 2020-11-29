-- Find the average total compensation based on employee titles and gender. 
-- Total compensation is calculated by adding both the salary and bonus of each employee. 
-- However, not every employee receives a bonus so disregard employees without bonuses in your calculation. 
-- Output the employee title, gender (i.e., sex), along with the average total compensation.

select employee_title, sex, AVG(salary + bonus)
from sf_employee JOIN sf_bonus ON sf_employee.id = sf_bonus.worker_ref_id
WHERE bonus IS NOT NULL 
GROUP BY employee_title, sex
