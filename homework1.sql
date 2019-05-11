
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
	emp_no serial primary key not null,
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
	emp_no serial primary key not null,
	dept_no character(10) foreign key not null,
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
	dept_no character(10) primary key not null,
	dept_name VARCHAR(255) not null
);




