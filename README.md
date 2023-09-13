# Insurance Database SQL Queries Project

## Introduction

This project showcases SQL querying capabilities using a fictional insurance database. The database consists of various tables related to people, cars, accidents, and their inter-relationships.

## Database Schema

- `person(driver-id, name, address)`
- `car(car-license, model, year)`
- `accident(report-number, date, location)`
- `owns(drive-id, car-license)`
- `participated(driver-id, car-license, report-number, damage amount)`

For a detailed report on the SQL queries and their outcomes, refer to [Report.pdf](Report.pdf).

## How to Run

To execute the SQL queries, you'll need access to a relational database system that supports SQL. Import the `Schema.sql` (if provided) to set up the database, then run the queries present in `SQL_Queries.sql`.

## License

This project is open source and available under the MIT License.
