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