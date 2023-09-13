# Insurance Database SQL Queries Project

## Introduction

This project showcases SQL querying capabilities using a fictional insurance database. The database consists of various tables related to people, cars, accidents, and their inter-relationships.

## Database Schema

- `person(driver-id, name, address)`
- `car(car-license, model, year)`
- `accident(report-number, date, location)`
- `owns(drive-id, car-license)`
- `participated(driver-id, car-license, report-number, damage amount)`
- `employee(employee-id, employee-name, street, city)`
- `works(employee-id, company-id, salary)`
- `company(company-id, company-name, city)`
- `manages(employee-id, manager-id`

For a detailed report on the SQL queries and their outcomes, refer to [Insurance_Database_SQL_Report_.pdf](Insurance_Database_SQL_Report_.pdf).

## How to Run

To execute the SQL queries, you'll need access to a relational database system that supports SQL. Import the `Schema.sql` to set up the database, then run the queries present in `SQL_Queries.sql`.


