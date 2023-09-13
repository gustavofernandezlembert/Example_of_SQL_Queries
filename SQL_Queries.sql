-- Find the total number of people who owned cars that were involved in accidents in 1989.


select *
from owns
natural join participated natural join accident
where date like '%1989%';
    

-- Add a new accident to the database; assume any values for required attributes.


insert into accident
values (2,'25 Jan 2021','Maryland');
    

-- Delete the Mazda belonging to “John Smith”.


delete
from car 
where model like '%Mazda%' and car_license in (
select car_license
from owns
natural join person 
where name='John Smith'
);
    

-- Update the damage amount for the car with license number “AABB2000” in the accident with report number “AR2197” to $3000.


update participated
set damage_amount=3000
where report_number='AR2197';
    -- Find the names of all employees who work for First Bank Corporation.


select employee.employee_name
from employee
natural join works JOIN company on works.company_id=company.company_id
where company_name='First Bank';
    

-- Find the names and cities of residence of all employees who work for First Bank Corporation.


select employee.employee_name, employee.city
from employee
natural join works JOIN company on works.company_id=company.company_id
where company_name='First Bank';
    

-- Find all employees who earn more than the average salary of all employees of their company.


select employee_name 
from(
select employee_name, salary, AVG(salary) over (partition by company_name) as AverageSalary
from employee, works, company
where employee.employee_id = works.employee_id and works.company_id = company.company_id
) as T
where salary > AverageSalary;
    

-- Find the company that has the smallest payroll.


select company_name
from (
select company_name, AVG(salary) as AvgSal2
from employee, works, company
where employee.employee_id = works.employee_id and works.company_id = company.company_id
group by company_name
) as T5
where AvgSal2 = (
select MIN(AvgSal)
from (
select company_name, AVG(salary) as AvgSal
from employee, works, company
where employee.employee_id = works.employee_id and works.company_id = company.company_id
group by company_name
) as T4
);
    

-- Find those companies whose employees earn a higher salary, on average, than the average of First Bank Corporation.


select distinct(company_name)
from(
select company_name, salary, AVG(salary) over (partition by company_name) as AverageSalary
from employee, works, company
where employee.employee_id = works.employee_id and works.company_id = company.company_id
) as T
where AverageSalary > (
select AVG(salary) from Works, company
where company_name = 'First Bank'
and works.company_id = company.company_id
);
    