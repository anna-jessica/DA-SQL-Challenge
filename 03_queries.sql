--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.employee_no, e.last_name, e.first_name, e.gender, s.salary
FROM employee As e
JOIN salaries AS s ON e.employee_no= s.employee_no;

--2. List employees who were hired in 1986.
SELECT first_name, last_name,hire_date
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.department_no, d.department_name, e.employee_no, 
e.last_name,  e.first_name, dm.from_date, dm.to_date
FROM departments AS d
JOIN department_manager AS dm ON d.department_no= dm.department_no
JOIN employee AS e ON e.employee_no= dm.employee_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.employee_no, e.last_name, e.first_name, d.department_name
FROM department_employee AS de
JOIN employee AS e ON e.employee_no= de.employee_no
JOIN departments AS d ON d.department_no= de.department_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employee
WHERE first_name= 'Hercules' AND  last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.employee_no, e.last_name, e.first_name, d.department_name
FROM department_employee AS de
JOIN employee AS e ON e.employee_no= de.employee_no
JOIN departments AS d ON d.department_no= de.department_no
WHERE d.department_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.employee_no, e.last_name, e.first_name, d.department_name
FROM department_employee AS de
JOIN employee AS e ON e.employee_no= de.employee_no
JOIN departments AS d ON d.department_no= de.department_no
WHERE d.department_name IN ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequency_count
FROM employee
GROUP BY last_name 
ORDER BY frequency_count DESC;

--9. Average salary by department
SELECT d.department_name, ROUND(AVG(s.salary),2) AS avg_salary
FROM departments AS d
JOIN department_employee AS de
ON d.department_no= de.department_no
JOIN salaries AS s
ON de.employee_no=s.employee_no
GROUP BY d.department_name
ORDER BY avg_salary DESC;

--10. Top 10 highest paid employees (current salary).
SELECT employee_no, first_name, last_name, salary, 
  RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM(
  SELECT e.employee_no, e.first_name, e.last_name, s.salary
  FROM employee AS e
  JOIN salaries AS s
  ON e.employee_no=s.employee_no
  ORDER BY s.salary DESC
  LIMIT 10) AS top10;
