
-- Insurance Database Schema

CREATE TABLE person (
    driver_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE car (
    car_license VARCHAR(10) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

CREATE TABLE accident (
    report_number INT PRIMARY KEY,
    date DATE,
    location VARCHAR(255)
);

CREATE TABLE owns (
    drive_id INT,
    car_license VARCHAR(10),
    FOREIGN KEY (drive_id) REFERENCES person(driver_id),
    FOREIGN KEY (car_license) REFERENCES car(car_license)
);

CREATE TABLE participated (
    driver_id INT,
    car_license VARCHAR(10),
    report_number INT,
    damage_amount DECIMAL(10, 2),
    FOREIGN KEY (driver_id) REFERENCES person(driver_id),
    FOREIGN KEY (car_license) REFERENCES car(car_license),
    FOREIGN KEY (report_number) REFERENCES accident(report_number)
);

-- Employee Database Schema

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE works (
    employee_id INT,
    company_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE manages (
    employee_id INT,
    manager_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);
