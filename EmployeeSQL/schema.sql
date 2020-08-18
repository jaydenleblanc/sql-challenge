--- Create database tables ---
CREATE TABLE departments (
dept_no VARCHAR PRIMARY KEY,
dept_name VARCHAR(30)
);

CREATE TABLE employees (
emp_no SERIAL PRIMARY KEY,
emp_title_id VARCHAR(10),
birth_date DATE,
first_name VARCHAR(30),
last_name VARCHAR(30),
sex VARCHAR (5),
hire_date DATE
);

CREATE TABLE dept_manager (
dept_no VARCHAR(10),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR(10),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
emp_no INTEGER NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INTEGER NOT NULL
);

CREATE TABLE titles(
title_id VARCHAR(10) PRIMARY KEY NOT NULL,
title VARCHAR (30)
);

--- Importing csv files into created tables --- 
COPY departments
FROM 'C:\Users\jayde\sql-challenge\departments.csv'
DELIMITER ','
CSV HEADER;

COPY employees
FROM 'C:\Users\jayde\sql-challenge\employees.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager
FROM 'C:\Users\jayde\sql-challenge\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp
FROM 'C:\Users\jayde\sql-challenge\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY salaries
FROM 'C:\Users\jayde\sql-challenge\salaries.csv'
DELIMITER ','
CSV HEADER;

COPY titles
FROM 'C:\Users\jayde\sql-challenge\titles.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM titles;