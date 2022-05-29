# Module 7 - Silver-Tsunami Challenge

## Overview:
The purpose of this data analysis is to determine the total number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.

We use 3 SQL queries in our database in order to filter out the employees from all departments that will retire from their current job title, and then 1 SQL query to determine which employees are eligible for a mentorship program that can train new hires to replace the retiring workforce. 

---
## Results

![Retirement_titles_amount](https://github.com/namin1993/Pewlett-Hackard-Analysis/blob/250bba3b5f0e8854c49c0f2ab01d54bc2fad3a1d/Pewlett-Hackard-Analysis/Images/Retirement_titles_amount.png)

- According to the retiring_titles.csv file, a total of 72,458 employees with their current job titles are expected to retire soon!

- Out of the 133,776 total employees from the retirement_titles.csv, 72,458 employee id's are unique. This means there were 61,318 job title changes.

- The total number of employees listed in the retiring_titles.csv file matches with the total number of employees listed in the unique_titles.csv file. That should be the case since the SQL query for the retiring_titles table groups information directly from the unique_titles table.

- Out of the total number 25,916 current Senior Engineers are expected to retire. That will be the biggest department that will require the most number of new hires. Senior Staff comes a close second at 24,926 employees expected to retire. Only 2 Managers are expected to retire. 

- There are 1,549 employees eligible for the mentorship program

---
## Summary

Q: How many roles will need to be filled as the "silver tsunami" begins to make an impact?

A: Approximately 72,000 employees (or 72,458 employees exactly) will have to be replaced as soon as everyone eligible for retirement leaves the workforce. This figure demonstrates that approximately 72,000 employees are required in order for each department to function.

Q: Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

A: If we divide the number of people with certain job titles that have to be replaced with the number of people with that exact job title who are eligible for the mentorship program, we get some bad news.

By using the SQL query below, we can group the number of employees that can mentor with each title.

SQL Query on number of employees available for each department's mentorship program: 

`
SELECT COUNT(me.title), me.title
INTO mentoring_titles
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;
`

If 407 employees as Senior Staff are eligible for the mentorship program and 24,926 employees as Senior Staff will retire, that means that on average, each Senior Staff member who will retire must mentor about 61 people in order replace the number of Senior Staff members who will retire. 

For Senior Engineers, there 291 Sneior Engineers that can mentor people and 25,916 Senior engineers to be replaced. This means that there is about a 1:90 mentor/new enigineer hire ratio, if we are just excluding the total number of Engineers about to retire too.

Since we must take into account that not all retiring employees will want to participate in the mentorship program, we must further understand how to create incentive for the mentorship program and estimate the rate of workforce role replacement we want to realistically achieve before 72,000 people retire.

The 2 SQL Queries listed below can further help us understand which departments will be affected be retirement exodus. First, create a new table which merges all current retiring employees in 'unique_titles' with 'department_employees' and 'departments' in order to associate each retiring employee to their department. Then, create a table which displays the number of retiring employees per department.

` SELECT ut.emp_no,
ut.first_name,
ut.last_name,
ut.title,
de.dept_no,
dept.dept_name
INTO retirement_departments
FROM unique_titles as ut
INNER JOIN department_employees as de
ON (ut.emp_no = de.emp_no)
INNER JOIN departments as dept
ON (dept.dept_no = de.dept_no);

SELECT COUNT(re.dept_no), re.dept_name
INTO retirement_department_groups
FROM retirement_departments as re
GROUP BY re.dept_name
ORDER BY COUNT(re.dept_no) DESC; `

![Mentoring_amount](https://github.com/namin1993/Pewlett-Hackard-Analysis/blob/250bba3b5f0e8854c49c0f2ab01d54bc2fad3a1d/Pewlett-Hackard-Analysis/Images/Mentoring_amount.png)
