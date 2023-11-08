
-- 1. Write a query that displays the employee's last names only from the string's 2-5th
--	  position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.
	select concat(upper(substr(last_name,2,1)),substr(last_name,3,3)) as last_name from employees;
    
-- 2. Write a query that displays the employee's first name and last name along with a " in between for
--	  e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
	select concat(first_name,"-",last_name) as emp_name,month(hire_date) month_emp_joined from employees;
    
-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase 
--	  the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.
	select last_name,
		case 
			when (salary/2) > 10000 then ((salary+salary*0.10) + 1500)
            else ((salary+salary*0.115) + 1500)
		end as Increament
	from employees;
    select employee_id from employees;
    
-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager
--	  name all in Upper case, if the Manager name consists of 'z' replace it with '$!'
	select concat(substr(employee_id,1,2),0,0,substr(employee_id,3),"E") as emp_id,department_id,salary,upper(replace(concat(first_name," ",last_name),"Z","$!")) as manager_name from employees;
    
-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and 
--	  the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees last names.
	select concat(upper(substr(last_name,1,1)),substr(last_name,2)) as last_name,char_length(last_name) as name_length from employees where last_name like "J%" or last_name like "A%" or last_name like "M%" order by last_name;

-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY
	select last_name,lpad(salary,15,"$") as SALARY from employees;
    
-- 7. Display the employee's name if it is a palindrome
	select concat(first_name," ",last_name) as emp_name from employees where first_name = reverse(first_name);
    
-- 8. Display First names of all employees with initcaps.
	select concat(upper(substr(first_name,1,1)),substr(first_name,2)) as first_name from employees;	
    
-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.
	select street_address,substr(street_address,locate(" ",street_address)+1,locate(" ",street_address,locate(" ",street_address)+1)-locate(" ",street_address)) as "Word" from locations; -- dought
    
-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. 
--	   All characters should be in lower case. Display this along with their First Name.
	select first_name,lower(concat(substr(first_name,1,1),last_name,"@systechusa.com")) as "e-mail address" from employees; 
    
-- 11. Display the names and job titles of all employees with the same job as Trenna.
	select concat(first_name," ",last_name) as emp_name,job_title 
    from emp_details_view
    where job_id = (select job_id from employees where first_name = "trenna");
    
-- 12. Display the names and department name of all employees working in the same city as Trenna.
	select concat(first_name," ",last_name) as emp_name,department_name
    from emp_details_view
	where city = (select city from emp_details_view where first_name = "trenna"); 
    
-- 13. Display the name of the employee whose salary is the lowest.
	select concat(first_name," ",last_name) as emp_name from employees order by salary limit 1;
    
-- 14. Display the names of all employees except the lowest paid.
	select concat(first_name," ",last_name) as emp_name from employees where salary != (select salary from employees order by salary limit 1);