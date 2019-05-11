--Data Modeling: ERD Schemata
--employees
-
emp_no INT PK
birth_date DATE
first_name  VARCHAR
last_name VARCHAR
gender VARCHAR
hire_date DATE

departments
-
dept_no VARCHAR pk
dept_name VARCHAR

dept_manager
-
dept_no VARCHAR PK FK - departments.dept_no
emp_no INT FK - employees.emp_no
from_date DATE
to_date DATE

dept_emp
-
emp_no INT PK FK - employees.emp_no
dept_no VARCHAR PK FK - departments.dept_no
from_date DATE
to_date DATE

titles
-
emp_no INT PK FK - employees.emp_no
title VARCHAR
from_date DATE PK
to_date DATE

salaries
-
emp_no INT PK FK - employees.emp_no
salary INT
from_date DATE
to_date DATE



 -- Data Engineering and Table Creations

Drop table employees;
create table employees(
	emp_no serial primary key not null,
	birth_date timestamp without time zone not null,
	first_name VARCHAR(255) not null, 	
	last_name VARCHAR(255) not null,
	gender VARCHAR(10) not null,
	hire_date timestamp without time zone not null
);

Drop table title;
create table title(
	emp_no int not null,
	title VARCHAR(255) not null,
	from_date timestamp without time zone not null, 	
	to_date timestamp without time zone not null
);

Drop table salaries;
create table salaries(
	emp_no serial primary key not null,	
	salary int not null,
	from_date timestamp without time zone not null,	
	to_date timestamp without time zone not null
);

Drop table dept_manager;
create table dept_manager(
	dept_no character(10) not null,
	emp_no serial primary key not null,
	from_date timestamp without time zone not null,	
	to_date timestamp without time zone not null
);

drop table dept_emp;
create table dept_emp(
	emp_no int not null,
	dept_no character(10) not null,
	from_date timestamp without time zone not null,	
	to_date timestamp without time zone not null
);

drop table departments;
create table departments(
	
	dept_no character(10) not null,
	dept_name VARCHAR(255) not null
);


--   DATA ANALYSIS

--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
on e.emp_no = s.emp_no;

--List employees who were hired in 1986.
select * from employees
where EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name,  de.from_date, de.to_date
FROM employees e
JOIN dept_emp de
on e.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
JOIN dept_manager dm
on d.dept_no = dm.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
on e.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
on e.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales' and d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  COUNT(Distinct last_name) AS TotalCount
FROM employees
group by last_name
order by DESC;

-- Data Analysis


-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
on e.emp_no = s.emp_no;

-- List employees who were hired in 1986.
select * from employees
where EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name,  de.from_date, de.to_date
FROM employees e
JOIN dept_emp de
on e.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
JOIN dept_manager dm
on d.dept_no = dm.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, d.dept_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
on e.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
on e.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
on e.emp_no = de.emp_no
JOIN departments d
on de.dept_no = d.dept_no
where d.dept_name IN ('Sales', 'Development')
order by e.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  last_name, COUNT(last_name) AS "Frequency Count"
FROM employees
Group By last_name
order by COUNT(last_name) DESC;