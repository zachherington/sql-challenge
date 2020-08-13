-- Data Engineering: Create Tables

----------------------------------
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no
;
----------------------------------
-- 2. List first name, last name, and hire date for employees who were hired in 1986

SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01'
;
----------------------------------
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager

INNER JOIN departments ON		-- Brings in the dept_name using dept_no from the dept_manager table
	dept_manager.dept_no = departments.dept_no
	INNER JOIN employees ON		-- Brings in the employee data using the emp_no
		dept_manager.emp_no = employees.emp_no
;
----------------------------------
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees

INNER JOIN dept_emp ON		-- Brings in the dept_no using the emp_no from dept_emb
	employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON		-- Brings in the dept_name using the dept_no
		dept_emp.dept_no = departments.dept_no
;
----------------------------------
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%'
;
----------------------------------
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees

INNER JOIN dept_emp ON		-- Brings in the dept_no using the emp_no from dept_emb
	employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON		-- Brings in the dept_name using the dept_no
		dept_emp.dept_no = departments.dept_no

WHERE dept_name = 'Sales'
;
----------------------------------
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees

INNER JOIN dept_emp ON		-- Brings in the dept_no using the emp_no from dept_emb
	employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON		-- Brings in the dept_name using the dept_no
		dept_emp.dept_no = departments.dept_no

WHERE dept_name = 'Sales'
OR dept_name = 'Development'
;
----------------------------------
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


