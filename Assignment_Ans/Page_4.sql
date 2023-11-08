
-- 1. Write a query to display the last name, department number, department name for all employees.
	select last_name,department_id,department_name from emp_details_view;
    
-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
	select job_title,department_name,city from emp_details_view where department_id = 40 group by job_title;
    
-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
	select last_name,department_name,location_id,city from emp_details_view where commission_pct is not null;
    
-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name
	select last_name,department_name from emp_details_view where last_name like "%A%";
    
-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.
	select last_name,job_title,department_id,department_name from emp_details_view where city = "ATLANTA";
    
-- 6. Display the employee last name and employee number along with their manager's last name and manager number.
    select Sub.last_name as emp_name,Sub.employee_id,Sup.last_name as manager_name,Sub.manager_id from emp_details_view Sup,emp_details_view Sub
    where Sup.employee_id = Sub.manager_id;
    
-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).
	 select Sub.last_name as emp_name,Sub.employee_id,Sup.last_name as manager_name,Sub.manager_id from emp_details_view Sup left outer join emp_details_view Sub
    on Sup.employee_id = Sub.manager_id;
    
-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.
	select e.department_id as 'Department_number',e.last_name as 'Employee',s.last_name as 'Other_Emp' from employees e join employees s
	 on e.department_id=s.department_id  where e.employee_id != s.employee_id order by 2,1,3;
    
-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)
		select concat(first_name," ",last_name) as name,job_title,department_name,salary,
			   case 
				when salary >= 50000 then "A"
                when salary >= 30000 then "B"
                else "C"
			   end as Grade
		from emp_details_view;
        
-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee
--     name, emp_hire_date,manager name,man_hire_date
	select concat(Sub.first_name," ",Sub.last_name) as emp_name,Sub.hire_date as emp_hire_date,concat(Sup.first_name," ",Sup.last_name) as manager_name,Sup.hire_date as Man_hire_date from employees Sup,employees Sub
    where Sup.employee_id = Sub.manager_id and Sub.hire_date < Sup.hire_date;