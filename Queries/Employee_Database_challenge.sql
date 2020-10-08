-- Select employee information and title
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees e
LEFT JOIN titles t on e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.to_date DESC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Employee titles count
select count(title),title
into retiring_titles
from unique_titles
group by title
order by count desc;

-- Employees qualifying for mentorship eligibility
Select distinct on (e.emp_no) e.emp_no,
e.first_name, e.last_name, e.birth_date,
j.from_date,j.to_date,
t.title
into mentorship_eligibility
from
employees e
join dept_emp j on e.emp_no = j.emp_no
left join titles t on e.emp_no=t.emp_no
where e.birth_date between '1965-01-01' and '1965-12-31'
order by e.emp_no;

-- mentorship eligibility count
select count(title),title
into mentor_count
from mentorship_eligibility
group by title
order by count desc;


