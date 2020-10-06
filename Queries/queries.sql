SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM managers;

select * from dept_emp;

select * from salaries;

select * from titles;

-- Determine Retirement Eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Alternatively
SELECT count(*)
FROM employees
WHERE to_char(birth_date,'yyyy') in ('1952','1953','1954','1955');

-- Alternatively
SELECT count(*)
FROM employees
where EXTRACT(YEAR FROM birth_date) in ('1952','1953','1954','1955');

-- Get employees born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');




