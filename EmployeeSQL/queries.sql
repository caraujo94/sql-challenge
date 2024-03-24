-- 1) List the employee number, last name, first name, sex, and salary of each employee.

SELECT
	 a.EMP_NO
	,a.LAST_NAME
	,a.FIRST_NAME
	,a.SEX
	,b.SALARY
FROM employees a
left join salaries b
on a.emp_no = b.emp_no;

-- 2)List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	 a.LAST_NAME
	,a.FIRST_NAME
	,a.HIRE_DATE
FROM employees a
WHERE date_part('year',a.HIRE_DATE) = 1986;

-- 3)List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	 b.DEPT_NO
	,c.DEPT_NAME
	,b.EMP_NO
	,a.LAST_NAME
	,a.FIRST_NAME
FROM employees a
INNER JOIN dept_mgr b
ON a.emp_no = b.emp_no
INNER JOIN departments c
on b.dept_no = c.dept_no;

-- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	 a.dept_no
	,b.emp_no
	,b.last_name
	,b.first_name
	,c.dept_name
FROM dept_emp a
inner join employees b
ON a.emp_no = b.emp_no
inner join departments c
on a.dept_no = c.dept_no;

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	 a.first_name
	,a.last_name
	,a.sex
FROM employees a
where a.first_name = 'Hercules' and a.last_name like 'B%';

-- 6) List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	 a.emp_no
	,a.first_name
	,a.last_name
FROM employees a
inner join dept_emp b
on a.emp_no = b.emp_no
inner join departments c
on b.dept_no = c.dept_no
where c.dept_name = 'Sales';

-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
	 a.emp_no
	,a.first_name
	,a.last_name
	,c.dept_name
FROM employees a
inner join dept_emp b
on a.emp_no = b.emp_no
inner join departments c
on b.dept_no = c.dept_no
where c.dept_name in ('Sales','Development');

-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	 count(a.emp_no) as frequency
	,a.last_name
FROM employees a
group by a.last_name
order by count(a.emp_no) desc;