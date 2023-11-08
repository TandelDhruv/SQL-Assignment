
-- 1) Display the maximum, minimum and average salary and commission earned.
	select max(salary),min(salary),avg(salary),max(commission_pct),min(commission_pct),avg(commission_pct) from employees;
    
-- 2) Display the department number, total salary payout and total commission payout for each department.
	select department_id,sum(salary) as total_salary_payout,sum(commission_pct) as total_commission_payout from employees group by department_id;
    
-- 3) Display the department number and number of employees in each department.
	select department_id,count(first_name) as "number of employees" from employees group by department_id;
    
-- 4) Display the department number and total salary of employees in each department.
	select department_id,sum(salary) as total_salary_employees from employees group by department_id;
    
-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name.
	select concat(first_name," ",last_name) as name from employees where commission_pct is null;
    
-- 6) Display the employees name, department id and commission. If an Employee doesn't
--    earn the commission, then display as 'No commission'. Name the columns appropriately.
	select concat(first_name," ",last_name) as employees_name,
		   department_id,
           ifnull(commission_pct,"No commission") as commission_earned
    from employees;
    
-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee
--    doesn't earn the commission, then display as 'No commission. Name the columns appropriately.
	select concat(first_name," ",last_name) as employees_name,
		   department_id,
           ifnull(commission_pct*2,"No commission") as commission_earned
    from employees;
    
-- 8) Display the employee's name, department id who have the first name same as another employee in the same department.
	select concat(first_name," ",last_name) as employees_name,department_id from employees group by department_id,first_name having count(*) > 1 ;
    
-- 9) Display the sum of salaries of the employees working under each Manager.
	select manager_id,count(*),sum(salary) from employees group by manager_id;
    
-- 10) Select the Managers name, the count of employees working under and the department ID of the manager.
	select Sup.employee_id,concat(Sup.first_name," ",Sup.last_name) as manager_name,count(*) as total_employees,Sup.department_id from employees Sup,employees Sub
    where Sup.employee_id = Sub.manager_id
    group by Sup.employee_id;
    
-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a'
	select concat(first_name," ",last_name) as employees_name,department_id,salary from employees where last_name like "_a%" group by manager_id;
    
-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.
	select sum(salary) from employees group by department_id;
    
-- 13) Select the maximum salary of each department along with the department id.
	select department_id,max(salary) as max_salary from employees group by department_id;
    
-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1.
	select commission_pct,
		case 
			when commission_pct is not null then salary * 0.10
            else 1
		end as salary
	from employees;