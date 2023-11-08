
-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES.
	select last_name,hire_date from employees join departments
		on employees.department_id = departments.department_id
	where department_name = "sales";
    
-- 2. Create a query to display the employee numbers and last names of all employees who
--    earn more than the average salary. Sort the results in ascending order of salary.
	select employee_id,last_name,salary from emp_details_view where salary > (select avg(salary) from employees) order by salary;
    
-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a 'u'.
	select employee_id,last_name from emp_details_view where department_name in ( select department_name from emp_details_view where last_name like "%u%");
    
-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA.
  select last_name,department_id,job_id from emp_details_view where city = "ATLANTA";
  
-- 5. Display the last name and salary of every employee who reports to FILLMORE.
	select last_name,salary from emp_details_view where manager_id in ( select employee_id from emp_details_view where last_name = "FILLMORE");
    
-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.
	select department_id,last_name,job_id from emp_details_view where department_id in (select department_id from departments where department_name = "OPERATIONS");
    
-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work 
--    in a department with any employee with a 'u'in their name.
	select employee_id,last_name,salary from emp_details_view where salary > (select avg(salary) from employees) and department_name in ( select department_name from emp_details_view where last_name like "%u%");

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.
	select concat(first_name," ",last_name) as emp_name from emp_details_view where job_title in (select job_title from emp_details_view where department_name = "Sales");

-- 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
--    employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise.
	select employee_id,salary,
		case
			when department_id between 10 and 30 then (salary*0.05)
            when department_id = 20 then (salary*0.10)
            when department_id between 40 and 50 then (salary*0.15)
		end as "Pay Raise"
	from employees;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
	select last_name,salary from emp_details_view order by salary desc limit 3;

-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column
	select concat(first_name," ",last_name) as emp_name,
		   salary,
           ifnull(commission_pct,0)
	from emp_details_view;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.
	select concat(Sup.first_name," ",Sup.last_name) as manager_name,Sup.salary,Sup.department_name from emp_details_view Sup,emp_details_view Sub
    where Sup.employee_id = Sub.manager_id
    group by Sup.employee_id
    order by Sup.salary desc limit 3;