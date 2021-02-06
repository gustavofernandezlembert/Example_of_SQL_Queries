# Example_of_SQL_Querys

## Some database squemas are provided follow by questions and the corresponding SQL query needed.

Relational Databases

1.	Consider the insurance database of Fig 1, where the primary keys are underlined. Construct the following SQL queries for this relational database. 

person(driver-id, name, address)
car(car-license, model, year)
accident(report-number, date, location)
owns(drive-id, car-license)
participated(driver-id, car-license, report-number, damage amount)
 
Figure 1. Insurance database

1.1.	Find the total number of people who owned cars that were involved in accidents in 1989.

select *
from owns
natural join participated natural join accident
where date like '%1989%'


1.2.	Find the number of accidents in which the cars belonging to “John Smith” were involved. 

select count(car_license)
from participated
where car_license in (
select car_license
from person
natural join owns
where name='John Smith’)

1.3.	Add a new accident to the database; assume any values for required attributes.

insert into accident
values (2,'25 Jan 2021','Maryland’)


1.4.	Delete the Mazda belonging to “John Smith”.

delete
from car 
where model like '%Mazda%' and car_license in (

select car_license
from owns
natural join person 
where name='John Smith'

)

1.5.	Update the damage amount for the car with license number “AABB2000” in the accident with report number “AR2197” to $3000. 

update participated
set damage_amount=3000
where report_number='AR2197'



2.	Consider the employee database of Fig. 2, where the primary keys are underlined. Given an SQL query for each of the following questions. 


employee(employee-id, employee-name, street, city)
works(employee-id, company-id, salary)
company(company-id, company-name, city)
manages(employee-id, manager-id)


Figure 2. Employee database



2.1.	Find the names of all employees who work for First Bank Corporation.

select employee.employee_name
from employee
natural join works JOIN company on works.company_id=company.company_id
where company_name='First Bank'



2.2.	Find the names and cities of residence of all employees who work for First Bank Corporation.

select employee.employee_name, employee.city
from employee
natural join works JOIN company on works.company_id=company.company_id
where company_name='First Bank'


2.3.	Find the names, street addresses, and cities of residence of all employees who work for First Bank Corporation and earn more than $10,000.

select employee.employee_name, employee.street,employee.city
from employee
natural join works JOIN company on works.company_id=company.company_id
where company_name='First Bank' and salary>10000


2.4.	Find all employees in the database who live in the same cities as the companies for which they work.

select employee_name
from employee,works,company
where employee.employee_id=works.employee_id and works.company_id=company.company_id and employee.city=company.city


2.5.	Find all employees in the database who live in the same cities and on the same streets as do their managers. 

select emp1.employee_name
from employee as emp1, employee as emp2, mamages as m
where emp1.employee_id=m.employee_id and m.manager_id=emp2.employee_id
and emp1.street=emp2.street and emp1.city=emp2.city


2.6.	Find all employees in the database who do not work for the First Bank Corporation.

select employee_name
from employee, works , company
where employee.employee_id=works.employee_id and works.company_id=company.company_id
and company.company_name <> 'First Bank'


2.7.	Find all employees in the database who earn more than each employee of Small Bank Corporation.

select employee_name from employee,works
where employee.employee_id=works.employee_id and
salary > all (
                select salary from Works,company
                 where company_name='Small Bank Corporation'
                 and works.company_id=company.company_id )
                           

2.8.	Assume that the companies may be located in several cities. Find all companies located in every city in which Small Bank Corporation is located. 

select company_name
from company
where city = (select city
             from company
             where company_name='First Bank') 

2.9.	Find all employees who earn more than the average salary of all employees of their company. 

select employee_name 
from(

select employee_name,salary,AVG(salary) over (partition by company_name) as AverageSalary
from employee,works,company
where employee.employee_id=works.employee_id and works.company_id=company.company_id
) as T
where salary>AverageSalary


2.10.	Find the company that has the most employees. 

select company_name
from (
select company_name,COUNT(employee.employee_id) as cnt2
from employee,works,company
where employee.employee_id=works.employee_id and works.company_id=company.company_id
group by company_name

) as T3

where cnt2= (

select MAX(cnt) 
from(
select company_name,COUNT(employee.employee_id) as cnt
from employee,works,company
where employee.employee_id=works.employee_id and works.company_id=company.company_id
group by company_name
) as T2
)

2.11.	Find the company that has the smallest payroll. 

select company_name
from (
select company_name,AVG(salary) as AvgSal2
from employee,works,company
where employee.employee_id=works.employee_id and works.company_id=company.company_id
group by company_name
) as T5

where AvgSal2= (

select min(AvgSal)
from(
	
select company_name,AVG(salary) as AvgSal
from employee,works,company
where employee.employee_id=works.employee_id and works.company_id=company.company_id
group by company_name
) as T4
)


2.12.	Find those companies whose employees earn a higher salary, on average, than the average of First Bank Corporation.

select distinct(company_name)
from(

select company_name, salary,AVG(salary) over (partition by company_name) as AverageSalary
from employee,works,company
where employee.employee_id=works.employee_id and works.company_id=company.company_id
) as T

where AverageSalary > ( 
                        select AVG(salary) from Works,company
                        where company_name='First Bank'
                        and works.company_id=company.company_id
                
                         )


