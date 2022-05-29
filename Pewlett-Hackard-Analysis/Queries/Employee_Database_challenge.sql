/* 	Nehla Amin
	Module 7 Challenge
	May 29, 2022
*/

-- Deliverable 1
-- Number of Retiring Employees by Title
SELECT emp.emp_no,
emp.first_name,
emp.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles
ON (emp.emp_no = titles.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

-- Number of Employees in certain job titles who will retire
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2
SELECT DISTINCT ON (emp.emp_no) emp.emp_no,
emp.first_name,
emp.last_name,
emp.birth_date,
de.from_date,
de.to_date,
titles.title
INTO mentorship_eligibility
FROM employees as emp
INNER JOIN department_employees as de
ON (emp.emp_no = de.emp_no)
INNER JOIN titles
ON (de.emp_no = titles.emp_no)
WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND 
	(de.to_date = ('9999-01-01'))
ORDER BY emp.emp_no;